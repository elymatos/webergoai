
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

#define FLORA_COMPILATION_ID 1

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
#define FLORA_THIS_FILENAME  'flrxmllib.ergo'
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
  file: syslibinc/flraggcount_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBCOUNT))).

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
  file: libinc/flrxmllib_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(':'(flrlibman,flora_load_system_module(FLSYSMODXML))).

/***********************************************************************/
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(apply_xpath)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(apply_xpath)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(apply_xpath)(_h369422,_h369424,_h369426,_h369428,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(apply_xpath))(_h369422,_h369424,_h369426,_h369428,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(is_nav_prop)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(is_nav_prop)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(is_nav_prop)(_h370062,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(is_nav_prop))(_h370062,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(is_xml_object)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(is_xml_object)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(is_xml_object)(_h370690,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(is_xml_object))(_h370690,FWContext)).
 
#if !defined(FLORA_FLM_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLM_FILENAME  'flrxmllib.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(flrxmllib,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'flrxmllib.fld'
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
#define FLORA_FLS_FILENAME  'flrxmllib.fls'
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

?-(:(flrprolog,flora_define_modular_prolog([prolog(is_nav_prop,1,FLORA_THIS_MODULE_NAME),prolog(is_xml_object,1,FLORA_THIS_MODULE_NAME),prolog(apply_xpath,4,FLORA_THIS_MODULE_NAME)]))).
:-(fllibexport([[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(ensure_loaded,__newcontextvar3))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar4,flapply(xpath_xml,__newdontcarevar5,__newdontcarevar6,__newdontcarevar7),__newdontcarevar8,__newcontextvar11))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar12,flapply(xpath_xhtml,__newdontcarevar13,__newdontcarevar14,__newdontcarevar15),__newdontcarevar16,__newcontextvar19))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar20,flapply(load_xml,__newdontcarevar21),__newdontcarevar22,__newcontextvar25))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar26,flapply(load_sgml,__newdontcarevar27),__newdontcarevar28,__newcontextvar31))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar32,flapply(load_html,__newdontcarevar33),__newdontcarevar34,__newcontextvar37))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar38,flapply(load_xhtml,__newdontcarevar39),__newdontcarevar40,__newcontextvar43))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar44,show,__newdontcarevar45,__newcontextvar48))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar49,flapply(show,__newdontcarevar50),__newdontcarevar51,__newcontextvar54))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(parse_structure,__newdontcarevar55,__newdontcarevar56,__newdontcarevar57,__newdontcarevar58,__newcontextvar61))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(apply_xpath,__newdontcarevar62,__newdontcarevar63,__newdontcarevar64,__newdontcarevar65,__newdontcarevar66,__newdontcarevar67,__newcontextvar70))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(set_mode,__newdontcarevar71,__newcontextvar74))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(get_mode,__newdontcarevar75,__newcontextvar78))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(flrelement,__newdontcarevar79,__newdontcarevar80,__newdontcarevar81,__newdontcarevar82,__newcontextvar85))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(flrattribute,__newdontcarevar86,__newdontcarevar87,__newdontcarevar88,__newdontcarevar89,__newcontextvar92))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(flrattributefunc,__newdontcarevar93,__newdontcarevar94,__newdontcarevar95,__newdontcarevar96,__newdontcarevar97,__newcontextvar100))]])).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(ensure_loaded,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(4,'flrxmllib.flr',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(set_mode,__M,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(6,'flrxmllib.flr',FLORA_THIS_MODULE_NAME),:(flrxml,set_mode(__M)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(get_mode,__M,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(8,'flrxmllib.flr',FLORA_THIS_MODULE_NAME),:(flrxml,get_mode(__M)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flrelement,__Obj,__EltNam,__Child,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(10,'flrxmllib.flr',FLORA_THIS_MODULE_NAME),','(:(flrxml,flrxml_newoid(__Child)),','(fllibunlessdo(FLORA_THIS_MODULE_NAME,:(flrregistry,flora_user_module_registry(__Mod)),fllibnewmodule(FLORA_THIS_MODULE_NAME,__Mod),67,'flrxmllib.flr'),','(fllibinsert(FLORA_THIS_MODULE_NAME,[fllibmodlit(mvd,[__Obj,__EltNam,__Child,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar3,__newcontextvar4)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))]),','(fllibifthen(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(get_mode,debug,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),','(fllibmodobj(body,'d^mvd',[__Obj,__EltNam,__Child,'_$ctxt'(__newcontextvar9,__newcontextvar10,__newcontextvar11)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar13),__newvar14),FLORA_WORKSPACE(\\io,d^tblflapply)(writeln,__newvar14,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,__newcontextvar16))),69,'flrxmllib.flr'),!)))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flrattribute,__Obj,__AttrNam,__Val,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(12,'flrxmllib.flr',FLORA_THIS_MODULE_NAME),','(fllibunlessdo(FLORA_THIS_MODULE_NAME,:(flrregistry,flora_user_module_registry(__Mod)),fllibnewmodule(FLORA_THIS_MODULE_NAME,__Mod),74,'flrxmllib.flr'),','(fllibinsert(FLORA_THIS_MODULE_NAME,[fllibmodlit(mvd,[__Obj,__AttrNam,__Val,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar3,__newcontextvar4)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))]),','(fllibifthen(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(get_mode,debug,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),','(fllibmodobj(body,'d^mvd',[__Obj,__AttrNam,__Val,'_$ctxt'(__newcontextvar9,__newcontextvar10,__newcontextvar11)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar13),__newvar14),FLORA_WORKSPACE(\\io,d^tblflapply)(writeln,__newvar14,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,__newcontextvar16))),76,'flrxmllib.flr'),!))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flrattributefunc,__Obj,__AttrNam,__Num,__Val,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(14,'flrxmllib.flr',FLORA_THIS_MODULE_NAME),','(fllibunlessdo(FLORA_THIS_MODULE_NAME,:(flrregistry,flora_user_module_registry(__Mod)),fllibnewmodule(FLORA_THIS_MODULE_NAME,__Mod),80,'flrxmllib.flr'),','(fllibinsert(FLORA_THIS_MODULE_NAME,[fllibmodlit(mvd,[__Obj,flapply(__AttrNam,__Num),__Val,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar3,__newcontextvar4)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))]),','(fllibifthen(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(get_mode,debug,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),','(fllibmodobj(body,'d^mvd',[__Obj,flapply(__AttrNam,__Num),__Val,'_$ctxt'(__newcontextvar9,__newcontextvar10,__newcontextvar11)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar13),__newvar14),FLORA_WORKSPACE(\\io,d^tblflapply)(writeln,__newvar14,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,__newcontextvar16))),82,'flrxmllib.flr'),!))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__InDoc,flapply(xpath_xml,__XPathExpr,__NamespacePrefLst,__Mod),__Warn,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(16,'flrxmllib.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(apply_xpath)(__InDoc,__XPathExpr,__NamespacePrefLst,__SelectedDoc,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^mvd)(flapply(string,__SelectedDoc),flapply(load_xml,__Mod),__Warn,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))),fllibexecute_delayed_calls([__InDoc,__Mod,__NamespacePrefLst,__SelectedDoc,__Warn,__XPathExpr],[__InDoc,__Mod,__NamespacePrefLst,__Warn,__XPathExpr])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__InDoc,flapply(xpath_sgml,__XPathExpr,__NamespacePrefLst,__Mod),__Warn,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(18,'flrxmllib.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(apply_xpath)(__InDoc,__XPathExpr,__NamespacePrefLst,__SelectedDoc,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^mvd)(flapply(string,__SelectedDoc),flapply(load_sgml,__Mod),__Warn,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))),fllibexecute_delayed_calls([__InDoc,__Mod,__NamespacePrefLst,__SelectedDoc,__Warn,__XPathExpr],[__InDoc,__Mod,__NamespacePrefLst,__Warn,__XPathExpr])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__InDoc,flapply(xpath_html,__XPathExpr,__NamespacePrefLst,__Mod),__Warn,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(20,'flrxmllib.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(apply_xpath)(__InDoc,__XPathExpr,__NamespacePrefLst,__SelectedDoc,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^mvd)(flapply(string,__SelectedDoc),flapply(load_html,__Mod),__Warn,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))),fllibexecute_delayed_calls([__InDoc,__Mod,__NamespacePrefLst,__SelectedDoc,__Warn,__XPathExpr],[__InDoc,__Mod,__NamespacePrefLst,__Warn,__XPathExpr])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__InDoc,flapply(xpath_xhtml,__XPathExpr,__NamespacePrefLst,__Mod),__Warn,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(22,'flrxmllib.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(apply_xpath)(__InDoc,__XPathExpr,__NamespacePrefLst,__SelectedDoc,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^mvd)(flapply(string,__SelectedDoc),flapply(load_xhtml,__Mod),__Warn,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))),fllibexecute_delayed_calls([__InDoc,__Mod,__NamespacePrefLst,__SelectedDoc,__Warn,__XPathExpr],[__InDoc,__Mod,__NamespacePrefLst,__Warn,__XPathExpr])))).
:-(FLORA_THIS_WORKSPACE(apply_xpath)(__InDoc,__XPathExpr,__NamespacePrefLst,__SelectedDoc,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(24,'flrxmllib.flr',FLORA_THIS_MODULE_NAME),','(','(';'(->(:(usermod,atom(__InDoc)),=(__Doc,flapply(file,__InDoc))),=(__Doc,__InDoc)),','(flora_plg2hlg(__DocP,__Doc,flapply,1),','(','(flora_plg2hlg(__newvar3,__DocP,flapply,0),','(flora_plg2hlg(__newvar4,__XPathExpr,flapply,0),','(flora_plg2hlg(__newvar5,__SelectedDoc,flapply,0),flora_plg2hlg(__newvar6,__NamespacePrefLst,flapply,0)))),','(:(xpath,parse_xpath(__newvar3,__newvar4,__newvar5,__newvar6)),','(flora_plg2hlg(__newvar3,__DocP,flapply,1),','(flora_plg2hlg(__newvar4,__XPathExpr,flapply,1),','(flora_plg2hlg(__newvar5,__SelectedDoc,flapply,1),flora_plg2hlg(__newvar6,__NamespacePrefLst,flapply,1)))))))),fllibexecute_delayed_calls([__Doc,__DocP,__InDoc,__NamespacePrefLst,__SelectedDoc,__XPathExpr],[__InDoc,__NamespacePrefLst,__SelectedDoc,__XPathExpr])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(apply_xpath,__InDoc,__InType,__XPathExpr,__NamespacePrefLst,__Warn,__ParsedTerm,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(26,'flrxmllib.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(apply_xpath)(__InDoc,__XPathExpr,__NamespacePrefLst,__SelectedDoc,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^tblflapply)(parse_structure,string(__SelectedDoc),__InType,__Warn,__ParsedTerm,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))),fllibexecute_delayed_calls([__InDoc,__InType,__NamespacePrefLst,__ParsedTerm,__SelectedDoc,__Warn,__XPathExpr],[__InDoc,__InType,__NamespacePrefLst,__ParsedTerm,__Warn,__XPathExpr])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__InDoc,flapply(load_xml,__Mod),__Warn,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(28,'flrxmllib.flr',FLORA_THIS_MODULE_NAME),','(','(';'(->(FLORA_THIS_WORKSPACE(d^tblflapply)(get_mode,data,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),=(__Space,[flapply(space,remove)])),=(__Space,[])),FLORA_THIS_WORKSPACE(d^tblflapply)(load_structure,__InDoc,[flapply(dialect,xml)|__Space],__Warn,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))),fllibexecute_delayed_calls([__InDoc,__Mod,__Space,__Warn],[__InDoc,__Mod,__Warn])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__InDoc,flapply(load_sgml,__Mod),__Warn,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(30,'flrxmllib.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(load_structure,__InDoc,[flapply(dialect,sgml)],__Warn,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__InDoc,flapply(load_html,__Mod),__Warn,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(32,'flrxmllib.flr',FLORA_THIS_MODULE_NAME),','(','(:(sgml,dtd(html,__Dtd,___Warn1)),FLORA_THIS_WORKSPACE(d^tblflapply)(load_structure,__InDoc,[__Dtd,flapply(dialect,sgml)],__Warn,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),fllibexecute_delayed_calls([__Dtd,__InDoc,__Mod,__Warn,___Warn1],[__InDoc,__Mod,__Warn])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__InDoc,flapply(load_xhtml,__Mod),__Warn,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(34,'flrxmllib.flr',FLORA_THIS_MODULE_NAME),','(','(:(sgml,dtd(xhtml,__Dtd,___Warn1)),FLORA_THIS_WORKSPACE(d^tblflapply)(load_structure,__InDoc,[__Dtd,flapply(dialect,sgml)],__Warn,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),fllibexecute_delayed_calls([__Dtd,__InDoc,__Mod,__Warn,___Warn1],[__InDoc,__Mod,__Warn])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(parse_structure,__InDoc,__InType,__Warn,__ParsedTerm,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(36,'flrxmllib.flr',FLORA_THIS_MODULE_NAME),','(','(';'(->(:(usermod,atom(__InDoc)),=(__Doc,flapply(file,__InDoc))),=(__Doc,__InDoc)),','(flora_plg2hlg(__DocP,__Doc,flapply,1),','(';'(->(==(__InType,xml),';'(->(FLORA_THIS_WORKSPACE(d^tblflapply)(get_mode,data,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),=(__Opt,[flapply(dialect,xml),flapply(space,remove)])),=(__Opt,[flapply(dialect,xml)]))),';'(->(==(__InType,sgml),=(__Opt,[flapply(dialect,sgml)])),';'(->(==(__InType,html),','(:(sgml,dtd(html,__Dtd,___Warn1)),=(__Opt,[__Dtd,flapply(dialect,sgml)]))),->(==(__InType,xhtml),','(','(','(flora_plg2hlg(__newvar5,xhtml,flapply,0),','(flora_plg2hlg(__newvar6,__Dtd,flapply,0),flora_plg2hlg(__newvar7,___Warn1,flapply,0))),','(:(sgml,dtd(__newvar5,__newvar6,__newvar7)),','(flora_plg2hlg(__newvar5,xhtml,flapply,1),','(flora_plg2hlg(__newvar6,__Dtd,flapply,1),flora_plg2hlg(__newvar7,___Warn1,flapply,1))))),=(__Opt,[__Dtd,flapply(dialect,sgml)])))))),:(sgml,load_structure(__DocP,__ParsedTerm,__Opt,__Warn))))),fllibexecute_delayed_calls([__Doc,__DocP,__Dtd,__InDoc,__InType,__Opt,__ParsedTerm,__Warn,___Warn1],[__InDoc,__InType,__ParsedTerm,__Warn])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(load_structure,__newdontcarevar1,__newdontcarevar2,__newdontcarevar3,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar4,__newcontextvar5)),','('_$_$_ergo''rule_enabled'(38,'flrxmllib.flr',FLORA_THIS_MODULE_NAME),','(:(flrdatatype,flora_is_var_prim(__Mod)),','(!,FLORA_WORKSPACE(\\system,d^tblflapply)(sysabort,'<XML import>: module name must be bound','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(load_structure,__InDoc,__Opt,__Warn,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(40,'flrxmllib.flr',FLORA_THIS_MODULE_NAME),','(','(';'(->(:(usermod,atom(__InDoc)),=(__Doc,flapply(file,__InDoc))),=(__Doc,__InDoc)),','(flora_plg2hlg(__DocP,__Doc,flapply,1),','(flora_plg2hlg(__OptP,__Opt,flapply,1),','(:(sgml,load_structure(__DocP,__ResultTerm,__OptP,__Warn)),','(fllibifthen(FLORA_THIS_MODULE_NAME,:(flrregistry,flora_user_module_registry(__Mod)),flliberasemodule(FLORA_THIS_MODULE_NAME,__Mod),174,'flrxmllib.flr'),','(!,','(:(flrxml,xml_parse_doc(__ResultTerm,__Mod)),','(';'(->(:(flrxml,get_mode(navlinks)),FLORA_THIS_WORKSPACE(d^nontblflapply)(insert_bridge_rules,__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),'\\true'),!)))))))),fllibexecute_delayed_calls([__Doc,__DocP,__InDoc,__Mod,__Opt,__OptP,__ResultTerm,__Warn],[__InDoc,__Mod,__Opt,__Warn])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(insert_bridge_rules,__Mod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(42,'flrxmllib.flr',FLORA_THIS_MODULE_NAME),','(','(','(:(flrwhen,flora_put_attr(__newvar49,'\\$dynrule variable',[=('?O3',__O3),=('?N',__N),=('?InArc',__InArc),=('?Mod',__Mod)])),','(:(flrwhen,flora_put_attr(__newvar48,'\\$dynrule variable',[=('?O3',__O3),=('?N',__N),=('?InArc',__InArc),=('?Mod',__Mod)])),','(:(flrwhen,flora_put_attr(__newvar31,'\\$dynrule variable',[=('?O21',__O21),=('?InArc2',__InArc2),=('?O2',__O2),=('?Mod',__Mod)])),','(:(flrwhen,flora_put_attr(__newvar30,'\\$dynrule variable',[=('?O2',__O2),=('?O21',__O21),=('?Mod',__Mod)])),','(:(flrwhen,flora_put_attr(__newvar11,'\\$dynrule variable',[=('?InArc',__InArc),=('?O1',__O1),=('?Mod',__Mod)])),','(:(flrwhen,flora_put_attr(__newvar10,'\\$dynrule variable',[=('?O1',__O1),=('?InArc',__InArc),=('?Mod',__Mod)])),fllibinsertrule_z(FLORA_THIS_MODULE_NAME,[flsysruleupdate(__newvar3,dynrule('flrxmllib.flr'),'_$_$_ergo''descr_vars',28,['_$_$_ergo''prop_descriptor'(__newvar3,dynrule('flrxmllib.flr'),__newvar4,type,rule,'_$_$_ergo''descr_vars'),'_$_$_ergo''tag_descriptor'(__newvar3,dynrule('flrxmllib.flr'),__newvar4,__newvar3,'_$_$_ergo''descr_vars'),'_$_$_ergo''rule_enabled'(__newvar3,dynrule('flrxmllib.flr'),__newvar5),'_$_$_ergo''bool_descriptor'(__newvar3,dynrule('flrxmllib.flr'),__newvar4,strict,'_$_$_ergo''descr_vars')],[fllibmodlit('d^mvd',[__O1,'\\in_arc',__InArc,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar6,__newcontextvar7)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9))],','(fllibmodlit('d^mvd',[__newdontcarevar12,__InArc,__O1,'_$ctxt'(__Mod,__newcontextvar13,__newcontextvar14)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,__newcontextvar16)),','(\+('_$_$_ergo''mod''\\xml''is_nav_prop'(__InArc,'_$ctxt'(__Mod,__newcontextvar17,__newcontextvar18))),'_$_$_ergo''mod''\\xml''is_xml_object'(__O1,'_$ctxt'(__Mod,__newcontextvar19,__newcontextvar20)))),__newvar10,__newvar11,true,[null],[null],'_$_$_ergo''rule_enabled'(__newvar3,dynrule('flrxmllib.flr'),__newvar21),[fllibexecute_delayed_calls([__InArc,__Mod,__O1,__newdontcarevar22],[__InArc,__Mod,__O1])],true),flsysruleupdate(__newvar23,dynrule('flrxmllib.flr'),'_$_$_ergo''descr_vars',28,['_$_$_ergo''prop_descriptor'(__newvar23,dynrule('flrxmllib.flr'),__newvar24,type,rule,'_$_$_ergo''descr_vars'),'_$_$_ergo''tag_descriptor'(__newvar23,dynrule('flrxmllib.flr'),__newvar24,__newvar23,'_$_$_ergo''descr_vars'),'_$_$_ergo''rule_enabled'(__newvar23,dynrule('flrxmllib.flr'),__newvar25),'_$_$_ergo''bool_descriptor'(__newvar23,dynrule('flrxmllib.flr'),__newvar24,strict,'_$_$_ergo''descr_vars')],[fllibmodlit('d^mvd',[__O2,'\\parent',__O21,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar26,__newcontextvar27)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar28,__newcontextvar29))],','(fllibmodlit('d^mvd',[__O21,__InArc2,__O2,'_$ctxt'(__Mod,__newcontextvar32,__newcontextvar33)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar34,__newcontextvar35)),','(\+('_$_$_ergo''mod''\\xml''is_nav_prop'(__InArc2,'_$ctxt'(__Mod,__newcontextvar36,__newcontextvar37))),'_$_$_ergo''mod''\\xml''is_xml_object'(__O2,'_$ctxt'(__Mod,__newcontextvar38,__newcontextvar39)))),__newvar30,__newvar31,true,[null],[null],'_$_$_ergo''rule_enabled'(__newvar23,dynrule('flrxmllib.flr'),__newvar40),[fllibexecute_delayed_calls([__InArc2,__Mod,__O2,__O21],[__Mod,__O2,__O21])],true),flsysruleupdate(__newvar41,dynrule('flrxmllib.flr'),'_$_$_ergo''descr_vars',28,['_$_$_ergo''prop_descriptor'(__newvar41,dynrule('flrxmllib.flr'),__newvar42,type,rule,'_$_$_ergo''descr_vars'),'_$_$_ergo''tag_descriptor'(__newvar41,dynrule('flrxmllib.flr'),__newvar42,__newvar41,'_$_$_ergo''descr_vars'),'_$_$_ergo''rule_enabled'(__newvar41,dynrule('flrxmllib.flr'),__newvar43),'_$_$_ergo''bool_descriptor'(__newvar41,dynrule('flrxmllib.flr'),__newvar42,strict,'_$_$_ergo''descr_vars')],[fllibmodlit('d^mvd',[__O3,flapply('\\in_child_arc',__N),__InArc,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar44,__newcontextvar45)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar46,__newcontextvar47))],','(','(fllibmodlit('d^mvd',[__O3,flapply('\\child',__N),__newdontcarevar50,'_$ctxt'(__Mod,__newcontextvar55,__newcontextvar56)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar57,__newcontextvar58)),fllibmodlit('d^mvd',[__newdontcarevar50,'\\in_arc',__InArc,'_$ctxt'(__Mod,__newcontextvar51,__newcontextvar52)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar53,__newcontextvar54))),'_$_$_ergo''mod''\\xml''is_xml_object'(__O3,'_$ctxt'(__Mod,__newcontextvar59,__newcontextvar60))),__newvar48,__newvar49,true,[null],[null],'_$_$_ergo''rule_enabled'(__newvar41,dynrule('flrxmllib.flr'),__newvar61),[fllibexecute_delayed_calls([__InArc,__Mod,__N,__O3,__newdontcarevar62],[__InArc,__Mod,__N,__O3])],true)]))))))),','(','(:(flrwhen,flora_put_attr(__newvar71,'\\$dynrule variable',[=('?ChildList',__ChildList),=('?O41',__O41),=('?O4',__O4),=('?Mod',__Mod)])),','(:(flrwhen,flora_put_attr(__newvar70,'\\$dynrule variable',[=('?O4',__O4),=('?ChildList',__ChildList),=('?Mod',__Mod)])),','(:(flrwhen,flora_put_attr(__newvar49,'\\$dynrule variable',[=('?O3',__O3),=('?N',__N),=('?InArc',__InArc),=('?Mod',__Mod)])),','(:(flrwhen,flora_put_attr(__newvar48,'\\$dynrule variable',[=('?O3',__O3),=('?N',__N),=('?InArc',__InArc),=('?Mod',__Mod)])),','(:(flrwhen,flora_put_attr(__newvar31,'\\$dynrule variable',[=('?O21',__O21),=('?InArc2',__InArc2),=('?O2',__O2),=('?Mod',__Mod)])),','(:(flrwhen,flora_put_attr(__newvar30,'\\$dynrule variable',[=('?O2',__O2),=('?O21',__O21),=('?Mod',__Mod)])),','(:(flrwhen,flora_put_attr(__newvar11,'\\$dynrule variable',[=('?InArc',__InArc),=('?O1',__O1),=('?Mod',__Mod)])),','(:(flrwhen,flora_put_attr(__newvar10,'\\$dynrule variable',[=('?O1',__O1),=('?InArc',__InArc),=('?Mod',__Mod)])),fllibinsertrule_z(FLORA_THIS_MODULE_NAME,[flsysruleupdate(__newvar63,dynrule('flrxmllib.flr'),'_$_$_ergo''descr_vars',28,['_$_$_ergo''prop_descriptor'(__newvar63,dynrule('flrxmllib.flr'),__newvar64,type,rule,'_$_$_ergo''descr_vars'),'_$_$_ergo''tag_descriptor'(__newvar63,dynrule('flrxmllib.flr'),__newvar64,__newvar63,'_$_$_ergo''descr_vars'),'_$_$_ergo''rule_enabled'(__newvar63,dynrule('flrxmllib.flr'),__newvar65),'_$_$_ergo''bool_descriptor'(__newvar63,dynrule('flrxmllib.flr'),__newvar64,strict,'_$_$_ergo''descr_vars')],[fllibmodlit('d^mvd',[__O4,'\\childlist',__ChildList,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar66,__newcontextvar67)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar68,__newcontextvar69))],','(','(fllibsetof(__newdontcarevar80,[__O41],[],','(','(fllibmodlit('d^mvd',[__O41,flapply('\\child',__newdontcarevar72),__newdontcarevar80,'_$ctxt'(__Mod,__newcontextvar73,__newcontextvar74)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar75,__newcontextvar76)),'_$_$_ergo''mod''\\xml''is_xml_object'(__O41,'_$ctxt'(__Mod,__newcontextvar77,__newcontextvar78))),fllibexecute_delayed_calls([__newdontcarevar80,__Mod,__O41,__newdontcarevar79],[])),__newvar81),=(__ChildList,__newvar81)),=(__O4,__O41)),__newvar70,__newvar71,true,[null],[null],'_$_$_ergo''rule_enabled'(__newvar63,dynrule('flrxmllib.flr'),__newvar82),[fllibexecute_delayed_calls([__ChildList,__Mod,__O4,__O41,__newdontcarevar83],[__ChildList,__Mod,__O4])],true)]))))))))),','(:(flrwhen,flora_put_attr(__newvar92,'\\$dynrule variable',[=('?Count',__Count),=('?O61',__O61),=('?O6',__O6),=('?Mod',__Mod)])),','(:(flrwhen,flora_put_attr(__newvar91,'\\$dynrule variable',[=('?O6',__O6),=('?Count',__Count),=('?Mod',__Mod)])),','(:(flrwhen,flora_put_attr(__newvar71,'\\$dynrule variable',[=('?ChildList',__ChildList),=('?O41',__O41),=('?O4',__O4),=('?Mod',__Mod)])),','(:(flrwhen,flora_put_attr(__newvar70,'\\$dynrule variable',[=('?O4',__O4),=('?ChildList',__ChildList),=('?Mod',__Mod)])),','(:(flrwhen,flora_put_attr(__newvar49,'\\$dynrule variable',[=('?O3',__O3),=('?N',__N),=('?InArc',__InArc),=('?Mod',__Mod)])),','(:(flrwhen,flora_put_attr(__newvar48,'\\$dynrule variable',[=('?O3',__O3),=('?N',__N),=('?InArc',__InArc),=('?Mod',__Mod)])),','(:(flrwhen,flora_put_attr(__newvar31,'\\$dynrule variable',[=('?O21',__O21),=('?InArc2',__InArc2),=('?O2',__O2),=('?Mod',__Mod)])),','(:(flrwhen,flora_put_attr(__newvar30,'\\$dynrule variable',[=('?O2',__O2),=('?O21',__O21),=('?Mod',__Mod)])),','(:(flrwhen,flora_put_attr(__newvar11,'\\$dynrule variable',[=('?InArc',__InArc),=('?O1',__O1),=('?Mod',__Mod)])),','(:(flrwhen,flora_put_attr(__newvar10,'\\$dynrule variable',[=('?O1',__O1),=('?InArc',__InArc),=('?Mod',__Mod)])),fllibinsertrule_z(FLORA_THIS_MODULE_NAME,[flsysruleupdate(__newvar84,dynrule('flrxmllib.flr'),'_$_$_ergo''descr_vars',28,['_$_$_ergo''prop_descriptor'(__newvar84,dynrule('flrxmllib.flr'),__newvar85,type,rule,'_$_$_ergo''descr_vars'),'_$_$_ergo''tag_descriptor'(__newvar84,dynrule('flrxmllib.flr'),__newvar85,__newvar84,'_$_$_ergo''descr_vars'),'_$_$_ergo''rule_enabled'(__newvar84,dynrule('flrxmllib.flr'),__newvar86),'_$_$_ergo''bool_descriptor'(__newvar84,dynrule('flrxmllib.flr'),__newvar85,strict,'_$_$_ergo''descr_vars')],[fllibmodlit('d^mvd',[__O6,'\\childcount',__Count,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar87,__newcontextvar88)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar89,__newcontextvar90))],','(','(fllibcount(__newdontcarevar101,[__O61],[],','(','(fllibmodlit('d^mvd',[__O61,flapply('\\child',__newdontcarevar93),__newdontcarevar101,'_$ctxt'(__Mod,__newcontextvar94,__newcontextvar95)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar96,__newcontextvar97)),'_$_$_ergo''mod''\\xml''is_xml_object'(__O61,'_$ctxt'(__Mod,__newcontextvar98,__newcontextvar99))),fllibexecute_delayed_calls([__newdontcarevar101,__Mod,__O61,__newdontcarevar100],[])),__newvar102),=(__Count,__newvar102)),=(__O6,__O61)),__newvar91,__newvar92,true,[null],[null],'_$_$_ergo''rule_enabled'(__newvar84,dynrule('flrxmllib.flr'),__newvar103),[fllibexecute_delayed_calls([__Count,__Mod,__O6,__O61,__newdontcarevar104],[__Count,__Mod,__O6])],true)]))))))))))))),fllibexecute_delayed_calls([__ChildList,__Count,__InArc,__InArc2,__Mod,__N,__O1,__O2,__O21,__O3,__O4,__O41,__O6,__O61,__newdontcarevar105],[__Mod])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Mod,show,__newvar1,'_$ctxt'(_CallerModuleVar,__newcontextvar8,__newcontextvar9)),','('_$_$_ergo''rule_enabled'(44,'flrxmllib.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmodobj(head,'d^mvd',[__S,__P,__O,'_$ctxt'(__newcontextvar2,__newcontextvar3,__newcontextvar4)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6),__newvar7),fllibuniveqform(__newvar1,__newvar7)),','(fllibmodlit('d^mvd',[__S,__P,__O,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar13)),','(FLORA_THIS_WORKSPACE(is_xml_object)(__S,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar14,__newcontextvar15)),\+(FLORA_THIS_WORKSPACE(is_nav_prop)(__P,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar16,__newcontextvar17)))))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Mod,flapply(show,__elementname),__newvar1,'_$ctxt'(_CallerModuleVar,__newcontextvar8,__newcontextvar9)),','('_$_$_ergo''rule_enabled'(46,'flrxmllib.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmodobj(head,'d^mvd',[__S,__P,__O,'_$ctxt'(__newcontextvar2,__newcontextvar3,__newcontextvar4)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6),__newvar7),fllibuniveqform(__newvar1,__newvar7)),','(','(:(usermod,atom(__elementname)),','(!,','(fllibmodlit('d^mvd',[__newdontcarevar10,__elementname,__S,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14)),','(fllibmodlit('d^mvd',[__S,__P,__O,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,__newcontextvar16)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar17,__newcontextvar18)),','(FLORA_THIS_WORKSPACE(is_xml_object)(__S,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar19,__newcontextvar20)),\+(FLORA_THIS_WORKSPACE(is_nav_prop)(__P,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar21,__newcontextvar22)))))))),fllibexecute_delayed_calls([__Mod,__O,__P,__S,__newdontcarevar23,__elementname],[__Mod,__O,__P,__S,__elementname]))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Mod,flapply(show,flapply(attribute,__attrname)),__newvar1,'_$ctxt'(_CallerModuleVar,__newcontextvar8,__newcontextvar9)),','('_$_$_ergo''rule_enabled'(48,'flrxmllib.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmodobj(head,'d^mvd',[__S,__P,__O,'_$ctxt'(__newcontextvar2,__newcontextvar3,__newcontextvar4)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6),__newvar7),fllibuniveqform(__newvar1,__newvar7)),','(','(:(usermod,atom(__attrname)),','(fllibmodlit('d^mvd',[__S,flapply(attribute,__attrname),__newdontcarevar10,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14)),','(fllibmodlit('d^mvd',[__S,__P,__O,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,__newcontextvar16)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar17,__newcontextvar18)),','(FLORA_THIS_WORKSPACE(is_xml_object)(__S,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar19,__newcontextvar20)),\+(FLORA_THIS_WORKSPACE(is_nav_prop)(__P,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar21,__newcontextvar22))))))),fllibexecute_delayed_calls([__Mod,__O,__P,__S,__newdontcarevar23,__attrname],[__Mod,__O,__P,__S,__attrname]))))).
FLORA_THIS_WORKSPACE(is_nav_prop)('\\in_arc','_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)).
FLORA_THIS_WORKSPACE(is_nav_prop)(flapply('\\in_child_arc',__newdontcarevar1),'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)).
FLORA_THIS_WORKSPACE(is_nav_prop)(flapply('\\child',__newdontcarevar1),'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)).
FLORA_THIS_WORKSPACE(is_nav_prop)('\\parent','_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)).
FLORA_THIS_WORKSPACE(is_nav_prop)('\\leftsibling','_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)).
FLORA_THIS_WORKSPACE(is_nav_prop)('\\rightsibling','_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)).
FLORA_THIS_WORKSPACE(is_nav_prop)('\\childcount','_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)).
FLORA_THIS_WORKSPACE(is_nav_prop)('\\childlist','_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)).
FLORA_THIS_WORKSPACE(is_nav_prop)('\\order','_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)).
:-(FLORA_THIS_WORKSPACE(is_xml_object)(__X,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(50,'flrxmllib.flr',FLORA_THIS_MODULE_NAME),','(\+(:(usermod,is_list(__X))),\+(FLORA_THIS_WORKSPACE(is_nav_prop)(__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))))).

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
#define FLORA_FLS2_FILENAME  'flrxmllib.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('flrxmllib.ergo',FLORA_THIS_MODULE_NAME))).

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

:-(FLORA_THIS_WORKSPACE(apply_xpath)(_h392242,_h392244,_h392246,_h392248,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(apply_xpath))(_h392242,_h392244,_h392246,_h392248,FWContext)).
:-(FLORA_THIS_WORKSPACE(is_nav_prop)(_h392877,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(is_nav_prop))(_h392877,FWContext)).
:-(FLORA_THIS_WORKSPACE(is_xml_object)(_h393500,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(is_xml_object))(_h393500,FWContext)).
