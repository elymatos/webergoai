
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
   that exclude tabling non-signature frames
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
#define FLORA_THIS_FILENAME  'flrgclp_wfsx.ergo'
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

/************************************************************************
  file: libinc/flrsystem_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(':'(flrlibman,flora_load_system_module(FLSYSMODSYSTEM))).

/***********************************************************************/

:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(\\undefeated)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(\\undefeated)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(\\undefeated)(_h708781,_h708783,_h708785,_h708787,_h708789,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(\\undefeated))(_h708781,_h708783,_h708785,_h708787,_h708789,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beaten_by_strict_rule)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beaten_by_strict_rule)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(_h709439,_h709441,_h709443,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beaten_by_strict_rule))(_h709439,_h709441,_h709443,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beaten_by_strict_rule)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beaten_by_strict_rule)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(_h710235,_h710237,_h710239,_h710241,_h710243,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beaten_by_strict_rule))(_h710235,_h710237,_h710239,_h710241,_h710243,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(candidate)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(candidate)),4)),FLORA_FLEX_DYNAMIC_TYPE_CLAUSE))).
:-(FLORA_THIS_WORKSPACE(candidate)(_h711039,_h711041,_h711043,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(candidate))(_h711039,_h711041,_h711043,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(change_module)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(change_module)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(change_module)(_h711643,_h711645,_h711647,_h711649,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(change_module))(_h711643,_h711645,_h711647,_h711649,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(change_module_nocheck)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(change_module_nocheck)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(change_module_nocheck)(_h712315,_h712317,_h712319,_h712321,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(change_module_nocheck))(_h712315,_h712317,_h712319,_h712321,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(check_module_to_AT_association)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(check_module_to_AT_association)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(check_module_to_AT_association)(_h713115,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(check_module_to_AT_association))(_h713115,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(compromized)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(compromized)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(compromized)(_h714047,_h714049,_h714051,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(compromized))(_h714047,_h714049,_h714051,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(conflicts)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(conflicts)),6)),FLORA_FLEX_DYNAMIC_TYPE_CLAUSE))).
:-(FLORA_THIS_WORKSPACE(conflicts)(_h714683,_h714685,_h714687,_h714689,_h714691,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(conflicts))(_h714683,_h714685,_h714687,_h714689,_h714691,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(defeated)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(defeated)),4)),FLORA_FLEX_DYNAMIC_TYPE_CLAUSE))).
:-(FLORA_THIS_WORKSPACE(defeated)(_h715295,_h715297,_h715299,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(defeated))(_h715295,_h715297,_h715299,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(defeated_id)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(defeated_id)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(defeated_id)(_h715883,_h715885,_h715887,_h715889,_h715891,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(defeated_id))(_h715883,_h715885,_h715887,_h715889,_h715891,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(defeats)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(defeats)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(defeats)(_h716527,_h716529,_h716531,_h716533,_h716535,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(defeats))(_h716527,_h716529,_h716531,_h716533,_h716535,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(disqualified)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(disqualified)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(disqualified)(_h717107,_h717109,_h717111,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(disqualified))(_h717107,_h717109,_h717111,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(rebuts)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(rebuts)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(rebuts)(_h717759,_h717761,_h717763,_h717765,_h717767,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(rebuts))(_h717759,_h717761,_h717763,_h717765,_h717767,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(rebutted)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(rebutted)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(rebutted)(_h718323,_h718325,_h718327,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(rebutted))(_h718323,_h718325,_h718327,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(refuted)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(refuted)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(refuted)(_h718911,_h718913,_h718915,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(refuted))(_h718911,_h718913,_h718915,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(refutes)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(refutes)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(refutes)(_h719483,_h719485,_h719487,_h719489,_h719491,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(refutes))(_h719483,_h719485,_h719487,_h719489,_h719491,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(strict_candidate)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(strict_candidate)),4)),FLORA_FLEX_DYNAMIC_TYPE_CLAUSE))).
:-(FLORA_THIS_WORKSPACE(strict_candidate)(_h720063,_h720065,_h720067,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(strict_candidate))(_h720063,_h720065,_h720067,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(trans_defeats)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(trans_defeats)),6)),FLORA_FLEX_DYNAMIC_TYPE_CLAUSE))).
:-(FLORA_THIS_WORKSPACE(trans_defeats)(_h720779,_h720781,_h720783,_h720785,_h720787,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(trans_defeats))(_h720779,_h720781,_h720783,_h720785,_h720787,FWContext)).
 
#if !defined(FLORA_FLM_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLM_FILENAME  'flrgclp_wfsx.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(flrgclp_wfsx,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'flrgclp_wfsx.fld'
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
#define FLORA_FLS_FILENAME  'flrgclp_wfsx.fls'
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

:-(table(as(','(/(FLORA_THIS_WORKSPACE(candidate),4),/(FLORA_THIS_WORKSPACE(strict_candidate),4)),AUXILIARY_TABLING_TYPE))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(candidate,3,FLORA_THIS_MODULE_NAME),prolog(strict_candidate,3,FLORA_THIS_MODULE_NAME)]))).
:-(table(as(/(FLORA_THIS_WORKSPACE(trans_defeats),6),AUXILIARY_TABLING_TYPE))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(trans_defeats,5,FLORA_THIS_MODULE_NAME)]))).
:-(table(as(/(FLORA_THIS_WORKSPACE(conflicts),6),AUXILIARY_TABLING_TYPE))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(conflicts,5,FLORA_THIS_MODULE_NAME)]))).
:-(table(as(/(FLORA_THIS_WORKSPACE(defeated),4),AUXILIARY_TABLING_TYPE))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(defeated,3,FLORA_THIS_MODULE_NAME)]))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(refutes,5,FLORA_THIS_MODULE_NAME),prolog(rebuts,5,FLORA_THIS_MODULE_NAME)]))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(defeats,5,FLORA_THIS_MODULE_NAME)]))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(refuted,3,FLORA_THIS_MODULE_NAME),prolog(rebutted,3,FLORA_THIS_MODULE_NAME)]))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(disqualified,3,FLORA_THIS_MODULE_NAME)]))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(defeated_id,5,FLORA_THIS_MODULE_NAME)]))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(compromized,3,FLORA_THIS_MODULE_NAME)]))).
?-(:(flrprolog,flora_define_modular_prolog([prolog('\\undefeated',5,FLORA_THIS_MODULE_NAME)]))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(beaten_by_strict_rule,3,FLORA_THIS_MODULE_NAME),prolog(beaten_by_strict_rule,5,FLORA_THIS_MODULE_NAME)]))).
:-(fllibexport([[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar1,howDefeated,__newdontcarevar2,__newcontextvar5))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar6,info,__newdontcarevar7,__newcontextvar10))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar11,howDisqualified,__newdontcarevar12,__newcontextvar15))]])).
:-(fllibexport([[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(opposes,__newdontcarevar1,__newdontcarevar2,__newdontcarevar3,__newdontcarevar4,__newcontextvar7))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(overrides,__newdontcarevar8,__newdontcarevar9,__newdontcarevar10,__newdontcarevar11,__newcontextvar14))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(refutes,__newdontcarevar15,__newdontcarevar16,__newdontcarevar17,__newdontcarevar18,__newcontextvar21))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(rebuts,__newdontcarevar22,__newdontcarevar23,__newdontcarevar24,__newdontcarevar25,__newcontextvar28))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(conflicts,__newdontcarevar29,__newdontcarevar30,__newdontcarevar31,__newdontcarevar32,__newcontextvar35))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(compromised,__newdontcarevar36,__newdontcarevar37,__newcontextvar40))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(candidate,__newdontcarevar41,__newdontcarevar42,__newcontextvar45))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(strict_candidate,__newdontcarevar46,__newdontcarevar47,__newcontextvar50))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(defeated,__newdontcarevar51,__newdontcarevar52,__newcontextvar55))]])).
:-(FLORA_THIS_WORKSPACE(\\undefeated)(__Id,__FileName,__Vars,__H,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(4,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(defeated_id)(__Id,__FileName,__Vars,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),fllibexecute_delayed_calls([__FileName,__H,__Id,__Mod,__Vars],[]))),[__Id,__FileName,__Vars,__H,__Mod],99,'flrgclp_wfsx.ergo')))).
:-(FLORA_THIS_WORKSPACE(defeated_id)(__Id,__FileName,__Vars,__H,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(6,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrdescriptor_support,get_tag_descriptor_info(__Id,__FileName,__Mod,__T,__Vars)),FLORA_THIS_WORKSPACE(defeated)(__T,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),fllibexecute_delayed_calls([__FileName,__H,__Id,__Mod,__T,__Vars],[__FileName,__H,__Id,__Mod,__Vars])))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(change_module,4,FLORA_THIS_MODULE_NAME),prolog(change_module_nocheck,4,FLORA_THIS_MODULE_NAME),prolog(check_module_to_AT_association,1,FLORA_THIS_MODULE_NAME)]))).
:-(FLORA_THIS_WORKSPACE(change_module)(__InA,__Mod,__RealNewMod,__OutA,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(8,'change_module.flh',FLORA_THIS_MODULE_NAME),','(:(flrwrapper,flora_change_module(__InA,__OutA,','(FLORA_THIS_MODULE_NAME,__Mod),__RealNewMod,['In ',status,'(Tag,Head)[...]@',FLORA_THIS_MODULE_NAME,': Head must be bound'])),FLORA_THIS_WORKSPACE(check_module_to_AT_association)(__RealNewMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))).
:-(FLORA_THIS_WORKSPACE(change_module_nocheck)(__InA,__newdontcarevar1,__newdontcarevar2,__OutA,'_$ctxt'(_CallerModuleVar,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''rule_enabled'(10,'change_module.flh',FLORA_THIS_MODULE_NAME),','(:(flrdatatype,flora_is_var_prim(__InA)),','(!,=(__OutA,__InA))))).
:-(FLORA_THIS_WORKSPACE(change_module_nocheck)(__InA,__Mod,__RealNewMod,__OutA,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(12,'change_module.flh',FLORA_THIS_MODULE_NAME),','(:(flrwrapper,flora_change_module(__InA,__OutA,','(FLORA_THIS_MODULE_NAME,__Mod),__RealNewMod,'In defeated/overrides/opposes: something wrong')),FLORA_THIS_WORKSPACE(check_module_to_AT_association)(__RealNewMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))).
:-(FLORA_THIS_WORKSPACE(check_module_to_AT_association)(__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(14,'change_module.flh',FLORA_THIS_MODULE_NAME),','(:(flrwrapper,flora_is_system_module_name(__Mod)),','(!,'\\false')))).
:-(FLORA_THIS_WORKSPACE(check_module_to_AT_association)(__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(16,'change_module.flh',FLORA_THIS_MODULE_NAME),','(\+(:(flrregistry,flora_defeasible_module_registry(__Mod,FLORA_THIS_MODULE_NAME))),','(\==(__Mod,FLORA_THIS_MODULE_NAME),','(!,FLORA_WORKSPACE(\\system,d^tblflapply)(sysabort,['User module ',__Mod,' is not associated with the argumentation theory residing in module ',FLORA_THIS_MODULE_NAME],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))))).
:-(FLORA_THIS_WORKSPACE(check_module_to_AT_association)(__newdontcarevar1,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(18,'change_module.flh',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(defeated,__T,__H,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(20,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module_nocheck)(__H,__Mod,__RealMod,__MH,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(defeated)(__T,__MH,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__H,__MH,__Mod,__RealMod,__T],[__H,__T])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(opposes,__T1,__H1,__T2,__H2,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(22,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module_nocheck)(__H1,__Mod,__RealMod,__MH1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(change_module_nocheck)(__H2,__Mod,__RealMod,__MH2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),'_$_$_ergo''_opposes_aux'(__RealMod,__T1,__MH1,__T2,__MH2)))),fllibexecute_delayed_calls([__H1,__H2,__MH1,__MH2,__Mod,__RealMod,__T1,__T2],[__H1,__H2,__T1,__T2])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(overrides,__T1,__H1,__T2,__H2,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(24,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module_nocheck)(__H1,__Mod,__RealMod,__MH1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(change_module_nocheck)(__H2,__Mod,__RealMod,__MH2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(:(flrdescriptor_support,synonymous_tag_with_head(__T1,__RealMod,__T11,__H1)),','(:(flrdescriptor_support,synonymous_tag_with_head(__T2,__RealMod,__T22,__H2)),'_$_$_ergo''_overrides_aux'(__RealMod,__T11,__MH1,__T22,__MH2)))))),fllibexecute_delayed_calls([__H1,__H2,__MH1,__MH2,__Mod,__RealMod,__T1,__T11,__T2,__T22],[__H1,__H2,__T1,__T2])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(candidate,__T,__H,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(26,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),FLORA_THIS_WORKSPACE(candidate)(__T,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),fllibexecute_delayed_calls([__H,__Mod,__T],[__H,__T])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(strict_candidate,__T,__H,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(28,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),FLORA_THIS_WORKSPACE(strict_candidate)(__T,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),fllibexecute_delayed_calls([__H,__Mod,__T],[__H,__T])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(refutes,__T1,__H1,__T2,__H2,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(30,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),FLORA_THIS_WORKSPACE(refutes)(__T1,__H1,__T2,__H2,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),fllibexecute_delayed_calls([__H1,__H2,__Mod,__T1,__T2],[__H1,__H2,__T1,__T2])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(rebuts,__T1,__H1,__T2,__H2,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(32,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),FLORA_THIS_WORKSPACE(rebuts)(__T1,__H1,__T2,__H2,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),fllibexecute_delayed_calls([__H1,__H2,__Mod,__T1,__T2],[__H1,__H2,__T1,__T2])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(conflicts,__T1,__H1,__T2,__H2,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(34,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),FLORA_THIS_WORKSPACE(conflicts)(__T1,__H1,__T2,__H2,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),fllibexecute_delayed_calls([__H1,__H2,__Mod,__T1,__T2],[__H1,__H2,__T1,__T2])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(compromised,__T,__H,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(36,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),FLORA_THIS_WORKSPACE(compromized)(__T,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),fllibexecute_delayed_calls([__H,__Mod,__T],[__H,__T])))).
:-(FLORA_THIS_WORKSPACE(defeated)(__T,__H,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(38,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(defeats)(__T2,__H2,__T,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(compromized)(__T2,__H2,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__H2,__Mod,__T2],[]))),[__T2,__H2,__Mod],154,'flrgclp_wfsx.ergo'))),fllibexecute_delayed_calls([__H,__H2,__Mod,__T,__T2],[__H,__Mod,__T])))).
:-(FLORA_THIS_WORKSPACE(defeated)(__T,__H,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(40,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(disqualified)(__T,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(defeats)(__T1,__H1,__T2,__H2,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(42,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(refutes)(__T1,__H1,__T2,__H2,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(defeats)(__T1,__H1,__T2,__H2,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(44,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(rebuts)(__T1,__H1,__T2,__H2,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(refuted)(__T,__H,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(46,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(refutes)(__newdontcarevar3,__newdontcarevar4,__T,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__H,__Mod,__T,__newdontcarevar7],[__H,__Mod,__T])))).
:-(FLORA_THIS_WORKSPACE(rebutted)(__T,__H,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(48,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(rebuts)(__newdontcarevar3,__newdontcarevar4,__T,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__H,__Mod,__T,__newdontcarevar7],[__H,__Mod,__T])))).
:-(FLORA_THIS_WORKSPACE(compromized)(__T,__H,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(50,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(refuted)(__T,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(disqualified)(__T,__H,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(52,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrdescriptor_support,synonymous_tag_with_head(__T,__Mod,__T2,__H)),','(FLORA_THIS_WORKSPACE(trans_defeats)(__T,__H,__T2,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(rebutted)(__T,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__H,__Mod,__T],[]))),[__T,__H,__Mod],171,'flrgclp_wfsx.ergo')))),fllibexecute_delayed_calls([__H,__Mod,__T,__T2],[__H,__Mod,__T])))).
:-(FLORA_THIS_WORKSPACE(disqualified)(__T,__H,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(54,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(__T,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(disqualified)(__T,__H,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(56,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),'_$_$_ergo''_cancel_aux'(__Mod,__T,__H))).
:-(FLORA_THIS_WORKSPACE(disqualified)(__T,__H,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(58,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),'_$_$_ergo''_overriden_cancellation'(__T,__H,__Mod))).
:-(FLORA_THIS_WORKSPACE(refutes)(__T1,__H1,__T2,__H2,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(60,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrdatatype,flora_is_nonvar_prim(__T1)),','(!,','(:(flrdescriptor_support,synonymous_tag_with_head(__T1,__Mod,__T11,__H1)),','('_$_$_ergo''_overrides_aux'(__Mod,__T11,__H1,__T22,__H2),','(:(flrdescriptor_support,synonymous_tag_with_head(__T22,__Mod,__T2,__H2)),','(flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(compromized)(__T11,__H1,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),fllibexecute_delayed_calls([__H1,__Mod,__T11],[]))),[__T11,__H1,__Mod],188,'flrgclp_wfsx.ergo')),FLORA_THIS_WORKSPACE(conflicts)(__T11,__H1,__T22,__H2,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))))))),fllibexecute_delayed_calls([__H1,__H2,__Mod,__T1,__T11,__T2,__T22],[__H1,__H2,__Mod,__T1,__T2])))).
:-(FLORA_THIS_WORKSPACE(refutes)(__T1,__H1,__T2,__H2,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(62,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrdescriptor_support,synonymous_tag_with_head(__T2,__Mod,__T22,__H2)),','('_$_$_ergo''_overrides_aux'(__Mod,__T11,__H1,__T22,__H2),','(:(flrdescriptor_support,synonymous_tag_with_head(__T11,__Mod,__T1,__H1)),','(flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(compromized)(__T11,__H1,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),fllibexecute_delayed_calls([__H1,__Mod,__T11],[]))),[__T11,__H1,__Mod],196,'flrgclp_wfsx.ergo')),FLORA_THIS_WORKSPACE(conflicts)(__T11,__H1,__T22,__H2,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))))),fllibexecute_delayed_calls([__H1,__H2,__Mod,__T1,__T11,__T2,__T22],[__H1,__H2,__Mod,__T1,__T2])))).
:-(FLORA_THIS_WORKSPACE(rebuts)(__T1,__H1,__T2,__H2,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(64,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(:(flora_ground,flrground(+(__T1,__H1))),','(!,','(flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','('_$_$_ergo''_cancel_aux'(__Mod,__T1,__H1),fllibexecute_delayed_calls([__H1,__Mod,__T1],[]))),[__Mod,__T1,__H1],202,'flrgclp_wfsx.ergo')),','(flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(compromized)(__T1,__H1,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),fllibexecute_delayed_calls([__H1,__Mod,__T1],[]))),[__T1,__H1,__Mod],203,'flrgclp_wfsx.ergo')),','(FLORA_THIS_WORKSPACE(conflicts)(__T1,__H1,__T2,__H2,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),'\\undefined'))))))).
:-(FLORA_THIS_WORKSPACE(rebuts)(__T1,__H1,__T2,__H2,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(66,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(conflicts)(__T1,__H1,__T2,__H2,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','('_$_$_ergo''_cancel_aux'(__Mod,__T1,__H1),fllibexecute_delayed_calls([__H1,__Mod,__T1],[]))),[__Mod,__T1,__H1],210,'flrgclp_wfsx.ergo')),','(flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(compromized)(__T1,__H1,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__H1,__Mod,__T1],[]))),[__T1,__H1,__Mod],211,'flrgclp_wfsx.ergo')),'\\undefined'))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,__T,__H),howDefeated,flapply(refutedBy,__DT,__DH),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(68,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(refutes)(__DT,__DH,__T,__HM,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__DH,__DT,__H,__HM,__Mod,__RealMod,__T],[__DH,__DT,__H,__T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,__T,__H),howDefeated,flapply(rebuttedBy,__DT,__DH),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(70,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(rebuts)(__DT,__DH,__T,__HM,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__DH,__DT,__H,__HM,__Mod,__RealMod,__T],[__DH,__DT,__H,__T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,__T,__H),howDefeated,disqualified,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(72,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(disqualified)(__T,__HM,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__H,__HM,__Mod,__RealMod,__T],[__H,__T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,__T,__H),howDefeated,disqualified,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(74,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(__T,__HM,__newdontcarevar5,__newdontcarevar6,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)))),fllibexecute_delayed_calls([__H,__HM,__Mod,__RealMod,__T,__newdontcarevar9],[__H,__T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,__T,__H),info,flapply(refutes,__RefutedT,__RefutedH),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(76,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(refutes)(__T,__HM,__RefutedT,__RefutedH,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__H,__HM,__Mod,__RealMod,__RefutedH,__RefutedT,__T],[__H,__RefutedH,__RefutedT,__T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,__T,__H),info,flapply(rebuts,__RebuttedT,__RebuttedH),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(78,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(rebuts)(__T,__HM,__RebuttedT,__RebuttedH,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__H,__HM,__Mod,__RealMod,__RebuttedH,__RebuttedT,__T],[__H,__RebuttedH,__RebuttedT,__T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,__T,__H),info,flapply(conflictsWith,__ConflictT,__ConflictH),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(80,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(conflicts)(__T,__HM,__ConflictT,__ConflictH,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__ConflictH,__ConflictT,__H,__HM,__Mod,__RealMod,__T],[__ConflictH,__ConflictT,__H,__T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,__T,__H),info,candidate,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(82,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(candidate)(__T,__HM,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__H,__HM,__Mod,__RealMod,__T],[__H,__T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,__T,__H),howDisqualified,flapply(defeatCycleEdge,__DefeaterT,__DefeaterH,__DefeatedT,__DefeatedH),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(84,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(flrdescriptor_support,synonymous_tag_with_head(__T,__Mod,__T2,__HM)),','(FLORA_THIS_WORKSPACE(trans_defeats)(__T,__HM,__T2,__HM,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(trans_defeats)(__T2,__HM,__DefeaterT,__DefeaterH,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),','(FLORA_THIS_WORKSPACE(defeats)(__DefeaterT,__DefeaterH,__DefeatedT,__DefeatedH,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),','(fllibdelayedliteral('!=','flrgclp_wfsx.ergo',275,[','(__DefeaterT,'DefeaterH'),','(__DefeatedT,__DefeatedH)]),FLORA_THIS_WORKSPACE(trans_defeats)(__DefeatedT,__DefeatedH,__T2,__HM,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12))))))))),fllibexecute_delayed_calls([__DefeatedH,__DefeatedT,__DefeaterH,__DefeaterT,__H,__HM,__Mod,__RealMod,__T,__T2],[__DefeatedH,__DefeatedT,__DefeaterH,__DefeaterT,__H,__T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,__T,__H),howDisqualified,canceled,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(86,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),'_$_$_ergo''_cancel_aux'(__RealMod,__T,__HM))),fllibexecute_delayed_calls([__H,__HM,__Mod,__RealMod,__T],[__H,__T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,__T,__H),howDisqualified,flapply(beatenByStrictRule,__ST,__SH),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(88,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(__T,__HM,__ST,__SH,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__H,__HM,__Mod,__RealMod,__SH,__ST,__T],[__H,__SH,__ST,__T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,__T,__H),howDisqualified,flapply(overridenCancellation,__T,__HM),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(90,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),'_$_$_ergo''_overriden_cancellation'(__T,__HM,__RealMod))),fllibexecute_delayed_calls([__H,__HM,__Mod,__RealMod,__T],[__H,__HM,__T])))).
:-(FLORA_THIS_WORKSPACE(trans_defeats)(__T1,__H1,__T2,__H2,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(92,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(defeats)(__T1,__H1,__T2,__H2,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(trans_defeats)(__T1,__H1,__T3,__H3,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(94,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(defeats)(__T1,__H1,__T2,__H2,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(trans_defeats)(__T2,__H2,__T3,__H3,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))),fllibexecute_delayed_calls([__H1,__H2,__H3,__Mod,__T1,__T2,__T3],[__H1,__H3,__Mod,__T1,__T3])))).
:-(FLORA_THIS_WORKSPACE(candidate)(__T,__Head,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(96,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(','(current_prolog_flag(max_table_subgoal_size,__TermDepth),','(set_prolog_flag(max_table_subgoal_size,0),','(','(fllibmodobj(body,libmod_wrapper,__Head,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5),__newvar3),=(__ModHead,__newvar3)),','(:(flrdescriptor_support,get_ruleid_by_tag_or_head(__T,__ModHead,__Mod,__Id,__FileName)),','(:(flrcanon,show_rule_by_id(__Id,__FileName,__Mod,__ModHead,__Body)),','(:(flrdescriptor_support,is_defeasible_rule(__Id,__FileName,__Mod)),','(fllibmodlit(libmod_wrapper,__Body,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),set_prolog_flag(max_table_subgoal_size,__TermDepth)))))))),fllibexecute_delayed_calls([__Body,__FileName,__Head,__Id,__Mod,__ModHead,__T,__TermDepth],[__Head,__Mod,__T])))).
:-(FLORA_THIS_WORKSPACE(conflicts)(__T1,__H1,__T2,__H2,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(98,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','('_$_$_ergo''_opposes_aux'(__Mod,__T1,__H1,__T2,__H2),','(flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','('_$_$_ergo''_cancel_aux'(__Mod,__T1,__H1),fllibexecute_delayed_calls([__H1,__Mod,__T1],[]))),[__Mod,__T1,__H1],336,'flrgclp_wfsx.ergo')),','(flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','('_$_$_ergo''_cancel_aux'(__Mod,__T2,__H2),fllibexecute_delayed_calls([__H2,__Mod,__T2],[]))),[__Mod,__T2,__H2],337,'flrgclp_wfsx.ergo')),','(FLORA_THIS_WORKSPACE(candidate)(__T1,__H1,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(candidate)(__T2,__H2,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))))))).
:-(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(__T,__H,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(100,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(__T,__H,__newdontcarevar3,__newdontcarevar4,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__H,__Mod,__T,__newdontcarevar7],[__H,__Mod,__T])))).
:-(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(__T,__H,__Tstrict,__Hstrict,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(102,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(candidate)(__T,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''_opposes_aux'(__Mod,__T,__H,__Tstrict,__Hstrict),';'(->(:(flrstorageutils,'\\isbasefact'(__Hstrict)),'\\true'),FLORA_THIS_WORKSPACE(strict_candidate)(__Tstrict,__Hstrict,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))))).
:-(FLORA_THIS_WORKSPACE(strict_candidate)(__T,__Head,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(104,'flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME),','(','(current_prolog_flag(max_table_subgoal_size,__TermDepth),','(set_prolog_flag(max_table_subgoal_size,0),','(','(fllibmodobj(body,libmod_wrapper,__Head,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5),__newvar3),=(__ModHead,__newvar3)),','(:(flrdescriptor_support,get_ruleid_by_tag_or_head(__T,__ModHead,__Mod,__Id,__FileName)),','(:(flrcanon,show_rule_by_id(__Id,__FileName,__Mod,__ModHead,__Body)),','(:(flrdescriptor_support,is_strict_rule(__Id,__FileName,__Mod)),','(fllibmodlit(libmod_wrapper,__Body,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),set_prolog_flag(max_table_subgoal_size,__TermDepth)))))))),fllibexecute_delayed_calls([__Body,__FileName,__Head,__Id,__Mod,__ModHead,__T,__TermDepth],[__Head,__Mod,__T])))).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rule signatures %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%% Signatures for latent queries %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%% Queries found in the source file %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),:(flrarguments,flora_set_argdef(status,2,[oid,meta],FLORA_THIS_MODULE_NAME))),[])).

 
#if !defined(FLORA_FLS2_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLS2_FILENAME  'flrgclp_wfsx.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('flrgclp_wfsx.ergo',FLORA_THIS_MODULE_NAME))).

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

:-(FLORA_THIS_WORKSPACE(\\undefeated)(_h745550,_h745552,_h745554,_h745556,_h745558,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(\\undefeated))(_h745550,_h745552,_h745554,_h745556,_h745558,FWContext)).
:-(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(_h746203,_h746205,_h746207,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beaten_by_strict_rule))(_h746203,_h746205,_h746207,FWContext)).
:-(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(_h746994,_h746996,_h746998,_h747000,_h747002,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beaten_by_strict_rule))(_h746994,_h746996,_h746998,_h747000,_h747002,FWContext)).
:-(FLORA_THIS_WORKSPACE(candidate)(_h747793,_h747795,_h747797,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(candidate))(_h747793,_h747795,_h747797,FWContext)).
:-(FLORA_THIS_WORKSPACE(change_module)(_h748392,_h748394,_h748396,_h748398,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(change_module))(_h748392,_h748394,_h748396,_h748398,FWContext)).
:-(FLORA_THIS_WORKSPACE(change_module_nocheck)(_h749059,_h749061,_h749063,_h749065,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(change_module_nocheck))(_h749059,_h749061,_h749063,_h749065,FWContext)).
:-(FLORA_THIS_WORKSPACE(check_module_to_AT_association)(_h749854,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(check_module_to_AT_association))(_h749854,FWContext)).
:-(FLORA_THIS_WORKSPACE(compromized)(_h750781,_h750783,_h750785,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(compromized))(_h750781,_h750783,_h750785,FWContext)).
:-(FLORA_THIS_WORKSPACE(conflicts)(_h751412,_h751414,_h751416,_h751418,_h751420,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(conflicts))(_h751412,_h751414,_h751416,_h751418,_h751420,FWContext)).
:-(FLORA_THIS_WORKSPACE(defeated)(_h752019,_h752021,_h752023,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(defeated))(_h752019,_h752021,_h752023,FWContext)).
:-(FLORA_THIS_WORKSPACE(defeated_id)(_h752602,_h752604,_h752606,_h752608,_h752610,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(defeated_id))(_h752602,_h752604,_h752606,_h752608,_h752610,FWContext)).
:-(FLORA_THIS_WORKSPACE(defeats)(_h753241,_h753243,_h753245,_h753247,_h753249,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(defeats))(_h753241,_h753243,_h753245,_h753247,_h753249,FWContext)).
:-(FLORA_THIS_WORKSPACE(disqualified)(_h753816,_h753818,_h753820,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(disqualified))(_h753816,_h753818,_h753820,FWContext)).
:-(FLORA_THIS_WORKSPACE(rebuts)(_h754463,_h754465,_h754467,_h754469,_h754471,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(rebuts))(_h754463,_h754465,_h754467,_h754469,_h754471,FWContext)).
:-(FLORA_THIS_WORKSPACE(rebutted)(_h755022,_h755024,_h755026,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(rebutted))(_h755022,_h755024,_h755026,FWContext)).
:-(FLORA_THIS_WORKSPACE(refuted)(_h755605,_h755607,_h755609,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(refuted))(_h755605,_h755607,_h755609,FWContext)).
:-(FLORA_THIS_WORKSPACE(refutes)(_h756172,_h756174,_h756176,_h756178,_h756180,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(refutes))(_h756172,_h756174,_h756176,_h756178,_h756180,FWContext)).
:-(FLORA_THIS_WORKSPACE(strict_candidate)(_h756747,_h756749,_h756751,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(strict_candidate))(_h756747,_h756749,_h756751,FWContext)).
:-(FLORA_THIS_WORKSPACE(trans_defeats)(_h757458,_h757460,_h757462,_h757464,_h757466,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(trans_defeats))(_h757458,_h757460,_h757462,_h757464,_h757466,FWContext)).
