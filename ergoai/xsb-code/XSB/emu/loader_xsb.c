/* File:      loader_xsb.c
** Author(s): David S. Warren, Jiyang Xu, Teri Swift, Kostis Sagonas
** Contact:   xsb-contact@cs.sunysb.edu
** 
** Copyright (C) The Research Foundation of SUNY, 1986, 1993-1998
** Copyright (C) ECRC, Germany, 1990
** 
** XSB is free software; you can redistribute it and/or modify it under the
** terms of the GNU Library General Public License as published by the Free
** Software Foundation; either version 2 of the License, or (at your option)
** any later version.
** 
** XSB is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
** FOR A PARTICULAR PURPOSE.  See the GNU Library General Public License for
** more details.
**
** You should have received a copy of the GNU Library General Public License
** along with XSB; if not, write to the Free Software Foundation,
** Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
**
** $Id: loader_xsb.c,v 1.96 2013-05-06 21:10:24 dwarren Exp $
** 
*/


/************************************************************************/
/*
	This file contains routines for loading a byte code
	file into the emulator's permanent work space (pspace).
*/
/************************************************************************/

#include "xsb_config.h"
#include "xsb_debug.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

#ifdef WIN_NT
#include <windows.h>
#include <direct.h>
#include <ctype.h>
#else
#include <unistd.h>
#endif

#include "auxlry.h"
#include "context.h"
#include "psc_xsb.h"
#include "psc_defs.h"
#include "loader_xsb.h"
#include "extensions_xsb.h"
#include "cell_xsb.h"
#include "heap_xsb.h"
#include "flags_xsb.h"
#include "tries.h"
#include "tab_structs.h"
#include "error_xsb.h"
#include "io_builtins_xsb.h"
#include "inst_xsb.h"
#include "memory_xsb.h"
#include "register.h"
#include "varstring_xsb.h"
#include "thread_xsb.h"
#include "choice.h"

#ifdef FOREIGN
#include "dynload.h"
#endif

#include "debug_xsb.h"
#include "cinterf.h"
#include "deref.h"
#include "ptoc_tag_xsb_i.h"

#include "wind2unix.h"
 
/* === stuff used from elsewhere ======================================	*/

extern TIFptr *get_tip_or_tdisp(Psc);

extern int xsb_profiling_enabled;
extern void add_prog_seg(Psc, byte *, size_t);
extern void remove_prog_seg(byte *);
extern void delete_predicate_table(CTXTdeclc TIFptr);
extern char *expand_filename(char *filename);

/* === macros =========================================================	*/

#define st_ptrpsc(i_addr)  (cell(i_addr) = *reloc_table[cell(i_addr)])

#define st_pscname(i_addr) (cell(i_addr) = \
	(Cell) get_name((Psc)(*reloc_table[cell(i_addr)])))

#define gentry(opcode, arg1, arg2, ep) do {	\
        (cell_opcode(ep)) = (opcode);      	\
        (cell_operand1(ep)) = 0;              	\
        (cell_operand2(ep)) = 0;              	\
        (cell_operand3(ep)) = (arg1);         	\
	(ep)++;				 	\
        cell(ep) = (Cell) (arg2);        	\
        (ep)++; } while (0)

#define gentabletry(opcode, arg1, arg2, arg3, ep)  do { \
        gentry(opcode, arg1, arg2, ep);  		\
        cell(ep) = (Cell) (arg3);          		\
        (ep)++; } while (0)

#define reloc_addr(offset, base) ((CPtr)((offset)<0 ? \
       		(pb)&fail_inst : ((pb)(base))+(Integer)(offset)*ZOOM_FACTOR))


/* In the following, y is the number of bytes we want to read from fd   */
#define get_obj_data(x,y)	(fread((char *)(x), 1, (y), fd))

#define get_obj_byte(x)		(get_obj_data((x),1))
#define get_obj_word(x)		(get_obj_data((x),OBJ_WORD_SIZE))
#define get_obj_string(x,len)	(get_obj_data((x),(len)))

#define get_obj_word_bb(x)				   \
  do {Integer dummy; dummy = get_obj_word(x) ; fix_bb(x) ; \
    SQUASH_LINUX_COMPILER_WARN(dummy) ; } while (0)
#define get_obj_word_bbsig(x)				\
  do {tempInt Integer;					\
    dummy = get_obj_word(x) ; fix_bb4(x) ;		\
    tempInt = makeint(*(int *)(x));			\
    memcpy(x,&tempInt,sizeof(tempInt));			\
  } while (0)
//    *(Cell *)(x) = makeint(*(int *)(x));} while (0)
#define get_obj_word_bbsig_notag(x) \
  do {Integer tempInt;							\
    Integer dummy; dummy = get_obj_word(x) ; fix_bb4(x) ;		\
    tempInt = *(int *)(x);						\
    memcpy(x,&tempInt,sizeof(tempInt));					\
    SQUASH_LINUX_COMPILER_WARN(dummy) ; } while (0)
//    *(Integer *)(x) = *(int *)(x);                   

/* === local declarations =============================================	*/
/* TLS: I think that l is the length of the indextab bucket chain when
   the hrec is part of the indextab array.  Otherwise, it is the
   pointer to the ep of the clause.  The link is the pointer to the
   next hrec in the bucket chain.  If last, link points to itself */

struct hrec {
  Integer l;       
  CPtr link;
} ;

/*----------------------------------------------------------------------*/

/* Number of entries in one "segment" of the index relocation table.
   The table isn't actually segmented, but it is allocated in
   chunks of this size. */
#define NUM_INDEX_BLKS 256

/* === variables also used in other parts of the system =============== */

DllExport Psc global_mod;	/* points to "global", whose ep is globallist */

// First and last tifs / dispatch blocks.
struct tif_list  tif_list = {NULL, NULL};
struct TDispBlkHdr_t tdispblkhdr = {NULL, NULL};

/* === working variables ==============================================	*/

static pw   *reloc_table = NULL;
static size_t reloc_table_size = 0;
static pseg last_text = NULL;	/* permanent var, chain of text seg */
static pseg current_seg;	/* starting address -- used for relocation */
static CPtr *index_reloc;         	/* index relocation table */
static int  num_index_reloc;     	/* number of chunks in index_reloc */
static struct hrec *indextab;
static TIFptr tab_info_ptr;
static CPtr hptr;
static pindex *index_block_chain;	/* index block chain */

/* === return an appropriate hash table size ==========================	*/

inline static int hsize(int numentry)
{
  int i, j, temp;

  if (numentry > 16) temp = numentry; 
  else temp = 2 * numentry + 1;
  j = temp / 2 + 1;
  for (i = 2; i <= j; i++) {
    if ((i != temp) && ((temp % i) == 0)) {temp++; j = temp/2+1;}
  }
  return temp;
}

/* == unload a segment ================================================	*/

void unload_seg(pseg s)
{
  pindex i1, i2 ;
  pseg prev, next ;

  /* free the index blocks */
  i1 = seg_index(s) ;
  while (i1) {
    i2 = i_next(i1) ;
    mem_dealloc((pb)i1, i_size(i1),COMPILED_SPACE);
    i1 = i2;
  }
  /* delete segment from segment dllist and dealloc it */
  next = seg_next(s) ;
  prev = seg_prev(s) ;
  if (next) seg_prev(next) = prev ;
  if (prev) seg_next(prev) = next ;
  if (last_text==s) last_text = prev ;
  mem_dealloc((pb)seg_hdr(s), seg_size(s),COMPILED_SPACE);
}

/*----------------------------------------------------------------------*/

/* use heap top as temp place of hash link and entries; */
/* heap top pointer is not alterred so nothing affects later heap use */

inline static void inserth(CPtr label, struct hrec *bucket) 
{ 
  CPtr temp;

  bucket->l++;
  temp = (CPtr)&(bucket->link);
  if (bucket->l > 1) {
    temp = (CPtr)*temp;
    while ((CPtr)*temp != temp) 
      /*temp = (CPtr)*(++temp); */
      temp = (CPtr)*(temp+1);
  }
  *temp = (Cell)hptr;
  cell(hptr) = (Cell) label; hptr++;
  cell(hptr) = (Cell) hptr; hptr++;
}

/*----------------------------------------------------------------------*/


UInteger float_val_to_hash(Float Flt) {
  //  Float Fltval = Flt;
#ifndef FAST_FLOATS
  UInteger UIFlt;
  memcpy(&UIFlt,&Flt,sizeof(UIFlt));
  return ((ID_BOXED_FLOAT << BOX_ID_OFFSET ) | (FLOAT_HIGH_16_BITS(UIFlt))) ^
    FLOAT_MIDDLE_24_BITS(UIFlt) ^ FLOAT_LOW_24_BITS(UIFlt);
#else
  return 0;  /* never called */
#endif
}

/* this generates the index table, an array of pointers to hrecs (sort
   of, the typing is a little unclear).  Each bucket is a list of
   hrecs. */

static Integer get_index_tab(CTXTdeclc FILE *fd, int clause_no)
{
  UInteger hashval, size, j;
  Integer count = 0;
  byte  type ;
  CPtr label;
  Integer ival;
  Cell val;
  Integer dummy; /* used to squash warnings */

  size = hsize(clause_no);

  indextab = (struct hrec *)mem_alloc(size*sizeof(struct hrec),COMPILED_SPACE); 

  for (j = 0; j < size; j++) {
    indextab[j].l = 0;
    indextab[j].link = (CPtr)&(indextab[j].link);
  }
  for (j = 0; j < (unsigned)clause_no; j++) {
    dummy = get_obj_byte(&type);
    switch (type) {
    case 'i': get_obj_word_bbsig_notag(&ival);
      hashval = ihash((Cell) ival, size); 
      count += 9;
      break;
    case 'f': 
      get_obj_word_bbsig_notag(&ival);
      //      printf("sfloat: %f, %x\n",(*(float *)(&ival)), (*(Integer *)(&ival)) );
#ifndef FAST_FLOATS
      val = float_val_to_hash(*(float *)(&ival));
#else
      val = ival;
#endif
      hashval = ihash((Cell) val, size); 
      count += 9;
      break;
    case 'd': {
      double fval;
      dummy = get_obj_string(&fval,8);
#ifndef FAST_FLOATS
      val = float_val_to_hash(fval);
#else
      {
	union {
	  long intp;
	  float fltp;
	} cvtr;
	cvtr.fltp = (float)fval;
	val = cvtr.intp;
      }
#endif
      //      printf("bld float index: %2.14f, %0x, size=%d\n",fval,val,size);
      hashval = ihash((Cell) val, size); 
      count += 9;
      break;
    }
    case 'l': 
      hashval = ihash((Cell)(list_pscPair), size); 
      count += 5;
      break;
    case 'n': 
      hashval = ihash((Cell) 0, size);
      count += 5;
      break;
    case 'c': get_obj_word_bb(&ival);
      count += 9;
      val = (Cell)ival ;
      st_pscname(&val);
      hashval = ihash(val, size) ;
      break;
    case 's': get_obj_word_bb(&ival);
      count += 9;
      val = (Cell)ival ;
      st_ptrpsc(&val);
      hashval = ihash(val, size) ;
      break; 
    default:
      hashval = 0;
      xsb_exit( "illegal format");
    }

    get_obj_word_bbsig_notag(&label);
    label = reloc_addr((Integer)label, seg_text(current_seg));
    inserth(label, &indextab[hashval]);
  }

  SQUASH_LINUX_COMPILER_WARN(dummy) ; 
  return count;
}

/*----------------------------------------------------------------------*/

inline static pindex new_index_seg(Integer no_cells, Pair ptr)
{
  pindex new_i = (pindex)mem_alloc(SIZE_IDX_HDR + sizeof(Cell) * no_cells,COMPILED_SPACE ) ;

  //  printf("Allocated index seg: %p-%p(%x)\n",new_i,(pb)new_i+SIZE_IDX_HDR + sizeof(Cell) * no_cells,
  //	 SIZE_IDX_HDR + sizeof(Cell) * no_cells);

  /* initialize fields of new index segment header */
  i_next(new_i) = 0 ;
  i_size(new_i) = SIZE_IDX_HDR + sizeof(Cell) * no_cells ;
  
  /* append at tail of block chain */
  *index_block_chain = new_i ;
  index_block_chain = &i_next(new_i) ;

  if (xsb_profiling_enabled) {
    add_prog_seg(ptr->psc_ptr, (pb)new_i, SIZE_IDX_HDR + sizeof(Cell) * no_cells);
  }

  return new_i ;
}

/*----------------------------------------------------------------------*/

/* Once the indextab is set up (via get_index_tab()) traverse it to
   set up the try/retry/trust instructions using the l pointers */

static void gen_index(xsbBool tabled, int clause_no, CPtr sob_arg_p, byte arity, Pair ptr)
{
  pindex new_i;
  CPtr   ep1, ep2, temp;
  int    j, size; 
 
  size = hsize(clause_no);
  new_i = new_index_seg(size,ptr);

  ep1 = i_block(new_i) ;
  cell(sob_arg_p) = (Cell)ep1 ;
  for (j = 0; j < size; j++) {
    if (indextab[j].l == 0) 
      cell(ep1) = (Cell) &fail_inst;
    else if (indextab[j].l == 1) {
      if (!tabled) {
	cell(ep1) = *(indextab[j].link);
      } else {  /* create tabletrysingle */
	cell(ep1) = cell(indextab[j].link);
	new_i = new_index_seg(3,ptr);
	ep2 = i_block(new_i);
	cell(ep1) = (Cell) ep2;
	temp = indextab[j].link;
	gentabletry(tabletrysingle, arity, *temp++, tab_info_ptr, ep2);
      }
    } else {
      /* otherwise create try/retry/trust instruction */
      new_i = (pindex)new_index_seg(2*indextab[j].l+tabled,ptr);
      ep2 = i_block(new_i) ;
      cell(ep1) = (Cell) ep2 ;
      temp = (indextab[j].link) ;
      if (!tabled) {	/* generate "try" */
	gentry(try, arity, *temp, ep2);
      } else {
	gentabletry(tabletry, arity, *temp, tab_info_ptr, ep2);
      }

      for (temp++; *temp != (Cell)temp; temp++) {
	temp = (CPtr) cell(temp);		/* generate "retry" */
	gentry((tabled?tableretry:retry), arity, *temp, ep2);
      }
      /* change last "retry" to "trust" */
      cell_opcode(ep2-2) = tabled ? tabletrust : trust;
    }
    ep1++;
  }
}

/************************************************************************
*                                                                       *
*  load_text() loads the byte code intruction from a byte code file to	*
*  the byte code program space.  References to indexes to the pcs table	*
*  are resolved with the use of the macro st_index.  New index relies   *
*  on the symbol table array which is assigned values by load_sms.	*
*  The routine assumes the current length 8/18/84 of byte code		*
*  intructions when reading from the byte code file.			*
*  cf. inst_xsb.h for meaning of opcode types.
*                                                                       *
************************************************************************/

static int load_text(FILE *fd, int seg_num, size_t text_bytes, int *current_tab)
{
  CPtr inst_addr, end_addr;
  int  current_opcode, oprand;
  Cell tab_config_hold;	/* working pointer */
  Integer dummy; /* used to squash warnings */
  
  *current_tab = -1;
  inst_addr = seg_text(current_seg);
  end_addr  = (CPtr)((pb)inst_addr + text_bytes * ZOOM_FACTOR);
  while (inst_addr<end_addr && get_obj_word(inst_addr) ) {
    current_opcode = cell_opcode(inst_addr);
    inst_addr ++;
    for (oprand=1; oprand<=4; oprand++) {
      switch (inst_table[current_opcode][oprand]) {
      case A:
      case V:
      case R:
      case P:
      case PP:
      case PPP:
      case PPR:
      case PRR:
      case RRR:
      case H:  // interned str, not used by compiler, only in assert at runtime
	break;
      case S:                         // structure
	get_obj_word_bb(inst_addr);
	st_ptrpsc(inst_addr);
	inst_addr ++;
	break;
      case C:                         // constant
	get_obj_word_bb(inst_addr);
	st_pscname(inst_addr);
	inst_addr ++;
	break;
      case L:                         // label
	get_obj_word_bbsig_notag(inst_addr);
	*(CPtr *)inst_addr = reloc_addr((Integer)cell(inst_addr),
					seg_text(current_seg));
	inst_addr ++;
	break;
      case G:                        // TLS: dont think this is used???
	get_obj_word_bb(inst_addr);
	st_pscname(inst_addr);
	inst_addr ++;
	break;
      case N: case F:                      // number, float, leave bit pattern
	get_obj_word_bbsig_notag(inst_addr);
	inst_addr ++;
	break;
      case D:				// Double float (32-bit?)
	dummy = get_obj_string(inst_addr,8);
	inst_addr += 2;
	break;
      case RRRR:
	dummy = get_obj_word(inst_addr);
	inst_addr ++;
	break;
      case B:                       // boxed integer
	get_obj_word_bbsig_notag(inst_addr);
	inst_addr ++;
	break;
      case I:                      // index of sob
	get_obj_word_bb(inst_addr);
	if (oprand==2) {	/* second operand of switchonbound */
	  if (cell(inst_addr) >= (UInteger)(NUM_INDEX_BLKS*num_index_reloc)) {
	    int tmp_nir = num_index_reloc;
	    num_index_reloc = (int)(cell(inst_addr)/NUM_INDEX_BLKS)+1;
	    index_reloc = (CPtr *)mem_realloc(index_reloc,tmp_nir,
					      NUM_INDEX_BLKS*num_index_reloc*sizeof(CPtr),COMPILED_SPACE);
	    if (!index_reloc) {
	      xsb_error("Couldn't allocate index relocation space");
	      return FALSE;
	    }
	  }
	  index_reloc[cell(inst_addr)] = (CPtr)inst_addr;
	}
	else 		/* third operand of switchonbound */
	  cell(inst_addr) = hsize((int)cell(inst_addr));
	inst_addr ++;
	break;
      case X:                 // arg not used
	break;
      case T:	             // tip ptr
	*current_tab = 1;	/* flag for load index */
	dummy = get_obj_word(&tab_config_hold);          /* space holder */
	cell(inst_addr) = (Cell)NULL; /* TIFptr will be set later when know PSC */
	inst_addr ++;
	break;
      default:
	break;
      }  /* switch */
    } /* for */
  }

  SQUASH_LINUX_COMPILER_WARN(dummy) ; 
  if (inst_addr != end_addr) {
    xsb_dbgmsg((LOG_DEBUG, "inst_addr %p, end_addr %p", inst_addr, end_addr));
    return FALSE;
  }
  else return TRUE;
}  /* end of load_text */

/*----------------------------------------------------------------------*/

static void load_index(CTXTdeclc FILE *fd, size_t index_bytes, int table_num, Pair ptr)
{
  Integer index_bno, clause_no, t_len;
  byte    index_inst, arity;
  Integer temp_space; size_t count = 0;
  CPtr    sob_arg_p, temp_ptr;
  Integer dummy; /* used to squash warnings */

  while (count < index_bytes) {
    dummy = get_obj_byte(&index_inst);
    dummy = get_obj_byte(&arity);
    get_obj_word_bb(&index_bno);
    sob_arg_p = index_reloc[index_bno];
    get_obj_word_bb(&clause_no);
    
    temp_space = clause_no * 2;
#ifndef MULTI_THREAD
    if (top_of_localstk - hreg >= temp_space + 512)
      temp_ptr = hptr = hreg;
    else 
#endif
       temp_ptr = hptr = (CPtr)mem_alloc(temp_space*sizeof(CPtr),COMPILED_SPACE);
    t_len = get_index_tab(CTXTc fd, (int)clause_no);
    
    gen_index((xsbBool)(table_num > 0), (int)clause_no, sob_arg_p, arity, ptr);
    mem_dealloc(indextab,hsize((int)clause_no)*sizeof(struct hrec),COMPILED_SPACE);
#ifndef MULTI_THREAD
    if (temp_ptr != hreg) mem_dealloc(temp_ptr,temp_space*sizeof(CPtr),COMPILED_SPACE);
#else
    mem_dealloc(temp_ptr,temp_space*sizeof(CPtr),COMPILED_SPACE);
#endif
    count += 10 + t_len;
  }
  SQUASH_LINUX_COMPILER_WARN(dummy) ; 
}

/*== the load_seg function =============================================*/

static pseg load_seg(CTXTdeclc FILE *fd, int seg_num, size_t text_bytes, size_t index_bytes, Pair ptr)
{
   int current_tab;

   current_seg = (pseg) mem_alloc(ZOOM_FACTOR*text_bytes+SIZE_SEG_HDR,COMPILED_SPACE);

   /* Allocate first chunk of index_reloc */
   index_reloc = (CPtr *)mem_alloc(NUM_INDEX_BLKS*sizeof(CPtr),COMPILED_SPACE);

   if (!index_reloc) {
     xsb_error("Couldn't allocate index relocation space");
     return NULL;
   }
   num_index_reloc = 1;

   /* alloc space, include 16 bytes header */
   current_seg++;
   seg_next(current_seg)  = 0;
   seg_prev(current_seg)  = last_text;
   seg_index(current_seg) = 0;
   seg_size(current_seg)  = text_bytes*ZOOM_FACTOR + SIZE_SEG_HDR;
   /* fd = file; */
   if (!load_text(fd, seg_num, text_bytes, &current_tab)) {
     mem_dealloc((pb)seg_hdr(current_seg), text_bytes+SIZE_SEG_HDR,COMPILED_SPACE);
     return NULL;
   }
   index_block_chain = &seg_index(current_seg);
   load_index(CTXTc fd, index_bytes, current_tab, ptr);
   mem_dealloc(index_reloc,NUM_INDEX_BLKS*sizeof(CPtr),COMPILED_SPACE);
   
   /* set text-index segment chain */
   if (last_text) seg_next(last_text) = current_seg;
   last_text = current_seg;
   return current_seg;
}

/************************************************************************/
/*  Routines to check environment consistency.				*/
/************************************************************************/

#define T_NEW 3
#define E_HIDDEN -1
#define E_NOUSE -2

static int env_check[4][5] = {
/*		   T_EXPORT   T_LOCAL   T_IMPORTED   T_IMEX   T_GLOBAL	*/
/*======================================================================*/
/* T_VISIBLE  */ { T_VISIBLE, T_HIDDEN, T_VISIBLE,  E_NOUSE, T_VISIBLE  },
/* T_HIDDEN   */ { T_HIDDEN,  T_HIDDEN,	E_HIDDEN,   E_NOUSE, T_VISIBLE  },
/* T_UNLOADED */ { T_VISIBLE, E_HIDDEN, T_UNLOADED, E_NOUSE, T_UNLOADED },
/* T_NEW      */ { T_VISIBLE, T_HIDDEN, T_UNLOADED, E_NOUSE, T_VISIBLE  }
};

/* TLS: changed the "soft" xsb errors into warnings and refactored.
Not sure if its ever good to have a soft error as they are easy to
confuse with a hard error, but in this case the query actually
succeeds with an answer substitution. */
void env_type_set(CTXTdeclc Psc psc, byte t_env, byte t_type, xsbBool is_new) {
int env; byte type;

  if (is_new) {
    psc_set_env(psc, env_check[T_NEW][t_env]);
    psc_set_type(psc, t_type);
  } else {
    env = env_check[get_env(psc)][t_env];
    if (env < 0) {
      /* In the following I am not sure whether setting the environment */
      /* in the presense of an environment conflict error is the right  */
      /* thing to do!  But an "imported_from" vs "local" (non-exported) */
      /* symbol conflict must definitely be resolved in favour of the   */
      /* "local" declaration.						*/
      if (env == E_HIDDEN) {
	if (t_env == T_IMPORTED) {
	  /* Here the psc record of the symbol has already been created */
	  /* by another module that imported (mistakenly) this symbol.  */
	  xsb_warn(CTXTc "Environment conflict in the use of %s/%d !", 
		    get_name(psc), get_arity(psc));
	  psc_set_env(psc, T_LOCAL);	
	}
	else {/* We are trying to load a module
		that imports sth not exported. */
	  Psc mod_psc = get_data(psc);
	  if (mod_psc != NULL) 
	    xsb_warn(CTXTc "Environment conflict in the use of %s/%d: "
		      "%s/%d is imported from %s but not exported\n",
		     get_name(psc), get_arity(psc),get_name(psc),get_arity(psc),get_name(mod_psc));
	  else 	    xsb_warn(CTXTc "Environment conflict in the use of %s/%d: "
			     "%s/%d is imported but not exported\n",
			     get_name(psc), get_arity(psc),get_name(psc),get_arity(psc));
	}
      }
    }
    else psc_set_env(psc, env);
    type = get_type(psc);
    if (t_type && type && t_type != type) {
      if (t_type==T_UDEF && (type==T_PRED || type==T_DYNA || type==T_FORN)) ;
      else if (t_type==T_FORN && type==T_UDEF) psc_set_type(psc, T_FORN);
      else xsb_error("incompatible types in the use of %s/%d (%x with %x)",
		     get_name(psc), get_arity(psc), type, t_type);
    } else psc_set_type(psc, type | t_type);  
  }
}

/*----------------------------------------------------------------------*/

unsigned int read_magic(FILE *fd)
{
  unsigned int num;

  if (get_obj_word(&num) < 4) return 0;
  //  fix_bb4((byte *)&num);
  fix_bb4(&num);
  return num;
}

/*----------------------------------------------------------------------*/

inline static void get_obj_atom(FILE *fd, VarString *atom)
{
  byte x;
  //  unsigned int len;
  UInteger len; /* dswdswdsw */
  Integer dummy; /* used to squash warnings */
  
  dummy = get_obj_data((&x),1);
  /* ``x'' gets the length of the string or > SHORT_LDOPTIONLEN.
     The latter means we have a long atom.
     In this case, the length is stored in 4 bytes & we use get_obj_word_bb */
  if (x > SHORT_LDOPTIONLEN) { /* handle unusual case specially */
    get_obj_word_bb(&len);
    /* xsb_dbgmsg(("get_obj_len = %d... Case is not handled yet!\n",len)); */
  } else
    len = x;

  XSB_StrEnsureSize(atom,(int)(len+1));
  dummy = get_obj_string(atom->string, len);
  atom->length = (int)len;
  XSB_StrNullTerminate(atom);

  SQUASH_LINUX_COMPILER_WARN(dummy) ; 
}

/*----------------------------------------------------------------------*/

/* contents of string name is changed; it MUST be large enough to hold any expansion */
/* if whole thing is quoted string, unquote it.*/
void replace_form_by_act(char *name, prolog_term modformals, prolog_term modactuals) {
  char *formalstr, *actualstr, *loc;
  int i, arity;
  size_t namelen, formallen, actuallen;

  if (isinteger(modactuals) || isinteger(modformals)) return;
  if (isstring(modactuals) || isstring(modformals)) {
    size_t name_len = strlen(name);
    if (name[0] == '\'' && name[name_len-1] == '\'') {
      /* cheat for now, at some point remove one on internal double single quotes */
      memmove(name,name+1,name_len-2);
      name[name_len-2] = '\0';
    }
    return;
  }

  arity = get_arity(get_str_psc(modformals));

  for (i = 1; i <= arity; i++) {
    formalstr = string_val(get_str_arg(modformals,i));
    actualstr = string_val(get_str_arg(modactuals,i));
    actuallen = strlen(actualstr);
    
    if (strcmp(name,formalstr) == 0) {
      memmove(name,actualstr,actuallen);
      *(name+actuallen) = '\0';
    } else {
      loc = name;
      //printf("try to find: %s in %s\n",formalstr,name);
      while (loc != NULL) {
	loc = strstr(loc,formalstr);
	if (loc != NULL) {
	  //printf("found match of %s from %s\n",formalstr,name);
	  formallen = strlen(formalstr);
	  if ((*(loc-1) == '(' || *(loc-1) == ',') &&
	      (*(loc+formallen) == ')' || *(loc+formallen) == ',')) {
	    namelen = strlen(name);
	    actuallen = strlen(actualstr);
	    memmove(loc+actuallen,loc+formallen,
		    namelen-((loc-name)+formallen)+1);
	    memmove(loc,actualstr,actuallen);
	    //printf("after repl: %s\n",name);
	    loc = loc + actuallen; // no recursive rewriting...
	  } else loc++;
	}
      }
    }
  }
}

/* --------------------------------------------------------------------	*/

#if defined(WIN_NT) || defined(CYGWIN)
#if defined(CYGWIN)
extern int toupper(int);
#else
__declspec(dllimport) int toupper(int);
#endif
#define file_strcmp(fn1,fn2) strcasecmp(fn1,fn2)
#define isslash(c) ((c) == '/' || (c) == '\\')
int file_strncmp(char *fn1, char *fn2, size_t len) {
  size_t i;
  for (i = 0; i < len; i++) {
    if (!(isslash(fn1[i]) && isslash(fn2[i])) &&
	(toupper(fn1[i]) != toupper(fn2[i])))
	return 1;
  }
  return 0;
}
#else
#define file_strcmp(fn1,fn2) strcmp(fn1,fn2)
#define file_strncmp(fn1,fn2,len) strncmp(fn1,fn2,len)
#endif

/* Parse out disp and length of filename from a usermod import
   specification.
*/
void get_filename_disp_len(size_t len_wo_ext, size_t len, char *filename,
			   size_t *disp, size_t *mlen) {
  if (len_wo_ext == 0) {
    if (!file_strncmp(filename,"usermod('",sizeof("usermod('")-1)) {
      *disp = sizeof("usermod('")-1;
      *mlen = len - (sizeof("usermod('')")-1);
    } else if (!file_strncmp(filename,"usermod(",sizeof("usermod(")-1)) {
      *disp = sizeof("usermod(")-1;
      *mlen = len - (sizeof("usermod()")-1);
    } else if (!file_strncmp(filename,FILEQUALPAR "usermod,",sizeof("usermod("))) {
      *disp = sizeof(FILEQUALPAR "usermod,");
      *mlen = len - (sizeof(FILEQUALPAR "usermod,")-1);
    } else {
      *disp = 0;
      *mlen = len;
    }
    if (filename[*disp] == '\'') {
      (*disp)++;
      *mlen -= 2;
    }
  } else {
    *disp = -1;
    *mlen = 0;
  }
}

size_t get_len_wo_ext(char *filename, size_t len) {
  size_t len_wo_ext = len - XSB_OBJ_EXTENSION_LENGTH;
  while (len_wo_ext > 0 && filename[len_wo_ext] != '\\' && filename[len_wo_ext] != '/' &&
	 file_strncmp(filename+len_wo_ext,XSB_OBJ_EXTENSION_STRING,XSB_OBJ_EXTENSION_LENGTH) != 0)
    len_wo_ext--;
  if (filename[len_wo_ext] == '\\' || filename[len_wo_ext] == '/') len_wo_ext = 0;
  return len_wo_ext;
}

/* compare forms: either may be full_path.xwam or usermod(modname) or modname.
   If first is full modname, then the second must also be.
   If both full then if different ret true else ret false.
   Otherwise, find both base locations, and compare */

int nec_different_xwam_files(char *datafilename, char *currfilename) {
  size_t dlen, clen, dlen_wo_ext, clen_wo_ext;
  size_t ddisp, cdisp;
  size_t dmlen = 0, cmlen = 0;
  //  printf("nec_diff: %s, %s\n",datafilename, currfilename);
  if (file_strcmp(datafilename,currfilename) == 0) return FALSE;
  dlen = strlen(datafilename);
  dlen_wo_ext = get_len_wo_ext(datafilename,dlen);
  clen = strlen(currfilename);
  clen_wo_ext = get_len_wo_ext(currfilename,clen);
  if (dlen_wo_ext > 0 && clen_wo_ext > 0 &&
      (dlen_wo_ext != clen_wo_ext || file_strncmp(datafilename,currfilename,clen_wo_ext) != 0))
    return TRUE;    // both full names and different

  // at least one is a module or usermod().
  get_filename_disp_len(dlen_wo_ext,dlen,datafilename,&ddisp,&dmlen);
  get_filename_disp_len(clen_wo_ext,clen,currfilename,&cdisp,&cmlen);

  if (dmlen == 0) dmlen = cmlen; // one or other must be nonzero
  else if (dmlen != cmlen) return TRUE;
  if ((ddisp == -1) && dlen_wo_ext > 0
      && strncmp(datafilename+dlen_wo_ext-dmlen,currfilename+cdisp,dmlen) == 0)
    return FALSE;
  if ((cdisp == -1) && clen_wo_ext > 0
      && file_strncmp(datafilename+ddisp,currfilename+clen_wo_ext-cmlen,dmlen) == 0)
    return FALSE;
  if (dlen_wo_ext == 0 && clen_wo_ext == 0 &&
      file_strncmp(datafilename+ddisp,currfilename+cdisp,dmlen) == 0)
    return FALSE;
  return TRUE;
}

int is_xwam_filename(char *name) {
  return (!strcmp(name+strlen(name)-XSB_OBJ_EXTENSION_LENGTH,XSB_OBJ_EXTENSION_STRING));
}

  /*----------------------------------------------------------------------*/

static XSB_StrDefine(str);

static xsbBool load_one_sym(CTXTdeclc FILE *fd, char *filename, Psc cur_mod, int count, int exp,
			    prolog_term modformals, prolog_term modpars) // add act and form parlists
{
  int  is_new, def_is_new;
  int import_from_usermod_file = FALSE;
  byte t_arity, t_type, t_env, t_defined, t_definedas;
  Pair temp_pair, usermod_pair, defas_pair = NULL;
  Psc  mod;
  Integer dummy; /* used to squash warnings */
  char modname[MAXFILENAME+1];
  char filemodname[MAXFILENAME+1];
  char modfile[MAXFILENAME+1];

  dummy = get_obj_byte(&t_env);
  /* this simple check can avoid worse situations in case of compiler bugs */
  if (t_env&0x80)
    xsb_abort("[LOADER] The loaded object file %s%s is corrupted",
	      cur_mod->nameptr, XSB_OBJ_EXTENSION_STRING);

  dummy = get_obj_byte(&t_type);
  t_defined = t_type & T_DEFI; t_type = t_type & ~T_DEFI;    /* first check if symbol has clauses */
  t_definedas = t_type & T_DEFA; t_type = t_type & ~T_DEFA;  /* next check if its a defined-as */
  dummy = get_obj_byte(&t_arity);
  get_obj_atom(fd, &str);
  if (t_type == T_MODU) {
    replace_form_by_act(str.string,modformals,modpars);
    temp_pair = insert_module(0, str.string);
  } else {  
    if ((t_env&0x7) == T_IMPORTED || t_definedas) {
      byte t_modlen;

      dummy = get_obj_byte(&t_modlen);
      dummy = get_obj_string(filemodname, t_modlen);
      if (t_modlen > MAXFILENAME)
	xsb_exit("Module name too long in loader; corrupted!!");
      filemodname[t_modlen] = '\0';
      replace_form_by_act(filemodname,modformals,modpars);

      split_modspec(filemodname,NULL,modname,modfile);

      if (!strcmp(modname,"usermod") && strcmp(filemodname,"usermod")) {
	import_from_usermod_file = TRUE;
	mod = global_mod;
      } else {
	temp_pair = insert_module(0, modname);
	mod = temp_pair->psc_ptr;
	if (!is_xwam_filename(string_val(get_ep(mod)))) // set if not already loaded
	  psc_set_ep(mod,(byte *)makestring(string_find(modfile,1)));
      }
      if (t_definedas) {
	static XSB_StrDefine(defasname);
	get_obj_atom(fd, &defasname);

	defas_pair = insert(defasname.string, t_arity, mod, &def_is_new);
	if (def_is_new) {
	  psc_set_data(defas_pair->psc_ptr, mod);
	  psc_set_env(defas_pair->psc_ptr, T_UNLOADED);
	  psc_set_type(defas_pair->psc_ptr, T_ORDI);
	}
	mod = cur_mod;  /* mod of this symbol is cur_mod */
      }
    } else if ((t_env&0x7) == T_GLOBAL)
      mod = global_mod;
    else mod = cur_mod;

    temp_pair = insert(str.string, t_arity, mod, &is_new);

    if (t_definedas) {
      set_psc_ep_to_psc(CTXTc temp_pair->psc_ptr,defas_pair->psc_ptr);
      t_type = T_PRED;
    }

    /* make sure all data fields of predicates PSCs point to 
       their corresponding module */
    if (is_new ||
	(get_type(temp_pair->psc_ptr) == T_ORDI &&
	 (t_type == T_DYNA || t_type == T_PRED || t_type == T_UDEF) &&
	 get_data(temp_pair->psc_ptr) == NULL)) {
      psc_set_data(temp_pair->psc_ptr, mod);
    }
    env_type_set(CTXTc temp_pair->psc_ptr, (byte)(t_env&(T_ENV|T_GLOBAL)), t_type, (xsbBool)is_new);

    if (is_new || !get_shared(temp_pair->psc_ptr)) {
      if (!(get_ep(temp_pair->psc_ptr)) && (*(pb)get_ep(temp_pair->psc_ptr) == switchonthread))
	xsb_warn(CTXTc "Shared declaration ignored for %s/%d\n",
		get_name(temp_pair->psc_ptr),get_arity(temp_pair->psc_ptr));
      else {   /* 1 (for emacs scoping) */
	if (flags[PRIVSHAR_DEFAULT] == DEFAULT_PRIVATE) {
	  if (t_env&T_SHARED_DET) 
	    psc_set_shared(temp_pair->psc_ptr, (t_env&T_SHARED));
	}
	else { /* 2 (for emacs scoping) */
	  /* Default shared: if the compiled code has a thead_xxx
	     declaration (as found in t_env) set the shared bit to
	     whatever they should be; otherwise set it shared by
	     default only if the psc record does not exist w. its det
	     flag set.  This last condition would not be necessary if
	     the || get_shared were not part of the condition above --
	     so perhaps this code should be refactored. */
	  if (t_env&T_SHARED_DET) {
	    psc_set_shared(temp_pair->psc_ptr, (t_env&(T_SHARED|T_SHARED_DET)));
	  }
	  else if (!(((temp_pair->psc_ptr)->env)&T_SHARED_DET)) {
	    psc_set_shared(temp_pair->psc_ptr, (T_SHARED));
	  }
	}
      } 
    } /* is_new || !get_shared(temp_pair->psc_ptr) */

    if (t_env&T_TABLED_SUB_LOADFILE) 
      psc_set_tabled(temp_pair->psc_ptr,((t_env&T_TABLED_VAR) | T_TABLED_SUB));
    else if (is_new || t_defined)
      psc_set_tabled(temp_pair->psc_ptr,(t_env&T_TABLED_VAR));
    //    printf("sym loaded: %s/%d, tabled=%x, t_env=%x, t_type=%x, t_defined=%x\n",get_name(temp_pair->psc_ptr),get_arity(temp_pair->psc_ptr),get_tabled(temp_pair->psc_ptr),t_env,t_type,t_defined);
    /* dsw added following, probably a bad idea, but too late now to change */
    if (exp && (t_env&0x7) == T_EXPORTED) {
      /* xsb_dbgmsg(("exporting: %s from: %s",name,cur_mod->nameptr)); */
      if (is_new) 
	psc_set_data(temp_pair->psc_ptr, mod);
      if ((usermod_pair = search_in_usermod(get_arity(temp_pair->psc_ptr),get_name(temp_pair->psc_ptr)))) {
	/* if existing usermod rec without ep, set its ep to that of new one */
	if (get_ep(usermod_pair->psc_ptr) == (byte *)&((usermod_pair->psc_ptr)->load_inst)) {
	  set_psc_ep_to_psc(CTXTc usermod_pair->psc_ptr,temp_pair->psc_ptr);
	}
      }
      link_sym(CTXTc temp_pair->psc_ptr, (Psc)flags[CURRENT_MODULE]);
    }
  } 

  if (!temp_pair) return FALSE;
  
  if (import_from_usermod_file) {
    Psc tpsc = pair_psc(temp_pair);
    if (get_data(tpsc) != global_mod && isstring(get_data(tpsc)) &&
	nec_different_xwam_files(string_val(get_data(tpsc)),filemodname)) { // dsw diff order?
      xsb_warn(CTXTc "Ignoring import of usermod:%s/%d from %s in %s; already imported from %s\n",
	       get_name(tpsc),get_arity(tpsc),filemodname,filename,string_val(get_data(tpsc)));
    } else if (!isstring(get_data(tpsc)) && get_data(tpsc) != NULL && get_data(tpsc) != global_mod) {
      xsb_error("Importing symbol %s/%d from usermod, but was defined in module %s\n",
		get_name(tpsc),get_arity(tpsc),get_name(get_data(tpsc)) );
    } else {
      // use filemodname, since filename must be passed in module name for usermod
      psc_set_data(tpsc, (struct psc_rec *)makestring(string_find(filemodname,1)));
      psc_set_env(tpsc,T_UNLOADED);
      if (get_type(tpsc) == 0)
	psc_set_type(tpsc,T_UDEF);
    }
  }

  reloc_table[count] = (pw)temp_pair;
  SQUASH_LINUX_COMPILER_WARN(dummy) ; 
  return TRUE;
}  /* load_one_sym */

/************************************************************************
*                                                                       *
 Load_syms loads a symbol table from a byte code file into an
 appropriate format in the psc table (i.e. e.g. a chain, or a hash
 table of chains if the module is global).  Among other functions, it
 
 -- resolves entry points for byte code intructions (call to
 relloc_addr), and maintains a tableau so that instructions with
 indices into the psc table may have those indices resolved before
 loading them in the intruction array (byte code program space).  The
 intructions are loaded by a separate function.  

 -- initizlizes psc records (via insert and sub-functions) so that the
 default entry points of new, imported predicates is the undefined
 predicate handler.  This e.p. will be over-written whenever the
 module for the predicate is loaded.

*                                                                       *
************************************************************************/

static xsbBool load_syms(CTXTdeclc FILE *fd, char *filename, int psc_count, int count, Psc cur_mod, int exp,
			 prolog_term modformals, prolog_term modpars) // add act and form parlists
{
  int i;
  
  reloc_table = (pw *) mem_calloc((psc_count), sizeof(pw),COMPILED_SPACE);
  reloc_table_size = psc_count*sizeof(pw);
  /* xsb_dbgmsg(("reloc_table %x,psc_count %d",reloc_table,psc_count)); */

  for (i = count; i < psc_count; i++) { // add act and form parlists
    if (!load_one_sym(CTXTc fd, filename, cur_mod, i, exp, modformals, modpars)) return FALSE;
  }
  return TRUE;
}

#ifdef MULTI_THREAD

static void new_tdispblk(CTXTdeclc TIFptr *instr_ptr, Psc psc) {
  struct TDispBlk_t *tdispblk;

  tdispblk = (struct TDispBlk_t *) 
    mem_calloc(sizeof(struct TDispBlk_t)+max_threads_glc*sizeof(Cell),1,COMPILED_SPACE);
  
  SYS_MUTEX_LOCK( MUTEX_TABLE );

  if (tdispblkhdr.firstDB) tdispblkhdr.firstDB->PrevDB = tdispblk;
  tdispblk->NextDB = tdispblkhdr.firstDB;
  tdispblkhdr.firstDB = tdispblk;
  if (!tdispblkhdr.lastDB) tdispblkhdr.lastDB = tdispblk;

  tdispblk->psc_ptr = psc;
  tdispblk->method = DISPATCH_BLOCK;
  tdispblk->MaxThread = max_threads_glc;
  *instr_ptr = (TIFptr)tdispblk;

  if (get_tabled(psc)==T_TABLED) {					
    if ((TabledEvalMethod)pflags[TABLING_METHOD] == VARIANT_EVAL_METHOD)			
       psc_set_tabled( psc,T_TABLED_VAR);					
     else psc_set_tabled(psc,T_TABLED_SUB);				
   }									

  SYS_MUTEX_UNLOCK( MUTEX_TABLE );

}

#endif

/* return true if there is an program address in the stack that points
   into code in a segment. */
static int address_in_seg(pb code_addr, pseg seg) {
  pindex i1 ;

  i1 = seg_index(seg) ;
  while (i1) {
    if (code_addr >= (pb)i1 && code_addr <= (pb)i1+i_size(i1)) {
      //      printf("index-addr: %p:%p-%p(%x)\n",code_addr,i1,code_addr+i_size(i1),i_size(i1));
      return TRUE;
    }
    i1 = i_next(i1) ;
  }
  if (code_addr >= (pb)seg_hdr(seg) && code_addr <= (pb)(seg_hdr(seg))+seg_size(seg)) {
    //    printf("seg-addr: %p:%p-%p\n",code_addr,seg_hdr(seg), seg_hdr(seg)+seg_size(seg));
    return TRUE;
  }
  return FALSE;
}

static int seg_address_in_stack(CTXTdeclc pseg seg) {
  CPtr tmp_ereg = ereg;
  byte *tmp_cpreg = cpreg;
  CPtr tmp_breg = breg;
  byte instruction;

  if (address_in_seg(pcreg,seg)) return TRUE;

  instruction = *(tmp_cpreg-2*sizeof(Cell));
  while (tmp_cpreg && (instruction == call || instruction == trymeorelse)) {
    if (address_in_seg(tmp_cpreg,seg)) return TRUE;
    tmp_cpreg = *((byte **)tmp_ereg-1);
    tmp_ereg = *(CPtr *)tmp_ereg;
    instruction = *(tmp_cpreg-2*sizeof(Cell));
  }
  while (tmp_breg && tmp_breg != cp_prevbreg(tmp_breg)) {
    if (address_in_seg(cp_pcreg(tmp_breg),seg)) return TRUE;
    tmp_breg = cp_prevbreg(tmp_breg);
  }
  return FALSE;
}

char *generated_prefix = "_$";
int has_generated_prefix(char *name) {
  int i = 0;
  while (generated_prefix[i] != '\0') {
    if (name[i] != generated_prefix[i]) return 0;
    i++;
  }
  return 1;
}

/************************************************************************/
static byte *loader1(CTXTdeclc FILE *fd, char *filename, int exp, int immutable,
		     prolog_term modpars)  // add arg of actual par list
{
  char name[FOREIGN_NAMELEN], arity;
  byte name_len;
  int  is_new, seg_count;
  UInteger psc_count;
  Integer text_bytes, index_bytes;
  pseg seg_first_inst, first_inst;
  Psc cur_mod;
  Pair ptr;
  TIFptr *instruct_tip;
  Integer dummy; /* used to squash warnings */
  prolog_term modformals = (prolog_term) NULL;
 
  seg_count = 0; first_inst = 0;
  dummy = get_obj_byte(&name_len);

  if (name_len >= FOREIGN_NAMELEN)
    xsb_abort("[LOADER] Foreign module name is too long");

  dummy = get_obj_string(name, name_len);
  name[(int)name_len] = 0;
  if (name_len==0) {
    cur_mod = global_mod;
    if (immutable && pflags[VERBOSENESS_LEVEL]) {
      printf("Warning: non-module loading as immutable: %s\n",name);
    }
  }
  else { // loading a module
    if (name[0] == '\'' || strstr(name,")") != NULL) {
    // parse and build formal par list
      STRFILE strfile;
      strfile.strcnt = strlen((char *)name);
      strfile.strptr = strfile.strbase = (byte *)name;
      iostrs[0] = &strfile;
      bld_ref(reg+5,hreg);  // where read returns answer with code=3
      new_heap_free(hreg);
      read_canonical_term(CTXTc iostrdecode(0),3); // 3 gets answer in r5
      modformals = ptoc_tag(CTXTc 5);
      if (isstring(modformals) && !isstring(modpars)) {
	xsb_error("Module %s is not parameterized, but %d actual parameters provided",
		  name,get_arity(get_str_psc(modpars)));
		  }
      if (!((isstring(modformals) && isstring(modpars)) ||
	    (isstr(modformals) && isstr(modpars) &&
	     get_arity(get_str_psc(modformals)) == get_arity(get_str_psc(modpars))))) {
	xsb_error("Module %s, inconsistent number of formal and actual parameters",name);
	}
      replace_form_by_act(name,modformals,modpars);  // formal pars by actual pars in name to name
    } else {
      if (!isinteger(modpars) && !isstring(modpars)) {
	xsb_error("Module %s is not parameterized, but %d actual parameters provided",
		  name,get_arity(get_str_psc(modpars)));
		  }
      modformals = modpars;
    }
    ptr = insert_module(T_MODU, name);
    cur_mod = ptr->psc_ptr;

    if (get_immutable(cur_mod)  /* cant overload an immutable mod */
	|| (immutable && get_modloaded(cur_mod))) { /* cant overload another mod by immutable one */
	if (pflags[VERBOSENESS_LEVEL]) { printf("Immutable: re-load of module prohibited: %s\n",name);}
	return((byte *)2); // continue silently
    } else if (immutable) {
      if (pflags[VERBOSENESS_LEVEL]) { printf("Immutable: first load of module: %s\n",name);}
      psc_set_immutable(cur_mod,1);
    }
    psc_set_modloaded(cur_mod,1);
    psc_set_ep(cur_mod,(byte *)makestring(filename)); // psc->filename for module.
  }
  get_obj_word_bb(&psc_count);
  if (!load_syms(CTXTc fd, filename, (int)psc_count, 0, cur_mod, exp, modformals, modpars ))
    return FALSE;
  /*	xsb_dbgmsg(("symbol table of module %s loaded", name));	*/
  do {
    /*		xsb_dbgmsg(("Seg count: %d",seg_count)); */
    if (read_magic(fd) != 0x11121306) break;

    seg_count++;
    /*		xsb_dbgmsg(("Seg count: %d",seg_count)); */
    /* get the header of the segment */
    dummy = get_obj_byte(&arity);
    get_obj_atom(fd,&str);
    ptr = insert(str.string, arity, cur_mod, &is_new);

    get_obj_word_bb(&text_bytes);
    /*		xsb_dbgmsg(("Text Bytes %x %d",text_bytes,text_bytes));*/
    get_obj_word_bb(&index_bytes);
    /* load the text-index segment */
    seg_first_inst = load_seg(CTXTc fd,seg_count,text_bytes,index_bytes,ptr);
    if (!seg_first_inst) return FALSE;
    if (seg_count == 1) first_inst = seg_first_inst;
    /* 1st inst of file */
    /* set the entry point of the predicate */

    switch (get_type(ptr->psc_ptr)) {
    case T_ORDI:
    case T_UDEF:
      if (strcmp(str.string, "_$main")!=0) {
	psc_set_type(ptr->psc_ptr, T_PRED);
	psc_set_ep(ptr->psc_ptr, (pb)seg_first_inst);
	if (xsb_profiling_enabled) {
	  add_prog_seg(ptr->psc_ptr, (pb)seg_first_inst, /*text_bytes*/ seg_size(seg_first_inst)-SIZE_SEG_HDR);
	}
      }
      if (get_data(ptr->psc_ptr) == global_mod || isstring(get_data(ptr->psc_ptr))) {
	psc_set_data(ptr->psc_ptr,(struct psc_rec *)makestring(filename)); // filename already interned
      }
      instruct_tip = get_tip_or_tdisp(ptr->psc_ptr);
      if (instruct_tip != NULL) {
#ifdef MULTI_THREAD
	if (get_tabled(ptr->psc_ptr) && !get_shared(ptr->psc_ptr)) {
	  new_tdispblk(CTXTc instruct_tip, ptr->psc_ptr);
	} else
#endif
	  *instruct_tip = New_TIF(CTXTc (ptr->psc_ptr));
      }
      //      printf("table: %s/%d, psc_tabled: %x\n",get_name(ptr->psc_ptr),get_arity(ptr->psc_ptr),get_tabled(ptr->psc_ptr));
      break;
    case T_PRED:
      if (strcmp(str.string, "_$main")!=0) {
	if (xsb_profiling_enabled)
	  remove_prog_seg((pb)get_ep(ptr->psc_ptr));
	if (seg_address_in_stack(CTXTc (pseg)get_ep(ptr->psc_ptr))) {
	  char message[255];
	  snprintf(message,255,
		   "ERROR: When redefining %s/%d from file %s, freed code is still needed.",
		   get_name(ptr->psc_ptr),get_arity(ptr->psc_ptr),filename);
	  xsb_exit( message);
	}
	if (isstring(get_data(ptr->psc_ptr)) && 
	    !has_generated_prefix(str.string) &&
	    nec_different_xwam_files(filename,string_val(get_data(ptr->psc_ptr)))) {
	  xsb_warn(CTXTc "Redefining: %s/%d from file %s; Previously defined from file %s",
		   get_name(ptr->psc_ptr),get_arity(ptr->psc_ptr),
		   filename, string_val(get_data(ptr->psc_ptr)));
	  psc_set_data(ptr->psc_ptr,(struct psc_rec *)makestring(filename)); // already intern
	}
	unload_seg((pseg)get_ep(ptr->psc_ptr));
	psc_set_ep(ptr->psc_ptr, (pb)seg_first_inst);
	if (xsb_profiling_enabled) {
	  add_prog_seg(ptr->psc_ptr, (pb)seg_first_inst, /*text_bytes*/ seg_size(seg_first_inst)-SIZE_SEG_HDR);
	}
      }
      instruct_tip = get_tip_or_tdisp(ptr->psc_ptr);
      if (instruct_tip != NULL) {
#ifdef MULTI_THREAD
	if (get_tabled(ptr->psc_ptr) && !get_shared(ptr->psc_ptr)) {
	  new_tdispblk(CTXTc instruct_tip, ptr->psc_ptr);
	} else
#endif
	  *instruct_tip = New_TIF(CTXTc (ptr->psc_ptr));
      }
      /* set data to point to module's psc, if not */
      if (!isstring(get_data(ptr->psc_ptr))) {
	psc_set_data(ptr->psc_ptr, cur_mod);
      }
      break;
    case T_DYNA: {
      char culprit[280];

      unload_seg(seg_first_inst);

      snprintf(culprit,279,"dynamic predicate %s/%d",str.string,arity);
      xsb_permission_error(CTXTc "redefine as static",culprit,0,"consult",1);
	//      xsb_abort("[LOADER] Trying to compile a dynamic predicate, %s/%d",
	//		name, arity);
      return NULL;
    }
    default:
      unload_seg(seg_first_inst);
      xsb_abort("[LOADER] The predicate %s/%d cannot be loaded", str.string, arity);
      return NULL;
    }
  } while (1==1);
  /*
    xsb_dbgmsg(("The first instruction of module %s is %x",
    get_name(cur_mod), first_inst));
  */

  SQUASH_LINUX_COMPILER_WARN(dummy) ; 
  return (pb)first_inst;
} /* loader1 */

/************************************************************************/
/*  Routines for the foreign language interface.			*/
/************************************************************************/

#ifdef FOREIGN

/* ldoption is specified in .H file and indicates library files, etc
   that need to be loaded. */
static byte *loader_foreign(CTXTdeclc char *filename, FILE *fd, int exp,int immutable)
{
  byte name_len, *instr;
  char name[FOREIGN_NAMELEN];
  static XSB_StrDefine(ldoption);
  UInteger psc_count;
  Psc  cur_mod;
  Pair ptr;
  Integer dummy; /* used to squash warnings */

  dummy = get_obj_byte(&name_len);
  if (name_len >= FOREIGN_NAMELEN) {
    xsb_error("[LOADER] Foreign module name is too long");
    return FALSE;
  }
  dummy = get_obj_string(name, name_len);
  name[name_len] = 0;
  get_obj_atom(fd, &ldoption);
  ptr = insert_module(T_MODU, name);
  if (immutable) {
    if (get_immutable(ptr->psc_ptr) == 0) {
      if (pflags[VERBOSENESS_LEVEL]) {printf("DEBUG Immutable: Immutable foreign file: first load\n");}
      psc_set_immutable(ptr->psc_ptr,1);
    } else { 
      if (pflags[VERBOSENESS_LEVEL]) {printf("DeBUG Immutable foreign file: re-load prohibited\n");}
      return(NULL);
    }
  }
  cur_mod = ptr->psc_ptr;
  get_obj_word_bb(&psc_count);
  if (!load_syms(CTXTc fd, filename, (int)psc_count, 0, cur_mod, exp, makenil, makenil)) return FALSE;
  instr = load_obj(CTXTc filename, cur_mod, ldoption.string);

  SQUASH_LINUX_COMPILER_WARN(dummy) ; 
  return instr;
} /* end of loader_foreign */
#endif

/************************************************************************/
/*									*/
/* Loads the file into permanent space.					*/
/* Data segment first (mixed psc entries and name strings), then text	*/
/* segment.  Under normal circumstances it returns the address of first	*/
/* instruction; if errors occur, it returns NULL.			*/
/*									*/
/************************************************************************/

//extern FILE *logfile;
static int warned_old_obj = 0;	/* warned the user about old object files ? */

/* See description of magic numbers in foreign.P -- Is ...5 obsolete? */
byte *loader(CTXTdeclc char *file, int exp, prolog_term modpars) // add arg of actual parameter list (prolog list of atoms)
{
  FILE *fd;	      /* file descriptor */
  unsigned int magic_num;
  byte *first_inst = NULL; int is_immutable;

  fd = fopen(file, "rb"); /* "b" needed for DOS. -smd */
  //  fprintf(logfile,"opening: %s (%s)\n",file,"rb");
  if (!fd) {printf("open failed for %s\n",file); return NULL;}
  if (flags[LOG_ALL_FILES_USED]) {
    char *dummy; /* to squash a warning */
    char current_dir[MAX_CMD_LEN];
    dummy = getcwd(current_dir, MAX_CMD_LEN-1);
    xsb_log("%s: %s\n",current_dir,file);
  SQUASH_LINUX_COMPILER_WARN(dummy) ; 
  }

  if (flags[HITRACE]) {
    if (file[0] == '.') {
      char dir[200];
      char *res; /* to squash a warning */
      res = getcwd(dir,199);
      SQUASH_LINUX_COMPILER_WARN(res) ; 
      xsb_mesg("\n  ...... loading file %s%s", dir,file+1);
    } else xsb_mesg("\n  ...... loading file %s", file);
  }
  magic_num = read_magic(fd);

  if (magic_num == 0x11121304 || magic_num == 0x11121305) {
    if (!warned_old_obj) {
      xsb_warn(CTXTc "File \"%s\"\n"
	       "\t   has old byte code format, which is likely to cause\n"
	       "\t   unpredictable behavior.\n"
	       "\t   Please recompile the file with XSB version > 2.01.",
	       file);
      warned_old_obj = 1;
    }
  }

  if (magic_num == 0x1112130a || magic_num == 0x1112130b || magic_num == 0x1112130c) {
    if (pflags[VERBOSENESS_LEVEL]) {printf("found an immutable file %s magic_num: %x\n",file,magic_num);}
    is_immutable = 1;
  } else is_immutable = 0;
      
    if (magic_num == 0x11121307 || magic_num == 0x11121305 || magic_num == 0x1112130a) {
      //      printf("Prolog magic num 0x%x\n",magic_num);
    char *efilename = expand_filename(file);
    char *xwamaddr;
    // take off trailing privatizer if nec, for messages
    if ((xwamaddr = strstr(efilename,XSB_OBJ_EXTENSION_STRING))) {
      *(xwamaddr+XSB_OBJ_EXTENSION_LENGTH) = '\0';
    }
    char *filename = string_find(efilename,1);
    mem_dealloc(efilename,MAXPATHLEN,OTHER_SPACE);
    first_inst = loader1(CTXTc fd,filename,exp,is_immutable,modpars);  // pass actual par list as arg
  } else if (magic_num == 0x11121308 || magic_num == 0x11121309 || magic_num == 0x1112130b || magic_num == 0x1112130c) {
#ifdef FOREIGN
      //      printf("foreign magic num 0x%x\n",magic_num);
    first_inst = loader_foreign(CTXTc file, fd, exp,is_immutable);
#else
    xsb_abort("Loading a foreign file: %s prohibited in this configuration", file);
#endif
  } else {
    xsb_abort("File: %s does not have proper byte code format...(%x)\n%s",
	      file, magic_num, "\t Please remove it and then recompile");
    first_inst = NULL;
  }

  fclose(fd);
  if (reloc_table) {
    mem_dealloc(reloc_table,reloc_table_size,COMPILED_SPACE);
    reloc_table = 0;
  }
  return first_inst;
} /* loader */

#ifdef MULTI_THREAD
/* TLS: not currently used.
| void thread_free_tab_blks(CTXTdecl) {
|   struct TDispBlk_t *tdispblk;
|   TIFptr tip;
| 
|   SYS_MUTEX_LOCK( MUTEX_TABLE );
|   for (tdispblk=tdispblkhdr.firstDB ; tdispblk != NULL ; tdispblk=tdispblk->NextDB) {
|     if (xsb_thread_entry <= tdispblk->MaxThread) {
|       tip = (&(tdispblk->Thread0))[xsb_thread_entry];
|       if (tip) {
| 	delete_predicate_table(CTXTc tip);
| 	(&(tdispblk->Thread0))[xsb_thread_entry] = (TIFptr) NULL;
|       }
|     }
|   }
|   SYS_MUTEX_UNLOCK( MUTEX_TABLE );
| }
*/
#endif
