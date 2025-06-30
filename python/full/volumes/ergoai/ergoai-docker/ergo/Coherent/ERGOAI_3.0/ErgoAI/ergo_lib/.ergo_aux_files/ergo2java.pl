
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
#define FLORA_THIS_FILENAME  'ergo2java.ergo'
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

:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(check_window)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(check_window)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(check_window)(_h547737,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(check_window))(_h547737,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(is_atomlist)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(is_atomlist)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(is_atomlist)(_h548381,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(is_atomlist))(_h548381,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(readline_chop_nl)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(readline_chop_nl)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(readline_chop_nl)(_h549009,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(readline_chop_nl))(_h549009,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(show_options_dialog)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(show_options_dialog)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(show_options_dialog)(_h549717,_h549719,_h549721,_h549723,_h549725,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(show_options_dialog))(_h549717,_h549719,_h549721,_h549723,_h549725,FWContext)).
 
#if !defined(FLORA_FLM_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLM_FILENAME  'ergo2java.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(ergo2java,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'ergo2java.fld'
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
#define FLORA_FLS_FILENAME  'ergo2java.fls'
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

?-(:(flrprolog,flora_define_modular_prolog([prolog(show_options_dialog,5,FLORA_THIS_MODULE_NAME),prolog(readline_chop_nl,1,FLORA_THIS_MODULE_NAME),prolog(check_window,1,FLORA_THIS_MODULE_NAME),prolog(is_atomlist,1,FLORA_THIS_MODULE_NAME)]))).
:-(fllibexport([[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar1,mode,__newdontcarevar2,__newcontextvar5))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar6,flapply(path,__newdontcarevar7),__newdontcarevar8,__newcontextvar11))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar12,flapply(addJar,__newdontcarevar13),__newcontextvar16))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar17,flapply(open,__newdontcarevar18,__newdontcarevar19),__newdontcarevar20,__newcontextvar23))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar24,flapply(setSize,__newdontcarevar25,__newdontcarevar26,__newdontcarevar27),__newcontextvar30))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar31,flapply(show,__newdontcarevar32),__newdontcarevar33,__newcontextvar36))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar37,flapply(show,__newdontcarevar38,__newdontcarevar39),__newcontextvar42))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar43,flapply(showOptions,__newdontcarevar44,__newdontcarevar45,__newdontcarevar46),__newdontcarevar47,__newcontextvar50))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar51,flapply(chooseFile,__newdontcarevar52),__newdontcarevar53,__newcontextvar56))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar57,chooseFile,__newdontcarevar58,__newcontextvar61))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar62,flapply(close,__newdontcarevar63),__newcontextvar66))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar67,flapply(clear,__newdontcarevar68),__newcontextvar71))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar72,flapply(print,__newdontcarevar73,__newdontcarevar74),__newcontextvar77))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar78,flapply(message,__newdontcarevar79),__newdontcarevar80,__newcontextvar83))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar84,flapply(setJavaFlags,__newdontcarevar85),__newcontextvar88))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar89,flapply(setJavaCP,__newdontcarevar90),__newcontextvar93))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar94,restart,__newcontextvar97))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar98,flapply(alive,__newdontcarevar99),__newcontextvar102))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar103,__newdontcarevar104,__newcontextvar107))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(ensure_loaded,__newcontextvar110))]])).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(initialize,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(4,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrporting,flora_install_dir(__ErgoDir)),','(:(flrporting,flora_slash(__S)),','(:(flrporting,flora_concat_atoms([__ErgoDir,__S,ergo_lib,__S,ergo2java],__EJdir)),','(FLORA_WORKSPACE(\\system,d^meth)('Libpath',flapply(add,__EJdir),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(fllibload([ergo_java],'/home/kifer/ERGOAI/ErgoEngine/ErgoAI/ergo_lib/ergo2java.ergo',FLORA_THIS_MODULE_NAME,[84,2]),';'(->(:(flrregistry,flora_configuration(uimode,studio)),'\\true'),:(ergo_java,initialize))))))),fllibexecute_delayed_calls([__EJdir,__ErgoDir,__S],[])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(ensure_loaded,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(6,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(:(flrregistry,flora_configuration(uimode,studio)),!))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(ensure_loaded,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(8,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),:(ergo_java,java_alive))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Obj,flapply(message,__MethodAndArgs),__Result,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(10,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(','(flora_plg2hlg(__ObjPlg,__Obj,flapply,1),','(flora_plg2hlg(__MethodAndArgsPlg,__MethodAndArgs,flapply,1),','(:(ergo_java,smart_java_call(__ObjPlg,__MethodAndArgsPlg,__Result1)),flora_plg2hlg(__Result1,__Result,flapply,1)))),fllibexecute_delayed_calls([__MethodAndArgs,__MethodAndArgsPlg,__Obj,__ObjPlg,__Result,__Result1],[__MethodAndArgs,__Obj,__Result])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)('System',mode,__Mode,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(12,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(!,:(flrregistry,flora_configuration(uimode,__Mode))))).
:-(FLORA_THIS_WORKSPACE(static^meth)('System',restart,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(14,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),:(ergo_java,initialize))).
:-(FLORA_THIS_WORKSPACE(static^meth)('System',flapply(addJar,__Jar),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(16,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(!,','(FLORA_WORKSPACE(\\system,d^tblflapply)(warning,'the method addJar has been deprecated because of the incompatible changes in Java 9+','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),';'(->(:(flrporting,flora_file_op(exists,__Jar)),','(','(flora_plg2hlg(__newvar5,'com.declarativa.interprolog.AbstractPrologEngine',flapply,0),flora_plg2hlg(__newvar6,flapply(addSoftwareLibrary,flapply(string,__Jar)),flapply,0)),','(:(interprolog,java(__newvar5,__newvar6)),','(flora_plg2hlg(__newvar5,'com.declarativa.interprolog.AbstractPrologEngine',flapply,1),flora_plg2hlg(__newvar6,flapply(addSoftwareLibrary,flapply(string,__Jar)),flapply,1))))),','(:(flrdelaysupport,flora_arith_IS_builtin('ergo2java.ergo',156,__newquantvar7,'||'('',__Jar))),FLORA_WORKSPACE(\\system,d^tblflapply)(sysabort,['cannot add Java library: file ',__newquantvar7,' is not found'],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)))))))).
:-(FLORA_THIS_WORKSPACE(static^meth)('System',flapply(setJavaFlags,__List),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(18,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(:(ergo_java,set_java_flags(__List)),','(:(interprolog,kill_java),:(ergo_java,initialize))))).
:-(FLORA_THIS_WORKSPACE(static^meth)('System',flapply(setJavaCP,__CP),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(20,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(:(ergo_java,set_java_flags([__CP])),','(:(interprolog,kill_java),:(ergo_java,initialize))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)('System',flapply(path,studioLogFile),__File,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(22,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(:(flrregistry,flora_configuration(uimode,studio)),','(!,','(','(flora_plg2hlg(__newvar3,'com.declarativa.fiji.FijiPreferences',flapply,0),','(flora_plg2hlg(__newvar4,flapply(string,__File),flapply,0),flora_plg2hlg(__newvar5,getLogFile,flapply,0))),','(:(interprolog,java(__newvar3,__newvar4,__newvar5)),','(flora_plg2hlg(__newvar3,'com.declarativa.fiji.FijiPreferences',flapply,1),','(flora_plg2hlg(__newvar4,flapply(string,__File),flapply,1),flora_plg2hlg(__newvar5,getLogFile,flapply,1))))))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)('Dialog',flapply(show,__Question),__Answer,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(24,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(nogui_session,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(!,','(write(__Question),','(write(' '),FLORA_THIS_WORKSPACE(readline_chop_nl)(__Answer,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)('Dialog',flapply(show,__Question),__Answer,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(26,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(!,','(:(flrerrhandler,disable_all_tripwires),','(xjAskUser(__Question,__Answer),:(flrerrhandler,enable_all_tripwires)))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)('Dialog',flapply(showOptions,__Title,__Message,__Buttons),__ChosenButton,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(28,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(','(!,','(';'(->(ipListenerWindow(__W),'\\true'),=(__W,null)),','(';'(->(:(usermod,atom(__Title)),'\\true'),','(:(flrdelaysupport,flora_arith_IS_builtin('ergo2java.ergo',216,__newquantvar3,'||'('',__Title))),FLORA_WORKSPACE(\\system,d^tblflapply)(sysabort,['dialog window''s title must be atomic string: ',__newquantvar3],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)))),','(';'(->(:(usermod,atom(__Message)),'\\true'),','(:(flrdelaysupport,flora_arith_IS_builtin('ergo2java.ergo',220,__newquantvar6,'||'('',__Message))),FLORA_WORKSPACE(\\system,d^tblflapply)(sysabort,['dialog window''s message must be atomic string: ',__newquantvar6],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)))),','(';'(->(','(:(usermod,is_list(__Buttons)),FLORA_THIS_WORKSPACE(is_atomlist)(__Buttons,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10))),'\\true'),','(:(flrdelaysupport,flora_arith_IS_builtin('ergo2java.ergo',224,__newquantvar11,'||'('',__Buttons))),FLORA_WORKSPACE(\\system,d^tblflapply)(sysabort,['dialog window''s button list must be a list of atoms: ',__newquantvar11],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar13)))),','(:(flrerrhandler,disable_all_tripwires),','(FLORA_THIS_WORKSPACE(show_options_dialog)(__Title,__Message,__Buttons,__W,__ChosenButton,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar14,__newcontextvar15)),:(flrerrhandler,enable_all_tripwires)))))))),fllibexecute_delayed_calls([__Buttons,__ChosenButton,__Message,__Title,__W],[__Buttons,__ChosenButton,__Message,__Title])))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Dialog',flapply(show,___Title,__Message),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(30,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(nogui_session,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(!,','(write(__Message),','(write(' (OK?) '),FLORA_THIS_WORKSPACE(readline_chop_nl)(__newdontcarevar5,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)))))),fllibexecute_delayed_calls([__Message,__newdontcarevar8],[__Message,___Title])))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Dialog',flapply(show,__Title,__Message),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(32,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(!,','(:(flrerrhandler,disable_all_tripwires),','(xjNotifyUser(__Title,__Message),:(flrerrhandler,enable_all_tripwires)))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)('Dialog',flapply(chooseFile,___FileExtensions),__File,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(34,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(nogui_session,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(!,','(write('Please type in a file name: '),FLORA_THIS_WORKSPACE(readline_chop_nl)(__File,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)('Dialog',flapply(chooseFile,__FileExtensions),__File,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(36,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(!,';'(->(FLORA_THIS_WORKSPACE(is_atomlist)(__FileExtensions,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(flrerrhandler,disable_all_tripwires),','(xjPickFile(__FileExtensions,'Done',__File),:(flrerrhandler,enable_all_tripwires)))),','(:(flrdelaysupport,flora_arith_IS_builtin('ergo2java.ergo',255,__newquantvar5,'||'('',__FileExtensions))),FLORA_WORKSPACE(\\system,d^tblflapply)(sysabort,['Dialog[chooseFile(?Extensions) -> ?]: ?Extensions must be bound to a list of desired extensions, ',__newquantvar5],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7))))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)('Dialog',chooseFile,__File,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(38,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(nogui_session,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(!,','(write('Please type in a file name: '),FLORA_THIS_WORKSPACE(readline_chop_nl)(__File,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)('Dialog',chooseFile,__File,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(40,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(!,','(:(flrerrhandler,disable_all_tripwires),','(xjPickFile([],'Done',__File),:(flrerrhandler,disable_all_tripwires)))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)('Window',flapply(open,__newdontcarevar1,__newdontcarevar2),__Window,'_$ctxt'(_CallerModuleVar,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''rule_enabled'(42,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(nogui_session,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(!,=(__Window,null))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)('Window',flapply(open,__WindTitle,__Tooltip),__Window,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(44,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(!,','(';'(->(','(:(usermod,atom(__WindTitle)),:(usermod,atom(__Tooltip))),'\\true'),FLORA_WORKSPACE(\\system,d^tblflapply)(sysabort,'Window[open(?Title,?Tooltip)->?]: the title and tooltip must be atomic strings','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),','(';'(->(:(flrdatatype,flora_is_var_prim(__Window)),'\\true'),FLORA_WORKSPACE(\\system,d^tblflapply)(sysabort,'Window[open(...)->?Window]: the ?Window parameter must be an unbound variable','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))),','(:(flrutils,open_gui_window(__Window,__WindTitle,__Tooltip)),';'(->(:(flrdatatype,flora_is_var_prim(__Window)),'\\false'),','(fllibinsert(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(isa)(__Window,'Window','_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar7,__newcontextvar8)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),FLORA_THIS_WORKSPACE(d^meth)('Window',flapply(setSize,__Window,80,25),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)))))))))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Window',flapply(setSize,__Win,__newdontcarevar1,__newdontcarevar2),'_$ctxt'(_CallerModuleVar,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''rule_enabled'(46,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(==(__Win,null),!))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Window',flapply(setSize,__Win,__Columns,__Rows),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(48,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(check_window)(__Win,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(!,','(fllibdelayedliteral('\\is','ergo2java.ergo',297,[__WPixels,*(__Columns,8)]),','(fllibdelayedliteral('\\is','ergo2java.ergo',298,[__HPixels,*(__Rows,14)]),','(','(flora_plg2hlg(__newvar5,__Win,flapply,0),flora_plg2hlg(__newvar6,flapply(setSize,flapply(int,__WPixels),flapply(int,__HPixels)),flapply,0)),','(:(interprolog,java(__newvar5,__newvar6)),','(flora_plg2hlg(__newvar5,__Win,flapply,1),flora_plg2hlg(__newvar6,flapply(setSize,flapply(int,__WPixels),flapply(int,__HPixels)),flapply,1)))))))),fllibexecute_delayed_calls([__Columns,__HPixels,__Rows,__WPixels,__Win],[__Columns,__Rows,__Win])))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Window',flapply(close,__Window),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(50,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(==(__Window,null),!))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Window',flapply(close,__Window),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(52,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(!,','(FLORA_THIS_WORKSPACE(check_window)(__Window,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),:(interprolog,java(__Window,dispose)))))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Window',flapply(clear,__Window),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(54,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(==(__Window,null),!))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Window',flapply(clear,__Window),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(56,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(!,','(FLORA_THIS_WORKSPACE(check_window)(__Window,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),:(interprolog,java(__Window,clear)))))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Window',flapply(alive,__Window),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(58,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(==(__Window,null),!))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Window',flapply(alive,__Window),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(60,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(!,','(FLORA_THIS_WORKSPACE(check_window)(__Window,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),:(flrutils,gui_object_visible(__Window)))))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Window',flapply(print,__Window,__Text),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(62,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(','(==(__Window,null),','(!,','(:(flrprint,process_text(__Text,nogui,__TextOut)),write(__TextOut)))),fllibexecute_delayed_calls([__Text,__TextOut,__Window],[__Text,__Window])))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Window',flapply(print,__Window,__Text),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(64,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(','(!,';'(->(FLORA_THIS_WORKSPACE(d^meth)('Window',flapply(alive,__Window),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(flrprint,process_text(__Text,gui,__TextOut)),','(','(flora_plg2hlg(__newvar5,__Window,flapply,0),flora_plg2hlg(__newvar6,flapply(print,flapply(string,__TextOut)),flapply,0)),','(:(interprolog,java(__newvar5,__newvar6)),','(flora_plg2hlg(__newvar5,__Window,flapply,1),flora_plg2hlg(__newvar6,flapply(print,flapply(string,__TextOut)),flapply,1)))))),','(:(flrprint,process_text(__Text,nogui,__TextOut)),write(__TextOut)))),fllibexecute_delayed_calls([__Text,__TextOut,__Window],[__Text,__Window])))).
:-(FLORA_THIS_WORKSPACE(check_window)(__Window,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(66,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(:(flrdatatype,flora_is_nonvar_prim(__Window)),','(FLORA_THIS_WORKSPACE(d^isa)(__Window,'Window','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),!)))).
:-(FLORA_THIS_WORKSPACE(check_window)(___Window,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(68,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),FLORA_WORKSPACE(\\system,d^tblflapply)(sysabort,'attempt to perform a window operation on a non-window object','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(is_atomlist)([],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(70,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(is_atomlist)([__H|__L],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(72,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(:(usermod,atom(__H)),FLORA_THIS_WORKSPACE(is_atomlist)(__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(nogui_session,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(74,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^mvd)('System',mode,[__newdontcarevar3,nogui],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),fllibexecute_delayed_calls([__newdontcarevar6],[])))).
:-(FLORA_THIS_WORKSPACE(show_options_dialog)(__newdontcarevar1,__Message,__Buttons,__newdontcarevar2,__ChosenButton,'_$ctxt'(_CallerModuleVar,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''rule_enabled'(76,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(nogui_session,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(!,','(','(:(flrdelaysupport,flora_arith_IS_builtin('ergo2java.ergo',409,__newquantvar7,'||'(__Message,'||'('
Possible choices: ','||'(__Buttons,' '))))),write(__newquantvar7)),','(FLORA_THIS_WORKSPACE(readline_chop_nl)(__ChosenButtonTry,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),';'(->(:(flrsetops,flora_list_member(__ChosenButtonTry,__Buttons)),=(__ChosenButton,__ChosenButtonTry)),','(write('+++ Invalid choice.
'),FLORA_THIS_WORKSPACE(show_options_dialog)(__newdontcarevar10,__Message,__Buttons,__newdontcarevar11,__ChosenButton,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar13)))))))),fllibexecute_delayed_calls([__Buttons,__ChosenButton,__ChosenButtonTry,__Message,__newdontcarevar14],[__Buttons,__ChosenButton,__Message,__newdontcarevar15])))).
:-(FLORA_THIS_WORKSPACE(show_options_dialog)(__Title,__Message,__Buttons,__W,__ChosenButton,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(78,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(:(flrerrhandler,disable_all_tripwires),','(xjShowOptionDialog(__Title,__Message,__Buttons,__W,__ChosenButton),:(flrerrhandler,disable_all_tripwires))))).
:-(FLORA_THIS_WORKSPACE(readline_chop_nl)(__L,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(80,'ergo2java.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_WORKSPACE(\\io,d^tblflapply)(readline,atom,__L1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),:(flrporting,flora_get_substring(__L1,0,-2,__L))),fllibexecute_delayed_calls([__L,__L1],[__L])))).

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
#define FLORA_FLS2_FILENAME  'ergo2java.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('ergo2java.ergo',FLORA_THIS_MODULE_NAME))).

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

:-(FLORA_THIS_WORKSPACE(check_window)(_h570611,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(check_window))(_h570611,FWContext)).
:-(FLORA_THIS_WORKSPACE(is_atomlist)(_h571250,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(is_atomlist))(_h571250,FWContext)).
:-(FLORA_THIS_WORKSPACE(readline_chop_nl)(_h571873,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(readline_chop_nl))(_h571873,FWContext)).
:-(FLORA_THIS_WORKSPACE(show_options_dialog)(_h572576,_h572578,_h572580,_h572582,_h572584,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(show_options_dialog))(_h572576,_h572578,_h572580,_h572582,_h572584,FWContext)).
