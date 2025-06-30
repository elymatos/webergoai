
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

#define FLORA_COMPILATION_ID 4

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
#define FLORA_THIS_FILENAME  'flrsystem.ergo'
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

/************************************************************************
  file: libinc/flrio_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(':'(flrlibman,flora_load_system_module(FLSYSMODIO))).

/***********************************************************************/

:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(system_ignore_undefined_errors)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(system_ignore_undefined_errors)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(system_ignore_undefined_errors)(_h535156,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(system_ignore_undefined_errors))(_h535156,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(system_turn_off_debug)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(system_turn_off_debug)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(system_turn_off_debug)(_h536088,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(system_turn_off_debug))(_h536088,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(system_turn_off_debug_all)),1),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(system_turn_off_debug_all)),1)),opaque))).
:-(FLORA_THIS_WORKSPACE(system_turn_off_debug_all)(FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(system_turn_off_debug_all))(FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(system_turn_on_debug)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(system_turn_on_debug)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(system_turn_on_debug)(_h537724,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(system_turn_on_debug))(_h537724,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(system_turn_on_debug_all)),1),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(system_turn_on_debug_all)),1)),opaque))).
:-(FLORA_THIS_WORKSPACE(system_turn_on_debug_all)(FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(system_turn_on_debug_all))(FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(turn_debug_off_for_call)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(turn_debug_off_for_call)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(turn_debug_off_for_call)(_h539328,_h539330,_h539332,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(turn_debug_off_for_call))(_h539328,_h539330,_h539332,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(turn_off_debug_list)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(turn_off_debug_list)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(turn_off_debug_list)(_h540156,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(turn_off_debug_list))(_h540156,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(turn_on_debug_list)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(turn_on_debug_list)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(turn_on_debug_list)(_h540912,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(turn_on_debug_list))(_h540912,FWContext)).
 
#if !defined(FLORA_FLM_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLM_FILENAME  'flrsystem.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(flrsystem,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'flrsystem.fld'
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
#define FLORA_FLS_FILENAME  'flrsystem.fls'
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

?-(:(flrprolog,flora_define_modular_prolog([prolog(system_turn_on_debug,1,FLORA_THIS_MODULE_NAME),prolog(system_turn_off_debug,1,FLORA_THIS_MODULE_NAME),prolog(system_turn_on_debug_all,0,FLORA_THIS_MODULE_NAME),prolog(system_turn_off_debug_all,0,FLORA_THIS_MODULE_NAME),prolog(system_ignore_undefined_errors,1,FLORA_THIS_MODULE_NAME),prolog(turn_on_debug_list,1,FLORA_THIS_MODULE_NAME),prolog(turn_off_debug_list,1,FLORA_THIS_MODULE_NAME),prolog(turn_debug_off_for_call,3,FLORA_THIS_MODULE_NAME)]))).
:-(fllibexport([[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar1,flapply(add,__newdontcarevar2),__newcontextvar5))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar6,flapply(remove,__newdontcarevar7),__newcontextvar10))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar11,flapply(removeall,__newdontcarevar12),__newcontextvar15))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar16,flapply(query,__newdontcarevar17),__newcontextvar20))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar21,abolish,__newcontextvar24))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar25,refresh,__newcontextvar28))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(sysabort,__newdontcarevar29,__newcontextvar32))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(abort,__newdontcarevar33,__newcontextvar36))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(abort,__newcontextvar39))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(warning,__newdontcarevar40,__newcontextvar43))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(message,__newdontcarevar44,__newcontextvar47))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar48,type,__newdontcarevar49,__newcontextvar52))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar53,uninstall,__newcontextvar56))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar57,flapply(mustDefine,__newdontcarevar58),__newcontextvar61))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar62,flapply(mustDefine,__newdontcarevar63,__newdontcarevar64),__newcontextvar67))]])).
:-(FLORA_THIS_WORKSPACE(static^meth)('Libpath',flapply(add,__Path),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(4,'flrsystem.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrporting,flora_file_op(expand,__Path,__ExpandedPath)),';'(','(:(flrporting,flora_module_path_get(__ExpandedPath)),!),:(flrporting,flora_module_path_add(__ExpandedPath)))),fllibexecute_delayed_calls([__ExpandedPath,__Path],[__Path])))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Libpath',flapply(remove,__Path),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(6,'flrsystem.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrporting,flora_file_op(expand,__Path,__ExpandedPath)),:(flrporting,flora_module_path_remove(__ExpandedPath))),fllibexecute_delayed_calls([__ExpandedPath,__Path],[__Path])))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Libpath',flapply(removeall,__Path),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(8,'flrsystem.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrporting,flora_file_op(expand,__Path,__ExpandedPath)),:(flrporting,flora_module_path_removeall(__ExpandedPath))),fllibexecute_delayed_calls([__ExpandedPath,__Path],[__Path])))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Libpath',flapply(query,__Path),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(10,'flrsystem.flr',FLORA_THIS_MODULE_NAME),','(','(atom(__Path),','(!,','(:(flrporting,flora_file_op(expand,__Path,__ExpandedPath)),:(flrporting,flora_module_path_get(__ExpandedPath))))),fllibexecute_delayed_calls([__ExpandedPath,__Path],[__Path])))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Libpath',flapply(query,__Path),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(12,'flrsystem.flr',FLORA_THIS_MODULE_NAME),','(:(flrdatatype,flora_is_var_prim(__Path)),','(!,:(flrporting,flora_module_path_get(__Path)))))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Libpath',flapply(query,___Path),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(14,'flrsystem.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(sysabort,'Libpath[query(Path)]@ ys: argument must be an atomic string or variable','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Tables',abolish,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(16,'flrsystem.flr',FLORA_THIS_MODULE_NAME),:(flrtables,flora_abolish_nonincremental_tables_with_skip))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Tables',refresh,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(18,'flrsystem.flr',FLORA_THIS_MODULE_NAME),:(flrtables,flora_abolish_nonincremental_tables_with_skip))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(abort,__X,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(20,'flrsystem.flr',FLORA_THIS_MODULE_NAME),','(','(flora_plg2hlg(__PX,__X,flapply,1),:(flrporting,flora_abort(__PX,'_$ergo:user_abort'))),fllibexecute_delayed_calls([__PX,__X],[__X])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(abort,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(22,'flrsystem.flr',FLORA_THIS_MODULE_NAME),:(flrporting,flora_abort('','_$ergo:user_abort')))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(sysabort,__X,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(24,'flrsystem.flr',FLORA_THIS_MODULE_NAME),','(','(flora_plg2hlg(__PX,__X,flapply,1),:(flrporting,flora_abort(__PX,'_$ergo:abort_notrace'))),fllibexecute_delayed_calls([__PX,__X],[__X])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(warning,__X,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(26,'flrsystem.flr',FLORA_THIS_MODULE_NAME),','(','(flora_plg2hlg(__PX,__X,flapply,1),','(:(flrprint,flora_warning_heading),','(:(standard,message(__PX,3)),:(flrprint,flora_stderr_nl)))),fllibexecute_delayed_calls([__PX,__X],[__X])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(message,__X,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(28,'flrsystem.flr',FLORA_THIS_MODULE_NAME),','(','(flora_plg2hlg(__PX,__X,flapply,1),','(:(standard,message(__PX,2)),:(flrprint,flora_stderr_nl))),fllibexecute_delayed_calls([__PX,__X],[__X])))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Method',flapply(mustDefine,__Flag),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(30,'flrsystem.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrdatatype,flora_is_var_prim(__Flag)),','(!,';'(','(:(flrregistry,flora_in_debug_mode(__newdontcarevar3)),','(=(__Flag,on),!)),=(__Flag,off)))),fllibexecute_delayed_calls([__Flag,__newdontcarevar4],[__Flag])))).
:-(FLORA_THIS_WORKSPACE(system_turn_on_debug_all)('_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(32,'flrsystem.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^meth)('Method',flapply(mustDefine,on),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Method',flapply(mustDefine,on),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(34,'flrsystem.flr',FLORA_THIS_MODULE_NAME),','(','(!,';'(','(:(flrregistry,flora_in_debug_mode(__newdontcarevar3)),!),','(assert(:(flrregistry,flora_in_debug_mode(1))),','(','(fllibsetof(__newdontcarevar4,[],[],','(','(:(flora2,'\\isloaded'(__newdontcarevar4)),\+(:(flrregistry,flora_debug_module_registry(__newdontcarevar4)))),fllibexecute_delayed_calls([__newdontcarevar4],[])),__newvar5),=(__ML,__newvar5)),FLORA_THIS_WORKSPACE(turn_on_debug_list)(__ML,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)))))),fllibexecute_delayed_calls([__ML,__newdontcarevar8],[])))).
:-(FLORA_THIS_WORKSPACE(system_turn_off_debug_all)('_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(36,'flrsystem.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^meth)('Method',flapply(mustDefine,off),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Method',flapply(mustDefine,off),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(38,'flrsystem.flr',FLORA_THIS_MODULE_NAME),','(','(!,','(retractall(:(flrregistry,flora_in_debug_mode(__newdontcarevar3))),','(','(fllibsetof(__newdontcarevar4,[],[],','(:(flrregistry,flora_debug_module_registry(__newdontcarevar4)),fllibexecute_delayed_calls([__newdontcarevar4],[])),__newvar5),=(__ML,__newvar5)),FLORA_THIS_WORKSPACE(turn_off_debug_list)(__ML,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7))))),fllibexecute_delayed_calls([__ML,__newdontcarevar8],[])))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Method',flapply(mustDefine,flapply(__Flag,__Module)),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(40,'flrsystem.flr',FLORA_THIS_MODULE_NAME),';'(','(:(flrdatatype,flora_is_var_prim(__Module)),FLORA_THIS_WORKSPACE(d^tblflapply)(sysabort,['invalid module name in Method[mustDefine(',__Flag,'(',__Module,'))]@\\system'],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),','(\+(:(flrwrapper,flora_is_system_module_name(__Module))),','(\+(:(flora2,'\\isloaded'(__Module))),FLORA_THIS_WORKSPACE(d^tblflapply)(sysabort,['non-loaded module used in Method[mustDefine(',__Flag,'(',__Module,'))]@\\system'],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Method',flapply(mustDefine,flapply(__Flag,__Module)),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(42,'flrsystem.flr',FLORA_THIS_MODULE_NAME),','(:(flrdatatype,flora_is_var_prim(__Flag)),','(!,','(';'(','(:(flrwrapper,flora_is_system_module_name(__Module)),';'(->(:(flora2,'\\isloaded'(__Module)),'\\true'),:(flrlibman,flora_load_system_module(__Module)))),\+(:(flrwrapper,flora_is_system_module_name(__Module)))),';'(','(:(flrregistry,flora_debug_module_registry(__Module)),','(=(__Flag,on),!)),=(__Flag,off))))))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Method',flapply(mustDefine,flapply(on,__Module)),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(44,'flrsystem.flr',FLORA_THIS_MODULE_NAME),','(!,','(';'(','(:(flrwrapper,flora_is_system_module_name(__Module)),';'(->(:(flora2,'\\isloaded'(__Module)),'\\true'),:(flrlibman,flora_load_system_module(__Module)))),\+(:(flrwrapper,flora_is_system_module_name(__Module)))),';'(','(:(flrregistry,flora_debug_module_registry(__Module)),!),FLORA_THIS_WORKSPACE(system_turn_on_debug)(__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Method',flapply(mustDefine,flapply(off,__Module)),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(46,'flrsystem.flr',FLORA_THIS_MODULE_NAME),','(!,','(';'(','(:(flrwrapper,flora_is_system_module_name(__Module)),';'(->(:(flora2,'\\isloaded'(__Module)),'\\true'),:(flrlibman,flora_load_system_module(__Module)))),\+(:(flrwrapper,flora_is_system_module_name(__Module)))),';'(','(\+(:(flrregistry,flora_debug_module_registry(__Module))),!),FLORA_THIS_WORKSPACE(system_turn_off_debug)(__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Method',flapply(mustDefine,flapply(__Flag,__Module)),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(48,'flrsystem.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(sysabort,['invalid option in Method[mustDefine(',__Flag,'(',__Module,'))]'],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(turn_on_debug_list)([],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(50,'flrsystem.flr',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(turn_on_debug_list)([__H|__L],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(52,'flrsystem.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(system_turn_on_debug)(__H,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(turn_on_debug_list)(__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))).
:-(FLORA_THIS_WORKSPACE(system_turn_on_debug)(__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(54,'flrsystem.flr',FLORA_THIS_MODULE_NAME),assert(:(flrregistry,flora_debug_module_registry(__Module))))).
:-(FLORA_THIS_WORKSPACE(turn_off_debug_list)([],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(56,'flrsystem.flr',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(turn_off_debug_list)([__H|__L],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(58,'flrsystem.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(system_turn_off_debug)(__H,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(turn_off_debug_list)(__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))).
:-(FLORA_THIS_WORKSPACE(system_turn_off_debug)(__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(60,'flrsystem.flr',FLORA_THIS_MODULE_NAME),retractall(:(flrregistry,flora_debug_module_registry(__Module))))).
:-(FLORA_THIS_WORKSPACE(system_ignore_undefined_errors)(__Pred,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(62,'flrsystem.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^meth)('Method',flapply(mustDefine,off,__Pred),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Method',flapply(mustDefine,__Mode,__Pred),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(64,'flrsystem.flr',FLORA_THIS_MODULE_NAME),','(\==(__Mode,off),FLORA_THIS_WORKSPACE(d^tblflapply)(sysabort,['invalid mode in Method[mustDefine(',__Mode,__Pred,')]@\\system'],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Method',flapply(mustDefine,off,__Pred),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(66,'flrsystem.flr',FLORA_THIS_MODULE_NAME),','(fllibexecute_delayed_calls([__Pred,__Pred],[]),','(:(flrdatatype,flora_is_var_prim(__Pred)),FLORA_THIS_WORKSPACE(d^tblflapply)(sysabort,['invalid second argument (variable) in Method[mustDefine(off,',__Pred,')]@\\system'],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Method',flapply(mustDefine,off,','(__Pred1,__Pred2)),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(68,'flrsystem.flr',FLORA_THIS_MODULE_NAME),','(fllibexecute_delayed_calls([__Pred1,__Pred2],[]),','(!,','(FLORA_THIS_WORKSPACE(d^meth)('Method',flapply(mustDefine,off,__Pred1),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^meth)('Method',flapply(mustDefine,off,__Pred2),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Method',flapply(mustDefine,off,__Pred),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(70,'flrsystem.flr',FLORA_THIS_MODULE_NAME),','(','(fllibexecute_delayed_calls([__Pred,__Pred,__newdontcarevar3,__newdontcarevar4,__newdontcarevar5,__newdontcarevar6,__newdontcarevar7,__newdontcarevar8,__Pred,__newdontcarevar9,__newdontcarevar10,__newdontcarevar11,__newdontcarevar12,__Pred],[]),','(\+(:(flrwrapper,is_flora_callable_literal(__Pred))),','(\=(__Pred,fllibmodobj(__newdontcarevar13,__newdontcarevar14,__newdontcarevar15,__newdontcarevar16,__newdontcarevar17,__newdontcarevar18)),','(\=(__Pred,fllibmodlit(__newdontcarevar19,__newdontcarevar20,__newdontcarevar21,__newdontcarevar22)),FLORA_THIS_WORKSPACE(d^tblflapply)(sysabort,['invalid second argument (not atomic formula) in Method[mustDefine(off,',__Pred,')]@\\system'],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar23,__newcontextvar24)))))),fllibexecute_delayed_calls([__Pred,__newdontcarevar25],[__Pred])))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Method',flapply(mustDefine,off,__Pred),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(72,'flrsystem.flr',FLORA_THIS_MODULE_NAME),','(','(fllibexecute_delayed_calls([__Pred,__Wrap,__Args,__Mod,__Callable,__TFlag,__Mod,__Mod,__Pred,__Wrap,__Args,__Mod,__Callable,__TFlag,__Pred,__Mod,__Callable,__Pred,__Mod,__Callable],[]),','(:(flrcanon,get_canonical_form(__Pred,canon(__Wrap,__Args,__Mod,__Callable,__TFlag))),';'(','(:(flrdatatype,flora_is_var_prim(__Mod)),','(!,';'(','(:(flora2,'\\isloaded'(__Mod)),','(:(flrcanon,get_canonical_form(__Pred,canon(__Wrap,__Args,__Mod,__Callable,__TFlag))),','(FLORA_THIS_WORKSPACE(turn_debug_off_for_call)(__Pred,__Mod,__Callable,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),'\\false'))),'\\true'))),FLORA_THIS_WORKSPACE(turn_debug_off_for_call)(__Pred,__Mod,__Callable,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))),fllibexecute_delayed_calls([__Args,__Callable,__Mod,__Pred,__TFlag,__Wrap],[__Pred])))).
:-(FLORA_THIS_WORKSPACE(turn_debug_off_for_call)(__Pred,__newdontcarevar1,__Callable,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(74,'flrsystem.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrdatatype,flora_is_var_prim(__Callable)),','(!,','(:(flrdecode,flora_decode_goal_as_atom(__Pred,__PredString)),FLORA_THIS_WORKSPACE(d^tblflapply)(sysabort,['invalid argument in Method[mustDefine(off,',__PredString,')]@\\system'],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5))))),fllibexecute_delayed_calls([__Callable,__Pred,__PredString],[__Callable,__Pred,__newdontcarevar6])))).
:-(FLORA_THIS_WORKSPACE(turn_debug_off_for_call)(__Pred,__Mod,__Callable,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(76,'flrsystem.flr',FLORA_THIS_MODULE_NAME),','(','(';'(','(:(flrwrapper,flora_is_system_module_name(__Mod)),';'(->(:(flora2,'\\isloaded'(__Mod)),'\\true'),:(flrlibman,flora_load_system_module(__Mod)))),\+(:(flrwrapper,flora_is_system_module_name(__Mod)))),';'(','(:(flora2,'\\isloaded'(__Mod)),','(!,','(:(flrwrapper,flora_module_predicate(ignore_undefcheck,[__Callable],__Mod,__Entry)),assert(__Entry)))),','(:(flrdecode,flora_decode_goal_as_atom(__Pred,__PredString)),FLORA_THIS_WORKSPACE(d^tblflapply)(sysabort,['invalid argument in Method[mustDefine(off,',__PredString,')]@\\system : Module ',__Mod,' is not loaded'],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))),fllibexecute_delayed_calls([__Callable,__Entry,__Mod,__Pred,__PredString],[__Callable,__Mod,__Pred])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)('System',type,/(/(__Type,__Subtype),__Bits),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(78,'flrsystem.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrporting,flora_running_under(__Type)),','(:(flrporting,flora_running_under(__Subtype,__BitsAtom)),','(atom_codes(__BitsAtom,__BitsChars),number_codes(__Bits,__BitsChars)))),fllibexecute_delayed_calls([__Bits,__BitsAtom,__BitsChars,__Subtype,__Type],[__Bits,__Subtype,__Type])))).
:-(FLORA_THIS_WORKSPACE(static^meth)('System',uninstall,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(80,'flrsystem.flr',FLORA_THIS_MODULE_NAME),','(:(flrutils,flora_system_info(=(os,windows))),','(!,FLORA_THIS_WORKSPACE(d^tblflapply)(message,'+++ On Windows, please use the standard uninstallation facilities','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))))).
:-(FLORA_THIS_WORKSPACE(static^meth)('System',uninstall,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(82,'flrsystem.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrutils,flora_system_info(=(installdir,__InstDir))),','('\\cd'(__InstDir),','('\\cd'(..),','(FLORA_WORKSPACE(\\io,d^meth)('File',flapply(executable,'./uninstall_ergoAI.sh'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(shell,shell('./uninstall_ergoAI.sh')),!))))),fllibexecute_delayed_calls([__InstDir],[])))).
:-(FLORA_THIS_WORKSPACE(static^meth)('System',uninstall,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(84,'flrsystem.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(message,'+++ This copy does not look like an ErgoAI release;
+++ it cannot be uninstalled via this method','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).

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
#define FLORA_FLS2_FILENAME  'flrsystem.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('flrsystem.ergo',FLORA_THIS_MODULE_NAME))).

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

:-(FLORA_THIS_WORKSPACE(system_ignore_undefined_errors)(_h561295,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(system_ignore_undefined_errors))(_h561295,FWContext)).
:-(FLORA_THIS_WORKSPACE(system_turn_off_debug)(_h562222,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(system_turn_off_debug))(_h562222,FWContext)).
:-(FLORA_THIS_WORKSPACE(system_turn_off_debug_all)(FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(system_turn_off_debug_all))(FWContext)).
:-(FLORA_THIS_WORKSPACE(system_turn_on_debug)(_h563848,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(system_turn_on_debug))(_h563848,FWContext)).
:-(FLORA_THIS_WORKSPACE(system_turn_on_debug_all)(FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(system_turn_on_debug_all))(FWContext)).
:-(FLORA_THIS_WORKSPACE(turn_debug_off_for_call)(_h565442,_h565444,_h565446,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(turn_debug_off_for_call))(_h565442,_h565444,_h565446,FWContext)).
:-(FLORA_THIS_WORKSPACE(turn_off_debug_list)(_h566265,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(turn_off_debug_list))(_h566265,FWContext)).
:-(FLORA_THIS_WORKSPACE(turn_on_debug_list)(_h567016,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(turn_on_debug_list))(_h567016,FWContext)).
