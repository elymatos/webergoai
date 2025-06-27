
:-(compiler_options([xpp_on,canonical])).

/********** Tabling and Trailer Control Variables ************/

#define EQUALITYbasic
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
#define FLORA_THIS_FILENAME  'benchmark.ergo'
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
#define FLORA_FDB_FILENAME  'benchmark.fdb'
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
#define FLORA_FLM_FILENAME  'benchmark.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(benchmark,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'benchmark.fld'
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
#define FLORA_FLS_FILENAME  'benchmark.fls'
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

:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(d,__X,__Y),from,__X,'_$ctxt'(_CallerModuleVar,4,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(4,'benchmark.flr',FLORA_THIS_MODULE_NAME),','(','(','(FLORA_THIS_WORKSPACE(d^mvd)(__X,l,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,4)),FLORA_THIS_WORKSPACE(d^isa)(__X,station,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,4))),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__Y,l,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,4)),FLORA_THIS_WORKSPACE(d^isa)(__Y,station,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,4))),\=(__X,__Y))),fllibexecute_delayed_calls([__L,__X,__Y],[__X,__Y])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(d,__X,__Y),to,__Y,'_$ctxt'(_CallerModuleVar,4,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(4,'benchmark.flr',FLORA_THIS_MODULE_NAME),','(','(','(FLORA_THIS_WORKSPACE(d^mvd)(__X,l,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,4)),FLORA_THIS_WORKSPACE(d^isa)(__X,station,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,4))),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__Y,l,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,4)),FLORA_THIS_WORKSPACE(d^isa)(__Y,station,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,4))),\=(__X,__Y))),fllibexecute_delayed_calls([__L,__X,__Y],[__X,__Y])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(d,__X,__Y),l,__L,'_$ctxt'(_CallerModuleVar,4,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(4,'benchmark.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__X,l,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,4)),FLORA_THIS_WORKSPACE(d^isa)(__X,station,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,4))),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__Y,l,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,4)),FLORA_THIS_WORKSPACE(d^isa)(__Y,station,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,4))),\=(__X,__Y))))).
:-(FLORA_THIS_WORKSPACE(static^isa)(flapply(d,__X,__Y),direct,'_$ctxt'(_CallerModuleVar,4,__newcontextvar4)),','('_$_$_ergo''rule_enabled'(4,'benchmark.flr',FLORA_THIS_MODULE_NAME),','(','(','(FLORA_THIS_WORKSPACE(d^mvd)(__X,l,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,4)),FLORA_THIS_WORKSPACE(d^isa)(__X,station,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,4))),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__Y,l,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,4)),FLORA_THIS_WORKSPACE(d^isa)(__Y,station,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,4))),\=(__X,__Y))),fllibexecute_delayed_calls([__L,__X,__Y],[__X,__Y])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(direct_connection,__X,__Y,'_$ctxt'(_CallerModuleVar,6,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(6,'benchmark.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(direct_connection,__X,__Y,___L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,6)),fllibexecute_delayed_calls([__X,__Y,___L],[__X,__Y])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(direct_connection,__X,__Y,__L,'_$ctxt'(_CallerModuleVar,8,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(8,'benchmark.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(one_stop,__X,__Y,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,8)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(direct_connection,__X,__Y,__L,'_$ctxt'(_CallerModuleVar,10,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(10,'benchmark.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(one_stop,__X,__Z,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,10)),FLORA_THIS_WORKSPACE(d^tblflapply)(direct_connection,__Z,__Y,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,10))),fllibexecute_delayed_calls([__L,__X,__Y,__Z],[__L,__X,__Y])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(one_stop,__X,__Y,__L,'_$ctxt'(_CallerModuleVar,12,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(12,'benchmark.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(direct_connection,__X,__Y,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,12)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(one_stop,__X,__Y,__L,'_$ctxt'(_CallerModuleVar,14,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(14,'benchmark.flr',FLORA_THIS_MODULE_NAME),','(','(','(','(FLORA_THIS_WORKSPACE(d^mvd)(__X,y,__I,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,14)),FLORA_THIS_WORKSPACE(d^mvd)(__X,l,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,14))),FLORA_THIS_WORKSPACE(d^isa)(__X,station,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,14))),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__Y,x,__I,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,14)),FLORA_THIS_WORKSPACE(d^mvd)(__Y,l,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,14))),FLORA_THIS_WORKSPACE(d^isa)(__Y,station,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,14)))),fllibexecute_delayed_calls([__I,__L,__X,__Y],[__L,__X,__Y])))).
:-(FLORA_THIS_WORKSPACE(static^isa)(__L,line,'_$ctxt'(_CallerModuleVar,16,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(16,'benchmark.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^mvd)(___X,l,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,16)),FLORA_THIS_WORKSPACE(d^isa)(___X,station,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,16))),fllibexecute_delayed_calls([__L,___X],[__L])))).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rule signatures %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibinsrulesig(4,'benchmark.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,115,FLORA_THIS_WORKSPACE(d^mvd)(flapply(d,__X,__Y),from,__X,'_$ctxt'(_CallerModuleVar,4,__newcontextvar1)),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__X,l,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,4)),FLORA_THIS_WORKSPACE(d^isa)(__X,station,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,4))),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__Y,l,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,4)),FLORA_THIS_WORKSPACE(d^isa)(__Y,station,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,4))),\=(__X,__Y))),null,'_$_$_ergo''rule_enabled'(4,'benchmark.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__L,__X,__Y],[__X,__Y]),true)).
?-(fllibinsrulesig(4,'benchmark.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,115,FLORA_THIS_WORKSPACE(d^mvd)(flapply(d,__X,__Y),to,__Y,'_$ctxt'(_CallerModuleVar,4,__newcontextvar2)),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__X,l,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,4)),FLORA_THIS_WORKSPACE(d^isa)(__X,station,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,4))),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__Y,l,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,4)),FLORA_THIS_WORKSPACE(d^isa)(__Y,station,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,4))),\=(__X,__Y))),null,'_$_$_ergo''rule_enabled'(4,'benchmark.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__L,__X,__Y],[__X,__Y]),true)).
?-(fllibinsrulesig(4,'benchmark.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,115,FLORA_THIS_WORKSPACE(d^mvd)(flapply(d,__X,__Y),l,__L,'_$ctxt'(_CallerModuleVar,4,__newcontextvar3)),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__X,l,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,4)),FLORA_THIS_WORKSPACE(d^isa)(__X,station,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,4))),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__Y,l,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,4)),FLORA_THIS_WORKSPACE(d^isa)(__Y,station,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,4))),\=(__X,__Y))),null,'_$_$_ergo''rule_enabled'(4,'benchmark.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(4,'benchmark.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,115,FLORA_THIS_WORKSPACE(d^isa)(flapply(d,__X,__Y),direct,'_$ctxt'(_CallerModuleVar,4,__newcontextvar4)),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__X,l,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,4)),FLORA_THIS_WORKSPACE(d^isa)(__X,station,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,4))),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__Y,l,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,4)),FLORA_THIS_WORKSPACE(d^isa)(__Y,station,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,4))),\=(__X,__Y))),null,'_$_$_ergo''rule_enabled'(4,'benchmark.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__L,__X,__Y],[__X,__Y]),true)).
?-(fllibinsrulesig(6,'benchmark.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,117,FLORA_THIS_WORKSPACE(d^tblflapply)(direct_connection,__X,__Y,'_$ctxt'(_CallerModuleVar,6,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(direct_connection,__X,__Y,___L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,6)),null,'_$_$_ergo''rule_enabled'(6,'benchmark.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__X,__Y,___L],[__X,__Y]),true)).
?-(fllibinsrulesig(8,'benchmark.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,118,FLORA_THIS_WORKSPACE(d^tblflapply)(direct_connection,__X,__Y,__L,'_$ctxt'(_CallerModuleVar,8,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(one_stop,__X,__Y,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,8)),null,'_$_$_ergo''rule_enabled'(8,'benchmark.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(10,'benchmark.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,119,FLORA_THIS_WORKSPACE(d^tblflapply)(direct_connection,__X,__Y,__L,'_$ctxt'(_CallerModuleVar,10,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(one_stop,__X,__Z,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,10)),FLORA_THIS_WORKSPACE(d^tblflapply)(direct_connection,__Z,__Y,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,10))),null,'_$_$_ergo''rule_enabled'(10,'benchmark.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__L,__X,__Y,__Z],[__L,__X,__Y]),true)).
?-(fllibinsrulesig(12,'benchmark.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,120,FLORA_THIS_WORKSPACE(d^tblflapply)(one_stop,__X,__Y,__L,'_$ctxt'(_CallerModuleVar,12,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(direct_connection,__X,__Y,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,12)),null,'_$_$_ergo''rule_enabled'(12,'benchmark.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(14,'benchmark.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,121,FLORA_THIS_WORKSPACE(d^tblflapply)(one_stop,__X,__Y,__L,'_$ctxt'(_CallerModuleVar,14,__newcontextvar1)),','(','(','(FLORA_THIS_WORKSPACE(d^mvd)(__X,y,__I,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,14)),FLORA_THIS_WORKSPACE(d^mvd)(__X,l,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,14))),FLORA_THIS_WORKSPACE(d^isa)(__X,station,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,14))),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__Y,x,__I,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,14)),FLORA_THIS_WORKSPACE(d^mvd)(__Y,l,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,14))),FLORA_THIS_WORKSPACE(d^isa)(__Y,station,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,14)))),null,'_$_$_ergo''rule_enabled'(14,'benchmark.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__I,__L,__X,__Y],[__L,__X,__Y]),true)).
?-(fllibinsrulesig(16,'benchmark.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,122,FLORA_THIS_WORKSPACE(d^isa)(__L,line,'_$ctxt'(_CallerModuleVar,16,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^mvd)(___X,l,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,16)),FLORA_THIS_WORKSPACE(d^isa)(___X,station,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,16))),null,'_$_$_ergo''rule_enabled'(16,'benchmark.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__L,___X],[__L]),true)).


%%%%%%%%%%%%%%%%%%%%%%%%% Signatures for latent queries %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%% Queries found in the source file %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^isa)(__C,connection,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[=('?C',__C)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(direct_connection,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[=('?X',__X),=('?Y',__Y)])).

 
#if !defined(FLORA_FLS2_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLS2_FILENAME  'benchmark.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('benchmark.ergo',FLORA_THIS_MODULE_NAME))).

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

