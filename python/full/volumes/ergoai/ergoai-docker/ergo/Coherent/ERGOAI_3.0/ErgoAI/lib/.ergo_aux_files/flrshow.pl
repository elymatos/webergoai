
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

#define FLORA_COMPILATION_ID 6

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
#define FLORA_THIS_FILENAME  'flrshow.ergo'
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
  file: syslibinc/flrmetaops_inh.flh

  Author(s): Michael Kifer

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif


?-(:(flrlibman,flora_load_library(FLLIBMETAOPS))).

/***********************************************************************/

/************************************************************************
  file: syslibinc/flrdynrule_inc.flh

  Author(s): Chang Zhao

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLSYSRULEUPDATE))).

/***********************************************************************/

:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(change_module_if_needed)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(change_module_if_needed)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(change_module_if_needed)(_h128542,_h128544,_h128546,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(change_module_if_needed))(_h128542,_h128544,_h128546,FWContext)).
 
#if !defined(FLORA_FLM_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLM_FILENAME  'flrshow.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(flrshow,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'flrshow.fld'
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
#define FLORA_FLS_FILENAME  'flrshow.fls'
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

:-(fllibexport([[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar1,flapply(splice,__newdontcarevar2),__newdontcarevar3,__newcontextvar6))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar7,flapply(show,__newdontcarevar8),__newdontcarevar9,__newcontextvar12))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar13,show,__newdontcarevar14,__newcontextvar17))]])).

:-(import(from(/(flora_decode_oid_as_list,2),flrdecode))).

?-(:(flrprolog,flora_define_modular_prolog([prolog(change_module_if_needed,3,FLORA_THIS_MODULE_NAME)]))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__List,flapply(splice,__Separator),__Result,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(4,'flrshow.flr',FLORA_THIS_MODULE_NAME),','(','(:(usermod,is_list(__List)),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__newvar3),FLORA_THIS_WORKSPACE(change_module_if_needed)(__List,__ListM,__newvar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5))),','(:(flrdecode,decode_list_add_separator(__ListM,__SepList,flora_decode_oid_as_list(__newdontcarevar6,__newdontcarevar7),__Separator)),:(flrporting,flora_concat_items(__SepList,__Result))))),fllibexecute_delayed_calls([__List,__ListM,__Result,__SepList,__Separator,__newdontcarevar8],[__List,__Result,__Separator])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Term,show,__Result,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(6,'flrshow.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^mvd)(__Term,flapply(show,oid),__Result,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Term,flapply(show,__Type),__Result,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(8,'flrshow.flr',FLORA_THIS_MODULE_NAME),','(','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__newvar3),FLORA_THIS_WORKSPACE(change_module_if_needed)(__Term,__TermM,__newvar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5))),','(!,','(:(flrdecode,flora_display_mode(__OldMode)),','(:(flrdecode,flora_set_display_mode(noescapes)),','(';'(->(==(__Type,oid),:(flrdecode,flora_decode_oid_as_atom_substitute_vars(__TermM,__Result))),:(flrdecode,flora_decode_goal_as_mainless_atom_substitute_vars(__TermM,__Result))),:(flrdecode,flora_set_display_mode(__OldMode))))))),fllibexecute_delayed_calls([__OldMode,__Result,__Term,__TermM,__Type],[__Result,__Term,__Type])))).
:-(FLORA_THIS_WORKSPACE(change_module_if_needed)(__T,__T,___NewMod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(10,'change_module.flr',FLORA_THIS_MODULE_NAME),','(:(flrdatatype,flora_is_var_prim(__T)),!))).
:-(FLORA_THIS_WORKSPACE(change_module_if_needed)([],[],___NewMod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(12,'change_module.flr',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(change_module_if_needed)([__L|__R],[__LM|__RM],__NewMod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(14,'change_module.flr',FLORA_THIS_MODULE_NAME),','(!,','(FLORA_THIS_WORKSPACE(change_module_if_needed)(__L,__LM,__NewMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(change_module_if_needed)(__R,__RM,__NewMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))))).
:-(FLORA_THIS_WORKSPACE(change_module_if_needed)(','(__L,__R),','(__LM,__RM),__NewMod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(16,'change_module.flr',FLORA_THIS_MODULE_NAME),','(!,','(FLORA_THIS_WORKSPACE(change_module_if_needed)(__L,__LM,__NewMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(change_module_if_needed)(__R,__RM,__NewMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))))).
:-(FLORA_THIS_WORKSPACE(change_module_if_needed)(';'(__L,__R),';'(__LM,__RM),__NewMod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(18,'change_module.flr',FLORA_THIS_MODULE_NAME),','(!,','(FLORA_THIS_WORKSPACE(change_module_if_needed)(__L,__LM,__NewMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(change_module_if_needed)(__R,__RM,__NewMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))))).
:-(FLORA_THIS_WORKSPACE(change_module_if_needed)(__T,__TM,__NewMod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(20,'change_module.flr',FLORA_THIS_MODULE_NAME),','(:(flrwrapper,is_flora_callable_literal(__T)),','(:(flrwrapper,flora_change_module(__T,__TM,','(FLORA_THIS_MODULE_NAME,__NewMod),__NewMod,['In ',FLORA_THIS_MODULE_NAME,__T,': unexpected argument'])),!)))).
:-(FLORA_THIS_WORKSPACE(change_module_if_needed)(__R,__RM,__NewMod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(22,'change_module.flr',FLORA_THIS_MODULE_NAME),','(','(fllibuniveqform(__R,flsysruleupdate(__newvar3,_FilenameInRuleidVar,'_$_$_ergo''descr_vars',__newvar10,['_$_$_ergo''prop_descriptor'(__newvar3,_FilenameInRuleidVar,__newvar4,type,rule,'_$_$_ergo''descr_vars'),'_$_$_ergo''tag_descriptor'(__newvar3,_FilenameInRuleidVar,__newvar4,__newvar3,'_$_$_ergo''descr_vars'),'_$_$_ergo''rule_enabled'(__newvar3,_FilenameInRuleidVar,__newvar5),'_$_$_ergo''bool_descriptor'(__newvar3,_FilenameInRuleidVar,__newvar4,strict,'_$_$_ergo''descr_vars')],[___H],___B,__newvar6,__newvar7,true,[null],[null],'_$_$_ergo''rule_enabled'(__newvar3,_FilenameInRuleidVar,__newvar8),[__newdontcarevar9],true)),','(=..(__R,['FLSYSRULEUPDATE',__Id,__File,__Vars,__StmtNo,__Meta,__Head,__Body,__HeadVars,__BdyVars,__DTVars,__H2BFront,__H2BBack,__PreBody,__PostBody,__Defeat]),','(FLORA_THIS_WORKSPACE(change_module_if_needed)(__Head,__HM,__NewMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)),','(FLORA_THIS_WORKSPACE(change_module_if_needed)(__Body,__BM,__NewMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14)),','(=..(__RM,['FLSYSRULEUPDATE',__Id,__File,__Vars,__StmtNo,__Meta,__HM,__BM,__HeadVars,__BdyVars,__DTVars,__H2BFront,__H2BBack,__PreBody,__PostBody,__Defeat]),!))))),fllibexecute_delayed_calls([__BM,__BdyVars,__Body,__DTVars,__Defeat,__File,__H2BBack,__H2BFront,__HM,__Head,__HeadVars,__Id,__Meta,__NewMod,__PostBody,__PreBody,__R,__RM,__StmtNo,__Vars,___B,___H],[__NewMod,__R,__RM])))).
:-(FLORA_THIS_WORKSPACE(change_module_if_needed)(___T,___T,___NewMod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(24,'change_module.flr',FLORA_THIS_MODULE_NAME),'\\true')).

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
#define FLORA_FLS2_FILENAME  'flrshow.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('flrshow.ergo',FLORA_THIS_MODULE_NAME))).

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

:-(FLORA_THIS_WORKSPACE(change_module_if_needed)(_h144688,_h144690,_h144692,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(change_module_if_needed))(_h144688,_h144690,_h144692,FWContext)).
