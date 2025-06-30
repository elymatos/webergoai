
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

#define FLORA_COMPILATION_ID 8

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
#define FLORA_THIS_FILENAME  'fidjiUtils.ergo'
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
  file: syslibinc/flrcolbag_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBCOLLECTBAG))).

/***********************************************************************/

/************************************************************************
  file: syslibinc/flrcolset_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBSORTBY))).

/***********************************************************************/

/************************************************************************
  file: syslibinc/flrerrhandler_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBERRHANDLER))).

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
  file: syslibinc/flrdbop_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBDBOP))).

/***********************************************************************/

/************************************************************************
  file: syslibinc/flraggmin_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBHYPOTHETICAL))).

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
  file: syslibinc/flrdbop_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBDBOP))).

/***********************************************************************/

/************************************************************************
  file: syslibinc/flraggmax_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBMAX))).

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
  file: syslibinc/flrtables_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBTABLES))).

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
  file: syslibinc/flrshdirect_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBSHDIRECT))).

/***********************************************************************/

/************************************************************************
  file: syslibinc/flrtruthvalue_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBTRUTHVALUE))).

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
  file: ergo_libinc/ergo2java_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Ergo compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(':'(flrlibman,flora_load_system_module(ERGO2JAVA))).

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

/************************************************************************
  file: ergo_libinc/ergo_explain_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Ergo compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(':'(flrlibman,flora_load_system_module(ERGOEXPLAIN))).

/***********************************************************************/

:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(aBodyMsubgoal)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(aBodyMsubgoal)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(aBodyMsubgoal)(_h3773527,_h3773529,_h3773531,_h3773533,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(aBodyMsubgoal))(_h3773527,_h3773529,_h3773531,_h3773533,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(aBodyWsubgoal)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(aBodyWsubgoal)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(aBodyWsubgoal)(_h3774199,_h3774201,_h3774203,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(aBodyWsubgoal))(_h3774199,_h3774201,_h3774203,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(bestDSDcause)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(bestDSDcause)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(bestDSDcause)(_h3774867,_h3774869,_h3774871,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(bestDSDcause))(_h3774867,_h3774869,_h3774871,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(bodyUsesUserProgram)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(bodyUsesUserProgram)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(bodyUsesUserProgram)(_h3775519,_h3775521,_h3775523,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(bodyUsesUserProgram))(_h3775519,_h3775521,_h3775523,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(checkNonAtoms)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(checkNonAtoms)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(checkNonAtoms)(_h3776283,_h3776285,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(checkNonAtoms))(_h3776283,_h3776285,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(childOfDefeated)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(childOfDefeated)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(childOfDefeated)(_h3776947,_h3776949,_h3776951,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(childOfDefeated))(_h3776947,_h3776949,_h3776951,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(consistencyAndUndefinednessCheck)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(consistencyAndUndefinednessCheck)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(consistencyAndUndefinednessCheck)(_h3777647,_h3777649,_h3777651,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(consistencyAndUndefinednessCheck))(_h3777647,_h3777649,_h3777651,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(decodeVars)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(decodeVars)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(decodeVars)(_h3778619,_h3778621,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(decodeVars))(_h3778619,_h3778621,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(defaultT)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(defaultT)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(defaultT)(_h3779235,_h3779237,_h3779239,_h3779241,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(defaultT))(_h3779235,_h3779237,_h3779239,_h3779241,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(executeBody)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(executeBody)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(executeBody)(_h3779827,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(executeBody))(_h3779827,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(findAtom)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(findAtom)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(findAtom)(_h3780455,_h3780457,_h3780459,_h3780461,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(findAtom))(_h3780455,_h3780457,_h3780459,_h3780461,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(findSubTerm2)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(findSubTerm2)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(findSubTerm2)(_h3781047,_h3781049,_h3781051,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(findSubTerm2))(_h3781047,_h3781049,_h3781051,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(fjdefeatedr)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(fjdefeatedr)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(fjdefeatedr)(_h3781699,_h3781701,_h3781703,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(fjdefeatedr))(_h3781699,_h3781701,_h3781703,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(fjw)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(fjw)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(fjw)(_h3782335,_h3782337,_h3782339,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(fjw))(_h3782335,_h3782337,_h3782339,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(fmj)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(fmj)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(fmj)(_h3782843,_h3782845,_h3782847,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(fmj))(_h3782843,_h3782845,_h3782847,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(fmj2)),7),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(fmj2)),7)),opaque))).
:-(FLORA_THIS_WORKSPACE(fmj2)(_h3783351,_h3783353,_h3783355,_h3783357,_h3783359,_h3783361,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(fmj2))(_h3783351,_h3783353,_h3783355,_h3783357,_h3783359,_h3783361,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(hack_check_bgaxioms)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(hack_check_bgaxioms)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(hack_check_bgaxioms)(_h3783887,_h3783889,_h3783891,_h3783893,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(hack_check_bgaxioms))(_h3783887,_h3783889,_h3783891,_h3783893,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(isAggregate)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(isAggregate)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(isAggregate)(_h3784655,_h3784657,_h3784659,_h3784661,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(isAggregate))(_h3784655,_h3784657,_h3784659,_h3784661,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(isAggregate)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(isAggregate)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(isAggregate)(_h3785295,_h3785297,_h3785299,_h3785301,_h3785303,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(isAggregate))(_h3785295,_h3785297,_h3785299,_h3785301,_h3785303,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(isDeleteLiteral)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(isDeleteLiteral)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(isDeleteLiteral)(_h3785939,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(isDeleteLiteral))(_h3785939,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(isDeleteLiteral_aux)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(isDeleteLiteral_aux)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(isDeleteLiteral_aux)(_h3786631,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(isDeleteLiteral_aux))(_h3786631,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(isSimpleSubgoal)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(isSimpleSubgoal)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(isSimpleSubgoal)(_h3787387,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(isSimpleSubgoal))(_h3787387,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(isTransDeleteLiteral)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(isTransDeleteLiteral)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(isTransDeleteLiteral)(_h3788079,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(isTransDeleteLiteral))(_h3788079,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(isTransDeleteLiteral_aux)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(isTransDeleteLiteral_aux)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(isTransDeleteLiteral_aux)(_h3788851,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(isTransDeleteLiteral_aux))(_h3788851,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(isa_goal_reason)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(isa_goal_reason)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(isa_goal_reason)(_h3789687,_h3789689,_h3789691,_h3789693,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(isa_goal_reason))(_h3789687,_h3789689,_h3789691,_h3789693,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(jtr2m)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(jtr2m)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(jtr2m)(_h3790391,_h3790393,_h3790395,_h3790397,_h3790399,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(jtr2m))(_h3790391,_h3790393,_h3790395,_h3790397,_h3790399,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(jtr2w)),7),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(jtr2w)),7)),opaque))).
:-(FLORA_THIS_WORKSPACE(jtr2w)(_h3790939,_h3790941,_h3790943,_h3790945,_h3790947,_h3790949,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(jtr2w))(_h3790939,_h3790941,_h3790943,_h3790945,_h3790947,_h3790949,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(justifiableGoal)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(justifiableGoal)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(justifiableGoal)(_h3791491,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(justifiableGoal))(_h3791491,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(justificationMetrics)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(justificationMetrics)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(justificationMetrics)(_h3792183,_h3792185,_h3792187,_h3792189,_h3792191,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(justificationMetrics))(_h3792183,_h3792185,_h3792187,_h3792189,_h3792191,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(justificationMetrics2)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(justificationMetrics2)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(justificationMetrics2)(_h3792971,_h3792973,_h3792975,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(justificationMetrics2))(_h3792971,_h3792973,_h3792975,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(justificationTreeFunction)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(justificationTreeFunction)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(justificationTreeFunction)(_h3793767,_h3793769,_h3793771,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(justificationTreeFunction))(_h3793767,_h3793769,_h3793771,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(justificationTreeRelation)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(justificationTreeRelation)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(justificationTreeRelation)(_h3794627,_h3794629,_h3794631,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(justificationTreeRelation))(_h3794627,_h3794629,_h3794631,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(justificationTreeRelation_internal)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(justificationTreeRelation_internal)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(justificationTreeRelation_internal)(_h3795487,_h3795489,_h3795491,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(justificationTreeRelation_internal))(_h3795487,_h3795489,_h3795491,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(literalCalls)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(literalCalls)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(literalCalls)(_h3796491,_h3796493,_h3796495,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(literalCalls))(_h3796491,_h3796493,_h3796495,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(literalCalls)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(literalCalls)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(literalCalls)(_h3797143,_h3797145,_h3797147,_h3797149,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(literalCalls))(_h3797143,_h3797145,_h3797147,_h3797149,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(literalCalls)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(literalCalls)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(literalCalls)(_h3797799,_h3797801,_h3797803,_h3797805,_h3797807,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(literalCalls))(_h3797799,_h3797801,_h3797803,_h3797805,_h3797807,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(mayBindFirstMatchingID)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(mayBindFirstMatchingID)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(mayBindFirstMatchingID)(_h3798459,_h3798461,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(mayBindFirstMatchingID))(_h3798459,_h3798461,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(mayBindMatchingID)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(mayBindMatchingID)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(mayBindMatchingID)(_h3799267,_h3799269,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(mayBindMatchingID))(_h3799267,_h3799269,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(mayGetLocalModuleVar)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(mayGetLocalModuleVar)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(mayGetLocalModuleVar)(_h3799995,_h3799997,_h3799999,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(mayGetLocalModuleVar))(_h3799995,_h3799997,_h3799999,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(mySubsumes)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(mySubsumes)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(mySubsumes)(_h3800775,_h3800777,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(mySubsumes))(_h3800775,_h3800777,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(my_cancel)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(my_cancel)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(my_cancel)(_h3801391,_h3801393,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(my_cancel))(_h3801391,_h3801393,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(my_cancel)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(my_cancel)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(my_cancel)(_h3801991,_h3801993,_h3801995,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(my_cancel))(_h3801991,_h3801993,_h3801995,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(my_dr_atom)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(my_dr_atom)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(my_dr_atom)(_h3802595,_h3802597,_h3802599,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(my_dr_atom))(_h3802595,_h3802597,_h3802599,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(my_isbasefact)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(my_isbasefact)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(my_isbasefact)(_h3803215,_h3803217,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(my_isbasefact))(_h3803215,_h3803217,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(my_once)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(my_once)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(my_once)(_h3803879,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(my_once))(_h3803879,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(my_opposes)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(my_opposes)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(my_opposes)(_h3804443,_h3804445,_h3804447,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(my_opposes))(_h3804443,_h3804445,_h3804447,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(my_opposes)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(my_opposes)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(my_opposes)(_h3805063,_h3805065,_h3805067,_h3805069,_h3805071,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(my_opposes))(_h3805063,_h3805065,_h3805067,_h3805069,_h3805071,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(my_overrides)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(my_overrides)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(my_overrides)(_h3805691,_h3805693,_h3805695,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(my_overrides))(_h3805691,_h3805693,_h3805695,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(my_overrides)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(my_overrides)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(my_overrides)(_h3806343,_h3806345,_h3806347,_h3806349,_h3806351,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(my_overrides))(_h3806343,_h3806345,_h3806347,_h3806349,_h3806351,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(myvariant)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(myvariant)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(myvariant)(_h3807003,_h3807005,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(myvariant))(_h3807003,_h3807005,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(negateLiteral)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(negateLiteral)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(negateLiteral)(_h3807603,_h3807605,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(negateLiteral))(_h3807603,_h3807605,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(nextExplanation2)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(nextExplanation2)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(nextExplanation2)(_h3808267,_h3808269,_h3808271,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(nextExplanation2))(_h3808267,_h3808269,_h3808271,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(nextExplanationDontKnow)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(nextExplanationDontKnow)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(nextExplanationDontKnow)(_h3808983,_h3808985,_h3808987,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(nextExplanationDontKnow))(_h3808983,_h3808985,_h3808987,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(nextExplanationUnderstood)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(nextExplanationUnderstood)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(nextExplanationUnderstood)(_h3809811,_h3809813,_h3809815,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(nextExplanationUnderstood))(_h3809811,_h3809813,_h3809815,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(nextExplanationWhy)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(nextExplanationWhy)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(nextExplanationWhy)(_h3810671,_h3810673,_h3810675,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(nextExplanationWhy))(_h3810671,_h3810673,_h3810675,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(noPath)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(noPath)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(noPath)(_h3811419,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(noPath))(_h3811419,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(notCommentedYet)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(notCommentedYet)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(notCommentedYet)(_h3811967,_h3811969,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(notCommentedYet))(_h3811967,_h3811969,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(notKnownCorrect)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(notKnownCorrect)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(notKnownCorrect)(_h3812663,_h3812665,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(notKnownCorrect))(_h3812663,_h3812665,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(pp2)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(pp2)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(pp2)(_h3813359,_h3813361,_h3813363,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(pp2))(_h3813359,_h3813361,_h3813363,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(pp3)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(pp3)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(pp3)(_h3813867,_h3813869,_h3813871,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(pp3))(_h3813867,_h3813869,_h3813871,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(refinedJustificationMetrics)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(refinedJustificationMetrics)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(refinedJustificationMetrics)(_h3814375,_h3814377,_h3814379,_h3814381,_h3814383,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(refinedJustificationMetrics))(_h3814375,_h3814377,_h3814379,_h3814381,_h3814383,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(subgoalIn)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(subgoalIn)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(subgoalIn)(_h3815275,_h3815277,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(subgoalIn))(_h3815275,_h3815277,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(subgoalIn)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(subgoalIn)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(subgoalIn)(_h3815875,_h3815877,_h3815879,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(subgoalIn))(_h3815875,_h3815877,_h3815879,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(subgoalOf)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(subgoalOf)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(subgoalOf)(_h3816479,_h3816481,_h3816483,_h3816485,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(subgoalOf))(_h3816479,_h3816481,_h3816483,_h3816485,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(sys_trivial_justification)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(sys_trivial_justification)),4)),FLORA_FLEX_DYNAMIC_TYPE_CLAUSE))).
:-(FLORA_THIS_WORKSPACE(sys_trivial_justification)(_h3817087,_h3817089,_h3817091,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(sys_trivial_justification))(_h3817087,_h3817089,_h3817091,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(tb)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(tb)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(tb)(_h3817947,_h3817949,_h3817951,_h3817953,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(tb))(_h3817947,_h3817949,_h3817951,_h3817953,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(tp)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(tp)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(tp)(_h3818443,_h3818445,_h3818447,_h3818449,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(tp))(_h3818443,_h3818445,_h3818447,_h3818449,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(updateExplanationItem)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(updateExplanationItem)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(updateExplanationItem)(_h3818939,_h3818941,_h3818943,_h3818945,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(updateExplanationItem))(_h3818939,_h3818941,_h3818943,_h3818945,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(wNodeAnswerToMatchingSource2)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(wNodeAnswerToMatchingSource2)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(wNodeAnswerToMatchingSource2)(_h3819739,_h3819741,_h3819743,_h3819745,_h3819747,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(wNodeAnswerToMatchingSource2))(_h3819739,_h3819741,_h3819743,_h3819745,_h3819747,FWContext)).
 
#if !defined(FLORA_FDB_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FDB_FILENAME  'fidjiUtils.fdb'
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
#define FLORA_FLM_FILENAME  'fidjiUtils.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(fidjiUtils,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'fidjiUtils.fld'
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
#define FLORA_FLS_FILENAME  'fidjiUtils.fls'
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


:-(ensure_loaded('fidji-cks')).


:-(import(from(/(ipListenerWindow,1),usermod))).

:-(table(as(/(FLORA_THIS_WORKSPACE(sys_trivial_justification),4),AUXILIARY_TABLING_TYPE))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(sys_trivial_justification,3,FLORA_THIS_MODULE_NAME)]))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(justificationTreeRelation_internal,3,FLORA_THIS_MODULE_NAME),prolog(justificationTreeFunction,3,FLORA_THIS_MODULE_NAME),prolog(subgoalIn,2,FLORA_THIS_MODULE_NAME),prolog(subgoalIn,3,FLORA_THIS_MODULE_NAME),prolog(isAggregate,4,FLORA_THIS_MODULE_NAME),prolog(isAggregate,5,FLORA_THIS_MODULE_NAME),prolog(isSimpleSubgoal,1,FLORA_THIS_MODULE_NAME),prolog(justifiableGoal,1,FLORA_THIS_MODULE_NAME),prolog(negateLiteral,2,FLORA_THIS_MODULE_NAME),prolog(literalCalls,3,FLORA_THIS_MODULE_NAME),prolog(literalCalls,4,FLORA_THIS_MODULE_NAME),prolog(literalCalls,5,FLORA_THIS_MODULE_NAME),prolog(mayBindFirstMatchingID,2,FLORA_THIS_MODULE_NAME),prolog(mayBindMatchingID,2,FLORA_THIS_MODULE_NAME),prolog(executeBody,1,FLORA_THIS_MODULE_NAME),prolog(subgoalOf,4,FLORA_THIS_MODULE_NAME),prolog(justificationTreeRelation,3,FLORA_THIS_MODULE_NAME),prolog(justificationMetrics,5,FLORA_THIS_MODULE_NAME),prolog(justificationMetrics2,3,FLORA_THIS_MODULE_NAME),prolog(notKnownCorrect,2,FLORA_THIS_MODULE_NAME),prolog(childOfDefeated,3,FLORA_THIS_MODULE_NAME),prolog(hack_check_bgaxioms,4,FLORA_THIS_MODULE_NAME),prolog(bodyUsesUserProgram,3,FLORA_THIS_MODULE_NAME),prolog(aBodyWsubgoal,3,FLORA_THIS_MODULE_NAME),prolog(aBodyMsubgoal,4,FLORA_THIS_MODULE_NAME),prolog(fjdefeatedr,3,FLORA_THIS_MODULE_NAME),prolog(isa_goal_reason,4,FLORA_THIS_MODULE_NAME),prolog(consistencyAndUndefinednessCheck,3,FLORA_THIS_MODULE_NAME),prolog(wNodeAnswerToMatchingSource2,5,FLORA_THIS_MODULE_NAME),prolog(mayGetLocalModuleVar,3,FLORA_THIS_MODULE_NAME),prolog(checkNonAtoms,2,FLORA_THIS_MODULE_NAME),prolog(defaultT,4,FLORA_THIS_MODULE_NAME),prolog(decodeVars,2,FLORA_THIS_MODULE_NAME),prolog(notCommentedYet,2,FLORA_THIS_MODULE_NAME),prolog(myvariant,2,FLORA_THIS_MODULE_NAME),prolog(mySubsumes,2,FLORA_THIS_MODULE_NAME),prolog(findAtom,4,FLORA_THIS_MODULE_NAME),prolog(my_isbasefact,2,FLORA_THIS_MODULE_NAME),prolog(my_overrides,5,FLORA_THIS_MODULE_NAME),prolog(my_overrides,3,FLORA_THIS_MODULE_NAME),prolog(my_opposes,5,FLORA_THIS_MODULE_NAME),prolog(my_opposes,3,FLORA_THIS_MODULE_NAME),prolog(my_cancel,2,FLORA_THIS_MODULE_NAME),prolog(my_cancel,3,FLORA_THIS_MODULE_NAME),prolog(my_dr_atom,3,FLORA_THIS_MODULE_NAME),prolog(findSubTerm2,3,FLORA_THIS_MODULE_NAME),prolog(bestDSDcause,3,FLORA_THIS_MODULE_NAME),prolog(refinedJustificationMetrics,5,FLORA_THIS_MODULE_NAME),prolog(updateExplanationItem,4,FLORA_THIS_MODULE_NAME),prolog(nextExplanationWhy,3,FLORA_THIS_MODULE_NAME),prolog(nextExplanationUnderstood,3,FLORA_THIS_MODULE_NAME),prolog(nextExplanation2,3,FLORA_THIS_MODULE_NAME),prolog(nextExplanationDontKnow,3,FLORA_THIS_MODULE_NAME),prolog(isDeleteLiteral,1,FLORA_THIS_MODULE_NAME),prolog(isTransDeleteLiteral,1,FLORA_THIS_MODULE_NAME),prolog(isDeleteLiteral_aux,1,FLORA_THIS_MODULE_NAME),prolog(isTransDeleteLiteral_aux,1,FLORA_THIS_MODULE_NAME),prolog(tp,4,FLORA_THIS_MODULE_NAME),prolog(tb,4,FLORA_THIS_MODULE_NAME),prolog(pp2,3,FLORA_THIS_MODULE_NAME),prolog(pp3,3,FLORA_THIS_MODULE_NAME),prolog(fjw,3,FLORA_THIS_MODULE_NAME),prolog(fmj,3,FLORA_THIS_MODULE_NAME),prolog(fmj2,6,FLORA_THIS_MODULE_NAME),prolog(jtr2m,5,FLORA_THIS_MODULE_NAME),prolog(jtr2w,6,FLORA_THIS_MODULE_NAME),prolog(noPath,1,FLORA_THIS_MODULE_NAME),prolog(my_once,1,FLORA_THIS_MODULE_NAME)]))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(ensure_loaded,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(4,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(justificationTreeFunction,__X,__Y,__Z,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(6,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(justificationTreeFunction)(__X,__Y,__Z,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(floraSubclassRelation,__SC,null,__SC,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(8,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(!,=(__SC,__SC)))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(floraSubclassRelation,__SC,__C,___Context,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(10,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_WORKSPACE(main,d^sub)(__SC,__C,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(usermod,atomic(__SC)),:(usermod,atomic(__C)))))).
:-(FLORA_THIS_WORKSPACE(justificationTreeRelation)(__Child,__Parent,__Root,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(12,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(justificationTreeRelation_internal)(__Child,__Parent,__Root,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(fllibmetauniv(__Child,[flapply(hilog,__JTC),__GC,__newdontcarevar5,__newdontcarevar6,__newdontcarevar7,__newdontcarevar8,__PathC]),','(';'(->(==(__Parent,null),=(__Type,n)),','(fllibmetauniv(__Parent,[flapply(hilog,__newdontcarevar9),__newdontcarevar10,__newdontcarevar11,__newdontcarevar12,__newdontcarevar13,__newdontcarevar14,__PathP]),','(';'(->(\+(\+(','(:(num_vars,numbervars(__GC,0,__newdontcarevar15,[attvar(bind)])),\+(:(basics,memberchk(-(__JTC,__GC),__PathP)))))),=(__Type,n)),=(__Type,r)),','(copy_term(__GC,__GCcopy),','(:(num_vars,numbervars(__GCcopy,0,__newdontcarevar16,[attvar(bind)])),=(__PathC,[-(__JTC,__GCcopy)|__PathP])))))),=(__Type,n)))),fllibexecute_delayed_calls([__Child,__GC,__GCcopy,__JTC,__Parent,__PathC,__PathP,__Root,__Type,__newdontcarevar17],[__Child,__Parent,__Root])))).
:-(FLORA_THIS_WORKSPACE(justificationTreeFunction)(__Child,__Parent,__Root,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(14,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(','(fllibbagof(__newdontcarevar7,[],[],','(','(FLORA_THIS_WORKSPACE(justificationTreeRelation)(__Node,__Parent,__Root,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(nodeToTypeAtom,__Node,__Type,__Atom,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),=(__newdontcarevar7,flapply(flapply(__Type,__Atom),__Node)))),fllibexecute_delayed_calls([__Atom,__newdontcarevar7,__Node,__Parent,__Root,__Type],[])),__newvar8),=(__L,__newvar8)),','(';'(->(FLORA_WORKSPACE(\\why,d^tblflapply)(using_sorted_explanations,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),','(fllibsetof(__newdontcarevar13,[],[],','(','(:(basics,member(flapply(flapply(__Type,__Atom),__newdontcarevar11),__L)),=(__newdontcarevar13,flapply(__Type,__Atom))),fllibexecute_delayed_calls([__Atom,__L,__newdontcarevar13,__Type,__newdontcarevar12],[])),__newvar14),=(__TypeAtoms,__newvar14))),','(fllibbagof(__newdontcarevar17,[],[],','(','(:(basics,member(flapply(flapply(__Type,__Atom),__newdontcarevar15),__L)),=(__newdontcarevar17,flapply(__Type,__Atom))),fllibexecute_delayed_calls([__Atom,__L,__newdontcarevar17,__Type,__newdontcarevar16],[])),__newvar18),=(__TypeAtoms,__newvar18))),','(','(:(basics,member(__TypeAtom,__TypeAtoms)),:(basics,memberchk(flapply(__TypeAtom,__Child),__L))),'\\true'))),fllibexecute_delayed_calls([__Atom,__Child,__L,__Node,__Parent,__Root,__Type,__TypeAtom,__TypeAtoms,__newdontcarevar19],[__Child,__Parent,__Root])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(nodeToTypeAtom,__Node,__Type,__A,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(16,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(=(__Node,flapply(__Type,__Term,___OptionalAppearance,___ConsiderSucceeded,___RuleID,___special_reason,___path)),:(flrdecode,flora_decode_goal_as_mainless_atom(__Term,__A))),fllibexecute_delayed_calls([__A,__Node,__Term,__Type,___ConsiderSucceeded,___OptionalAppearance,___RuleID,___path,___special_reason],[__A,__Node,__Type])))).
:-(FLORA_THIS_WORKSPACE(justificationTreeRelation_internal)(__Child,null,__Root,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(18,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(!,=(__Root,__Child)))).
:-(FLORA_THIS_WORKSPACE(justificationTreeRelation_internal)(__Child,flapply(w,__ParentG,___OptionalAppearance,__ConsiderSucceeded,__CallerID,___special_reason,___path),___Context,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(20,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(!,','(FLORA_THIS_WORKSPACE(d^nontblflapply)(mayGetModule,__ParentG,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(flrtrim,flora_generalize_last(__ParentG,__Call)),','(:(machine,term_hash(__Call,10000,__Hash1)),','(FLORA_THIS_WORKSPACE(fjw)(__ParentG,__ConsiderSucceeded,flapply(j,__Type,__Info),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(:(machine,term_hash(__Call,10000,__Hash2)),','(==(__Hash2,__Hash1),','(FLORA_THIS_WORKSPACE(hack_check_bgaxioms)(__Type,__M,__ConsiderSucceeded,__Info,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),','(!,FLORA_THIS_WORKSPACE(jtr2w)(__Type,__Info,__M,__ConsiderSucceeded,__CallerID,__Child,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10))))))))))),fllibexecute_delayed_calls([__Call,__CallerID,__Child,__ConsiderSucceeded,__Hash1,__Hash2,__Info,__M,__ParentG,__Type],[__CallerID,__Child,__ConsiderSucceeded,__ParentG,___Context,___OptionalAppearance,___path,___special_reason])))).
:-(FLORA_THIS_WORKSPACE(justificationTreeRelation_internal)(__Child,flapply(m,__ParentG,___OptionalAppearance,__ConsiderSucceeded,__CallerID,___special_reason,___path),___Context,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(22,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(!,';'(','(FLORA_THIS_WORKSPACE(d^nontblflapply)(mayGetModule,__ParentG,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(fmj)(__ParentG,__ConsiderSucceeded,flapply(j,__Type,__Info),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_THIS_WORKSPACE(jtr2m)(__Type,__Info,__M,__ConsiderSucceeded,__Child,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)))),','(==(__ConsiderSucceeded,'\\true'),','(fllibmodlit(libmod_wrapper,__ParentG,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),=(__Child,flapply(w,__ParentG,null,__ConsiderSucceeded,__CallerID,null,____path)))))),fllibexecute_delayed_calls([__CallerID,__Child,__ConsiderSucceeded,__Info,__M,__ParentG,__Type,____path],[__CallerID,__Child,__ConsiderSucceeded,__ParentG,___Context,___OptionalAppearance,___path,___special_reason])))).
:-(FLORA_THIS_WORKSPACE(justificationTreeRelation_internal)(flapply(m,__Defeater,null,___ConsiderSucceeded,null,null,__newdontcarevar1),flapply(d,__ParentG,___DefeatMethod,___ConsiderSucceeded,__newdontcarevar2,__newdontcarevar3,__newdontcarevar4),___Context,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(24,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(childOfDefeated)(__ParentG,___Reason,__Defeater,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),','(','(fllibmodobj(body,libmod_wrapper,__Defeater,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10),__newvar11),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__newvar11,fllibexecute_delayed_calls([__Defeater],[]))),[__Defeater],463,'fidjiUtils.ergo'))),','(\+(fllibtruthvalue(undefined,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__Defeater,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar13)))),!))),fllibexecute_delayed_calls([__Defeater,__ParentG,___Reason],[__Defeater,__ParentG,__newdontcarevar14,___ConsiderSucceeded,___Context,___DefeatMethod])))).
:-(FLORA_THIS_WORKSPACE(justificationTreeRelation_internal)(flapply(w,__Defeater,null,___ConsiderSucceeded,null,null,__newdontcarevar1),flapply(d,__ParentG,___DefeatMethod,___ConsiderSucceeded,__newdontcarevar2,__newdontcarevar3,__newdontcarevar4),___Context,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(26,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(childOfDefeated)(__ParentG,___Reason,__Defeater,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),','(fllibmodlit(libmod_wrapper,__Defeater,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),!)),fllibexecute_delayed_calls([__Defeater,__ParentG,___Reason],[__Defeater,__ParentG,__newdontcarevar11,___ConsiderSucceeded,___Context,___DefeatMethod])))).
:-(FLORA_THIS_WORKSPACE(hack_check_bgaxioms)(bg_axiom,__M,__CS,flapply(__newdontcarevar1,__Body),'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(28,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(!,FLORA_THIS_WORKSPACE(bodyUsesUserProgram)(__M,__CS,__Body,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5))))).
:-(FLORA_THIS_WORKSPACE(hack_check_bgaxioms)(__newdontcarevar1,__newdontcarevar2,__newdontcarevar3,__newdontcarevar4,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(30,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(bodyUsesUserProgram)(__M,__CS,__Body,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(32,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(aBodyWsubgoal)(__Body,__M,__BG,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(fjw)(__BG,__CS,flapply(j,__Type,__newdontcarevar5),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),','(\==(__Type,bg_axiom),!))),fllibexecute_delayed_calls([__BG,__Body,__CS,__M,__Type,__newdontcarevar8],[__Body,__CS,__M])))).
FLORA_THIS_WORKSPACE(childOfDefeated)(flapply(___Reason,___AddlReason,','(___DefeatedTag,___Defeated),','(___DefeaterTag,___Defeater)),___Reason,___Defeater,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)).
FLORA_THIS_WORKSPACE(childOfDefeated)(flapply(___Reason,___Tag,___Defeater),___Reason,___Defeater,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)).
FLORA_THIS_WORKSPACE(childOfDefeated)(flapply(___Reason,___Defeater),___Reason,___Defeater,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)).
:-(FLORA_THIS_WORKSPACE(fjdefeatedr)(__Tag,__H,__CompleteReason,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(34,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibuniveqform(__H,fllibmodlit(libmod_wrapper,___HH,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),','(:(flrregistry,flora_defeasible_module_registry(__M,__AT)),','(fllibmodlit('d^mvd',[flapply(status,__Tag,__H),howDefeated,__Reason,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)],__AT,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),fllibifthenelse(FLORA_THIS_MODULE_NAME,','(==(__Reason,disqualified),fllibmodlit('d^mvd',[flapply(status,__Tag,__H),howDisqualified,flapply(defeatCycle,__DefeaterTag,__Defeater,__DefeatedTag,__Defeated),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)],__AT,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12))),=(__CompleteReason,flapply(__Reason,refutationCycle,','(__DefeatedTag,__Defeated),','(__DefeaterTag,__Defeater))),=(__CompleteReason,__Reason),513,'fidjiUtils.ergo')))),fllibexecute_delayed_calls([__AT,__CompleteReason,__Defeated,__DefeatedTag,__Defeater,__DefeaterTag,__H,__M,__Reason,__Tag,___HH],[__CompleteReason,__H,__Tag])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(getDefeatedRule,__Node,__DefeatedID,__M,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(36,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(=(__Node,flapply(d,__G,___DefeatMethod,___ConsiderSucceeded,__DefeatedID,__newdontcarevar3,__newdontcarevar4)),','(FLORA_THIS_WORKSPACE(childOfDefeated)(__G,__newdontcarevar5,__DG,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),FLORA_THIS_WORKSPACE(d^nontblflapply)(mayGetModule,__DG,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)))),fllibexecute_delayed_calls([__DG,__DefeatedID,__G,__M,__Node,__newdontcarevar10,___ConsiderSucceeded,___DefeatMethod],[__DefeatedID,__M,__Node])))).
:-(FLORA_THIS_WORKSPACE(negateLiteral)(__newvar1,__newvar5,'_$ctxt'(_CallerModuleVar,__newcontextvar9,__newcontextvar10)),','('_$_$_ergo''rule_enabled'(38,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(','(fllibmodobj(head,'neg^libmod_wrapper',___G,___M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3),__newvar4),fllibuniveqform(__newvar1,__newvar4)),','(fllibmodobj(head,libmod_wrapper,___G,___M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7),__newvar8),fllibuniveqform(__newvar5,__newvar8))),!))).
:-(FLORA_THIS_WORKSPACE(negateLiteral)(__newvar1,__newvar5,'_$ctxt'(_CallerModuleVar,__newcontextvar9,__newcontextvar10)),','('_$_$_ergo''rule_enabled'(40,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(','(fllibmodobj(head,libmod_wrapper,___G,___M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3),__newvar4),fllibuniveqform(__newvar1,__newvar4)),','(fllibmodobj(head,'neg^libmod_wrapper',___G,___M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7),__newvar8),fllibuniveqform(__newvar5,__newvar8))),'\\true'))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(mayGetModule,__G,__M,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(42,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),:(flrwrapper,flora_decode_module_name(__G,__M)))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(mayGetModule,__newdontcarevar1,main,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(44,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(mayGetLocalModuleVar)(__G,___M,__LM,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(46,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibuniveqform(__G,fllibmodlit('trans^libmod_wrapper',___H,__LM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),!),fllibexecute_delayed_calls([__G,__LM,___H],[__G,__LM,___M])))).
:-(FLORA_THIS_WORKSPACE(mayGetLocalModuleVar)(__G,___M,__LM,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(48,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibuniveqform(__G,fllibmodlit(libmod_wrapper,___H,__LM,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),!),fllibexecute_delayed_calls([__G,__LM,___H],[__G,__LM,___M])))).
:-(FLORA_THIS_WORKSPACE(mayGetLocalModuleVar)(__newdontcarevar1,__M,__LM,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(50,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),=(__M,__LM))).
:-(FLORA_THIS_WORKSPACE(jtr2w)(naf,flapply(j,__MType,__MJ),___M,___ConsiderSucceeded,___CallerID,flapply(m,__MG,null,___ConsiderSucceeded,__ID,null,___path),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(52,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(!,','(\==(__MType,naf),=(__MJ,flapply(__ID,__MG)))))).
:-(FLORA_THIS_WORKSPACE(jtr2w)(aggregate,flapply(___Type,__Query,__Solutions),___M,__ConsiderSucceeded,__CallerID,__Child,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(54,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(!,','(=(__Special_reason,'aggregate expression'),';'(','(=(__Child,flapply(w,__G,__AggVar,__ConsiderSucceeded,__CallerID,__Special_reason,___path)),:(basics,member(-(__AggVar,__G),__Solutions))),','(==(__Solutions,[]),=(__Child,flapply(m,__Query,null,__ConsiderSucceeded,__CallerID,__Special_reason,___path)))))),fllibexecute_delayed_calls([__AggVar,__CallerID,__Child,__ConsiderSucceeded,__G,__Query,__Solutions,__Special_reason,___path],[__CallerID,__Child,__ConsiderSucceeded,__Query,__Solutions,___M,___Type])))).
:-(FLORA_THIS_WORKSPACE(jtr2w)(rule,flapply(___ID,__Body),__M,___ConsiderSucceeded,___CallerID,flapply(w,__BG,null,___ConsiderSucceeded,___ID,null,___path),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(56,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(!,FLORA_THIS_WORKSPACE(aBodyWsubgoal)(__Body,__M,__BG,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))).
:-(FLORA_THIS_WORKSPACE(jtr2w)(bg_axiom,flapply(___Comment,__Body),__M,___ConsiderSucceeded,___CallerID,flapply(w,__BG,null,___ConsiderSucceeded,___CallerID,___Comment,___path),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(58,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(!,FLORA_THIS_WORKSPACE(aBodyWsubgoal)(__Body,__M,__BG,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))).
:-(FLORA_THIS_WORKSPACE(jtr2w)(inheritance,[__SuperFrame,__ISAGoal],__M,___ConsiderSucceeded,___CallerID,flapply(w,__G,null,___ConsiderSucceeded,___CallerID,__Special_reason,___path),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(60,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(!,';'(','(=(__G,__SuperFrame),=(__Special_reason,'inherited from superclass')),FLORA_THIS_WORKSPACE(isa_goal_reason)(__ISAGoal,__M,__G,__Special_reason,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))))).
:-(FLORA_THIS_WORKSPACE(jtr2w)(defeated,flapply(___ID,__Reason),___M,___ConsiderSucceeded,___CallerID,flapply(d,__Reason,__DefeatMethod,___ConsiderSucceeded,___ID,null,___path),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(62,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(!,FLORA_THIS_WORKSPACE(childOfDefeated)(__Reason,__DefeatMethod,___Defeater,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),fllibexecute_delayed_calls([__DefeatMethod,__Reason,___Defeater],[__DefeatMethod,__Reason,___CallerID,___ConsiderSucceeded,___ID,___M,___path])))).
:-(FLORA_THIS_WORKSPACE(isa_goal_reason)(__ISA,___M,__G,null,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(64,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),=(__ISA,__G))).
:-(FLORA_THIS_WORKSPACE(jtr2m)(uncovered,___Info,___M,___ConsiderSucceeded,___Child,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(66,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(!,'\\false'))).
:-(FLORA_THIS_WORKSPACE(jtr2m)(__Type,flapply(___ID,___BG),___M,___ConsiderSucceeded,flapply(m,___BG,null,___ConsiderSucceeded,___ID,null,___path),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(68,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(';'(==(__Type,subgoal),=(__Type,bgaxiom)),!))).
:-(FLORA_THIS_WORKSPACE(jtr2m)(aggregate,flapply(___Type,__Query,__Solutions),___M,__ConsiderSucceeded,__Child,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(70,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(!,','(=(__Special_reason,'aggregate expression'),';'(','(=(__Child,flapply(w,__G,__TheVar,__ConsiderSucceeded,null,__Special_reason,___path)),:(basics,member(-(__TheVar,__G),__Solutions))),=(__Child,flapply(m,__Query,null,__ConsiderSucceeded,null,__Special_reason,___path))))),fllibexecute_delayed_calls([__Child,__ConsiderSucceeded,__G,__Query,__Solutions,__Special_reason,__TheVar,___path],[__Child,__ConsiderSucceeded,__Query,__Solutions,___M,___Type])))).
:-(FLORA_THIS_WORKSPACE(jtr2m)(defeated,flapply(___ID,__Reason),___M,___ConsiderSucceeded,flapply(d,__Reason,__DefeatMethod,___ConsiderSucceeded,___ID,null,___path),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(72,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(!,FLORA_THIS_WORKSPACE(childOfDefeated)(__Reason,__DefeatMethod,___Defeater,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),fllibexecute_delayed_calls([__DefeatMethod,__Reason,___Defeater],[__DefeatMethod,__Reason,___ConsiderSucceeded,___ID,___M,___path])))).
:-(FLORA_THIS_WORKSPACE(jtr2m)(naf,flapply(j,fact,flapply(___ID,___X)),___M,___ConsiderSucceeded,flapply(w,___X,null,___ConsiderSucceeded,___ID,null,___path),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(74,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(jtr2m)(naf,flapply(j,rule,flapply(___ID,__X)),__M,___ConsiderSucceeded,flapply(w,__BG,null,___ConsiderSucceeded,___ID,null,___path),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(76,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(aBodyWsubgoal)(__X,__M,__BG,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(fjw)(__H,__ConsiderSucceeded,__J,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(78,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(';'(->(:(flrcanon,is_naf_literal(__H,__NH)),=(__FullNH,__NH)),->(=(__H,\+(__NH)),=(__FullNH,__NH))),','(';'(->(FLORA_THIS_WORKSPACE(d^nontblflapply)(mayGetModule,__FullNH,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),\=(__M,'\\fidji')),'\\true'),','(!,fllibifthenelse(FLORA_THIS_MODULE_NAME,fllibcatch(fllibmodlit('neg^libmod_wrapper',__FullNH,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),__newdontcarevar7,'\\false'),','(fllibmodobj(body,'neg^libmod_wrapper',__FullNH,'_invalid_flora_module_','_$ctxt'(_CallerModuleVar,__newcontextvar8,__newcontextvar9),__newvar10),FLORA_THIS_WORKSPACE(fjw)(__newvar10,__ConsiderSucceeded,__J,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12))),','(fllibmodlit(libmod_wrapper,__H,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14)),','(FLORA_THIS_WORKSPACE(fmj)(__NH,__ConsiderSucceeded,__JJ,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,__newcontextvar16)),=(__J,flapply(j,naf,__JJ)))),656,'fidjiUtils.ergo')))),fllibexecute_delayed_calls([__ConsiderSucceeded,__FullNH,__H,__J,__JJ,__M,__NH,__newdontcarevar17],[__ConsiderSucceeded,__H,__J])))).
:-(FLORA_THIS_WORKSPACE(fjw)(__H,__ConsiderSucceeded,__J,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(80,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__H,[flapply(hypothetical,__Type),__G]),','(!,';'(->(==(__Type,<>),fllibhypothetical(<>,FLORA_THIS_WORKSPACE(fjw)(__G,__ConsiderSucceeded,__J,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))),';'(->(=(__Type,~<>),fllibhypothetical(<>,FLORA_THIS_WORKSPACE(fmj)(__G,__ConsiderSucceeded,__J,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),'\\true')))),fllibexecute_delayed_calls([__ConsiderSucceeded,__G,__H,__J,__Type],[__ConsiderSucceeded,__H,__J])))).
:-(FLORA_THIS_WORKSPACE(fjw)(__H,___ConsiderSucceeded,flapply(j,aggregate,flapply(__Type,__Query,__Solutions)),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(82,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(isAggregate)(__H,__Type,__Query,__Solutions,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),!))).
:-(FLORA_THIS_WORKSPACE(fjw)(__G,___ConsiderSucceeded,flapply(j,rule,flapply(fj_bodyExpression,__G)),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(84,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__G,[__F|__newdontcarevar3]),','(';'(=(__F,flapply(logic,and)),=(__F,flapply(logic,or))),!)),fllibexecute_delayed_calls([__F,__G,__newdontcarevar4],[__G,___ConsiderSucceeded])))).
:-(FLORA_THIS_WORKSPACE(fjw)(__H,___ConsiderSucceeded,flapply(j,fact,null),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(86,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),:(flrstorageutils,'\\isbasefact'(__H)))).
:-(FLORA_THIS_WORKSPACE(fjw)(__G,__ConsiderSucceeded,__J,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(88,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__G,[flapply(control,ifthenelse),__newdontcarevar3,__C,__T,__E]),','(';'(->(fllibuniveqform(__C,flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__NC,fllibexecute_delayed_calls([__NC],[]))),[__NC],__newquantvar4,__newquantvar5))),'\\true'),fllibuniveqform(__NC,flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__C,fllibexecute_delayed_calls([__C],[]))),[__C],__newquantvar6,__newquantvar7)))),','(FLORA_THIS_WORKSPACE(fjw)(';'(','(__C,__T),','(__NC,__E)),__ConsiderSucceeded,__J,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),!))),fllibexecute_delayed_calls([__C,__ConsiderSucceeded,__E,__G,__J,__NC,__T,__newdontcarevar10],[__ConsiderSucceeded,__G,__J])))).
:-(FLORA_THIS_WORKSPACE(fjw)(__G,__ConsiderSucceeded,__J,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(90,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__G,[flapply(control,ifthen),__newdontcarevar3,__C,__T]),','(';'(->(fllibuniveqform(__C,flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__NC,fllibexecute_delayed_calls([__NC],[]))),[__NC],__newquantvar4,__newquantvar5))),'\\true'),fllibuniveqform(__NC,flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__C,fllibexecute_delayed_calls([__C],[]))),[__C],__newquantvar6,__newquantvar7)))),','(FLORA_THIS_WORKSPACE(fjw)(';'(','(__C,__T),__NC),__ConsiderSucceeded,__J,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),!))),fllibexecute_delayed_calls([__C,__ConsiderSucceeded,__G,__J,__NC,__T,__newdontcarevar10],[__ConsiderSucceeded,__G,__J])))).
:-(FLORA_THIS_WORKSPACE(fjw)(__G,___ConsiderSucceeded,flapply(j,rule,flapply(__ID,__B)),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(92,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^nontblflapply)(mayGetModule,__G,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(tracingInformation(__G,__newdontcarevar5,__ID),','(fllibclause(__ID,__newvar6,','('_$_$_ergo''prop_descriptor'(__ID,__newvar7,__newvar8,type,__newvar9,__newvar6),'_$_$_ergo''tag_descriptor'(__ID,__newvar7,__newvar8,__Tag,__newvar6)),null,[__G],__B),','(fllibmodlit(libmod_wrapper,__B,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11)),','(FLORA_THIS_WORKSPACE(executeBody)(__B,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar13)),','(\+(FLORA_THIS_WORKSPACE(fjdefeatedr)(__Tag,__G,__newdontcarevar14,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,__newcontextvar16))),','(fllibmodobj(body,'d^tblflapply',['\\opaqueJustification',w,__G,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar17,__newcontextvar18)],__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar19,__newcontextvar20),__newvar21),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__newvar21,fllibexecute_delayed_calls([__G,__M],[]))),[__G,__M],726,'fidjiUtils.ergo'))))))))),fllibexecute_delayed_calls([__B,__G,__ID,__M,__Tag,__newdontcarevar22],[__B,__G,__ID,___ConsiderSucceeded])))).
:-(FLORA_THIS_WORKSPACE(fjw)(__G,___ConsiderSucceeded,flapply(j,defeated,flapply(___ID,__Reason)),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(94,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^nontblflapply)(mayGetModule,__G,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(fllibtruthvalue(undefined,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__G,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))),','(fllibclause(__newvar7,__newvar8,','('_$_$_ergo''prop_descriptor'(__newvar7,__newvar9,__newvar10,type,__newvar11,__newvar8),'_$_$_ergo''tag_descriptor'(__newvar7,__newvar9,__newvar10,__Tag,__newvar8)),null,[__G],___B),','(FLORA_THIS_WORKSPACE(fjdefeatedr)(__Tag,__G,__Reason,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar13)),','(fllibmodobj(body,'d^tblflapply',['\\opaqueJustification',w,__G,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar14,__newcontextvar15)],__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar16,__newcontextvar17),__newvar18),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__newvar18,fllibexecute_delayed_calls([__G,__M],[]))),[__G,__M],733,'fidjiUtils.ergo'))))))),fllibexecute_delayed_calls([__G,__M,__Reason,__Tag,___B],[__G,__Reason,___ConsiderSucceeded,___ID])))).
:-(FLORA_THIS_WORKSPACE(fjw)(__G,___ConsiderSucceeded,flapply(j,bg_axiom,flapply(__Comment,__B)),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(96,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^nontblflapply)(mayGetModule,__G,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','('\\bgaxiom'(__G,__B,__Comment),','(fllibmodlit(libmod_wrapper,__B,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(executeBody)(__B,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),','(fllibmodobj(body,'d^tblflapply',['\\opaqueJustification',w,__G,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)],__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12),__newvar13),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__newvar13,fllibexecute_delayed_calls([__G,__M],[]))),[__G,__M],748,'fidjiUtils.ergo'))))))),fllibexecute_delayed_calls([__B,__Comment,__G,__M],[__B,__Comment,__G,___ConsiderSucceeded])))).
:-(FLORA_THIS_WORKSPACE(fjw)(__G,___ConsiderSucceeded,flapply(j,inheritance,__Reasons),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(98,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^nontblflapply)(mayGetModule,__G,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(flrcanon,convert_to_body_literal(__G,__BG)),','('\\inheritance'(__BG,__Reasons),','(fllibmodobj(body,'d^tblflapply',['\\opaqueJustification',w,__G,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)],__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8),__newvar9),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__newvar9,fllibexecute_delayed_calls([__G,__M],[]))),[__G,__M],754,'fidjiUtils.ergo')))))),fllibexecute_delayed_calls([__BG,__G,__M,__Reasons],[__G,__Reasons,___ConsiderSucceeded])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(wNodeAnswerToMatchingSource,__Node,__RuleOrFactOrSystem,__MatchingRule,__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(100,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__Node,[__newdontcarevar3,__G,__newdontcarevar4,__CS,__newdontcarevar5,__newdontcarevar6,__newdontcarevar7]),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(mayGetModule,__G,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(fjw)(__G,__CS,flapply(j,__Type,__Info),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11)),FLORA_THIS_WORKSPACE(wNodeAnswerToMatchingSource2)(__Type,__Info,__G,__RuleOrFactOrSystem,__MatchingRule,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar13)),=(__RuleOrFactOrSystem,system),762,'fidjiUtils.ergo'))),fllibexecute_delayed_calls([__CS,__G,__Info,__MatchingRule,__Module,__Node,__RuleOrFactOrSystem,__Type,__newdontcarevar14],[__MatchingRule,__Module,__Node,__RuleOrFactOrSystem])))).
:-(FLORA_THIS_WORKSPACE(wNodeAnswerToMatchingSource2)(naf,___Info,__newdontcarevar1,system,___ID,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(102,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(wNodeAnswerToMatchingSource2)(rule,flapply(___ID,__newdontcarevar1),__newdontcarevar2,rule,___ID,'_$ctxt'(_CallerModuleVar,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''rule_enabled'(104,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(wNodeAnswerToMatchingSource2)(fact,__newdontcarevar1,__G,flapply(fact,__GGG),__newdontcarevar2,'_$ctxt'(_CallerModuleVar,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''rule_enabled'(106,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(!,','(';'(->(';'(fllibuniveqform(__G,','(fllibmodobj(body,libmod_wrapper,__GG,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6),__newvar7),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__newvar7,fllibexecute_delayed_calls([__GG,__M],[]))),[__GG,__M],__newquantvar8,__newquantvar9)))),fllibuniveqform(__G,\+(fllibmodlit(libmod_wrapper,__GG,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11))))),','(fllibmodobj(body,'neg^libmod_wrapper',__GG,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar13),__newvar14),=(__H,__newvar14))),=(__H,__G)),:(flrstorageutils,'\\isbasefact'(__H,__GGG)))),fllibexecute_delayed_calls([__G,__GG,__GGG,__H,__M],[__G,__GGG,__newdontcarevar15])))).
:-(FLORA_THIS_WORKSPACE(wNodeAnswerToMatchingSource2)(bg_axiom,flapply(___Comment,__newdontcarevar1),___G,bg_axiom,___Comment,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(108,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(wNodeAnswerToMatchingSource2)(inheritance,___Info,___G,inheritance,inheritance,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(110,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(my_once)(__G,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(112,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibbagof(__newdontcarevar6,[],[],','(','(=(__G,__newdontcarevar6),fllibmodlit(libmod_wrapper,__newdontcarevar6,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5))),fllibexecute_delayed_calls([__G,__newdontcarevar6],[])),__newvar7),=([__G|__newdontcarevar3],__newvar7)),fllibexecute_delayed_calls([__G,__newdontcarevar8],[__G])))).
:-(FLORA_THIS_WORKSPACE(fmj)(__H,__ConsiderSucceeded,flapply(j,naf,__J),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(114,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(';'(fllibuniveqform(__H,flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__NH,fllibexecute_delayed_calls([__NH],[]))),[__NH],__newquantvar3,__newquantvar4))),fllibuniveqform(__H,\+(__NH))),','(!,','(','(fllibmodobj(body,libmod_wrapper,__H,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6),__newvar7),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__newvar7,fllibexecute_delayed_calls([__H],[]))),[],794,'fidjiUtils.ergo'))),FLORA_THIS_WORKSPACE(fjw)(__NH,__ConsiderSucceeded,__J,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9))))),fllibexecute_delayed_calls([__ConsiderSucceeded,__H,__J,__NH],[__ConsiderSucceeded,__H,__J])))).
:-(FLORA_THIS_WORKSPACE(fmj)(__H,__ConsiderSucceeded,__J,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(116,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__H,[flapply(hypothetical,__Type),__G]),','(!,';'(->(==(__Type,<>),fllibhypothetical(<>,FLORA_THIS_WORKSPACE(fmj)(__G,__ConsiderSucceeded,__J,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))),';'(->(=(__Type,~<>),fllibhypothetical(<>,FLORA_THIS_WORKSPACE(fjw)(__G,__ConsiderSucceeded,__J,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),'\\true')))),fllibexecute_delayed_calls([__ConsiderSucceeded,__G,__H,__J,__Type],[__ConsiderSucceeded,__H,__J])))).
:-(FLORA_THIS_WORKSPACE(fmj)(__H,___ConsiderSucceeded,flapply(j,aggregate,flapply(__Type,__Query,__Solutions)),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(118,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(isAggregate)(__H,__Type,__Query,__Solutions,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),!))).
:-(FLORA_THIS_WORKSPACE(fmj)(__G,__ConsiderSucceeded,flapply(j,subgoal,flapply(fj_bodyExpression,__Bi)),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(120,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__G,[__F|__newdontcarevar3]),','(';'(=(__F,flapply(logic,and)),=(__F,flapply(logic,or))),','(!,FLORA_THIS_WORKSPACE(aBodyMsubgoal)(__G,main,__ConsiderSucceeded,__Bi,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5))))),fllibexecute_delayed_calls([__Bi,__ConsiderSucceeded,__F,__G,__newdontcarevar6],[__Bi,__ConsiderSucceeded,__G])))).
:-(FLORA_THIS_WORKSPACE(fmj)(__G,__ConsiderSucceeded,__J,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(122,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__G,[flapply(control,ifthenelse),__newdontcarevar3,__C,__T,__E]),','(!,','(';'(->(fllibuniveqform(__C,flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__NC,fllibexecute_delayed_calls([__NC],[]))),[__NC],__newquantvar4,__newquantvar5))),'\\true'),fllibuniveqform(__NC,flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__C,fllibexecute_delayed_calls([__C],[]))),[__C],__newquantvar6,__newquantvar7)))),FLORA_THIS_WORKSPACE(fmj)(';'(','(__C,__T),','(__NC,__E)),__ConsiderSucceeded,__J,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9))))),fllibexecute_delayed_calls([__C,__ConsiderSucceeded,__E,__G,__J,__NC,__T,__newdontcarevar10],[__ConsiderSucceeded,__G,__J])))).
:-(FLORA_THIS_WORKSPACE(fmj)(__G,__ConsiderSucceeded,__J,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(124,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__G,[flapply(control,ifthen),__newdontcarevar3,__C,__T]),','(!,','(';'(->(fllibuniveqform(__C,flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__NC,fllibexecute_delayed_calls([__NC],[]))),[__NC],__newquantvar4,__newquantvar5))),'\\true'),fllibuniveqform(__NC,flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__C,fllibexecute_delayed_calls([__C],[]))),[__C],__newquantvar6,__newquantvar7)))),FLORA_THIS_WORKSPACE(fmj)(';'(','(__C,__T),__NC),__ConsiderSucceeded,__J,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9))))),fllibexecute_delayed_calls([__C,__ConsiderSucceeded,__G,__J,__NC,__T,__newdontcarevar10],[__ConsiderSucceeded,__G,__J])))).
:-(FLORA_THIS_WORKSPACE(fmj)(__H,__ConsiderSucceeded,__J,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(126,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^nontblflapply)(mayGetModule,__H,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(fllibclause(__ID,__newvar5,','('_$_$_ergo''prop_descriptor'(__ID,__newvar6,__newvar7,type,__newvar8,__newvar5),'_$_$_ergo''tag_descriptor'(__ID,__newvar6,__newvar7,__Tag,__newvar5)),null,[__H],__B),','(FLORA_THIS_WORKSPACE(fmj2)(__Tag,__ID,__H,__B,__ConsiderSucceeded,__J,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),','(fllibmodobj(body,'d^tblflapply',['\\opaqueJustification',m,__H,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)],__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14),__newvar15),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__newvar15,fllibexecute_delayed_calls([__H,__M],[]))),[__H,__M],840,'fidjiUtils.ergo')))))),fllibexecute_delayed_calls([__B,__ConsiderSucceeded,__H,__ID,__J,__M,__Tag],[__ConsiderSucceeded,__H,__J])))).
:-(FLORA_THIS_WORKSPACE(fmj)(__G,__ConsiderSucceeded,flapply(j,bg_axiom,flapply(___Comment,__Bi)),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(128,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^nontblflapply)(mayGetModule,__G,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','('\\bgaxiom'(__G,__B,___Comment),','(FLORA_THIS_WORKSPACE(aBodyMsubgoal)(__B,__M,__ConsiderSucceeded,__Bi,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(fllibmodobj(body,'d^tblflapply',['\\opaqueJustification',w,__G,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)],__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10),__newvar11),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__newvar11,fllibexecute_delayed_calls([__G,__M],[]))),[__G,__M],851,'fidjiUtils.ergo')))))),fllibexecute_delayed_calls([__B,__Bi,__ConsiderSucceeded,__G,__M,___Comment],[__Bi,__ConsiderSucceeded,__G,___Comment])))).
:-(FLORA_THIS_WORKSPACE(fmj)(___H,___ConsiderSucceeded,flapply(j,uncovered,flapply(null,___H)),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(130,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(fmj2)(__Tag,___ID,__G,___B,___ConsiderSucceeded,flapply(j,defeated,flapply(___ID,__Reason)),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(132,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(fjdefeatedr)(__Tag,__G,__Reason,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(fmj2)(___Tag,___CallerID,__G,__B,__ConsiderSucceeded,flapply(j,subgoal,flapply(___CallerID,__Bi)),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(134,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(';'(fllibuniveqform(__G,fllibmodlit('trans^libmod_wrapper',___H,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),fllibuniveqform(__G,fllibmodlit(libmod_wrapper,___H,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),','(!,FLORA_THIS_WORKSPACE(aBodyMsubgoal)(__B,__M,__ConsiderSucceeded,__Bi,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)))),fllibexecute_delayed_calls([__B,__Bi,__ConsiderSucceeded,__G,__M,___H],[__B,__Bi,__ConsiderSucceeded,__G,___CallerID,___Tag])))).
:-(FLORA_THIS_WORKSPACE(aBodyWsubgoal)(__Body,__M,__BG,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(136,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(subgoalOf)(__Body,w,__M,__BG,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(aBodyMsubgoal)(__Body,__M,__ConsiderSucceeded,__Bi,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(138,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(subgoalOf)(__Body,flapply(m,__ConsiderSucceeded),__M,__Bi,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(subgoalOf)(','(__A,__B),w,__M,__Subgoal,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(140,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(!,','(FLORA_THIS_WORKSPACE(my_once)(','(__A,__B),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),';'(FLORA_THIS_WORKSPACE(subgoalOf)(__A,w,__M,__Subgoal,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_THIS_WORKSPACE(subgoalOf)(__B,w,__M,__Subgoal,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))))))).
:-(FLORA_THIS_WORKSPACE(subgoalOf)(';'(__A,__B),w,__M,__Subgoal,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(142,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(!,';'(','(\+(\+(fllibmodlit(libmod_wrapper,__A,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))),','(!,FLORA_THIS_WORKSPACE(subgoalOf)(__A,w,__M,__Subgoal,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),','(\+(\+(fllibmodlit(libmod_wrapper,__B,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)))),FLORA_THIS_WORKSPACE(subgoalOf)(__B,w,__M,__Subgoal,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10))))))).
:-(FLORA_THIS_WORKSPACE(subgoalOf)(__G,w,__M,__G,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(144,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(';'(fllibuniveqform(__G,flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__NG,fllibexecute_delayed_calls([__NG],[]))),[__NG],__newquantvar3,__newquantvar4))),fllibuniveqform(__G,\+(__NG))),','(!,','(FLORA_THIS_WORKSPACE(justifiableGoal)(__NG,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),\+(FLORA_THIS_WORKSPACE(sys_trivial_justification)(__NG,m,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)))))),fllibexecute_delayed_calls([__G,__M,__NG],[__G,__M])))).
:-(FLORA_THIS_WORKSPACE(subgoalOf)(__G,w,__M,__G,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(146,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(justifiableGoal)(__G,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),\+(FLORA_THIS_WORKSPACE(sys_trivial_justification)(__G,w,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))))).
:-(FLORA_THIS_WORKSPACE(subgoalOf)(','(__A,__B),flapply(m,__FO),__M,__Subgoal,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(148,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(!,';'(FLORA_THIS_WORKSPACE(subgoalOf)(__A,flapply(m,__FO),__M,__Subgoal,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),';'(','(fllibcatch(','(fllibmodlit(libmod_wrapper,__A,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__A,__FO,__M,__Subgoal,__A,__newdontcarevar7,__Error,__Error,__B,__FO,__M,__Subgoal,__A,__newdontcarevar8,__Error,__Error,__B,__newdontcarevar9,__A,__FO,__M,__Subgoal],[])),__newdontcarevar10,=(__Error,yes)),','(\==(__Error,yes),FLORA_THIS_WORKSPACE(subgoalOf)(__B,flapply(m,__FO),__M,__Subgoal,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)))),','(fllibcatch(','(fllibmodlit(libmod_wrapper,__A,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14)),fllibexecute_delayed_calls([__A,__FO,__M,__Subgoal,__A,__newdontcarevar15,__Error,__Error,__B,__FO,__M,__Subgoal,__A,__newdontcarevar16,__Error,__Error,__B,__newdontcarevar17,__A,__FO,__M,__Subgoal],[])),__newdontcarevar18,=(__Error,true)),','(==(__Error,true),','(fllibcatch(','(fllibmodlit(libmod_wrapper,__B,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar19,__newcontextvar20)),fllibexecute_delayed_calls([__A,__FO,__M,__Subgoal,__A,__newdontcarevar21,__Error,__Error,__B,__FO,__M,__Subgoal,__A,__newdontcarevar22,__Error,__Error,__B,__newdontcarevar23,__A,__FO,__M,__Subgoal],[])),__newdontcarevar24,'\\true'),FLORA_THIS_WORKSPACE(subgoalOf)(__A,flapply(m,__FO),__M,__Subgoal,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar25,__newcontextvar26)))))))),fllibexecute_delayed_calls([__A,__B,__Error,__FO,__M,__Subgoal,__newdontcarevar27],[__A,__B,__FO,__M,__Subgoal])))).
:-(FLORA_THIS_WORKSPACE(subgoalOf)(';'(__A,__B),flapply(m,__FO),__M,__Subgoal,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(150,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(!,';'(FLORA_THIS_WORKSPACE(subgoalOf)(__A,flapply(m,__FO),__M,__Subgoal,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(subgoalOf)(__B,flapply(m,__FO),__M,__Subgoal,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))))).
:-(FLORA_THIS_WORKSPACE(subgoalOf)(__G,flapply(m,'\\true'),__M,__G,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(152,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(';'(fllibuniveqform(__G,flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__NG,fllibexecute_delayed_calls([__NG],[]))),[__NG],__newquantvar3,__newquantvar4))),fllibuniveqform(__G,\+(__NG))),','(!,','(FLORA_THIS_WORKSPACE(justifiableGoal)(__G,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),\+(FLORA_THIS_WORKSPACE(sys_trivial_justification)(__NG,w,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)))))),fllibexecute_delayed_calls([__G,__M,__NG],[__G,__M])))).
:-(FLORA_THIS_WORKSPACE(subgoalOf)(__G,flapply(m,'\\false'),__M,__G,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(154,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(';'(fllibuniveqform(__G,flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__NG,fllibexecute_delayed_calls([__NG],[]))),[__NG],__newquantvar3,__newquantvar4))),fllibuniveqform(__G,\+(__NG))),','(!,','(FLORA_THIS_WORKSPACE(justifiableGoal)(__NG,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(','(fllibmodobj(body,libmod_wrapper,__G,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8),__newvar9),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__newvar9,fllibexecute_delayed_calls([__G],[]))),[],958,'fidjiUtils.ergo'))),\+(FLORA_THIS_WORKSPACE(sys_trivial_justification)(__NG,w,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11))))))),fllibexecute_delayed_calls([__G,__M,__NG],[__G,__M])))).
:-(FLORA_THIS_WORKSPACE(subgoalOf)(__G,flapply(m,'\\true'),__M,__G,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(156,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(!,','(FLORA_THIS_WORKSPACE(justifiableGoal)(__G,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),\+(FLORA_THIS_WORKSPACE(sys_trivial_justification)(__G,m,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))))).
:-(FLORA_THIS_WORKSPACE(subgoalOf)(__G,flapply(m,___FO),___M,__G,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(158,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrdelaysupport,is_delayed_literal(__G)),','(!,fllibcatch(\+(fllibmodlit(libmod_wrapper,__G,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),__newdontcarevar5,'\\false'))),fllibexecute_delayed_calls([__G,__newdontcarevar6],[__G,___FO,___M])))).
:-(FLORA_THIS_WORKSPACE(subgoalOf)(__G,flapply(m,'\\false'),__M,__G,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(160,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(justifiableGoal)(__G,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(fllibcatch(','(fllibmodobj(body,libmod_wrapper,__G,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6),__newvar7),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__newvar7,fllibexecute_delayed_calls([__G],[]))),[],972,'fidjiUtils.ergo'))),__newdontcarevar8,fllibhypothetical(~<>,fllibmodlit(libmod_wrapper,__G,__newdontcarevar9,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11)))),\+(FLORA_THIS_WORKSPACE(sys_trivial_justification)(__G,m,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar13))))),fllibexecute_delayed_calls([__G,__M,__newdontcarevar14],[__G,__M])))).
:-(FLORA_THIS_WORKSPACE(subgoalIn)(__G,__SG,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(162,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(subgoalIn)(__G,transparentNAF,__SG,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(isDeleteLiteral)(__G,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(164,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(:(usermod,compound(__G)),','(functor(__G,__Fun,__A),','(FLORA_THIS_WORKSPACE(isDeleteLiteral_aux)(__Fun,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(';'(==(__A,2),==(__A,3)),!)))),fllibexecute_delayed_calls([__A,__Fun,__G],[__G])))).
:-(FLORA_THIS_WORKSPACE(isTransDeleteLiteral)(__G,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(166,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(compound,__G,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(functor(__G,__Fun,__A),','(FLORA_THIS_WORKSPACE(isTransDeleteLiteral_aux)(__Fun,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(';'(==(__A,2),==(__A,3)),!)))),fllibexecute_delayed_calls([__A,__Fun,__G],[__G])))).
:-(FLORA_THIS_WORKSPACE(isDeleteLiteral_aux)(fllibdelete,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(168,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(isDeleteLiteral_aux)(fllibdeleteall,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(170,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(isDeleteLiteral_aux)(flliberase,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(172,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(isDeleteLiteral_aux)(flliberaseall,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(174,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(isTransDeleteLiteral_aux)(fllibbtdelete,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(176,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(isTransDeleteLiteral_aux)(fllibbtdeleteall,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(178,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(isTransDeleteLiteral_aux)(fllibbterase,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(180,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(isTransDeleteLiteral_aux)(fllibbteraseall,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(182,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(justifiableGoal)(__G,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(184,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(isDeleteLiteral)(__G,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(!,','(:(flrdecode,flora_decode_goal_as_mainless_atom(__G,__GA)),xj_failError('This query invokes a delete{...} operation for which justification is not supported: %s',__GA)))),fllibexecute_delayed_calls([__G,__GA],[__G])))).
:-(FLORA_THIS_WORKSPACE(justifiableGoal)(__newvar1,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(186,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(fllibuniveqform(__newvar1,:(flrwhen,flora_put_attr(__newdontcarevar2,__newdontcarevar3,__newdontcarevar4))),','(!,'\\false')))).
:-(FLORA_THIS_WORKSPACE(justifiableGoal)(__newdontcarevar1,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(188,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(subgoalIn)(__Var,__newdontcarevar1,__newdontcarevar2,'_$ctxt'(_CallerModuleVar,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''rule_enabled'(190,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(:(flrdatatype,flora_is_var_prim(__Var)),','(!,FLORA_THIS_WORKSPACE(d^tblflapply)('\\fail','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))))).
:-(FLORA_THIS_WORKSPACE(subgoalIn)(__ITE,__NAFmode,__Subgoal,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(192,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__ITE,[flapply(control,ifthenelse),__newdontcarevar3,__C,__T,__E]),','(!,';'(FLORA_THIS_WORKSPACE(subgoalIn)(__C,__NAFmode,__Subgoal,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),';'(FLORA_THIS_WORKSPACE(subgoalIn)(__T,__NAFmode,__Subgoal,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),FLORA_THIS_WORKSPACE(subgoalIn)(__E,__NAFmode,__Subgoal,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)))))),fllibexecute_delayed_calls([__C,__E,__ITE,__NAFmode,__Subgoal,__T,__newdontcarevar10],[__ITE,__NAFmode,__Subgoal])))).
:-(FLORA_THIS_WORKSPACE(subgoalIn)(__IT,__NAFmode,__Subgoal,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(194,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__IT,[flapply(control,ifthen),__newdontcarevar3,__C,__T]),','(!,';'(FLORA_THIS_WORKSPACE(subgoalIn)(__C,__NAFmode,__Subgoal,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),FLORA_THIS_WORKSPACE(subgoalIn)(__T,__NAFmode,__Subgoal,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7))))),fllibexecute_delayed_calls([__C,__IT,__NAFmode,__Subgoal,__T,__newdontcarevar8],[__IT,__NAFmode,__Subgoal])))).
:-(FLORA_THIS_WORKSPACE(subgoalIn)(','(__A,__B),__NAFmode,__Subgoal,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(196,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(!,';'(FLORA_THIS_WORKSPACE(subgoalIn)(__A,__NAFmode,__Subgoal,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(subgoalIn)(__B,__NAFmode,__Subgoal,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))))).
:-(FLORA_THIS_WORKSPACE(subgoalIn)(';'(__A,__B),__NAFmode,__Subgoal,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(198,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(!,';'(FLORA_THIS_WORKSPACE(subgoalIn)(__A,__NAFmode,__Subgoal,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(subgoalIn)(__B,__NAFmode,__Subgoal,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))))).
:-(FLORA_THIS_WORKSPACE(subgoalIn)(__Naf,transparentNAF,__Subgoal,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(200,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(';'(fllibuniveqform(__Naf,flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__G,fllibexecute_delayed_calls([__G],[]))),[__G],__newquantvar3,__newquantvar4))),fllibuniveqform(__Naf,\+(__G))),','(!,FLORA_THIS_WORKSPACE(subgoalIn)(__G,transparentNAF,__Subgoal,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__G,__Naf,__Subgoal],[__Naf,__Subgoal])))).
:-(FLORA_THIS_WORKSPACE(subgoalIn)(__Naf,opaqueNAF,__Subgoal,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(202,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(';'(fllibuniveqform(__Naf,flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__G,fllibexecute_delayed_calls([__G],[]))),[__G],__newquantvar3,__newquantvar4))),fllibuniveqform(__Naf,\+(__G))),','(!,';'(->(FLORA_THIS_WORKSPACE(isSimpleSubgoal)(__G,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),=(__Subgoal,__Naf)),FLORA_THIS_WORKSPACE(subgoalIn)(__G,opaqueNAF,__Subgoal,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))))),fllibexecute_delayed_calls([__G,__Naf,__Subgoal],[__Naf,__Subgoal])))).
:-(FLORA_THIS_WORKSPACE(subgoalIn)(__Aggregate,__NAFmode,__Subgoal,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(204,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__Aggregate,[flapply(aggregate,___Type),___Var,___groupV,___uniq,__Query,___res]),','(!,FLORA_THIS_WORKSPACE(subgoalIn)(__Query,__NAFmode,__Subgoal,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))),fllibexecute_delayed_calls([__Aggregate,__NAFmode,__Query,__Subgoal,___Type,___Var,___groupV,___res,___uniq],[__Aggregate,__NAFmode,__Subgoal])))).
:-(FLORA_THIS_WORKSPACE(subgoalIn)(___G,__NAFmode,___G,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(206,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),';'(=(__NAFmode,transparentNAF),=(__NAFmode,opaqueNAF)))).
:-(FLORA_THIS_WORKSPACE(isSimpleSubgoal)(__G,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(208,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(:(flrdatatype,flora_is_var_prim(__G)),!))).
:-(FLORA_THIS_WORKSPACE(isSimpleSubgoal)(__Naf,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(210,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(';'(fllibuniveqform(__Naf,flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__G,fllibexecute_delayed_calls([__G],[]))),[__G],__newquantvar3,__newquantvar4))),fllibuniveqform(__Naf,\+(__G))),','(!,FLORA_THIS_WORKSPACE(isSimpleSubgoal)(__G,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__G,__Naf],[__Naf])))).
:-(FLORA_THIS_WORKSPACE(isSimpleSubgoal)(__G,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(212,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(:(flrwrapper,is_flora_callable_literal(__G)),!))).
:-(FLORA_THIS_WORKSPACE(sys_trivial_justification)(__newvar1,__newdontcarevar2,__newdontcarevar3,'_$ctxt'(_CallerModuleVar,__newcontextvar4,__newcontextvar5)),','('_$_$_ergo''rule_enabled'(214,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(fllibuniveqform(__newvar1,'\\true'),!))).
:-(FLORA_THIS_WORKSPACE(sys_trivial_justification)(__newvar1,__newdontcarevar4,__newdontcarevar5,'_$ctxt'(_CallerModuleVar,__newcontextvar6,__newcontextvar7)),','('_$_$_ergo''rule_enabled'(216,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(fllibuniveqform(__newvar1,=(__newdontcarevar2,__newdontcarevar3)),!))).
:-(FLORA_THIS_WORKSPACE(sys_trivial_justification)(__newvar1,__newdontcarevar4,__newdontcarevar5,'_$ctxt'(_CallerModuleVar,__newcontextvar6,__newcontextvar7)),','('_$_$_ergo''rule_enabled'(218,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(fllibuniveqform(__newvar1,\=(__newdontcarevar2,__newdontcarevar3)),!))).
:-(FLORA_THIS_WORKSPACE(sys_trivial_justification)(__newvar1,__newdontcarevar2,__newdontcarevar3,'_$ctxt'(_CallerModuleVar,__newcontextvar4,__newcontextvar5)),','('_$_$_ergo''rule_enabled'(220,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(fllibuniveqform(__newvar1,!),!))).
:-(FLORA_THIS_WORKSPACE(sys_trivial_justification)(__G,__newdontcarevar1,__M,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(222,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibuniveqform(__G,fllibmodlit(objeql,[__X,__Y,'_$ctxt'(__newcontextvar4,__newcontextvar5,__newcontextvar6)],__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))),','(==(__X,__Y),!)),fllibexecute_delayed_calls([__G,__M,__X,__Y],[__G,__M,__newdontcarevar9])))).
:-(FLORA_THIS_WORKSPACE(sys_trivial_justification)(__newvar1,__newdontcarevar5,__newdontcarevar6,'_$ctxt'(_CallerModuleVar,__newcontextvar7,__newcontextvar8)),','('_$_$_ergo''rule_enabled'(224,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(fllibuniveqform(__newvar1,:(flrwhen,flora_put_attr(__newdontcarevar2,__newdontcarevar3,__newdontcarevar4))),!))).
:-(FLORA_THIS_WORKSPACE(sys_trivial_justification)(__G,__Type,__M,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(226,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),fllibmodlit('d^tblflapply',['\\trivialJustification',__Type,__G,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)],__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))).
:-(FLORA_THIS_WORKSPACE(executeBody)(','(__A,__B),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(228,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(!,','(FLORA_THIS_WORKSPACE(executeBody)(__A,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(executeBody)(__B,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))))).
:-(FLORA_THIS_WORKSPACE(executeBody)(';'(__A,__B),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(230,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(!,';'(FLORA_THIS_WORKSPACE(executeBody)(__A,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(executeBody)(__B,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))))).
:-(FLORA_THIS_WORKSPACE(executeBody)(__G,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(232,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrcallflora,traced_call(__G,__MatchingID,___F,___M)),FLORA_THIS_WORKSPACE(mayBindMatchingID)(__G,__MatchingID,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),fllibexecute_delayed_calls([__G,__MatchingID,___F,___M],[__G])))).
:-(FLORA_THIS_WORKSPACE(mayBindMatchingID)(__G,__MatchingID,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(234,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__G,[__H|__newdontcarevar3]),','(';'(=(__H,flapply(hilog,__newdontcarevar4,__newdontcarevar5)),=(__H,flapply(negation,neg))),','(!,','(functor(__G,__newdontcarevar6,__N),','(arg(__N,__G,__FW),arg(2,__FW,__MatchingID)))))),fllibexecute_delayed_calls([__FW,__G,__H,__MatchingID,__N,__newdontcarevar7],[__G,__MatchingID])))).
:-(FLORA_THIS_WORKSPACE(mayBindMatchingID)(___G,___ID,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(236,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(mayBindFirstMatchingID)(__G,__MatchingID,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(238,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(my_once)(:(flrcallflora,traced_call(__G,__MatchingID,___F,___M)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(mayBindMatchingID)(__G,__MatchingID,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))),fllibexecute_delayed_calls([__G,__MatchingID,___F,___M],[__G,__MatchingID])))).
:-(FLORA_THIS_WORKSPACE(isAggregate)(__BG,__Type,__Query,__Solutions,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(240,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(isAggregate)('\\true',__BG,__Type,__Query,__Solutions,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(isAggregate)(__Compute,__BG,__Type,__Query,__Solutions,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(242,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__BG,[flapply(aggregate,__Type),__AggVar,___grouping,___uniqvar,__Query,___result]),','(!,';'(->(fllibmodlit(libmod_wrapper,__Compute,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),findall(-(__AggVar,__Query),__Query,__Solutions)),'\\true'))),fllibexecute_delayed_calls([__AggVar,__BG,__Compute,__Query,__Solutions,__Type,___grouping,___result,___uniqvar],[__BG,__Compute,__Query,__Solutions,__Type])))).
:-(FLORA_THIS_WORKSPACE(isAggregate)(__Compute,__BG,__Type,__Query,__Solutions,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(244,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__BG,[flapply(logic,and),__AG,___goal]),','(fllibmetauniv(__AG,[flapply(aggregate,__Type),__AggVar,___grouping,___uniqvar,__Query,___result]),';'(->(fllibmodlit(libmod_wrapper,__Compute,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),findall(-(__AggVar,__Query),__Query,__Solutions)),'\\true'))),fllibexecute_delayed_calls([__AG,__AggVar,__BG,__Compute,__Query,__Solutions,__Type,___goal,___grouping,___result,___uniqvar],[__BG,__Compute,__Query,__Solutions,__Type])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(clauseCalls,__ID1,__M1,__Subgoal1,__ID2,__M2,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(246,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^nontblflapply)(clauseCalls,__ID1,__M1,FLORA_THIS_MODULE_NAME,__Subgoal1,__ID2,__M2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(clauseCalls,__ID1,__M1,__ExcludedModule,__Subgoal1,__ID2,__M2,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(248,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrregistry,flora_user_module_registry(__M1)),','(\==(__M1,__ExcludedModule),','(fllibclause(__ID1,__newvar5,','('_$_$_ergo''prop_descriptor'(__ID1,__newvar6,__newvar7,type,__newvar10,__newvar5),','('_$_$_ergo''tag_descriptor'(__ID1,__newvar6,__newvar7,__newvar9,__newvar5),'_$_$_ergo''tag_descriptor'(__ID1,__newvar6,__M1,__newdontcarevar8,__newvar5))),null,[__newdontcarevar11],__B),','(FLORA_THIS_WORKSPACE(subgoalIn)(__B,__Subgoal1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar13)),fllibclause(__ID2,__newvar16,','('_$_$_ergo''prop_descriptor'(__ID2,__newvar17,__newvar18,type,__newvar21,__newvar16),','('_$_$_ergo''tag_descriptor'(__ID2,__newvar17,__newvar18,__newvar20,__newvar16),'_$_$_ergo''tag_descriptor'(__ID2,__newvar17,__M2,__newdontcarevar19,__newvar16))),null,[__Subgoal1],__newdontcarevar22))))),fllibexecute_delayed_calls([__B,__ExcludedModule,__ID1,__ID2,__M1,__M2,__Subgoal1,__newdontcarevar23],[__ExcludedModule,__ID1,__ID2,__M1,__M2,__Subgoal1])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(f,__SourcePiece,__Where,__Searcher,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(250,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(';'(->(:(flrdatatype,flora_is_var_prim(__Searcher)),','(writeln(3,'Term finder: the Searcher argument must be bound'),FLORA_THIS_WORKSPACE(d^tblflapply)('\\fail','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))),'\\true'),','(ipListenerWindow(__LW),','(','(','(flora_plg2hlg(__newvar5,'com.coherentknowledge.fidji.FloraProgramEditor',flapply,0),','(flora_plg2hlg(__newvar6,flapply(boolean,1),flapply,0),flora_plg2hlg(__newvar7,flapply(doAfterFloraDeemedFullyLoaded,__LW),flapply,0))),','(java(__newvar5,__newvar6,__newvar7),','(flora_plg2hlg(__newvar5,'com.coherentknowledge.fidji.FloraProgramEditor',flapply,1),','(flora_plg2hlg(__newvar6,flapply(boolean,1),flapply,1),flora_plg2hlg(__newvar7,flapply(doAfterFloraDeemedFullyLoaded,__LW),flapply,1))))),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(find,__SourcePiece,__Where,__Searcher,__Results,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),','(:(flrdecode,flora_decode_goal_as_atom_substitute_vars(__Searcher,__SearcherDescription)),','(','(flora_plg2hlg(__newvar11,__Results,flapply,0),','(flora_plg2hlg(__newvar12,__SearcherDescription,flapply,0),flora_plg2hlg(__newvar13,__newdontcarevar10,flapply,0))),','(fjTermsFound(__newvar11,__newvar12,__newvar13),','(flora_plg2hlg(__newvar11,__Results,flapply,1),','(flora_plg2hlg(__newvar12,__SearcherDescription,flapply,1),flora_plg2hlg(__newvar13,__newdontcarevar10,flapply,1)))))))))),fllibexecute_delayed_calls([__LW,__Results,__Searcher,__SearcherDescription,__SourcePiece,__Where,__newdontcarevar14],[__Searcher,__SourcePiece,__Where])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(f,__SourcePiece,__Searcher,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(252,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(f,__SourcePiece,___Where,__Searcher,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),fllibexecute_delayed_calls([__Searcher,__SourcePiece,___Where],[__Searcher,__SourcePiece])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(f,__X,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(254,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(';'(->(:(flrdatatype,flora_is_var_prim(__X)),','(writeln(3,'Term finder: the search term must be bound'),FLORA_THIS_WORKSPACE(d^tblflapply)('\\fail','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))),'\\true'),','(ipListenerWindow(__LW),','(','(','(flora_plg2hlg(__newvar5,'com.coherentknowledge.fidji.FloraProgramEditor',flapply,0),','(flora_plg2hlg(__newvar6,flapply(boolean,1),flapply,0),flora_plg2hlg(__newvar7,flapply(doAfterFloraDeemedFullyLoaded,__LW),flapply,0))),','(java(__newvar5,__newvar6,__newvar7),','(flora_plg2hlg(__newvar5,'com.coherentknowledge.fidji.FloraProgramEditor',flapply,1),','(flora_plg2hlg(__newvar6,flapply(boolean,1),flapply,1),flora_plg2hlg(__newvar7,flapply(doAfterFloraDeemedFullyLoaded,__LW),flapply,1))))),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(find,__X,__Results,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),','(:(flrdecode,flora_decode_goal_as_atom_substitute_vars(__X,__XDescription)),','(','(flora_plg2hlg(__newvar11,__Results,flapply,0),','(flora_plg2hlg(__newvar12,__XDescription,flapply,0),flora_plg2hlg(__newvar13,__newdontcarevar10,flapply,0))),','(fjTermsFound(__newvar11,__newvar12,__newvar13),','(flora_plg2hlg(__newvar11,__Results,flapply,1),','(flora_plg2hlg(__newvar12,__XDescription,flapply,1),flora_plg2hlg(__newvar13,__newdontcarevar10,flapply,1)))))))))),fllibexecute_delayed_calls([__LW,__Results,__X,__XDescription,__newdontcarevar14],[__X])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(f_forGUI,__Term,__Heads,__Facts,__Remaining,__ListGUIint,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(256,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(ipListenerWindow(__LW),','(','(','(flora_plg2hlg(__newvar3,'com.coherentknowledge.fidji.FloraProgramEditor',flapply,0),','(flora_plg2hlg(__newvar4,flapply(boolean,1),flapply,0),flora_plg2hlg(__newvar5,flapply(doAfterFloraDeemedFullyLoaded,__LW),flapply,0))),','(java(__newvar3,__newvar4,__newvar5),','(flora_plg2hlg(__newvar3,'com.coherentknowledge.fidji.FloraProgramEditor',flapply,1),','(flora_plg2hlg(__newvar4,flapply(boolean,1),flapply,1),flora_plg2hlg(__newvar5,flapply(doAfterFloraDeemedFullyLoaded,__LW),flapply,1))))),','(';'(->(==(__Heads,true),=(__F1,=(__Where,flapply(rule,head)))),=(__F1,'\\false')),','(';'(->(==(__Facts,true),=(__F2,';'(__F1,=(__Where,fact)))),=(__F2,__F1)),','(';'(->(==(__Remaining,true),=(__F3,';'(__F2,';'(=(__Where,flapply(rule,body)),';'(=(__Where,flapply(rule,tag)),=(__Where,flapply(dr,__newdontcarevar6))))))),=(__F3,__F2)),','(=(__Searcher,','(FLORA_THIS_WORKSPACE(d^nontblflapply)(fs,__Term,__SourcePiece,__Where,___What,opaqueNAF,subsumes,__Found,'_$ctxt'(__newcontextvar7,__newcontextvar8,__newcontextvar9)),fllibmodlit(libmod_wrapper,__F3,FLORA_THIS_MODULE_NAME,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11)))),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(find,__Found,__SourcePiece,__Where,__Searcher,__Results,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar13)),','(','(flora_plg2hlg(__newvar14,__Results,flapply,0),','(flora_plg2hlg(__newvar15,'Dummy',flapply,0),','(flora_plg2hlg(__newvar16,fail,flapply,0),flora_plg2hlg(__newvar17,__ListGUIint,flapply,0)))),','(fjTermsFound(__newvar14,__newvar15,__newvar16,__newvar17),','(flora_plg2hlg(__newvar14,__Results,flapply,1),','(flora_plg2hlg(__newvar15,'Dummy',flapply,1),','(flora_plg2hlg(__newvar16,fail,flapply,1),flora_plg2hlg(__newvar17,__ListGUIint,flapply,1))))))))))))),fllibexecute_delayed_calls([__F1,__F2,__F3,__Facts,__Found,__Heads,__LW,__ListGUIint,__Remaining,__Results,__Searcher,__SourcePiece,__Term,__Where,__newdontcarevar18,___What],[__Facts,__Heads,__ListGUIint,__Remaining,__Term])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(find,__X,__Results,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(258,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(find,__Found,__SourcePiece,__Where,FLORA_THIS_WORKSPACE(d^nontblflapply)(fs,__X,__SourcePiece,__Where,___What,opaqueNAF,subsumes,__Found,'_$ctxt'(__newcontextvar3,__newcontextvar4,__newcontextvar5)),__Results,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),fllibexecute_delayed_calls([__Found,__Results,__SourcePiece,__Where,__X,___What],[__Results,__X])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(find,__SourcePiece,__Where,__Searcher,__Results,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(260,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(find,___Found,__SourcePiece,__Where,__Searcher,__Results,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),fllibexecute_delayed_calls([__Results,__Searcher,__SourcePiece,__Where,___Found],[__Results,__Searcher,__SourcePiece,__Where])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(find,__Found,__SourcePiece,__Where,__Searcher,__Results,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(262,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibsetof(__newdontcarevar20,[],[],','(','(=(__newdontcarevar20,flapply(t,__F,__M,__Tag,__PieceType,__ID,__Where_,__Found_)),','(fllibmodlit(libmod_wrapper,__Searcher,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(=(__SourcePiece,flapply(__PieceType,flapply(__ID,__M))),','(:(flrdecode,flora_decode_goal_as_mainless_atom_substitute_vars(__Found,__Found_)),','(';'(->(';'(=(__PieceType,dr),=(__PieceType,fact)),','(=(__Tag,''),FLORA_THIS_WORKSPACE(d^nontblflapply)(locateFile,__M,__F,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibclause(__ID,__newvar11,','('_$_$_ergo''prop_descriptor'(__ID,__newvar12,__newvar13,type,__newvar16,__newvar11),','('_$_$_ergo''tag_descriptor'(__ID,__newvar12,__newvar13,__Tag,__newvar11),','('_$_$_ergo''tag_descriptor'(__ID,__newvar12,__M,__newdontcarevar14,__newvar11),'_$_$_ergo''tag_descriptor'(__ID,__F,__newvar13,__newdontcarevar15,__newvar11)))),null,[__newdontcarevar17],__newdontcarevar18)),';'(->(:(flrdatatype,flora_is_var_prim(__Where)),=(__Where_,__PieceType)),=(__Where,__Where_))))))),fllibexecute_delayed_calls([__F,__Found,__Found_,__ID,__M,__PieceType,__newdontcarevar20,__Searcher,__SourcePiece,__Tag,__Where,__Where_,__newdontcarevar19],[])),__newvar21),=(__Results,__newvar21)),fllibexecute_delayed_calls([__F,__Found,__Found_,__ID,__M,__PieceType,__Results,__Searcher,__SourcePiece,__Tag,__Where,__Where_,__newdontcarevar22],[__Found,__Results,__Searcher,__SourcePiece,__Where])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(locateFile,__M,__F,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(264,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(flora_get_precise_file(__M,__F,___FilePath),!),fllibexecute_delayed_calls([__F,__M,___FilePath],[__F,__M])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(locateFile,___M,'ambiguous file','_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(266,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(fs,__X,__CallerIDAndModule,__Where,atom,__NAFtransparency,__Mode,__XX,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(268,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(';'(=(__Mode,unify),=(__Mode,subsumes)),','(';'(->(==(__Mode,unify),=(__XX,__X)),'\\true'),','(FLORA_THIS_WORKSPACE(findAtom)(__XX,__CallerIDAndModule,__Where,__NAFtransparency,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),';'(->(==(__Mode,subsumes),FLORA_THIS_WORKSPACE(mySubsumes)(__X,__XX,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))),'\\true')))))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(fs,__X,__CallerIDAndModule,__Where,subterm,__NAFtransparency,__Mode,__XX,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(270,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(';'(=(__Mode,unify),=(__Mode,subsumes)),','(FLORA_THIS_WORKSPACE(findAtom)(__A,__CallerIDAndModule,__Where,__NAFtransparency,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(';'(->(==(__Mode,unify),=(__XX,__X)),'\\true'),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(findSubTerm,__XX,__A,top,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),';'(->(==(__Mode,subsumes),FLORA_THIS_WORKSPACE(mySubsumes)(__X,__XX,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))),'\\true'))))),fllibexecute_delayed_calls([__A,__CallerIDAndModule,__Mode,__NAFtransparency,__Where,__X,__XX],[__CallerIDAndModule,__Mode,__NAFtransparency,__Where,__X,__XX])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(fs,__X,__SourcePiece,__Where,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(272,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(fs,__X,__SourcePiece,__Where,___What,opaqueNAF,subsumes,__newdontcarevar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),fllibexecute_delayed_calls([__SourcePiece,__Where,__X,__newdontcarevar6,___What],[__SourcePiece,__Where,__X])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(fs,__X,__SourcePiece,__Where,__Mode,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(274,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(fs,__X,__SourcePiece,__Where,___What,opaqueNAF,__Mode,__newdontcarevar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),fllibexecute_delayed_calls([__Mode,__SourcePiece,__Where,__X,__newdontcarevar6,___What],[__Mode,__SourcePiece,__Where,__X])))).
:-(FLORA_THIS_WORKSPACE(findAtom)(__A,__ThingIDAndModule,__Where,__NAFtransparency,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(276,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(';'(','(=(__Where,flapply(rule,head)),','(FLORA_THIS_WORKSPACE(literalCalls)(__A,__CallerIDAndModule,__NAFtransparency,__newdontcarevar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),=(__ThingIDAndModule,flapply(rule,__CallerIDAndModule)))),';'(','(=(__Where,flapply(rule,body)),','(FLORA_THIS_WORKSPACE(literalCalls)(__newdontcarevar6,__CallerIDAndModule,__NAFtransparency,__A,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),=(__ThingIDAndModule,flapply(rule,__CallerIDAndModule)))),','(=(__Where,fact),','(FLORA_THIS_WORKSPACE(my_isbasefact)(__M,__A,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),','(:(flrdecode,flora_decode_goal_as_mainless_atom_substitute_vars(__A,__Fact)),=(__ThingIDAndModule,flapply(fact,flapply(__Fact,__M)))))))),fllibexecute_delayed_calls([__A,__CallerIDAndModule,__Fact,__M,__NAFtransparency,__ThingIDAndModule,__Where,__newdontcarevar11],[__A,__NAFtransparency,__ThingIDAndModule,__Where])))).
:-(FLORA_THIS_WORKSPACE(findAtom)(__A,flapply(rule,flapply(__ID,__M)),flapply(rule,tag),___NAFtransparency,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(278,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibclause(__ID,__newvar5,','('_$_$_ergo''prop_descriptor'(__ID,__newvar6,__newvar7,type,__newvar9,__newvar5),','('_$_$_ergo''bool_descriptor'(__ID,__newvar6,__newvar7,__DS,__newvar5),','('_$_$_ergo''tag_descriptor'(__ID,__newvar6,__newvar7,__Tag,__newvar5),'_$_$_ergo''tag_descriptor'(__ID,__newvar6,__M,__newdontcarevar8,__newvar5)))),null,[___H],___B),','(\==(__M,FLORA_THIS_MODULE_NAME),';'(=(__A,__Tag),';'(=(__A,__ID),=(__A,__DS))))),fllibexecute_delayed_calls([__A,__DS,__ID,__M,__Tag,___B,___H],[__A,__ID,__M,___NAFtransparency])))).
:-(FLORA_THIS_WORKSPACE(findAtom)(__Atom,flapply(dr,flapply(__AtomLiteral,__M)),flapply(dr,__Type),___NAFtransparency,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(280,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(my_dr_atom)(__M,__Type,__Atom,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),:(flrdecode,flora_decode_goal_as_mainless_atom_substitute_vars(__Atom,__AtomLiteral))))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(findSubTerm,__SubTerm,__Term,down,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(282,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(:(flrdatatype,flora_is_nonvar_prim(__Term)),=(__Term,__SubTerm)))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(findSubTerm,__SubTerm,__List,__newdontcarevar1,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(284,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(:(usermod,is_list(__List)),','(!,','(=(__List,[__T1|__Tn]),';'(FLORA_THIS_WORKSPACE(d^nontblflapply)(findSubTerm,__SubTerm,__T1,down,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),FLORA_THIS_WORKSPACE(d^nontblflapply)(findSubTerm,__SubTerm,__Tn,down,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)))))),fllibexecute_delayed_calls([__List,__SubTerm,__T1,__Tn],[__List,__SubTerm,__newdontcarevar8])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(findSubTerm,__SubTerm,__Term,__newdontcarevar1,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(286,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrdatatype,flora_is_nonvar_prim(__Term)),','(fllibmetauniv(__Term,[__Header|__Children]),FLORA_THIS_WORKSPACE(findSubTerm2)(__SubTerm,__Header,__Children,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)))),fllibexecute_delayed_calls([__Children,__Header,__SubTerm,__Term],[__SubTerm,__Term,__newdontcarevar6])))).
:-(FLORA_THIS_WORKSPACE(findSubTerm2)(__SubTerm,flapply(hilog,__Head,__Module),__Children,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(288,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(!,';'(FLORA_THIS_WORKSPACE(d^nontblflapply)(findSubTerm,__SubTerm,__Head,down,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),';'(FLORA_THIS_WORKSPACE(d^nontblflapply)(findSubTerm,__SubTerm,__Children,down,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_THIS_WORKSPACE(d^nontblflapply)(findSubTerm,__SubTerm,__Module,down,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))))))).
:-(FLORA_THIS_WORKSPACE(findSubTerm2)(__SubTerm,flapply(flogic,__Head,__Module),__Children,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(290,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(!,';'(FLORA_THIS_WORKSPACE(d^nontblflapply)(findSubTerm,__SubTerm,__Head,down,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),';'(FLORA_THIS_WORKSPACE(d^nontblflapply)(findSubTerm,__SubTerm,__Children,down,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_THIS_WORKSPACE(d^nontblflapply)(findSubTerm,__SubTerm,__Module,down,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))))))).
:-(FLORA_THIS_WORKSPACE(findSubTerm2)(__SubTerm,flapply('%hilog',__Head,__Module),__Children,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(292,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(!,';'(FLORA_THIS_WORKSPACE(d^nontblflapply)(findSubTerm,__SubTerm,__Head,down,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),';'(FLORA_THIS_WORKSPACE(d^nontblflapply)(findSubTerm,__SubTerm,__Children,down,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_THIS_WORKSPACE(d^nontblflapply)(findSubTerm,__SubTerm,__Module,down,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))))))).
:-(FLORA_THIS_WORKSPACE(findSubTerm2)(__SubTerm,flapply(hilog,__Head),__Children,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(294,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(!,';'(FLORA_THIS_WORKSPACE(d^nontblflapply)(findSubTerm,__SubTerm,__Head,down,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^nontblflapply)(findSubTerm,__SubTerm,__Children,down,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))))).
:-(FLORA_THIS_WORKSPACE(findSubTerm2)(__SubTerm,flapply(negation,__newdontcarevar1),__Children,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(296,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(!,FLORA_THIS_WORKSPACE(d^nontblflapply)(findSubTerm,__SubTerm,__Children,down,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5))))).
:-(FLORA_THIS_WORKSPACE(findSubTerm2)(__SubTerm,__Header,__Children,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(298,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(:(usermod,atomic(__Header)),';'(=(__SubTerm,__Header),FLORA_THIS_WORKSPACE(d^nontblflapply)(findSubTerm,__SubTerm,__Children,down,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))))).
:-(FLORA_THIS_WORKSPACE(my_dr_atom)(__M,opposes,__Atom,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(300,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(';'(','(FLORA_THIS_WORKSPACE(my_opposes)(__M,__R1,__Atom1,__R2,__Atom2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(fllibmodobj(body,'d^tblflapply',[opposes,__R1,__Atom1,__R2,__Atom2,'_$ctxt'(__newcontextvar5,__newcontextvar6,__newcontextvar7)],__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9),__newvar10),=(__Atom,__newvar10))),','(FLORA_THIS_WORKSPACE(my_opposes)(__M,__R1,__Atom1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)),','(fllibmodobj(body,'d^tblflapply',[opposes,__R1,__Atom1,'_$ctxt'(__newcontextvar13,__newcontextvar14,__newcontextvar15)],__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar16,__newcontextvar17),__newvar18),=(__Atom,__newvar18)))),fllibexecute_delayed_calls([__Atom,__Atom1,__Atom2,__M,__R1,__R2],[__Atom,__M])))).
:-(FLORA_THIS_WORKSPACE(my_dr_atom)(__M,overrides,__Atom,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(302,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(';'(','(FLORA_THIS_WORKSPACE(my_overrides)(__M,__R1,__Atom1,__R2,__Atom2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(fllibmodobj(body,'d^tblflapply',[overrides,__R1,__Atom1,__R2,__Atom2,'_$ctxt'(__newcontextvar5,__newcontextvar6,__newcontextvar7)],__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9),__newvar10),=(__Atom,__newvar10))),','(FLORA_THIS_WORKSPACE(my_overrides)(__M,__R1,__Atom1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)),','(fllibmodobj(body,'d^tblflapply',[overrides,__R1,__Atom1,'_$ctxt'(__newcontextvar13,__newcontextvar14,__newcontextvar15)],__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar16,__newcontextvar17),__newvar18),=(__Atom,__newvar18)))),fllibexecute_delayed_calls([__Atom,__Atom1,__Atom2,__M,__R1,__R2],[__Atom,__M])))).
:-(FLORA_THIS_WORKSPACE(my_dr_atom)(__M,cancel,__Atom,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(304,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(';'(','(FLORA_THIS_WORKSPACE(my_cancel)(__M,__R1,__Atom1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(fllibmodobj(body,'d^tblflapply',[cancel,__R1,__Atom1,'_$ctxt'(__newcontextvar5,__newcontextvar6,__newcontextvar7)],__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9),__newvar10),=(__Atom,__newvar10))),','(FLORA_THIS_WORKSPACE(my_cancel)(__M,__R1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)),','(fllibmodobj(body,'d^tblflapply',[cancel,__R1,'_$ctxt'(__newcontextvar13,__newcontextvar14,__newcontextvar15)],__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar16,__newcontextvar17),__newvar18),=(__Atom,__newvar18)))),fllibexecute_delayed_calls([__Atom,__Atom1,__M,__R1],[__Atom,__M])))).
:-(FLORA_THIS_WORKSPACE(my_overrides)(__M,__R1,__R2,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(306,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrregistry,flora_user_module_registry(__M)),','(:(flrwrapper,flora_modularize_atom('\\overrides',__M,__Prefixed)),','(fllibmetauniv(__G,[__Prefixed,__R1,__R2,___Context]),fllibmodlit(libmod_wrapper,__G,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))),fllibexecute_delayed_calls([__G,__M,__Prefixed,__R1,__R2,___Context],[__M,__R1,__R2])))).
:-(FLORA_THIS_WORKSPACE(my_overrides)(__M,__R1,__Atom1,__R2,__Atom2,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(308,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrregistry,flora_user_module_registry(__M)),','(:(flrwrapper,flora_modularize_atom('\\overrides',__M,__Prefixed)),','(fllibmetauniv(__G,[__Prefixed,__R1,__Atom1,__R2,__Atom2,___Context]),fllibmodlit(libmod_wrapper,__G,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))),fllibexecute_delayed_calls([__Atom1,__Atom2,__G,__M,__Prefixed,__R1,__R2,___Context],[__Atom1,__Atom2,__M,__R1,__R2])))).
:-(FLORA_THIS_WORKSPACE(my_opposes)(__M,__A1,__A2,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(310,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrregistry,flora_user_module_registry(__M)),','(:(flrwrapper,flora_modularize_atom('\\opposes',__M,__Prefixed)),','(fllibmetauniv(__G,[__Prefixed,__A1,__A2,___Context]),fllibmodlit(libmod_wrapper,__G,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))),fllibexecute_delayed_calls([__A1,__A2,__G,__M,__Prefixed,___Context],[__A1,__A2,__M])))).
:-(FLORA_THIS_WORKSPACE(my_opposes)(__M,__R1,__Atom1,__R2,__Atom2,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(312,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrregistry,flora_user_module_registry(__M)),','(:(flrwrapper,flora_modularize_atom('\\opposes',__M,__Prefixed)),','(fllibmetauniv(__G,[__Prefixed,__R1,__Atom1,__R2,__Atom2,___Context]),fllibmodlit(libmod_wrapper,__G,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))),fllibexecute_delayed_calls([__Atom1,__Atom2,__G,__M,__Prefixed,__R1,__R2,___Context],[__Atom1,__Atom2,__M,__R1,__R2])))).
:-(FLORA_THIS_WORKSPACE(my_cancel)(__M,__R,__A,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(314,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrregistry,flora_user_module_registry(__M)),','(:(flrwrapper,flora_modularize_atom('\\cancel',__M,__Prefixed)),','(fllibmetauniv(__G,[__Prefixed,__R,__A,___Context]),fllibmodlit(libmod_wrapper,__G,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))),fllibexecute_delayed_calls([__A,__G,__M,__Prefixed,__R,___Context],[__A,__M,__R])))).
:-(FLORA_THIS_WORKSPACE(my_cancel)(__M,__R,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(316,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrregistry,flora_user_module_registry(__M)),','(:(flrwrapper,flora_modularize_atom('\\cancel',__M,__Prefixed)),','(fllibmetauniv(__G,[__Prefixed,__R,___Context]),fllibmodlit(libmod_wrapper,__G,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))),fllibexecute_delayed_calls([__G,__M,__Prefixed,__R,___Context],[__M,__R])))).
:-(FLORA_THIS_WORKSPACE(my_isbasefact)(__M,__Atom,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(318,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(';'(->(:(flrdatatype,flora_is_var_prim(__Atom)),=(__Head,__Atom)),:(flrcanon,convert_to_head_literal(__Atom,__Head))),','(:(flrregistry,flora_user_module_registry(__M)),','(\==(__M,FLORA_THIS_MODULE_NAME),','(:(flrwrapper,flora_fdb_storage_name(__M,__S)),:(storage,storage_find_fact(__S,__Head)))))),fllibexecute_delayed_calls([__Atom,__Head,__M,__S],[__Atom,__M])))).
:-(FLORA_THIS_WORKSPACE(literalCalls)(__Parent,__CallerIDAndModule,__Child,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(320,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(literalCalls)(__Parent,__CallerIDAndModule,transparentNAF,__Child,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(literalCalls)(__Parent,__CallerIDAndModule,__NAFtransparency,__Child,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(322,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(literalCalls)(__Parent,FLORA_THIS_MODULE_NAME,__CallerIDAndModule,__NAFtransparency,__Child,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(literalCalls)(__Parent,__ExcludedModule,flapply(__CallerID,__M1),__NAFtransparency,__Child,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(324,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibclause(__CallerID,__newvar5,','('_$_$_ergo''prop_descriptor'(__CallerID,__newvar6,__newvar7,type,__newvar10,__newvar5),','('_$_$_ergo''tag_descriptor'(__CallerID,__newvar6,__newvar7,__newvar9,__newvar5),'_$_$_ergo''tag_descriptor'(__CallerID,__newvar6,__M1,__newdontcarevar8,__newvar5))),null,[__Parent],__B),','(\==(__M1,__ExcludedModule),','(FLORA_THIS_WORKSPACE(subgoalIn)(__B,__NAFtransparency,__Child_,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)),fllibuniveqform(__Child,__Child_)))),fllibexecute_delayed_calls([__B,__CallerID,__Child,__Child_,__ExcludedModule,__M1,__NAFtransparency,__Parent],[__CallerID,__Child,__ExcludedModule,__M1,__NAFtransparency,__Parent])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(floraliteralCalledRelation,flapply(node,___L,___CallerID),null,flapply(node,___L,___CallerID),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(326,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(floraliteralCalledRelation,flapply(node,__Caller,__CallerID),flapply(node,__Called,__newdontcarevar1),___Context,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(328,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(literalCalls)(__Caller,__CallerID,__Called,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(floraliteralCallsRelation,flapply(node,___L,___CallerID),null,flapply(node,___L,___CallerID),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(330,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(floraliteralCallsRelation,flapply(node,__Called,__CallerID),flapply(node,__Caller,__newdontcarevar1),___Context,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(332,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(literalCalls)(__Caller,__CallerID,__Called,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(floraTopliteralCallsRelation,flapply(node,__newvar1,null),null,___Module,'_$ctxt'(_CallerModuleVar,__newcontextvar8,__newcontextvar9)),','('_$_$_ergo''rule_enabled'(334,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibmodobj(head,'d^tblflapply',[dummy,'_$ctxt'(__newcontextvar2,__newcontextvar3,__newcontextvar4)],___Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6),__newvar7),fllibuniveqform(__newvar1,__newvar7)),!))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(floraTopliteralCallsRelation,flapply(node,__Caller,null),flapply(node,__newvar1,__newdontcarevar8),__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar9,__newcontextvar10)),','('_$_$_ergo''rule_enabled'(336,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibmodobj(head,'d^tblflapply',[dummy,'_$ctxt'(__newcontextvar2,__newcontextvar3,__newcontextvar4)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6),__newvar7),fllibuniveqform(__newvar1,__newvar7)),','(','(!,','(FLORA_THIS_WORKSPACE(literalCalls)(__Caller,flapply(__newdontcarevar11,__Module),___Called,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar13)),\+(FLORA_THIS_WORKSPACE(literalCalls)(__newdontcarevar14,flapply(__newdontcarevar15,__Module),__Caller,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar16,__newcontextvar17))))),fllibexecute_delayed_calls([__Caller,__Module,__newdontcarevar18,___Called],[__Caller,__Module,__newdontcarevar19]))))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(floraTopliteralCallsRelation,flapply(node,__Called,__CallerID),flapply(node,__Caller,__newdontcarevar1),__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(338,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(literalCalls)(__Caller,flapply(__ID,__Module),__Called,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),=(__CallerID,flapply(__ID,__Module))),fllibexecute_delayed_calls([__Called,__Caller,__CallerID,__ID,__Module],[__Called,__Caller,__CallerID,__Module,__newdontcarevar6])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(fjFloraGenericCallNode,flapply(node,__G,__CallerID),__Type,__Term,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(340,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(';'(->(fllibmetauniv(__G,[__Header|__newdontcarevar3]),FLORA_THIS_WORKSPACE(d^nontblflapply)(fjFloraGenericCallNodeType,__Header,__Type,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5))),=(__Type,system)),','(:(flrdecode,flora_decode_goal_as_mainless_atom_substitute_vars(__G,__Label)),fllibmetauniv(__Term,[n,__G,__CallerID,__Label]))),fllibexecute_delayed_calls([__CallerID,__G,__Header,__Label,__Term,__Type,__newdontcarevar6],[__CallerID,__G,__Term,__Type])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(fjFloraGenericCallNodeType,flapply(prologlit,___Module),prolog,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(342,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(fjFloraGenericCallNodeType,__H,system,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(344,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(:(usermod,atomic(__H)),!))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(fjFloraGenericCallNodeType,__newdontcarevar1,literal,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(346,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(obtainTerm,__ID,__Type,__Term,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(348,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^nontblflapply)(nodeToLiteral,__ID,__Type,__Term2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(pp,__Term2,__PrettyTerm,____Type,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibmetauniv(__Term,[node,__ID,__PrettyTerm]))),fllibexecute_delayed_calls([__ID,__PrettyTerm,__Term,__Term2,__Type,____Type],[__ID,__Term,__Type])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(nodeToLiteral,__ID,__TheType,__Term,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(350,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(=(__ID,flapply(__Type,__Term1,__OptionalAppearance,___ConsiderSucceeded,___RuleID,___Special_reason,___path)),','(FLORA_THIS_WORKSPACE(consistencyAndUndefinednessCheck)(__Term1,__Type,__TheType,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),';'(->(==(__OptionalAppearance,null),=(__Term,__Term1)),=(__Term,__OptionalAppearance)))),fllibexecute_delayed_calls([__ID,__OptionalAppearance,__Term,__Term1,__TheType,__Type,___ConsiderSucceeded,___RuleID,___Special_reason,___path],[__ID,__Term,__TheType])))).
:-(FLORA_THIS_WORKSPACE(consistencyAndUndefinednessCheck)(__G,w,__TheType,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(352,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibcatch(fllibtruthvalue(undefined,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__G,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),__newdontcarevar5,=('Error',yes)),','(';'(->(==('Error',yes),=(__TheType,wu)),=(__TheType,wu)),!)),fllibexecute_delayed_calls([__G,__TheType,__newdontcarevar6],[__G,__TheType])))).
:-(FLORA_THIS_WORKSPACE(consistencyAndUndefinednessCheck)(__G,m,__TheType,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(354,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibcatch(fllibtruthvalue(undefined,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__G,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),__newdontcarevar5,=('Error',yes)),','(';'(->(==('Error',yes),=(__TheType,wu)),=(__TheType,wu)),!)),fllibexecute_delayed_calls([__G,__TheType,__newdontcarevar6],[__G,__TheType])))).
:-(FLORA_THIS_WORKSPACE(consistencyAndUndefinednessCheck)(__G,w,__TheType,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(356,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(!,fllibifthenelse(FLORA_THIS_MODULE_NAME,fllibcatch(fllibmodlit('neg^libmod_wrapper',__G,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),__newdontcarevar5,FLORA_THIS_WORKSPACE(d^tblflapply)('\\fail','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7))),=(__TheType,wc),=(__TheType,w),1499,'fidjiUtils.ergo')),fllibexecute_delayed_calls([__G,__TheType,__newdontcarevar8],[__G,__TheType])))).
:-(FLORA_THIS_WORKSPACE(consistencyAndUndefinednessCheck)(___G,___Type,___Type,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(358,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(nodeToLiteral,__ID,__Type,__Term,__RuleOrFactOrSystem,__MatchingRule,__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(360,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(=(__ID,flapply(__Type,__Term1,__OptionalAppearance,___ConsiderSucceeded,___RuleID,___Special_reason,___path)),','(';'(->(==(__OptionalAppearance,null),=(__Term,__Term1)),=(__Term,__OptionalAppearance)),FLORA_THIS_WORKSPACE(d^nontblflapply)(nodeToLiteral2,__Type,__Term1,__RuleOrFactOrSystem,__MatchingRule,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))),fllibexecute_delayed_calls([__ID,__MatchingRule,__Module,__OptionalAppearance,__RuleOrFactOrSystem,__Term,__Term1,__Type,___ConsiderSucceeded,___RuleID,___Special_reason,___path],[__ID,__MatchingRule,__Module,__RuleOrFactOrSystem,__Term,__Type])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(nodeToLiteral2,w,__Term,__RuleOrFactOrSystem,__MatchingRule,__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(362,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(!,fllibcatch(prologLiteralToMatchingSource(__Term,__RuleOrFactOrSystem,__MatchingRule,__Module),__newdontcarevar3,'\\true')),fllibexecute_delayed_calls([__MatchingRule,__Module,__RuleOrFactOrSystem,__Term,__newdontcarevar4],[__MatchingRule,__Module,__RuleOrFactOrSystem,__Term])))).
?-(fllibshdirect(op,null,1700,xfx,-->)).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(pp,__X,__Pretty,plain,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(364,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^nontblflapply)(mayGetModule,__X,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(flrcanon,convert_to_body_literal(__X,__BL)),','(!,:(flrparser,flora_decode_via_textgen(__BL,[:(ergo_textit,ergo_textit_show(__newdontcarevar5,__newdontcarevar6,__newdontcarevar7,__M)),:(ergo_textit,ergotext_textgen_show(__newdontcarevar8,__newdontcarevar9,__M))],__Pretty))))),fllibexecute_delayed_calls([__BL,__M,__Pretty,__X,__newdontcarevar10],[__Pretty,__X])))).
:-(FLORA_THIS_WORKSPACE(pp2)(__Vars,__Template,__Pretty,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(366,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(decodeVars)(__Vars,__Vars2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(fllibmetauniv(__Args,[flapply(hilog,args)|__Vars2]),';'(->(==(__Vars2,[]),=(__Pretty,__Template)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write_string,__Pretty,__Template,__Args,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))),fllibexecute_delayed_calls([__Args,__Pretty,__Template,__Vars,__Vars2],[__Pretty,__Template,__Vars])))).
FLORA_THIS_WORKSPACE(decodeVars)([],[],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)).
:-(FLORA_THIS_WORKSPACE(decodeVars)([__V|__Vars],[__PVar|__PVars],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(368,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(:(flrdecode,flora_decode_goal_as_mainless_atom_substitute_vars(__V,__PVar)),FLORA_THIS_WORKSPACE(decodeVars)(__Vars,__PVars,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))).
:-(FLORA_THIS_WORKSPACE(pp3)(__X,__M,__Pretty,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(370,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(tp)(__X,__M,__T1,[],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(checkNonAtoms)(__T1,__T,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),:(string,concat_atom(__T,__Pretty)))),fllibexecute_delayed_calls([__M,__Pretty,__T,__T1,__X],[__M,__Pretty,__X])))).
:-(FLORA_THIS_WORKSPACE(tp)(__X,___M,__T1,__Tn,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(372,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(:(flrdatatype,flora_is_var_prim(__X)),','(!,=(__T1,[?|__Tn]))))).
:-(FLORA_THIS_WORKSPACE(tp)(flapply(flora,__G),___M,__T1,__Tn,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(374,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(!,','(fllibmodlit(libmod_wrapper,__G,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),=(__T1,__Tn))))).
:-(FLORA_THIS_WORKSPACE(tp)('\\true',___M,__T1,__Tn,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(376,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(!,=(__T1,__Tn)))).
:-(FLORA_THIS_WORKSPACE(tp)([],___M,__T1,__Tn,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(378,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(!,=(__T1,__Tn)))).
:-(FLORA_THIS_WORKSPACE(tp)([__X],___M,[__X|___Tn],___Tn,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(380,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(:(usermod,atom(__X)),!))).
:-(FLORA_THIS_WORKSPACE(tp)(__L,___M,__T1,__Tn,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(382,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(:(usermod,is_list(__L)),','(!,','(atom_codes(__X,__L),=(__T1,[__X|__Tn])))),fllibexecute_delayed_calls([__L,__T1,__Tn,__X],[__L,__T1,__Tn,___M])))).
:-(FLORA_THIS_WORKSPACE(tp)(flapply(hilog,__X),__M,__T1,__Tn,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(384,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(!,FLORA_THIS_WORKSPACE(tp)(__X,__M,__T1,__Tn,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))).
:-(FLORA_THIS_WORKSPACE(tb)(__G,__M,__T1,__Tn,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(386,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrdatatype,flora_is_nonvar_prim(__G)),','(=(__G,','(__X,__Y)),','(!,','(FLORA_THIS_WORKSPACE(tb)(__X,__M,__T1,__T2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(tb)(__Y,__M,__T2,__Tn,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))))),fllibexecute_delayed_calls([__G,__M,__T1,__T2,__Tn,__X,__Y],[__G,__M,__T1,__Tn])))).
:-(FLORA_THIS_WORKSPACE(tb)(__B,__M,__T1,__Tn,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(388,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(tp)(__B,__M,__T1,__Tn,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(defaultT)(__G,__M,__T1,__Tn,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(390,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__G,[flapply(hilog,__Head),__Subterm]),','(!,','(FLORA_THIS_WORKSPACE(tp)(__Head,__M,__T1,[' '|__T2],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(tp)(__Subterm,__M,__T2,__Tn,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))),fllibexecute_delayed_calls([__G,__Head,__M,__Subterm,__T1,__T2,__Tn],[__G,__M,__T1,__Tn])))).
:-(FLORA_THIS_WORKSPACE(defaultT)(__G,__M,__T1,__Tn,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(392,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__G,[flapply(hilog,__Head),__A,__B]),','(!,','(FLORA_THIS_WORKSPACE(tp)(__A,__M,__T1,__T2a,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(=(__T2a,[' '|__T2]),','(FLORA_THIS_WORKSPACE(tp)(__Head,__M,__T2,[' '|__T3],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_THIS_WORKSPACE(tp)(__B,__M,__T3,__Tn,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))))))),fllibexecute_delayed_calls([__A,__B,__G,__Head,__M,__T1,__T2,__T2a,__T3,__Tn],[__G,__M,__T1,__Tn])))).
:-(FLORA_THIS_WORKSPACE(defaultT)(__G,___M,__T1,__Tn,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(394,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__G,[flapply(hilog,__Head,__MH),__Subterm]),','(!,','(FLORA_THIS_WORKSPACE(tp)(__Head,__MH,__T1,[' '|__T2],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(tp)(__Subterm,__MH,__T2,__Tn,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))),fllibexecute_delayed_calls([__G,__Head,__MH,__Subterm,__T1,__T2,__Tn],[__G,__T1,__Tn,___M])))).
:-(FLORA_THIS_WORKSPACE(defaultT)(__G,___M,__T1,__Tn,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(396,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__G,[flapply(hilog,__Head,__MH),__A,__B]),','(!,','(FLORA_THIS_WORKSPACE(tp)(__A,__MH,__T1,[' '|__T2],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(tp)(__Head,__MH,__T2,[' '|__T3],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_THIS_WORKSPACE(tp)(__B,__MH,__T3,__Tn,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)))))),fllibexecute_delayed_calls([__A,__B,__G,__Head,__MH,__T1,__T2,__T3,__Tn],[__G,__T1,__Tn,___M])))).
:-(FLORA_THIS_WORKSPACE(defaultT)(__X,___M,__T1,__Tn,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(398,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(:(usermod,atomic(__X)),','(!,=(__T1,[__X|__Tn]))))).
:-(FLORA_THIS_WORKSPACE(defaultT)(__X,___M,__T1,__Tn,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(400,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),=(__T1,[flapply(??,__X)|__Tn]))).
:-(FLORA_THIS_WORKSPACE(checkNonAtoms)([__A|__A1],[__A|__An],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(402,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(:(usermod,atomic(__A)),','(!,FLORA_THIS_WORKSPACE(checkNonAtoms)(__A1,__An,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))))).
:-(FLORA_THIS_WORKSPACE(checkNonAtoms)([__X|__A1],[__A|__An],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(404,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(!,','(:(flrdecode,flora_decode_goal_as_mainless_atom(__X,__A)),FLORA_THIS_WORKSPACE(checkNonAtoms)(__A1,__An,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))))).
FLORA_THIS_WORKSPACE(checkNonAtoms)([],[],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(buildHilogTree,__T,__HT,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(406,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(buildHilogTree,__T,__HT,'\\false',0,__newdontcarevar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),fllibexecute_delayed_calls([__HT,__T,__newdontcarevar6],[__HT,__T])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(buildHilogTree,__T,__NodeAtom,__newdontcarevar1,___MD,0,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(408,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(';'(:(flrdatatype,flora_is_var_prim(__T)),:(usermod,atomic(__T))),','(!,:(flrdecode,flora_decode_goal_as_atom_substitute_vars(__T,__NodeAtom)))))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(buildHilogTree,__T,__HT,__EH,__MD,__D,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(410,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(=(__T,','(__A,__B)),','(!,','(FLORA_THIS_WORKSPACE(d^nontblflapply)(buildHilogTrees,[__A,__B],__HTs,__EH,__MD,__MaxDepth,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(fllibdelayedliteral('\\is','fidjiUtils.ergo',1693,[__D,+(__MaxDepth,1)]),fllibmetauniv(__HT,[','|__HTs]))))),fllibexecute_delayed_calls([__A,__B,__D,__EH,__HT,__HTs,__MD,__MaxDepth,__T],[__D,__EH,__HT,__MD,__T])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(buildHilogTree,__T,__HT,__EH,__MD,__D,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(412,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(';'(','(fllibmetauniv(__T,[flapply(hilog,__Head)|__Children]),=(__Head_,__Head)),','(fllibmetauniv(__T,[flapply('%hilog',__Head,__Module)|__Children]),','(fllibmodobj(body,libmod_wrapper,__Head,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5),__newvar3),=(__Head_,__newvar3)))),','(!,','(FLORA_THIS_WORKSPACE(d^nontblflapply)(buildHilogTrees,__Children,__HTs,__EH,__MD,__MaxDepth,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),','(fllibdelayedliteral('\\is','fidjiUtils.ergo',1701,[__D,+(__MaxDepth,1)]),';'(->(fllibdelayedliteral(>,'fidjiUtils.ergo',1702,[__D,__MD]),','(:(flrdecode,flora_decode_goal_as_atom_substitute_vars(__Head_,__NodeAtom_)),','(';'(->(:(flrdatatype,flora_is_var_prim(__Module)),=(__NodeAtom_,__NodeAtom)),:(string,concat_atom(['%',__NodeAtom_],__NodeAtom))),fllibifthenelse(FLORA_THIS_MODULE_NAME,','(fllibmodlit(libmod_wrapper,__EH,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),','(:(flrdatatype,flora_is_nonvar_prim(__Head)),\+(:(usermod,atomic(__Head))))),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(buildHilogTree,__Head,__ExpandedHead,__EH,__MD,___D,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11)),','(fllibmetauniv(__HeadSub,[flapply(hilog,'Hilog Head:'),__ExpandedHead]),fllibmetauniv(__HT,[flapply(hilog,__NodeAtom),__HeadSub|__HTs]))),fllibmetauniv(__HT,[flapply(hilog,__NodeAtom)|__HTs]),1707,'fidjiUtils.ergo')))),:(flrdecode,flora_decode_goal_as_atom_substitute_vars(__T,__HT))))))),fllibexecute_delayed_calls([__Children,__D,__EH,__ExpandedHead,__HT,__HTs,__Head,__HeadSub,__Head_,__MD,__MaxDepth,__Module,__NodeAtom,__NodeAtom_,__T,___D],[__D,__EH,__HT,__MD,__T])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(buildHilogTree,__T,__NodeAtom,___EH,___MD,1,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(414,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),:(flrdecode,flora_decode_goal_as_atom_substitute_vars(__T,__NodeAtom)))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(buildHilogTrees,[__C1|__Cn],[__HT1|__HTn],__EH,__MD,__D,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(416,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^nontblflapply)(buildHilogTree,__C1,__HT1,__EH,__MD,__D1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(buildHilogTrees,__Cn,__HTn,__EH,__MD,__Dn,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),';'(->(fllibdelayedliteral(>,'fidjiUtils.ergo',1724,[__D1,__Dn]),=(__D,__D1)),=(__D,__Dn)))),fllibexecute_delayed_calls([__C1,__Cn,__D,__D1,__Dn,__EH,__HT1,__HTn,__MD],[__C1,__Cn,__D,__EH,__HT1,__HTn,__MD])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(browseTerm,__T,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(418,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^nontblflapply)(buildHilogTree,__T,__HT,'\\true',0,__newdontcarevar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),','(flora_plg2hlg(__newvar6,__HT,flapply,0),','(browseTerm(__newvar6),flora_plg2hlg(__newvar6,__HT,flapply,1)))),fllibexecute_delayed_calls([__HT,__T,__newdontcarevar7],[__T])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(justification,__Parent,__Child,__Root,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(420,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(justification_,__Parent,__Child,__Root,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(noPath)(__Child,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_THIS_WORKSPACE(noPath)(__Parent,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)))))).
:-(FLORA_THIS_WORKSPACE(noPath)(__Node,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(422,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(';'(==(__Node,null),fllibmetauniv(__Node,[flapply(hilog,___JTC),__newdontcarevar3,__newdontcarevar4,__newdontcarevar5,__newdontcarevar6,__newdontcarevar7,[]])),!),fllibexecute_delayed_calls([__Node,__newdontcarevar8,___JTC],[__Node])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(justification_,__Parent,__Child,__Root,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(424,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(justificationTreeRelation_internal)(__Child,__Parent,__Root,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(justification_,__Parent,__Child,__Root,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(426,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(justification_,___GrandFather,__Parent,__Root,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(justificationTreeRelation_internal)(__Child,__Parent,__Root,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))),fllibexecute_delayed_calls([__Child,__Parent,__Root,___GrandFather],[__Child,__Parent,__Root])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(baseJustificationMetrics,__Node,__BelowCount,__BelowRuleIds,__Root,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(428,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(justificationMetrics)(FLORA_THIS_WORKSPACE(d^tblflapply)(justification,__newdontcarevar3,__newdontcarevar4,__newdontcarevar5,'_$ctxt'(__newcontextvar6,__newcontextvar7,__newcontextvar8)),__Node,__BelowCount,__BelowRuleIds,__Root,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),fllibexecute_delayed_calls([__BelowCount,__BelowRuleIds,__Node,__Root,__newdontcarevar11],[__BelowCount,__BelowRuleIds,__Node,__Root])))).
:-(FLORA_THIS_WORKSPACE(justificationMetrics)(__JR,__Node,1,__MyRuleID,__Root,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(430,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__JR,[__F,__newdontcarevar3,__newdontcarevar4,__newdontcarevar5|__Rest]),','(fllibmetauniv(__JRG,[__F,__Node,__newdontcarevar6,__Root|__Rest]),','(\+(fllibmodlit(libmod_wrapper,__JRG,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))),','(!,','(FLORA_THIS_WORKSPACE(d^nontblflapply)(nodeToLiteral,__Node,___Type,___Term,__RuleOrFactOrSystem,__MatchingRule,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),';'(->(==(__RuleOrFactOrSystem,rule),=(__MyRuleID,[-(__MatchingRule,__Module)])),';'(->(fllibmetauniv(__RuleOrFactOrSystem,[fact,___Fact]),=(__MyRuleID,[-(__RuleOrFactOrSystem,__Module)])),=(__MyRuleID,[])))))))),fllibexecute_delayed_calls([__F,__JR,__JRG,__MatchingRule,__Module,__MyRuleID,__Node,__Rest,__Root,__RuleOrFactOrSystem,__newdontcarevar11,___Fact,___Term,___Type],[__JR,__MyRuleID,__Node,__Root])))).
:-(FLORA_THIS_WORKSPACE(justificationMetrics)(__JR,__Node,__BelowCount,__BelowRuleIds,__Root,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(432,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__JR,[__F,__newdontcarevar3,__newdontcarevar4,__newdontcarevar5|__Rest]),','(fllibmetauniv(__JRG,[__F,__Node,__Child,__Root|__Rest]),','(','(fllibbagof(__newdontcarevar10,[],[],','(','(fllibmodlit(libmod_wrapper,__JRG,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),','(FLORA_THIS_WORKSPACE(justificationMetrics)(__JR,__Child,__ChildCount,__ChildIds,__Root,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),=(__newdontcarevar10,/(__ChildCount,__ChildIds)))),fllibexecute_delayed_calls([__Child,__ChildCount,__ChildIds,__JR,__JRG,__newdontcarevar10,__Root],[])),__newvar11),=(__Metrics,__newvar11)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(nodeToLiteral,__Node,___Type,___Term,__RuleOrFactOrSystem,__MatchingRule,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar13)),','(';'(->(==(__RuleOrFactOrSystem,rule),=(__MyRuleID,[-(__MatchingRule,__Module)])),';'(->(fllibmetauniv(__RuleOrFactOrSystem,[fact,___Fact]),=(__MyRuleID,[-(__RuleOrFactOrSystem,__Module)])),=(__MyRuleID,[]))),FLORA_THIS_WORKSPACE(justificationMetrics2)([/(1,__MyRuleID)|__Metrics],__BelowCount,__BelowRuleIds,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar14,__newcontextvar15))))))),fllibexecute_delayed_calls([__BelowCount,__BelowRuleIds,__Child,__ChildCount,__ChildIds,__F,__JR,__JRG,__MatchingRule,__Metrics,__Module,__MyRuleID,__Node,__Rest,__Root,__RuleOrFactOrSystem,__newdontcarevar16,___Fact,___Term,___Type],[__BelowCount,__BelowRuleIds,__JR,__Node,__Root])))).
FLORA_THIS_WORKSPACE(justificationMetrics2)([],0,[],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)).
:-(FLORA_THIS_WORKSPACE(justificationMetrics2)([/(__ChildCount,__ChildIds)|__Metrics],__BelowCount,__BelowRuleIds,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(434,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(justificationMetrics2)(__Metrics,__BelowCount1,__BelowRuleIds1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(fllibdelayedliteral('\\is','fidjiUtils.ergo',1813,[__BelowCount,+(__ChildCount,__BelowCount1)]),:(listutil,merge(__BelowRuleIds1,__ChildIds,__BelowRuleIds)))),fllibexecute_delayed_calls([__BelowCount,__BelowCount1,__BelowRuleIds,__BelowRuleIds1,__ChildCount,__ChildIds,__Metrics],[__BelowCount,__BelowRuleIds,__ChildCount,__ChildIds,__Metrics])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(initializeExplanation,__ListGUIref,__Root,__CS,__JT,__Outcome,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(436,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(=(__RootNode,flapply(__JT,__Root,null,__CS,null,null,[])),','(fllibinsert(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(nontblflapply)(explanationWindow,__ListGUIref,__RootNode,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar3,__newcontextvar4)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),','(fllibinsert(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(nontblflapply)(explanationItem,__ListGUIref,1,__RootNode,why,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar5,__newcontextvar6)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),FLORA_THIS_WORKSPACE(d^nontblflapply)(nextExplanation,__ListGUIref,1,why,__Outcome,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))))),fllibexecute_delayed_calls([__CS,__JT,__ListGUIref,__Outcome,__Root,__RootNode],[__CS,__JT,__ListGUIref,__Outcome,__Root])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(refinedJustification,__Parent,__Child,__Root,__Window,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(438,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(refinedJustification_,__Parent,__Child,__Root,__Window,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(noPath)(__Child,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_THIS_WORKSPACE(noPath)(__Parent,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(refinedJustification_,__Parent,__Child,__Root,__Window,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(440,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(justificationTreeRelation_internal)(__Child,__Parent,__Root,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(notKnownCorrect)(__Child,__Window,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_THIS_WORKSPACE(notKnownCorrect)(__Parent,__Window,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(refinedJustification_,__Parent,__Child,__Root,__Window,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(442,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(refinedJustification_,___GrandFather,__Parent,__Root,__Window,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(justificationTreeRelation_internal)(__Child,__Parent,__Root,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_THIS_WORKSPACE(notKnownCorrect)(__Child,__Window,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)))),fllibexecute_delayed_calls([__Child,__Parent,__Root,__Window,___GrandFather],[__Child,__Parent,__Root,__Window])))).
:-(FLORA_THIS_WORKSPACE(notKnownCorrect)(null,___W,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(444,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(notKnownCorrect)(flapply(__Type,__G,__newdontcarevar1,__newdontcarevar2,__newdontcarevar3,__newdontcarevar4,__newdontcarevar5),__W,'_$ctxt'(_CallerModuleVar,__newcontextvar6,__newcontextvar7)),','('_$_$_ergo''rule_enabled'(446,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(\+(','(FLORA_THIS_WORKSPACE(d^nontblflapply)(explanationItem,__W,__newdontcarevar8,flapply(__Type,__GG,__newdontcarevar9,__newdontcarevar10,__newdontcarevar11,__newdontcarevar12,__newdontcarevar13),understood,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar14,__newcontextvar15)),FLORA_THIS_WORKSPACE(myvariant)(__G,__GG,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar16,__newcontextvar17)))),fllibexecute_delayed_calls([__G,__GG,__Type,__W,__newdontcarevar18],[__G,__Type,__W,__newdontcarevar19])))).
:-(FLORA_THIS_WORKSPACE(notCommentedYet)(null,___W,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(448,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(notCommentedYet)(flapply(__Type,__G,__newdontcarevar1,__newdontcarevar2,__newdontcarevar3,__newdontcarevar4,__newdontcarevar5),__W,'_$ctxt'(_CallerModuleVar,__newcontextvar6,__newcontextvar7)),','('_$_$_ergo''rule_enabled'(450,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(\+(','(FLORA_THIS_WORKSPACE(d^nontblflapply)(explanationItem,__W,__newdontcarevar8,flapply(__Type,__GG,__newdontcarevar9,__newdontcarevar10,__newdontcarevar11,__newdontcarevar12,__newdontcarevar13),__newdontcarevar14,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,__newcontextvar16)),FLORA_THIS_WORKSPACE(myvariant)(__G,__GG,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar17,__newcontextvar18)))),fllibexecute_delayed_calls([__G,__GG,__Type,__W,__newdontcarevar19],[__G,__Type,__W,__newdontcarevar20])))).
:-(FLORA_THIS_WORKSPACE(myvariant)(__G,__GG,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(452,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__G,__GL),','(fllibmetauniv(__GG,__GGL),:(subsumes,variant(__GL,__GGL)))),fllibexecute_delayed_calls([__G,__GG,__GGL,__GL],[__G,__GG])))).
:-(FLORA_THIS_WORKSPACE(mySubsumes)(__General,__Specific,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(454,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrcanon,get_canonical_form(__General,__GC)),','(:(flrcanon,get_canonical_form(__Specific,__SC)),:(subsumes,subsumes_chk(__GC,__SC)))),fllibexecute_delayed_calls([__GC,__General,__SC,__Specific],[__General,__Specific])))).
:-(FLORA_THIS_WORKSPACE(refinedJustificationMetrics)(__Node,__BelowCount,__BelowRuleIds,__Root,__Window,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(456,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(justificationMetrics)(FLORA_THIS_WORKSPACE(d^tblflapply)(refinedJustification,__newdontcarevar3,__newdontcarevar4,__newdontcarevar5,__Window,'_$ctxt'(__newcontextvar6,__newcontextvar7,__newcontextvar8)),__Node,__BelowCount,__BelowRuleIds,__Root,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),fllibexecute_delayed_calls([__BelowCount,__BelowRuleIds,__Node,__Root,__Window,__newdontcarevar11],[__BelowCount,__BelowRuleIds,__Node,__Root,__Window])))).
:-(FLORA_THIS_WORKSPACE(bestDSDcause)(__TopNode,__W,__Cause,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(458,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(refinedJustificationMetrics)(__TopNode,___NodeCount,__RulesAndFacts,__TopNode,__W,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(basics,length(__RulesAndFacts,__RuleAndFactCount)),';'(->(=(__RulesAndFacts,[__RorF]),';'(->(','(=(__RorF,-(__FFact,__Module)),fllibmetauniv(__FFact,[fact,__Fact])),=(__Cause,flapply(fact,-(__Fact,__Module)))),','(=(__RorF,-(___ID,___Module)),=(__Cause,flapply(rule,__RorF))))),';'(->(==(__RuleAndFactCount,0),'\\false'),','(fllibdelayedliteral('\\is','fidjiUtils.ergo',1887,[__Half,/(__RuleAndFactCount,2)]),','(','(fllibbagsortby(__newdontcarevar11,[],','(asc,asc),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(refinedJustification,___Parent,__Child,__TopNode,__W,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(refinedJustificationMetrics)(__Child,__newdontcarevar7,__ChildRules,__TopNode,__W,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),','(:(basics,length(__ChildRules,__CRuleCount)),','(fllibdelayedliteral('\\is','fidjiUtils.ergo',1894,[__Distance,abs(-(__CRuleCount,__Half))]),=(__newdontcarevar11,-(__Distance,__Child)))))),fllibexecute_delayed_calls([__CRuleCount,__Child,__ChildRules,__Distance,__Half,__newdontcarevar11,__TopNode,__W,__newdontcarevar10,___Parent],[])),__newvar12),=(__Candidates,__newvar12)),:(basics,member(-(__newdontcarevar13,__Cause),__Candidates)))))))),fllibexecute_delayed_calls([__CRuleCount,__Candidates,__Cause,__Child,__ChildRules,__Distance,__FFact,__Fact,__Half,__Module,__RorF,__RuleAndFactCount,__RulesAndFacts,__TopNode,__W,__newdontcarevar14,___ID,___Module,___NodeCount,___Parent],[__Cause,__TopNode,__W])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(nextExplanation,__W,__Order,why,__Outcome,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(460,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(updateExplanationItem)(__W,__Order,__TopNode,why,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(nextExplanationWhy)(__W,__TopNode,__Outcome,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))),fllibexecute_delayed_calls([__Order,__Outcome,__TopNode,__W],[__Order,__Outcome,__W])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(nextExplanation,__W,__Order,understood,__Outcome,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(462,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(updateExplanationItem)(__W,__Order,__newdontcarevar3,understood,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),','(','(fllibbagsortby(__newdontcarevar10,[],','(desc,desc),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(explanationItem,__W,__newdontcarevar10,__newdontcarevar6,why,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),fllibexecute_delayed_calls([__newdontcarevar10,__W,__newdontcarevar9],[])),__newvar11),=(__WhyItems,__newvar11)),FLORA_THIS_WORKSPACE(nextExplanationUnderstood)(__W,__WhyItems,__Outcome,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar13)))),fllibexecute_delayed_calls([__Order,__Outcome,__W,__WhyItems,__newdontcarevar14],[__Order,__Outcome,__W])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(nextExplanation,__W,__Order,dont_know,__Outcome,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(464,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(updateExplanationItem)(__W,__Order,__newdontcarevar3,dont_know,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),','(','(fllibbagsortby(__newdontcarevar10,[],','(desc,desc),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(explanationItem,__W,__newdontcarevar10,__newdontcarevar6,why,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),fllibexecute_delayed_calls([__newdontcarevar10,__W,__newdontcarevar9],[])),__newvar11),=(__WhyItems,__newvar11)),FLORA_THIS_WORKSPACE(nextExplanationDontKnow)(__W,__WhyItems,__Outcome,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar13)))),fllibexecute_delayed_calls([__Order,__Outcome,__W,__WhyItems,__newdontcarevar14],[__Order,__Outcome,__W])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(nextExplanation,__W,__Order,?,__Outcome,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(466,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^nontblflapply)(nextExplanation,__W,__Order,dont_know,__Outcome,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(nextExplanationWhy)(__W,__TopNode,__Outcome,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(468,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(bestDSDcause)(__TopNode,__W,__Cause,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(';'(=(__Cause,flapply(___Diagnosis,__newdontcarevar5)),FLORA_THIS_WORKSPACE(notCommentedYet)(__Cause,__W,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7))),','(!,FLORA_THIS_WORKSPACE(nextExplanation2)(__Cause,__W,__Outcome,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9))))),fllibexecute_delayed_calls([__Cause,__Outcome,__TopNode,__W,__newdontcarevar10,___Diagnosis],[__Outcome,__TopNode,__W])))).
:-(FLORA_THIS_WORKSPACE(nextExplanationWhy)(___W,___TopNode,__Outcome,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(470,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),=(__Outcome,failed))).
:-(FLORA_THIS_WORKSPACE(nextExplanationUnderstood)(__W,__WhyItems,__Outcome,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(472,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(:(basics,member(__K,__WhyItems)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(explanationItem,__W,__K,__TopNode,why,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(bestDSDcause)(__TopNode,__W,__Cause,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(';'(=(__Cause,flapply(___Diagnosis,__newdontcarevar7)),FLORA_THIS_WORKSPACE(notCommentedYet)(__Cause,__W,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9))),','(!,FLORA_THIS_WORKSPACE(nextExplanation2)(__Cause,__W,__Outcome,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11))))))),fllibexecute_delayed_calls([__Cause,__K,__Outcome,__TopNode,__W,__WhyItems,__newdontcarevar12,___Diagnosis],[__Outcome,__W,__WhyItems])))).
:-(FLORA_THIS_WORKSPACE(nextExplanationUnderstood)(___W,___WhyItems,__Outcome,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(474,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),=(__Outcome,failed))).
:-(FLORA_THIS_WORKSPACE(nextExplanationDontKnow)(__W,__WhyItems,__Outcome,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(476,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(:(basics,member(__K,__WhyItems)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(explanationItem,__W,__K,__TopNode,why,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(bestDSDcause)(__TopNode,__W,__Cause,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(';'(=(__Cause,flapply(___Diagnosis,__newdontcarevar7)),FLORA_THIS_WORKSPACE(notCommentedYet)(__Cause,__W,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9))),','(!,FLORA_THIS_WORKSPACE(nextExplanation2)(__Cause,__W,__Outcome,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11))))))),fllibexecute_delayed_calls([__Cause,__K,__Outcome,__TopNode,__W,__WhyItems,__newdontcarevar12,___Diagnosis],[__Outcome,__W,__WhyItems])))).
:-(FLORA_THIS_WORKSPACE(nextExplanationDontKnow)(___W,___WhyItems,__Outcome,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(478,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),=(__Outcome,failed))).
:-(FLORA_THIS_WORKSPACE(nextExplanation2)(__Cause,__W,__Outcome,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(480,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(';'(->(=(__Cause,flapply(___Diagnosis,__newdontcarevar3)),=(__Outcome,__Cause)),','(','(fllibmax(__newdontcarevar9,[],[],','(FLORA_THIS_WORKSPACE(d^nontblflapply)(explanationItem,__W,__newdontcarevar9,__newdontcarevar4,__newdontcarevar5,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),fllibexecute_delayed_calls([__newdontcarevar9,__W,__newdontcarevar8],[])),__newvar10),fllibdelayedliteral('\\is','fidjiUtils.ergo',1947,[__NewOrder,+(1,__newvar10)])),','(fllibinsert(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(nontblflapply)(explanationItem,__W,__NewOrder,__Cause,?,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar11,__newcontextvar12)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),=(__Outcome,__Cause)))),fllibexecute_delayed_calls([__Cause,__NewOrder,__Outcome,__W,__newdontcarevar13,___Diagnosis],[__Cause,__Outcome,__W])))).
:-(FLORA_THIS_WORKSPACE(updateExplanationItem)(__W,__Order,__Node,__NewAnswer,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(482,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibdelete(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(nontblflapply)(explanationItem,__W,__Order,__Node,___OldAnswer,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),','(fllibinsert(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(nontblflapply)(explanationItem,__W,__Order,__Node,__NewAnswer,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar5,__newcontextvar6)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),fllibrefresh(FLORA_THIS_MODULE_NAME,['_$_$_ergo''dynprologfact'(FLORA_THIS_WORKSPACE(justificationMetrics)(FLORA_THIS_WORKSPACE(d^tblflapply)(refinedJustification,__newdontcarevar7,__newdontcarevar8,__newdontcarevar9,__W,'_$ctxt'(__newcontextvar10,__newcontextvar11,__newcontextvar12)),__newdontcarevar13,__newdontcarevar14,__newdontcarevar15,__newdontcarevar16,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar17,__newcontextvar18))),FLORA_THIS_WORKSPACE(tblflapply)(refinedJustification,__newdontcarevar19,__newdontcarevar20,__newdontcarevar21,__W,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar22,__newcontextvar23)),FLORA_THIS_WORKSPACE(tblflapply)(refinedJustification_,__newdontcarevar24,__newdontcarevar25,__newdontcarevar26,__W,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar27,__newcontextvar28))]))),fllibexecute_delayed_calls([__NewAnswer,__Node,__Order,__W,__newdontcarevar29,___OldAnswer],[__NewAnswer,__Node,__Order,__W])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(showDefinitionFor,__Goal,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(484,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(:(flrdatatype,flora_is_var_prim(__Goal)),','(!,'\\false')))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(showDefinitionFor,','(__A,__newdontcarevar1),'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(486,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(!,FLORA_THIS_WORKSPACE(d^nontblflapply)(showDefinitionFor,__A,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5))))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(showDefinitionFor,__Head,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(488,'fidjiUtils.ergo',FLORA_THIS_MODULE_NAME),','(fllibifthenelse(FLORA_THIS_MODULE_NAME,fllibclause(__ID,__newvar3,','('_$_$_ergo''prop_descriptor'(__ID,__newvar4,__newvar5,type,__newvar7,__newvar3),'_$_$_ergo''tag_descriptor'(__ID,__newvar4,__newvar5,__newvar6,__newvar3)),null,[__Head],__newdontcarevar8),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(mayGetModule,__Head,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),','(','(flora_plg2hlg(__newvar11,__ID,flapply,0),','(flora_plg2hlg(__newvar12,__M,flapply,0),flora_plg2hlg(__newvar13,true,flapply,0))),','(showSourceRule(__newvar11,__newvar12,__newvar13),','(flora_plg2hlg(__newvar11,__ID,flapply,1),','(flora_plg2hlg(__newvar12,__M,flapply,1),flora_plg2hlg(__newvar13,true,flapply,1)))))),fllibifthenelse(FLORA_THIS_MODULE_NAME,:(flrstorageutils,'\\isbasefact'(__Head)),','(:(flrdecode,flora_decode_goal_as_mainless_atom(__Head,__HeadAtm)),','(:(string,concat_atom([__HeadAtm,' is one of the facts -- does not have a rule'],__Msg)),FLORA_WORKSPACE(\\e2j,d^meth)('Dialog',flapply(show,'Warning',__Msg),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar14,__newcontextvar15)))),','(:(flrdecode,flora_decode_goal_as_mainless_atom(__Head,__HeadAtm)),','(:(string,concat_atom(['Could not find a matching clause for ',__HeadAtm],__Msg)),','(FLORA_WORKSPACE(\\e2j,d^meth)('Dialog',flapply(show,'Warning',__Msg),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar16,__newcontextvar17)),'\\false'))),1976,'fidjiUtils.ergo'),1974,'fidjiUtils.ergo'),fllibexecute_delayed_calls([__Head,__HeadAtm,__ID,__M,__Msg,__newdontcarevar18],[__Head])))).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rule signatures %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%% Signatures for latent queries %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%% Queries found in the source file %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(fllibmodobj(body,'d^tblflapply',['\\trivialJustification',__newdontcarevar1,__newdontcarevar2,'_$ctxt'(__newcontextvar3,__newcontextvar4,__newcontextvar5)],__newdontcarevar6,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8),__newvar9),FLORA_WORKSPACE(\\system,d^meth)('Method',flapply(mustDefine,off,__newvar9),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11)))),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(fllibmodobj(body,'d^tblflapply',['\\opaqueJustification',__newdontcarevar1,__newdontcarevar2,'_$ctxt'(__newcontextvar3,__newcontextvar4,__newcontextvar5)],__newdontcarevar6,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8),__newvar9),FLORA_WORKSPACE(\\system,d^meth)('Method',flapply(mustDefine,off,__newvar9),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11)))),[])).

 
#if !defined(FLORA_FLS2_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLS2_FILENAME  'fidjiUtils.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('fidjiUtils.ergo',FLORA_THIS_MODULE_NAME))).

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

:-(FLORA_THIS_WORKSPACE(aBodyMsubgoal)(_h3885439,_h3885441,_h3885443,_h3885445,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(aBodyMsubgoal))(_h3885439,_h3885441,_h3885443,_h3885445,FWContext)).
:-(FLORA_THIS_WORKSPACE(aBodyWsubgoal)(_h3886106,_h3886108,_h3886110,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(aBodyWsubgoal))(_h3886106,_h3886108,_h3886110,FWContext)).
:-(FLORA_THIS_WORKSPACE(bestDSDcause)(_h3886769,_h3886771,_h3886773,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(bestDSDcause))(_h3886769,_h3886771,_h3886773,FWContext)).
:-(FLORA_THIS_WORKSPACE(bodyUsesUserProgram)(_h3887416,_h3887418,_h3887420,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(bodyUsesUserProgram))(_h3887416,_h3887418,_h3887420,FWContext)).
:-(FLORA_THIS_WORKSPACE(checkNonAtoms)(_h3888175,_h3888177,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(checkNonAtoms))(_h3888175,_h3888177,FWContext)).
:-(FLORA_THIS_WORKSPACE(childOfDefeated)(_h3888834,_h3888836,_h3888838,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(childOfDefeated))(_h3888834,_h3888836,_h3888838,FWContext)).
:-(FLORA_THIS_WORKSPACE(consistencyAndUndefinednessCheck)(_h3889529,_h3889531,_h3889533,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(consistencyAndUndefinednessCheck))(_h3889529,_h3889531,_h3889533,FWContext)).
:-(FLORA_THIS_WORKSPACE(decodeVars)(_h3890496,_h3890498,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(decodeVars))(_h3890496,_h3890498,FWContext)).
:-(FLORA_THIS_WORKSPACE(defaultT)(_h3891107,_h3891109,_h3891111,_h3891113,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(defaultT))(_h3891107,_h3891109,_h3891111,_h3891113,FWContext)).
:-(FLORA_THIS_WORKSPACE(executeBody)(_h3891694,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(executeBody))(_h3891694,FWContext)).
:-(FLORA_THIS_WORKSPACE(findAtom)(_h3892317,_h3892319,_h3892321,_h3892323,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(findAtom))(_h3892317,_h3892319,_h3892321,_h3892323,FWContext)).
:-(FLORA_THIS_WORKSPACE(findSubTerm2)(_h3892904,_h3892906,_h3892908,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(findSubTerm2))(_h3892904,_h3892906,_h3892908,FWContext)).
:-(FLORA_THIS_WORKSPACE(fjdefeatedr)(_h3893551,_h3893553,_h3893555,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(fjdefeatedr))(_h3893551,_h3893553,_h3893555,FWContext)).
:-(FLORA_THIS_WORKSPACE(fjw)(_h3894182,_h3894184,_h3894186,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(fjw))(_h3894182,_h3894184,_h3894186,FWContext)).
:-(FLORA_THIS_WORKSPACE(fmj)(_h3894685,_h3894687,_h3894689,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(fmj))(_h3894685,_h3894687,_h3894689,FWContext)).
:-(FLORA_THIS_WORKSPACE(fmj2)(_h3895188,_h3895190,_h3895192,_h3895194,_h3895196,_h3895198,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(fmj2))(_h3895188,_h3895190,_h3895192,_h3895194,_h3895196,_h3895198,FWContext)).
:-(FLORA_THIS_WORKSPACE(hack_check_bgaxioms)(_h3895719,_h3895721,_h3895723,_h3895725,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(hack_check_bgaxioms))(_h3895719,_h3895721,_h3895723,_h3895725,FWContext)).
:-(FLORA_THIS_WORKSPACE(isAggregate)(_h3896482,_h3896484,_h3896486,_h3896488,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(isAggregate))(_h3896482,_h3896484,_h3896486,_h3896488,FWContext)).
:-(FLORA_THIS_WORKSPACE(isAggregate)(_h3897117,_h3897119,_h3897121,_h3897123,_h3897125,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(isAggregate))(_h3897117,_h3897119,_h3897121,_h3897123,_h3897125,FWContext)).
:-(FLORA_THIS_WORKSPACE(isDeleteLiteral)(_h3897756,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(isDeleteLiteral))(_h3897756,FWContext)).
:-(FLORA_THIS_WORKSPACE(isDeleteLiteral_aux)(_h3898443,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(isDeleteLiteral_aux))(_h3898443,FWContext)).
:-(FLORA_THIS_WORKSPACE(isSimpleSubgoal)(_h3899194,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(isSimpleSubgoal))(_h3899194,FWContext)).
:-(FLORA_THIS_WORKSPACE(isTransDeleteLiteral)(_h3899881,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(isTransDeleteLiteral))(_h3899881,FWContext)).
:-(FLORA_THIS_WORKSPACE(isTransDeleteLiteral_aux)(_h3900648,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(isTransDeleteLiteral_aux))(_h3900648,FWContext)).
:-(FLORA_THIS_WORKSPACE(isa_goal_reason)(_h3901479,_h3901481,_h3901483,_h3901485,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(isa_goal_reason))(_h3901479,_h3901481,_h3901483,_h3901485,FWContext)).
:-(FLORA_THIS_WORKSPACE(jtr2m)(_h3902178,_h3902180,_h3902182,_h3902184,_h3902186,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(jtr2m))(_h3902178,_h3902180,_h3902182,_h3902184,_h3902186,FWContext)).
:-(FLORA_THIS_WORKSPACE(jtr2w)(_h3902721,_h3902723,_h3902725,_h3902727,_h3902729,_h3902731,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(jtr2w))(_h3902721,_h3902723,_h3902725,_h3902727,_h3902729,_h3902731,FWContext)).
:-(FLORA_THIS_WORKSPACE(justifiableGoal)(_h3903268,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(justifiableGoal))(_h3903268,FWContext)).
:-(FLORA_THIS_WORKSPACE(justificationMetrics)(_h3903955,_h3903957,_h3903959,_h3903961,_h3903963,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(justificationMetrics))(_h3903955,_h3903957,_h3903959,_h3903961,_h3903963,FWContext)).
:-(FLORA_THIS_WORKSPACE(justificationMetrics2)(_h3904738,_h3904740,_h3904742,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(justificationMetrics2))(_h3904738,_h3904740,_h3904742,FWContext)).
:-(FLORA_THIS_WORKSPACE(justificationTreeFunction)(_h3905529,_h3905531,_h3905533,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(justificationTreeFunction))(_h3905529,_h3905531,_h3905533,FWContext)).
:-(FLORA_THIS_WORKSPACE(justificationTreeRelation)(_h3906384,_h3906386,_h3906388,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(justificationTreeRelation))(_h3906384,_h3906386,_h3906388,FWContext)).
:-(FLORA_THIS_WORKSPACE(justificationTreeRelation_internal)(_h3907239,_h3907241,_h3907243,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(justificationTreeRelation_internal))(_h3907239,_h3907241,_h3907243,FWContext)).
:-(FLORA_THIS_WORKSPACE(literalCalls)(_h3908238,_h3908240,_h3908242,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(literalCalls))(_h3908238,_h3908240,_h3908242,FWContext)).
:-(FLORA_THIS_WORKSPACE(literalCalls)(_h3908885,_h3908887,_h3908889,_h3908891,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(literalCalls))(_h3908885,_h3908887,_h3908889,_h3908891,FWContext)).
:-(FLORA_THIS_WORKSPACE(literalCalls)(_h3909536,_h3909538,_h3909540,_h3909542,_h3909544,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(literalCalls))(_h3909536,_h3909538,_h3909540,_h3909542,_h3909544,FWContext)).
:-(FLORA_THIS_WORKSPACE(mayBindFirstMatchingID)(_h3910191,_h3910193,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(mayBindFirstMatchingID))(_h3910191,_h3910193,FWContext)).
:-(FLORA_THIS_WORKSPACE(mayBindMatchingID)(_h3910994,_h3910996,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(mayBindMatchingID))(_h3910994,_h3910996,FWContext)).
:-(FLORA_THIS_WORKSPACE(mayGetLocalModuleVar)(_h3911717,_h3911719,_h3911721,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(mayGetLocalModuleVar))(_h3911717,_h3911719,_h3911721,FWContext)).
:-(FLORA_THIS_WORKSPACE(mySubsumes)(_h3912492,_h3912494,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(mySubsumes))(_h3912492,_h3912494,FWContext)).
:-(FLORA_THIS_WORKSPACE(my_cancel)(_h3913103,_h3913105,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(my_cancel))(_h3913103,_h3913105,FWContext)).
:-(FLORA_THIS_WORKSPACE(my_cancel)(_h3913698,_h3913700,_h3913702,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(my_cancel))(_h3913698,_h3913700,_h3913702,FWContext)).
:-(FLORA_THIS_WORKSPACE(my_dr_atom)(_h3914297,_h3914299,_h3914301,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(my_dr_atom))(_h3914297,_h3914299,_h3914301,FWContext)).
:-(FLORA_THIS_WORKSPACE(my_isbasefact)(_h3914912,_h3914914,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(my_isbasefact))(_h3914912,_h3914914,FWContext)).
:-(FLORA_THIS_WORKSPACE(my_once)(_h3915571,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(my_once))(_h3915571,FWContext)).
:-(FLORA_THIS_WORKSPACE(my_opposes)(_h3916130,_h3916132,_h3916134,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(my_opposes))(_h3916130,_h3916132,_h3916134,FWContext)).
:-(FLORA_THIS_WORKSPACE(my_opposes)(_h3916745,_h3916747,_h3916749,_h3916751,_h3916753,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(my_opposes))(_h3916745,_h3916747,_h3916749,_h3916751,_h3916753,FWContext)).
:-(FLORA_THIS_WORKSPACE(my_overrides)(_h3917368,_h3917370,_h3917372,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(my_overrides))(_h3917368,_h3917370,_h3917372,FWContext)).
:-(FLORA_THIS_WORKSPACE(my_overrides)(_h3918015,_h3918017,_h3918019,_h3918021,_h3918023,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(my_overrides))(_h3918015,_h3918017,_h3918019,_h3918021,_h3918023,FWContext)).
:-(FLORA_THIS_WORKSPACE(myvariant)(_h3918670,_h3918672,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(myvariant))(_h3918670,_h3918672,FWContext)).
:-(FLORA_THIS_WORKSPACE(negateLiteral)(_h3919265,_h3919267,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(negateLiteral))(_h3919265,_h3919267,FWContext)).
:-(FLORA_THIS_WORKSPACE(nextExplanation2)(_h3919924,_h3919926,_h3919928,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(nextExplanation2))(_h3919924,_h3919926,_h3919928,FWContext)).
:-(FLORA_THIS_WORKSPACE(nextExplanationDontKnow)(_h3920635,_h3920637,_h3920639,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(nextExplanationDontKnow))(_h3920635,_h3920637,_h3920639,FWContext)).
:-(FLORA_THIS_WORKSPACE(nextExplanationUnderstood)(_h3921458,_h3921460,_h3921462,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(nextExplanationUnderstood))(_h3921458,_h3921460,_h3921462,FWContext)).
:-(FLORA_THIS_WORKSPACE(nextExplanationWhy)(_h3922313,_h3922315,_h3922317,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(nextExplanationWhy))(_h3922313,_h3922315,_h3922317,FWContext)).
:-(FLORA_THIS_WORKSPACE(noPath)(_h3923056,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(noPath))(_h3923056,FWContext)).
:-(FLORA_THIS_WORKSPACE(notCommentedYet)(_h3923599,_h3923601,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(notCommentedYet))(_h3923599,_h3923601,FWContext)).
:-(FLORA_THIS_WORKSPACE(notKnownCorrect)(_h3924290,_h3924292,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(notKnownCorrect))(_h3924290,_h3924292,FWContext)).
:-(FLORA_THIS_WORKSPACE(pp2)(_h3924981,_h3924983,_h3924985,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(pp2))(_h3924981,_h3924983,_h3924985,FWContext)).
:-(FLORA_THIS_WORKSPACE(pp3)(_h3925484,_h3925486,_h3925488,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(pp3))(_h3925484,_h3925486,_h3925488,FWContext)).
:-(FLORA_THIS_WORKSPACE(refinedJustificationMetrics)(_h3925987,_h3925989,_h3925991,_h3925993,_h3925995,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(refinedJustificationMetrics))(_h3925987,_h3925989,_h3925991,_h3925993,_h3925995,FWContext)).
:-(FLORA_THIS_WORKSPACE(subgoalIn)(_h3926882,_h3926884,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(subgoalIn))(_h3926882,_h3926884,FWContext)).
:-(FLORA_THIS_WORKSPACE(subgoalIn)(_h3927477,_h3927479,_h3927481,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(subgoalIn))(_h3927477,_h3927479,_h3927481,FWContext)).
:-(FLORA_THIS_WORKSPACE(subgoalOf)(_h3928076,_h3928078,_h3928080,_h3928082,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(subgoalOf))(_h3928076,_h3928078,_h3928080,_h3928082,FWContext)).
:-(FLORA_THIS_WORKSPACE(sys_trivial_justification)(_h3928679,_h3928681,_h3928683,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(sys_trivial_justification))(_h3928679,_h3928681,_h3928683,FWContext)).
:-(FLORA_THIS_WORKSPACE(tb)(_h3929534,_h3929536,_h3929538,_h3929540,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(tb))(_h3929534,_h3929536,_h3929538,_h3929540,FWContext)).
:-(FLORA_THIS_WORKSPACE(tp)(_h3930025,_h3930027,_h3930029,_h3930031,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(tp))(_h3930025,_h3930027,_h3930029,_h3930031,FWContext)).
:-(FLORA_THIS_WORKSPACE(updateExplanationItem)(_h3930516,_h3930518,_h3930520,_h3930522,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(updateExplanationItem))(_h3930516,_h3930518,_h3930520,_h3930522,FWContext)).
:-(FLORA_THIS_WORKSPACE(wNodeAnswerToMatchingSource2)(_h3931311,_h3931313,_h3931315,_h3931317,_h3931319,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(wNodeAnswerToMatchingSource2))(_h3931311,_h3931313,_h3931315,_h3931317,_h3931319,FWContext)).
