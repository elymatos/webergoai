
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

#define FLORA_COMPILATION_ID 5

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
#define FLORA_THIS_FILENAME  'mix.ergo'
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

/************************************************************************
  file: syslibinc/flrcolset_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBCOLLECTSET))).

/***********************************************************************/

 
#if !defined(FLORA_FDB_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FDB_FILENAME  'mix.fdb'
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
#define FLORA_FLM_FILENAME  'mix.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(mix,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'mix.fld'
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
#define FLORA_FLS_FILENAME  'mix.fls'
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

:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,reachableTo,__Y,'_$ctxt'(_CallerModuleVar,4,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(4,'mix.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^nontblflapply)(edge,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,4)))).
:-(FLORA_THIS_WORKSPACE(static^isa)(__X,activeNode,'_$ctxt'(_CallerModuleVar,4,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(4,'mix.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(edge,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,4)),fllibexecute_delayed_calls([__X,__Y],[__X])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,reachableTo,__Y,'_$ctxt'(_CallerModuleVar,6,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(6,'mix.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^nontblflapply)(edge,__X,__Z,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,6)),FLORA_THIS_WORKSPACE(d^mvd)(__Z,reachableTo,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,6))),fllibexecute_delayed_calls([__X,__Y,__Z],[__X,__Y])))).
:-(FLORA_THIS_WORKSPACE(static^isa)(__X,activeNode,'_$ctxt'(_CallerModuleVar,6,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(6,'mix.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^nontblflapply)(edge,__X,__Z,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,6)),FLORA_THIS_WORKSPACE(d^mvd)(__Z,reachableTo,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,6))),fllibexecute_delayed_calls([__X,__Y,__Z],[__X])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(show,__X,'_$ctxt'(_CallerModuleVar,8,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(8,'mix.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^isa)(__X,activeNode,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,8)),','(write(__X),','(write('[reachableTo->{'),','(','(fllibsetof(__newdontcarevar4,[],[],','(FLORA_THIS_WORKSPACE(d^mvd)(__X,reachableTo,__newdontcarevar4,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,8)),fllibexecute_delayed_calls([__X,__newdontcarevar4],[])),__newvar5),=(__L,__newvar5)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(writelist,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,8)),writeln('}]')))))),fllibexecute_delayed_calls([__L,__X],[__X])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(writelist,[__X],'_$ctxt'(_CallerModuleVar,10,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(10,'mix.flr',FLORA_THIS_MODULE_NAME),write(__X))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(writelist,[__X1,__X2|__Xs],'_$ctxt'(_CallerModuleVar,12,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(12,'mix.flr',FLORA_THIS_MODULE_NAME),','(write(__X1),','(write(','),FLORA_THIS_WORKSPACE(d^nontblflapply)(writelist,[__X2|__Xs],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,12)))))).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rule signatures %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibinsrulesig(4,'mix.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,9,FLORA_THIS_WORKSPACE(d^mvd)(__X,reachableTo,__Y,'_$ctxt'(_CallerModuleVar,4,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^nontblflapply)(edge,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,4)),null,'_$_$_ergo''rule_enabled'(4,'mix.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(4,'mix.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,9,FLORA_THIS_WORKSPACE(d^isa)(__X,activeNode,'_$ctxt'(_CallerModuleVar,4,__newcontextvar2)),FLORA_THIS_WORKSPACE(d^nontblflapply)(edge,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,4)),null,'_$_$_ergo''rule_enabled'(4,'mix.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__X,__Y],[__X]),true)).
?-(fllibinsrulesig(6,'mix.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,10,FLORA_THIS_WORKSPACE(d^mvd)(__X,reachableTo,__Y,'_$ctxt'(_CallerModuleVar,6,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(edge,__X,__Z,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,6)),FLORA_THIS_WORKSPACE(d^mvd)(__Z,reachableTo,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,6))),null,'_$_$_ergo''rule_enabled'(6,'mix.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__X,__Y,__Z],[__X,__Y]),true)).
?-(fllibinsrulesig(6,'mix.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,10,FLORA_THIS_WORKSPACE(d^isa)(__X,activeNode,'_$ctxt'(_CallerModuleVar,6,__newcontextvar2)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(edge,__X,__Z,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,6)),FLORA_THIS_WORKSPACE(d^mvd)(__Z,reachableTo,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,6))),null,'_$_$_ergo''rule_enabled'(6,'mix.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__X,__Y,__Z],[__X]),true)).
?-(fllibinsrulesig(8,'mix.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,11,FLORA_THIS_WORKSPACE(d^nontblflapply)(show,__X,'_$ctxt'(_CallerModuleVar,8,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^isa)(__X,activeNode,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,8)),','(write(__X),','(write('[reachableTo->{'),','(','(fllibsetof(__newdontcarevar4,[],[],','(FLORA_THIS_WORKSPACE(d^mvd)(__X,reachableTo,__newdontcarevar4,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,8)),fllibexecute_delayed_calls([__X,__newdontcarevar4],[])),__newvar5),=(__L,__newvar5)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(writelist,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,8)),writeln('}]')))))),null,'_$_$_ergo''rule_enabled'(8,'mix.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__L,__X],[__X]),true)).
?-(fllibinsrulesig(10,'mix.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,12,FLORA_THIS_WORKSPACE(d^nontblflapply)(writelist,[__X],'_$ctxt'(_CallerModuleVar,10,__newcontextvar1)),write(__X),null,'_$_$_ergo''rule_enabled'(10,'mix.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(12,'mix.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,13,FLORA_THIS_WORKSPACE(d^nontblflapply)(writelist,[__X1,__X2|__Xs],'_$ctxt'(_CallerModuleVar,12,__newcontextvar1)),','(write(__X1),','(write(','),FLORA_THIS_WORKSPACE(d^nontblflapply)(writelist,[__X2|__Xs],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,12)))),null,'_$_$_ergo''rule_enabled'(12,'mix.flr',FLORA_THIS_MODULE_NAME),null,true)).


%%%%%%%%%%%%%%%%%%%%%%%%% Signatures for latent queries %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%% Queries found in the source file %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^nontblflapply)(show,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[=('?X',__X)])).

 
#if !defined(FLORA_FLS2_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLS2_FILENAME  'mix.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('mix.ergo',FLORA_THIS_MODULE_NAME))).

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

