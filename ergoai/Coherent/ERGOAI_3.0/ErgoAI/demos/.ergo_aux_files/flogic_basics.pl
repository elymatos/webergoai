
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

#define FLORA_COMPILATION_ID 3

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
#define FLORA_THIS_FILENAME  'flogic_basics.ergo'
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
#define FLORA_FDB_FILENAME  'flogic_basics.fdb'
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
#define FLORA_FLM_FILENAME  'flogic_basics.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(flogic_basics,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'flogic_basics.fld'
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
#define FLORA_FLS_FILENAME  'flogic_basics.fls'
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

:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tc,__X,__Y,'_$ctxt'(_CallerModuleVar,4,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(4,'flogic_basics.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^nontblflapply)(e,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,4)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tc,__X,__Y,'_$ctxt'(_CallerModuleVar,6,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(6,'flogic_basics.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(tc,__X,__Z,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,6)),FLORA_THIS_WORKSPACE(d^tblflapply)(tc,__Z,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,6))),fllibexecute_delayed_calls([__X,__Y,__Z],[__X,__Y])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(person,instances,__X,'_$ctxt'(_CallerModuleVar,8,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(8,'flogic_basics.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^isa)(__X,person,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,8)))).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rule signatures %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibinsrulesig(4,'flogic_basics.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,10,FLORA_THIS_WORKSPACE(d^tblflapply)(tc,__X,__Y,'_$ctxt'(_CallerModuleVar,4,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^nontblflapply)(e,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,4)),null,'_$_$_ergo''rule_enabled'(4,'flogic_basics.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(6,'flogic_basics.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,11,FLORA_THIS_WORKSPACE(d^tblflapply)(tc,__X,__Y,'_$ctxt'(_CallerModuleVar,6,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(tc,__X,__Z,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,6)),FLORA_THIS_WORKSPACE(d^tblflapply)(tc,__Z,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,6))),null,'_$_$_ergo''rule_enabled'(6,'flogic_basics.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__X,__Y,__Z],[__X,__Y]),true)).
?-(fllibinsrulesig(8,'flogic_basics.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,27,FLORA_THIS_WORKSPACE(d^mvd)(person,instances,__X,'_$ctxt'(_CallerModuleVar,8,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^isa)(__X,person,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,8)),null,'_$_$_ergo''rule_enabled'(8,'flogic_basics.flr',FLORA_THIS_MODULE_NAME),null,true)).


%%%%%%%%%%%%%%%%%%%%%%%%% Signatures for latent queries %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%% Queries found in the source file %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^nontblflapply)(time_flies_like_an_arrow,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^exists)(fruit_flies_like_a_banana,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(tc,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[=('?X',__X),=('?Y',__Y)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^isa)(__X,person,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[=('?X',__X)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^mvd)(person,instances,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[=('?X',__X)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^mvd)(__X,believes_in,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[=('?X',__X),=('?Y',__Y)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^mvd)(__X,kids,__newquantvar1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar2)),','(FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar1,self,__K,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar1,hobbies,__H,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar8)),FLORA_THIS_WORKSPACE(d^isa)(__H,dangerous_hobby,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar6)))))),[=('?X',__X),=('?K',__K),=('?H',__H)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),writeln('Thanks for using FLORA!')),[])).

 
#if !defined(FLORA_FLS2_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLS2_FILENAME  'flogic_basics.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('flogic_basics.ergo',FLORA_THIS_MODULE_NAME))).

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

