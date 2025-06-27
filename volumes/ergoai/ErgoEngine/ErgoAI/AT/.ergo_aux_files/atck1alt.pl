
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

#define FLORA_COMPILATION_ID 12

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
#define FLORA_THIS_FILENAME  'atck1alt.ergo'
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
:-(FLORA_THIS_WORKSPACE(\\undefeated)(_h726128,_h726130,_h726132,_h726134,_h726136,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(\\undefeated))(_h726128,_h726130,_h726132,_h726134,_h726136,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beaten_by_strict_rule)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beaten_by_strict_rule)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(_h726786,_h726788,_h726790,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beaten_by_strict_rule))(_h726786,_h726788,_h726790,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beaten_by_strict_rule)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beaten_by_strict_rule)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(_h727582,_h727584,_h727586,_h727588,_h727590,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beaten_by_strict_rule))(_h727582,_h727584,_h727586,_h727588,_h727590,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(candidate)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(candidate)),4)),FLORA_FLEX_DYNAMIC_TYPE_CLAUSE))).
:-(FLORA_THIS_WORKSPACE(candidate)(_h728386,_h728388,_h728390,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(candidate))(_h728386,_h728388,_h728390,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(change_module)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(change_module)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(change_module)(_h728990,_h728992,_h728994,_h728996,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(change_module))(_h728990,_h728992,_h728994,_h728996,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(change_module_nocheck)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(change_module_nocheck)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(change_module_nocheck)(_h729662,_h729664,_h729666,_h729668,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(change_module_nocheck))(_h729662,_h729664,_h729666,_h729668,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(check_module_to_AT_association)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(check_module_to_AT_association)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(check_module_to_AT_association)(_h730462,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(check_module_to_AT_association))(_h730462,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(competes)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(competes)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(competes)(_h731394,_h731396,_h731398,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(competes))(_h731394,_h731396,_h731398,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(competes)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(competes)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(competes)(_h731982,_h731984,_h731986,_h731988,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(competes))(_h731982,_h731984,_h731986,_h731988,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(defeated)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(defeated)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(defeated)(_h732574,_h732576,_h732578,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(defeated))(_h732574,_h732576,_h732578,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(defeated_id)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(defeated_id)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(defeated_id)(_h733162,_h733164,_h733166,_h733168,_h733170,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(defeated_id))(_h733162,_h733164,_h733166,_h733168,_h733170,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(disqualified)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(disqualified)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(disqualified)(_h733806,_h733808,_h733810,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(disqualified))(_h733806,_h733808,_h733810,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(rebuts)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(rebuts)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(rebuts)(_h734458,_h734460,_h734462,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(rebuts))(_h734458,_h734460,_h734462,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(rebuts)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(rebuts)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(rebuts)(_h735014,_h735016,_h735018,_h735020,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(rebuts))(_h735014,_h735016,_h735018,_h735020,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(refutes)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(refutes)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(refutes)(_h735574,_h735576,_h735578,_h735580,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(refutes))(_h735574,_h735576,_h735578,_h735580,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(refutes)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(refutes)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(refutes)(_h736150,_h736152,_h736154,_h736156,_h736158,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(refutes))(_h736150,_h736152,_h736154,_h736156,_h736158,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(strict_candidate)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(strict_candidate)),4)),FLORA_FLEX_DYNAMIC_TYPE_CLAUSE))).
:-(FLORA_THIS_WORKSPACE(strict_candidate)(_h736730,_h736732,_h736734,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(strict_candidate))(_h736730,_h736732,_h736734,FWContext)).
 
#if !defined(FLORA_FLM_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLM_FILENAME  'atck1alt.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(atck1alt,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'atck1alt.fld'
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
#define FLORA_FLS_FILENAME  'atck1alt.fls'
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
?-(:(flrprolog,flora_define_modular_prolog([prolog(refutes,4,FLORA_THIS_MODULE_NAME),prolog(refutes,5,FLORA_THIS_MODULE_NAME)]))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(rebuts,3,FLORA_THIS_MODULE_NAME),prolog(rebuts,4,FLORA_THIS_MODULE_NAME)]))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(defeated,3,FLORA_THIS_MODULE_NAME),prolog(defeated_id,5,FLORA_THIS_MODULE_NAME)]))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(disqualified,3,FLORA_THIS_MODULE_NAME)]))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(competes,4,FLORA_THIS_MODULE_NAME),prolog(competes,3,FLORA_THIS_MODULE_NAME)]))).
?-(:(flrprolog,flora_define_modular_prolog([prolog('\\undefeated',5,FLORA_THIS_MODULE_NAME)]))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(beaten_by_strict_rule,3,FLORA_THIS_MODULE_NAME),prolog(beaten_by_strict_rule,5,FLORA_THIS_MODULE_NAME)]))).
:-(fllibexport([[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar1,howDefeated,__newdontcarevar2,__newcontextvar5))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar6,info,__newdontcarevar7,__newcontextvar10))]])).
:-(fllibexport([[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar1,flapply(opposers,__newdontcarevar2),__newdontcarevar3,__newcontextvar6))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar7,flapply(beater,__newdontcarevar8),__newdontcarevar9,__newcontextvar12))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(beater,__newdontcarevar13,__newdontcarevar14,__newdontcarevar15,__newcontextvar18))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(opposes,__newdontcarevar19,__newdontcarevar20,__newdontcarevar21,__newdontcarevar22,__newcontextvar25))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(overrides,__newdontcarevar26,__newdontcarevar27,__newdontcarevar28,__newdontcarevar29,__newcontextvar32))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(competes,__newdontcarevar33,__newdontcarevar34,__newcontextvar37))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(flapply(competes,__newdontcarevar38),__newdontcarevar39,__newdontcarevar40,__newcontextvar43))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(candidate,__newdontcarevar44,__newdontcarevar45,__newcontextvar48))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(strict_candidate,__newdontcarevar49,__newdontcarevar50,__newcontextvar53))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(defeated,__newdontcarevar54,__newdontcarevar55,__newcontextvar58))]])).
:-(FLORA_THIS_WORKSPACE(\\undefeated)(__Id,__FileName,__Vars,__H,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(4,'atck1alt.flr',FLORA_THIS_MODULE_NAME),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(defeated_id)(__Id,__FileName,__Vars,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),fllibexecute_delayed_calls([__FileName,__H,__Id,__Mod,__Vars],[]))),[__Id,__FileName,__Vars,__H,__Mod],99,'atck1alt.flr')))).
:-(FLORA_THIS_WORKSPACE(defeated_id)(__Id,__FileName,__Vars,__H,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(6,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrdescriptor_support,get_tag_descriptor_info(__Id,__FileName,__Mod,__T,__Vars)),FLORA_THIS_WORKSPACE(defeated)(__T,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),fllibexecute_delayed_calls([__FileName,__H,__Id,__Mod,__T,__Vars],[__FileName,__H,__Id,__Mod,__Vars])))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(change_module,4,FLORA_THIS_MODULE_NAME),prolog(change_module_nocheck,4,FLORA_THIS_MODULE_NAME),prolog(check_module_to_AT_association,1,FLORA_THIS_MODULE_NAME)]))).
:-(FLORA_THIS_WORKSPACE(change_module)(__InA,__Mod,__RealNewMod,__OutA,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(8,'change_module.flh',FLORA_THIS_MODULE_NAME),','(:(flrwrapper,flora_change_module(__InA,__OutA,','(FLORA_THIS_MODULE_NAME,__Mod),__RealNewMod,['In ',status,'(Tag,Head)[...]@',FLORA_THIS_MODULE_NAME,': Head must be bound'])),FLORA_THIS_WORKSPACE(check_module_to_AT_association)(__RealNewMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))).
:-(FLORA_THIS_WORKSPACE(change_module_nocheck)(__InA,__newdontcarevar1,__newdontcarevar2,__OutA,'_$ctxt'(_CallerModuleVar,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''rule_enabled'(10,'change_module.flh',FLORA_THIS_MODULE_NAME),','(:(flrdatatype,flora_is_var_prim(__InA)),','(!,=(__OutA,__InA))))).
:-(FLORA_THIS_WORKSPACE(change_module_nocheck)(__InA,__Mod,__RealNewMod,__OutA,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(12,'change_module.flh',FLORA_THIS_MODULE_NAME),','(:(flrwrapper,flora_change_module(__InA,__OutA,','(FLORA_THIS_MODULE_NAME,__Mod),__RealNewMod,'In defeated/overrides/opposes: something wrong')),FLORA_THIS_WORKSPACE(check_module_to_AT_association)(__RealNewMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))).
:-(FLORA_THIS_WORKSPACE(check_module_to_AT_association)(__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(14,'change_module.flh',FLORA_THIS_MODULE_NAME),','(:(flrwrapper,flora_is_system_module_name(__Mod)),','(!,'\\false')))).
:-(FLORA_THIS_WORKSPACE(check_module_to_AT_association)(__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(16,'change_module.flh',FLORA_THIS_MODULE_NAME),','(\+(:(flrregistry,flora_defeasible_module_registry(__Mod,FLORA_THIS_MODULE_NAME))),','(\==(__Mod,FLORA_THIS_MODULE_NAME),','(!,FLORA_WORKSPACE(\\system,d^tblflapply)(sysabort,['User module ',__Mod,' is not associated with the argumentation theory residing in module ',FLORA_THIS_MODULE_NAME],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))))).
:-(FLORA_THIS_WORKSPACE(check_module_to_AT_association)(__newdontcarevar1,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(18,'change_module.flh',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(candidate,__T,__H,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(20,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),FLORA_THIS_WORKSPACE(candidate)(__T,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),fllibexecute_delayed_calls([__H,__Mod,__T],[__H,__T])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(strict_candidate,__T,__H,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(22,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),FLORA_THIS_WORKSPACE(strict_candidate)(__T,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),fllibexecute_delayed_calls([__H,__Mod,__T],[__H,__T])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(defeated,__T,__H,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(24,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module_nocheck)(__H,__Mod,__RealMod,__MH,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(defeated)(__T,__MH,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__H,__MH,__Mod,__RealMod,__T],[__H,__T])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(opposes,__T1,__H1,__T2,__H2,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(26,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module_nocheck)(__H1,__Mod,__RealMod,__MH1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(change_module_nocheck)(__H2,__Mod,__RealMod,__MH2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),'_$_$_ergo''_opposes_aux'(__RealMod,__T1,__MH1,__T2,__MH2)))),fllibexecute_delayed_calls([__H1,__H2,__MH1,__MH2,__Mod,__RealMod,__T1,__T2],[__H1,__H2,__T1,__T2])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flapply(competes,__E),__H,__HH,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(28,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(competes)(__H,__HH,__E,__newdontcarevar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),fllibexecute_delayed_calls([__E,__H,__HH,__newdontcarevar6],[__E,__H,__HH])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(competes,__H,__HH,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(30,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(competes)(__H,__HH,__newdontcarevar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),fllibexecute_delayed_calls([__H,__HH,__newdontcarevar6],[__H,__HH])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(overrides,__T1,__H1,__T2,__H2,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(32,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module_nocheck)(__H1,__Mod,__RealMod,__MH1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(change_module_nocheck)(__H2,__Mod,__RealMod,__MH2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(:(flrdescriptor_support,synonymous_tag_with_head(__T1,__RealMod,__T11,__H1)),','(:(flrdescriptor_support,synonymous_tag_with_head(__T2,__RealMod,__T22,__H2)),'_$_$_ergo''_overrides_aux'(__RealMod,__T11,__MH1,__T22,__MH2)))))),fllibexecute_delayed_calls([__H1,__H2,__MH1,__MH2,__Mod,__RealMod,__T1,__T11,__T2,__T22],[__H1,__H2,__T1,__T2])))).
:-(FLORA_THIS_WORKSPACE(defeated)(___T,__H,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(34,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','(','(FLORA_THIS_WORKSPACE(d^mvd)(__Exclusion,flapply(opposers,__Mod),__H1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^mvd)(__Exclusion,flapply(opposers,__Mod),__H,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))),','(','(','(fllibmodobj(body,libmod_wrapper,__H1,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9),__newvar7),fllibmodobj(body,libmod_wrapper,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12),__newvar10)),fllibdelayedliteral('!=','atck1alt.flr',144,[__newvar7,__newvar10])),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^mvd)(__Exclusion,flapply(beater,__Mod),__H,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14)),fllibexecute_delayed_calls([__Exclusion,__H,__Mod],[]))),[__Exclusion,__Mod,__H],145,'atck1alt.flr')))),fllibexecute_delayed_calls([__Exclusion,__H,__H1,__Mod],[__H,__Mod,___T])))).
:-(FLORA_THIS_WORKSPACE(defeated)(__T,__H,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(36,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''_opposes_aux'(__Mod,__T,__H,___OtherT,__OtherH),','(','(','(fllibmodobj(body,libmod_wrapper,__OtherH,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5),__newvar3),fllibmodobj(body,libmod_wrapper,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8),__newvar6)),fllibdelayedliteral('!=','atck1alt.flr',149,[__newvar3,__newvar6])),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(beater,__H,__OtherH,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),fllibexecute_delayed_calls([__H,__Mod,__OtherH],[]))),[__H,__OtherH,__Mod],150,'atck1alt.flr')))),fllibexecute_delayed_calls([__H,__Mod,__OtherH,__T,___OtherT],[__H,__Mod,__T])))).
:-(FLORA_THIS_WORKSPACE(defeated)(__T,__H,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(38,'atck1alt.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(disqualified)(__T,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Exclusion,flapply(beater,__Mod),__H,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(40,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(beater_aux,__H,__newdontcarevar3,__Exclusion,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),fllibexecute_delayed_calls([__Exclusion,__H,__Mod,__newdontcarevar6],[__Exclusion,__H,__Mod])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(beater_aux,__H,__BeatenH,__Exclusion,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(42,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(competes)(__H,__BeatenH,__Exclusion,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^tblflapply)(dominates,__H,__BeatenH,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(beater,__H,__BeatenH,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(44,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(competes)(__H,__BeatenH,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^tblflapply)(dominates,__H,__BeatenH,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))).
:-(FLORA_THIS_WORKSPACE(disqualified)(__T,__H,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(46,'atck1alt.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(__T,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(disqualified)(__T,__H,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(48,'atck1alt.flr',FLORA_THIS_MODULE_NAME),'_$_$_ergo''_cancel_aux'(__Mod,__T,__H))).
:-(FLORA_THIS_WORKSPACE(disqualified)(__T,__H,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(50,'atck1alt.flr',FLORA_THIS_MODULE_NAME),'_$_$_ergo''_overriden_cancellation'(__T,__H,__Mod))).
:-(FLORA_THIS_WORKSPACE(refutes)(__H1,__T2,__H2,__Exclusion,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(52,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(competes)(__H1,__H2,__Exclusion,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(flrdescriptor_support,synonymous_tag_with_head(__T2,__Mod,__T22,__H2)),','('_$_$_ergo''_overrides_aux'(__Mod,__T1,__H1,__T22,__H2),FLORA_THIS_WORKSPACE(candidate)(__T1,__H1,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))),fllibexecute_delayed_calls([__Exclusion,__H1,__H2,__Mod,__T1,__T2,__T22],[__Exclusion,__H1,__H2,__Mod,__T2])))).
:-(FLORA_THIS_WORKSPACE(refutes)(__H1,__T2,__H2,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(54,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(competes)(__H1,__H2,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(flrdescriptor_support,synonymous_tag_with_head(__T2,__Mod,__T22,__H2)),','('_$_$_ergo''_overrides_aux'(__Mod,__T1,__H1,__T22,__H2),FLORA_THIS_WORKSPACE(candidate)(__T1,__H1,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))),fllibexecute_delayed_calls([__H1,__H2,__Mod,__T1,__T2,__T22],[__H1,__H2,__Mod,__T2])))).
:-(FLORA_THIS_WORKSPACE(rebuts)(__H1,__H2,__Exclusion,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(56,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(competes)(__H1,__H2,__Exclusion,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(candidate)(__T1,__H1,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(refutes)(__H2,__T1,__H1,__Exclusion,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),fllibexecute_delayed_calls([__Exclusion,__H1,__H2,__Mod,__T1],[]))),[__H2,__T1,__H1,__Exclusion,__Mod],205,'atck1alt.flr')))),fllibexecute_delayed_calls([__Exclusion,__H1,__H2,__Mod,__T1],[__Exclusion,__H1,__H2,__Mod])))).
:-(FLORA_THIS_WORKSPACE(rebuts)(__H1,__H2,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(58,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(competes)(__H1,__H2,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(candidate)(__T1,__H1,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(refutes)(__H2,__T1,__H1,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),fllibexecute_delayed_calls([__H1,__H2,__Mod,__T1],[]))),[__H2,__T1,__H1,__Mod],210,'atck1alt.flr')))),fllibexecute_delayed_calls([__H1,__H2,__Mod,__T1],[__H1,__H2,__Mod])))).
:-(FLORA_THIS_WORKSPACE(competes)(__H1,__H2,__Exclusion,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(60,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__Exclusion,flapply(opposers,__Mod),__H1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^mvd)(__Exclusion,flapply(opposers,__Mod),__H2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))),fllibdelayedliteral('!=','atck1alt.flr',216,[__H1,__H2])))).
:-(FLORA_THIS_WORKSPACE(competes)(__H1,__H2,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(62,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''_opposes_aux'(__Mod,___T1,__H1,___T2,__H2),fllibdelayedliteral('!=','atck1alt.flr',220,[__H1,__H2])),fllibexecute_delayed_calls([__H1,__H2,__Mod,___T1,___T2],[__H1,__H2,__Mod])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(competitors,__H1,__H2,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(64,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(';'(FLORA_THIS_WORKSPACE(competes)(__H1,__H2,___Exclusion,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(competes)(__H1,__H2,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))),fllibexecute_delayed_calls([__H1,__H2,__Mod,___Exclusion],[__H1,__H2,__Mod])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(dominates,__Lit,__DomineeH,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(66,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrdescriptor_support,get_ruleid_by_tag_or_head(__newdontcarevar3,__Lit,__Mod,__Id,__FileName)),','(:(flrdescriptor_support,is_defeasible_rule(__Id,__FileName,__Mod)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(competitors,__Lit,__DomineeH,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(existsRuleWithNoOverrider,__Lit,__DomineeH,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),fllibexecute_delayed_calls([__DomineeH,__Lit,__Mod],[]))),[__Lit,__DomineeH,__Mod],242,'atck1alt.flr'))))),fllibexecute_delayed_calls([__DomineeH,__FileName,__Id,__Lit,__Mod,__newdontcarevar8],[__DomineeH,__Lit,__Mod])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(existsRuleWithNoOverrider,__Lit,__DomineeH,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(68,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(candidate)(__DomineeTag,__DomineeH,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(','(FLORA_THIS_WORKSPACE(candidate)(__newquantvar8,__Lit,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(:(flrdescriptor_support,synonymous_tag_with_head(__newquantvar8,__Mod,__newquantvar9,__Lit)),','(:(flrdescriptor_support,synonymous_tag_with_head(__DomineeTag,__Mod,__newquantvar7,__DomineeH)),'_$_$_ergo''_overrides_aux'(__Mod,__newquantvar9,__Lit,__newquantvar7,__DomineeH)))),fllibexecute_delayed_calls([__DomineeH,__DomineeTag,__Lit,__Mod,__newquantvar7,__newquantvar8,__newquantvar9],[]))),[__Lit,__Mod,__Mod,__Lit,__DomineeTag,__Mod,__DomineeH,__Mod,__Lit,__DomineeH],246,'atck1alt.flr'))),fllibexecute_delayed_calls([__DomineeH,__DomineeTag,__Lit,__Mod],[__DomineeH,__Lit,__Mod])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,__T,__H),howDefeated,flapply(notBeaterFor,__Exclusion),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(70,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__Exclusion,flapply(opposers,__RealMod),__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_THIS_WORKSPACE(d^mvd)(__Exclusion,flapply(opposers,__RealMod),__OtherH,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))),','(','(','(fllibmodobj(body,libmod_wrapper,__HM,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11),__newvar9),fllibmodobj(body,libmod_wrapper,__OtherH,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14),__newvar12)),fllibdelayedliteral('!=','atck1alt.flr',265,[__newvar9,__newvar12])),','(FLORA_THIS_WORKSPACE(candidate)(__T,__HM,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,__newcontextvar16)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^mvd)(__Exclusion,flapply(beater,__RealMod),__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar17,__newcontextvar18)),fllibexecute_delayed_calls([__Exclusion,__HM,__RealMod],[]))),[__Exclusion,__RealMod,__HM],267,'atck1alt.flr'))))))),fllibexecute_delayed_calls([__Exclusion,__H,__HM,__Mod,__OtherH,__RealMod,__T],[__Exclusion,__H,__T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,__T,__H),howDefeated,flapply(notBeaterFor,flapply(binaryExclusion,__HM,__BeatenH)),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(72,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''_opposes_aux'(__RealMod,__T,__HM,__newdontcarevar5,__BeatenH),','(FLORA_THIS_WORKSPACE(candidate)(__T,__HM,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(beater,__HM,__BeatenH,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),fllibexecute_delayed_calls([__BeatenH,__HM,__RealMod],[]))),[__HM,__BeatenH,__RealMod],273,'atck1alt.flr')))))),fllibexecute_delayed_calls([__BeatenH,__H,__HM,__Mod,__RealMod,__T,__newdontcarevar10],[__BeatenH,__H,__HM,__T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,__T,__H),howDefeated,canceled,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(74,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),'_$_$_ergo''_cancel_aux'(__RealMod,__T,__HM))),fllibexecute_delayed_calls([__H,__HM,__Mod,__RealMod,__T],[__H,__T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,__T,__H),howDefeated,flapply(beatenByStrictRule,__SH),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(76,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(__T,__HM,__newdontcarevar5,__SH,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)))),fllibexecute_delayed_calls([__H,__HM,__Mod,__RealMod,__SH,__T,__newdontcarevar8],[__H,__SH,__T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,___T,__H),info,flapply(dominates,__DomineeH),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(78,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^tblflapply)(dominates,__HM,__DomineeH,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__DomineeH,__H,__HM,__Mod,__RealMod],[__DomineeH,__H,___T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,___T,__H),info,flapply(refutes,__RefutedT,__RefutedH),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(80,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(refutes)(__HM,__RefutedT,__RefutedH,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__H,__HM,__Mod,__RealMod,__RefutedH,__RefutedT],[__H,__RefutedH,__RefutedT,___T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,___T,__H),info,flapply(refutes,__RefutedT,__RefutedH),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(82,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(refutes)(__HM,__RefutedT,__RefutedH,___Exclusion,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__H,__HM,__Mod,__RealMod,__RefutedH,__RefutedT,___Exclusion],[__H,__RefutedH,__RefutedT,___T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,___T,__H),info,flapply(rebuts,__Rebutted),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(84,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(rebuts)(__HM,__Rebutted,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__H,__HM,__Mod,__RealMod,__Rebutted],[__H,__Rebutted,___T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,___T,__H),info,flapply(rebuts,__Rebutted),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(86,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(rebuts)(__HM,__Rebutted,___Exclusion,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__H,__HM,__Mod,__RealMod,__Rebutted,___Exclusion],[__H,__Rebutted,___T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,___T,__H),info,flapply(beats,__Exclusion,__BeatenH),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(88,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^tblflapply)(beater_aux,__HM,__BeatenH,__Exclusion,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__BeatenH,__Exclusion,__H,__HM,__Mod,__RealMod],[__BeatenH,__Exclusion,__H,___T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,___T,__H),info,flapply(beats,__BeatenH),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(90,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^tblflapply)(beater,__HM,__BeatenH,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__BeatenH,__H,__HM,__Mod,__RealMod],[__BeatenH,__H,___T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,___T,__H),info,flapply(competes,__Exclusion,__Competitor),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(92,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(competes)(__HM,__Competitor,__Exclusion,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_THIS_WORKSPACE(candidate)(__newdontcarevar7,__Competitor,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9))))),fllibexecute_delayed_calls([__Competitor,__Exclusion,__H,__HM,__Mod,__RealMod,__newdontcarevar10],[__Competitor,__Exclusion,__H,___T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,___T,__H),info,flapply(competes,__Competitor),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(94,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(competes)(__HM,__Competitor,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_THIS_WORKSPACE(candidate)(__newdontcarevar7,__Competitor,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9))))),fllibexecute_delayed_calls([__Competitor,__H,__HM,__Mod,__RealMod,__newdontcarevar10],[__Competitor,__H,___T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,__T,__H),info,candidate,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(96,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(candidate)(__T,__HM,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__H,__HM,__Mod,__RealMod,__T],[__H,__T])))).
:-(FLORA_THIS_WORKSPACE(candidate)(__T,__Head,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(98,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','(current_prolog_flag(max_table_subgoal_size,__TermDepth),','(set_prolog_flag(max_table_subgoal_size,0),','(','(fllibmodobj(body,libmod_wrapper,__Head,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5),__newvar3),=(__ModHead,__newvar3)),','(:(flrdescriptor_support,get_ruleid_by_tag_or_head(__T,__ModHead,__Mod,__Id,__FileName)),','(:(flrcanon,show_rule_by_id(__Id,__FileName,__Mod,__ModHead,__Body)),','(:(flrdescriptor_support,is_defeasible_rule(__Id,__FileName,__Mod)),','(fllibmodlit(libmod_wrapper,__Body,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),set_prolog_flag(max_table_subgoal_size,__TermDepth)))))))),fllibexecute_delayed_calls([__Body,__FileName,__Head,__Id,__Mod,__ModHead,__T,__TermDepth],[__Head,__Mod,__T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Exclusion,flapply(opposers,__Mod),__HH,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(100,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','(','(fllibmodlit('d^mvd',[__Exclusion,'\\opposers',__H,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),fllibmodlit('d^isa',[__Exclusion,'\\Exclusion','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))),','(fllibmodobj(body,libmod_wrapper,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar13),__newvar11),=(__HH,__newvar11))),fllibexecute_delayed_calls([__Exclusion,__H,__HH,__Mod],[__Exclusion,__HH,__Mod])))).
:-(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(__T,__H,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(102,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(__T,__H,__newdontcarevar3,__newdontcarevar4,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__H,__Mod,__T,__newdontcarevar7],[__H,__Mod,__T])))).
:-(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(__T,__H,__StrictT,__StrictH,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(104,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(candidate)(__T,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''_opposes_aux'(__Mod,__T,__H,__StrictT,__StrictH),';'(','(:(flrstorageutils,'\\isbasefact'(__StrictH)),!),FLORA_THIS_WORKSPACE(strict_candidate)(__StrictT,__StrictH,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))))).
:-(FLORA_THIS_WORKSPACE(strict_candidate)(__T,__Head,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(106,'atck1alt.flr',FLORA_THIS_MODULE_NAME),','(','(current_prolog_flag(max_table_subgoal_size,__TermDepth),','(set_prolog_flag(max_table_subgoal_size,0),','(','(fllibmodobj(body,libmod_wrapper,__Head,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5),__newvar3),=(__ModHead,__newvar3)),','(:(flrdescriptor_support,get_ruleid_by_tag_or_head(__T,__ModHead,__Mod,__Id,__FileName)),','(:(flrcanon,show_rule_by_id(__Id,__FileName,__Mod,__ModHead,__Body)),','(:(flrdescriptor_support,is_strict_rule(__Id,__FileName,__Mod)),','(fllibmodlit(libmod_wrapper,__Body,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),set_prolog_flag(max_table_subgoal_size,__TermDepth)))))))),fllibexecute_delayed_calls([__Body,__FileName,__Head,__Id,__Mod,__ModHead,__T,__TermDepth],[__Head,__Mod,__T])))).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rule signatures %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%% Signatures for latent queries %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%% Queries found in the source file %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(fllibmodobj(body,'d^mvd',[__newdontcarevar1,'\\opposers',__newdontcarevar2,'_$ctxt'(__newcontextvar3,__newcontextvar5,__newcontextvar4)],__newdontcarevar6,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar7),__newvar9),FLORA_WORKSPACE(\\system,d^meth)('Method',flapply(mustDefine,off,__newvar9),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar10)))),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(','(fllibmodobj(body,'d^isa',[__newdontcarevar1,'\\Exclusion','_$ctxt'(__newcontextvar2,__newcontextvar3,__newcontextvar4)],__newdontcarevar5,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7),__newvar8),FLORA_WORKSPACE(\\system,d^meth)('Method',flapply(mustDefine,off,__newvar8),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10))),','(fllibmodobj(body,'d^sub',[__newdontcarevar11,'\\Exclusion','_$ctxt'(__newcontextvar12,__newcontextvar13,__newcontextvar14)],__newdontcarevar15,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar16,__newcontextvar17),__newvar18),FLORA_WORKSPACE(\\system,d^meth)('Method',flapply(mustDefine,off,__newvar18),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar19,__newcontextvar20))))),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),:(flrarguments,flora_set_argdef(status,2,[oid,meta],FLORA_THIS_MODULE_NAME))),[])).

 
#if !defined(FLORA_FLS2_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLS2_FILENAME  'atck1alt.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('atck1alt.ergo',FLORA_THIS_MODULE_NAME))).

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

:-(FLORA_THIS_WORKSPACE(\\undefeated)(_h762553,_h762555,_h762557,_h762559,_h762561,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(\\undefeated))(_h762553,_h762555,_h762557,_h762559,_h762561,FWContext)).
:-(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(_h763206,_h763208,_h763210,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beaten_by_strict_rule))(_h763206,_h763208,_h763210,FWContext)).
:-(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(_h763997,_h763999,_h764001,_h764003,_h764005,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beaten_by_strict_rule))(_h763997,_h763999,_h764001,_h764003,_h764005,FWContext)).
:-(FLORA_THIS_WORKSPACE(candidate)(_h764796,_h764798,_h764800,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(candidate))(_h764796,_h764798,_h764800,FWContext)).
:-(FLORA_THIS_WORKSPACE(change_module)(_h765395,_h765397,_h765399,_h765401,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(change_module))(_h765395,_h765397,_h765399,_h765401,FWContext)).
:-(FLORA_THIS_WORKSPACE(change_module_nocheck)(_h766062,_h766064,_h766066,_h766068,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(change_module_nocheck))(_h766062,_h766064,_h766066,_h766068,FWContext)).
:-(FLORA_THIS_WORKSPACE(check_module_to_AT_association)(_h766857,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(check_module_to_AT_association))(_h766857,FWContext)).
:-(FLORA_THIS_WORKSPACE(competes)(_h767784,_h767786,_h767788,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(competes))(_h767784,_h767786,_h767788,FWContext)).
:-(FLORA_THIS_WORKSPACE(competes)(_h768367,_h768369,_h768371,_h768373,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(competes))(_h768367,_h768369,_h768371,_h768373,FWContext)).
:-(FLORA_THIS_WORKSPACE(defeated)(_h768954,_h768956,_h768958,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(defeated))(_h768954,_h768956,_h768958,FWContext)).
:-(FLORA_THIS_WORKSPACE(defeated_id)(_h769537,_h769539,_h769541,_h769543,_h769545,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(defeated_id))(_h769537,_h769539,_h769541,_h769543,_h769545,FWContext)).
:-(FLORA_THIS_WORKSPACE(disqualified)(_h770176,_h770178,_h770180,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(disqualified))(_h770176,_h770178,_h770180,FWContext)).
:-(FLORA_THIS_WORKSPACE(rebuts)(_h770823,_h770825,_h770827,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(rebuts))(_h770823,_h770825,_h770827,FWContext)).
:-(FLORA_THIS_WORKSPACE(rebuts)(_h771374,_h771376,_h771378,_h771380,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(rebuts))(_h771374,_h771376,_h771378,_h771380,FWContext)).
:-(FLORA_THIS_WORKSPACE(refutes)(_h771929,_h771931,_h771933,_h771935,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(refutes))(_h771929,_h771931,_h771933,_h771935,FWContext)).
:-(FLORA_THIS_WORKSPACE(refutes)(_h772500,_h772502,_h772504,_h772506,_h772508,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(refutes))(_h772500,_h772502,_h772504,_h772506,_h772508,FWContext)).
:-(FLORA_THIS_WORKSPACE(strict_candidate)(_h773075,_h773077,_h773079,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(strict_candidate))(_h773075,_h773077,_h773079,FWContext)).
