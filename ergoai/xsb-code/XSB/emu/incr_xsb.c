/* File:      incr_xsb.c  -- support for incremental evaluation
** Author(s): Diptikalyan Saha, C.R. Ramakrishnan
** Contact:   xsb-contact@cs.sunysb.edu
** 
** Copyright (C) The Research Foundation of SUNY, 2001,2002
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
** $Id: incr_xsb.c,v 1.29 2013-05-06 21:10:24 dwarren Exp $
** 
*/

#include "xsb_config.h"
#include "xsb_debug.h"

#include <stdio.h>
#include <stdlib.h>

#include "auxlry.h"
#include "context.h"
#include "cell_xsb.h"
#include "psc_xsb.h"
#include "cinterf.h"
#include "deref.h"
#include "memory_xsb.h"
#include "heap_xsb.h"
#include "register.h"
#include "tries.h"
#include "trie_internals.h"
#include "tab_structs.h"
#include "choice.h"
#include "subp.h"
#include "error_xsb.h"
#include "tr_utils.h"
#include "incr_xsb.h"
#include "debug_xsb.h"
#include "flags_xsb.h"
#include "ptoc_tag_xsb_i.h"
#include "call_graph_xsb.h"
#include "term_psc_xsb_i.h"
#include "rw_lock.h"
#include "token_xsb.h"
#include "binding.h"
#include "tst_utils.h"
#include "hashtable.h"
#include "hashtable_itr.h"
#include "tables.h"

// defined in call_graph_xsb.c
int immediate_depends_callnode_ptrlist(CTXTdeclc callnodeptr);

/* This is already defined in builtin.c; need to factor this out */
#define ptoc_addr(regnum)	(void *)ptoc_int(CTXTc regnum)

/*******
 ** Builtin for handling incremental evaluation 
 *******/
extern TIFptr get_tip(CTXTdeclc Psc);
extern int prolog_call0(CTXTdeclc Cell);

xsbBool incr_eval_builtin(CTXTdecl)
{
  int builtin_number = (int)ptoc_int(CTXTc 1);
  
  switch(builtin_number) {

    //  case GET_AFFECTED_CALLS: {
    /* This builtin creates a (prolog) list which contains all the
      affected calls in postorder.     */
    //    int rc = call_list_to_prolog(CTXTc affected_gl);
    //  printterm(stddbg,reg[4],25); printf(" -4i-\n");
    //  printterm(stddbg,reg[3],25); printf(" -3i- \n");
    //    return rc;
    //    break;
    //  }

    //  case CONSUME_AFFECTED_CALLS: {
    //    /* This builtin creates a (prolog) list which contains all the
    //      affected calls in postorder.     */
    //    int rc = return_affected_list_for_update(CTXT);
    //    affected_gl=empty_calllist();
    //    changed_gl=empty_calllist();
    //    return rc;
    //    break;
    //  }

    //  case GET_CHANGED_CALLS: {
    //    /* This builtin creates a (prolog) list which contains all the
    //      changed calls.          */
    //
    //    return return_changed_call_list(CTXT);    
    //    break;
    //  }
    
/*  
| case GET_CALL_GRAPH: {
|     printf("<%d,%d>",call_node_count_gl,call_edge_count_gl);
|     break;  
|   }
*/
    
  case INVALIDATE_SF: {
  /* Find all affected calls and add to affected_gl.    */
       
    const int sfreg=2;
    VariantSF sf=ptoc_addr(sfreg);
    callnodeptr c;
    if (!get_incr(TIF_PSC(subg_tif_ptr(sf)))) {
      xsb_permission_error(CTXTc"invalidate","call to non-incremental predicate",reg[3],
			   "incr_invalidate_call",1);
    }
    c=subg_callnode_ptr(sf);
    invalidate_call(CTXTc c,NOT_ABOLISHING); 

    break;
  }

  case INVALIDATE_CALLNODE: {
  /* Find all affected calls and add to affected_gl.    */
    
    const int callreg=2;
    callnodeptr c=ptoc_addr(callreg);
    invalidate_call(CTXTc c,NOT_ABOLISHING); 
    break;
  }
  
  case  GET_CALLNODEPTR_INCR:{
    const int regLeafChild=3; 
    if(IsNULL(BTN_Child(Last_Nod_Sav))){
      xsb_warn(CTXTc "Callnodeptr is NULL! Invalid incrdynamic predicate.");
      return FALSE;
    }
    ctop_int(CTXTc regLeafChild, (Integer)BTN_Child(Last_Nod_Sav));    
    break;
  }

    /*
  case PRINT_CALL: {        
    const int regSF=2;
    VariantSF sf=ptoc_addr(regSF);
    if(IsIncrSF(sf))
      print_call_node(sf->callnode);
    else {
      sfPrintGoal(stdout,sf,NO);printf(" is not incrementally tabled\n"); 
    }
    break;
}
    */

#ifdef INCR_SUBST
  case PSC_SET_INCR: {
    Psc psc = (Psc)ptoc_addr(2);   
    int ibits = (int)ptoc_int(CTXTc 3);
    if (ibits < 4) {  //  opaque, nincremental,incremental (as opposed to intern) 
	psc_set_incr(psc,(int)ptoc_int(CTXTc 3));
	//      printf("%s/%d:%u incr set to %d\n",get_name(psc),get_arity(psc),psc,ptoc_int(3));
    } else {
      psc_set_intern(psc,ibits);
    }
      break;
  }
#else
  case PSC_SET_INCR: {
    Psc psc = (Psc)ptoc_addr(2);   
    int ibits = (int)ptoc_int(CTXTc 3);
    if (ibits < 4) {
      if (!(get_tabled(psc) == T_TABLED_SUB && ptoc_int(CTXTc 3) == INCREMENTAL)) {
  	psc_set_incr(psc,(int)ptoc_int(CTXTc 3));
	//      printf("%s/%d:%u incr set to %d\n",get_name(psc),get_arity(psc),psc,ptoc_int(3));
      }
      //	xsb_abort("Cannot incrementally maintain a subsumptive table (%s/%d)",get_name(psc),get_arity(psc));
  } else {
      psc_set_intern(psc,ibits);
    }
    break;
  }
#endif
  
case PSC_GET_INCR: {
    Psc psc = (Psc)ptoc_addr(2);   
    if (get_incr(psc))
	ctop_int(CTXTc 3,INCREMENTAL);
    else if (get_opaque(psc))
      ctop_int(CTXTc 3,OPAQUE);
    else ctop_int(CTXTc 3,0);
    break;
  }

  case PSC_SET_INTERN: {
    Psc psc = (Psc)ptoc_addr(2);   
    psc_set_intern(psc,(int)ptoc_int(CTXTc 3));
    break;    
  }

  case PSC_GET_INTERN: {
    Psc psc = (Psc)ptoc_addr(2);   
    if (get_intern(psc))
      ctop_int(CTXTc 3,T_INTERN);
    else ctop_int(CTXTc 3,0);
    break;
  }

  case PSC_SET_ALT_SEMANTICS: {
    Psc psc = (Psc)ptoc_addr(2);   
    psc_set_alt_semantics(psc,(int)ptoc_int(CTXTc 3));
    break;    
  }

  case PSC_GET_ALT_SEMANTICS: {
    Psc psc = (Psc)ptoc_addr(2);   
    ctop_int(CTXTc 3,psc_get_alt_semantics(psc));
    break;
  }

  case IMMED_DEPENDS_LIST: {
    VariantSF sf;
    int idl_flag = 0;
    callnodeptr callnode_ptr;
    sf = get_call(CTXTc ptoc_tag(CTXTc 2), NULL,&idl_flag,&callnode_ptr);
    //    printf("IDL sf %p\n",sf);
    if (IsNonNULL(sf)) 
      return(immediate_depends_list(CTXTc sf->callnode));
    else return FALSE;
    break;
  }

  case IMMED_AFFECTS_LIST: {
    VariantSF sf;
    int idl_flag = 0;
    callnodeptr callnode_ptr;

    sf  = get_call(CTXTc ptoc_tag(CTXTc 2), NULL,&idl_flag,&callnode_ptr);
    if (IsNonNULL(sf)) 
    return immediate_outedges_list(CTXTc sf->callnode);
    else return FALSE;
    break;
  }

  case IS_AFFECTED: {
    Psc psc = term_psc((Cell)(ptoc_tag(CTXTc 2)));
    int idl_flag = 0;
    callnodeptr callnode_ptr;

    if (get_type(psc) != T_DYNA && get_incr(psc)) { /* make sure its incremental, but isn't a leaf node of the IDG */
      VariantSF sf  = get_call(CTXTc ptoc_tag(CTXTc 2), NULL,&idl_flag,&callnode_ptr);
      if(IsNonNULL(sf)){
	callnodeptr c=sf->callnode;
	//	if(IsNonNULL(c) &&  (c->falsecount!=0)) {
	if(IsNonNULL(c)) {
	  ctop_int(CTXTc 3, (Integer) c->falsecount);
	  //	  ctop_int(CTXTc 4, (Integer) has_answers(sf) );
	  ctop_int(CTXTc 4, (Integer) c->no_of_answers );
	  return TRUE;
	}
	else
	  return FALSE;
      } else
	return FALSE;
    }
    else return FALSE;
    
    break;
  }
    
  case INVALIDATE_CALLNODE_TRIE: {
    const int callreg=2;
    int index = (int)ptoc_int(CTXTc callreg);
    callnodeptr c; // Declare this earlier to please Visual C++ 2010 Express

    if (!itrie_array[ptoc_int(CTXTc callreg)].incremental) {
      //      sprint_subgoal(CTXTc forest_log_buffer_1,0,(VariantSF)ptcpreg);  dont think this is relevant
      xsb_abort("Trying to invalidate trie number %d, which is non-incremental.\n",index);
    }

    //    printf("invalidating trie %d callnode w. cn %p\n",index,itrie_array[index].callnode);

    c = itrie_array[index].callnode;
    //    if (c->falsecount == 0) 
    invalidate_call(CTXTc c,NOT_ABOLISHING); 
    break;
  }

  /*  This builtin creates a (prolog) list which contains all the 
      affected calls that the input call depends on, in postorder.         */
  case RETURN_LAZY_CALL_LIST: {
    VariantSF sf;
    int idl_flag = 0;
    int rc = 0, flag, dfs_ret;
    callnodeptr callnode_ptr;

    sf = get_call(CTXTc ptoc_tag(CTXTc 2), NULL,&idl_flag,&callnode_ptr);

    // maybe check callnodeptr here.
    if (IsNonNULL(sf))  {
      flag = (int)ptoc_int(CTXTc 3);
      if (flag == CALL_LIST_EVAL) {
	rc = return_lazy_call_list(CTXTc sf->callnode);
	return rc;
      }
      else if (flag == CALL_LIST_CREATE_EVAL) {
	lazy_affected = empty_calllist(CTXT);
	dfs_ret = dfs_dependency_edges(CTXTc subg_callnode_ptr(sf),  &lazy_affected, CALL_LIST_EVAL);
	//	fprintf(stddbg,"dfs returned %d flag = %d\n",dfs_ret,flag);
	if (!dfs_ret ) 
	  rc = return_lazy_call_list(CTXTc sf->callnode);
	else rc = FALSE;
	return rc;
      }
      else if (flag == CALL_LIST_INSPECT)  {
	lazy_affected = empty_calllist(CTXT);
	dfs_ret = dfs_dependency_edges(CTXTc subg_callnode_ptr(sf),  &lazy_affected, CALL_LIST_INSPECT);
	//	fprintf(stddbg,"dfs returned %d flag = %d\n",dfs_ret,flag);
	rc = return_lazy_call_list(CTXTc sf->callnode);
	return rc;
      }
    }
    // TLS: error on null sf
    break;
  }

  // Will not call incremental facts.
  case CALL_IF_AFFECTED: {
    VariantSF sf;
    Cell callTerm;
    int idl_flag = 0;
    callnodeptr callnode_ptr;
    
  callTerm = ptoc_tag(CTXTc 2);

  sf = get_call(CTXTc callTerm, NULL,&idl_flag,&callnode_ptr);

  if(IsNonNULL(sf)){
    callnodeptr c=sf->callnode;
    if(IsNonNULL(c)&&(c->falsecount!=0))
      return prolog_call0(CTXTc callTerm);
  }
  return FALSE;
  }

  case CHECK_INCREMENTAL: {
    if (!get_nonincremental(term_psc((Cell)(ptoc_tag(CTXTc 2)))))
      return TRUE;
    else xsb_type_error(CTXTc ptoc_string(CTXTc 3),ptoc_tag(CTXTc 2), 
			ptoc_string(CTXTc 4), (int)ptoc_int(CTXTc 5));
    break;
  }

    // Using callnodes for dependencies now.
    //  case IMMED_AFFECTS_PTRLIST: {
    //    VariantSF sf;
    //			   
    //    sf  = (VariantSF) ptoc_int(CTXTc 2);
    //    printf("sf2 %p\n",sf);
    //    return immediate_affects_ptrlist(CTXTc sf->callnode);
    //    break;
    //  }

    //  case GET_SUBGOAL_FRAME: {
    //    VariantSF sf;
    //    int idl_flag = 0;
    //    callnodeptr callnode_ptr;
    
    //    sf  = get_call(CTXTc ptoc_tag(CTXTc 2), NULL,&idl_flag,&callnode_ptr);
    //    printf("sf1 %p\n",sf);
    //    if (IsNonNULL(sf)) {
    //      ctop_int(CTXTc 3, (Integer) sf);
    //      return TRUE;
    //    }
    //    else return FALSE;
    //    break;
    //  }

  case GET_INCR_SCCS: {

    return get_incr_sccs(CTXTc ptoc_tag(CTXTc 2));
  }

  case IMMED_DEPENDS_CALLNODE_PTRLIST: {
    callnodeptr callnode;

    callnode = (callnodeptr) ptoc_int(CTXTc 2);
    return immediate_depends_callnode_ptrlist(CTXTc callnode);
    break;
  }

  case IMMED_AFFECTS_CALLNODE_PTRLIST: {
    callnodeptr callnode;
			   
    callnode = (callnodeptr) ptoc_int(CTXTc 2);
    return immediate_affects_callnode_ptrlist(CTXTc callnode);
    break;
  }

  case CN_TO_SF: {
    callnodeptr callnode;
    callnode = (callnodeptr) ptoc_int(CTXTc 2);    
    ctop_int(CTXTc 3, (Integer) callnode_sf(callnode));
    break;
  }

  case ROOT_SUBGOAL_IS_INCR: {
    //    printf("rsii started\n");
    if (ptcpreg && get_incr(TIF_PSC(subg_tif_ptr(ptcpreg)))) {
      //      printf("rsii returining true\n");
      return TRUE;
    }
    return FALSE;
  }
    
  case ADD_INCR_DEPENDENCY: {
    TIFptr tip;
    VariantSF  sf;
    TabledCallInfo callInfo;
    CallLookupResults lookupResults;
    callnodeptr cn;

    //    printf("Adding dependency\n");
    Psc dp_psc = term_psc((Cell)(ptoc_tag(CTXTc 2)));
    if (!dp_psc) {
      xsb_abort("add_incr_dependency: improper input\n");
    }
    CallInfo_CallArity(callInfo) = get_arity(dp_psc);
    tip = get_tip(dp_psc);
    //    printf("tip %p\n",tip);
    if (!tip) {
      xsb_abort("add_incr_dependency: %s/%d is non-incremental\n",
		get_name(dp_psc),get_arity(dp_psc));
    }
    CallInfo_TableInfo(callInfo) = tip;
    //    printterm(stddbg,ptoc_tag(CTXTc 2),25); 
    //    CPtr cptr = (CPtr) ptoc_tag(CTXTc 2);
    CallInfo_Arguments(callInfo) = reg + 2;
    check_tcpstack_overflow;
    CallInfo_AnsTempl(callInfo) = top_of_cpstack;
    check_glstack_overflow(CallInfo_CallArity(callInfo),pcreg,OVERFLOW_MARGIN);

    if (table_call_search_incr(CTXTc &callInfo,&lookupResults)) {
	return TRUE;
    }
    if(IsNonNULL(ptcpreg)) {
      sf=(VariantSF)ptcpreg;
      if(IsIncrSF(sf)){
	cn=(callnodeptr)BTN_Child(CallLUR_Leaf(lookupResults));
	//printf("cn %p\n",cn);
	if(IsNonNULL(cn)) {
	  addcalledge(CTXTc cn,sf->callnode);  
	}
      }
      else {
	if (!get_opaque(TIF_PSC(subg_tif_ptr(sf)))) {
	  xsb_abort("add_incr_dependency(%s/%d): the calling predicate %s:%s/%d was not declared incrementally_tabled\n",
		    get_name(TIF_PSC(tip)),
		    get_arity(TIF_PSC(tip)),
		    get_mod_name(TIF_PSC(subg_tif_ptr(sf))),
		    get_name(TIF_PSC(subg_tif_ptr(sf))),
		    get_arity(TIF_PSC(subg_tif_ptr(sf)))    );
	}
      }
    }
    break;
  }

  default:
    xsb_abort("Unknown Incremental Evaluation Builtin %d\n",builtin_number);
    //    xsb_exit("Unknown Incremental Evaluation Builtin: %d\n.", builtin_number);
    break;
  }
  return TRUE;
}

