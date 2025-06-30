
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
#define FLORA_THIS_FILENAME  'ergo_explain.ergo'
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
  file: syslibinc/flrload_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBLOAD))).

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
  file: libinc/flrbasetype_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(':'(flrlibman,flora_load_system_module(FLSYSMODBASETYPE))).

/***********************************************************************/

/************************************************************************
  file: libinc/flrchange_module_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(':'(flrlibman,flora_load_system_module(FLCHANGEMODULE))).

/***********************************************************************/

/************************************************************************
  file: ergo_libinc/fidjiUtils_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Ergo compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(':'(flrlibman,flora_load_system_module(ERGO_STUDIO_MODULE))).

/***********************************************************************/

/************************************************************************
  file: libinc/flrshow_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(':'(flrlibman,flora_load_system_module(FLSYSMODSHOW))).

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

:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(all_support)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(all_support)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(all_support)(_h1344912,_h1344914,_h1344916,_h1344918,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(all_support))(_h1344912,_h1344914,_h1344916,_h1344918,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(change_module_if_match)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(change_module_if_match)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(change_module_if_match)(_h1345552,_h1345554,_h1345556,_h1345558,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(change_module_if_match))(_h1345552,_h1345554,_h1345556,_h1345558,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(check_callable)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(check_callable)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(check_callable)(_h1346368,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(check_callable))(_h1346368,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(check_justification_type)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(check_justification_type)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(check_justification_type)(_h1347044,_h1347046,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(check_justification_type))(_h1347044,_h1347046,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(childOfDefeated)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(childOfDefeated)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(childOfDefeated)(_h1347884,_h1347886,_h1347888,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(childOfDefeated))(_h1347884,_h1347886,_h1347888,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(choose_rule_text)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(choose_rule_text)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(choose_rule_text)(_h1348584,_h1348586,_h1348588,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(choose_rule_text))(_h1348584,_h1348586,_h1348588,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(convert_to_text)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(convert_to_text)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(convert_to_text)(_h1349300,_h1349302,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(convert_to_text))(_h1349300,_h1349302,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(explanation2json)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(explanation2json)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(explanation2json)(_h1349996,_h1349998,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(explanation2json))(_h1349996,_h1349998,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(explanationSupport2json)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(explanationSupport2json)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(explanationSupport2json)(_h1350708,_h1350710,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(explanationSupport2json))(_h1350708,_h1350710,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(full_support_info)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(full_support_info)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(full_support_info)(_h1351532,_h1351534,_h1351536,_h1351538,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(full_support_info))(_h1351532,_h1351534,_h1351536,_h1351538,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(get_justification_type)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(get_justification_type)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(get_justification_type)(_h1352268,_h1352270,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(get_justification_type))(_h1352268,_h1352270,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(get_rule_text)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(get_rule_text)),5)),FLORA_FLEX_DYNAMIC_TYPE_CLAUSE))).
:-(FLORA_THIS_WORKSPACE(get_rule_text)(_h1353076,_h1353078,_h1353080,_h1353082,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(get_rule_text))(_h1353076,_h1353078,_h1353080,_h1353082,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(goal_NOT_to_ignore)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(goal_NOT_to_ignore)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(goal_NOT_to_ignore)(_h1353748,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(goal_NOT_to_ignore))(_h1353748,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(ignored_goal)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(ignored_goal)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(ignored_goal)(_h1354488,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(ignored_goal))(_h1354488,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(immediate_support)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(immediate_support)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(immediate_support)(_h1355132,_h1355134,_h1355136,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(immediate_support))(_h1355132,_h1355134,_h1355136,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(immediate_support_internal)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(immediate_support_internal)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(immediate_support_internal)(_h1355864,_h1355866,_h1355868,_h1355870,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(immediate_support_internal))(_h1355864,_h1355866,_h1355868,_h1355870,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(justificationTreeFunction)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(justificationTreeFunction)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(justificationTreeFunction)(_h1356744,_h1356746,_h1356748,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(justificationTreeFunction))(_h1356744,_h1356746,_h1356748,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(paraphrase)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(paraphrase)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(paraphrase)(_h1357604,_h1357606,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(paraphrase))(_h1357604,_h1357606,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(printable_axiom)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(printable_axiom)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(printable_axiom)(_h1358220,_h1358222,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(printable_axiom))(_h1358220,_h1358222,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(size_of_explanation)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(size_of_explanation)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(size_of_explanation)(_h1358916,_h1358918,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(size_of_explanation))(_h1358916,_h1358918,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(support_info)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(support_info)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(support_info)(_h1359676,_h1359678,_h1359680,_h1359682,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(support_info))(_h1359676,_h1359678,_h1359680,_h1359682,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(support_object_is_not_aggregate_body)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(support_object_is_not_aggregate_body)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(support_object_is_not_aggregate_body)(_h1360332,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(support_object_is_not_aggregate_body))(_h1360332,FWContext)).
 
#if !defined(FLORA_FDB_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FDB_FILENAME  'ergo_explain.fdb'
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
#define FLORA_FLM_FILENAME  'ergo_explain.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(ergo_explain,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'ergo_explain.fld'
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
#define FLORA_FLS_FILENAME  'ergo_explain.fls'
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

?-(:(flrprolog,flora_define_modular_prolog([prolog(justificationTreeFunction,3,FLORA_THIS_MODULE_NAME),prolog(change_module_if_match,4,FLORA_THIS_MODULE_NAME)]))).
:-(fllibexport([[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar1,support,__newdontcarevar2,__newcontextvar5))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar6,why,__newdontcarevar7,__newcontextvar10))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar11,flapply(why,__newdontcarevar12),__newdontcarevar13,__newcontextvar16))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar17,flapply(why,__newdontcarevar18,__newdontcarevar19),__newdontcarevar20,__newcontextvar23))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar24,goal,__newdontcarevar25,__newcontextvar28))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar29,text,__newdontcarevar30,__newcontextvar33))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar34,info,__newdontcarevar35,__newcontextvar38))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar39,reason,__newdontcarevar40,__newcontextvar43))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar44,rule,__newdontcarevar45,__newcontextvar48))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar49,size,__newdontcarevar50,__newcontextvar53))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar54,isleaf,__newcontextvar57))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar58,toJson,__newdontcarevar59,__newcontextvar62))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^nontblflapply)(set_max_explanation_depth,__newdontcarevar63,__newcontextvar66))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^nontblflapply)(clear_max_explanation_depth,__newcontextvar69))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^nontblflapply)(get_max_explanation_depth,__newdontcarevar70,__newcontextvar73))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^nontblflapply)(ignore_repeated_subgoals,__newcontextvar76))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^nontblflapply)(expand_repeated_subgoals,__newcontextvar79))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(use_unsorted_explanations,__newcontextvar82))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(use_sorted_explanations,__newcontextvar85))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(using_sorted_explanations,__newcontextvar88))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(using_unsorted_explanations,__newcontextvar91))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(ensure_loaded,__newcontextvar94))]])).
:-(fllibexport([[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^nontblflapply)(textify,__newdontcarevar1,__newdontcarevar2,__newcontextvar5))]])).
?-(:(flrprolog,flora_define_modular_prolog([prolog(childOfDefeated,3,FLORA_THIS_MODULE_NAME),prolog(convert_to_text,2,FLORA_THIS_MODULE_NAME),prolog(check_callable,1,FLORA_THIS_MODULE_NAME),prolog(support_info,4,FLORA_THIS_MODULE_NAME),prolog(size_of_explanation,2,FLORA_THIS_MODULE_NAME),prolog(check_justification_type,2,FLORA_THIS_MODULE_NAME),prolog(get_justification_type,2,FLORA_THIS_MODULE_NAME),prolog(printable_axiom,2,FLORA_THIS_MODULE_NAME),prolog(goal_NOT_to_ignore,1,FLORA_THIS_MODULE_NAME),prolog(ignored_goal,1,FLORA_THIS_MODULE_NAME),prolog(immediate_support,3,FLORA_THIS_MODULE_NAME),prolog(immediate_support_internal,4,FLORA_THIS_MODULE_NAME),prolog(full_support_info,4,FLORA_THIS_MODULE_NAME),prolog(paraphrase,2,FLORA_THIS_MODULE_NAME),prolog(choose_rule_text,3,FLORA_THIS_MODULE_NAME),prolog(support_object_is_not_aggregate_body,1,FLORA_THIS_MODULE_NAME),prolog(all_support,4,FLORA_THIS_MODULE_NAME)]))).
:-(table(as(/(FLORA_THIS_WORKSPACE(get_rule_text),5),AUXILIARY_TABLING_TYPE))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(get_rule_text,4,FLORA_THIS_MODULE_NAME)]))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(initialize,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(4,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrporting,flora_install_dir(__ErgoDir)),','(:(flrporting,flora_slash(__S)),','(FLORA_WORKSPACE(\\basetype,d^mvd)('\\symbol',flapply(concat,[__ErgoDir,__S,ergo_lib,__S,ergo_explain]),__EXdir,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_WORKSPACE(\\system,d^meth)('Libpath',flapply(add,__EXdir),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibload([ergo_explain_utils],'/home/kifer/ERGOAI/ErgoEngine/ErgoAI/ergo_lib/ergo_explain.ergo',FLORA_THIS_MODULE_NAME,[140,2]))))),fllibexecute_delayed_calls([__EXdir,__ErgoDir,__S],[])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Goal,why,__SupportObj,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(6,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','('_$_$_ergo''silent_equal'(_CallerModuleVar,__newvar3),FLORA_THIS_WORKSPACE(immediate_support)(__Goal,__newvar3,__SupportObj,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5))))).
:-(FLORA_THIS_WORKSPACE(immediate_support)(__Goal,__CallerMod,__SupportObj,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(8,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(check_callable)(__Goal,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''mod''\\changemodule''change_module_if_match'(__Goal,__GoalM,FLORA_THIS_MODULE_NAME,__CallerMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(get_justification_type)(__GoalM,__WhyOrWhyNot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),FLORA_THIS_WORKSPACE(immediate_support_internal)(__GoalM,__WhyOrWhyNot,___RuleId,__SupportObj,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10))))),fllibexecute_delayed_calls([__CallerMod,__Goal,__GoalM,__SupportObj,__WhyOrWhyNot,___RuleId],[__CallerMod,__Goal,__SupportObj])))).
:-(FLORA_THIS_WORKSPACE(immediate_support_internal)(__GoalM,why,flapply(ruleid,null,null,null),__SupportObj,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(10,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(:(flrstorageutils,'\\isbasefact'(__GoalM)),','(!,=(__SupportObj,flapply(w,__GoalM,null,'\\false',null,'it is a base fact',[])))))).
:-(FLORA_THIS_WORKSPACE(immediate_support_internal)(__GoalM,whynot,flapply(ruleid,null,null,null),__SupportObj,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(12,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrdatatype,flora_is_nonvar_prim(__GoalM)),','(fllibuniveqform(__GoalM,flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__PosGoal,fllibexecute_delayed_calls([__PosGoal],[]))),[__PosGoal],__newquantvar3,__newquantvar4))),','(:(flrstorageutils,'\\isbasefact'(__PosGoal)),','(!,=(__SupportObj,flapply(w,__PosGoal,null,'\\false',null,'it is a base fact',[])))))),fllibexecute_delayed_calls([__GoalM,__PosGoal,__SupportObj],[__GoalM,__SupportObj])))).
:-(FLORA_THIS_WORKSPACE(immediate_support_internal)(__GoalM,__WhyOrWhyNot,flapply(ruleid,__Id,__File,__Mod),__SupportObj,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(14,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','(';'(->(==(__WhyOrWhyNot,why),=(__Parent,flapply(w,__GoalM,null,'\\false',null,null,[]))),=(__Parent,flapply(m,__GoalM,null,'\\false',null,null,[]))),','('_$_$_ergo''mod''\\fidji''justificationTreeFunction'(__SupportObj,__Parent,__newdontcarevar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),','(FLORA_THIS_WORKSPACE(d^mvd)(__SupportObj,goal,__SuppGoal,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),','(';'(->(fllibuniveqform(__GoalM,fllibmodlit(libmod_wrapper,__newdontcarevar8,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10))),'\\true'),'\\true'),','(:(flrcallflora,get_calling_rule_info(__SuppGoal,__Id,__File,__Mod,__GoalM)),FLORA_THIS_WORKSPACE(goal_NOT_to_ignore)(__SuppGoal,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12))))))),fllibexecute_delayed_calls([__File,__GoalM,__Id,__Mod,__Parent,__SuppGoal,__SupportObj,__WhyOrWhyNot,__newdontcarevar13],[__File,__GoalM,__Id,__Mod,__SupportObj,__WhyOrWhyNot])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Goal,flapply(why,full),__AllSupport,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(16,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(full_support_info)(__Goal,__Mod,info_withouttext,__AllSupport,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),!)),fllibexecute_delayed_calls([__AllSupport,__Goal,__Mod],[__AllSupport,__Goal])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Goal,flapply(why,full,withtext),__AllSupport,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(18,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(full_support_info)(__Goal,__Mod,info_withtext,__AllSupport,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),!)),fllibexecute_delayed_calls([__AllSupport,__Goal,__Mod],[__AllSupport,__Goal])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Goal,flapply(why,full,textonly),__AllSupport,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(20,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(full_support_info)(__Goal,__Mod,info_textonly,__AllSupport,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),!)),fllibexecute_delayed_calls([__AllSupport,__Goal,__Mod],[__AllSupport,__Goal])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Goal,flapply(why,full,raw),__AllSupport,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(22,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(full_support_info)(__Goal,__Mod,info_unify,__AllSupport,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),!)),fllibexecute_delayed_calls([__AllSupport,__Goal,__Mod],[__AllSupport,__Goal])))).
:-(FLORA_THIS_WORKSPACE(full_support_info)(__Goal,__Mod,__Transform,flapply(explanation,__GoalTruth,[flapply(explanation,__TrueGoal,__AllSupport1),flapply(explanation,__FalseGoal,__AllSupport2)]),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(24,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(check_callable)(__Goal,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''mod''\\changemodule''change_module_if_match'(__Goal,__GoalM,FLORA_THIS_MODULE_NAME,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(fllibtruthvalue(false,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__GoalM,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))),','(fllibtruthvalue(true,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__GoalM,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10))),','(!,','(';'(->(==(__Transform,info_withtext),','(FLORA_THIS_WORKSPACE(convert_to_text)(__GoalM,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)),','(=(__GoalTruth,flapply(contradiction,__GoalM,'it is a top query',__GoalText,flapply(ruleinfo,flapply(ruleid,null,null,null),'derived by the axiom for contradiction'))),','(=(__TrueGoal,flapply(true,__GoalM,null,__GoalText,flapply(ruleinfo,__PosRuleId,__PosRuleText))),=(__FalseGoal,flapply(false,__GoalM,null,__GoalText,flapply(ruleinfo,__NegRuleId,__NegRuleText))))))),';'(->(==(__Transform,info_textonly),','(FLORA_THIS_WORKSPACE(convert_to_text)(__GoalM,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14)),','(=(__GoalTruth,flapply(contradiction,__GoalText,'it is a top query')),','(=(__TrueGoal,flapply(true,__GoalText,__PosRuleText)),=(__FalseGoal,flapply(false,__GoalText,__NegRuleText)))))),','(=(__GoalTruth,flapply(contradiction,__GoalM,'it is a top query','derived by the axiom for contradiction')),','(=(__TrueGoal,flapply(true,__GoalM,null,__PosRuleId)),=(__FalseGoal,flapply(false,__GoalM,null,__NegRuleId)))))),','(';'(->(FLORA_THIS_WORKSPACE(immediate_support_internal)(__GoalM,why,__PosRuleId,__SuppObjPos,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,__newcontextvar16)),'\\true'),=(__PosRuleId,flapply(ruleid,null,null,null))),','(FLORA_THIS_WORKSPACE(get_rule_text)(__SuppObjPos,__PosRuleId,__Mod,__PosRuleText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar17,__newcontextvar18)),','(';'(->(FLORA_THIS_WORKSPACE(d^tblflapply)(using_sorted_explanations,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar19,__newcontextvar20)),','(fllibsetof(__newdontcarevar25,[],[],','(FLORA_THIS_WORKSPACE(immediate_support_internal)(__GoalM,why,__newdontcarevar21,__newdontcarevar25,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar22,__newcontextvar23)),fllibexecute_delayed_calls([__GoalM,__newdontcarevar25,__newdontcarevar24],[])),__newvar26),=(__SupportList1,__newvar26))),','(fllibbagof(__newdontcarevar31,[],[],','(FLORA_THIS_WORKSPACE(immediate_support_internal)(__GoalM,why,__newdontcarevar27,__newdontcarevar31,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar28,__newcontextvar29)),fllibexecute_delayed_calls([__GoalM,__newdontcarevar31,__newdontcarevar30],[])),__newvar32),=(__SupportList1,__newvar32))),','(FLORA_THIS_WORKSPACE(all_support)(__SupportList1,__Transform,__AllSupport1,0,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar33,__newcontextvar34)),','(:(ergo_explain_utils,ergo_clear_seen_subgoals),','(fllibuniveqform(__GoalMnaf,flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__GoalM,fllibexecute_delayed_calls([__GoalM],[]))),[__GoalM],__newquantvar35,__newquantvar36))),','(';'(->(FLORA_THIS_WORKSPACE(immediate_support_internal)(__GoalMnaf,why,__NegRuleId,__SuppObjNaf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar37,__newcontextvar38)),'\\true'),=(__NegRuleId,flapply(ruleid,null,null,null))),','(FLORA_THIS_WORKSPACE(get_rule_text)(__SuppObjNaf,__NegRuleId,__Mod,__NegRuleText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar39,__newcontextvar40)),','(';'(->(FLORA_THIS_WORKSPACE(d^tblflapply)(using_sorted_explanations,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar41,__newcontextvar42)),','(fllibsetof(__newdontcarevar47,[],[],','(FLORA_THIS_WORKSPACE(immediate_support_internal)(__GoalMnaf,why,__newdontcarevar43,__newdontcarevar47,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar44,__newcontextvar45)),fllibexecute_delayed_calls([__GoalMnaf,__newdontcarevar47,__newdontcarevar46],[])),__newvar48),=(__SupportList2,__newvar48))),','(fllibbagof(__newdontcarevar53,[],[],','(FLORA_THIS_WORKSPACE(immediate_support_internal)(__GoalMnaf,why,__newdontcarevar49,__newdontcarevar53,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar50,__newcontextvar51)),fllibexecute_delayed_calls([__GoalMnaf,__newdontcarevar53,__newdontcarevar52],[])),__newvar54),=(__SupportList2,__newvar54))),','(FLORA_THIS_WORKSPACE(all_support)(__SupportList2,__Transform,__AllSupport2,0,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar55,__newcontextvar56)),:(ergo_explain_utils,ergo_clear_seen_subgoals))))))))))))))))),fllibexecute_delayed_calls([__AllSupport1,__AllSupport2,__FalseGoal,__Goal,__GoalM,__GoalMnaf,__GoalText,__GoalTruth,__Mod,__NegRuleId,__NegRuleText,__PosRuleId,__PosRuleText,__SuppObjNaf,__SuppObjPos,__SupportList1,__SupportList2,__Transform,__TrueGoal,__newdontcarevar57],[__AllSupport1,__AllSupport2,__FalseGoal,__Goal,__GoalTruth,__Mod,__Transform,__TrueGoal])))).
:-(FLORA_THIS_WORKSPACE(full_support_info)(__Goal,__Mod,__Transform,__TopExplanation,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(26,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(check_callable)(__Goal,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''mod''\\changemodule''change_module_if_match'(__Goal,__GoalM,FLORA_THIS_MODULE_NAME,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(';'(->(==(__Transform,info_withtext),';'(->(fllibtruthvalue(false,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__GoalM,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))),','(FLORA_THIS_WORKSPACE(convert_to_text)(__GoalM,__TopGoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),','(';'(->(:(flrcanon,is_naf_literal(__GoalM,__PosGoalM)),','(fllibmodlit(libmod_wrapper,__PosGoalM,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)),','(FLORA_THIS_WORKSPACE(convert_to_text)(__PosGoalM,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14)),=(__GoalTruth,flapply(true,__PosGoalM,'it is a top query',__GoalText,flapply(ruleinfo,__RuleId,__RuleText)))))),','(=(__GoalText,__TopGoalText),=(__GoalTruth,flapply(false,__GoalM,'it is a top query',__GoalText,flapply(ruleinfo,__RuleId,__RuleText))))),=(__TopGoalTruth,flapply(false,__GoalM,'it is a top query',__TopGoalText,flapply(ruleinfo,__RuleId,'it is a top query')))))),';'(->(fllibtruthvalue(true,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__GoalM,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,__newcontextvar16))),','(FLORA_THIS_WORKSPACE(convert_to_text)(__GoalM,__TopGoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar17,__newcontextvar18)),','(';'(->(:(flrcanon,is_naf_literal(__GoalM,__PosGoalM)),','(FLORA_THIS_WORKSPACE(convert_to_text)(__PosGoalM,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar19,__newcontextvar20)),=(__GoalTruth,flapply(false,__PosGoalM,'it is a top query',__GoalText,flapply(ruleinfo,__RuleId,__RuleText))))),','(=(__GoalText,__TopGoalText),=(__GoalTruth,flapply(true,__GoalM,'it is a top query',__GoalText,flapply(ruleinfo,__RuleId,__RuleText))))),=(__TopGoalTruth,flapply(true,__GoalM,'it is a top query',__TopGoalText,flapply(ruleinfo,__RuleId,'it is a top query')))))),';'(->(fllibtruthvalue(undefined,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__GoalM,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar21,__newcontextvar22))),','(FLORA_THIS_WORKSPACE(convert_to_text)(__GoalM,__TopGoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar23,__newcontextvar24)),','(=(__GoalText,__TopGoalText),','(=(__GoalTruth,flapply(undefined,__GoalM,'it is a top query',__GoalText,flapply(ruleinfo,__RuleId,__RuleText))),=(__TopGoalTruth,flapply(undefined,__GoalM,'it is a top query',__TopGoalText,flapply(ruleinfo,__RuleId,'it is a top query'))))))),','(FLORA_THIS_WORKSPACE(convert_to_text)(__GoalM,__TopGoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar25,__newcontextvar26)),','(=(__GoalText,__TopGoalText),','(=(__GoalTruth,flapply(undefined,__GoalM,'it is a top query',__GoalText,flapply(ruleinfo,__RuleId,__RuleText))),=(__TopGoalTruth,flapply(undefined,__GoalM,'it is a top query',__TopGoalText,flapply(ruleinfo,__RuleId,'it is a top query')))))))))),';'(->(==(__Transform,info_textonly),';'(->(fllibtruthvalue(false,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__GoalM,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar27,__newcontextvar28))),','(FLORA_THIS_WORKSPACE(convert_to_text)(__GoalM,__TopGoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar29,__newcontextvar30)),','(';'(->(:(flrcanon,is_naf_literal(__GoalM,__PosGoalM)),','(fllibmodlit(libmod_wrapper,__PosGoalM,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar31,__newcontextvar32)),','(FLORA_THIS_WORKSPACE(convert_to_text)(__PosGoalM,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar33,__newcontextvar34)),=(__GoalTruth,flapply(true,__GoalText,__RuleText))))),','(=(__GoalText,__TopGoalText),=(__GoalTruth,flapply(false,__GoalText,__RuleText)))),=(__TopGoalTruth,flapply(false,__TopGoalText,'it is a top query'))))),';'(->(fllibtruthvalue(true,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__GoalM,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar35,__newcontextvar36))),','(FLORA_THIS_WORKSPACE(convert_to_text)(__GoalM,__TopGoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar37,__newcontextvar38)),','(';'(->(:(flrcanon,is_naf_literal(__GoalM,__PosGoalM)),','(FLORA_THIS_WORKSPACE(convert_to_text)(__PosGoalM,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar39,__newcontextvar40)),=(__GoalTruth,flapply(false,__GoalText,__RuleText)))),','(=(__GoalText,__TopGoalText),=(__GoalTruth,flapply(true,__GoalText,__RuleText)))),=(__TopGoalTruth,flapply(true,__TopGoalText,'it is a top query'))))),';'(->(fllibtruthvalue(undefined,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__GoalM,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar41,__newcontextvar42))),','(FLORA_THIS_WORKSPACE(convert_to_text)(__GoalM,__TopGoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar43,__newcontextvar44)),','(=(__GoalText,__TopGoalText),','(=(__GoalTruth,flapply(undefined,__GoalText,__RuleText)),=(__TopGoalTruth,flapply(undefined,__TopGoalText,'it is a top query')))))),','(FLORA_THIS_WORKSPACE(convert_to_text)(__GoalM,__TopGoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar45,__newcontextvar46)),','(=(__GoalText,__TopGoalText),','(=(__GoalTruth,flapply(undefined,__GoalText,__RuleText)),=(__TopGoalTruth,flapply(undefined,__TopGoalText,'it is a top query'))))))))),';'(->(fllibtruthvalue(false,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__GoalM,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar47,__newcontextvar48))),','(';'(->(:(flrcanon,is_naf_literal(__GoalM,__PosGoalM)),','(fllibmodlit(libmod_wrapper,__PosGoalM,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar49,__newcontextvar50)),=(__GoalTruth,flapply(true,__PosGoalM,'it is a top query',__RuleId)))),=(__GoalTruth,flapply(false,__GoalM,'it is a top query',__RuleId))),=(__TopGoalTruth,flapply(false,__GoalM,'it is a top query',__RuleId)))),';'(->(fllibtruthvalue(true,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__GoalM,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar51,__newcontextvar52))),','(';'(->(:(flrcanon,is_naf_literal(__GoalM,__PosGoalM)),=(__GoalTruth,flapply(false,__PosGoalM,'it is a top query',__RuleId))),=(__GoalTruth,flapply(true,__GoalM,'it is a top query',__RuleId))),=(__TopGoalTruth,flapply(true,__GoalM,'it is a top query',__RuleId)))),','(=(__GoalTruth,flapply(undefined,__GoalM,'it is a top query',__RuleId)),=(__TopGoalTruth,flapply(undefined,__GoalM,'it is a top query',__RuleId))))))),','(';'(->(:(flrdatatype,flora_is_var_prim(__PosGoalM)),=(__RealGoal,__GoalM)),=(__RealGoal,__PosGoalM)),','(FLORA_THIS_WORKSPACE(get_justification_type)(__RealGoal,__WhyOrWhyNot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar53,__newcontextvar54)),','(';'(->(','(FLORA_THIS_WORKSPACE(immediate_support_internal)(__RealGoal,__WhyOrWhyNot,__RuleId,__GoalSupp,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar55,__newcontextvar56)),','(FLORA_THIS_WORKSPACE(support_object_is_not_aggregate_body)(__GoalSupp,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar57,__newcontextvar58)),','(=(__RuleId,flapply(ruleid,__Id,__newdontcarevar59,__newdontcarevar60)),','(:(flrdatatype,flora_is_nonvar_prim(__Id)),\==(__Id,null))))),FLORA_THIS_WORKSPACE(get_rule_text)(__GoalSupp,__RuleId,__Mod,__RuleTextPre,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar61,__newcontextvar62))),';'(->(','(FLORA_THIS_WORKSPACE(immediate_support_internal)(__RealGoal,__WhyOrWhyNot,__RuleId,__GoalSupp,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar63,__newcontextvar64)),','(FLORA_THIS_WORKSPACE(support_object_is_not_aggregate_body)(__GoalSupp,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar65,__newcontextvar66)),','(FLORA_THIS_WORKSPACE(d^mvd)(__GoalSupp,reason,__Reason,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar67,__newcontextvar68)),\==(__Reason,null)))),','(';'(','(=(__RuleId,flapply(ruleid,__Id,__F,__newdontcarevar69)),','(';'(->(:(flrdatatype,flora_is_var_prim(__Id)),=(__Id,null)),'\\true'),';'(->(:(flrdatatype,flora_is_var_prim(__F)),=(__F,null)),'\\true'))),'\\true'),FLORA_THIS_WORKSPACE(choose_rule_text)(__Reason,'inferrence rule cannot be determined',__RuleTextPre,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar70,__newcontextvar71)))),';'(->(','(FLORA_THIS_WORKSPACE(immediate_support_internal)(__RealGoal,__WhyOrWhyNot,__RuleId,__GoalSupp,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar72,__newcontextvar73)),FLORA_THIS_WORKSPACE(support_object_is_not_aggregate_body)(__GoalSupp,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar74,__newcontextvar75))),','(FLORA_THIS_WORKSPACE(get_rule_text)(__GoalSupp,__RuleId,__Mod,__RuleTextPre,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar76,__newcontextvar77)),','(=(__RuleId,flapply(ruleid,__Id,__F,__newdontcarevar78)),','(';'(->(:(flrdatatype,flora_is_var_prim(__Id)),=(__Id,null)),'\\true'),';'(->(:(flrdatatype,flora_is_var_prim(__F)),=(__F,null)),'\\true'))))),','(=(__RuleId,flapply(ruleid,null,null,null)),=(__RuleTextPre,'inferrence rule cannot be determined'))))),','(';'(->(','(==(__RuleTextPre,'inferrence rule cannot be determined'),:(flrdatatype,flora_is_var_prim(__PosGoalM))),=(__RuleText,'it is a top query')),=(__RuleText,__RuleTextPre)),','(';'(->(FLORA_THIS_WORKSPACE(d^tblflapply)(using_sorted_explanations,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar79,__newcontextvar80)),','(fllibsetof(__newdontcarevar85,[],[],','(FLORA_THIS_WORKSPACE(immediate_support_internal)(__RealGoal,__WhyOrWhyNot,__newdontcarevar81,__newdontcarevar85,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar82,__newcontextvar83)),fllibexecute_delayed_calls([__RealGoal,__newdontcarevar85,__WhyOrWhyNot,__newdontcarevar84],[])),__newvar86),=(__SupportList,__newvar86))),','(fllibbagof(__newdontcarevar91,[],[],','(FLORA_THIS_WORKSPACE(immediate_support_internal)(__RealGoal,__WhyOrWhyNot,__newdontcarevar87,__newdontcarevar91,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar88,__newcontextvar89)),fllibexecute_delayed_calls([__RealGoal,__newdontcarevar91,__WhyOrWhyNot,__newdontcarevar90],[])),__newvar92),=(__SupportList,__newvar92))),','(FLORA_THIS_WORKSPACE(all_support)(__SupportList,__Transform,__AllSupport,0,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar93,__newcontextvar94)),','(';'(->(:(flrdatatype,flora_is_var_prim(__PosGoalM)),=(__TopExplanation,flapply(explanation,__GoalTruth,__AllSupport))),=(__TopExplanation,flapply(explanation,__TopGoalTruth,[flapply(explanation,__GoalTruth,__AllSupport)]))),:(ergo_explain_utils,ergo_clear_seen_subgoals))))))))))),fllibexecute_delayed_calls([__AllSupport,__F,__Goal,__GoalM,__GoalSupp,__GoalText,__GoalTruth,__Id,__Mod,__PosGoalM,__RealGoal,__Reason,__RuleId,__RuleText,__RuleTextPre,__SupportList,__TopExplanation,__TopGoalText,__TopGoalTruth,__Transform,__WhyOrWhyNot,__newdontcarevar95],[__Goal,__Mod,__TopExplanation,__Transform])))).
:-(FLORA_THIS_WORKSPACE(check_justification_type)(why,__Goal,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(28,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','(:(basics,copy_term(__Goal,__GoalCopy)),';'(fllibtruthvalue(true,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__GoalCopy,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),fllibtruthvalue(undefined,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__GoalCopy,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))),fllibexecute_delayed_calls([__Goal,__GoalCopy],[__Goal])))).
:-(FLORA_THIS_WORKSPACE(check_justification_type)(whynot,__Goal,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(30,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),fllibtruthvalue(false,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__Goal,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))).
:-(FLORA_THIS_WORKSPACE(get_justification_type)(__Goal,__Type,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(32,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','(:(basics,copy_term(__Goal,__GoalCopy)),';'(->(','(fllibtruthvalue(false,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__GoalCopy,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),fllibtruthvalue(true,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__GoalCopy,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),';'(=(__Type,why),=(__Type,whynot))),';'(->(fllibtruthvalue(false,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__GoalCopy,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))),=(__Type,whynot)),=(__Type,why)))),fllibexecute_delayed_calls([__Goal,__GoalCopy,__Type],[__Goal,__Type])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__SupportObj,support,__SupportChildObj,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(34,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrdatatype,flora_is_nonvar_prim(__SupportObj)),','(=(__SupportObj,flapply(__type,__newdontcarevar3,__newdontcarevar4,__newdontcarevar5,__newdontcarevar6,__newdontcarevar7,__newdontcarevar8)),','(:(flrsetops,flora_list_member(__type,[w,m,d])),','(!,','('_$_$_ergo''mod''\\fidji''justificationTreeFunction'(__SupportChildObj,__SupportObj,__newdontcarevar9,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11)),','(FLORA_THIS_WORKSPACE(d^mvd)(__SupportChildObj,goal,__newquantvar12,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14)),FLORA_THIS_WORKSPACE(goal_NOT_to_ignore)(__newquantvar12,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,__newcontextvar16)))))))),fllibexecute_delayed_calls([__SupportChildObj,__SupportObj,__newdontcarevar17,__type],[__SupportChildObj,__SupportObj])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__SupportObj,isleaf,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(36,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrdatatype,flora_is_nonvar_prim(__SupportObj)),','(=(__SupportObj,flapply(__type,__Goal,__newdontcarevar3,__newdontcarevar4,__newdontcarevar5,__newdontcarevar6,__newdontcarevar7)),','(!,','(';'(->(:(flrdelaysupport,is_delayed_literal(__Goal)),FLORA_THIS_WORKSPACE(d^tblflapply)(true,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9))),';'(->(==(__type,w),';'(fllibtruthvalue(true,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__Goal,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11))),fllibtruthvalue(undefined,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__Goal,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar13))))),';'(->(==(__type,m),fllibtruthvalue(false,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__Goal,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar14,__newcontextvar15)))),';'(->(==(__type,d),'\\false'),'\\true')))),\+('_$_$_ergo''mod''\\fidji''justificationTreeFunction'(__newdontcarevar16,__SupportObj,__newdontcarevar17,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar18,__newcontextvar19))))))),fllibexecute_delayed_calls([__Goal,__SupportObj,__newdontcarevar20,__type],[__SupportObj])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__SupportObj,goal,__Goal,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(38,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrdatatype,flora_is_nonvar_prim(__SupportObj)),','(=(__SupportObj,flapply(__type,__PreGoal,__newdontcarevar3,__newdontcarevar4,__newdontcarevar5,__newdontcarevar6,__newdontcarevar7)),','(';'(->(=(__PreGoal,flapply(rebuttedBy,__newdontcarevar8,__Goal)),'\\true'),';'(->(=(__PreGoal,flapply(refutedBy,__newdontcarevar9,__Goal)),'\\true'),';'(->(=(__PreGoal,flapply(beatenByStrictRule,__Goal)),'\\true'),';'(->(=(__PreGoal,flapply(disqualified,__newdontcarevar10,__newdontcarevar11,','(__newdontcarevar12,__Goal))),'\\true'),=(__Goal,__PreGoal))))),','(:(flrsetops,flora_list_member(__type,[w,m,d])),!)))),fllibexecute_delayed_calls([__Goal,__PreGoal,__SupportObj,__newdontcarevar13,__type],[__Goal,__SupportObj])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__SupportObj,info,__InfoObject,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(40,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(info_withouttext,__SupportObj,___RuleInfo,__InfoObject,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),fllibexecute_delayed_calls([__InfoObject,__SupportObj,___RuleInfo],[__InfoObject,__SupportObj])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(info_withouttext,__SupportObj,__RuleInfo,__InfoObject,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(42,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(support_info)(__SupportObj,no,__RuleInfo,__InfoObject,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(info_withtext,__SupportObj,__RuleInfo,__InfoObject,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(44,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(support_info)(__SupportObj,withtext,__RuleInfo,__InfoObject,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(info_textonly,__SupportObj,__RuleInfo,__InfoObject,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(46,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(support_info)(__SupportObj,textonly,__RuleInfo,__InfoObject,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(info_unify,__X,__newdontcarevar1,__Y,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(48,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),=(__X,__Y))).
:-(FLORA_THIS_WORKSPACE(support_info)(__SupportObj,__UseErgoText,__RuleInfo,__InfoObject,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(50,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrdatatype,flora_is_nonvar_prim(__SupportObj)),','(=(__SupportObj,flapply(w,__Goal,__newdontcarevar3,__newdontcarevar4,__newdontcarevar5,__newdontcarevar6,__newdontcarevar7)),','(!,','(=(__RuleInfo,flapply(ruleinfo,__RuleId,__RuleText)),','(';'(->(==(__RuleText,'maximum explanation depth reached'),=(__Reason,max_depth_reached)),';'(->(==(__RuleText,'already explained subquery'),=(__Reason,repeated_subquery)),=(__Reason,null))),','(FLORA_THIS_WORKSPACE(paraphrase)(__Goal,__GoalP,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),';'(->(==(__UseErgoText,withtext),';'(->(','(:(flrdelaysupport,is_delayed_literal(__Goal)),','(fllibcatch(','(fllibmodlit(libmod_wrapper,__Goal,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11)),fllibexecute_delayed_calls([__SupportObj,__SupportObj,__Goal,__newdontcarevar12,__newdontcarevar13,__newdontcarevar14,__newdontcarevar15,__newdontcarevar16,__RuleInfo,__RuleId,__RuleText,__RuleText,__Reason,__RuleText,__Reason,__Reason,__Goal,__GoalP,__UseErgoText,__Goal,__Goal,__newdontcarevar17,__Exception,__Exception,__GoalP,__GoalText,__InfoObject,__GoalP,__Reason,__GoalText,__RuleInfo,__Goal,__GoalP,__GoalText,__InfoObject,__GoalP,__Reason,__GoalText,__RuleInfo,__Goal,__GoalP,__GoalText,__InfoObject,__GoalP,__GoalText,__RuleInfo,__Goal,__Goal,__PosGoal,__PosGoal,__PosGoalP,__PosGoalP,__GoalText,__InfoObject,__PosGoalP,__Reason,__GoalText,__RuleInfo,__GoalP,__GoalText,__InfoObject,__GoalP,__Reason,__GoalText,__RuleInfo,__Goal,__PosGoal,__PosGoal,__PosGoal,__PosGoalP,__PosGoalP,__GoalText,__InfoObject,__PosGoalP,__Reason,__GoalText,__RuleInfo,__GoalP,__GoalText,__InfoObject,__GoalP,__Reason,__GoalText,__RuleInfo,__UseErgoText,__Goal,__Goal,__newdontcarevar18,__Exception,__Exception,__GoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__Goal,__GoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__Goal,__Goal,__PosGoal,__PosGoal,__PosGoalP,__PosGoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__GoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__Goal,__PosGoal,__PosGoal,__PosGoalP,__PosGoalP,__PosGoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__GoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__Goal,__Goal,__newdontcarevar19,__Exception,__Exception,__InfoObject,__GoalP,__Reason,__RuleId,__Goal,__InfoObject,__GoalP,__Reason,__RuleId,__Goal,__InfoObject,__GoalP,__RuleId,__Goal,__InfoObject,__GoalP,__Reason,__RuleId,__InfoObject,__GoalP,__Reason,__RuleId],[])),__newdontcarevar20,=(__Exception,yes)),==(__Exception,yes))),','(FLORA_THIS_WORKSPACE(convert_to_text)(__GoalP,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar21,__newcontextvar22)),=(__InfoObject,flapply(unknown,__GoalP,__Reason,__GoalText,__RuleInfo)))),';'(->(fllibtruthvalue(undefined,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__Goal,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar23,__newcontextvar24))),','(FLORA_THIS_WORKSPACE(convert_to_text)(__GoalP,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar25,__newcontextvar26)),=(__InfoObject,flapply(undefined,__GoalP,__Reason,__GoalText,__RuleInfo)))),';'(->(:(flrstorageutils,'\\isbasefact'(__Goal)),','(FLORA_THIS_WORKSPACE(convert_to_text)(__GoalP,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar27,__newcontextvar28)),=(__InfoObject,flapply(true,__GoalP,'it is a base fact',__GoalText,__RuleInfo)))),';'(->(fllibtruthvalue(true,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__Goal,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar29,__newcontextvar30))),';'(->(:(flrcanon,is_naf_literal(__Goal,__PosGoal)),','(FLORA_THIS_WORKSPACE(paraphrase)(__PosGoal,__PosGoalP,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar31,__newcontextvar32)),','(FLORA_THIS_WORKSPACE(convert_to_text)(__PosGoalP,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar33,__newcontextvar34)),=(__InfoObject,flapply(false,__PosGoalP,__Reason,__GoalText,__RuleInfo))))),','(FLORA_THIS_WORKSPACE(convert_to_text)(__GoalP,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar35,__newcontextvar36)),=(__InfoObject,flapply(true,__GoalP,__Reason,__GoalText,__RuleInfo))))),';'(->(:(flrcanon,is_naf_literal(__Goal,__PosGoal)),','(fllibmodlit(libmod_wrapper,__PosGoal,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar37,__newcontextvar38)),','(FLORA_THIS_WORKSPACE(paraphrase)(__PosGoal,__PosGoalP,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar39,__newcontextvar40)),','(FLORA_THIS_WORKSPACE(convert_to_text)(__PosGoalP,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar41,__newcontextvar42)),=(__InfoObject,flapply(true,__PosGoalP,__Reason,__GoalText,__RuleInfo)))))),','(FLORA_THIS_WORKSPACE(convert_to_text)(__GoalP,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar43,__newcontextvar44)),=(__InfoObject,flapply(false,__GoalP,__Reason,__GoalText,__RuleInfo))))))))),';'(->(==(__UseErgoText,textonly),';'(->(','(:(flrdelaysupport,is_delayed_literal(__Goal)),','(fllibcatch(','(fllibmodlit(libmod_wrapper,__Goal,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar45,__newcontextvar46)),fllibexecute_delayed_calls([__SupportObj,__SupportObj,__Goal,__newdontcarevar47,__newdontcarevar48,__newdontcarevar49,__newdontcarevar50,__newdontcarevar51,__RuleInfo,__RuleId,__RuleText,__RuleText,__Reason,__RuleText,__Reason,__Reason,__Goal,__GoalP,__UseErgoText,__Goal,__Goal,__newdontcarevar52,__Exception,__Exception,__GoalP,__GoalText,__InfoObject,__GoalP,__Reason,__GoalText,__RuleInfo,__Goal,__GoalP,__GoalText,__InfoObject,__GoalP,__Reason,__GoalText,__RuleInfo,__Goal,__GoalP,__GoalText,__InfoObject,__GoalP,__GoalText,__RuleInfo,__Goal,__Goal,__PosGoal,__PosGoal,__PosGoalP,__PosGoalP,__GoalText,__InfoObject,__PosGoalP,__Reason,__GoalText,__RuleInfo,__GoalP,__GoalText,__InfoObject,__GoalP,__Reason,__GoalText,__RuleInfo,__Goal,__PosGoal,__PosGoal,__PosGoal,__PosGoalP,__PosGoalP,__GoalText,__InfoObject,__PosGoalP,__Reason,__GoalText,__RuleInfo,__GoalP,__GoalText,__InfoObject,__GoalP,__Reason,__GoalText,__RuleInfo,__UseErgoText,__Goal,__Goal,__newdontcarevar53,__Exception,__Exception,__GoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__Goal,__GoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__Goal,__Goal,__PosGoal,__PosGoal,__PosGoalP,__PosGoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__GoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__Goal,__PosGoal,__PosGoal,__PosGoalP,__PosGoalP,__PosGoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__GoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__Goal,__Goal,__newdontcarevar54,__Exception,__Exception,__InfoObject,__GoalP,__Reason,__RuleId,__Goal,__InfoObject,__GoalP,__Reason,__RuleId,__Goal,__InfoObject,__GoalP,__RuleId,__Goal,__InfoObject,__GoalP,__Reason,__RuleId,__InfoObject,__GoalP,__Reason,__RuleId],[])),__newdontcarevar55,=(__Exception,yes)),==(__Exception,yes))),','(FLORA_THIS_WORKSPACE(convert_to_text)(__GoalP,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar56,__newcontextvar57)),=(__InfoObject,flapply(unknown,__GoalText,__RuleText)))),';'(->(fllibtruthvalue(undefined,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__Goal,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar58,__newcontextvar59))),','(FLORA_THIS_WORKSPACE(convert_to_text)(__GoalP,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar60,__newcontextvar61)),=(__InfoObject,flapply(undefined,__GoalText,__RuleText)))),';'(->(fllibtruthvalue(true,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__Goal,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar62,__newcontextvar63))),';'(->(:(flrcanon,is_naf_literal(__Goal,__PosGoal)),','(FLORA_THIS_WORKSPACE(paraphrase)(__PosGoal,__PosGoalP,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar64,__newcontextvar65)),','(FLORA_THIS_WORKSPACE(convert_to_text)(__PosGoalP,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar66,__newcontextvar67)),=(__InfoObject,flapply(false,__GoalText,__RuleText))))),','(FLORA_THIS_WORKSPACE(convert_to_text)(__GoalP,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar68,__newcontextvar69)),=(__InfoObject,flapply(true,__GoalText,__RuleText))))),';'(->(:(flrcanon,is_naf_literal(__Goal,__PosGoal)),','(FLORA_THIS_WORKSPACE(paraphrase)(__PosGoal,__PosGoalP,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar70,__newcontextvar71)),','(fllibmodlit(libmod_wrapper,__PosGoalP,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar72,__newcontextvar73)),','(FLORA_THIS_WORKSPACE(convert_to_text)(__PosGoalP,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar74,__newcontextvar75)),=(__InfoObject,flapply(true,__GoalText,__RuleText)))))),','(FLORA_THIS_WORKSPACE(convert_to_text)(__GoalP,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar76,__newcontextvar77)),=(__InfoObject,flapply(false,__GoalText,__RuleText)))))))),';'(->(','(:(flrdelaysupport,is_delayed_literal(__Goal)),','(fllibcatch(','(fllibmodlit(libmod_wrapper,__Goal,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar78,__newcontextvar79)),fllibexecute_delayed_calls([__SupportObj,__SupportObj,__Goal,__newdontcarevar80,__newdontcarevar81,__newdontcarevar82,__newdontcarevar83,__newdontcarevar84,__RuleInfo,__RuleId,__RuleText,__RuleText,__Reason,__RuleText,__Reason,__Reason,__Goal,__GoalP,__UseErgoText,__Goal,__Goal,__newdontcarevar85,__Exception,__Exception,__GoalP,__GoalText,__InfoObject,__GoalP,__Reason,__GoalText,__RuleInfo,__Goal,__GoalP,__GoalText,__InfoObject,__GoalP,__Reason,__GoalText,__RuleInfo,__Goal,__GoalP,__GoalText,__InfoObject,__GoalP,__GoalText,__RuleInfo,__Goal,__Goal,__PosGoal,__PosGoal,__PosGoalP,__PosGoalP,__GoalText,__InfoObject,__PosGoalP,__Reason,__GoalText,__RuleInfo,__GoalP,__GoalText,__InfoObject,__GoalP,__Reason,__GoalText,__RuleInfo,__Goal,__PosGoal,__PosGoal,__PosGoal,__PosGoalP,__PosGoalP,__GoalText,__InfoObject,__PosGoalP,__Reason,__GoalText,__RuleInfo,__GoalP,__GoalText,__InfoObject,__GoalP,__Reason,__GoalText,__RuleInfo,__UseErgoText,__Goal,__Goal,__newdontcarevar86,__Exception,__Exception,__GoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__Goal,__GoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__Goal,__Goal,__PosGoal,__PosGoal,__PosGoalP,__PosGoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__GoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__Goal,__PosGoal,__PosGoal,__PosGoalP,__PosGoalP,__PosGoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__GoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__Goal,__Goal,__newdontcarevar87,__Exception,__Exception,__InfoObject,__GoalP,__Reason,__RuleId,__Goal,__InfoObject,__GoalP,__Reason,__RuleId,__Goal,__InfoObject,__GoalP,__RuleId,__Goal,__InfoObject,__GoalP,__Reason,__RuleId,__InfoObject,__GoalP,__Reason,__RuleId],[])),__newdontcarevar88,=(__Exception,yes)),==(__Exception,yes))),=(__InfoObject,flapply(unknown,__GoalP,__Reason,__RuleId))),';'(->(fllibtruthvalue(undefined,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__Goal,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar89,__newcontextvar90))),=(__InfoObject,flapply(undefined,__GoalP,__Reason,__RuleId))),';'(->(:(flrstorageutils,'\\isbasefact'(__Goal)),=(__InfoObject,flapply(true,__GoalP,'it is a base fact',__RuleId))),';'(->(fllibtruthvalue(true,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__Goal,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar91,__newcontextvar92))),=(__InfoObject,flapply(true,__GoalP,__Reason,__RuleId))),=(__InfoObject,flapply(false,__GoalP,__Reason,__RuleId)))))))))))))),fllibexecute_delayed_calls([__Exception,__Goal,__GoalP,__GoalText,__InfoObject,__PosGoal,__PosGoalP,__Reason,__RuleId,__RuleInfo,__RuleText,__SupportObj,__UseErgoText,__newdontcarevar93],[__InfoObject,__RuleInfo,__SupportObj,__UseErgoText])))).
:-(FLORA_THIS_WORKSPACE(support_info)(__SupportObj,__UseErgoText,__RuleInfo,__InfoObject,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(52,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrdatatype,flora_is_nonvar_prim(__SupportObj)),','(=(__SupportObj,flapply(d,__Goal,__newdontcarevar3,__newdontcarevar4,__newdontcarevar5,__newdontcarevar6,__newdontcarevar7)),','(!,','(=(__RuleInfo,flapply(ruleinfo,__RuleId,__RuleText)),','(';'(->(==(__RuleText,'maximum explanation depth reached'),=(__Reason,max_depth_reached)),';'(->(==(__RuleText,'already explained subquery'),=(__Reason,repeated_subquery)),=(__Reason,null))),','(FLORA_THIS_WORKSPACE(paraphrase)(__Goal,__GoalP,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),','('_$_$_ergo''mod''\\fidji''childOfDefeated'(__Goal,___reason2,__Defeater,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11)),';'(->(==(__UseErgoText,withtext),';'(->(fllibtruthvalue(undefined,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__Defeater,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar13))),','(FLORA_THIS_WORKSPACE(convert_to_text)(__GoalP,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar14,__newcontextvar15)),=(__InfoObject,flapply(undefined,__GoalP,__Reason,__GoalText,__RuleInfo)))),','(FLORA_THIS_WORKSPACE(convert_to_text)(__GoalP,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar16,__newcontextvar17)),=(__InfoObject,flapply(true,__GoalP,__Reason,__GoalText,__RuleInfo))))),';'(->(==(__UseErgoText,textonly),';'(->(fllibtruthvalue(undefined,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__Defeater,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar18,__newcontextvar19))),','(FLORA_THIS_WORKSPACE(convert_to_text)(__GoalP,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar20,__newcontextvar21)),=(__InfoObject,flapply(undefined,__GoalText,__RuleText)))),','(FLORA_THIS_WORKSPACE(convert_to_text)(__GoalP,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar22,__newcontextvar23)),=(__InfoObject,flapply(true,__GoalText,__RuleText))))),';'(->(fllibtruthvalue(undefined,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__Defeater,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar24,__newcontextvar25))),=(__InfoObject,flapply(undefined,__GoalP,__Reason,__RuleId))),=(__InfoObject,flapply(true,__GoalP,__Reason,__RuleId)))))))))))),fllibexecute_delayed_calls([__Defeater,__Goal,__GoalP,__GoalText,__InfoObject,__Reason,__RuleId,__RuleInfo,__RuleText,__SupportObj,__UseErgoText,__newdontcarevar26,___reason2],[__InfoObject,__RuleInfo,__SupportObj,__UseErgoText])))).
:-(FLORA_THIS_WORKSPACE(support_info)(__SupportObj,__UseErgoText,__RuleInfo,__InfoObject,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(54,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrdatatype,flora_is_nonvar_prim(__SupportObj)),','(=(__SupportObj,flapply(m,__Goal,__newdontcarevar3,__newdontcarevar4,__newdontcarevar5,__newdontcarevar6,__newdontcarevar7)),','(!,','(=(__RuleInfo,flapply(ruleinfo,__RuleId,__RuleText)),','(';'(->(==(__RuleText,'maximum explanation depth reached'),=(__Reason,max_depth_reached)),';'(->(==(__RuleText,'already explained subquery'),=(__Reason,repeated_subquery)),=(__Reason,null))),','(FLORA_THIS_WORKSPACE(paraphrase)(__Goal,__GoalP,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),';'(->(==(__UseErgoText,withtext),';'(->(','(:(flrdelaysupport,is_delayed_literal(__Goal)),','(fllibcatch(','(fllibmodlit(libmod_wrapper,__Goal,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11)),fllibexecute_delayed_calls([__SupportObj,__SupportObj,__Goal,__newdontcarevar12,__newdontcarevar13,__newdontcarevar14,__newdontcarevar15,__newdontcarevar16,__RuleInfo,__RuleId,__RuleText,__RuleText,__Reason,__RuleText,__Reason,__Reason,__Goal,__GoalP,__UseErgoText,__Goal,__Goal,__newdontcarevar17,__Exception,__Exception,__GoalP,__GoalText,__InfoObject,__GoalP,__Reason,__GoalText,__RuleInfo,__Goal,__GoalP,__GoalText,__InfoObject,__GoalP,__Reason,__GoalText,__RuleInfo,__Goal,__Goal,__PosGoal,__PosGoal,__PosGoal,__PosGoalP,__PosGoalP,__GoalText,__InfoObject,__PosGoalP,__Reason,__GoalText,__RuleInfo,__GoalP,__GoalText,__InfoObject,__GoalP,__Reason,__GoalText,__RuleInfo,__Goal,__PosGoal,__PosGoal,__PosGoalP,__PosGoalP,__GoalText,__InfoObject,__PosGoalP,__Reason,__GoalText,__RuleInfo,__GoalP,__GoalText,__InfoObject,__GoalP,__Reason,__GoalText,__RuleInfo,__UseErgoText,__Goal,__Goal,__newdontcarevar18,__Exception,__Exception,__GoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__Goal,__GoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__Goal,__Goal,__PosGoal,__PosGoal,__PosGoal,__PosGoalP,__PosGoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__GoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__Goal,__PosGoal,__PosGoal,__PosGoalP,__PosGoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__GoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__Goal,__Goal,__newdontcarevar19,__Exception,__Exception,__InfoObject,__GoalP,__Reason,__RuleId,__Goal,__InfoObject,__GoalP,__Reason,__RuleId,__Goal,__InfoObject,__GoalP,__Reason,__RuleId,__InfoObject,__GoalP,__Reason,__RuleId],[])),__newdontcarevar20,=(__Exception,yes)),==(__Exception,yes))),','(FLORA_THIS_WORKSPACE(convert_to_text)(__GoalP,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar21,__newcontextvar22)),=(__InfoObject,flapply(unknown,__GoalP,__Reason,__GoalText,__RuleInfo)))),';'(->(fllibtruthvalue(undefined,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__Goal,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar23,__newcontextvar24))),','(FLORA_THIS_WORKSPACE(convert_to_text)(__GoalP,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar25,__newcontextvar26)),=(__InfoObject,flapply(undefined,__GoalP,__Reason,__GoalText,__RuleInfo)))),';'(->(fllibtruthvalue(false,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__Goal,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar27,__newcontextvar28))),';'(->(:(flrcanon,is_naf_literal(__Goal,__PosGoal)),','(fllibmodlit(libmod_wrapper,__PosGoal,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar29,__newcontextvar30)),','(FLORA_THIS_WORKSPACE(paraphrase)(__PosGoal,__PosGoalP,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar31,__newcontextvar32)),','(FLORA_THIS_WORKSPACE(convert_to_text)(__PosGoalP,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar33,__newcontextvar34)),=(__InfoObject,flapply(true,__PosGoalP,__Reason,__GoalText,__RuleInfo)))))),','(FLORA_THIS_WORKSPACE(convert_to_text)(__GoalP,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar35,__newcontextvar36)),=(__InfoObject,flapply(false,__GoalP,__Reason,__GoalText,__RuleInfo))))),';'(->(:(flrcanon,is_naf_literal(__Goal,__PosGoal)),','(FLORA_THIS_WORKSPACE(paraphrase)(__PosGoal,__PosGoalP,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar37,__newcontextvar38)),','(FLORA_THIS_WORKSPACE(convert_to_text)(__PosGoalP,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar39,__newcontextvar40)),=(__InfoObject,flapply(false,__PosGoalP,__Reason,__GoalText,__RuleInfo))))),','(FLORA_THIS_WORKSPACE(convert_to_text)(__GoalP,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar41,__newcontextvar42)),=(__InfoObject,flapply(true,__GoalP,__Reason,__GoalText,__RuleInfo)))))))),';'(->(==(__UseErgoText,textonly),';'(->(','(:(flrdelaysupport,is_delayed_literal(__Goal)),','(fllibcatch(','(fllibmodlit(libmod_wrapper,__Goal,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar43,__newcontextvar44)),fllibexecute_delayed_calls([__SupportObj,__SupportObj,__Goal,__newdontcarevar45,__newdontcarevar46,__newdontcarevar47,__newdontcarevar48,__newdontcarevar49,__RuleInfo,__RuleId,__RuleText,__RuleText,__Reason,__RuleText,__Reason,__Reason,__Goal,__GoalP,__UseErgoText,__Goal,__Goal,__newdontcarevar50,__Exception,__Exception,__GoalP,__GoalText,__InfoObject,__GoalP,__Reason,__GoalText,__RuleInfo,__Goal,__GoalP,__GoalText,__InfoObject,__GoalP,__Reason,__GoalText,__RuleInfo,__Goal,__Goal,__PosGoal,__PosGoal,__PosGoal,__PosGoalP,__PosGoalP,__GoalText,__InfoObject,__PosGoalP,__Reason,__GoalText,__RuleInfo,__GoalP,__GoalText,__InfoObject,__GoalP,__Reason,__GoalText,__RuleInfo,__Goal,__PosGoal,__PosGoal,__PosGoalP,__PosGoalP,__GoalText,__InfoObject,__PosGoalP,__Reason,__GoalText,__RuleInfo,__GoalP,__GoalText,__InfoObject,__GoalP,__Reason,__GoalText,__RuleInfo,__UseErgoText,__Goal,__Goal,__newdontcarevar51,__Exception,__Exception,__GoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__Goal,__GoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__Goal,__Goal,__PosGoal,__PosGoal,__PosGoal,__PosGoalP,__PosGoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__GoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__Goal,__PosGoal,__PosGoal,__PosGoalP,__PosGoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__GoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__Goal,__Goal,__newdontcarevar52,__Exception,__Exception,__InfoObject,__GoalP,__Reason,__RuleId,__Goal,__InfoObject,__GoalP,__Reason,__RuleId,__Goal,__InfoObject,__GoalP,__Reason,__RuleId,__InfoObject,__GoalP,__Reason,__RuleId],[])),__newdontcarevar53,=(__Exception,yes)),==(__Exception,yes))),','(FLORA_THIS_WORKSPACE(convert_to_text)(__GoalP,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar54,__newcontextvar55)),=(__InfoObject,flapply(unknown,__GoalText,__RuleText)))),';'(->(fllibtruthvalue(undefined,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__Goal,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar56,__newcontextvar57))),','(FLORA_THIS_WORKSPACE(convert_to_text)(__GoalP,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar58,__newcontextvar59)),=(__InfoObject,flapply(undefined,__GoalText,__RuleText)))),';'(->(fllibtruthvalue(false,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__Goal,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar60,__newcontextvar61))),';'(->(:(flrcanon,is_naf_literal(__Goal,__PosGoal)),','(fllibmodlit(libmod_wrapper,__PosGoal,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar62,__newcontextvar63)),','(FLORA_THIS_WORKSPACE(paraphrase)(__PosGoal,__PosGoalP,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar64,__newcontextvar65)),','(FLORA_THIS_WORKSPACE(convert_to_text)(__PosGoalP,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar66,__newcontextvar67)),=(__InfoObject,flapply(true,__GoalText,__RuleText)))))),','(FLORA_THIS_WORKSPACE(convert_to_text)(__GoalP,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar68,__newcontextvar69)),=(__InfoObject,flapply(false,__GoalText,__RuleText))))),';'(->(:(flrcanon,is_naf_literal(__Goal,__PosGoal)),','(FLORA_THIS_WORKSPACE(paraphrase)(__PosGoal,__PosGoalP,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar70,__newcontextvar71)),','(FLORA_THIS_WORKSPACE(convert_to_text)(__PosGoalP,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar72,__newcontextvar73)),=(__InfoObject,flapply(false,__GoalText,__RuleText))))),','(FLORA_THIS_WORKSPACE(convert_to_text)(__GoalP,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar74,__newcontextvar75)),=(__InfoObject,flapply(true,__GoalText,__RuleText)))))))),';'(->(','(:(flrdelaysupport,is_delayed_literal(__Goal)),','(fllibcatch(','(fllibmodlit(libmod_wrapper,__Goal,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar76,__newcontextvar77)),fllibexecute_delayed_calls([__SupportObj,__SupportObj,__Goal,__newdontcarevar78,__newdontcarevar79,__newdontcarevar80,__newdontcarevar81,__newdontcarevar82,__RuleInfo,__RuleId,__RuleText,__RuleText,__Reason,__RuleText,__Reason,__Reason,__Goal,__GoalP,__UseErgoText,__Goal,__Goal,__newdontcarevar83,__Exception,__Exception,__GoalP,__GoalText,__InfoObject,__GoalP,__Reason,__GoalText,__RuleInfo,__Goal,__GoalP,__GoalText,__InfoObject,__GoalP,__Reason,__GoalText,__RuleInfo,__Goal,__Goal,__PosGoal,__PosGoal,__PosGoal,__PosGoalP,__PosGoalP,__GoalText,__InfoObject,__PosGoalP,__Reason,__GoalText,__RuleInfo,__GoalP,__GoalText,__InfoObject,__GoalP,__Reason,__GoalText,__RuleInfo,__Goal,__PosGoal,__PosGoal,__PosGoalP,__PosGoalP,__GoalText,__InfoObject,__PosGoalP,__Reason,__GoalText,__RuleInfo,__GoalP,__GoalText,__InfoObject,__GoalP,__Reason,__GoalText,__RuleInfo,__UseErgoText,__Goal,__Goal,__newdontcarevar84,__Exception,__Exception,__GoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__Goal,__GoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__Goal,__Goal,__PosGoal,__PosGoal,__PosGoal,__PosGoalP,__PosGoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__GoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__Goal,__PosGoal,__PosGoal,__PosGoalP,__PosGoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__GoalP,__GoalText,__InfoObject,__GoalText,__RuleText,__Goal,__Goal,__newdontcarevar85,__Exception,__Exception,__InfoObject,__GoalP,__Reason,__RuleId,__Goal,__InfoObject,__GoalP,__Reason,__RuleId,__Goal,__InfoObject,__GoalP,__Reason,__RuleId,__InfoObject,__GoalP,__Reason,__RuleId],[])),__newdontcarevar86,=(__Exception,yes)),==(__Exception,yes))),=(__InfoObject,flapply(unknown,__GoalP,__Reason,__RuleId))),';'(->(fllibtruthvalue(undefined,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__Goal,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar87,__newcontextvar88))),=(__InfoObject,flapply(undefined,__GoalP,__Reason,__RuleId))),';'(->(fllibtruthvalue(false,FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__Goal,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar89,__newcontextvar90))),=(__InfoObject,flapply(false,__GoalP,__Reason,__RuleId))),=(__InfoObject,flapply(true,__GoalP,__Reason,__RuleId))))))))))))),fllibexecute_delayed_calls([__Exception,__Goal,__GoalP,__GoalText,__InfoObject,__PosGoal,__PosGoalP,__Reason,__RuleId,__RuleInfo,__RuleText,__SupportObj,__UseErgoText,__newdontcarevar91],[__InfoObject,__RuleInfo,__SupportObj,__UseErgoText])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__SupportObj,reason,__Reason,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(56,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(';'(->(:(flrdatatype,flora_is_var_prim(__SupportObj)),=(__Reason,null)),';'(->(==(__SupportObj,'MAX_EXPLANATION_DEPTH'),=(__Reason,max_depth_reached)),';'(->(==(__SupportObj,'REPEATED_SUBQUERY'),=(__Reason,repeated_subquery)),';'(->(','(=(__SupportObj,flapply(__Type,__newdontcarevar3,__Reason,__newdontcarevar4,__newdontcarevar5,__newdontcarevar6,__newdontcarevar7)),==(__Type,d)),'\\true'),';'(->(','(=(__SupportObj,flapply(__Type,__newdontcarevar8,__newdontcarevar9,__newdontcarevar10,__newdontcarevar11,__Reason,__newdontcarevar12)),:(flrsetops,flora_list_member(__Type,[m,w]))),'\\true'),=(__Reason,null)))))),fllibexecute_delayed_calls([__Reason,__SupportObj,__Type,__newdontcarevar13],[__Reason,__SupportObj])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__SupportObj,rule,flapply(ruleid,__Id,__File,__Mod),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(58,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','(=(__SupportObj,flapply(__Type,__newdontcarevar3,__newdontcarevar4,__newdontcarevar5,__newdontcarevar6,__newdontcarevar7,__newdontcarevar8)),','(:(flrsetops,flora_list_member(__Type,[m,w])),','(FLORA_THIS_WORKSPACE(d^mvd)(__SupportObj,goal,__Goal,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),:(flrcallflora,get_calling_rule_info(__Goal,__Id,__File,__Mod,__newdontcarevar11))))),fllibexecute_delayed_calls([__File,__Goal,__Id,__Mod,__SupportObj,__Type,__newdontcarevar12],[__File,__Id,__Mod,__SupportObj])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__SupportObj,text,__GoalText,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(60,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrdatatype,flora_is_nonvar_prim(__SupportObj)),','(=(__SupportObj,flapply(__type,__Goal,__newdontcarevar3,__newdontcarevar4,__newdontcarevar5,__newdontcarevar6,__newdontcarevar7)),','(:(flrsetops,flora_list_member(__type,[w,m,d])),','(!,FLORA_THIS_WORKSPACE(convert_to_text)(__Goal,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)))))),fllibexecute_delayed_calls([__Goal,__GoalText,__SupportObj,__newdontcarevar10,__type],[__GoalText,__SupportObj])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__SupportObj,text,__GoalText,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(62,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrdatatype,flora_is_nonvar_prim(__SupportObj)),','(=(__SupportObj,flapply(__truth_val,__Goal)),','(:(flrsetops,flora_list_member(__truth_val,[true,false,undefined,contradiction])),','(!,FLORA_THIS_WORKSPACE(convert_to_text)(__Goal,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))))),fllibexecute_delayed_calls([__Goal,__GoalText,__SupportObj,__truth_val],[__GoalText,__SupportObj])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Goal,text,__GoalText,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(64,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrdatatype,flora_is_nonvar_prim(__Goal)),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__newvar3),'_$_$_ergo''mod''\\changemodule''change_module_if_match'(__Goal,__GoalM,FLORA_THIS_MODULE_NAME,__newvar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5))),FLORA_THIS_WORKSPACE(convert_to_text)(__GoalM,__GoalText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)))),fllibexecute_delayed_calls([__Goal,__GoalM,__GoalText],[__Goal,__GoalText])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Explanation,size,__Size,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(66,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(size_of_explanation)(__Explanation,__Size,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(convert_to_text)(__Goal,__GoalText,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(68,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','(:(basics,copy_term(__Goal,__GoalCopy)),','(';'(->(:(flrwrapper,flora_decode_module_name(__GoalCopy,__M)),'\\true'),=(__M,main)),','(:(flrcanon,convert_to_body_literal(__GoalCopy,__BodyGoal)),:(flrparser,flora_decode_via_textgen(__BodyGoal,[:(ergo_textit,ergo_textit_show(__newdontcarevar3,__newdontcarevar4,__newdontcarevar5,__M)),:(ergo_textit,ergotext_textgen_show(__newdontcarevar6,__newdontcarevar7,__M))],__GoalText))))),fllibexecute_delayed_calls([__BodyGoal,__Goal,__GoalCopy,__GoalText,__M,__newdontcarevar8],[__Goal,__GoalText])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(textify,__Goal,__GoalText,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(70,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(convert_to_text)(__Goal,__GoalTextPre,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),:(flrporting,flora_undouble_quotes(__GoalTextPre,__GoalText))),fllibexecute_delayed_calls([__Goal,__GoalText,__GoalTextPre],[__Goal,__GoalText])))).
:-(FLORA_THIS_WORKSPACE(all_support)([],__newdontcarevar1,[],__newdontcarevar2,'_$ctxt'(_CallerModuleVar,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''rule_enabled'(72,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(all_support)([__H|__Rest],__Transform,[__HOut|__RestOut],__DepthIn,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(74,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibdelayedliteral('\\is','ergo_explain.ergo',805,[__Depth,+(__DepthIn,1)]),','(';'(->(FLORA_THIS_WORKSPACE(d^meth)(__H,isleaf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(=(__HOut,flapply(explanation,__H2,[])),=(__RuleId,flapply(ruleid,null,null,null)))),';'(->(','(FLORA_THIS_WORKSPACE(d^tblflapply)(max_explanation_depth,__MaxDepth,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibdelayedliteral(>,'ergo_explain.ergo',813,[__Depth,__MaxDepth])),','(=(__HOut,flapply(explanation,__H2,[])),','(=(__HChild,'MAX_EXPLANATION_DEPTH'),=(__RuleId,flapply(ruleid,null,null,null))))),';'(->(','(FLORA_THIS_WORKSPACE(d^mvd)(__H,goal,__G,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),:(ergo_explain_utils,ergo_check_subgoal(__G))),','(=(__HOut,flapply(explanation,__H2,[])),','(=(__HChild,'REPEATED_SUBQUERY'),=(__RuleId,flapply(ruleid,null,null,null))))),','(FLORA_THIS_WORKSPACE(d^mvd)(__H,goal,__G,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),','(:(ergo_explain_utils,ergo_remember_subgoal(__G)),','(';'(->(fllibuniveqform(__G,fllibmodlit(libmod_wrapper,__newdontcarevar11,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar13))),'\\true'),'\\true'),','(';'(->(','('_$_$_ergo''mod''\\fidji''justificationTreeFunction'(__HChild,__H,__newdontcarevar14,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,__newcontextvar16)),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__HChild,goal,__newquantvar17,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar18,__newcontextvar19)),:(flrcallflora,get_calling_rule_info(__newquantvar17,__Id,__File,__Mod,__newdontcarevar20))),','(FLORA_THIS_WORKSPACE(support_object_is_not_aggregate_body)(__HChild,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar21,__newcontextvar22)),\=(__Id,null)))),'\\true'),';'(->(','('_$_$_ergo''mod''\\fidji''justificationTreeFunction'(__HChild,__H,__newdontcarevar23,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar24,__newcontextvar25)),','(FLORA_THIS_WORKSPACE(d^mvd)(__HChild,reason,__newquantvar26,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar27,__newcontextvar28)),\=(__newquantvar26,null))),'\\true'),';'(->('_$_$_ergo''mod''\\fidji''justificationTreeFunction'(__HChild,__H,__newdontcarevar29,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar30,__newcontextvar31)),','(=(__Id,null),=(__File,null))),','(=(__Id,null),=(__File,null))))),','(';'(->(:(flrdatatype,flora_is_var_prim(__Mod)),=(__Mod,null)),'\\true'),','(=(__RuleId,flapply(ruleid,__Id,__File,__Mod)),','(';'(->(FLORA_THIS_WORKSPACE(d^tblflapply)(using_sorted_explanations,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar32,__newcontextvar33)),','(fllibsetof(__newdontcarevar48,[],[],','(','('_$_$_ergo''mod''\\fidji''justificationTreeFunction'(__newdontcarevar48,__H,__newdontcarevar34,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar35,__newcontextvar36)),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar48,goal,__newquantvar37,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar38,__newcontextvar39)),FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar48,goal,__newquantvar37,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar40,__newcontextvar41))),','(FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar48,goal,__newquantvar42,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar43,__newcontextvar44)),FLORA_THIS_WORKSPACE(goal_NOT_to_ignore)(__newquantvar42,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar45,__newcontextvar46))))),fllibexecute_delayed_calls([__H,__newdontcarevar48,__newdontcarevar47],[])),__newvar49),=(__SupportList,__newvar49))),','(fllibbagof(__newdontcarevar64,[],[],','(','('_$_$_ergo''mod''\\fidji''justificationTreeFunction'(__newdontcarevar64,__H,__newdontcarevar50,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar51,__newcontextvar52)),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar64,goal,__newquantvar53,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar54,__newcontextvar55)),FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar64,goal,__newquantvar53,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar56,__newcontextvar57))),','(FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar64,goal,__newquantvar58,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar59,__newcontextvar60)),FLORA_THIS_WORKSPACE(goal_NOT_to_ignore)(__newquantvar58,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar61,__newcontextvar62))))),fllibexecute_delayed_calls([__H,__newdontcarevar64,__newdontcarevar63],[])),__newvar65),=(__SupportList,__newvar65))),','(FLORA_THIS_WORKSPACE(all_support)(__SupportList,__Transform,__AllSupportList,__Depth,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar66,__newcontextvar67)),=(__HOut,flapply(explanation,__H2,__AllSupportList))))))))))))),','(FLORA_THIS_WORKSPACE(d^mvd)(__HChild,reason,__Reason,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar68,__newcontextvar69)),','(FLORA_THIS_WORKSPACE(get_rule_text)(__HChild,__RuleId,__Mod,__CandidateRuleText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar70,__newcontextvar71)),','(FLORA_THIS_WORKSPACE(choose_rule_text)(__Reason,__CandidateRuleText,__RuleText,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar72,__newcontextvar73)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(__Transform,__H,flapply(ruleinfo,__RuleId,__RuleText),__H2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar74,__newcontextvar75)),FLORA_THIS_WORKSPACE(all_support)(__Rest,__Transform,__RestOut,__Depth,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar76,__newcontextvar77)))))))),fllibexecute_delayed_calls([__AllSupportList,__CandidateRuleText,__Depth,__DepthIn,__File,__G,__H,__H2,__HChild,__HOut,__Id,__MaxDepth,__Mod,__Reason,__Rest,__RestOut,__RuleId,__RuleText,__SupportList,__Transform,__newdontcarevar78],[__DepthIn,__H,__HOut,__Rest,__RestOut,__Transform])))).
:-(FLORA_THIS_WORKSPACE(size_of_explanation)([],0,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(76,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(size_of_explanation)([__H|__T],__Size,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(78,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(size_of_explanation)(__H,__S1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(size_of_explanation)(__T,__S2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibdelayedliteral('\\is','ergo_explain.ergo',879,[__Size,+(__S1,__S2)]))),fllibexecute_delayed_calls([__H,__S1,__S2,__Size,__T],[__H,__Size,__T])))).
:-(FLORA_THIS_WORKSPACE(size_of_explanation)(flapply(explanation,___Call,__Support),__Size,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(80,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(size_of_explanation)(__Support,__S1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),fllibdelayedliteral('\\is','ergo_explain.ergo',882,[__Size,+(__S1,1)])),fllibexecute_delayed_calls([__S1,__Size,__Support],[__Size,__Support,___Call])))).
:-(FLORA_THIS_WORKSPACE(paraphrase)(__newvar1,__Presentation,'_$ctxt'(_CallerModuleVar,__newcontextvar4,__newcontextvar5)),','('_$_$_ergo''rule_enabled'(82,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(fllibuniveqform(__newvar1,:(flrauxil,sub_compound(__Meth,__MthGeneralization,__newdontcarevar2,__newdontcarevar3))),','(','(!,','(:(flrdecode,flora_decode_oid_list_as_atom_list([__Meth,__MthGeneralization],[__MethAtm,__MthGenAtm])),:(flrporting,flora_concat_atoms(['method ',__MthGenAtm,' is a generalization of ',__MethAtm],__Presentation)))),fllibexecute_delayed_calls([__Meth,__MethAtm,__MthGenAtm,__MthGeneralization,__Presentation],[__Meth,__MthGeneralization,__Presentation,__newdontcarevar6]))))).
:-(FLORA_THIS_WORKSPACE(paraphrase)(__newvar1,__Presentation,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(84,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(fllibuniveqform(__newvar1,:(flrauxil,sub_compound_eq(__Meth,__MthGeneralization,__newdontcarevar2,__newdontcarevar3,__newdontcarevar4))),','(','(!,','(:(flrdecode,flora_decode_oid_list_as_atom_list([__Meth,__MthGeneralization],[__MethAtm,__MthGenAtm])),:(flrporting,flora_concat_atoms(['method ',__MthGenAtm,' is a generalization of ',__MethAtm],__Presentation)))),fllibexecute_delayed_calls([__Meth,__MethAtm,__MthGenAtm,__MthGeneralization,__Presentation],[__Meth,__MthGeneralization,__Presentation,__newdontcarevar7]))))).
:-(FLORA_THIS_WORKSPACE(paraphrase)(___Goal,___Goal,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(86,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(goal_NOT_to_ignore)(__X,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(88,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(ignored_goal)(__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))).
:-(FLORA_THIS_WORKSPACE(ignored_goal)(__G,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(90,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(convert_to_text)(__G,__GT,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),==(__GT,'\\IGNORE')),fllibexecute_delayed_calls([__G,__GT],[__G])))).
:-(FLORA_THIS_WORKSPACE(ignored_goal)(__newvar1,'_$ctxt'(_CallerModuleVar,__newcontextvar4,__newcontextvar5)),','('_$_$_ergo''rule_enabled'(92,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),fllibuniveqform(__newvar1,fllibexecute_delayed_calls(__newdontcarevar2,__newdontcarevar3)))).
:-(FLORA_THIS_WORKSPACE(check_callable)(__Goal,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(94,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','(:(usermod,atom(__Goal)),','(\+(FLORA_THIS_WORKSPACE(d^isa)(__Goal,'\\modular','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),','(!,','(FLORA_WORKSPACE(\\show,d^mvd)(__Goal,show,__GoalA,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_WORKSPACE(\\system,d^tblflapply)(sysabort,['<Explanation API> ',__GoalA,': the goal to be explained must be a callable formula'],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)))))),fllibexecute_delayed_calls([__Goal,__GoalA],[__Goal])))).
:-(FLORA_THIS_WORKSPACE(check_callable)(__Goal,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(96,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(:(flrdatatype,flora_is_nonvar_prim(__Goal)),','(FLORA_THIS_WORKSPACE(d^isa)(__Goal,'\\callable','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),!)))).
:-(FLORA_THIS_WORKSPACE(check_callable)(__Goal,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(98,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_WORKSPACE(\\show,d^mvd)(__Goal,show,__GoalA,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_WORKSPACE(\\system,d^tblflapply)(sysabort,['<Explanation API> ',__GoalA,': the goal to be explained must be a callable formula'],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))),fllibexecute_delayed_calls([__Goal,__GoalA],[__Goal])))).
:-(FLORA_THIS_WORKSPACE(get_rule_text)(__ChildObj,__RuleId,__Mod,__RuleText,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(100,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','(=(__RuleId,flapply(ruleid,__Id,__File,__ModOrNull)),','(';'(->(==(__ModOrNull,null),=(__RealMod,__Mod)),=(__RealMod,__ModOrNull)),','(';'(->(:(flrdatatype,flora_is_var_prim(__ChildObj)),=(__RuleText,'this is a base fact or a builtin')),';'(->(:(flrdatatype,flora_is_var_prim(__Id)),','(=(__Id,null),','(FLORA_THIS_WORKSPACE(d^mvd)(__ChildObj,reason,__Reason,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),';'(->(==(__Reason,null),=(__RuleText,'inferrence rule cannot be determined')),','(FLORA_THIS_WORKSPACE(printable_axiom)(__Reason,__PrintableReason,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),';'(->(==(__Reason,'it is a base fact'),=(__RuleText,__PrintableReason)),fllibdelayedliteral('\\is','ergo_explain.ergo',946,[__RuleText,'||'('axiom|',__PrintableReason)]))))))),';'(->(','(\==(__Id,null),:(flrdescriptor_support,call_metafacts(','('_$_$_ergo''prop_descriptor'(__Id,__newvar20,__RealMod,type,__newvar24,__newvar19),','('_$_$_ergo''tag_descriptor'(__Id,__newvar20,__RealMod,__newvar23,__newvar19),','('_$_$_ergo''tag_descriptor'(__Id,__File,__RealMod,__newdontcarevar21,__newvar19),','('_$_$_ergo''tag_descriptor'(__Id,__newvar20,__RealMod,__newdontcarevar22,__newvar19),'_$_$_ergo''prop_descriptor'(__Id,__newvar20,__RealMod,textit,__RuleText,__newvar19)))))))),'\\true'),';'(->(','(FLORA_THIS_WORKSPACE(d^mvd)(__ChildObj,reason,__Reason,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar25,__newcontextvar26)),\==(__Reason,null)),','(FLORA_THIS_WORKSPACE(printable_axiom)(__Reason,__PrintableReason,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar27,__newcontextvar28)),';'(->(==(__Reason,'it is a base fact'),=(__RuleText,__PrintableReason)),fllibdelayedliteral('\\is','ergo_explain.ergo',956,[__RuleText,'||'('axiom|',__PrintableReason)])))),';'(->(\==(__Id,null),=(__RuleText,'no text given for the relevant rule')),=(__RuleText,'derived via a builtin axiom (negation, defeasibility, composite goal, etc.)')))))),';'(->(:(flrdatatype,flora_is_var_prim(__File)),=(__File,null)),'\\true')))),fllibexecute_delayed_calls([__ChildObj,__File,__Id,__Mod,__ModOrNull,__PrintableReason,__RealMod,__Reason,__RuleId,__RuleText],[__ChildObj,__Mod,__RuleId,__RuleText])))).
:-(FLORA_THIS_WORKSPACE(choose_rule_text)(__Reason,__CandidateText,__RealText,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(102,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(';'(->(';'(==(__Reason,null),:(flrdatatype,flora_is_var_prim(__Reason))),=(__RealText,__CandidateText)),';'(->(==(__Reason,max_depth_reached),=(__RealText,'maximum explanation depth reached')),';'(->(==(__Reason,repeated_subquery),=(__RealText,'already explained subquery')),';'(->(','(:(flrdatatype,flora_is_nonvar_prim(__CandidateText)),:(flrsetops,flora_list_member(__CandidateText,['inferrence rule cannot be determined','derived via a builtin axiom (negation, defeasibility, composite goal, etc.)']))),','(FLORA_THIS_WORKSPACE(printable_axiom)(__Reason,__PrintableReason,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),';'(->(==(__Reason,'it is a base fact'),=(__RealText,__PrintableReason)),fllibdelayedliteral('\\is','ergo_explain.ergo',981,[__RealText,'||'('axiom|',__PrintableReason)])))),=(__RealText,__CandidateText))))),fllibexecute_delayed_calls([__CandidateText,__PrintableReason,__RealText,__Reason],[__CandidateText,__RealText,__Reason])))).
:-(FLORA_THIS_WORKSPACE(printable_axiom)('equality axiom','derived by equality substitution','_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(104,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(printable_axiom)(disqualified,'defeated by disqualification','_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(106,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(printable_axiom)(rebuttedBy,'defeated by rebuttal','_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(108,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(printable_axiom)(refutedBy,'defeated by refutation','_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(110,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(printable_axiom)(beatenByStrictRule,'defeated by refutation','_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(112,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(printable_axiom)('aggregate expression','computed via an aggregate function','_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(114,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(printable_axiom)(canceled,'defeated by cancellation','_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(116,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),!)).
FLORA_THIS_WORKSPACE(printable_axiom)(___X,___X,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)).
:-(FLORA_THIS_WORKSPACE(support_object_is_not_aggregate_body)(__SuppObj,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(118,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrdatatype,flora_is_nonvar_prim(__SuppObj)),','(=(__SuppObj,flapply(___Type,__newdontcarevar3,__newdontcarevar4,__newdontcarevar5,__CallerId,__newdontcarevar6,__newdontcarevar7)),\==(__CallerId,fj_bodyExpression))),fllibexecute_delayed_calls([__CallerId,__SuppObj,__newdontcarevar8,___Type],[__SuppObj])))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(explanation2json,2,FLORA_THIS_MODULE_NAME),prolog(explanationSupport2json,2,FLORA_THIS_MODULE_NAME)]))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Explanation,toJson,__Json,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(120,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(explanation2json)(__Explanation,__Json_pre,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(basics,flatten(__Json_pre,__Json_pre2)),:(flrporting,flora_concat_items(__Json_pre2,__Json)))),fllibexecute_delayed_calls([__Explanation,__Json,__Json_pre,__Json_pre2],[__Explanation,__Json])))).
:-(FLORA_THIS_WORKSPACE(explanation2json)(__Explanation,['{ "truthvalue":"',__TruthVal,'", "goal":"',__GoalTextEscaped,'", "ruleinfo":"',__RuleTextEscaped,'", "support":[',__SupportJson,']}'],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(122,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(','(=(__Explanation,flapply(explanation,flapply(__TruthVal,__GoalText,__RuleText),__SupportList)),','(!,','(:(flrporting,flora_escape_2quotes_backslash_in_atom_undouble_quotes(__GoalText,__GoalTextEscaped)),','(:(flrporting,flora_escape_2quotes_backslash_in_atom(__RuleText,__RuleTextEscaped)),FLORA_THIS_WORKSPACE(explanationSupport2json)(__SupportList,__SupportJson,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))))),fllibexecute_delayed_calls([__Explanation,__GoalText,__GoalTextEscaped,__RuleText,__RuleTextEscaped,__SupportJson,__SupportList,__TruthVal],[__Explanation,__GoalTextEscaped,__RuleTextEscaped,__SupportJson,__TruthVal])))).
:-(FLORA_THIS_WORKSPACE(explanation2json)(__Explanation,'_','_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(124,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),FLORA_WORKSPACE(\\system,d^tblflapply)(sysabort,['The method toJson handles only explanations produced via
		the why(full,textonly) method. The below explanation is not:
		   ',__Explanation],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(explanationSupport2json)([],[],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(126,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(explanationSupport2json)([__Expl|__SupportList],[__ExplJson,__Separator|__SupportJson],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(128,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(explanation2json)(__Expl,__ExplJson,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(';'(->(==(__SupportList,[]),=(__Separator,'')),=(__Separator,',')),FLORA_THIS_WORKSPACE(explanationSupport2json)(__SupportList,__SupportJson,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(using_sorted_explanations,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(130,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),:(gensym,conget('_$_$ergo^use unsorted explanations',0)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(using_unsorted_explanations,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(132,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),:(gensym,conget('_$_$ergo^use unsorted explanations',1)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(use_sorted_explanations,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(134,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),:(gensym,conset('_$_$ergo^use unsorted explanations',0)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(use_unsorted_explanations,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(136,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),:(gensym,conset('_$_$ergo^use unsorted explanations',1)))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(set_max_explanation_depth,__Depth,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(138,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(clear_max_explanation_depth,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),fllibinsert(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(tblflapply)(max_explanation_depth,__Depth,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar5,__newcontextvar6)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(clear_max_explanation_depth,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(140,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),','(fllibdeleteall(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(tblflapply)(max_explanation_depth,__newdontcarevar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),fllibexecute_delayed_calls([__newdontcarevar6],[])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(get_max_explanation_depth,__Depth,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(142,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(max_explanation_depth,__Depth,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(ignore_repeated_subgoals,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(144,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),:(ergo_explain_utils,ergo_ignore_repeated_subgoals(on)))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(expand_repeated_subgoals,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(146,'ergo_explain.ergo',FLORA_THIS_MODULE_NAME),:(ergo_explain_utils,ergo_ignore_repeated_subgoals(off)))).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rule signatures %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%% Signatures for latent queries %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%% Queries found in the source file %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_WORKSPACE(\\system,d^meth)('Method',flapply(mustDefine,off,FLORA_THIS_WORKSPACE(d^tblflapply)(max_explanation_depth,__newdontcarevar1,'_$ctxt'(__newcontextvar2,__newcontextvar3,__newcontextvar4))),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(:(flrutils,flora_feedback_control(tempoff)),FLORA_THIS_WORKSPACE(d^nontblflapply)(initialize,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar1,__newcontextvar2)))),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(use_sorted_explanations,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar1,__newcontextvar2))),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^nontblflapply)(expand_repeated_subgoals,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar1,__newcontextvar2))),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^nontblflapply)(set_max_explanation_depth,30,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar1,__newcontextvar2))),[])).

 
#if !defined(FLORA_FLS2_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLS2_FILENAME  'ergo_explain.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('ergo_explain.ergo',FLORA_THIS_MODULE_NAME))).

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

:-(FLORA_THIS_WORKSPACE(all_support)(_h1402458,_h1402460,_h1402462,_h1402464,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(all_support))(_h1402458,_h1402460,_h1402462,_h1402464,FWContext)).
:-(FLORA_THIS_WORKSPACE(change_module_if_match)(_h1403093,_h1403095,_h1403097,_h1403099,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(change_module_if_match))(_h1403093,_h1403095,_h1403097,_h1403099,FWContext)).
:-(FLORA_THIS_WORKSPACE(check_callable)(_h1403904,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(check_callable))(_h1403904,FWContext)).
:-(FLORA_THIS_WORKSPACE(check_justification_type)(_h1404575,_h1404577,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(check_justification_type))(_h1404575,_h1404577,FWContext)).
:-(FLORA_THIS_WORKSPACE(childOfDefeated)(_h1405410,_h1405412,_h1405414,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(childOfDefeated))(_h1405410,_h1405412,_h1405414,FWContext)).
:-(FLORA_THIS_WORKSPACE(choose_rule_text)(_h1406105,_h1406107,_h1406109,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(choose_rule_text))(_h1406105,_h1406107,_h1406109,FWContext)).
:-(FLORA_THIS_WORKSPACE(convert_to_text)(_h1406816,_h1406818,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(convert_to_text))(_h1406816,_h1406818,FWContext)).
:-(FLORA_THIS_WORKSPACE(explanation2json)(_h1407507,_h1407509,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(explanation2json))(_h1407507,_h1407509,FWContext)).
:-(FLORA_THIS_WORKSPACE(explanationSupport2json)(_h1408214,_h1408216,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(explanationSupport2json))(_h1408214,_h1408216,FWContext)).
:-(FLORA_THIS_WORKSPACE(full_support_info)(_h1409033,_h1409035,_h1409037,_h1409039,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(full_support_info))(_h1409033,_h1409035,_h1409037,_h1409039,FWContext)).
:-(FLORA_THIS_WORKSPACE(get_justification_type)(_h1409764,_h1409766,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(get_justification_type))(_h1409764,_h1409766,FWContext)).
:-(FLORA_THIS_WORKSPACE(get_rule_text)(_h1410567,_h1410569,_h1410571,_h1410573,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(get_rule_text))(_h1410567,_h1410569,_h1410571,_h1410573,FWContext)).
:-(FLORA_THIS_WORKSPACE(goal_NOT_to_ignore)(_h1411234,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(goal_NOT_to_ignore))(_h1411234,FWContext)).
:-(FLORA_THIS_WORKSPACE(ignored_goal)(_h1411969,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(ignored_goal))(_h1411969,FWContext)).
:-(FLORA_THIS_WORKSPACE(immediate_support)(_h1412608,_h1412610,_h1412612,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(immediate_support))(_h1412608,_h1412610,_h1412612,FWContext)).
:-(FLORA_THIS_WORKSPACE(immediate_support_internal)(_h1413335,_h1413337,_h1413339,_h1413341,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(immediate_support_internal))(_h1413335,_h1413337,_h1413339,_h1413341,FWContext)).
:-(FLORA_THIS_WORKSPACE(justificationTreeFunction)(_h1414210,_h1414212,_h1414214,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(justificationTreeFunction))(_h1414210,_h1414212,_h1414214,FWContext)).
:-(FLORA_THIS_WORKSPACE(paraphrase)(_h1415065,_h1415067,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(paraphrase))(_h1415065,_h1415067,FWContext)).
:-(FLORA_THIS_WORKSPACE(printable_axiom)(_h1415676,_h1415678,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(printable_axiom))(_h1415676,_h1415678,FWContext)).
:-(FLORA_THIS_WORKSPACE(size_of_explanation)(_h1416367,_h1416369,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(size_of_explanation))(_h1416367,_h1416369,FWContext)).
:-(FLORA_THIS_WORKSPACE(support_info)(_h1417122,_h1417124,_h1417126,_h1417128,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(support_info))(_h1417122,_h1417124,_h1417126,_h1417128,FWContext)).
:-(FLORA_THIS_WORKSPACE(support_object_is_not_aggregate_body)(_h1417773,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(support_object_is_not_aggregate_body))(_h1417773,FWContext)).
