
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

#define FLORA_COMPILATION_ID 9

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
#define FLORA_THIS_FILENAME  'atco.ergo'
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
:-(FLORA_THIS_WORKSPACE(\\undefeated)(_h830955,_h830957,_h830959,_h830961,_h830963,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(\\undefeated))(_h830955,_h830957,_h830959,_h830961,_h830963,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(atco_overrides)),8),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(atco_overrides)),8)),opaque))).
:-(FLORA_THIS_WORKSPACE(atco_overrides)(_h831613,_h831615,_h831617,_h831619,_h831621,_h831623,_h831625,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(atco_overrides))(_h831613,_h831615,_h831617,_h831619,_h831621,_h831623,_h831625,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(attemptedsupportedattackingargument)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(attemptedsupportedattackingargument)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(attemptedsupportedattackingargument)(_h832313,_h832315,_h832317,_h832319,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(attemptedsupportedattackingargument))(_h832313,_h832315,_h832317,_h832319,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beaten_by_strict_rule)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beaten_by_strict_rule)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(_h833337,_h833339,_h833341,_h833343,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beaten_by_strict_rule))(_h833337,_h833339,_h833341,_h833343,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beaten_by_strict_rule)),8),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beaten_by_strict_rule)),8)),opaque))).
:-(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(_h834137,_h834139,_h834141,_h834143,_h834145,_h834147,_h834149,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beaten_by_strict_rule))(_h834137,_h834139,_h834141,_h834143,_h834145,_h834147,_h834149,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beats_lit_lit)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beats_lit_lit)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(beats_lit_lit)(_h834949,_h834951,_h834953,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beats_lit_lit))(_h834949,_h834951,_h834953,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beats_lit_rule)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beats_lit_rule)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(beats_lit_rule)(_h835617,_h835619,_h835621,_h835623,_h835625,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beats_lit_rule))(_h835617,_h835619,_h835621,_h835623,_h835625,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(candidate)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(candidate)),5)),FLORA_FLEX_DYNAMIC_TYPE_CLAUSE))).
:-(FLORA_THIS_WORKSPACE(candidate)(_h836309,_h836311,_h836313,_h836315,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(candidate))(_h836309,_h836311,_h836313,_h836315,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(change_module)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(change_module)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(change_module)(_h836917,_h836919,_h836921,_h836923,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(change_module))(_h836917,_h836919,_h836921,_h836923,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(change_module_nocheck)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(change_module_nocheck)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(change_module_nocheck)(_h837589,_h837591,_h837593,_h837595,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(change_module_nocheck))(_h837589,_h837591,_h837593,_h837595,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(check_module_to_AT_association)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(check_module_to_AT_association)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(check_module_to_AT_association)(_h838389,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(check_module_to_AT_association))(_h838389,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(defeated_lit)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(defeated_lit)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(defeated_lit)(_h839321,_h839323,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(defeated_lit))(_h839321,_h839323,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(defeated_rule)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(defeated_rule)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(defeated_rule)(_h839969,_h839971,_h839973,_h839975,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(defeated_rule))(_h839969,_h839971,_h839973,_h839975,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(dispatch_irrefutable_bodylits)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(dispatch_irrefutable_bodylits)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(dispatch_irrefutable_bodylits)(_h840641,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(dispatch_irrefutable_bodylits))(_h840641,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(dispatch_one_refutable_bodylit)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(dispatch_one_refutable_bodylit)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(dispatch_one_refutable_bodylit)(_h841557,_h841559,_h841561,_h841563,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(dispatch_one_refutable_bodylit))(_h841557,_h841559,_h841561,_h841563,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(dispatch_refutable_bodylits)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(dispatch_refutable_bodylits)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(dispatch_refutable_bodylits)(_h842501,_h842503,_h842505,_h842507,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(dispatch_refutable_bodylits))(_h842501,_h842503,_h842505,_h842507,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(disqualified_lit)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(disqualified_lit)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(disqualified_lit)(_h843397,_h843399,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(disqualified_lit))(_h843397,_h843399,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(disqualified_rule)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(disqualified_rule)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(disqualified_rule)(_h844109,_h844111,_h844113,_h844115,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(disqualified_rule))(_h844109,_h844111,_h844113,_h844115,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(dominates_lit_lit)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(dominates_lit_lit)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(dominates_lit_lit)(_h844845,_h844847,_h844849,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(dominates_lit_lit))(_h844845,_h844847,_h844849,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(dominates_lit_rule)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(dominates_lit_rule)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(dominates_lit_rule)(_h845577,_h845579,_h845581,_h845583,_h845585,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(dominates_lit_rule))(_h845577,_h845579,_h845581,_h845583,_h845585,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(dominates_rule_lit)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(dominates_rule_lit)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(dominates_rule_lit)(_h846333,_h846335,_h846337,_h846339,_h846341,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(dominates_rule_lit))(_h846333,_h846335,_h846337,_h846339,_h846341,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(exists_cand_not_overridden)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(exists_cand_not_overridden)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(exists_cand_not_overridden)(_h847089,_h847091,_h847093,_h847095,_h847097,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(exists_cand_not_overridden))(_h847089,_h847091,_h847093,_h847095,_h847097,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(hassupportedattackingargument)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(hassupportedattackingargument)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(hassupportedattackingargument)(_h847973,_h847975,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(hassupportedattackingargument))(_h847973,_h847975,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(headlit)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(headlit)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(headlit)(_h848893,_h848895,_h848897,_h848899,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(headlit))(_h848893,_h848895,_h848897,_h848899,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(naf_literal)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(naf_literal)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(naf_literal)(_h849469,_h849471,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(naf_literal))(_h849469,_h849471,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(no_refutable_bodylits)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(no_refutable_bodylits)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(no_refutable_bodylits)(_h850101,_h850103,_h850105,_h850107,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(no_refutable_bodylits))(_h850101,_h850103,_h850105,_h850107,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(not_beats_supported_argument)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(not_beats_supported_argument)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(not_beats_supported_argument)(_h850901,_h850903,_h850905,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(not_beats_supported_argument))(_h850901,_h850903,_h850905,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(not_disqualified_rule)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(not_disqualified_rule)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(not_disqualified_rule)(_h851809,_h851811,_h851813,_h851815,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(not_disqualified_rule))(_h851809,_h851811,_h851813,_h851815,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(opposing_rules)),8),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(opposing_rules)),8)),opaque))).
:-(FLORA_THIS_WORKSPACE(opposing_rules)(_h852609,_h852611,_h852613,_h852615,_h852617,_h852619,_h852621,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(opposing_rules))(_h852609,_h852611,_h852613,_h852615,_h852617,_h852619,_h852621,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(overriden_cancellation_rule)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(overriden_cancellation_rule)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(overriden_cancellation_rule)(_h853309,_h853311,_h853313,_h853315,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(overriden_cancellation_rule))(_h853309,_h853311,_h853313,_h853315,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(refuted)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(refuted)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(refuted)(_h854205,_h854207,_h854209,_h854211,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(refuted))(_h854205,_h854207,_h854209,_h854211,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(refuted)),7),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(refuted)),7)),opaque))).
:-(FLORA_THIS_WORKSPACE(refuted)(_h854781,_h854783,_h854785,_h854787,_h854789,_h854791,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(refuted))(_h854781,_h854783,_h854785,_h854787,_h854789,_h854791,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(strict_candidate)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(strict_candidate)),5)),FLORA_FLEX_DYNAMIC_TYPE_CLAUSE))).
:-(FLORA_THIS_WORKSPACE(strict_candidate)(_h855365,_h855367,_h855369,_h855371,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(strict_candidate))(_h855365,_h855367,_h855369,_h855371,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(strongcandicate)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(strongcandicate)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(strongcandicate)(_h856085,_h856087,_h856089,_h856091,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(strongcandicate))(_h856085,_h856087,_h856089,_h856091,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(stronglit)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(stronglit)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(stronglit)(_h856789,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(stronglit))(_h856789,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(stronglydefeated_lit)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(stronglydefeated_lit)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(stronglydefeated_lit)(_h857385,_h857387,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(stronglydefeated_lit))(_h857385,_h857387,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(supportedattackingargument)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(supportedattackingargument)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(supportedattackingargument)(_h858161,_h858163,_h858165,_h858167,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(supportedattackingargument))(_h858161,_h858163,_h858165,_h858167,FWContext)).
 
#if !defined(FLORA_FLM_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLM_FILENAME  'atco.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(atco,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'atco.fld'
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
#define FLORA_FLS_FILENAME  'atco.fls'
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


:-(dynamic(','(/('_$_$_ergo''refutablebodylit',5), /('_$_$_ergo''bodyinfo',5)))).


:-(','(index(/('_$_$_ergo''refutablebodylit',5),[1,3]), index(/('_$_$_ergo''bodyinfo',5),[1,3]))).

?-(:(flrprolog,flora_define_modular_prolog([prolog('\\undefeated',5,FLORA_THIS_MODULE_NAME)]))).
:-(table(as(/(FLORA_THIS_WORKSPACE(strict_candidate),5),AUXILIARY_TABLING_TYPE))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(strict_candidate,4,FLORA_THIS_MODULE_NAME)]))).
:-(table(as(/(FLORA_THIS_WORKSPACE(candidate),5),AUXILIARY_TABLING_TYPE))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(candidate,4,FLORA_THIS_MODULE_NAME)]))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(refuted,4,FLORA_THIS_MODULE_NAME),prolog(refuted,6,FLORA_THIS_MODULE_NAME)]))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(strongcandicate,4,FLORA_THIS_MODULE_NAME)]))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(naf_literal,2,FLORA_THIS_MODULE_NAME),prolog(stronglit,1,FLORA_THIS_MODULE_NAME),prolog(headlit,4,FLORA_THIS_MODULE_NAME)]))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(defeated_rule,4,FLORA_THIS_MODULE_NAME),prolog(defeated_lit,2,FLORA_THIS_MODULE_NAME),prolog(stronglydefeated_lit,2,FLORA_THIS_MODULE_NAME),prolog(overriden_cancellation_rule,4,FLORA_THIS_MODULE_NAME),prolog(beaten_by_strict_rule,4,FLORA_THIS_MODULE_NAME),prolog(beaten_by_strict_rule,7,FLORA_THIS_MODULE_NAME),prolog(disqualified_rule,4,FLORA_THIS_MODULE_NAME),prolog(disqualified_lit,2,FLORA_THIS_MODULE_NAME),prolog(not_disqualified_rule,4,FLORA_THIS_MODULE_NAME),prolog(opposing_rules,7,FLORA_THIS_MODULE_NAME)]))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(dispatch_refutable_bodylits,4,FLORA_THIS_MODULE_NAME),prolog(dispatch_irrefutable_bodylits,1,FLORA_THIS_MODULE_NAME),prolog(dispatch_one_refutable_bodylit,4,FLORA_THIS_MODULE_NAME)]))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(supportedattackingargument,4,FLORA_THIS_MODULE_NAME),prolog(hassupportedattackingargument,2,FLORA_THIS_MODULE_NAME),prolog(attemptedsupportedattackingargument,4,FLORA_THIS_MODULE_NAME)]))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(dominates_lit_lit,3,FLORA_THIS_MODULE_NAME),prolog(dominates_lit_rule,5,FLORA_THIS_MODULE_NAME),prolog(dominates_rule_lit,5,FLORA_THIS_MODULE_NAME),prolog(atco_overrides,7,FLORA_THIS_MODULE_NAME),prolog(beats_lit_rule,5,FLORA_THIS_MODULE_NAME),prolog(beats_lit_lit,3,FLORA_THIS_MODULE_NAME)]))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(exists_cand_not_overridden,5,FLORA_THIS_MODULE_NAME),prolog(no_refutable_bodylits,4,FLORA_THIS_MODULE_NAME),prolog(not_beats_supported_argument,3,FLORA_THIS_MODULE_NAME)]))).

:-(dynamic(/(vars_storage,1))).

:-(FLORA_THIS_WORKSPACE(\\undefeated)(__r,__fn,__vars,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(undef2,'atco.flr',FLORA_THIS_MODULE_NAME),','(','(retractall(vars_storage(__newdontcarevar3)),','(assert(vars_storage(__vars)),','(FLORA_THIS_WORKSPACE(headlit)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),','(flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(defeated_rule)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),fllibexecute_delayed_calls([__fn,__h,__mod,__r],[]))),[],108,'atco.flr')),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(defeated_lit)(__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),fllibexecute_delayed_calls([__h,__mod],[]))),[],109,'atco.flr')))))),fllibexecute_delayed_calls([__newdontcarevar10,__fn,__h,__mod,__r,__vars],[__fn,__h,__mod,__r,__vars])))).
:-(FLORA_THIS_WORKSPACE(defeated_rule)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(def1,'atco.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(refuted)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(defeated_rule)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(def2,'atco.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(disqualified_rule)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(defeated_lit)(__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(def3,'atco.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(refuted)(___r,___fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),fllibexecute_delayed_calls([___fn,___r,__h,__mod],[__h,__mod])))).
:-(FLORA_THIS_WORKSPACE(defeated_lit)(__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(def4,'atco.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(disqualified_lit)(__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(refuted)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(ref1,'atco.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(candidate)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(opposing_rules)(__r,__fn,__h,__r2,__fn2,__h2,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(supportedattackingargument)(__r2,__fn2,__h2,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(beats_lit_rule)(__h,__r2,__fn2,__h2,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),fllibexecute_delayed_calls([__fn2,__h,__h2,__mod,__r2],[]))),[],130,'atco.flr'))))),fllibexecute_delayed_calls([__fn,__fn2,__h,__h2,__mod,__r,__r2],[__fn,__h,__mod,__r])))).
:-(FLORA_THIS_WORKSPACE(refuted)(__r,__fn,__h,__refuter,__refuter_fn,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(ref2,'atco.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(candidate)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(opposing_rules)(__r,__fn,__h,__refuter,__refuter_fn,__h2,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(supportedattackingargument)(__refuter,__refuter_fn,__h2,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(beats_lit_rule)(__h,__refuter,__refuter_fn,__h2,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),fllibexecute_delayed_calls([__h,__h2,__mod,__refuter,__refuter_fn],[]))),[],138,'atco.flr'))))),fllibexecute_delayed_calls([__fn,__h,__h2,__mod,__r,__refuter,__refuter_fn],[__fn,__h,__mod,__r,__refuter,__refuter_fn])))).
:-(FLORA_THIS_WORKSPACE(disqualified_rule)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(disq1,'atco.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(disqualified_rule)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(disq2,'atco.flr',FLORA_THIS_MODULE_NAME),','(','(';'(->(','(:(flrdatatype,flora_is_nonvar_prim(__h)),:(flrwrapper,flora_decode_module_name(__h,__realmod))),'\\true'),=(__realmod,__mod)),','(';'(->(vars_storage(__vars),'\\true'),'\\true'),','(:(flrdescriptor_support,get_tag_descriptor_info_with_rulehead(__r,__fn,__realmod,__t,__h,__vars)),'_$_$_ergo''_cancel_aux'(__realmod,__t,__h)))),fllibexecute_delayed_calls([__fn,__h,__mod,__r,__realmod,__t,__vars],[__fn,__h,__mod,__r])))).
:-(FLORA_THIS_WORKSPACE(disqualified_rule)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(disq3,'atco.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(overriden_cancellation_rule)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(overriden_cancellation_rule)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(cancl1,'atco.flr',FLORA_THIS_MODULE_NAME),','(','(';'(->(','(:(flrdatatype,flora_is_nonvar_prim(__h)),:(flrwrapper,flora_decode_module_name(__h,__realmod))),'\\true'),=(__realmod,__mod)),','(';'(->(vars_storage(__vars),'\\true'),'\\true'),','(:(flrdescriptor_support,get_tag_descriptor_info_with_rulehead(__r,__fn,__realmod,__t,__h,__vars)),'_$_$_ergo''_overriden_cancellation'(__t,__h,__realmod)))),fllibexecute_delayed_calls([__fn,__h,__mod,__r,__realmod,__t,__vars],[__fn,__h,__mod,__r])))).
:-(FLORA_THIS_WORKSPACE(disqualified_lit)(__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(disq4,'atco.flr',FLORA_THIS_MODULE_NAME),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(not_disqualified_rule)(__newquantvar6,__newquantvar5,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),fllibexecute_delayed_calls([__h,__mod,__newquantvar5,__newquantvar6],[]))),[__h,__mod],173,'atco.flr')))).
:-(FLORA_THIS_WORKSPACE(not_disqualified_rule)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(disq5,'atco.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(candidate)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(disqualified_rule)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__fn,__h,__mod,__r],[]))),[],177,'atco.flr'))))).
:-(FLORA_THIS_WORKSPACE(opposing_rules)(__r1,__fn1,__h1,__r2,__fn2,__h2,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(oppos1,'atco.flr',FLORA_THIS_MODULE_NAME),','(','(';'(->(vars_storage(__vars1),'\\true'),'\\true'),','(:(flrdescriptor_support,get_tag_descriptor_info_with_rulehead(__r1,__fn1,__mod,__t1,__h1,__vars1)),','('_$_$_ergo''_opposes_aux'(__mod,__t1,__h1,__t2,__h2),';'(->(:(flrstorageutils,'\\isbasefact'(__h2)),'\\true'),','(';'(->(vars_storage(__vars2),'\\true'),'\\true'),:(flrdescriptor_support,get_tag_descriptor_info_with_rulehead(__r2,__fn2,__mod,__t2,__h2,__vars2))))))),fllibexecute_delayed_calls([__fn1,__fn2,__h1,__h2,__mod,__r1,__r2,__t1,__t2,__vars1,__vars2],[__fn1,__fn2,__h1,__h2,__mod,__r1,__r2])))).
:-(FLORA_THIS_WORKSPACE(dominates_lit_lit)(__lit1,__lit2,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(dom1,'atco.flr',FLORA_THIS_MODULE_NAME),','(';'(flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(candidate)(__newquantvar6,__newquantvar5,__lit2,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),fllibexecute_delayed_calls([__lit2,__mod,__newquantvar5,__newquantvar6],[]))),[__lit2,__mod],206,'atco.flr')),FLORA_THIS_WORKSPACE(dominates_lit_rule)(__lit1,___r2,___fn2,__lit2,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))),fllibexecute_delayed_calls([___fn2,___r2,__lit1,__lit2,__mod],[__lit1,__lit2,__mod])))).
:-(FLORA_THIS_WORKSPACE(dominates_lit_rule)(__q,__rh,__fnh,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(dom2,'atco.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(candidate)(__rq,__fnq,__q,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(atco_overrides)(__rq,__fnq,__q,__rh,__fnh,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))),fllibexecute_delayed_calls([__fnh,__fnq,__h,__mod,__q,__rh,__rq],[__fnh,__h,__mod,__q,__rh])))).
:-(FLORA_THIS_WORKSPACE(dominates_rule_lit)(__r,__fn,__h,__lit,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(dom3,'atco.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(headlit)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(exists_cand_not_overridden)(__r,__fn,__h,__lit,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__fn,__h,__lit,__mod,__r],[]))),[],222,'atco.flr'))))).
:-(FLORA_THIS_WORKSPACE(exists_cand_not_overridden)(__r,__fn,__h,__lit,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(dom4,'atco.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(headlit)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(candidate)(__rlit,__fnlit,__lit,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(atco_overrides)(__r,__fn,__h,__rlit,__fnlit,__lit,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),fllibexecute_delayed_calls([__fn,__fnlit,__h,__lit,__mod,__r,__rlit],[]))),[],227,'atco.flr')))),fllibexecute_delayed_calls([__fn,__fnlit,__h,__lit,__mod,__r,__rlit],[__fn,__h,__lit,__mod,__r])))).
:-(FLORA_THIS_WORKSPACE(candidate)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(cand1,'atco.flr',FLORA_THIS_MODULE_NAME),','(','(';'(->(','(:(flrdatatype,flora_is_nonvar_prim(__h)),:(flrwrapper,flora_decode_module_name(__h,__realmod))),'\\true'),=(__realmod,__mod)),','(:(flrcanon,show_rule_by_id(__r,__fn,__realmod,__h,__body)),','(:(flrdescriptor_support,is_defeasible_rule(__r,__fn,__realmod)),fllibmodlit(libmod_wrapper,__body,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))),fllibexecute_delayed_calls([__body,__fn,__h,__mod,__r,__realmod],[__fn,__h,__mod,__r])))).
:-(FLORA_THIS_WORKSPACE(strict_candidate)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(scand1,'atco.flr',FLORA_THIS_MODULE_NAME),','(','(';'(->(','(:(flrdatatype,flora_is_nonvar_prim(__h)),:(flrwrapper,flora_decode_module_name(__h,__realmod))),'\\true'),=(__realmod,__mod)),','(:(flrcanon,show_rule_by_id(__r,__fn,__realmod,__h,__body)),','(:(flrdescriptor_support,is_strict_rule(__r,__fn,__realmod)),fllibmodlit(libmod_wrapper,__body,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))),fllibexecute_delayed_calls([__body,__fn,__h,__mod,__r,__realmod],[__fn,__h,__mod,__r])))).
:-(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(beaten1,'atco.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(__r,__fn,__h,__newdontcarevar3,__newdontcarevar4,__newdontcarevar5,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),fllibexecute_delayed_calls([__newdontcarevar8,__fn,__h,__mod,__r],[__fn,__h,__mod,__r])))).
:-(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(__r,__fn,__h,__strictR,__fnstrict,__strictH,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(beaten2,'atco.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(candidate)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(opposing_rules)(__r,__fn,__h,__strictR,__fnstrict,__strictH,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),';'(->(','('_$_$_ergo''_opposes_aux'(__mod,__newdontcarevar7,__h,__newdontcarevar8,__strictH),:(flrstorageutils,'\\isbasefact'(__strictH))),'\\true'),','(FLORA_THIS_WORKSPACE(opposing_rules)(__r,__fn,__h,__strictR,__fnstrict,__strictH,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),FLORA_THIS_WORKSPACE(strict_candidate)(__strictR,__fnstrict,__strictH,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)))))),fllibexecute_delayed_calls([__newdontcarevar13,__fn,__fnstrict,__h,__mod,__r,__strictH,__strictR],[__fn,__fnstrict,__h,__mod,__r,__strictH,__strictR])))).
:-(FLORA_THIS_WORKSPACE(strongcandicate)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(strongcand1,'atco.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(candidate)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(overriden_cancellation_rule)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__fn,__h,__mod,__r],[]))),[],292,'atco.flr'))))).
:-(FLORA_THIS_WORKSPACE(beats_lit_rule)(__q,__rh,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(beatlit1,'atco.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(dominates_lit_rule)(__q,__rh,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(beats_lit_rule)(__q,__rh,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(beatlit2,'atco.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''refutablebodylit'(__rh,__fn,__h,__mod,__bi),FLORA_THIS_WORKSPACE(beats_lit_lit)(__q,__bi,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),fllibexecute_delayed_calls([__bi,__fn,__h,__mod,__q,__rh],[__fn,__h,__mod,__q,__rh])))).
:-(FLORA_THIS_WORKSPACE(beats_lit_lit)(__q,__bi,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(beatlit3,'atco.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(stronglit)(__bi,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(!,flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(not_beats_supported_argument)(__q,__bi,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__bi,__mod,__q],[]))),[],314,'atco.flr')))))).
:-(FLORA_THIS_WORKSPACE(beats_lit_lit)(__q,__nafbodylit,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(beatlit4,'atco.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(naf_literal)(__nafbodylit,__bodylit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''bodyinfo'(___rb,___fn,__bodylit,__mod,__modified_body),FLORA_THIS_WORKSPACE(dispatch_refutable_bodylits)(__modified_body,__mod,__q,beats_lit_lit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([___fn,___rb,__bodylit,__mod,__modified_body,__nafbodylit,__q],[__mod,__nafbodylit,__q])))).
:-(FLORA_THIS_WORKSPACE(not_beats_supported_argument)(__lit1,__lit2,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(notbeats1,'atco.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(supportedattackingargument)(__r2,__fn2,__lit2,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(beats_lit_rule)(__lit1,__r2,__fn2,__lit2,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__fn2,__lit1,__lit2,__mod,__r2],[]))),[],342,'atco.flr'))),fllibexecute_delayed_calls([__fn2,__lit1,__lit2,__mod,__r2],[__lit1,__lit2,__mod])))).
:-(FLORA_THIS_WORKSPACE(supportedattackingargument)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(sarg1,'atco.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(attemptedsupportedattackingargument)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(overriden_cancellation_rule)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__fn,__h,__mod,__r],[]))),[],350,'atco.flr'))))).
:-(FLORA_THIS_WORKSPACE(attemptedsupportedattackingargument)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(attempt1,'atco.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(no_refutable_bodylits)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(!,';'(FLORA_THIS_WORKSPACE(candidate)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),';'(FLORA_THIS_WORKSPACE(strict_candidate)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),:(flrstorageutils,'\\isbasefact'(__h)))))))).
:-(FLORA_THIS_WORKSPACE(attemptedsupportedattackingargument)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(attempt2,'atco.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''bodyinfo'(__r,__fn,__h,__mod,__modified_body),','(FLORA_THIS_WORKSPACE(dispatch_irrefutable_bodylits)(__modified_body,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(dispatch_refutable_bodylits)(__modified_body,__mod,___ext_lit,'ATCO_ATTEMPTEDSUPPORTED_ATTACKING_ARG','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([___ext_lit,__fn,__h,__mod,__modified_body,__r],[__fn,__h,__mod,__r])))).
:-(FLORA_THIS_WORKSPACE(hassupportedattackingargument)(__bodylit,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(hassup1,'atco.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(stronglit)(__bodylit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(!,FLORA_THIS_WORKSPACE(supportedattackingargument)(___r,___fn,__bodylit,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([___fn,___r,__bodylit,__mod],[__bodylit,__mod])))).
:-(FLORA_THIS_WORKSPACE(hassupportedattackingargument)(__naflit,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(hassup2,'atco.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(naf_literal)(__naflit,__lit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''refutablebodylit'(___r,___fn,__lit,__mod,__nafbodylit),','(FLORA_THIS_WORKSPACE(naf_literal)(__nafbodylit,__bodylit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(hassupportedattackingargument)(__bodylit,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(stronglydefeated_lit)(__bodylit,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),fllibexecute_delayed_calls([__bodylit,__mod],[]))),[],397,'atco.flr')))))),fllibexecute_delayed_calls([___fn,___r,__bodylit,__lit,__mod,__nafbodylit,__naflit],[__mod,__naflit])))).
:-(FLORA_THIS_WORKSPACE(stronglydefeated_lit)(__q,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(strongdef1,'atco.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''_opposes_aux'(__mod,__newdontcarevar3,__q,__newdontcarevar4,__opposer_q),','(FLORA_THIS_WORKSPACE(no_refutable_bodylits)(__r_op_q,__fn,__opposer_q,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(!,';'(FLORA_THIS_WORKSPACE(candidate)(__r_op_q,__fn,__opposer_q,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),';'(FLORA_THIS_WORKSPACE(strict_candidate)(__r_op_q,__fn,__opposer_q,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),:(flrstorageutils,'\\isbasefact'(__opposer_q))))))),fllibexecute_delayed_calls([__newdontcarevar11,__fn,__mod,__opposer_q,__q,__r_op_q],[__mod,__q])))).
:-(FLORA_THIS_WORKSPACE(stronglydefeated_lit)(__q,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(strongdef2,'atco.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''_opposes_aux'(__mod,__newdontcarevar3,__q,__newdontcarevar4,__opposer_q),','(FLORA_THIS_WORKSPACE(headlit)(__r_op_q,__fn,__opposer_q,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(dominates_rule_lit)(__r_op_q,__fn,__opposer_q,__q,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),','('_$_$_ergo''bodyinfo'(__r_op_q,__fn,__opposer_q,__mod,__modified_body),','(FLORA_THIS_WORKSPACE(dispatch_irrefutable_bodylits)(__modified_body,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),FLORA_THIS_WORKSPACE(dispatch_refutable_bodylits)(__modified_body,__mod,__q,stronglydefeated,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12))))))),fllibexecute_delayed_calls([__newdontcarevar13,__fn,__mod,__modified_body,__opposer_q,__q,__r_op_q],[__mod,__q])))).
:-(FLORA_THIS_WORKSPACE(atco_overrides)(__r1,__fn1,__h1,__r2,__fn2,__h2,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(atco_ov1,'atco.flr',FLORA_THIS_MODULE_NAME),','(','(';'(->(vars_storage(__vars1),'\\true'),'\\true'),','(:(flrdescriptor_support,get_tag_descriptor_info_with_rulehead(__r1,__fn1,__mod,__t1,__h1,__vars1)),','(';'(->(vars_storage(__vars2),'\\true'),'\\true'),','(:(flrdescriptor_support,get_tag_descriptor_info_with_rulehead(__r2,__fn2,__mod,__t2,__h2,__vars2)),'_$_$_ergo''_overrides_aux'(__mod,__t1,__h1,__t2,__h2))))),fllibexecute_delayed_calls([__fn1,__fn2,__h1,__h2,__mod,__r1,__r2,__t1,__t2,__vars1,__vars2],[__fn1,__fn2,__h1,__h2,__mod,__r1,__r2])))).
:-(FLORA_THIS_WORKSPACE(naf_literal)(__newvar1,__Positive,'_$ctxt'(_CallerModuleVar,__newcontextvar6,__newcontextvar7)),','('_$_$_ergo''rule_enabled'(naflit1,'atco.flr',FLORA_THIS_MODULE_NAME),','(fllibuniveqform(__newvar1,fllibdelayedliteral(default_negation,__newdontcarevar2,__newdontcarevar3,[__Negated,__newdontcarevar4,__newdontcarevar5])),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(arg,1,__Negated,__NegWrapped,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),','(!,:(flrnegation,flora_unwrap_negation(__NegWrapped,__Positive)))),fllibexecute_delayed_calls([__NegWrapped,__Negated,__Positive],[__Negated,__Positive,__newdontcarevar10]))))).
:-(FLORA_THIS_WORKSPACE(naf_literal)(__NegArg,__Positive,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(naflit2,'atco.flr',FLORA_THIS_MODULE_NAME),','(:(flrcanon,is_naf_literal(__NegArg,__Positive)),!))).
:-(FLORA_THIS_WORKSPACE(naf_literal)(__NegWrapped,__Positive,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(naflit3,'atco.flr',FLORA_THIS_MODULE_NAME),','(:(flrnegation,flora_unwrap_negation(__NegWrapped,__Positive)),\=(__NegWrapped,__Positive)))).
:-(FLORA_THIS_WORKSPACE(stronglit)(__lit,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(stronglit1,'atco.flr',FLORA_THIS_MODULE_NAME),','(\+(FLORA_THIS_WORKSPACE(naf_literal)(__lit,__newdontcarevar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5))),fllibexecute_delayed_calls([__newdontcarevar6,__lit],[__lit])))).
:-(FLORA_THIS_WORKSPACE(headlit)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(headlit1,'atco.flr',FLORA_THIS_MODULE_NAME),','(','(';'(->(vars_storage(__vars),'\\true'),'\\true'),:(flrdescriptor_support,get_tag_descriptor_info_with_rulehead(__r,__fn,__mod,__newdontcarevar3,__h,__vars))),fllibexecute_delayed_calls([__newdontcarevar4,__fn,__h,__mod,__r,__vars],[__fn,__h,__mod,__r])))).
:-(FLORA_THIS_WORKSPACE(no_refutable_bodylits)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(norefutbody1,'atco.flr',FLORA_THIS_MODULE_NAME),','(\+('_$_$_ergo''refutablebodylit'(__r,__fn,__h,__mod,__newdontcarevar3)),fllibexecute_delayed_calls([__newdontcarevar4,__fn,__h,__mod,__r],[__fn,__h,__mod,__r])))).
:-(FLORA_THIS_WORKSPACE(dispatch_refutable_bodylits)(__newvar1,__mod,__ExtLit,__CtlVar,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(dispatch1,'atco.flr',FLORA_THIS_MODULE_NAME),','(fllibuniveqform(__newvar1,atco_bodylit_wrapper(__bodylit)),','(!,FLORA_THIS_WORKSPACE(dispatch_one_refutable_bodylit)(__CtlVar,__ExtLit,__mod,__bodylit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)))))).
:-(FLORA_THIS_WORKSPACE(dispatch_refutable_bodylits)(','(__newvar1,__rest),__mod,__ExtLit,__CtlVar,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(dispatch2,'atco.flr',FLORA_THIS_MODULE_NAME),','(fllibuniveqform(__newvar1,atco_bodylit_wrapper(__bodylit)),','(!,','(FLORA_THIS_WORKSPACE(dispatch_one_refutable_bodylit)(__CtlVar,__ExtLit,__mod,__bodylit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),FLORA_THIS_WORKSPACE(dispatch_refutable_bodylits)(__rest,__mod,__ExtLit,__CtlVar,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7))))))).
FLORA_THIS_WORKSPACE(dispatch_refutable_bodylits)(___bodylits,___mod,___ExtLit,___CtlVar,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)).
:-(FLORA_THIS_WORKSPACE(dispatch_irrefutable_bodylits)(','(__newvar1,___rest),'_$ctxt'(_CallerModuleVar,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''rule_enabled'(dispatch_irrefut1,'atco.flr',FLORA_THIS_MODULE_NAME),','(fllibuniveqform(__newvar1,atco_bodylit_wrapper(__newdontcarevar2)),!))).
:-(FLORA_THIS_WORKSPACE(dispatch_irrefutable_bodylits)(__newvar1,'_$ctxt'(_CallerModuleVar,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''rule_enabled'(4,'atco.flr',FLORA_THIS_MODULE_NAME),','(fllibuniveqform(__newvar1,atco_bodylit_wrapper(__newdontcarevar2)),!))).
:-(FLORA_THIS_WORKSPACE(dispatch_irrefutable_bodylits)(','(__lit,__rest),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(6,'atco.flr',FLORA_THIS_MODULE_NAME),','(!,','(fllibmodlit(libmod_wrapper,__lit,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(dispatch_irrefutable_bodylits)(__rest,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))))).
:-(FLORA_THIS_WORKSPACE(dispatch_irrefutable_bodylits)(__lit,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(dispatch_irrefut2,'atco.flr',FLORA_THIS_MODULE_NAME),fllibmodlit(libmod_wrapper,__lit,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(dispatch_one_refutable_bodylit)('ATCO_ATTEMPTEDSUPPORTED_ATTACKING_ARG',___extern,__mod,__bodylit,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(dispatchone1,'atco.flr',FLORA_THIS_MODULE_NAME),','(','(!,','(FLORA_THIS_WORKSPACE(hassupportedattackingargument)(__bodylit,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(stronglydefeated_lit)(__bodylit,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__bodylit,__mod],[]))),[],524,'atco.flr')))),fllibexecute_delayed_calls([__bodylit,__mod],[___extern,__bodylit,__mod])))).
:-(FLORA_THIS_WORKSPACE(dispatch_one_refutable_bodylit)(stronglydefeated,__extern_lit,__mod,__bodylit,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(dispatchone2,'atco.flr',FLORA_THIS_MODULE_NAME),','(!,FLORA_THIS_WORKSPACE(dominates_lit_lit)(__bodylit,__extern_lit,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))).
:-(FLORA_THIS_WORKSPACE(dispatch_one_refutable_bodylit)(beats_lit_lit,__extern_lit,__mod,__bodylit,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(dispatchone3,'atco.flr',FLORA_THIS_MODULE_NAME),','(','(!,','(FLORA_THIS_WORKSPACE(naf_literal)(__bodylit,__posbodylit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(beats_lit_lit)(__extern_lit,__posbodylit,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__bodylit,__extern_lit,__mod,__posbodylit],[__bodylit,__extern_lit,__mod])))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(change_module,4,FLORA_THIS_MODULE_NAME),prolog(change_module_nocheck,4,FLORA_THIS_MODULE_NAME),prolog(check_module_to_AT_association,1,FLORA_THIS_MODULE_NAME)]))).
:-(FLORA_THIS_WORKSPACE(change_module)(__InA,__Mod,__RealNewMod,__OutA,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(8,'change_module.flh',FLORA_THIS_MODULE_NAME),','(:(flrwrapper,flora_change_module(__InA,__OutA,','(FLORA_THIS_MODULE_NAME,__Mod),__RealNewMod,['In ',status,'(Tag,Head)[...]@',FLORA_THIS_MODULE_NAME,': Head must be bound'])),FLORA_THIS_WORKSPACE(check_module_to_AT_association)(__RealNewMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))).
:-(FLORA_THIS_WORKSPACE(change_module_nocheck)(__InA,__newdontcarevar1,__newdontcarevar2,__OutA,'_$ctxt'(_CallerModuleVar,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''rule_enabled'(10,'change_module.flh',FLORA_THIS_MODULE_NAME),','(:(flrdatatype,flora_is_var_prim(__InA)),','(!,=(__OutA,__InA))))).
:-(FLORA_THIS_WORKSPACE(change_module_nocheck)(__InA,__Mod,__RealNewMod,__OutA,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(12,'change_module.flh',FLORA_THIS_MODULE_NAME),','(:(flrwrapper,flora_change_module(__InA,__OutA,','(FLORA_THIS_MODULE_NAME,__Mod),__RealNewMod,'In defeated/overrides/opposes: something wrong')),FLORA_THIS_WORKSPACE(check_module_to_AT_association)(__RealNewMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))).
:-(FLORA_THIS_WORKSPACE(check_module_to_AT_association)(__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(14,'change_module.flh',FLORA_THIS_MODULE_NAME),','(:(flrwrapper,flora_is_system_module_name(__Mod)),','(!,'\\false')))).
:-(FLORA_THIS_WORKSPACE(check_module_to_AT_association)(__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(16,'change_module.flh',FLORA_THIS_MODULE_NAME),','(\+(:(flrregistry,flora_defeasible_module_registry(__Mod,FLORA_THIS_MODULE_NAME))),','(\==(__Mod,FLORA_THIS_MODULE_NAME),','(!,FLORA_WORKSPACE(\\system,d^tblflapply)(sysabort,['User module ',__Mod,' is not associated with the argumentation theory residing in module ',FLORA_THIS_MODULE_NAME],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))))).
:-(FLORA_THIS_WORKSPACE(check_module_to_AT_association)(__newdontcarevar1,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(18,'change_module.flh',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,__r,__fn,__h),howDefeated,flapply(ruleRefutedBy,__refuter,__refuter_fn),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(20,'atco.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__mod),','(FLORA_THIS_WORKSPACE(change_module)(__h,__mod,___realMod,__hm,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(refuted)(__r,__fn,__hm,__refuter,__refuter_fn,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([___realMod,__fn,__h,__hm,__mod,__r,__refuter,__refuter_fn],[__fn,__h,__r,__refuter,__refuter_fn])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,__r,___fn,__h),howDefeated,flapply(literalRefutedBy,__refuter,__refuter_fn),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(22,'atco.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__mod),','(FLORA_THIS_WORKSPACE(change_module)(__h,__mod,___realMod,__hm,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(refuted)(__r2,___fn2,__hm,__refuter,__refuter_fn,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),\=(__r2,__r)))),fllibexecute_delayed_calls([___fn2,___realMod,__h,__hm,__mod,__r,__r2,__refuter,__refuter_fn],[___fn,__h,__r,__refuter,__refuter_fn])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,__r,__fn,__h),howDefeated,flapply(beatenByStrictRule,__strictR,__strict_fn),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(24,'atco.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__mod),','(FLORA_THIS_WORKSPACE(change_module)(__h,__mod,___realMod,__hm,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(__r,__fn,__hm,__strictR,__strict_fn,___strictH,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([___realMod,___strictH,__fn,__h,__hm,__mod,__r,__strictR,__strict_fn],[__fn,__h,__r,__strictR,__strict_fn])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,__r,__fn,__h),howDefeated,canceled,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(26,'atco.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__mod),','(FLORA_THIS_WORKSPACE(change_module)(__h,__mod,___realMod,__hm,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(disqualified_rule)(__r,__fn,__hm,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(__r,__fn,__hm,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),fllibexecute_delayed_calls([__fn,__hm,__mod,__r],[]))),[],560,'atco.flr'))))),fllibexecute_delayed_calls([___realMod,__fn,__h,__hm,__mod,__r],[__fn,__h,__r])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,___r,___fn,__h),howDefeated,disqualifiedLiteral,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(28,'atco.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__mod),','(FLORA_THIS_WORKSPACE(change_module)(__h,__mod,___realMod,__hm,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(disqualified_lit)(__hm,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([___realMod,__h,__hm,__mod],[___fn,___r,__h])))).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rule signatures %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%% Signatures for latent queries %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%% Queries found in the source file %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_WORKSPACE(\\system,d^meth)('Method',flapply(mustDefine,flapply(on,FLORA_THIS_MODULE_NAME)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar1,__newcontextvar2))),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),:(flrarguments,flora_set_argdef(status,3,[oid,oid,meta],FLORA_THIS_MODULE_NAME))),[])).

 
#if !defined(FLORA_FLS2_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLS2_FILENAME  'atco.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('atco.ergo',FLORA_THIS_MODULE_NAME))).

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

:-(FLORA_THIS_WORKSPACE(\\undefeated)(_h887974,_h887976,_h887978,_h887980,_h887982,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(\\undefeated))(_h887974,_h887976,_h887978,_h887980,_h887982,FWContext)).
:-(FLORA_THIS_WORKSPACE(atco_overrides)(_h888627,_h888629,_h888631,_h888633,_h888635,_h888637,_h888639,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(atco_overrides))(_h888627,_h888629,_h888631,_h888633,_h888635,_h888637,_h888639,FWContext)).
:-(FLORA_THIS_WORKSPACE(attemptedsupportedattackingargument)(_h889322,_h889324,_h889326,_h889328,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(attemptedsupportedattackingargument))(_h889322,_h889324,_h889326,_h889328,FWContext)).
:-(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(_h890341,_h890343,_h890345,_h890347,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beaten_by_strict_rule))(_h890341,_h890343,_h890345,_h890347,FWContext)).
:-(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(_h891136,_h891138,_h891140,_h891142,_h891144,_h891146,_h891148,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beaten_by_strict_rule))(_h891136,_h891138,_h891140,_h891142,_h891144,_h891146,_h891148,FWContext)).
:-(FLORA_THIS_WORKSPACE(beats_lit_lit)(_h891943,_h891945,_h891947,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beats_lit_lit))(_h891943,_h891945,_h891947,FWContext)).
:-(FLORA_THIS_WORKSPACE(beats_lit_rule)(_h892606,_h892608,_h892610,_h892612,_h892614,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beats_lit_rule))(_h892606,_h892608,_h892610,_h892612,_h892614,FWContext)).
:-(FLORA_THIS_WORKSPACE(candidate)(_h893293,_h893295,_h893297,_h893299,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(candidate))(_h893293,_h893295,_h893297,_h893299,FWContext)).
:-(FLORA_THIS_WORKSPACE(change_module)(_h893896,_h893898,_h893900,_h893902,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(change_module))(_h893896,_h893898,_h893900,_h893902,FWContext)).
:-(FLORA_THIS_WORKSPACE(change_module_nocheck)(_h894563,_h894565,_h894567,_h894569,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(change_module_nocheck))(_h894563,_h894565,_h894567,_h894569,FWContext)).
:-(FLORA_THIS_WORKSPACE(check_module_to_AT_association)(_h895358,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(check_module_to_AT_association))(_h895358,FWContext)).
:-(FLORA_THIS_WORKSPACE(defeated_lit)(_h896285,_h896287,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(defeated_lit))(_h896285,_h896287,FWContext)).
:-(FLORA_THIS_WORKSPACE(defeated_rule)(_h896928,_h896930,_h896932,_h896934,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(defeated_rule))(_h896928,_h896930,_h896932,_h896934,FWContext)).
:-(FLORA_THIS_WORKSPACE(dispatch_irrefutable_bodylits)(_h897595,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(dispatch_irrefutable_bodylits))(_h897595,FWContext)).
:-(FLORA_THIS_WORKSPACE(dispatch_one_refutable_bodylit)(_h898506,_h898508,_h898510,_h898512,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(dispatch_one_refutable_bodylit))(_h898506,_h898508,_h898510,_h898512,FWContext)).
:-(FLORA_THIS_WORKSPACE(dispatch_refutable_bodylits)(_h899445,_h899447,_h899449,_h899451,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(dispatch_refutable_bodylits))(_h899445,_h899447,_h899449,_h899451,FWContext)).
:-(FLORA_THIS_WORKSPACE(disqualified_lit)(_h900336,_h900338,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(disqualified_lit))(_h900336,_h900338,FWContext)).
:-(FLORA_THIS_WORKSPACE(disqualified_rule)(_h901043,_h901045,_h901047,_h901049,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(disqualified_rule))(_h901043,_h901045,_h901047,_h901049,FWContext)).
:-(FLORA_THIS_WORKSPACE(dominates_lit_lit)(_h901774,_h901776,_h901778,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(dominates_lit_lit))(_h901774,_h901776,_h901778,FWContext)).
:-(FLORA_THIS_WORKSPACE(dominates_lit_rule)(_h902501,_h902503,_h902505,_h902507,_h902509,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(dominates_lit_rule))(_h902501,_h902503,_h902505,_h902507,_h902509,FWContext)).
:-(FLORA_THIS_WORKSPACE(dominates_rule_lit)(_h903252,_h903254,_h903256,_h903258,_h903260,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(dominates_rule_lit))(_h903252,_h903254,_h903256,_h903258,_h903260,FWContext)).
:-(FLORA_THIS_WORKSPACE(exists_cand_not_overridden)(_h904003,_h904005,_h904007,_h904009,_h904011,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(exists_cand_not_overridden))(_h904003,_h904005,_h904007,_h904009,_h904011,FWContext)).
:-(FLORA_THIS_WORKSPACE(hassupportedattackingargument)(_h904882,_h904884,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(hassupportedattackingargument))(_h904882,_h904884,FWContext)).
:-(FLORA_THIS_WORKSPACE(headlit)(_h905797,_h905799,_h905801,_h905803,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(headlit))(_h905797,_h905799,_h905801,_h905803,FWContext)).
:-(FLORA_THIS_WORKSPACE(naf_literal)(_h906368,_h906370,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(naf_literal))(_h906368,_h906370,FWContext)).
:-(FLORA_THIS_WORKSPACE(no_refutable_bodylits)(_h906995,_h906997,_h906999,_h907001,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(no_refutable_bodylits))(_h906995,_h906997,_h906999,_h907001,FWContext)).
:-(FLORA_THIS_WORKSPACE(not_beats_supported_argument)(_h907790,_h907792,_h907794,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(not_beats_supported_argument))(_h907790,_h907792,_h907794,FWContext)).
:-(FLORA_THIS_WORKSPACE(not_disqualified_rule)(_h908693,_h908695,_h908697,_h908699,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(not_disqualified_rule))(_h908693,_h908695,_h908697,_h908699,FWContext)).
:-(FLORA_THIS_WORKSPACE(opposing_rules)(_h909488,_h909490,_h909492,_h909494,_h909496,_h909498,_h909500,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(opposing_rules))(_h909488,_h909490,_h909492,_h909494,_h909496,_h909498,_h909500,FWContext)).
:-(FLORA_THIS_WORKSPACE(overriden_cancellation_rule)(_h910183,_h910185,_h910187,_h910189,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(overriden_cancellation_rule))(_h910183,_h910185,_h910187,_h910189,FWContext)).
:-(FLORA_THIS_WORKSPACE(refuted)(_h911074,_h911076,_h911078,_h911080,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(refuted))(_h911074,_h911076,_h911078,_h911080,FWContext)).
:-(FLORA_THIS_WORKSPACE(refuted)(_h911645,_h911647,_h911649,_h911651,_h911653,_h911655,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(refuted))(_h911645,_h911647,_h911649,_h911651,_h911653,_h911655,FWContext)).
:-(FLORA_THIS_WORKSPACE(strict_candidate)(_h912224,_h912226,_h912228,_h912230,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(strict_candidate))(_h912224,_h912226,_h912228,_h912230,FWContext)).
:-(FLORA_THIS_WORKSPACE(strongcandicate)(_h912939,_h912941,_h912943,_h912945,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(strongcandicate))(_h912939,_h912941,_h912943,_h912945,FWContext)).
:-(FLORA_THIS_WORKSPACE(stronglit)(_h913638,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(stronglit))(_h913638,FWContext)).
:-(FLORA_THIS_WORKSPACE(stronglydefeated_lit)(_h914229,_h914231,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(stronglydefeated_lit))(_h914229,_h914231,FWContext)).
:-(FLORA_THIS_WORKSPACE(supportedattackingargument)(_h915000,_h915002,_h915004,_h915006,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(supportedattackingargument))(_h915000,_h915002,_h915004,_h915006,FWContext)).
