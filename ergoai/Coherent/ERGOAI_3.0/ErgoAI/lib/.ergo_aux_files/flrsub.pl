
:-(compiler_options([xpp_on,canonical])).

/********** Tabling and Trailer Control Variables ************/

#define EQUALITYnone
#define INHERITANCEflogic
#define TABLINGreactive
#define TABLINGvariant
#define CUSTOMnone

#define FLORA_INCREMENTAL_TABLING 

#define FLORA_NONTABLED_MODULE

#define FLORA_NONTABLED_DATA_MODULE

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

#define FLORA_COMPILATION_ID 7

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
#define FLORA_THIS_FILENAME  'flrsub.ergo'
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
  file: syslibinc/flrexport_inc.flh

  Author(s): Vishal Chowdhary

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/
:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBEXPORT))).


/***********************************************************************/


/************************************************************************
  file: syslibinc/flrdynmod_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBDYNMOD))).

/***********************************************************************/

:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(immediate_isa_plg)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(immediate_isa_plg)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(immediate_isa_plg)(_h137256,_h137258,_h137260,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(immediate_isa_plg))(_h137256,_h137258,_h137260,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(immediate_sub_plg)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(immediate_sub_plg)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(immediate_sub_plg)(_h137988,_h137990,_h137992,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(immediate_sub_plg))(_h137988,_h137990,_h137992,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(intermediate_isa_plg)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(intermediate_isa_plg)),4)),FLORA_FLEX_DYNAMIC_TYPE_CLAUSE))).
:-(FLORA_THIS_WORKSPACE(intermediate_isa_plg)(_h138720,_h138722,_h138724,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(intermediate_isa_plg))(_h138720,_h138722,_h138724,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(intermediate_sub_plg)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(intermediate_sub_plg)),4)),FLORA_FLEX_DYNAMIC_TYPE_CLAUSE))).
:-(FLORA_THIS_WORKSPACE(intermediate_sub_plg)(_h139500,_h139502,_h139504,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(intermediate_sub_plg))(_h139500,_h139502,_h139504,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(isa_plg)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(isa_plg)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(isa_plg)(_h140280,_h140282,_h140284,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(isa_plg))(_h140280,_h140282,_h140284,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(sub_plg)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(sub_plg)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(sub_plg)(_h140852,_h140854,_h140856,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(sub_plg))(_h140852,_h140854,_h140856,FWContext)).
 
#if !defined(FLORA_FDB_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FDB_FILENAME  'flrsub.fdb'
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
#define FLORA_FLM_FILENAME  'flrsub.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(flrsub,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'flrsub.fld'
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
#define FLORA_FLS_FILENAME  'flrsub.fls'
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

:-(fllibexport([[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(sub,__newdontcarevar1,__newdontcarevar2,__newdontcarevar3,__newcontextvar6))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(sub,__newdontcarevar7,__newdontcarevar8,__newcontextvar11))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(immediate_sub,__newdontcarevar12,__newdontcarevar13,__newdontcarevar14,__newcontextvar17))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(immediate_sub,__newdontcarevar18,__newdontcarevar19,__newcontextvar22))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(isa,__newdontcarevar23,__newdontcarevar24,__newdontcarevar25,__newcontextvar28))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(isa,__newdontcarevar29,__newdontcarevar30,__newcontextvar33))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(immediate_isa,__newdontcarevar34,__newdontcarevar35,__newdontcarevar36,__newcontextvar39))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(immediate_isa,__newdontcarevar40,__newdontcarevar41,__newcontextvar44))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(ensure_loaded,__newcontextvar47))]])).
?-(:(flrprolog,flora_define_modular_prolog([prolog(sub_plg,3,FLORA_THIS_MODULE_NAME),prolog(immediate_sub_plg,3,FLORA_THIS_MODULE_NAME),prolog(isa_plg,3,FLORA_THIS_MODULE_NAME),prolog(immediate_isa_plg,3,FLORA_THIS_MODULE_NAME)]))).
:-(table(as(','(/(FLORA_THIS_WORKSPACE(intermediate_sub_plg),4),/(FLORA_THIS_WORKSPACE(intermediate_isa_plg),4)),AUXILIARY_TABLING_TYPE))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(intermediate_sub_plg,3,FLORA_THIS_MODULE_NAME),prolog(intermediate_isa_plg,3,FLORA_THIS_MODULE_NAME)]))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(sub,__X,__Y,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(4,'flrsub.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__M),','(!,FLORA_THIS_WORKSPACE(sub_plg)(__X,__Y,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))),fllibexecute_delayed_calls([__M,__X,__Y],[__X,__Y])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(sub,__X,__Y,__Z,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(6,'flrsub.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(sub_plg)(__X,__Y,__Z,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(isa,__X,__Y,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(8,'flrsub.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__M),','(!,FLORA_THIS_WORKSPACE(isa_plg)(__X,__Y,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))),fllibexecute_delayed_calls([__M,__X,__Y],[__X,__Y])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(isa,__X,__Y,__Z,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(10,'flrsub.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(isa_plg)(__X,__Y,__Z,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(immediate_sub,__X,__Y,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(12,'flrsub.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__M),','(!,FLORA_THIS_WORKSPACE(immediate_sub_plg)(__X,__Y,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))),fllibexecute_delayed_calls([__M,__X,__Y],[__X,__Y])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(immediate_sub,__X,__Y,__Z,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(14,'flrsub.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(immediate_sub_plg)(__X,__Y,__Z,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(immediate_isa,__X,__Y,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(16,'flrsub.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__M),','(!,FLORA_THIS_WORKSPACE(immediate_isa_plg)(__X,__Y,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))),fllibexecute_delayed_calls([__M,__X,__Y],[__X,__Y])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(immediate_isa,__X,__Y,__Z,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(18,'flrsub.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(immediate_isa_plg)(__X,__Y,__Z,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(sub_plg)(__A,__B,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(20,'flrsub.flr',FLORA_THIS_MODULE_NAME),','(fllibmodlit('d^sub',[__A,__B,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(\+(:(flrdatatype,flora_builtin_class(__B))),','(:(usermod,atomic(__A)),:(usermod,atomic(__B))))))).
:-(FLORA_THIS_WORKSPACE(immediate_sub_plg)(__A,__B,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(22,'flrsub.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(sub_plg)(__A,__B,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(intermediate_sub_plg)(__A,__B,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__A,__B,__Mod],[]))),[__A,__B,__Mod],105,'flrsub.flr'))))).
:-(FLORA_THIS_WORKSPACE(intermediate_sub_plg)(__A,__B,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(24,'flrsub.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(sub_plg)(__A,__C,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(sub_plg)(__C,__B,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(\=(__C,__B),\=(__C,__A)))),fllibexecute_delayed_calls([__A,__B,__C,__Mod],[__A,__B,__Mod])))).
:-(FLORA_THIS_WORKSPACE(isa_plg)(__A,__B,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(26,'flrsub.flr',FLORA_THIS_MODULE_NAME),','(fllibmodlit('d^isa',[__A,__B,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(\+(:(flrdatatype,flora_builtin_class(__B))),','(:(usermod,atomic(__A)),:(usermod,atomic(__B))))))).
:-(FLORA_THIS_WORKSPACE(immediate_isa_plg)(__A,__B,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(28,'flrsub.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(isa_plg)(__A,__B,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(intermediate_isa_plg)(__A,__B,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__A,__B,__Mod],[]))),[__A,__B,__Mod],122,'flrsub.flr'))))).
:-(FLORA_THIS_WORKSPACE(intermediate_isa_plg)(__A,__B,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(30,'flrsub.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(isa_plg)(__A,__C,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(sub_plg)(__C,__B,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(\=(__C,__B),\=(__C,__A)))),fllibexecute_delayed_calls([__A,__B,__C,__Mod],[__A,__B,__Mod])))).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rule signatures %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%% Signatures for latent queries %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%% Queries found in the source file %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


 
#if !defined(FLORA_FLS2_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLS2_FILENAME  'flrsub.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('flrsub.ergo',FLORA_THIS_MODULE_NAME))).

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

:-(FLORA_THIS_WORKSPACE(immediate_isa_plg)(_h160021,_h160023,_h160025,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(immediate_isa_plg))(_h160021,_h160023,_h160025,FWContext)).
:-(FLORA_THIS_WORKSPACE(immediate_sub_plg)(_h160748,_h160750,_h160752,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(immediate_sub_plg))(_h160748,_h160750,_h160752,FWContext)).
:-(FLORA_THIS_WORKSPACE(intermediate_isa_plg)(_h161475,_h161477,_h161479,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(intermediate_isa_plg))(_h161475,_h161477,_h161479,FWContext)).
:-(FLORA_THIS_WORKSPACE(intermediate_sub_plg)(_h162250,_h162252,_h162254,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(intermediate_sub_plg))(_h162250,_h162252,_h162254,FWContext)).
:-(FLORA_THIS_WORKSPACE(isa_plg)(_h163025,_h163027,_h163029,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(isa_plg))(_h163025,_h163027,_h163029,FWContext)).
:-(FLORA_THIS_WORKSPACE(sub_plg)(_h163592,_h163594,_h163596,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(sub_plg))(_h163592,_h163594,_h163596,FWContext)).
