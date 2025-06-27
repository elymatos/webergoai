
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
#define FLORA_THIS_FILENAME  'atck2.ergo'
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
  file: syslibinc/flrcontrol_inc.flh

  Author(s): Michael Kifer
	     Guizhen Yang

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBCONTROL))).

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
:-(FLORA_THIS_WORKSPACE(\\undefeated)(_h792052,_h792054,_h792056,_h792058,_h792060,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(\\undefeated))(_h792052,_h792054,_h792056,_h792058,_h792060,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beaten_by_strict_rule)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beaten_by_strict_rule)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(_h792710,_h792712,_h792714,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beaten_by_strict_rule))(_h792710,_h792712,_h792714,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beaten_by_strict_rule)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beaten_by_strict_rule)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(_h793506,_h793508,_h793510,_h793512,_h793514,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beaten_by_strict_rule))(_h793506,_h793508,_h793510,_h793512,_h793514,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(candidate)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(candidate)),4)),FLORA_FLEX_DYNAMIC_TYPE_CLAUSE))).
:-(FLORA_THIS_WORKSPACE(candidate)(_h794310,_h794312,_h794314,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(candidate))(_h794310,_h794312,_h794314,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(change_module)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(change_module)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(change_module)(_h794914,_h794916,_h794918,_h794920,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(change_module))(_h794914,_h794916,_h794918,_h794920,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(change_module_nocheck)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(change_module_nocheck)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(change_module_nocheck)(_h795586,_h795588,_h795590,_h795592,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(change_module_nocheck))(_h795586,_h795588,_h795590,_h795592,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(check_module_to_AT_association)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(check_module_to_AT_association)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(check_module_to_AT_association)(_h796386,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(check_module_to_AT_association))(_h796386,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(competes)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(competes)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(competes)(_h797318,_h797320,_h797322,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(competes))(_h797318,_h797320,_h797322,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(competes)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(competes)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(competes)(_h797906,_h797908,_h797910,_h797912,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(competes))(_h797906,_h797908,_h797910,_h797912,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(defeated)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(defeated)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(defeated)(_h798498,_h798500,_h798502,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(defeated))(_h798498,_h798500,_h798502,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(defeated_id)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(defeated_id)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(defeated_id)(_h799086,_h799088,_h799090,_h799092,_h799094,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(defeated_id))(_h799086,_h799088,_h799090,_h799092,_h799094,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(disqualified)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(disqualified)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(disqualified)(_h799730,_h799732,_h799734,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(disqualified))(_h799730,_h799732,_h799734,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(rebuts)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(rebuts)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(rebuts)(_h800382,_h800384,_h800386,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(rebuts))(_h800382,_h800384,_h800386,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(rebuts)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(rebuts)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(rebuts)(_h800938,_h800940,_h800942,_h800944,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(rebuts))(_h800938,_h800940,_h800942,_h800944,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(refutes)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(refutes)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(refutes)(_h801498,_h801500,_h801502,_h801504,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(refutes))(_h801498,_h801500,_h801502,_h801504,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(refutes)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(refutes)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(refutes)(_h802074,_h802076,_h802078,_h802080,_h802082,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(refutes))(_h802074,_h802076,_h802078,_h802080,_h802082,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(strict_candidate)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(strict_candidate)),4)),FLORA_FLEX_DYNAMIC_TYPE_CLAUSE))).
:-(FLORA_THIS_WORKSPACE(strict_candidate)(_h802654,_h802656,_h802658,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(strict_candidate))(_h802654,_h802656,_h802658,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(tightBinaryExclusion)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(tightBinaryExclusion)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(tightBinaryExclusion)(_h803370,_h803372,_h803374,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(tightBinaryExclusion))(_h803370,_h803372,_h803374,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(tightExclusion)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(tightExclusion)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(tightExclusion)(_h804150,_h804152,_h804154,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(tightExclusion))(_h804150,_h804152,_h804154,FWContext)).
 
#if !defined(FLORA_FLM_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLM_FILENAME  'atck2.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(atck2,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'atck2.fld'
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
#define FLORA_FLS_FILENAME  'atck2.fls'
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
?-(:(flrprolog,flora_define_modular_prolog([prolog(tightExclusion,3,FLORA_THIS_MODULE_NAME),prolog(tightBinaryExclusion,3,FLORA_THIS_MODULE_NAME)]))).
:-(fllibexport([[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar1,howDefeated,__newdontcarevar2,__newcontextvar5))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar6,info,__newdontcarevar7,__newcontextvar10))]])).
:-(fllibexport([[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar1,flapply(opposers,__newdontcarevar2),__newdontcarevar3,__newcontextvar6))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar7,flapply(beater,__newdontcarevar8),__newdontcarevar9,__newcontextvar12))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(beater,__newdontcarevar13,__newdontcarevar14,__newdontcarevar15,__newcontextvar18))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(stomped,__newdontcarevar19,__newdontcarevar20,__newcontextvar23))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(dominates,__newdontcarevar24,__newdontcarevar25,__newdontcarevar26,__newcontextvar29))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(opposes,__newdontcarevar30,__newdontcarevar31,__newdontcarevar32,__newdontcarevar33,__newcontextvar36))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(overrides,__newdontcarevar37,__newdontcarevar38,__newdontcarevar39,__newdontcarevar40,__newcontextvar43))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(competes,__newdontcarevar44,__newdontcarevar45,__newcontextvar48))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(flapply(competes,__newdontcarevar49),__newdontcarevar50,__newdontcarevar51,__newcontextvar54))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(candidate,__newdontcarevar55,__newdontcarevar56,__newcontextvar59))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(strict_candidate,__newdontcarevar60,__newdontcarevar61,__newcontextvar64))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(defeated,__newdontcarevar65,__newdontcarevar66,__newcontextvar69))]])).
:-(FLORA_THIS_WORKSPACE(\\undefeated)(__Id,__FileName,__Vars,__H,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(4,'atck2.flr',FLORA_THIS_MODULE_NAME),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(defeated_id)(__Id,__FileName,__Vars,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),fllibexecute_delayed_calls([__FileName,__H,__Id,__Mod,__Vars],[]))),[__Id,__FileName,__Vars,__H,__Mod],103,'atck2.flr')))).
:-(FLORA_THIS_WORKSPACE(defeated_id)(__Id,__FileName,__Vars,__H,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(6,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrdescriptor_support,get_tag_descriptor_info(__Id,__FileName,__Mod,__T,__Vars)),FLORA_THIS_WORKSPACE(defeated)(__T,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),fllibexecute_delayed_calls([__FileName,__H,__Id,__Mod,__T,__Vars],[__FileName,__H,__Id,__Mod,__Vars])))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(change_module,4,FLORA_THIS_MODULE_NAME),prolog(change_module_nocheck,4,FLORA_THIS_MODULE_NAME),prolog(check_module_to_AT_association,1,FLORA_THIS_MODULE_NAME)]))).
:-(FLORA_THIS_WORKSPACE(change_module)(__InA,__Mod,__RealNewMod,__OutA,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(8,'change_module.flh',FLORA_THIS_MODULE_NAME),','(:(flrwrapper,flora_change_module(__InA,__OutA,','(FLORA_THIS_MODULE_NAME,__Mod),__RealNewMod,['In ',status,'(Tag,Head)[...]@',FLORA_THIS_MODULE_NAME,': Head must be bound'])),FLORA_THIS_WORKSPACE(check_module_to_AT_association)(__RealNewMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))).
:-(FLORA_THIS_WORKSPACE(change_module_nocheck)(__InA,__newdontcarevar1,__newdontcarevar2,__OutA,'_$ctxt'(_CallerModuleVar,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''rule_enabled'(10,'change_module.flh',FLORA_THIS_MODULE_NAME),','(:(flrdatatype,flora_is_var_prim(__InA)),','(!,=(__OutA,__InA))))).
:-(FLORA_THIS_WORKSPACE(change_module_nocheck)(__InA,__Mod,__RealNewMod,__OutA,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(12,'change_module.flh',FLORA_THIS_MODULE_NAME),','(:(flrwrapper,flora_change_module(__InA,__OutA,','(FLORA_THIS_MODULE_NAME,__Mod),__RealNewMod,'In defeated/overrides/opposes: something wrong')),FLORA_THIS_WORKSPACE(check_module_to_AT_association)(__RealNewMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))).
:-(FLORA_THIS_WORKSPACE(check_module_to_AT_association)(__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(14,'change_module.flh',FLORA_THIS_MODULE_NAME),','(:(flrwrapper,flora_is_system_module_name(__Mod)),','(!,'\\false')))).
:-(FLORA_THIS_WORKSPACE(check_module_to_AT_association)(__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(16,'change_module.flh',FLORA_THIS_MODULE_NAME),','(\+(:(flrregistry,flora_defeasible_module_registry(__Mod,FLORA_THIS_MODULE_NAME))),','(\==(__Mod,FLORA_THIS_MODULE_NAME),','(!,FLORA_WORKSPACE(\\system,d^tblflapply)(sysabort,['User module ',__Mod,' is not associated with the argumentation theory residing in module ',FLORA_THIS_MODULE_NAME],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))))).
:-(FLORA_THIS_WORKSPACE(check_module_to_AT_association)(__newdontcarevar1,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(18,'change_module.flh',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(candidate,__T,__H,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(20,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),FLORA_THIS_WORKSPACE(candidate)(__T,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),fllibexecute_delayed_calls([__H,__Mod,__T],[__H,__T])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(strict_candidate,__T,__H,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(22,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),FLORA_THIS_WORKSPACE(strict_candidate)(__T,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),fllibexecute_delayed_calls([__H,__Mod,__T],[__H,__T])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(defeated,__T,__H,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(24,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module_nocheck)(__H,__Mod,__RealMod,__MH,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(defeated)(__T,__MH,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__H,__MH,__Mod,__RealMod,__T],[__H,__T])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(opposes,__T1,__H1,__T2,__H2,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(26,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module_nocheck)(__H1,__Mod,__RealMod,__MH1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(change_module_nocheck)(__H2,__Mod,__RealMod,__MH2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),'_$_$_ergo''_opposes_aux'(__RealMod,__T1,__MH1,__T2,__MH2)))),fllibexecute_delayed_calls([__H1,__H2,__MH1,__MH2,__Mod,__RealMod,__T1,__T2],[__H1,__H2,__T1,__T2])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flapply(competes,__E),__H,__HH,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(28,'atck2.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(competes)(__H,__HH,__E,__newdontcarevar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),fllibexecute_delayed_calls([__E,__H,__HH,__newdontcarevar6],[__E,__H,__HH])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(competes,__H,__HH,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(30,'atck2.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(competes)(__H,__HH,__newdontcarevar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),fllibexecute_delayed_calls([__H,__HH,__newdontcarevar6],[__H,__HH])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(overrides,__T1,__H1,__T2,__H2,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(32,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module_nocheck)(__H1,__Mod,__RealMod,__MH1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(change_module_nocheck)(__H2,__Mod,__RealMod,__MH2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(:(flrdescriptor_support,synonymous_tag_with_head(__T1,__RealMod,__T11,__H1)),','(:(flrdescriptor_support,synonymous_tag_with_head(__T2,__RealMod,__T22,__H2)),'_$_$_ergo''_overrides_aux'(__RealMod,__T11,__MH1,__T22,__MH2)))))),fllibexecute_delayed_calls([__H1,__H2,__MH1,__MH2,__Mod,__RealMod,__T1,__T11,__T2,__T22],[__H1,__H2,__T1,__T2])))).
:-(FLORA_THIS_WORKSPACE(defeated)(___T,__H,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(34,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','(','(FLORA_THIS_WORKSPACE(d^mvd)(__Exclusion,flapply(opposers,__Mod),__H1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^mvd)(__Exclusion,flapply(opposers,__Mod),__H,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))),','(','(','(fllibmodobj(body,libmod_wrapper,__H1,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9),__newvar7),fllibmodobj(body,libmod_wrapper,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12),__newvar10)),fllibdelayedliteral('!=','atck2.flr',148,[__newvar7,__newvar10])),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^mvd)(__Exclusion,flapply(beater,__Mod),__H,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14)),fllibexecute_delayed_calls([__Exclusion,__H,__Mod],[]))),[__Exclusion,__Mod,__H],149,'atck2.flr')))),fllibexecute_delayed_calls([__Exclusion,__H,__H1,__Mod],[__H,__Mod,___T])))).
:-(FLORA_THIS_WORKSPACE(defeated)(__T,__H,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(36,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''_opposes_aux'(__Mod,__T,__H,___OtherT,__OtherH),','(','(','(fllibmodobj(body,libmod_wrapper,__OtherH,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5),__newvar3),fllibmodobj(body,libmod_wrapper,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8),__newvar6)),fllibdelayedliteral('!=','atck2.flr',153,[__newvar3,__newvar6])),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(beater,__H,__OtherH,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),fllibexecute_delayed_calls([__H,__Mod,__OtherH],[]))),[__H,__OtherH,__Mod],154,'atck2.flr')))),fllibexecute_delayed_calls([__H,__Mod,__OtherH,__T,___OtherT],[__H,__Mod,__T])))).
:-(FLORA_THIS_WORKSPACE(defeated)(__T,__H,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(38,'atck2.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(disqualified)(__T,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Exclusion,flapply(beater,__Mod),__H,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(40,'atck2.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(beater_aux,__H,__newdontcarevar3,__Exclusion,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),fllibexecute_delayed_calls([__Exclusion,__H,__Mod,__newdontcarevar6],[__Exclusion,__H,__Mod])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(beater_aux,__H,__BeatenH,__Exclusion,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(42,'atck2.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(competes)(__H,__BeatenH,__Exclusion,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),';'(FLORA_THIS_WORKSPACE(d^tblflapply)(dominates,__H,__BeatenH,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_THIS_WORKSPACE(d^tblflapply)(stomped,__BeatenH,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(beater,__H,__BeatenH,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(44,'atck2.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(competes)(__H,__BeatenH,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),';'(FLORA_THIS_WORKSPACE(d^tblflapply)(dominates,__H,__BeatenH,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_THIS_WORKSPACE(d^tblflapply)(stomped,__BeatenH,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)))))).
:-(FLORA_THIS_WORKSPACE(disqualified)(__T,__H,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(46,'atck2.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(__T,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(disqualified)(__T,__H,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(48,'atck2.flr',FLORA_THIS_MODULE_NAME),'_$_$_ergo''_cancel_aux'(__Mod,__T,__H))).
:-(FLORA_THIS_WORKSPACE(disqualified)(__T,__H,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(50,'atck2.flr',FLORA_THIS_MODULE_NAME),'_$_$_ergo''_overriden_cancellation'(__T,__H,__Mod))).
:-(FLORA_THIS_WORKSPACE(refutes)(__H1,__T2,__H2,__Exclusion,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(52,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(competes)(__H1,__H2,__Exclusion,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(flrdescriptor_support,synonymous_tag_with_head(__T2,__Mod,__T22,__H2)),','('_$_$_ergo''_overrides_aux'(__Mod,__T1,__H1,__T22,__H2),FLORA_THIS_WORKSPACE(candidate)(__T1,__H1,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))),fllibexecute_delayed_calls([__Exclusion,__H1,__H2,__Mod,__T1,__T2,__T22],[__Exclusion,__H1,__H2,__Mod,__T2])))).
:-(FLORA_THIS_WORKSPACE(refutes)(__H1,__T2,__H2,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(54,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(competes)(__H1,__H2,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(flrdescriptor_support,synonymous_tag_with_head(__T2,__Mod,__T22,__H2)),','('_$_$_ergo''_overrides_aux'(__Mod,__T1,__H1,__T22,__H2),FLORA_THIS_WORKSPACE(candidate)(__T1,__H1,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))),fllibexecute_delayed_calls([__H1,__H2,__Mod,__T1,__T2,__T22],[__H1,__H2,__Mod,__T2])))).
:-(FLORA_THIS_WORKSPACE(rebuts)(__H1,__H2,__Exclusion,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(56,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(competes)(__H1,__H2,__Exclusion,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(candidate)(__T1,__H1,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(refutes)(__H2,__T1,__H1,__Exclusion,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),fllibexecute_delayed_calls([__Exclusion,__H1,__H2,__Mod,__T1],[]))),[__H2,__T1,__H1,__Exclusion,__Mod],223,'atck2.flr')))),fllibexecute_delayed_calls([__Exclusion,__H1,__H2,__Mod,__T1],[__Exclusion,__H1,__H2,__Mod])))).
:-(FLORA_THIS_WORKSPACE(rebuts)(__H1,__H2,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(58,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(competes)(__H1,__H2,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(candidate)(__T1,__H1,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(refutes)(__H2,__T1,__H1,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),fllibexecute_delayed_calls([__H1,__H2,__Mod,__T1],[]))),[__H2,__T1,__H1,__Mod],228,'atck2.flr')))),fllibexecute_delayed_calls([__H1,__H2,__Mod,__T1],[__H1,__H2,__Mod])))).
:-(FLORA_THIS_WORKSPACE(competes)(__H1,__H2,__Exclusion,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(60,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__Exclusion,flapply(opposers,__Mod),__H1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^mvd)(__Exclusion,flapply(opposers,__Mod),__H2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))),fllibdelayedliteral('!=','atck2.flr',234,[__H1,__H2])))).
:-(FLORA_THIS_WORKSPACE(competes)(__H1,__H2,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(62,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''_opposes_aux'(__Mod,___T1,__H1,___T2,__H2),fllibdelayedliteral('!=','atck2.flr',238,[__H1,__H2])),fllibexecute_delayed_calls([__H1,__H2,__Mod,___T1,___T2],[__H1,__H2,__Mod])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(competitors,__H1,__H2,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(64,'atck2.flr',FLORA_THIS_MODULE_NAME),','(';'(FLORA_THIS_WORKSPACE(competes)(__H1,__H2,___Exclusion,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(competes)(__H1,__H2,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))),fllibexecute_delayed_calls([__H1,__H2,__Mod,___Exclusion],[__H1,__H2,__Mod])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(dominates,__Lit,__DomineeH,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(66,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrdescriptor_support,get_ruleid_by_tag_or_head(__newdontcarevar3,__Lit,__Mod,__Id,__FileName)),','(:(flrdescriptor_support,is_defeasible_rule(__Id,__FileName,__Mod)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(competitors,__Lit,__DomineeH,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(existsRuleWithNoOverrider,__Lit,__DomineeH,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),fllibexecute_delayed_calls([__DomineeH,__Lit,__Mod],[]))),[__Lit,__DomineeH,__Mod],260,'atck2.flr'))))),fllibexecute_delayed_calls([__DomineeH,__FileName,__Id,__Lit,__Mod,__newdontcarevar8],[__DomineeH,__Lit,__Mod])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(existsRuleWithNoOverrider,__Lit,__DomineeH,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(68,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(candidate)(__DomineeTag,__DomineeH,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(','(FLORA_THIS_WORKSPACE(candidate)(__newquantvar8,__Lit,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(:(flrdescriptor_support,synonymous_tag_with_head(__DomineeTag,__Mod,__newquantvar7,__DomineeH)),'_$_$_ergo''_overrides_aux'(__Mod,__newquantvar8,__Lit,__newquantvar7,__DomineeH))),fllibexecute_delayed_calls([__DomineeH,__DomineeTag,__Lit,__Mod,__newquantvar7,__newquantvar8],[]))),[__Lit,__Mod,__DomineeTag,__Mod,__DomineeH,__Mod,__Lit,__DomineeH],264,'atck2.flr'))),fllibexecute_delayed_calls([__DomineeH,__DomineeTag,__Lit,__Mod],[__DomineeH,__Lit,__Mod])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(stomped,__Lit,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(70,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(candidate)(___Tag,__Lit,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(d^mvd)(__Excl,flapply(opposers,__Mod),__Lit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(existsCompetitorWhoDoesNotDominate,__Lit,__Excl,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),fllibexecute_delayed_calls([__Excl,__Lit,__Mod],[]))),[__Lit,__Excl,__Mod],281,'atck2.flr')))),fllibexecute_delayed_calls([__Excl,__Lit,__Mod,___Tag],[__Lit,__Mod])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(existsCompetitorWhoDoesNotDominate,__Lit,__Excl,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(72,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(competes)(__Lit,__Competitor,__Excl,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(dominates,__Competitor,__Lit,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__Competitor,__Lit,__Mod],[]))),[__Competitor,__Lit,__Mod],284,'atck2.flr'))),fllibexecute_delayed_calls([__Competitor,__Excl,__Lit,__Mod],[__Excl,__Lit,__Mod])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(stomped,__Lit,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(74,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrdescriptor_support,get_ruleid_by_tag_or_head(__newdontcarevar3,__Lit,__Mod,__Id,__FileName)),','(:(flrdescriptor_support,is_defeasible_rule(__Id,__FileName,__Mod)),','(FLORA_THIS_WORKSPACE(tightBinaryExclusion)(__Competitor,__Lit,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),fllibifthen(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(competes)(__Competitor,__Lit,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),FLORA_THIS_WORKSPACE(d^tblflapply)(dominates,__Competitor,__Lit,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),290,'atck2.flr')))),fllibexecute_delayed_calls([__Competitor,__FileName,__Id,__Lit,__Mod,__newdontcarevar10],[__Lit,__Mod])))).
:-(FLORA_THIS_WORKSPACE(tightExclusion)(__Excl,__Lit,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(76,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmodlit('d^isa',[__Excl,'\\Exclusion','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(candidate)(__newdontcarevar7,__Lit,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(existsCompetitorNonCadidateOrStomped,__Excl,__Lit,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11)),fllibexecute_delayed_calls([__Excl,__Lit,__Mod],[]))),[__Excl,__Lit,__Mod],308,'atck2.flr')))),fllibexecute_delayed_calls([__Excl,__Lit,__Mod,__newdontcarevar12],[__Excl,__Lit,__Mod])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(existsCompetitorNonCadidateOrStomped,__Excl,__Lit,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(78,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(competes)(__Lit,__Competitor,__Excl,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(','(FLORA_THIS_WORKSPACE(candidate)(__newdontcarevar5,__Competitor,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(stomped,__Competitor,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),fllibexecute_delayed_calls([__Competitor,__Mod],[]))),[__Competitor,__Mod],313,'atck2.flr'))),fllibexecute_delayed_calls([__Competitor,__Mod],[]))),[],311,'atck2.flr'))),fllibexecute_delayed_calls([__Competitor,__Excl,__Lit,__Mod,__newdontcarevar10],[__Excl,__Lit,__Mod])))).
:-(FLORA_THIS_WORKSPACE(tightBinaryExclusion)(__Competitor,__Lit,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(80,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(candidate)(__newdontcarevar3,__Lit,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),fllibifthen(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(competes)(__Competitor,__Lit,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),','(FLORA_THIS_WORKSPACE(candidate)(__newdontcarevar8,__Competitor,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(stomped,__Competitor,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)),fllibexecute_delayed_calls([__Competitor,__Mod],[]))),[__Competitor,__Mod],321,'atck2.flr'))),318,'atck2.flr')),fllibexecute_delayed_calls([__Competitor,__Lit,__Mod,__newdontcarevar13],[__Competitor,__Lit,__Mod])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,__T,__H),howDefeated,flapply(notBeaterFor,__Exclusion),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(82,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__Exclusion,flapply(opposers,__RealMod),__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_THIS_WORKSPACE(d^mvd)(__Exclusion,flapply(opposers,__RealMod),__OtherH,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))),','(','(','(fllibmodobj(body,libmod_wrapper,__HM,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11),__newvar9),fllibmodobj(body,libmod_wrapper,__OtherH,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14),__newvar12)),fllibdelayedliteral('!=','atck2.flr',337,[__newvar9,__newvar12])),','(FLORA_THIS_WORKSPACE(candidate)(__T,__HM,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,__newcontextvar16)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^mvd)(__Exclusion,flapply(beater,__RealMod),__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar17,__newcontextvar18)),fllibexecute_delayed_calls([__Exclusion,__HM,__RealMod],[]))),[__Exclusion,__RealMod,__HM],339,'atck2.flr'))))))),fllibexecute_delayed_calls([__Exclusion,__H,__HM,__Mod,__OtherH,__RealMod,__T],[__Exclusion,__H,__T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,__T,__H),howDefeated,flapply(notBeaterFor,flapply(binaryExclusion,__HM,__BeatenH)),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(84,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''_opposes_aux'(__RealMod,__T,__HM,__newdontcarevar5,__BeatenH),','(FLORA_THIS_WORKSPACE(candidate)(__T,__HM,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(beater,__HM,__BeatenH,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),fllibexecute_delayed_calls([__BeatenH,__HM,__RealMod],[]))),[__HM,__BeatenH,__RealMod],345,'atck2.flr')))))),fllibexecute_delayed_calls([__BeatenH,__H,__HM,__Mod,__RealMod,__T,__newdontcarevar10],[__BeatenH,__H,__HM,__T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,__T,__H),howDefeated,canceled,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(86,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),'_$_$_ergo''_cancel_aux'(__RealMod,__T,__HM))),fllibexecute_delayed_calls([__H,__HM,__Mod,__RealMod,__T],[__H,__T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,__T,__H),howDefeated,flapply(beatenByStrictRule,__SH),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(88,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(__T,__HM,__newdontcarevar5,__SH,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)))),fllibexecute_delayed_calls([__H,__HM,__Mod,__RealMod,__SH,__T,__newdontcarevar8],[__H,__SH,__T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,___T,__H),info,stomped,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(90,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^tblflapply)(stomped,__HM,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__H,__HM,__Mod,__RealMod],[__H,___T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,___T,__H),info,flapply(dominates,__DomineeH),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(92,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^tblflapply)(dominates,__HM,__DomineeH,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__DomineeH,__H,__HM,__Mod,__RealMod],[__DomineeH,__H,___T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,___T,__H),info,flapply(refutes,__RefutedT,__RefutedH),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(94,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(refutes)(__HM,__RefutedT,__RefutedH,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__H,__HM,__Mod,__RealMod,__RefutedH,__RefutedT],[__H,__RefutedH,__RefutedT,___T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,___T,__H),info,flapply(refutes,__RefutedT,__RefutedH),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(96,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(refutes)(__HM,__RefutedT,__RefutedH,___Exclusion,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__H,__HM,__Mod,__RealMod,__RefutedH,__RefutedT,___Exclusion],[__H,__RefutedH,__RefutedT,___T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,___T,__H),info,flapply(rebuts,__Rebutted),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(98,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(rebuts)(__HM,__Rebutted,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__H,__HM,__Mod,__RealMod,__Rebutted],[__H,__Rebutted,___T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,___T,__H),info,flapply(rebuts,__Rebutted),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(100,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(rebuts)(__HM,__Rebutted,___Exclusion,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__H,__HM,__Mod,__RealMod,__Rebutted,___Exclusion],[__H,__Rebutted,___T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,___T,__H),info,flapply(beats,__Exclusion,__BeatenH),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(102,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^tblflapply)(beater_aux,__HM,__BeatenH,__Exclusion,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__BeatenH,__Exclusion,__H,__HM,__Mod,__RealMod],[__BeatenH,__Exclusion,__H,___T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,___T,__H),info,flapply(beats,__BeatenH),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(104,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^tblflapply)(beater,__HM,__BeatenH,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__BeatenH,__H,__HM,__Mod,__RealMod],[__BeatenH,__H,___T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,___T,__H),info,flapply(competes,__Exclusion,__Competitor),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(106,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(competes)(__HM,__Competitor,__Exclusion,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_THIS_WORKSPACE(candidate)(__newdontcarevar7,__Competitor,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9))))),fllibexecute_delayed_calls([__Competitor,__Exclusion,__H,__HM,__Mod,__RealMod,__newdontcarevar10],[__Competitor,__Exclusion,__H,___T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,___T,__H),info,flapply(competes,__Competitor),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(108,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(competes)(__HM,__Competitor,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_THIS_WORKSPACE(candidate)(__newdontcarevar7,__Competitor,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9))))),fllibexecute_delayed_calls([__Competitor,__H,__HM,__Mod,__RealMod,__newdontcarevar10],[__Competitor,__H,___T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,__T,__H),info,candidate,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(110,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(change_module)(__H,__Mod,__RealMod,__HM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(candidate)(__T,__HM,__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__H,__HM,__Mod,__RealMod,__T],[__H,__T])))).
:-(FLORA_THIS_WORKSPACE(candidate)(__T,__Head,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(112,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','(current_prolog_flag(max_table_subgoal_size,__TermDepth),','(set_prolog_flag(max_table_subgoal_size,0),','(','(fllibmodobj(body,libmod_wrapper,__Head,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5),__newvar3),=(__ModHead,__newvar3)),','(:(flrdescriptor_support,get_ruleid_by_tag_or_head(__T,__ModHead,__Mod,__Id,__FileName)),','(:(flrcanon,show_rule_by_id(__Id,__FileName,__Mod,__ModHead,__Body)),','(:(flrdescriptor_support,is_defeasible_rule(__Id,__FileName,__Mod)),','(fllibmodlit(libmod_wrapper,__Body,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),set_prolog_flag(max_table_subgoal_size,__TermDepth)))))))),fllibexecute_delayed_calls([__Body,__FileName,__Head,__Id,__Mod,__ModHead,__T,__TermDepth],[__Head,__Mod,__T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Exclusion,flapply(opposers,__Mod),__HH,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(114,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','(','(fllibmodlit('d^mvd',[__Exclusion,'\\opposers',__H,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),fllibmodlit('d^isa',[__Exclusion,'\\Exclusion','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))),','(fllibmodobj(body,libmod_wrapper,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar13),__newvar11),=(__HH,__newvar11))),fllibexecute_delayed_calls([__Exclusion,__H,__HH,__Mod],[__Exclusion,__HH,__Mod])))).
:-(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(__T,__H,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(116,'atck2.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(__T,__H,__newdontcarevar3,__newdontcarevar4,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__H,__Mod,__T,__newdontcarevar7],[__H,__Mod,__T])))).
:-(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(__T,__H,__StrictT,__StrictH,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(118,'atck2.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(candidate)(__T,__H,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''_opposes_aux'(__Mod,__T,__H,__StrictT,__StrictH),';'(','(:(flrstorageutils,'\\isbasefact'(__StrictH)),!),FLORA_THIS_WORKSPACE(strict_candidate)(__StrictT,__StrictH,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))))).
:-(FLORA_THIS_WORKSPACE(strict_candidate)(__T,__Head,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(120,'atck2.flr',FLORA_THIS_MODULE_NAME),','(','(current_prolog_flag(max_table_subgoal_size,__TermDepth),','(set_prolog_flag(max_table_subgoal_size,0),','(','(fllibmodobj(body,libmod_wrapper,__Head,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5),__newvar3),=(__ModHead,__newvar3)),','(:(flrdescriptor_support,get_ruleid_by_tag_or_head(__T,__ModHead,__Mod,__Id,__FileName)),','(:(flrcanon,show_rule_by_id(__Id,__FileName,__Mod,__ModHead,__Body)),','(:(flrdescriptor_support,is_strict_rule(__Id,__FileName,__Mod)),','(fllibmodlit(libmod_wrapper,__Body,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),set_prolog_flag(max_table_subgoal_size,__TermDepth)))))))),fllibexecute_delayed_calls([__Body,__FileName,__Head,__Id,__Mod,__ModHead,__T,__TermDepth],[__Head,__Mod,__T])))).

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
#define FLORA_FLS2_FILENAME  'atck2.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('atck2.ergo',FLORA_THIS_MODULE_NAME))).

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

:-(FLORA_THIS_WORKSPACE(\\undefeated)(_h832403,_h832405,_h832407,_h832409,_h832411,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(\\undefeated))(_h832403,_h832405,_h832407,_h832409,_h832411,FWContext)).
:-(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(_h833056,_h833058,_h833060,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beaten_by_strict_rule))(_h833056,_h833058,_h833060,FWContext)).
:-(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(_h833847,_h833849,_h833851,_h833853,_h833855,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beaten_by_strict_rule))(_h833847,_h833849,_h833851,_h833853,_h833855,FWContext)).
:-(FLORA_THIS_WORKSPACE(candidate)(_h834646,_h834648,_h834650,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(candidate))(_h834646,_h834648,_h834650,FWContext)).
:-(FLORA_THIS_WORKSPACE(change_module)(_h835245,_h835247,_h835249,_h835251,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(change_module))(_h835245,_h835247,_h835249,_h835251,FWContext)).
:-(FLORA_THIS_WORKSPACE(change_module_nocheck)(_h835912,_h835914,_h835916,_h835918,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(change_module_nocheck))(_h835912,_h835914,_h835916,_h835918,FWContext)).
:-(FLORA_THIS_WORKSPACE(check_module_to_AT_association)(_h836707,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(check_module_to_AT_association))(_h836707,FWContext)).
:-(FLORA_THIS_WORKSPACE(competes)(_h837634,_h837636,_h837638,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(competes))(_h837634,_h837636,_h837638,FWContext)).
:-(FLORA_THIS_WORKSPACE(competes)(_h838217,_h838219,_h838221,_h838223,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(competes))(_h838217,_h838219,_h838221,_h838223,FWContext)).
:-(FLORA_THIS_WORKSPACE(defeated)(_h838804,_h838806,_h838808,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(defeated))(_h838804,_h838806,_h838808,FWContext)).
:-(FLORA_THIS_WORKSPACE(defeated_id)(_h839387,_h839389,_h839391,_h839393,_h839395,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(defeated_id))(_h839387,_h839389,_h839391,_h839393,_h839395,FWContext)).
:-(FLORA_THIS_WORKSPACE(disqualified)(_h840026,_h840028,_h840030,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(disqualified))(_h840026,_h840028,_h840030,FWContext)).
:-(FLORA_THIS_WORKSPACE(rebuts)(_h840673,_h840675,_h840677,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(rebuts))(_h840673,_h840675,_h840677,FWContext)).
:-(FLORA_THIS_WORKSPACE(rebuts)(_h841224,_h841226,_h841228,_h841230,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(rebuts))(_h841224,_h841226,_h841228,_h841230,FWContext)).
:-(FLORA_THIS_WORKSPACE(refutes)(_h841779,_h841781,_h841783,_h841785,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(refutes))(_h841779,_h841781,_h841783,_h841785,FWContext)).
:-(FLORA_THIS_WORKSPACE(refutes)(_h842350,_h842352,_h842354,_h842356,_h842358,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(refutes))(_h842350,_h842352,_h842354,_h842356,_h842358,FWContext)).
:-(FLORA_THIS_WORKSPACE(strict_candidate)(_h842925,_h842927,_h842929,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(strict_candidate))(_h842925,_h842927,_h842929,FWContext)).
:-(FLORA_THIS_WORKSPACE(tightBinaryExclusion)(_h843636,_h843638,_h843640,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(tightBinaryExclusion))(_h843636,_h843638,_h843640,FWContext)).
:-(FLORA_THIS_WORKSPACE(tightExclusion)(_h844411,_h844413,_h844415,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(tightExclusion))(_h844411,_h844413,_h844415,FWContext)).
