
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

#define FLORA_COMPILATION_ID 11

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
#define FLORA_THIS_FILENAME  'atco3.ergo'
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
:-(FLORA_THIS_WORKSPACE(\\undefeated)(_h911355,_h911357,_h911359,_h911361,_h911363,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(\\undefeated))(_h911355,_h911357,_h911359,_h911361,_h911363,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(atco_overrides)),8),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(atco_overrides)),8)),opaque))).
:-(FLORA_THIS_WORKSPACE(atco_overrides)(_h912013,_h912015,_h912017,_h912019,_h912021,_h912023,_h912025,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(atco_overrides))(_h912013,_h912015,_h912017,_h912019,_h912021,_h912023,_h912025,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(attemptedsupportedattackingargument)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(attemptedsupportedattackingargument)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(attemptedsupportedattackingargument)(_h912713,_h912715,_h912717,_h912719,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(attemptedsupportedattackingargument))(_h912713,_h912715,_h912717,_h912719,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(attemptedsupportedcounterattackingargument)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(attemptedsupportedcounterattackingargument)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(attemptedsupportedcounterattackingargument)(_h913737,_h913739,_h913741,_h913743,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(attemptedsupportedcounterattackingargument))(_h913737,_h913739,_h913741,_h913743,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beaten_by_strict_rule)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beaten_by_strict_rule)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(_h914873,_h914875,_h914877,_h914879,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beaten_by_strict_rule))(_h914873,_h914875,_h914877,_h914879,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beaten_by_strict_rule)),8),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beaten_by_strict_rule)),8)),opaque))).
:-(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(_h915673,_h915675,_h915677,_h915679,_h915681,_h915683,_h915685,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beaten_by_strict_rule))(_h915673,_h915675,_h915677,_h915679,_h915681,_h915683,_h915685,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beats2_lit_lit)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beats2_lit_lit)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(beats2_lit_lit)(_h916485,_h916487,_h916489,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beats2_lit_lit))(_h916485,_h916487,_h916489,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beats2_lit_rule)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beats2_lit_rule)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(beats2_lit_rule)(_h917169,_h917171,_h917173,_h917175,_h917177,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beats2_lit_rule))(_h917169,_h917171,_h917173,_h917175,_h917177,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beats_lit_lit)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beats_lit_lit)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(beats_lit_lit)(_h917877,_h917879,_h917881,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beats_lit_lit))(_h917877,_h917879,_h917881,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beats_lit_rule)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beats_lit_rule)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(beats_lit_rule)(_h918545,_h918547,_h918549,_h918551,_h918553,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(beats_lit_rule))(_h918545,_h918547,_h918549,_h918551,_h918553,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(candidate)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(candidate)),5)),FLORA_FLEX_DYNAMIC_TYPE_CLAUSE))).
:-(FLORA_THIS_WORKSPACE(candidate)(_h919237,_h919239,_h919241,_h919243,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(candidate))(_h919237,_h919239,_h919241,_h919243,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(change_module)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(change_module)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(change_module)(_h919845,_h919847,_h919849,_h919851,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(change_module))(_h919845,_h919847,_h919849,_h919851,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(change_module_nocheck)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(change_module_nocheck)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(change_module_nocheck)(_h920517,_h920519,_h920521,_h920523,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(change_module_nocheck))(_h920517,_h920519,_h920521,_h920523,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(check_module_to_AT_association)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(check_module_to_AT_association)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(check_module_to_AT_association)(_h921317,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(check_module_to_AT_association))(_h921317,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(defeated_lit)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(defeated_lit)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(defeated_lit)(_h922249,_h922251,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(defeated_lit))(_h922249,_h922251,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(defeated_rule)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(defeated_rule)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(defeated_rule)(_h922897,_h922899,_h922901,_h922903,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(defeated_rule))(_h922897,_h922899,_h922901,_h922903,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(dispatch_irrefutable_bodylits)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(dispatch_irrefutable_bodylits)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(dispatch_irrefutable_bodylits)(_h923569,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(dispatch_irrefutable_bodylits))(_h923569,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(dispatch_one_refutable_bodylit)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(dispatch_one_refutable_bodylit)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(dispatch_one_refutable_bodylit)(_h924485,_h924487,_h924489,_h924491,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(dispatch_one_refutable_bodylit))(_h924485,_h924487,_h924489,_h924491,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(dispatch_refutable_bodylits)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(dispatch_refutable_bodylits)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(dispatch_refutable_bodylits)(_h925429,_h925431,_h925433,_h925435,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(dispatch_refutable_bodylits))(_h925429,_h925431,_h925433,_h925435,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(disqualified_lit)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(disqualified_lit)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(disqualified_lit)(_h926325,_h926327,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(disqualified_lit))(_h926325,_h926327,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(disqualified_rule)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(disqualified_rule)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(disqualified_rule)(_h927037,_h927039,_h927041,_h927043,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(disqualified_rule))(_h927037,_h927039,_h927041,_h927043,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(dominates_lit_lit)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(dominates_lit_lit)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(dominates_lit_lit)(_h927773,_h927775,_h927777,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(dominates_lit_lit))(_h927773,_h927775,_h927777,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(dominates_lit_rule)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(dominates_lit_rule)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(dominates_lit_rule)(_h928505,_h928507,_h928509,_h928511,_h928513,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(dominates_lit_rule))(_h928505,_h928507,_h928509,_h928511,_h928513,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(dominates_rule_lit)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(dominates_rule_lit)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(dominates_rule_lit)(_h929261,_h929263,_h929265,_h929267,_h929269,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(dominates_rule_lit))(_h929261,_h929263,_h929265,_h929267,_h929269,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(exists_cand_not_overridden)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(exists_cand_not_overridden)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(exists_cand_not_overridden)(_h930017,_h930019,_h930021,_h930023,_h930025,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(exists_cand_not_overridden))(_h930017,_h930019,_h930021,_h930023,_h930025,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(hassupportedattackingargument)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(hassupportedattackingargument)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(hassupportedattackingargument)(_h930901,_h930903,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(hassupportedattackingargument))(_h930901,_h930903,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(hassupportedcounterattackingargument)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(hassupportedcounterattackingargument)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(hassupportedcounterattackingargument)(_h931821,_h931823,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(hassupportedcounterattackingargument))(_h931821,_h931823,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(headlit)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(headlit)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(headlit)(_h932853,_h932855,_h932857,_h932859,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(headlit))(_h932853,_h932855,_h932857,_h932859,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(naf_literal)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(naf_literal)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(naf_literal)(_h933429,_h933431,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(naf_literal))(_h933429,_h933431,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(no_refutable_bodylits)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(no_refutable_bodylits)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(no_refutable_bodylits)(_h934061,_h934063,_h934065,_h934067,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(no_refutable_bodylits))(_h934061,_h934063,_h934065,_h934067,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(not_beats2_supported_argument)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(not_beats2_supported_argument)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(not_beats2_supported_argument)(_h934861,_h934863,_h934865,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(not_beats2_supported_argument))(_h934861,_h934863,_h934865,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(not_beats_supported_argument)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(not_beats_supported_argument)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(not_beats_supported_argument)(_h935785,_h935787,_h935789,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(not_beats_supported_argument))(_h935785,_h935787,_h935789,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(not_disqualified_rule)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(not_disqualified_rule)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(not_disqualified_rule)(_h936693,_h936695,_h936697,_h936699,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(not_disqualified_rule))(_h936693,_h936695,_h936697,_h936699,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(opposing_rules)),8),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(opposing_rules)),8)),opaque))).
:-(FLORA_THIS_WORKSPACE(opposing_rules)(_h937493,_h937495,_h937497,_h937499,_h937501,_h937503,_h937505,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(opposing_rules))(_h937493,_h937495,_h937497,_h937499,_h937501,_h937503,_h937505,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(overriden_cancellation_rule)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(overriden_cancellation_rule)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(overriden_cancellation_rule)(_h938193,_h938195,_h938197,_h938199,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(overriden_cancellation_rule))(_h938193,_h938195,_h938197,_h938199,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(refuted)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(refuted)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(refuted)(_h939089,_h939091,_h939093,_h939095,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(refuted))(_h939089,_h939091,_h939093,_h939095,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(refuted)),7),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(refuted)),7)),opaque))).
:-(FLORA_THIS_WORKSPACE(refuted)(_h939665,_h939667,_h939669,_h939671,_h939673,_h939675,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(refuted))(_h939665,_h939667,_h939669,_h939671,_h939673,_h939675,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(strict_candidate)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(strict_candidate)),5)),FLORA_FLEX_DYNAMIC_TYPE_CLAUSE))).
:-(FLORA_THIS_WORKSPACE(strict_candidate)(_h940249,_h940251,_h940253,_h940255,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(strict_candidate))(_h940249,_h940251,_h940253,_h940255,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(strongcandicate)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(strongcandicate)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(strongcandicate)(_h940969,_h940971,_h940973,_h940975,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(strongcandicate))(_h940969,_h940971,_h940973,_h940975,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(stronglit)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(stronglit)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(stronglit)(_h941673,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(stronglit))(_h941673,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(supportedattackingargument)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(supportedattackingargument)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(supportedattackingargument)(_h942269,_h942271,_h942273,_h942275,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(supportedattackingargument))(_h942269,_h942271,_h942273,_h942275,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(supportedcounterattackingargument)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(supportedcounterattackingargument)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(supportedcounterattackingargument)(_h943149,_h943151,_h943153,_h943155,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(supportedcounterattackingargument))(_h943149,_h943151,_h943153,_h943155,FWContext)).
 
#if !defined(FLORA_FLM_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLM_FILENAME  'atco3.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(atco3,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'atco3.fld'
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
#define FLORA_FLS_FILENAME  'atco3.fls'
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
?-(:(flrprolog,flora_define_modular_prolog([prolog(defeated_rule,4,FLORA_THIS_MODULE_NAME),prolog(defeated_lit,2,FLORA_THIS_MODULE_NAME),prolog(overriden_cancellation_rule,4,FLORA_THIS_MODULE_NAME),prolog(beaten_by_strict_rule,4,FLORA_THIS_MODULE_NAME),prolog(beaten_by_strict_rule,7,FLORA_THIS_MODULE_NAME),prolog(disqualified_rule,4,FLORA_THIS_MODULE_NAME),prolog(disqualified_lit,2,FLORA_THIS_MODULE_NAME),prolog(not_disqualified_rule,4,FLORA_THIS_MODULE_NAME),prolog(opposing_rules,7,FLORA_THIS_MODULE_NAME)]))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(dispatch_refutable_bodylits,4,FLORA_THIS_MODULE_NAME),prolog(dispatch_irrefutable_bodylits,1,FLORA_THIS_MODULE_NAME),prolog(dispatch_one_refutable_bodylit,4,FLORA_THIS_MODULE_NAME)]))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(supportedattackingargument,4,FLORA_THIS_MODULE_NAME),prolog(supportedcounterattackingargument,4,FLORA_THIS_MODULE_NAME),prolog(hassupportedattackingargument,2,FLORA_THIS_MODULE_NAME),prolog(hassupportedcounterattackingargument,2,FLORA_THIS_MODULE_NAME),prolog(attemptedsupportedattackingargument,4,FLORA_THIS_MODULE_NAME),prolog(attemptedsupportedcounterattackingargument,4,FLORA_THIS_MODULE_NAME)]))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(dominates_lit_lit,3,FLORA_THIS_MODULE_NAME),prolog(dominates_lit_rule,5,FLORA_THIS_MODULE_NAME),prolog(dominates_rule_lit,5,FLORA_THIS_MODULE_NAME),prolog(atco_overrides,7,FLORA_THIS_MODULE_NAME),prolog(beats_lit_rule,5,FLORA_THIS_MODULE_NAME),prolog(beats_lit_lit,3,FLORA_THIS_MODULE_NAME),prolog(beats2_lit_rule,5,FLORA_THIS_MODULE_NAME),prolog(beats2_lit_lit,3,FLORA_THIS_MODULE_NAME)]))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(exists_cand_not_overridden,5,FLORA_THIS_MODULE_NAME),prolog(no_refutable_bodylits,4,FLORA_THIS_MODULE_NAME),prolog(not_beats_supported_argument,3,FLORA_THIS_MODULE_NAME),prolog(not_beats2_supported_argument,3,FLORA_THIS_MODULE_NAME)]))).

:-(dynamic(/(vars_storage,1))).

:-(FLORA_THIS_WORKSPACE(\\undefeated)(__r,__fn,__vars,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(undef2,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','(retractall(vars_storage(__newdontcarevar3)),','(assert(vars_storage(__vars)),','(FLORA_THIS_WORKSPACE(headlit)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),','(flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(defeated_rule)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),fllibexecute_delayed_calls([__fn,__h,__mod,__r],[]))),[],114,'atco3.flr')),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(defeated_lit)(__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),fllibexecute_delayed_calls([__h,__mod],[]))),[],115,'atco3.flr')))))),fllibexecute_delayed_calls([__newdontcarevar10,__fn,__h,__mod,__r,__vars],[__fn,__h,__mod,__r,__vars])))).
:-(FLORA_THIS_WORKSPACE(defeated_rule)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(def1,'atco3.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(refuted)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(defeated_rule)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(def2,'atco3.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(disqualified_rule)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(defeated_lit)(__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(def3,'atco3.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(refuted)(___r,___fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),fllibexecute_delayed_calls([___fn,___r,__h,__mod],[__h,__mod])))).
:-(FLORA_THIS_WORKSPACE(defeated_lit)(__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(def4,'atco3.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(disqualified_lit)(__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(refuted)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(ref1,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(candidate)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(opposing_rules)(__r,__fn,__h,__r2,__fn2,__h2,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(supportedattackingargument)(__r2,__fn2,__h2,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(beats_lit_rule)(__h,__r2,__fn2,__h2,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),fllibexecute_delayed_calls([__fn2,__h,__h2,__mod,__r2],[]))),[],136,'atco3.flr'))))),fllibexecute_delayed_calls([__fn,__fn2,__h,__h2,__mod,__r,__r2],[__fn,__h,__mod,__r])))).
:-(FLORA_THIS_WORKSPACE(refuted)(__r,__fn,__h,__refuter,__refuter_fn,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(ref2,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(candidate)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(opposing_rules)(__r,__fn,__h,__refuter,__refuter_fn,__h2,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(supportedattackingargument)(__refuter,__refuter_fn,__h2,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(beats_lit_rule)(__h,__refuter,__refuter_fn,__h2,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),fllibexecute_delayed_calls([__h,__h2,__mod,__refuter,__refuter_fn],[]))),[],144,'atco3.flr'))))),fllibexecute_delayed_calls([__fn,__h,__h2,__mod,__r,__refuter,__refuter_fn],[__fn,__h,__mod,__r,__refuter,__refuter_fn])))).
:-(FLORA_THIS_WORKSPACE(disqualified_rule)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(disq1,'atco3.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(disqualified_rule)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(disq2,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','(';'(->(','(:(flrdatatype,flora_is_nonvar_prim(__h)),:(flrwrapper,flora_decode_module_name(__h,__realmod))),'\\true'),=(__realmod,__mod)),','(';'(->(vars_storage(__vars),'\\true'),'\\true'),','(:(flrdescriptor_support,get_tag_descriptor_info_with_rulehead(__r,__fn,__realmod,__t,__h,__vars)),'_$_$_ergo''_cancel_aux'(__realmod,__t,__h)))),fllibexecute_delayed_calls([__fn,__h,__mod,__r,__realmod,__t,__vars],[__fn,__h,__mod,__r])))).
:-(FLORA_THIS_WORKSPACE(disqualified_rule)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(disq3,'atco3.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(overriden_cancellation_rule)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(overriden_cancellation_rule)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(cancl1,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','(';'(->(','(:(flrdatatype,flora_is_nonvar_prim(__h)),:(flrwrapper,flora_decode_module_name(__h,__realmod))),'\\true'),=(__realmod,__mod)),','(';'(->(vars_storage(__vars),'\\true'),'\\true'),','(:(flrdescriptor_support,get_tag_descriptor_info_with_rulehead(__r,__fn,__realmod,__t,__h,__vars)),'_$_$_ergo''_overriden_cancellation'(__t,__h,__realmod)))),fllibexecute_delayed_calls([__fn,__h,__mod,__r,__realmod,__t,__vars],[__fn,__h,__mod,__r])))).
:-(FLORA_THIS_WORKSPACE(disqualified_lit)(__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(disq4,'atco3.flr',FLORA_THIS_MODULE_NAME),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(not_disqualified_rule)(__newquantvar6,__newquantvar5,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),fllibexecute_delayed_calls([__h,__mod,__newquantvar5,__newquantvar6],[]))),[__h,__mod],179,'atco3.flr')))).
:-(FLORA_THIS_WORKSPACE(not_disqualified_rule)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(disq5,'atco3.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(candidate)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(disqualified_rule)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__fn,__h,__mod,__r],[]))),[],183,'atco3.flr'))))).
:-(FLORA_THIS_WORKSPACE(opposing_rules)(__r1,__fn1,__h1,__r2,__fn2,__h2,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(oppos1,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','(';'(->(vars_storage(__vars1),'\\true'),'\\true'),','(:(flrdescriptor_support,get_tag_descriptor_info_with_rulehead(__r1,__fn1,__mod,__t1,__h1,__vars1)),','('_$_$_ergo''_opposes_aux'(__mod,__t1,__h1,__t2,__h2),';'(->(:(flrstorageutils,'\\isbasefact'(__h2)),'\\true'),','(';'(->(vars_storage(__vars2),'\\true'),'\\true'),:(flrdescriptor_support,get_tag_descriptor_info_with_rulehead(__r2,__fn2,__mod,__t2,__h2,__vars2))))))),fllibexecute_delayed_calls([__fn1,__fn2,__h1,__h2,__mod,__r1,__r2,__t1,__t2,__vars1,__vars2],[__fn1,__fn2,__h1,__h2,__mod,__r1,__r2])))).
:-(FLORA_THIS_WORKSPACE(dominates_lit_lit)(__lit1,__lit2,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(dom1,'atco3.flr',FLORA_THIS_MODULE_NAME),','(';'(flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(candidate)(__newquantvar6,__newquantvar5,__lit2,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),fllibexecute_delayed_calls([__lit2,__mod,__newquantvar5,__newquantvar6],[]))),[__lit2,__mod],212,'atco3.flr')),FLORA_THIS_WORKSPACE(dominates_lit_rule)(__lit1,___r2,___fn2,__lit2,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))),fllibexecute_delayed_calls([___fn2,___r2,__lit1,__lit2,__mod],[__lit1,__lit2,__mod])))).
:-(FLORA_THIS_WORKSPACE(dominates_lit_rule)(__q,__rh,__fnh,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(dom2,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(candidate)(__rq,__fnq,__q,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(atco_overrides)(__rq,__fnq,__q,__rh,__fnh,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))),fllibexecute_delayed_calls([__fnh,__fnq,__h,__mod,__q,__rh,__rq],[__fnh,__h,__mod,__q,__rh])))).
:-(FLORA_THIS_WORKSPACE(dominates_rule_lit)(__r,__fn,__h,__lit,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(dom3,'atco3.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(headlit)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(exists_cand_not_overridden)(__r,__fn,__h,__lit,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__fn,__h,__lit,__mod,__r],[]))),[],228,'atco3.flr'))))).
:-(FLORA_THIS_WORKSPACE(exists_cand_not_overridden)(__r,__fn,__h,__lit,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(dom4,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(headlit)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(candidate)(__rlit,__fnlit,__lit,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(atco_overrides)(__r,__fn,__h,__rlit,__fnlit,__lit,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),fllibexecute_delayed_calls([__fn,__fnlit,__h,__lit,__mod,__r,__rlit],[]))),[],233,'atco3.flr')))),fllibexecute_delayed_calls([__fn,__fnlit,__h,__lit,__mod,__r,__rlit],[__fn,__h,__lit,__mod,__r])))).
:-(FLORA_THIS_WORKSPACE(candidate)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(cand1,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','(';'(->(','(:(flrdatatype,flora_is_nonvar_prim(__h)),:(flrwrapper,flora_decode_module_name(__h,__realmod))),'\\true'),=(__realmod,__mod)),','(:(flrcanon,show_rule_by_id(__r,__fn,__realmod,__h,__body)),','(:(flrdescriptor_support,is_defeasible_rule(__r,__fn,__realmod)),fllibmodlit(libmod_wrapper,__body,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))),fllibexecute_delayed_calls([__body,__fn,__h,__mod,__r,__realmod],[__fn,__h,__mod,__r])))).
:-(FLORA_THIS_WORKSPACE(strict_candidate)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(scand1,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','(';'(->(','(:(flrdatatype,flora_is_nonvar_prim(__h)),:(flrwrapper,flora_decode_module_name(__h,__realmod))),'\\true'),=(__realmod,__mod)),','(:(flrcanon,show_rule_by_id(__r,__fn,__realmod,__h,__body)),','(:(flrdescriptor_support,is_strict_rule(__r,__fn,__realmod)),fllibmodlit(libmod_wrapper,__body,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))),fllibexecute_delayed_calls([__body,__fn,__h,__mod,__r,__realmod],[__fn,__h,__mod,__r])))).
:-(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(beaten1,'atco3.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(__r,__fn,__h,__newdontcarevar3,__newdontcarevar4,__newdontcarevar5,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),fllibexecute_delayed_calls([__newdontcarevar8,__fn,__h,__mod,__r],[__fn,__h,__mod,__r])))).
:-(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(__r,__fn,__h,__strictR,__fnstrict,__strictH,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(beaten2,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(candidate)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(opposing_rules)(__r,__fn,__h,__strictR,__fnstrict,__strictH,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),';'(->(','('_$_$_ergo''_opposes_aux'(__mod,__newdontcarevar7,__h,__newdontcarevar8,__strictH),:(flrstorageutils,'\\isbasefact'(__strictH))),'\\true'),','(FLORA_THIS_WORKSPACE(opposing_rules)(__r,__fn,__h,__strictR,__fnstrict,__strictH,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),FLORA_THIS_WORKSPACE(strict_candidate)(__strictR,__fnstrict,__strictH,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)))))),fllibexecute_delayed_calls([__newdontcarevar13,__fn,__fnstrict,__h,__mod,__r,__strictH,__strictR],[__fn,__fnstrict,__h,__mod,__r,__strictH,__strictR])))).
:-(FLORA_THIS_WORKSPACE(strongcandicate)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(strongcand1,'atco3.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(candidate)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(overriden_cancellation_rule)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__fn,__h,__mod,__r],[]))),[],298,'atco3.flr'))))).
:-(FLORA_THIS_WORKSPACE(beats_lit_rule)(__q,__rh,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(beatlit1,'atco3.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(dominates_lit_rule)(__q,__rh,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(beats_lit_rule)(__q,__rh,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(beatlit2,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''refutablebodylit'(__rh,__fn,__h,__mod,__bi),FLORA_THIS_WORKSPACE(beats_lit_lit)(__q,__bi,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),fllibexecute_delayed_calls([__bi,__fn,__h,__mod,__q,__rh],[__fn,__h,__mod,__q,__rh])))).
:-(FLORA_THIS_WORKSPACE(beats_lit_lit)(__q,__bi,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(beatlit3,'atco3.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(stronglit)(__bi,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(!,flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(not_beats_supported_argument)(__q,__bi,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__bi,__mod,__q],[]))),[],320,'atco3.flr')))))).
:-(FLORA_THIS_WORKSPACE(beats_lit_lit)(__q,__nafbodylit,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(beatlit4,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(naf_literal)(__nafbodylit,__bodylit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''bodyinfo'(___rb,___fn,__bodylit,__mod,__modified_body),FLORA_THIS_WORKSPACE(dispatch_refutable_bodylits)(__modified_body,__mod,__q,beats_lit_lit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([___fn,___rb,__bodylit,__mod,__modified_body,__nafbodylit,__q],[__mod,__nafbodylit,__q])))).
:-(FLORA_THIS_WORKSPACE(not_beats_supported_argument)(__lit1,__lit2,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(notbeats,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(supportedattackingargument)(__r2,__fn2,__lit2,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(beats_lit_rule)(__lit1,__r2,__fn2,__lit2,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__fn2,__lit1,__lit2,__mod,__r2],[]))),[],348,'atco3.flr'))),fllibexecute_delayed_calls([__fn2,__lit1,__lit2,__mod,__r2],[__lit1,__lit2,__mod])))).
:-(FLORA_THIS_WORKSPACE(supportedattackingargument)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(sarg1,'atco3.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(attemptedsupportedattackingargument)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(overriden_cancellation_rule)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__fn,__h,__mod,__r],[]))),[],356,'atco3.flr'))))).
:-(FLORA_THIS_WORKSPACE(supportedcounterattackingargument)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(sarg2,'atco3.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(attemptedsupportedcounterattackingargument)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(overriden_cancellation_rule)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__fn,__h,__mod,__r],[]))),[],365,'atco3.flr'))))).
:-(FLORA_THIS_WORKSPACE(attemptedsupportedattackingargument)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(attempt1,'atco3.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(no_refutable_bodylits)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(!,';'(FLORA_THIS_WORKSPACE(candidate)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),';'(FLORA_THIS_WORKSPACE(strict_candidate)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),:(flrstorageutils,'\\isbasefact'(__h)))))))).
:-(FLORA_THIS_WORKSPACE(attemptedsupportedattackingargument)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(attempt2,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''bodyinfo'(__r,__fn,__h,__mod,__modified_body),','(FLORA_THIS_WORKSPACE(dispatch_irrefutable_bodylits)(__modified_body,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(dispatch_refutable_bodylits)(__modified_body,__mod,___ext_lit,'ATCO_ATTEMPTEDSUPPORTED_ATTACKING_ARG','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([___ext_lit,__fn,__h,__mod,__modified_body,__r],[__fn,__h,__mod,__r])))).
:-(FLORA_THIS_WORKSPACE(attemptedsupportedcounterattackingargument)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(attemptcounter1,'atco3.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(no_refutable_bodylits)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(!,';'(FLORA_THIS_WORKSPACE(candidate)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),';'(FLORA_THIS_WORKSPACE(strict_candidate)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),:(flrstorageutils,'\\isbasefact'(__h)))))))).
:-(FLORA_THIS_WORKSPACE(attemptedsupportedcounterattackingargument)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(attemptcounter2,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''bodyinfo'(__r,__fn,__h,__mod,__modified_body),','(FLORA_THIS_WORKSPACE(dispatch_irrefutable_bodylits)(__modified_body,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(dispatch_refutable_bodylits)(__modified_body,__mod,___ext_lit,'ATCO_ATTEMPTEDSUPPORTED_COUNTER_ATTACKING_ARG','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([___ext_lit,__fn,__h,__mod,__modified_body,__r],[__fn,__h,__mod,__r])))).
:-(FLORA_THIS_WORKSPACE(hassupportedattackingargument)(__bodylit,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(hassup1,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(stronglit)(__bodylit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(!,FLORA_THIS_WORKSPACE(supportedattackingargument)(___r,___fn,__bodylit,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([___fn,___r,__bodylit,__mod],[__bodylit,__mod])))).
:-(FLORA_THIS_WORKSPACE(hassupportedattackingargument)(__naflit,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(hassup2,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(naf_literal)(__naflit,__lit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''refutablebodylit'(___r,___fn,__lit,__mod,__nafbodylit),','(FLORA_THIS_WORKSPACE(naf_literal)(__nafbodylit,__bodylit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(hassupportedattackingargument)(__bodylit,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(undermined1,__bodylit,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),fllibexecute_delayed_calls([__bodylit,__mod],[]))),[],441,'atco3.flr')))))),fllibexecute_delayed_calls([___fn,___r,__bodylit,__lit,__mod,__nafbodylit,__naflit],[__mod,__naflit])))).
:-(FLORA_THIS_WORKSPACE(hassupportedcounterattackingargument)(__bodylit,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(hassup3,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(stronglit)(__bodylit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(!,FLORA_THIS_WORKSPACE(supportedcounterattackingargument)(___r,___fn,__bodylit,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([___fn,___r,__bodylit,__mod],[__bodylit,__mod])))).
:-(FLORA_THIS_WORKSPACE(hassupportedcounterattackingargument)(__naflit,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(hassup4,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(naf_literal)(__naflit,__lit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''refutablebodylit'(___r,___fn,__lit,__mod,__nafbodylit),','(FLORA_THIS_WORKSPACE(naf_literal)(__nafbodylit,__bodylit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(hassupportedcounterattackingargument)(__bodylit,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(undermined2,__bodylit,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),fllibexecute_delayed_calls([__bodylit,__mod],[]))),[],467,'atco3.flr')))))),fllibexecute_delayed_calls([___fn,___r,__bodylit,__lit,__mod,__nafbodylit,__naflit],[__mod,__naflit])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(undermined1,__bodylit,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(undermined1,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(stronglit)(__bodylit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(opposing_rules)(__newdontcarevar5,__newdontcarevar6,__bodylit,__newdontcarevar7,__newdontcarevar8,__opposing_lit,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(not_beats2_supported_argument)(__bodylit,__opposing_lit,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)),fllibexecute_delayed_calls([__bodylit,__mod,__opposing_lit],[]))),[],475,'atco3.flr')))),fllibexecute_delayed_calls([__newdontcarevar13,__bodylit,__mod,__opposing_lit],[__bodylit,__mod])))).
:-(FLORA_THIS_WORKSPACE(not_beats2_supported_argument)(__bodylit,__opposing_lit,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(notbeats2,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(supportedattackingargument)(__r,__fn,__bodylit,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(beats2_lit_rule)(__opposing_lit,__r,__fn,__bodylit,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__bodylit,__fn,__mod,__opposing_lit,__r],[]))),[],480,'atco3.flr'))),fllibexecute_delayed_calls([__bodylit,__fn,__mod,__opposing_lit,__r],[__bodylit,__mod,__opposing_lit])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(undermined2,__bodylit,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(undermined2,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(opposing_rules)(__newdontcarevar3,__newdontcarevar4,__bodylit,__opposing_r,__opposing_fn,__opposing_lit,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(supportedattackingargument)(__opposing_r,__opposing_fn,__opposing_lit,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(beats2_lit_rule)(__bodylit,__opposing_r,__opposing_fn,__opposing_lit,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),fllibexecute_delayed_calls([__bodylit,__mod,__opposing_fn,__opposing_lit,__opposing_r],[]))),[],486,'atco3.flr')))),fllibexecute_delayed_calls([__newdontcarevar11,__bodylit,__mod,__opposing_fn,__opposing_lit,__opposing_r],[__bodylit,__mod])))).
:-(FLORA_THIS_WORKSPACE(beats2_lit_rule)(__h,__r1,__fn1,__h1,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(beat2lit1,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(supportedcounterattackingargument)(__r,__fn,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(atco_overrides)(__r,__fn,__h,__r1,__fn1,__h1,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))),fllibexecute_delayed_calls([__fn,__fn1,__h,__h1,__mod,__r,__r1],[__fn1,__h,__h1,__mod,__r1])))).
:-(FLORA_THIS_WORKSPACE(beats2_lit_rule)(__h,__r1,__fn1,__h1,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(beat2lit2,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''refutablebodylit'(__r1,__fn1,__h1,__mod,__b1),FLORA_THIS_WORKSPACE(beats2_lit_lit)(__h,__b1,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),fllibexecute_delayed_calls([__b1,__fn1,__h,__h1,__mod,__r1],[__fn1,__h,__h1,__mod,__r1])))).
:-(FLORA_THIS_WORKSPACE(beats2_lit_lit)(__h,__bodylit,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(beat2lit3,'atco3.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(stronglit)(__bodylit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(not_beats2_supported_argument)(__bodylit,__h,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__bodylit,__h,__mod],[]))),[],501,'atco3.flr'))))).
:-(FLORA_THIS_WORKSPACE(beats2_lit_lit)(__h,__naflit,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(beat2lit4,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(naf_literal)(__naflit,__lit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''bodyinfo'(___rlit,___fn,__lit,__mod,__modified_body),FLORA_THIS_WORKSPACE(dispatch_refutable_bodylits)(__modified_body,__mod,__h,'ATCO_BEATS2_LIT_LIT','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([___fn,___rlit,__h,__lit,__mod,__modified_body,__naflit],[__h,__mod,__naflit])))).
:-(FLORA_THIS_WORKSPACE(atco_overrides)(__r1,__fn1,__h1,__r2,__fn2,__h2,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(atco_ov1,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','(';'(->(vars_storage(__vars1),'\\true'),'\\true'),','(:(flrdescriptor_support,get_tag_descriptor_info_with_rulehead(__r1,__fn1,__mod,__t1,__h1,__vars1)),','(';'(->(vars_storage(__vars2),'\\true'),'\\true'),','(:(flrdescriptor_support,get_tag_descriptor_info_with_rulehead(__r2,__fn2,__mod,__t2,__h2,__vars2)),'_$_$_ergo''_overrides_aux'(__mod,__t1,__h1,__t2,__h2))))),fllibexecute_delayed_calls([__fn1,__fn2,__h1,__h2,__mod,__r1,__r2,__t1,__t2,__vars1,__vars2],[__fn1,__fn2,__h1,__h2,__mod,__r1,__r2])))).
:-(FLORA_THIS_WORKSPACE(naf_literal)(__NegArg,__Positive,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(naflit1,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','(=(__NegArg,fllibdelayedliteral(default_negation,__newdontcarevar3,__newdontcarevar4,[__Negated,__newdontcarevar5,__newdontcarevar6])),','(FLORA_THIS_WORKSPACE(d^tblflapply)(arg,1,__Negated,__NegWrapped,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),','(!,:(flrnegation,flora_unwrap_negation(__NegWrapped,__Positive))))),fllibexecute_delayed_calls([__NegArg,__NegWrapped,__Negated,__Positive,__newdontcarevar9],[__NegArg,__Positive])))).
:-(FLORA_THIS_WORKSPACE(naf_literal)(__NegWrapped,__Positive,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(naflit2,'atco3.flr',FLORA_THIS_MODULE_NAME),','(:(flrnegation,flora_unwrap_negation(__NegWrapped,__Positive)),\=(__NegWrapped,__Positive)))).
:-(FLORA_THIS_WORKSPACE(stronglit)(__lit,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(stronglit1,'atco3.flr',FLORA_THIS_MODULE_NAME),','(\+(FLORA_THIS_WORKSPACE(naf_literal)(__lit,__newdontcarevar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5))),fllibexecute_delayed_calls([__newdontcarevar6,__lit],[__lit])))).
:-(FLORA_THIS_WORKSPACE(headlit)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(headlit1,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','(';'(->(vars_storage(__vars),'\\true'),'\\true'),:(flrdescriptor_support,get_tag_descriptor_info_with_rulehead(__r,__fn,__mod,__newdontcarevar3,__h,__vars))),fllibexecute_delayed_calls([__newdontcarevar4,__fn,__h,__mod,__r,__vars],[__fn,__h,__mod,__r])))).
:-(FLORA_THIS_WORKSPACE(no_refutable_bodylits)(__r,__fn,__h,__mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(norefutbody1,'atco3.flr',FLORA_THIS_MODULE_NAME),','(\+('_$_$_ergo''refutablebodylit'(__r,__fn,__h,__mod,__newdontcarevar3)),fllibexecute_delayed_calls([__newdontcarevar4,__fn,__h,__mod,__r],[__fn,__h,__mod,__r])))).
:-(FLORA_THIS_WORKSPACE(dispatch_refutable_bodylits)(__newvar1,__mod,__ExtLit,__CtlVar,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(dispatch1,'atco3.flr',FLORA_THIS_MODULE_NAME),','(fllibuniveqform(__newvar1,atco_bodylit_wrapper(__bodylit)),','(!,FLORA_THIS_WORKSPACE(dispatch_one_refutable_bodylit)(__CtlVar,__ExtLit,__mod,__bodylit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)))))).
:-(FLORA_THIS_WORKSPACE(dispatch_refutable_bodylits)(','(__newvar1,__rest),__mod,__ExtLit,__CtlVar,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(dispatch2,'atco3.flr',FLORA_THIS_MODULE_NAME),','(fllibuniveqform(__newvar1,atco_bodylit_wrapper(__bodylit)),','(!,','(FLORA_THIS_WORKSPACE(dispatch_one_refutable_bodylit)(__CtlVar,__ExtLit,__mod,__bodylit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),FLORA_THIS_WORKSPACE(dispatch_refutable_bodylits)(__rest,__mod,__ExtLit,__CtlVar,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7))))))).
FLORA_THIS_WORKSPACE(dispatch_refutable_bodylits)(___bodylits,___mod,___ExtLit,___CtlVar,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)).
:-(FLORA_THIS_WORKSPACE(dispatch_irrefutable_bodylits)(','(__newvar1,___rest),'_$ctxt'(_CallerModuleVar,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''rule_enabled'(dispatch_irrefut1,'atco3.flr',FLORA_THIS_MODULE_NAME),','(fllibuniveqform(__newvar1,atco_bodylit_wrapper(__newdontcarevar2)),!))).
:-(FLORA_THIS_WORKSPACE(dispatch_irrefutable_bodylits)(__newvar1,'_$ctxt'(_CallerModuleVar,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''rule_enabled'(4,'atco3.flr',FLORA_THIS_MODULE_NAME),','(fllibuniveqform(__newvar1,atco_bodylit_wrapper(__newdontcarevar2)),!))).
:-(FLORA_THIS_WORKSPACE(dispatch_irrefutable_bodylits)(','(__lit,__rest),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(6,'atco3.flr',FLORA_THIS_MODULE_NAME),','(!,','(fllibmodlit(libmod_wrapper,__lit,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(dispatch_irrefutable_bodylits)(__rest,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))))).
:-(FLORA_THIS_WORKSPACE(dispatch_irrefutable_bodylits)(__lit,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(dispatch_irrefut2,'atco3.flr',FLORA_THIS_MODULE_NAME),fllibmodlit(libmod_wrapper,__lit,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(dispatch_one_refutable_bodylit)('ATCO_ATTEMPTEDSUPPORTED_ATTACKING_ARG',___extern,__mod,__bodylit,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(dispatchone1,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','(!,','(FLORA_THIS_WORKSPACE(hassupportedattackingargument)(__bodylit,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(undermined1,__bodylit,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__bodylit,__mod],[]))),[],596,'atco3.flr')))),fllibexecute_delayed_calls([__bodylit,__mod],[___extern,__bodylit,__mod])))).
:-(FLORA_THIS_WORKSPACE(dispatch_one_refutable_bodylit)('ATCO_ATTEMPTEDSUPPORTED_COUNTER_ATTACKING_ARG',___extern,__mod,__bodylit,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(dispatchone2,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','(!,','(FLORA_THIS_WORKSPACE(hassupportedcounterattackingargument)(__bodylit,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(undermined2,__bodylit,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__bodylit,__mod],[]))),[],601,'atco3.flr')))),fllibexecute_delayed_calls([__bodylit,__mod],[___extern,__bodylit,__mod])))).
:-(FLORA_THIS_WORKSPACE(dispatch_one_refutable_bodylit)(beats_lit_lit,__extern_lit,__mod,__bodylit,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(dispatchone3,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','(!,','(FLORA_THIS_WORKSPACE(naf_literal)(__bodylit,__posbodylit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(beats_lit_lit)(__extern_lit,__posbodylit,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__bodylit,__extern_lit,__mod,__posbodylit],[__bodylit,__extern_lit,__mod])))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(change_module,4,FLORA_THIS_MODULE_NAME),prolog(change_module_nocheck,4,FLORA_THIS_MODULE_NAME),prolog(check_module_to_AT_association,1,FLORA_THIS_MODULE_NAME)]))).
:-(FLORA_THIS_WORKSPACE(change_module)(__InA,__Mod,__RealNewMod,__OutA,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(8,'change_module.flh',FLORA_THIS_MODULE_NAME),','(:(flrwrapper,flora_change_module(__InA,__OutA,','(FLORA_THIS_MODULE_NAME,__Mod),__RealNewMod,['In ',status,'(Tag,Head)[...]@',FLORA_THIS_MODULE_NAME,': Head must be bound'])),FLORA_THIS_WORKSPACE(check_module_to_AT_association)(__RealNewMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))).
:-(FLORA_THIS_WORKSPACE(change_module_nocheck)(__InA,__newdontcarevar1,__newdontcarevar2,__OutA,'_$ctxt'(_CallerModuleVar,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''rule_enabled'(10,'change_module.flh',FLORA_THIS_MODULE_NAME),','(:(flrdatatype,flora_is_var_prim(__InA)),','(!,=(__OutA,__InA))))).
:-(FLORA_THIS_WORKSPACE(change_module_nocheck)(__InA,__Mod,__RealNewMod,__OutA,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(12,'change_module.flh',FLORA_THIS_MODULE_NAME),','(:(flrwrapper,flora_change_module(__InA,__OutA,','(FLORA_THIS_MODULE_NAME,__Mod),__RealNewMod,'In defeated/overrides/opposes: something wrong')),FLORA_THIS_WORKSPACE(check_module_to_AT_association)(__RealNewMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))).
:-(FLORA_THIS_WORKSPACE(check_module_to_AT_association)(__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(14,'change_module.flh',FLORA_THIS_MODULE_NAME),','(:(flrwrapper,flora_is_system_module_name(__Mod)),','(!,'\\false')))).
:-(FLORA_THIS_WORKSPACE(check_module_to_AT_association)(__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(16,'change_module.flh',FLORA_THIS_MODULE_NAME),','(\+(:(flrregistry,flora_defeasible_module_registry(__Mod,FLORA_THIS_MODULE_NAME))),','(\==(__Mod,FLORA_THIS_MODULE_NAME),','(!,FLORA_WORKSPACE(\\system,d^tblflapply)(sysabort,['User module ',__Mod,' is not associated with the argumentation theory residing in module ',FLORA_THIS_MODULE_NAME],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))))).
:-(FLORA_THIS_WORKSPACE(check_module_to_AT_association)(__newdontcarevar1,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(18,'change_module.flh',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,__r,__fn,__h),howDefeated,flapply(ruleRefutedBy,__refuter,__refuter_fn),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(20,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__mod),','(FLORA_THIS_WORKSPACE(change_module)(__h,__mod,___realMod,__hm,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(refuted)(__r,__fn,__hm,__refuter,__refuter_fn,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([___realMod,__fn,__h,__hm,__mod,__r,__refuter,__refuter_fn],[__fn,__h,__r,__refuter,__refuter_fn])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,__r,___fn,__h),howDefeated,flapply(literalRefutedBy,__refuter,__refuter_fn),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(22,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__mod),','(FLORA_THIS_WORKSPACE(change_module)(__h,__mod,___realMod,__hm,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(refuted)(__r2,___fn2,__hm,__refuter,__refuter_fn,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),\=(__r2,__r)))),fllibexecute_delayed_calls([___fn2,___realMod,__h,__hm,__mod,__r,__r2,__refuter,__refuter_fn],[___fn,__h,__r,__refuter,__refuter_fn])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,__r,__fn,__h),howDefeated,flapply(beatenByStrictRule,__strictR,__strict_fn),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(24,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__mod),','(FLORA_THIS_WORKSPACE(change_module)(__h,__mod,___realMod,__hm,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(__r,__fn,__hm,__strictR,__strict_fn,___strictH,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([___realMod,___strictH,__fn,__h,__hm,__mod,__r,__strictR,__strict_fn],[__fn,__h,__r,__strictR,__strict_fn])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,__r,__fn,__h),howDefeated,canceled,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(26,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__mod),','(FLORA_THIS_WORKSPACE(change_module)(__h,__mod,___realMod,__hm,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(disqualified_rule)(__r,__fn,__hm,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(__r,__fn,__hm,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),fllibexecute_delayed_calls([__fn,__hm,__mod,__r],[]))),[],633,'atco3.flr'))))),fllibexecute_delayed_calls([___realMod,__fn,__h,__hm,__mod,__r],[__fn,__h,__r])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(status,___r,___fn,__h),howDefeated,disqualifiedLiteral,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(28,'atco3.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__mod),','(FLORA_THIS_WORKSPACE(change_module)(__h,__mod,___realMod,__hm,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(disqualified_lit)(__hm,__mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([___realMod,__h,__hm,__mod],[___fn,___r,__h])))).

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
#define FLORA_FLS2_FILENAME  'atco3.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('atco3.ergo',FLORA_THIS_MODULE_NAME))).

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

:-(FLORA_THIS_WORKSPACE(\\undefeated)(_h977080,_h977082,_h977084,_h977086,_h977088,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(\\undefeated))(_h977080,_h977082,_h977084,_h977086,_h977088,FWContext)).
:-(FLORA_THIS_WORKSPACE(atco_overrides)(_h977733,_h977735,_h977737,_h977739,_h977741,_h977743,_h977745,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(atco_overrides))(_h977733,_h977735,_h977737,_h977739,_h977741,_h977743,_h977745,FWContext)).
:-(FLORA_THIS_WORKSPACE(attemptedsupportedattackingargument)(_h978428,_h978430,_h978432,_h978434,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(attemptedsupportedattackingargument))(_h978428,_h978430,_h978432,_h978434,FWContext)).
:-(FLORA_THIS_WORKSPACE(attemptedsupportedcounterattackingargument)(_h979447,_h979449,_h979451,_h979453,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(attemptedsupportedcounterattackingargument))(_h979447,_h979449,_h979451,_h979453,FWContext)).
:-(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(_h980578,_h980580,_h980582,_h980584,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beaten_by_strict_rule))(_h980578,_h980580,_h980582,_h980584,FWContext)).
:-(FLORA_THIS_WORKSPACE(beaten_by_strict_rule)(_h981373,_h981375,_h981377,_h981379,_h981381,_h981383,_h981385,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beaten_by_strict_rule))(_h981373,_h981375,_h981377,_h981379,_h981381,_h981383,_h981385,FWContext)).
:-(FLORA_THIS_WORKSPACE(beats2_lit_lit)(_h982180,_h982182,_h982184,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beats2_lit_lit))(_h982180,_h982182,_h982184,FWContext)).
:-(FLORA_THIS_WORKSPACE(beats2_lit_rule)(_h982859,_h982861,_h982863,_h982865,_h982867,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beats2_lit_rule))(_h982859,_h982861,_h982863,_h982865,_h982867,FWContext)).
:-(FLORA_THIS_WORKSPACE(beats_lit_lit)(_h983562,_h983564,_h983566,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beats_lit_lit))(_h983562,_h983564,_h983566,FWContext)).
:-(FLORA_THIS_WORKSPACE(beats_lit_rule)(_h984225,_h984227,_h984229,_h984231,_h984233,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(beats_lit_rule))(_h984225,_h984227,_h984229,_h984231,_h984233,FWContext)).
:-(FLORA_THIS_WORKSPACE(candidate)(_h984912,_h984914,_h984916,_h984918,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(candidate))(_h984912,_h984914,_h984916,_h984918,FWContext)).
:-(FLORA_THIS_WORKSPACE(change_module)(_h985515,_h985517,_h985519,_h985521,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(change_module))(_h985515,_h985517,_h985519,_h985521,FWContext)).
:-(FLORA_THIS_WORKSPACE(change_module_nocheck)(_h986182,_h986184,_h986186,_h986188,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(change_module_nocheck))(_h986182,_h986184,_h986186,_h986188,FWContext)).
:-(FLORA_THIS_WORKSPACE(check_module_to_AT_association)(_h986977,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(check_module_to_AT_association))(_h986977,FWContext)).
:-(FLORA_THIS_WORKSPACE(defeated_lit)(_h987904,_h987906,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(defeated_lit))(_h987904,_h987906,FWContext)).
:-(FLORA_THIS_WORKSPACE(defeated_rule)(_h988547,_h988549,_h988551,_h988553,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(defeated_rule))(_h988547,_h988549,_h988551,_h988553,FWContext)).
:-(FLORA_THIS_WORKSPACE(dispatch_irrefutable_bodylits)(_h989214,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(dispatch_irrefutable_bodylits))(_h989214,FWContext)).
:-(FLORA_THIS_WORKSPACE(dispatch_one_refutable_bodylit)(_h990125,_h990127,_h990129,_h990131,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(dispatch_one_refutable_bodylit))(_h990125,_h990127,_h990129,_h990131,FWContext)).
:-(FLORA_THIS_WORKSPACE(dispatch_refutable_bodylits)(_h991064,_h991066,_h991068,_h991070,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(dispatch_refutable_bodylits))(_h991064,_h991066,_h991068,_h991070,FWContext)).
:-(FLORA_THIS_WORKSPACE(disqualified_lit)(_h991955,_h991957,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(disqualified_lit))(_h991955,_h991957,FWContext)).
:-(FLORA_THIS_WORKSPACE(disqualified_rule)(_h992662,_h992664,_h992666,_h992668,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(disqualified_rule))(_h992662,_h992664,_h992666,_h992668,FWContext)).
:-(FLORA_THIS_WORKSPACE(dominates_lit_lit)(_h993393,_h993395,_h993397,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(dominates_lit_lit))(_h993393,_h993395,_h993397,FWContext)).
:-(FLORA_THIS_WORKSPACE(dominates_lit_rule)(_h994120,_h994122,_h994124,_h994126,_h994128,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(dominates_lit_rule))(_h994120,_h994122,_h994124,_h994126,_h994128,FWContext)).
:-(FLORA_THIS_WORKSPACE(dominates_rule_lit)(_h994871,_h994873,_h994875,_h994877,_h994879,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(dominates_rule_lit))(_h994871,_h994873,_h994875,_h994877,_h994879,FWContext)).
:-(FLORA_THIS_WORKSPACE(exists_cand_not_overridden)(_h995622,_h995624,_h995626,_h995628,_h995630,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(exists_cand_not_overridden))(_h995622,_h995624,_h995626,_h995628,_h995630,FWContext)).
:-(FLORA_THIS_WORKSPACE(hassupportedattackingargument)(_h996501,_h996503,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(hassupportedattackingargument))(_h996501,_h996503,FWContext)).
:-(FLORA_THIS_WORKSPACE(hassupportedcounterattackingargument)(_h997416,_h997418,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(hassupportedcounterattackingargument))(_h997416,_h997418,FWContext)).
:-(FLORA_THIS_WORKSPACE(headlit)(_h998443,_h998445,_h998447,_h998449,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(headlit))(_h998443,_h998445,_h998447,_h998449,FWContext)).
:-(FLORA_THIS_WORKSPACE(naf_literal)(_h999014,_h999016,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(naf_literal))(_h999014,_h999016,FWContext)).
:-(FLORA_THIS_WORKSPACE(no_refutable_bodylits)(_h999641,_h999643,_h999645,_h999647,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(no_refutable_bodylits))(_h999641,_h999643,_h999645,_h999647,FWContext)).
:-(FLORA_THIS_WORKSPACE(not_beats2_supported_argument)(_h1000436,_h1000438,_h1000440,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(not_beats2_supported_argument))(_h1000436,_h1000438,_h1000440,FWContext)).
:-(FLORA_THIS_WORKSPACE(not_beats_supported_argument)(_h1001355,_h1001357,_h1001359,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(not_beats_supported_argument))(_h1001355,_h1001357,_h1001359,FWContext)).
:-(FLORA_THIS_WORKSPACE(not_disqualified_rule)(_h1002258,_h1002260,_h1002262,_h1002264,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(not_disqualified_rule))(_h1002258,_h1002260,_h1002262,_h1002264,FWContext)).
:-(FLORA_THIS_WORKSPACE(opposing_rules)(_h1003053,_h1003055,_h1003057,_h1003059,_h1003061,_h1003063,_h1003065,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(opposing_rules))(_h1003053,_h1003055,_h1003057,_h1003059,_h1003061,_h1003063,_h1003065,FWContext)).
:-(FLORA_THIS_WORKSPACE(overriden_cancellation_rule)(_h1003748,_h1003750,_h1003752,_h1003754,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(overriden_cancellation_rule))(_h1003748,_h1003750,_h1003752,_h1003754,FWContext)).
:-(FLORA_THIS_WORKSPACE(refuted)(_h1004639,_h1004641,_h1004643,_h1004645,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(refuted))(_h1004639,_h1004641,_h1004643,_h1004645,FWContext)).
:-(FLORA_THIS_WORKSPACE(refuted)(_h1005210,_h1005212,_h1005214,_h1005216,_h1005218,_h1005220,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(refuted))(_h1005210,_h1005212,_h1005214,_h1005216,_h1005218,_h1005220,FWContext)).
:-(FLORA_THIS_WORKSPACE(strict_candidate)(_h1005789,_h1005791,_h1005793,_h1005795,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(strict_candidate))(_h1005789,_h1005791,_h1005793,_h1005795,FWContext)).
:-(FLORA_THIS_WORKSPACE(strongcandicate)(_h1006504,_h1006506,_h1006508,_h1006510,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(strongcandicate))(_h1006504,_h1006506,_h1006508,_h1006510,FWContext)).
:-(FLORA_THIS_WORKSPACE(stronglit)(_h1007203,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(stronglit))(_h1007203,FWContext)).
:-(FLORA_THIS_WORKSPACE(supportedattackingargument)(_h1007794,_h1007796,_h1007798,_h1007800,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(supportedattackingargument))(_h1007794,_h1007796,_h1007798,_h1007800,FWContext)).
:-(FLORA_THIS_WORKSPACE(supportedcounterattackingargument)(_h1008669,_h1008671,_h1008673,_h1008675,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(supportedcounterattackingargument))(_h1008669,_h1008671,_h1008673,_h1008675,FWContext)).
