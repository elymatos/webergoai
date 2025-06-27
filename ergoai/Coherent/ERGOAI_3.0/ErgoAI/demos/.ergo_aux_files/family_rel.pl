
:-(compiler_options([xpp_on,canonical])).

/********** Tabling and Trailer Control Variables ************/

#define EQUALITYnone
#define INHERITANCEflogic
#define TABLINGreactive
#define TABLINGvariant
#define CUSTOMnone

#define FLORA_INCREMENTAL_TABLING 

/************************************************************************
  file: headerinc/flrheader_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).
#mode standard Prolog

#include "flrheader.flh"
#include "flora_porting.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrheader_prog_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).
#mode standard Prolog

#include "flrheader_prog.flh"

/***********************************************************************/

#define FLORA_COMPILATION_ID 2

/************************************************************************
  file: headerinc/flrheader2_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
  It has files that must be included in the header and typically
  contain some Prolog statements. Such files cannot appear
  in flrheader.flh because flrheader.flh is included in various restricted
  contexts where Prolog statements are not allowed.

  NOT included in ADDED files (compiled for addition) -- only in LOADED
  ones and in trailers/patch
************************************************************************/

:-(compiler_options([xpp_on])).

#define TABLING_CONNECTIVE  :-

%% flora_tabling_methods is included here to affect preprocessing of
%% flrtable/flrhilogtable.flh dynamically
#include "flora_tabling_methods.flh"

/* note: inside flrtable.flh there are checks for FLORA_NONTABLED_DATA_MODULE
   that exclude tabling non-signature molecules
*/
#ifndef FLORA_NONTABLED_MODULE
#include "flrtable.flh"
#endif

/* if normal tabled module, then table hilog */
#if !defined(FLORA_NONTABLED_DATA_MODULE) && !defined(FLORA_NONTABLED_MODULE)
#include "flrhilogtable.flh"
#endif

#include "flrtable_always.flh"

#include "flrauxtables.flh"

%% include list of tabled predicates
#mode save
#mode nocomment "%"
#if defined(FLORA_FLT_FILENAME)
#include FLORA_FLT_FILENAME
#endif
#mode restore

/***********************************************************************/

/************************************************************************
  file: headerinc/flrdyna_inc.flh

  Author(s): Chang Zhao

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#define TABLING_CONNECTIVE  :-

#include "flrdyndeclare.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrindex_P_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#include "flrindex_P.flh"

/***********************************************************************/

#mode save
#mode nocomment "%"
#define FLORA_THIS_FILENAME  'family_rel.ergo'
#mode restore
/************************************************************************
  file: headerinc/flrdefinition_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

#include "flrdefinition.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrtrailerregistry_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

#include "flrtrailerregistry.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrrefreshtable_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#include "flrrefreshtable.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrdynamic_connectors_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#include "flrdynamic_connectors.flh"

/***********************************************************************/

/************************************************************************
  file: syslibinc/flrimportedcalls_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

%% Loads the file with all the import statements for predicates
%% that must be known everywhere

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBIMPORTEDCALLS))).

/***********************************************************************/

/************************************************************************
  file: headerinc/flrpatch_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

#include "flrexportcheck.flh"
#include "flrpatch.flh"
/***********************************************************************/

/************************************************************************
  file: headerinc/flropposes_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

#include "flropposes.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrhead_dispatch_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#include "flrhead_dispatch.flh"

/***********************************************************************/

/************************************************************************
  file: syslibinc/flranswer_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBANSWER))).

/***********************************************************************/

/************************************************************************
  file: syslibinc/flrclause_inc.flh

  Author(s): Chang Zhao

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBCLAUSE))).

/***********************************************************************/

 
#if !defined(FLORA_FDB_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FDB_FILENAME  'family_rel.fdb'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FDB_FILENAME,FLORA_THIS_MODULE_NAME,'fdb'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_canonical_and_insert(FLORA_FDB_FILENAME,FLORA_THIS_FDB_STORAGE))).
#endif

 
#if !defined(FLORA_FLM_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLM_FILENAME  'family_rel.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(family_rel,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'family_rel.fld'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLD_FILENAME,FLORA_THIS_MODULE_NAME,'fld'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_canonical_and_insert(FLORA_FLD_FILENAME,FLORA_THIS_FLD_STORAGE))).
#endif

 
#if !defined(FLORA_FLS_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLS_FILENAME  'family_rel.fls'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS_FILENAME,FLORA_THIS_MODULE_NAME,'fls'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rules %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-(FLORA_THIS_WORKSPACE(static^tblflapply)(spouse,__X,__Y,'_$ctxt'(_CallerModuleVar,4,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(4,'family_rel.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(spouse,__Y,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,4)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(child,rita,__X,'_$ctxt'(_CallerModuleVar,6,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(6,'family_rel.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(child,wilhelm,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,6)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(child,johanna,__X,'_$ctxt'(_CallerModuleVar,8,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(8,'family_rel.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(child,hermann,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,8)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(parent,__C,__P,'_$ctxt'(_CallerModuleVar,10,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(10,'family_rel.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(child,__P,__C,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,10)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(father,__C,__P,'_$ctxt'(_CallerModuleVar,12,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(12,'family_rel.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(child,__P,__C,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,12)),FLORA_THIS_WORKSPACE(d^nontblflapply)(male,__P,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,12))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(mother,__C,__P,'_$ctxt'(_CallerModuleVar,14,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(14,'family_rel.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(parent,__C,__P,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,14)),FLORA_THIS_WORKSPACE(d^nontblflapply)(female,__P,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,14))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(brother,__X,__B,'_$ctxt'(_CallerModuleVar,16,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(16,'family_rel.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(parent,__X,__P,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,16)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(parent,__B,__P,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,16)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(male,__B,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,16)),\+(=(__X,__B))))),fllibexecute_delayed_calls([__B,__P,__X],[__B,__X])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(sister,__X,__S,'_$ctxt'(_CallerModuleVar,18,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(18,'family_rel.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(parent,__X,__P,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,18)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(parent,__S,__P,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,18)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(female,__S,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,18)),\+(=(__X,__S))))),fllibexecute_delayed_calls([__P,__S,__X],[__S,__X])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(ancestor,__X,__Y,'_$ctxt'(_CallerModuleVar,20,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(20,'family_rel.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(parent,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,20)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(ancestor,__X,__Y,'_$ctxt'(_CallerModuleVar,22,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(22,'family_rel.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(ancestor,__X,__Z,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,22)),FLORA_THIS_WORKSPACE(d^tblflapply)(ancestor,__Z,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,22))),fllibexecute_delayed_calls([__X,__Y,__Z],[__X,__Y])))).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rule signatures %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibinsrulesig(4,'family_rel.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20,FLORA_THIS_WORKSPACE(d^tblflapply)(spouse,__X,__Y,'_$ctxt'(_CallerModuleVar,4,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(spouse,__Y,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,4)),null,'_$_$_ergo''rule_enabled'(4,'family_rel.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(6,'family_rel.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,30,FLORA_THIS_WORKSPACE(d^tblflapply)(child,rita,__X,'_$ctxt'(_CallerModuleVar,6,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(child,wilhelm,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,6)),null,'_$_$_ergo''rule_enabled'(6,'family_rel.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(8,'family_rel.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,31,FLORA_THIS_WORKSPACE(d^tblflapply)(child,johanna,__X,'_$ctxt'(_CallerModuleVar,8,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(child,hermann,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,8)),null,'_$_$_ergo''rule_enabled'(8,'family_rel.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(10,'family_rel.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,32,FLORA_THIS_WORKSPACE(d^tblflapply)(parent,__C,__P,'_$ctxt'(_CallerModuleVar,10,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(child,__P,__C,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,10)),null,'_$_$_ergo''rule_enabled'(10,'family_rel.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(12,'family_rel.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,33,FLORA_THIS_WORKSPACE(d^tblflapply)(father,__C,__P,'_$ctxt'(_CallerModuleVar,12,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(child,__P,__C,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,12)),FLORA_THIS_WORKSPACE(d^nontblflapply)(male,__P,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,12))),null,'_$_$_ergo''rule_enabled'(12,'family_rel.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(14,'family_rel.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,34,FLORA_THIS_WORKSPACE(d^tblflapply)(mother,__C,__P,'_$ctxt'(_CallerModuleVar,14,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(parent,__C,__P,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,14)),FLORA_THIS_WORKSPACE(d^nontblflapply)(female,__P,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,14))),null,'_$_$_ergo''rule_enabled'(14,'family_rel.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(16,'family_rel.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,35,FLORA_THIS_WORKSPACE(d^tblflapply)(brother,__X,__B,'_$ctxt'(_CallerModuleVar,16,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(parent,__X,__P,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,16)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(parent,__B,__P,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,16)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(male,__B,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,16)),\+(=(__X,__B))))),null,'_$_$_ergo''rule_enabled'(16,'family_rel.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__B,__P,__X],[__B,__X]),true)).
?-(fllibinsrulesig(18,'family_rel.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,36,FLORA_THIS_WORKSPACE(d^tblflapply)(sister,__X,__S,'_$ctxt'(_CallerModuleVar,18,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(parent,__X,__P,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,18)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(parent,__S,__P,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,18)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(female,__S,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,18)),\+(=(__X,__S))))),null,'_$_$_ergo''rule_enabled'(18,'family_rel.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__P,__S,__X],[__S,__X]),true)).
?-(fllibinsrulesig(20,'family_rel.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,37,FLORA_THIS_WORKSPACE(d^tblflapply)(ancestor,__X,__Y,'_$ctxt'(_CallerModuleVar,20,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(parent,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,20)),null,'_$_$_ergo''rule_enabled'(20,'family_rel.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(22,'family_rel.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,38,FLORA_THIS_WORKSPACE(d^tblflapply)(ancestor,__X,__Y,'_$ctxt'(_CallerModuleVar,22,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(ancestor,__X,__Z,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,22)),FLORA_THIS_WORKSPACE(d^tblflapply)(ancestor,__Z,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,22))),null,'_$_$_ergo''rule_enabled'(22,'family_rel.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__X,__Y,__Z],[__X,__Y]),true)).


%%%%%%%%%%%%%%%%%%%%%%%%% Signatures for latent queries %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%% Queries found in the source file %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(brother,__X,__Brother,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[=('?X',__X),=('?Brother',__Brother)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(ancestor,eva,__Ancestor,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[=('?Ancestor',__Ancestor)])).

 
#if !defined(FLORA_FLS2_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLS2_FILENAME  'family_rel.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('family_rel.ergo',FLORA_THIS_MODULE_NAME))).

/************************************************************************
  file: headerinc/flrtrailer_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

#include "flrtrailer.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrpreddef_inc.flh

  Author(s): Chang Zhao

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#include "flrpreddef.flh"

/***********************************************************************/

