
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
#define FLORA_THIS_FILENAME  'ergo2json.ergo'
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
  file: libinc/flrsub_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(':'(flrlibman,flora_load_system_module(FLSYSMODSUB))).

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

:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(get_json_root_fact)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(get_json_root_fact)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(get_json_root_fact)(_h819754,_h819756,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(get_json_root_fact))(_h819754,_h819756,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(json_facts)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(json_facts)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(json_facts)(_h820498,_h820500,_h820502,_h820504,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(json_facts))(_h820498,_h820500,_h820502,_h820504,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(json_facts)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(json_facts)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(json_facts)(_h821122,_h821124,_h821126,_h821128,_h821130,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(json_facts))(_h821122,_h821124,_h821126,_h821128,_h821130,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(json_facts_to_file)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(json_facts_to_file)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(json_facts_to_file)(_h821750,_h821752,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(json_facts_to_file))(_h821750,_h821752,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(json_facts_to_file_aux)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(json_facts_to_file_aux)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(json_facts_to_file_aux)(_h822494,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(json_facts_to_file_aux))(_h822494,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(json_facts_to_memory)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(json_facts_to_memory)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(json_facts_to_memory)(_h823298,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(json_facts_to_memory))(_h823298,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(json_keyval_facts)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(json_keyval_facts)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(json_keyval_facts)(_h824070,_h824072,_h824074,_h824076,_h824078,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(json_keyval_facts))(_h824070,_h824072,_h824074,_h824076,_h824078,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(new_json_root)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(new_json_root)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(new_json_root)(_h824810,_h824812,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(new_json_root))(_h824810,_h824812,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(object_has_been_seen)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(object_has_been_seen)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(object_has_been_seen)(_h825474,_h825476,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(object_has_been_seen))(_h825474,_h825476,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(object_to_json_aux)),7),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(object_to_json_aux)),7)),opaque))).
:-(FLORA_THIS_WORKSPACE(object_to_json_aux)(_h826250,_h826252,_h826254,_h826256,_h826258,_h826260,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(object_to_json_aux))(_h826250,_h826252,_h826254,_h826256,_h826258,_h826260,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(process_key_val_pairs)),7),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(process_key_val_pairs)),7)),opaque))).
:-(FLORA_THIS_WORKSPACE(process_key_val_pairs)(_h827010,_h827012,_h827014,_h827016,_h827018,_h827020,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(process_key_val_pairs))(_h827010,_h827012,_h827014,_h827016,_h827018,_h827020,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(save_json_root)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(save_json_root)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(save_json_root)(_h827818,_h827820,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(save_json_root))(_h827818,_h827820,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(term_to_json_aux)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(term_to_json_aux)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(term_to_json_aux)(_h828498,_h828500,_h828502,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(term_to_json_aux))(_h828498,_h828500,_h828502,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(term_to_json_list)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(term_to_json_list)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(term_to_json_list)(_h829214,_h829216,_h829218,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(term_to_json_list))(_h829214,_h829216,_h829218,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(term_to_json_list_aux)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(term_to_json_list_aux)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(term_to_json_list_aux)(_h829946,_h829948,_h829950,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(term_to_json_list_aux))(_h829946,_h829948,_h829950,FWContext)).
 
#if !defined(FLORA_FLM_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLM_FILENAME  'ergo2json.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(ergo2json,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'ergo2json.fld'
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
#define FLORA_FLS_FILENAME  'ergo2json.fls'
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

:-(fllibexport([[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar1,parse,__newdontcarevar2,__newcontextvar5))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar6,flapply(parse,__newdontcarevar7),__newdontcarevar8,__newcontextvar11))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar12,flapply(parse2memory,__newdontcarevar13),__newcontextvar16))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar17,flapply(parse2memory,__newdontcarevar18,__newdontcarevar19),__newcontextvar22))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar23,flapply(parse2file,__newdontcarevar24),__newcontextvar27))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar28,flapply(parse2file,__newdontcarevar29,__newdontcarevar30),__newcontextvar33))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(set_options,__newdontcarevar34,__newcontextvar37))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(set_option,__newdontcarevar38,__newcontextvar41))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(get_option,__newdontcarevar42,__newdontcarevar43,__newcontextvar46))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar47,json_root,__newdontcarevar48,__newcontextvar51))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar52,forget_roots,__newcontextvar55))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar56,flapply(add_json_root,__newdontcarevar57),__newcontextvar60))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(ensure_loaded,__newcontextvar63))]])).
:-(fllibexport([[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar1,term2json,__newdontcarevar2,__newcontextvar5))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar6,object2json,__newdontcarevar7,__newcontextvar10))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar11,flapply(object2json,__newdontcarevar12,__newdontcarevar13,__newdontcarevar14),__newdontcarevar15,__newcontextvar18))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar19,flapply(object2json,__newdontcarevar20),__newdontcarevar21,__newcontextvar24))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar25,flapply(flapply(object2json,__newdontcarevar26),__newdontcarevar27,__newdontcarevar28,__newdontcarevar29),__newdontcarevar30,__newcontextvar33))]])).
?-(:(flrprolog,flora_define_modular_prolog([prolog(json_facts_to_memory,1,FLORA_THIS_MODULE_NAME),prolog(json_facts_to_file,2,FLORA_THIS_MODULE_NAME),prolog(json_facts_to_file_aux,1,FLORA_THIS_MODULE_NAME),prolog(json_facts,4,FLORA_THIS_MODULE_NAME),prolog(json_facts,5,FLORA_THIS_MODULE_NAME),prolog(json_keyval_facts,5,FLORA_THIS_MODULE_NAME),prolog(new_json_root,2,FLORA_THIS_MODULE_NAME),prolog(term_to_json_aux,3,FLORA_THIS_MODULE_NAME),prolog(term_to_json_list,3,FLORA_THIS_MODULE_NAME),prolog(term_to_json_list_aux,3,FLORA_THIS_MODULE_NAME),prolog(object_to_json_aux,6,FLORA_THIS_MODULE_NAME),prolog(object_has_been_seen,2,FLORA_THIS_MODULE_NAME),prolog(save_json_root,2,FLORA_THIS_MODULE_NAME),prolog(get_json_root_fact,2,FLORA_THIS_MODULE_NAME),prolog(process_key_val_pairs,6,FLORA_THIS_MODULE_NAME)]))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(initialize,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(4,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrporting,flora_install_dir(__ErgoDir)),','(:(flrporting,flora_slash(__S)),','(FLORA_WORKSPACE(\\basetype,d^mvd)('\\symbol',flapply(concat,[__ErgoDir,__S,ergo_lib,__S,ergo2json]),__EJdir,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_WORKSPACE(\\system,d^meth)('Libpath',flapply(add,__EJdir),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibload([jsonlib],'/home/kifer/ERGOAI/ErgoEngine/ErgoAI/ergo_lib/ergo2json.ergo',FLORA_THIS_MODULE_NAME,[91,2]))))),fllibexecute_delayed_calls([__EJdir,__ErgoDir,__S],[])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(ensure_loaded,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(6,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Src,parse,__Result,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(8,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^mvd)(__Src,flapply(parse,''),__Result,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Src,flapply(parse,__Selector),__Result,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(10,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(:(flrdatatype,flora_is_var_prim(__Src)),','(!,:(jsonlib,ergo_parse_json(__Src,__Selector,__Result)))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Src,flapply(parse,__Selector),__Result,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(12,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\string','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__Src,__newdontcarevar4)),','(!,:(jsonlib,ergo_parse_json(string(__Src),__Selector,__Result)))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Src,flapply(parse,__Selector),__Result,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(14,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(:(usermod,atom(__Src)),','(!,:(jsonlib,ergo_parse_json(__Src,__Selector,__Result)))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(file,__Src),flapply(parse,__Selector),__Result,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(16,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(!,:(jsonlib,ergo_parse_json(__Src,__Selector,__Result))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(string,__Src),flapply(parse,__Selector),__Result,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(18,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(!,:(jsonlib,ergo_parse_json(string(__Src),__Selector,__Result))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(str,__Src),flapply(parse,__Selector),__Result,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(20,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(!,:(jsonlib,ergo_parse_json(string(__Src),__Selector,__Result))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(flapply(url,__Src),flapply(parse,__Selector),__Result,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(22,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(!,:(jsonlib,ergo_parse_json(url(__Src),__Selector,__Result))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(set_options,__Opts,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(24,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),:(jsonlib,ergo_set_options(__Opts)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(set_option,__Opt,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(26,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),:(jsonlib,ergo_set_option(__Opt)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(get_option,__Name,__Val,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(28,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),:(jsonlib,ergo_get_option(__Name,__Val)))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__Src,flapply(parse2memory,__Mod),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(30,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^meth)(__Src,flapply(parse2memory,__Mod,''),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__Src,flapply(parse2memory,__Mod,__Selector),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(32,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(','(:(usermod,atom(__Mod)),','(:(usermod,atom(__Selector)),','(';'(->(:(flrregistry,flora_user_module_registry(__Mod)),'\\true'),fllibnewmodule(FLORA_THIS_MODULE_NAME,__Mod)),','(FLORA_THIS_WORKSPACE(d^mvd)(__Src,flapply(parse,__Selector),__JsonTerm,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(json_facts)(__JsonTerm,__Mod,term,__JsonFacts,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(save_json_root)(__JsonFacts,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),FLORA_THIS_WORKSPACE(json_facts_to_memory)(__JsonFacts,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)))))))),fllibexecute_delayed_calls([__JsonFacts,__JsonTerm,__Mod,__Selector,__Src],[__Mod,__Selector,__Src])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__Src,flapply(parse2file,__File),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(34,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^meth)(__Src,flapply(parse2file,__File,''),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__Src,flapply(parse2file,__File,__Selector),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(36,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(','(:(usermod,atom(__File)),','(:(usermod,atom(__Selector)),','(FLORA_THIS_WORKSPACE(d^mvd)(__Src,flapply(parse,__Selector),__JsonTerm,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(json_facts)(__JsonTerm,__newdontcarevar5,to_file,__JsonFacts,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),','(FLORA_THIS_WORKSPACE(get_json_root_fact)(__JsonFacts,__OidFact,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),FLORA_THIS_WORKSPACE(json_facts_to_file)([__OidFact|__JsonFacts],__File,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11))))))),fllibexecute_delayed_calls([__File,__JsonFacts,__JsonTerm,__OidFact,__Selector,__Src,__newdontcarevar12],[__File,__Selector,__Src])))).
:-(FLORA_THIS_WORKSPACE(json_facts)(flapply(json,__ArgList),__Mod,__OutMode,__Result,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(38,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(','(!,','(FLORA_THIS_WORKSPACE(json_facts)(flapply(json,__ArgList),__Mod,__OutMode,__Result_pre,__newdontcarevar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),:(basics,flatten(__Result_pre,__Result)))),fllibexecute_delayed_calls([__ArgList,__Mod,__OutMode,__Result,__Result_pre,__newdontcarevar6],[__ArgList,__Mod,__OutMode,__Result])))).
:-(FLORA_THIS_WORKSPACE(json_facts)(__ArgList,__newdontcarevar1,__newdontcarevar2,__newdontcarevar3,'_$ctxt'(_CallerModuleVar,__newcontextvar4,__newcontextvar5)),','('_$_$_ergo''rule_enabled'(40,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_WORKSPACE(\\basetype,d^mvd)('\\symbol',flapply(toType,__ArgList),__ArgListAtm,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(nl,2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),','(FLORA_WORKSPACE(\\system,d^tblflapply)(warning,['only JSON object-terms can be converted to Ergo facts;
		 offending term: ',__ArgListAtm],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11)),'\\false'))),fllibexecute_delayed_calls([__ArgList,__ArgListAtm],[__ArgList,__newdontcarevar12])))).
:-(FLORA_THIS_WORKSPACE(json_facts)(flapply(json,__ArgList),__Mod,__OutMode,__Result,__Oid,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(42,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(!,','(FLORA_THIS_WORKSPACE(d^tblflapply)(new_json_oid,__OutMode,__Oid,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(json_keyval_facts)(__Oid,__ArgList,__Mod,__OutMode,__Result,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))))).
:-(FLORA_THIS_WORKSPACE(json_facts)([],__newdontcarevar1,__newdontcarevar2,[],[],'_$ctxt'(_CallerModuleVar,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''rule_enabled'(44,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(json_facts)([__Arg|__Rest],__Mod,__OutMode,[__Result|__RestResults],[__ArgOid|__RestOids],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(46,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(!,','(FLORA_THIS_WORKSPACE(json_facts)(__Arg,__Mod,__OutMode,__Result,__ArgOid,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(json_facts)(__Rest,__Mod,__OutMode,__RestResults,__RestOids,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))))).
:-(FLORA_THIS_WORKSPACE(json_facts)(__Arg,__newdontcarevar1,__newdontcarevar2,[],__Arg,'_$ctxt'(_CallerModuleVar,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''rule_enabled'(48,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(';'(:(usermod,number(__Arg)),:(usermod,atom(__Arg))),!))).
:-(FLORA_THIS_WORKSPACE(json_facts)(__Arg,__newdontcarevar1,__newdontcarevar2,[],__ArgOut,'_$ctxt'(_CallerModuleVar,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''rule_enabled'(50,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(';'(->(=(__Arg,flapply(true)),=(__ArgOut,'\\true')),->(=(__Arg,flapply(false)),=(__ArgOut,'\\false'))),!))).
:-(FLORA_THIS_WORKSPACE(json_facts)(__Arg,__newdontcarevar1,__newdontcarevar2,[],'NULL'(__newvar3),'_$ctxt'(_CallerModuleVar,__newcontextvar4,__newcontextvar5)),','('_$_$_ergo''rule_enabled'(52,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(=(__Arg,'NULL'(__newvar6)),!))).
:-(FLORA_THIS_WORKSPACE(json_keyval_facts)(___Oid,[],__newdontcarevar1,__newdontcarevar2,[],'_$ctxt'(_CallerModuleVar,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''rule_enabled'(54,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(json_keyval_facts)(__Oid,[=(__Key,__Val)|__Rest],__Mod,__OutMode,[__HOut,__ValResult|__RestOut],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(56,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(json_facts)(__Val,__Mod,__OutMode,__ValResult,__ValOid,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(';'(->(==(__OutMode,term),','(fllibmodobj(body,'d^mvd',[__Oid,__Key,__ValOid,'_$ctxt'(__newcontextvar5,__newcontextvar6,__newcontextvar7)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9),__newvar10),=(__HOut,__newvar10))),','(FLORA_THIS_WORKSPACE(d^tblflapply)(convert_oid,__ValOid,__ValOidAtm,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)),FLORA_WORKSPACE(\\basetype,d^mvd)('\\symbol',flapply(concat,[__Oid,'[''',__Key,''' -> ',__ValOidAtm,']']),__HOut,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14)))),FLORA_THIS_WORKSPACE(json_keyval_facts)(__Oid,__Rest,__Mod,__OutMode,__RestOut,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,__newcontextvar16)))),fllibexecute_delayed_calls([__HOut,__Key,__Mod,__Oid,__OutMode,__Rest,__RestOut,__Val,__ValOid,__ValOidAtm,__ValResult],[__HOut,__Key,__Mod,__Oid,__OutMode,__Rest,__RestOut,__Val,__ValResult])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(convert_oid,__ValOid,__ValOidAtm,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(58,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(';'(->(:(usermod,is_list(__ValOid)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(convert_oid_list,__ValOid,__ValOidList,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_WORKSPACE(\\show,d^mvd)(__ValOidList,show,__ValOidAtm,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),';'(->(','(:(usermod,atom(__ValOid)),','(\+(:(flrdatatype,'\\isiri'(__ValOid))),','(\+(:(flrdatatype,'\\isstring'(__ValOid))),\+(FLORA_WORKSPACE(\\basetype,d^meth)(__ValOid,flapply(startsWith,\##),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)))))),','(fllibdelayedliteral('\\is','ergo2json.ergo',224,[__ValOid2,'||'('''','||'(__ValOid,''''))]),FLORA_WORKSPACE(\\show,d^mvd)(__ValOid2,show,__ValOidAtm,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)))),FLORA_WORKSPACE(\\show,d^mvd)(__ValOid,show,__ValOidAtm,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)))),fllibexecute_delayed_calls([__ValOid,__ValOid2,__ValOidAtm,__ValOidList],[__ValOid,__ValOidAtm])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(convert_oid_list,[],[],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(60,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(convert_oid_list,[__Fst|__Rest],[__FstOut|__RestOut],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(62,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(convert_oid,__Fst,__FstOut,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^tblflapply)(convert_oid_list,__Rest,__RestOut,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(new_json_oid,__OutMode,__Oid,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(64,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(';'(->(==(__OutMode,term),:(flrnewoid,fllibnewoid(__Oid))),','(:(flrporting,flora_increment_counter('_$_$_ergo''json_counter',1,__Cnt,__newdontcarevar3)),:(flrporting,flora_concat_items([\##,__Cnt],__Oid)))),fllibexecute_delayed_calls([__Cnt,__Oid,__OutMode,__newdontcarevar4],[__Oid,__OutMode])))).
:-(FLORA_THIS_WORKSPACE(json_facts_to_memory)([],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(66,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(json_facts_to_memory)([__F|__FactList],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(68,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(fllibinsert(FLORA_THIS_MODULE_NAME,[__F]),FLORA_THIS_WORKSPACE(json_facts_to_memory)(__FactList,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))).
:-(FLORA_THIS_WORKSPACE(json_facts_to_file)(__FactList,__File,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(70,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_WORKSPACE(\\io,d^tblflapply)(telling,__Stream,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(tell,__File,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(json_facts_to_file_aux)(__FactList,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),','(writeln(':- new_global_oid_scope.'),','(writeln('?- new_global_oid_scope.'),','(FLORA_WORKSPACE(\\io,d^tblflapply)(told,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),FLORA_WORKSPACE(\\io,d^tblflapply)(tell,__Stream,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)))))))),fllibexecute_delayed_calls([__FactList,__File,__Stream],[__FactList,__File])))).
:-(FLORA_THIS_WORKSPACE(json_facts_to_file_aux)([],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(72,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(json_facts_to_file_aux)([__F|__FactList],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(74,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_WORKSPACE(\\io,d^tblflapply)(write,__F,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(writeln('.'),FLORA_THIS_WORKSPACE(json_facts_to_file_aux)(__FactList,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Term,term2json,__Json,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(76,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),','(FLORA_THIS_WORKSPACE(term_to_json_aux)(__Term,__Json_pre,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(basics,flatten(__Json_pre,__Json_pre2)),:(flrporting,flora_concat_items(__Json_pre2,__Json))))),fllibexecute_delayed_calls([__Json,__Json_pre,__Json_pre2,__Mod,__Term],[__Json,__Term])))).
:-(FLORA_THIS_WORKSPACE(term_to_json_aux)(__Term,__Json,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(78,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(';'(->(:(flrdatatype,flora_is_var_prim(__Term)),=(__Json,['{"variable":"',__Term,'"}'])),';'(->(fllibmetauniv(__Term,[flapply(hilog,__functor)|__Args]),','(=(__Json,['{','"functor":',__functor_json,',','"arguments":',__args_json,'}']),','(FLORA_THIS_WORKSPACE(term_to_json_aux)(__functor,__functor_json,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(term_to_json_list)(__Args,__args_json,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))),';'(->(fllibmetauniv(__Term,[flapply(hilog,__functor,__TermMod)|__Args]),','(';'(->(==(__TermMod,'\\json'),=(__RealMod,__Mod)),=(__RealMod,__TermMod)),','(:(flrporting,flora_double_backslash(__RealMod,__ModBslash)),','(=(__Json,['{','"predicate":',__functor_json,',','"module":"',__ModBslash,'",','"arguments":',__args_json,'}']),','(FLORA_THIS_WORKSPACE(term_to_json_aux)(__functor,__functor_json,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),FLORA_THIS_WORKSPACE(term_to_json_list)(__Args,__args_json,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10))))))),';'(->(fllibmetauniv(__Term,[flapply(flogic,__Type,__TermMod)|__Args]),','(';'(->(==(__TermMod,'\\json'),=(__RealMod,__Mod)),=(__RealMod,__TermMod)),','(:(flrporting,flora_double_backslash(__RealMod,__ModBslash)),','(=(__Json,['{','"frametype":"',__Type,'",','"module":"',__ModBslash,'",','"arguments":',__args_json,'}']),FLORA_THIS_WORKSPACE(term_to_json_list)(__Args,__args_json,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)))))),';'(->(=(__Term,'\\datatype'(__newdontcarevar13,__newdontcarevar14)),','(','(FLORA_WORKSPACE(\\basetype,d^mvd)(__Term,typeName,__TypNm,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,__newcontextvar16)),FLORA_WORKSPACE(\\basetype,d^mvd)(__Term,toSymbol,__TypSym,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar17,__newcontextvar18))),','(:(flrporting,flora_double_backslash(__TypNm,__TypNmEsc)),','(:(flrporting,flora_escape_2quotes_backslash_in_atom(__TypSym,__TypSymEsc)),=(__Json,['{','"datatype":"',__TypNmEsc,'",','"literal":"',__TypSymEsc,'"}']))))),';'(->(=(__Term,','(__newdontcarevar19,__newdontcarevar20)),','(:(flrauxil,commalist2list(__Term,__List)),','(FLORA_THIS_WORKSPACE(term_to_json_list)(__List,__JList,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar21,__newcontextvar22)),=(__Json,['{"commalist":',__JList,'}'])))),';'(->(:(usermod,atom(__Term)),','(:(flrporting,flora_double_backslash(__Term,__TermBslash)),=(__Json,['"',__TermBslash,'"']))),';'(->(:(usermod,number(__Term)),=(__Json,__Term)),';'(->(:(usermod,is_list(__Term)),FLORA_THIS_WORKSPACE(term_to_json_list)(__Term,__Json,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar23,__newcontextvar24))),';'(->(=(__Term,fllibdelayedliteral(__Builtin,___FileN,___Line,__Args)),','(=(__Json,['{','"prolog":"',__Builtin,'",','"module":"',usermod,'",','"arguments":',__args_json,'}']),FLORA_THIS_WORKSPACE(term_to_json_list)(__Args,__args_json,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar25,__newcontextvar26)))),';'(->(fllibmetauniv(__Term,[flapply(prologlit,__TermMod),__functor|__Args]),','(:(flrporting,flora_escape_2quotes_backslash_in_atom(__functor,__functorEsc)),','(=(__Json,['{','"prolog":"',__functorEsc,'",','"module":"',__TermMod,'",','"arguments":',__args_json,'}']),FLORA_THIS_WORKSPACE(term_to_json_list)(__Args,__args_json,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar27,__newcontextvar28))))),','(:(flrdecode,flora_decode_oid_as_atom_substitute_vars(__Term,__TermAtom)),FLORA_WORKSPACE(\\system,d^tblflapply)(sysabort,['[term-to-JSON conversion]: term not convertible to JSON, ',__TermAtom],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar29,__newcontextvar30)))))))))))))),fllibexecute_delayed_calls([__Args,__Builtin,__JList,__Json,__List,__Mod,__ModBslash,__RealMod,__Term,__TermAtom,__TermBslash,__TermMod,__TypNm,__TypNmEsc,__TypSym,__TypSymEsc,__Type,__newdontcarevar31,___FileN,___Line,__args_json,__functor,__functorEsc,__functor_json],[__Json,__Mod,__Term])))).
:-(FLORA_THIS_WORKSPACE(term_to_json_list)(__Term,['[',__Json,']'],__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(80,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(term_to_json_list_aux)(__Term,__Json,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(term_to_json_list_aux)([],[],__newdontcarevar1,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(82,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(term_to_json_list_aux)([__H|__Term],[__JH|__Json],__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(84,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(term_to_json_aux)(__H,__JH,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),';'(->(==(__Term,[]),=(__Json,[])),','(=(__Json,[',',__Json1]),FLORA_THIS_WORKSPACE(term_to_json_list_aux)(__Term,__Json1,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))),fllibexecute_delayed_calls([__H,__JH,__Json,__Json1,__Mod,__Term],[__H,__JH,__Json,__Mod,__Term])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Obj,object2json,__Json,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(86,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),FLORA_THIS_WORKSPACE(d^tblflapply)(object_to_json_aux_atom,__Obj,__Json,__Mod,'\\true','\\true','\\true','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),fllibexecute_delayed_calls([__Json,__Mod,__Obj],[__Json,__Obj])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Obj,flapply(object2json,__keyFilter,__valFilter,__classFilter),__Json,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(88,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),FLORA_THIS_WORKSPACE(d^tblflapply)(object_to_json_aux_atom,__Obj,__Json,__Mod,__keyFilter,__valFilter,__classFilter,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),fllibexecute_delayed_calls([__Json,__Mod,__Obj,__classFilter,__keyFilter,__valFilter],[__Json,__Obj,__classFilter,__keyFilter,__valFilter])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Obj,flapply(object2json,__Mod),__Json,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(90,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(object_to_json_aux_atom,__Obj,__Json,__Mod,'\\true','\\true','\\true','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Obj,flapply(flapply(object2json,__Mod),__keyFilter,__valFilter,__classFilter),__Json,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(92,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),FLORA_THIS_WORKSPACE(d^tblflapply)(object_to_json_aux_atom,__Obj,__Json,__Mod,__keyFilter,__valFilter,__classFilter,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(object_to_json_aux_atom,__Obj,__Json,__Mod,__keyFilter,__valFilter,__classFilter,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(94,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(object_to_json_aux)(__Obj,__Json_pre,__Mod,__keyFilter,__valFilter,__classFilter,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(basics,flatten(__Json_pre,__Json_pre2)),','(:(flrporting,flora_concat_items(__Json_pre2,__Json)),fllibdeleteall(FLORA_THIS_MODULE_NAME,[flsysdbupdate('_$_$_ergo''dynprologfact'(FLORA_THIS_WORKSPACE(object_has_been_seen)(__newdontcarevar5,__newdontcarevar6,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)])))),fllibexecute_delayed_calls([__Json,__Json_pre,__Json_pre2,__Mod,__Obj,__newdontcarevar9,__classFilter,__keyFilter,__valFilter],[__Json,__Mod,__Obj,__classFilter,__keyFilter,__valFilter])))).
:-(FLORA_THIS_WORKSPACE(object_to_json_aux)(__Obj,['[',__Result,']'],__Mod,__keyFilter,__valFilter,__classFilter,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(96,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(:(usermod,is_list(__Obj)),','(!,FLORA_THIS_WORKSPACE(d^tblflapply)(object_to_json_aux_list,__Obj,__Result,__Mod,__keyFilter,__valFilter,__classFilter,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))))).
:-(FLORA_THIS_WORKSPACE(object_to_json_aux)(__Obj,['{','"\\\\self":',__OidJson,__IsaPart,__SuperPart,__Json,'}'],__Mod,__keyFilter,__valFilter,__classFilter,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(98,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(term_to_json_aux)(__Obj,__OidJson,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(';'(->(:(flrauxil,flora_term_variables(__classFilter,[__supvar])),=(__real_classFilter,__classFilter)),=(__real_classFilter,'\\true')),','(','(fllibsetof(__newdontcarevar9,[],[],','(','(FLORA_WORKSPACE(\\sub,d^tblflapply)(immediate_isa,__Obj,__newdontcarevar9,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(=(__newdontcarevar9,__supvar),fllibmodlit(libmod_wrapper,__real_classFilter,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)))),fllibexecute_delayed_calls([__Mod,__Obj,__real_classFilter,__newdontcarevar9,__supvar],[])),__newvar10),=(__isa,__newvar10)),','(';'(->(==(__isa,[]),=(__IsaPart,'')),=(__IsaPart,[',"\\\\isa":',__isa_json])),','(FLORA_THIS_WORKSPACE(term_to_json_list)(__isa,__isa_json,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)),','(','(fllibsetof(__newdontcarevar17,[],[],','(','(FLORA_WORKSPACE(\\sub,d^tblflapply)(immediate_sub,__Obj,__newdontcarevar17,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14)),','(=(__newdontcarevar17,__supvar),fllibmodlit(libmod_wrapper,__real_classFilter,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,__newcontextvar16)))),fllibexecute_delayed_calls([__Mod,__Obj,__real_classFilter,__newdontcarevar17,__supvar],[])),__newvar18),=(__super,__newvar18)),','(';'(->(==(__super,[]),=(__SuperPart,'')),=(__SuperPart,[',"\\\\sub":',__super_json])),','(FLORA_THIS_WORKSPACE(term_to_json_list)(__super,__super_json,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar19,__newcontextvar20)),','(';'(->(:(flrauxil,flora_term_variables(__keyFilter,[__keyvar])),=(__real_keyFilter,__keyFilter)),=(__real_keyFilter,'\\true')),','(';'(->(:(flrauxil,flora_term_variables(__valFilter,[__valvar])),=(__real_valFilter,__valFilter)),=(__real_valFilter,'\\true')),','(';'(->(FLORA_THIS_WORKSPACE(object_has_been_seen)(__Obj,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar21,__newcontextvar22)),=(__key_val_pairs,[])),';'(->(FLORA_THIS_WORKSPACE(d^tblflapply)(get_option,duplicate_keys,true,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar23,__newcontextvar24)),','(fllibsetof(__newdontcarevar33,[],[],','(','(fllibmodlit('d^mvd',[__Obj,__key,__val,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar25,__newcontextvar26)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar27,__newcontextvar28)),','(=(__key,__keyvar),','(fllibmodlit(libmod_wrapper,__real_keyFilter,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar29,__newcontextvar30)),','(=(__val,__valvar),','(fllibmodlit(libmod_wrapper,__real_valFilter,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar31,__newcontextvar32)),=(__newdontcarevar33,','(__key,__val))))))),fllibexecute_delayed_calls([__Mod,__Obj,__key,__keyvar,__newdontcarevar33,__real_keyFilter,__real_valFilter,__val,__valvar],[])),__newvar34),=(__key_val_pairs,__newvar34))),','(fllibsetof(__newdontcarevar51,[],[],','(','(fllibmodlit('d^mvd',[__Obj,__key,__newdontcarevar35,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar36,__newcontextvar37)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar38,__newcontextvar39)),','(=(__key,__keyvar),','(fllibmodlit(libmod_wrapper,__real_keyFilter,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar40,__newcontextvar41)),','(','(fllibsetof(__newdontcarevar48,[],[],','(','(fllibmodlit('d^mvd',[__Obj,__key,__newdontcarevar48,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar42,__newcontextvar43)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar44,__newcontextvar45)),','(=(__newdontcarevar48,__valvar),fllibmodlit(libmod_wrapper,__real_valFilter,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar46,__newcontextvar47)))),fllibexecute_delayed_calls([__Mod,__Obj,__key,__real_valFilter,__newdontcarevar48,__valvar],[])),__newvar49),=(__vallist,__newvar49)),','(\==(__vallist,[]),=(__newdontcarevar51,','(__key,__vallist))))))),fllibexecute_delayed_calls([__Mod,__Obj,__newdontcarevar50,__key,__keyvar,__newdontcarevar51,__real_keyFilter,__real_valFilter,__vallist,__valvar],[])),__newvar52),=(__key_val_pairs,__newvar52)))),','(';'(->(FLORA_THIS_WORKSPACE(object_has_been_seen)(__Obj,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar53,__newcontextvar54)),'\\true'),fllibinsert(FLORA_THIS_MODULE_NAME,[flsysdbupdate('_$_$_ergo''dynprologfact'(FLORA_THIS_WORKSPACE(object_has_been_seen)(__Obj,__Mod,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar55,__newcontextvar56))),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)])),';'(->(==(__key_val_pairs,[]),=(__Json,[])),','(FLORA_THIS_WORKSPACE(process_key_val_pairs)(__key_val_pairs,__Json_pre,__Mod,__keyFilter,__valFilter,__classFilter,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar57,__newcontextvar58)),=(__Json,[','|__Json_pre]))))))))))))))),fllibexecute_delayed_calls([__IsaPart,__Json,__Json_pre,__Mod,__Obj,__OidJson,__SuperPart,__newdontcarevar59,__classFilter,__isa,__isa_json,__key,__keyFilter,__key_val_pairs,__keyvar,__real_classFilter,__real_keyFilter,__real_valFilter,__super,__super_json,__supvar,__val,__valFilter,__vallist,__valvar],[__IsaPart,__Json,__Mod,__Obj,__OidJson,__SuperPart,__classFilter,__keyFilter,__valFilter])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(object_to_json_aux_list,[__Obj|__TailObj],__Out,__Mod,__keyFilter,__valFilter,__classFilter,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(100,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(object_to_json_aux)(__Obj,__Result,__Mod,__keyFilter,__valFilter,__classFilter,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),';'(->(==(__TailObj,[]),=(__Out,[__Result])),','(=(__Out,[__Result,','|__TailResult]),FLORA_THIS_WORKSPACE(d^tblflapply)(object_to_json_aux_list,__TailObj,__TailResult,__Mod,__keyFilter,__valFilter,__classFilter,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))),fllibexecute_delayed_calls([__Mod,__Obj,__Out,__Result,__TailObj,__TailResult,__classFilter,__keyFilter,__valFilter],[__Mod,__Obj,__Out,__TailObj,__classFilter,__keyFilter,__valFilter])))).
:-(FLORA_THIS_WORKSPACE(process_key_val_pairs)([],[],__newdontcarevar1,__newdontcarevar2,__newdontcarevar3,__newdontcarevar4,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(102,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(process_key_val_pairs)([','(__key,__val)|__key_val_pairs],[__key_json,__val_json|__Json],__Mod,__keyFilter,__valFilter,__classFilter,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(104,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(','(';'(->(FLORA_THIS_WORKSPACE(d^tblflapply)(get_option,recursive_export,true,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(object_to_json_aux)(__val,__val_json_pre,__Mod,__keyFilter,__valFilter,__classFilter,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))),FLORA_THIS_WORKSPACE(term_to_json_aux)(__val,__val_json_pre,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))),','(';'(->(:(usermod,atom(__key)),','(=(__key_json,['"',__key,'":']),=(__val_json,__val_json_pre))),','(FLORA_THIS_WORKSPACE(term_to_json_aux)(__key,__key_json_pre,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),','(=(__key_json,['"\\\\keyval":[',__key_json_pre,',']),=(__val_json,[__val_json_pre,']'])))),';'(->(==(__key_val_pairs,[]),=(__Json,[])),','(=(__Json,[','|__Json_pre]),FLORA_THIS_WORKSPACE(process_key_val_pairs)(__key_val_pairs,__Json_pre,__Mod,__keyFilter,__valFilter,__classFilter,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)))))),fllibexecute_delayed_calls([__Json,__Json_pre,__Mod,__classFilter,__key,__keyFilter,__key_json,__key_json_pre,__key_val_pairs,__val,__valFilter,__val_json,__val_json_pre],[__Json,__Mod,__classFilter,__key,__keyFilter,__key_json,__key_val_pairs,__val,__valFilter,__val_json])))).
:-(FLORA_THIS_WORKSPACE(save_json_root)(__JsonFacts,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(106,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(','(=(__JsonFacts,[__TopFact|__newdontcarevar3]),','(fllibuniveqform(fllibmodlit('d^mvd',[__Oid,__newdontcarevar4,__newdontcarevar5,'_$ctxt'(__newcontextvar6,__newcontextvar7,__newcontextvar8)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),__TopFact),:(jsonlib,ergo_insert_json_root(__Mod,__Oid)))),fllibexecute_delayed_calls([__JsonFacts,__Mod,__Oid,__TopFact,__newdontcarevar11],[__JsonFacts,__Mod])))).
:-(FLORA_THIS_WORKSPACE(get_json_root_fact)(__JsonFacts,__OidFact,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(108,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),','(','(=(__JsonFacts,[__TopFact|__newdontcarevar3]),','(FLORA_WORKSPACE(\\basetype,d^mvd)(__TopFact,flapply(contains,'['),[__Beg,__newdontcarevar4],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_WORKSPACE(\\basetype,d^mvd)(__TopFact,flapply(substring,0,__Beg),__Oid,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),fllibdelayedliteral('\\is','ergo2json.ergo',477,[__OidFact,'||'('?- \\@[add_json_root(','||'(__Oid,'||'(')]@',FLORA_THIS_MODULE_NAME)))])))),fllibexecute_delayed_calls([__Beg,__JsonFacts,__Oid,__OidFact,__TopFact,__newdontcarevar9],[__JsonFacts,__OidFact])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Mod,json_root,__Oid,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(110,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),:(jsonlib,ergo_json_root(__Mod,__Oid)))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__Mod,forget_roots,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(112,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),:(jsonlib,ergo_forget_json_roots(__Mod)))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__Mod,flapply(add_json_root,__Oid),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(114,'ergo2json.ergo',FLORA_THIS_MODULE_NAME),:(jsonlib,ergo_insert_json_root(__Mod,__Oid)))).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rule signatures %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%% Signatures for latent queries %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%% Queries found in the source file %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(:(flrutils,flora_feedback_control(tempoff)),','(:(flrporting,flora_set_counter('_$_$_ergo''json_counter',1)),FLORA_THIS_WORKSPACE(d^nontblflapply)(initialize,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar1,__newcontextvar2))))),[])).

 
#if !defined(FLORA_FLS2_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLS2_FILENAME  'ergo2json.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('ergo2json.ergo',FLORA_THIS_MODULE_NAME))).

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

:-(FLORA_THIS_WORKSPACE(get_json_root_fact)(_h857019,_h857021,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(get_json_root_fact))(_h857019,_h857021,FWContext)).
:-(FLORA_THIS_WORKSPACE(json_facts)(_h857758,_h857760,_h857762,_h857764,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(json_facts))(_h857758,_h857760,_h857762,_h857764,FWContext)).
:-(FLORA_THIS_WORKSPACE(json_facts)(_h858377,_h858379,_h858381,_h858383,_h858385,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(json_facts))(_h858377,_h858379,_h858381,_h858383,_h858385,FWContext)).
:-(FLORA_THIS_WORKSPACE(json_facts_to_file)(_h859000,_h859002,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(json_facts_to_file))(_h859000,_h859002,FWContext)).
:-(FLORA_THIS_WORKSPACE(json_facts_to_file_aux)(_h859739,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(json_facts_to_file_aux))(_h859739,FWContext)).
:-(FLORA_THIS_WORKSPACE(json_facts_to_memory)(_h860538,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(json_facts_to_memory))(_h860538,FWContext)).
:-(FLORA_THIS_WORKSPACE(json_keyval_facts)(_h861305,_h861307,_h861309,_h861311,_h861313,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(json_keyval_facts))(_h861305,_h861307,_h861309,_h861311,_h861313,FWContext)).
:-(FLORA_THIS_WORKSPACE(new_json_root)(_h862040,_h862042,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(new_json_root))(_h862040,_h862042,FWContext)).
:-(FLORA_THIS_WORKSPACE(object_has_been_seen)(_h862699,_h862701,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(object_has_been_seen))(_h862699,_h862701,FWContext)).
:-(FLORA_THIS_WORKSPACE(object_to_json_aux)(_h863470,_h863472,_h863474,_h863476,_h863478,_h863480,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(object_to_json_aux))(_h863470,_h863472,_h863474,_h863476,_h863478,_h863480,FWContext)).
:-(FLORA_THIS_WORKSPACE(process_key_val_pairs)(_h864225,_h864227,_h864229,_h864231,_h864233,_h864235,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(process_key_val_pairs))(_h864225,_h864227,_h864229,_h864231,_h864233,_h864235,FWContext)).
:-(FLORA_THIS_WORKSPACE(save_json_root)(_h865028,_h865030,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(save_json_root))(_h865028,_h865030,FWContext)).
:-(FLORA_THIS_WORKSPACE(term_to_json_aux)(_h865703,_h865705,_h865707,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(term_to_json_aux))(_h865703,_h865705,_h865707,FWContext)).
:-(FLORA_THIS_WORKSPACE(term_to_json_list)(_h866414,_h866416,_h866418,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(term_to_json_list))(_h866414,_h866416,_h866418,FWContext)).
:-(FLORA_THIS_WORKSPACE(term_to_json_list_aux)(_h867141,_h867143,_h867145,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(term_to_json_list_aux))(_h867141,_h867143,_h867145,FWContext)).
