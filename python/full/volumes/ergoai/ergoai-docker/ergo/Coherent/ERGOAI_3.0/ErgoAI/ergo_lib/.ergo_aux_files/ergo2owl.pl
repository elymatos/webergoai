
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

#define FLORA_COMPILATION_ID 5

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
#define FLORA_THIS_FILENAME  'ergo2owl.ergo'
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

:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(rdf_check_module)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(rdf_check_module)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(rdf_check_module)(_h434695,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(rdf_check_module))(_h434695,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(rdf_check_module_format)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(rdf_check_module_format)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(rdf_check_module_format)(_h435403,_h435405,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(rdf_check_module_format))(_h435403,_h435405,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(rdf_loaded_module)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(rdf_loaded_module)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(rdf_loaded_module)(_h436227,_h436229,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(rdf_loaded_module))(_h436227,_h436229,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(rdf_reachable)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(rdf_reachable)),5)),FLORA_FLEX_DYNAMIC_TYPE_CLAUSE))).
:-(FLORA_THIS_WORKSPACE(rdf_reachable)(_h436955,_h436957,_h436959,_h436961,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(rdf_reachable))(_h436955,_h436957,_h436959,_h436961,FWContext)).
 
#if !defined(FLORA_FLM_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLM_FILENAME  'ergo2owl.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(ergo2owl,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'ergo2owl.fld'
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
#define FLORA_FLS_FILENAME  'ergo2owl.fls'
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

:-(table(as(/(FLORA_THIS_WORKSPACE(rdf_reachable),5),AUXILIARY_TABLING_TYPE))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(rdf_reachable,4,FLORA_THIS_MODULE_NAME)]))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(rdf_loaded_module,2,FLORA_THIS_MODULE_NAME),prolog(rdf_check_module,1,FLORA_THIS_MODULE_NAME),prolog(rdf_check_module_format,2,FLORA_THIS_MODULE_NAME)]))).
:-(fllibexport([[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar1,flapply(rdf_load,__newdontcarevar2,__newdontcarevar3,__newdontcarevar4,__newdontcarevar5,__newdontcarevar6),__newcontextvar9))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar10,flapply(rdf_load,__newdontcarevar11,__newdontcarevar12,__newdontcarevar13,__newdontcarevar14),__newcontextvar17))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar18,flapply(rdf_load,__newdontcarevar19,__newdontcarevar20),__newcontextvar23))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar24,rdf_predicate,__newdontcarevar25,__newcontextvar28))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar29,rdf_subject,__newdontcarevar30,__newcontextvar33))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar34,rdf_object,__newdontcarevar35,__newcontextvar38))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar39,flapply(rdf_reachable,__newdontcarevar40,__newdontcarevar41),__newdontcarevar42,__newcontextvar45))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar46,flapply(rdf_insert,__newdontcarevar47,__newdontcarevar48,__newdontcarevar49),__newcontextvar52))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar53,flapply(rdf_delete,__newdontcarevar54,__newdontcarevar55,__newdontcarevar56),__newcontextvar59))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar60,rdf_deleteall,__newcontextvar63))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(ensure_loaded,__newcontextvar66))]])).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(initialize,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(4,'ergo2owl.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrporting,flora_install_dir(__ErgoDir)),','(:(flrporting,flora_slash(__S)),','(:(flrporting,flora_concat_atoms([__ErgoDir,__S,ergosuite,__S,jena,__S,'JenaAllInOne.jar'],___JenaJar)),','(:(flrporting,flora_concat_atoms([__ErgoDir,__S,ergo_lib,__S,ergo2owl],__E2Sdir)),','(:(flrporting,flora_concat_atoms([__E2Sdir,__S,java,__S,'ergoOWL.jar'],___OwlJar)),','(FLORA_WORKSPACE(\\e2j,d^tblflapply)(ensure_loaded,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_WORKSPACE(\\system,d^meth)('Libpath',flapply(add,__E2Sdir),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibload([ergo_owl],'/home/kifer/ERGOAI/ErgoEngine/ErgoAI/ergo_lib/ergo2owl.ergo',FLORA_THIS_MODULE_NAME,[74,9])))))))),fllibexecute_delayed_calls([__E2Sdir,__ErgoDir,__S,___JenaJar,___OwlJar],[])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(initialize,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(6,'ergo2owl.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(ensure_loaded,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(8,'ergo2owl.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(static^meth)('System',flapply(rdf_load,__InFile,__InLangSyntax,__OutFormat,__IrisText,__OwlMod),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(10,'ergo2owl.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrdatatype,flora_is_nonvar_prim(__InFile)),','(:(flrdatatype,flora_is_nonvar_prim(__InLangSyntax)),','(:(flrdatatype,flora_is_nonvar_prim(__OutFormat)),','(:(flrdatatype,flora_is_nonvar_prim(__IrisText)),','(:(flrdatatype,flora_is_nonvar_prim(__OwlMod)),','(FLORA_THIS_WORKSPACE(rdf_check_module_format)(__OwlMod,__OutFormat,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(flora_plg2hlg(__InFilePlg,__InFile,flapply,1),','(';'(->(:(flrutils,flora_locate_file_basic(__InFilePlg,__InFileCached)),'\\true'),','(:(flrporting,flora_concat_atoms(['<ErgoOWL API> file ',__InFilePlg,' is not found'],__ErrMsg)),FLORA_WORKSPACE(\\system,d^tblflapply)(sysabort,__ErrMsg,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),','(','(:(ergo_owl,owl2ergo_outfile_name(__InFileCached,__OutFormat,__OutFileName)),:(ergo_owl,rdfTranslate(__InFileCached,__InLangSyntax,__OutFileName,__OutFormat,__IrisText))),','(fllibifthenelse(FLORA_THIS_MODULE_NAME,==(__OutFormat,fastload),','(:(ergo_fastloader,ergo_fast_trie_loader(__OutFileName,__OwlMod,'/home/kifer/ERGOAI/ErgoEngine/ErgoAI/ergo_lib/ergo2owl.ergo')),','(fllibunlessdo(FLORA_THIS_MODULE_NAME,:(flrregistry,flora_user_module_registry(__OwlMod)),fllibnewmodule(__newdontcarevar7,__OwlMod,nontabled),107,'ergo2owl.ergo'),','(:(flrwhen,flora_put_attr(__newvar16,'\\$dynrule variable',[=('?OwlMod',__OwlMod),=('?P',__P),=('?S',__S),=('?O',__O)])),','(:(flrwhen,flora_put_attr(__newvar15,'\\$dynrule variable',[=('?S',__S),=('?P',__P),=('?O',__O),=('?OwlMod',__OwlMod)])),fllibinsertrule_z(FLORA_THIS_MODULE_NAME,[flsysruleupdate(__newvar8,dynrule('ergo2owl.ergo'),'_$_$_ergo''descr_vars',44,['_$_$_ergo''prop_descriptor'(__newvar8,dynrule('ergo2owl.ergo'),__newvar9,type,rule,'_$_$_ergo''descr_vars'),'_$_$_ergo''tag_descriptor'(__newvar8,dynrule('ergo2owl.ergo'),__newvar9,__newvar8,'_$_$_ergo''descr_vars'),'_$_$_ergo''rule_enabled'(__newvar8,dynrule('ergo2owl.ergo'),__newvar10),'_$_$_ergo''bool_descriptor'(__newvar8,dynrule('ergo2owl.ergo'),__newvar9,strict,'_$_$_ergo''descr_vars')],[fllibmodlit('d^mvd',[__S,__P,__O,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar11,__newcontextvar12)],__OwlMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14))],:(ergo_fastloader,ergo_fast_query(__OwlMod,flapply(__P,__S,__O))),__newvar15,__newvar16,true,[null],[null],'_$_$_ergo''rule_enabled'(__newvar8,dynrule('ergo2owl.ergo'),__newvar17),[null],true)]))))),fllibload([>>(+(__OutFileName),__OwlMod)],'/home/kifer/ERGOAI/ErgoEngine/ErgoAI/ergo_lib/ergo2owl.ergo',FLORA_THIS_MODULE_NAME,[115,13]),104,'ergo2owl.ergo'),','(:(flrwhen,flora_put_attr(__newvar16,'\\$dynrule variable',[=('?OwlMod',__OwlMod),=('?P',__P),=('?S',__S),=('?O',__O)])),','(:(flrwhen,flora_put_attr(__newvar15,'\\$dynrule variable',[=('?S',__S),=('?P',__P),=('?O',__O),=('?OwlMod',__OwlMod)])),fllibinsert(FLORA_THIS_MODULE_NAME,[flsysdbupdate('_$_$_ergo''dynprologfact'(FLORA_THIS_WORKSPACE(rdf_loaded_module)(__OwlMod,__OutFormat,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar18,__newcontextvar19))),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]))))))))))))),fllibexecute_delayed_calls([__ErrMsg,__InFile,__InFileCached,__InFilePlg,__InLangSyntax,__IrisText,__O,__OutFileName,__OutFormat,__OwlMod,__P,__S,__newdontcarevar20],[__InFile,__InLangSyntax,__IrisText,__OutFormat,__OwlMod])))).
:-(FLORA_THIS_WORKSPACE(static^meth)('System',flapply(rdf_load,__InFile,__InLangSyntax,__IrisText,__OwlMod),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(12,'ergo2owl.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^meth)('System',flapply(rdf_load,__InFile,__InLangSyntax,fastload,__IrisText,__OwlMod),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^meth)('System',flapply(rdf_load,__InFile,__OwlMod),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(14,'ergo2owl.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^meth)('System',flapply(rdf_load,__InFile,'',fastload,'',__OwlMod),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__OwlMod,rdf_predicate,__P,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(16,'ergo2owl.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(rdf_check_module)(__OwlMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),fllibmodlit('d^mvd',[___S,__P,___O,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)],__OwlMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))),fllibexecute_delayed_calls([__OwlMod,__P,___O,___S],[__OwlMod,__P])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__OwlMod,rdf_subject,__S,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(18,'ergo2owl.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(rdf_check_module)(__OwlMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),fllibmodlit('d^mvd',[__S,___P,___O,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)],__OwlMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))),fllibexecute_delayed_calls([__OwlMod,__S,___O,___P],[__OwlMod,__S])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__OwlMod,rdf_object,__O,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(20,'ergo2owl.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(rdf_check_module)(__OwlMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),fllibmodlit('d^mvd',[___S,___P,__O,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)],__OwlMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))),fllibexecute_delayed_calls([__O,__OwlMod,___P,___S],[__O,__OwlMod])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__S,flapply(rdf_reachable,__OwlMod,__P),__O,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(22,'ergo2owl.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(rdf_check_module)(__OwlMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(rdf_reachable)(__S,__P,__O,__OwlMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))).
:-(FLORA_THIS_WORKSPACE(rdf_reachable)(__S,__P,__O,__OwlMod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(24,'ergo2owl.ergo',FLORA_THIS_MODULE_NAME),fllibmodlit('d^mvd',[__S,__P,__O,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)],__OwlMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))).
:-(FLORA_THIS_WORKSPACE(rdf_reachable)(__S,__P,__O,__OwlMod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(26,'ergo2owl.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(rdf_reachable)(__S,__P,__Interim,__OwlMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),fllibmodlit('d^mvd',[__Interim,__P,__O,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)],__OwlMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))),fllibexecute_delayed_calls([__Interim,__O,__OwlMod,__P,__S],[__O,__OwlMod,__P,__S])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__OwlMod,flapply(rdf_insert,__S,__P,__O),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(28,'ergo2owl.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(rdf_check_module)(__OwlMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(flrdatatype,flora_is_nonvar_prim(__S)),','(:(flrdatatype,flora_is_nonvar_prim(__P)),','(:(flrdatatype,flora_is_nonvar_prim(__O)),','(FLORA_THIS_WORKSPACE(rdf_check_module_format)(__OwlMod,__Method,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),';'(->(==(__Method,fastload),:(ergo_fastloader,fastload_insert(__OwlMod,flapply(__P,__S,__O),__newdontcarevar7))),';'(->(==(__Method,frames),fllibinsert(FLORA_THIS_MODULE_NAME,[fllibmodlit(mvd,[__S,__P,__O,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar8,__newcontextvar9)],__OwlMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11))])),fllibinsert(FLORA_THIS_MODULE_NAME,[fllibmodlit(tblflapply,[__P,__S,__O,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar12,__newcontextvar13)],__OwlMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar14,__newcontextvar15))])))))))),fllibexecute_delayed_calls([__Method,__O,__OwlMod,__P,__S,__newdontcarevar16],[__O,__OwlMod,__P,__S])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__OwlMod,flapply(rdf_delete,__S,__P,__O),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(30,'ergo2owl.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(rdf_check_module)(__OwlMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(rdf_check_module_format)(__OwlMod,__Method,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),';'(->(==(__Method,fastload),','(:(ergo_fastloader,fastload_delete(__OwlMod,flapply(__P,__S,__O),__Deleted)),==(__Deleted,1))),';'(->(==(__Method,frames),fllibdelete(FLORA_THIS_MODULE_NAME,[fllibmodlit(mvd,[__S,__P,__O,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)],__OwlMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10))])),fllibdelete(FLORA_THIS_MODULE_NAME,[fllibmodlit(tblflapply,[__P,__S,__O,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)],__OwlMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14))]))))),fllibexecute_delayed_calls([__Deleted,__Method,__O,__OwlMod,__P,__S],[__O,__OwlMod,__P,__S])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__OwlMod,rdf_deleteall,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(32,'ergo2owl.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(rdf_check_module)(__OwlMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(rdf_check_module_format)(__OwlMod,__Method,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(==(__Method,fastload),','(!,','(';'(:(ergo_fastloader,fastload_delete(__OwlMod,flapply(__newdontcarevar7,__newdontcarevar8,__newdontcarevar9),__newdontcarevar10)),FLORA_THIS_WORKSPACE(d^tblflapply)(true,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12))),','(!,','(';'(:(ergo_fastloader,fastload_deleteall(__OwlMod)),FLORA_THIS_WORKSPACE(d^tblflapply)(true,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14))),','(!,:(ergo_fastloader,fastload_create_storage(__OwlMod)))))))))),fllibexecute_delayed_calls([__Method,__OwlMod,__newdontcarevar15],[__OwlMod])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__OwlMod,rdf_deleteall,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(34,'ergo2owl.ergo',FLORA_THIS_MODULE_NAME),flliberasemodule(FLORA_THIS_MODULE_NAME,__OwlMod))).
:-(FLORA_THIS_WORKSPACE(rdf_check_module)(__OwlMod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(36,'ergo2owl.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrdatatype,flora_is_nonvar_prim(__OwlMod)),','(:(flrregistry,flora_user_module_registry(__OwlMod)),','(FLORA_THIS_WORKSPACE(rdf_loaded_module)(__OwlMod,__newdontcarevar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),!))),fllibexecute_delayed_calls([__OwlMod,__newdontcarevar6],[__OwlMod])))).
:-(FLORA_THIS_WORKSPACE(rdf_check_module)(__OwlMod,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(38,'ergo2owl.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrporting,flora_concat_atoms(['<ErgoOWL API> no RDF files were loaded into module ',__OwlMod],__Message)),FLORA_WORKSPACE(\\system,d^tblflapply)(sysabort,__Message,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),fllibexecute_delayed_calls([__Message,__OwlMod],[__OwlMod])))).
:-(FLORA_THIS_WORKSPACE(rdf_check_module_format)(__Mod,__OutFormat,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(40,'ergo2owl.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrdatatype,flora_is_nonvar_prim(__Mod)),','(:(flrdatatype,flora_is_nonvar_prim(__OutFormat)),','(FLORA_THIS_WORKSPACE(rdf_loaded_module)(__Mod,__OutFormat2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(\==(__OutFormat,__OutFormat2),','(!,','(:(flrporting,flora_concat_atoms(['<ErgoOWL API> RDF module ',__Mod,' was created via the method `',__OutFormat2,'''; cannot change the method to `',__OutFormat,''''],__Message)),FLORA_WORKSPACE(\\system,d^tblflapply)(sysabort,__Message,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))))))),fllibexecute_delayed_calls([__Message,__Mod,__OutFormat,__OutFormat2],[__Mod,__OutFormat])))).
:-(FLORA_THIS_WORKSPACE(rdf_check_module_format)(__Mod,__OutFormat,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(42,'ergo2owl.ergo',FLORA_THIS_MODULE_NAME),','(:(flrdatatype,flora_is_nonvar_prim(__Mod)),','(FLORA_THIS_WORKSPACE(rdf_loaded_module)(__Mod,__OutFormat,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),!)))).
:-(FLORA_THIS_WORKSPACE(rdf_check_module_format)(___Mod,___OutFormat,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(44,'ergo2owl.ergo',FLORA_THIS_MODULE_NAME),!)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rule signatures %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%% Signatures for latent queries %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%% Queries found in the source file %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(:(flrutils,flora_feedback_control(tempoff)),FLORA_THIS_WORKSPACE(d^nontblflapply)(initialize,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar1,__newcontextvar2)))),[])).

 
#if !defined(FLORA_FLS2_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLS2_FILENAME  'ergo2owl.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('ergo2owl.ergo',FLORA_THIS_MODULE_NAME))).

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

:-(FLORA_THIS_WORKSPACE(rdf_check_module)(_h455825,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(rdf_check_module))(_h455825,FWContext)).
:-(FLORA_THIS_WORKSPACE(rdf_check_module_format)(_h456528,_h456530,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(rdf_check_module_format))(_h456528,_h456530,FWContext)).
:-(FLORA_THIS_WORKSPACE(rdf_loaded_module)(_h457347,_h457349,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(rdf_loaded_module))(_h457347,_h457349,FWContext)).
:-(FLORA_THIS_WORKSPACE(rdf_reachable)(_h458070,_h458072,_h458074,_h458076,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(rdf_reachable))(_h458070,_h458072,_h458074,_h458076,FWContext)).
