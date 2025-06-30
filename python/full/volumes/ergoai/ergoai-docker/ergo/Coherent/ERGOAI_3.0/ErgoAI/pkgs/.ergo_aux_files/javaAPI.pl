
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

#define FLORA_COMPILATION_ID 2

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
#define FLORA_THIS_FILENAME  'javaAPI.ergo'
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

 
#if !defined(FLORA_FDB_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FDB_FILENAME  'javaAPI.fdb'
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
#define FLORA_FLM_FILENAME  'javaAPI.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(javaAPI,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'javaAPI.fld'
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
#define FLORA_FLS_FILENAME  'javaAPI.fls'
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

:-(fllibexport([[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(write,__newdontcarevar1,__newdontcarevar2,__newdontcarevar3,__newcontextvar6))]])).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(write,__Obj,__Module,__FileName,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(4,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(openFile,__FileName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(','(:(flrporting,flora_install_dir(__FloraDir)),','(:(flrporting,flora_slash(__S)),:(flrporting,flora_concat_atoms([__FloraDir,__S,pkgs,__S,include,__S,'javaAPI.flh'],__IncludeFile)))),','(:(flrutils,flora_copy_and_preprocess(__IncludeFile,__newdontcarevar5,[' -D PROXY_CLASS=',__Obj])),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeBooleanMethods,__Obj,__Module,booleanMethodInh,'DATA','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeBooleanMethods,__Obj,__Module,booleanMethodNoninh,'DATA','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeBooleanMethods,__Obj,__Module,booleanMethodInh,'SIGNATURE','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeBooleanMethods,__Obj,__Module,booleanMethodNoninh,'SIGNATURE','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar13)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeProceduralMethods,__Obj,__Module,proceduralMethodNoninh,'DATA','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar14,__newcontextvar15)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeProceduralMethods,__Obj,__Module,proceduralMethodNoninh,'SIGNATURE','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar16,__newcontextvar17)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeValueMethods,__Obj,__Module,valueMethodInh,'DATA','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar18,__newcontextvar19)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeValueMethods,__Obj,__Module,valueMethodNoninh,'DATA','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar20,__newcontextvar21)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeValueMethods,__Obj,__Module,valueMethodInh,'SIGNATURE','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar22,__newcontextvar23)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeValueMethods,__Obj,__Module,valueMethodNoninh,'SIGNATURE','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar24,__newcontextvar25)),FLORA_THIS_WORKSPACE(d^tblflapply)(closeFile,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar26,__newcontextvar27))))))))))))))),fllibexecute_delayed_calls([__FileName,__FloraDir,__IncludeFile,__Module,__Obj,__S,__newdontcarevar28],[__FileName,__Module,__Obj])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(openFile,__FileName,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(6,'javaAPI.flr',FLORA_THIS_MODULE_NAME),FLORA_WORKSPACE(\\io,d^meth)(__FileName,tell,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(closeFile,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(8,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,0,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(writeln('}'),told)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(writeBooleanMethods,__Obj,__Module,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(10,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(','(fllibifthenelse(FLORA_THIS_MODULE_NAME,==(__Inherit,booleanMethodInh),','(fllibsetof(__newdontcarevar9,[],[],','(','(fllibmodlit('d^iboolsig',[__Obj,__newdontcarevar9,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_THIS_WORKSPACE(d^tblflapply)(good_method,__newdontcarevar9,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))),fllibexecute_delayed_calls([__newdontcarevar9,__Module,__Obj],[])),__newvar10),=(__MethodList,__newvar10)),','(fllibsetof(__newdontcarevar21,[],[],','(','(';'(fllibmodlit('d^boolsig',[__Obj,__newdontcarevar21,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14)),fllibmodlit('d^iboolsig',[__Obj,__newdontcarevar21,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,__newcontextvar16)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar17,__newcontextvar18))),FLORA_THIS_WORKSPACE(d^tblflapply)(good_method,__newdontcarevar21,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar19,__newcontextvar20))),fllibexecute_delayed_calls([__newdontcarevar21,__Module,__Obj],[])),__newvar22),=(__MethodList,__newvar22)),92,'javaAPI.flr'),FLORA_THIS_WORKSPACE(d^tblflapply)(callXOnList,__Inherit,__MethodList,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar23,__newcontextvar24))),fllibexecute_delayed_calls([__DataOrSign,__Inherit,__MethodList,__Module,__Obj],[__DataOrSign,__Inherit,__Module,__Obj])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(writeProceduralMethods,__Obj,__Module,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(12,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(','(fllibifthenelse(FLORA_THIS_MODULE_NAME,==(__Inherit,proceduralMethodInh),FLORA_WORKSPACE(\\system,d^tblflapply)(abort,'Inheritable procedural methods are not yet supported','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(fllibsetof(__newdontcarevar11,[],[],','(','(fllibmodlit('d^transig',[__Obj,__newdontcarevar11,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),FLORA_THIS_WORKSPACE(d^tblflapply)(good_method,__newdontcarevar11,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10))),fllibexecute_delayed_calls([__newdontcarevar11,__Module,__Obj],[])),__newvar12),=(__MethodList,__newvar12)),98,'javaAPI.flr'),FLORA_THIS_WORKSPACE(d^tblflapply)(callXOnList,__Inherit,__MethodList,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14))),fllibexecute_delayed_calls([__DataOrSign,__Inherit,__MethodList,__Module,__Obj],[__DataOrSign,__Inherit,__Module,__Obj])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(writeValueMethods,__Obj,__Module,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(14,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(','(fllibifthenelse(FLORA_THIS_MODULE_NAME,==(__Inherit,valueMethodInh),','(fllibsetof(__newdontcarevar9,[],[],','(','(fllibmodlit('d^imvdsig',[__Obj,__newdontcarevar9,___X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_THIS_WORKSPACE(d^tblflapply)(good_method,__newdontcarevar9,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))),fllibexecute_delayed_calls([__newdontcarevar9,__Module,__Obj,___X],[])),__newvar10),=(__MethodList,__newvar10)),','(fllibsetof(__newdontcarevar21,[],[],','(','(';'(fllibmodlit('d^mvdsig',[__Obj,__newdontcarevar21,___X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14)),fllibmodlit('d^imvdsig',[__Obj,__newdontcarevar21,___X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,__newcontextvar16)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar17,__newcontextvar18))),FLORA_THIS_WORKSPACE(d^tblflapply)(good_method,__newdontcarevar21,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar19,__newcontextvar20))),fllibexecute_delayed_calls([__newdontcarevar21,__Module,__Obj,___X],[])),__newvar22),=(__MethodList,__newvar22)),104,'javaAPI.flr'),FLORA_THIS_WORKSPACE(d^tblflapply)(callXOnList,__Inherit,__MethodList,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar23,__newcontextvar24))),fllibexecute_delayed_calls([__DataOrSign,__Inherit,__MethodList,__Module,__Obj,___X],[__DataOrSign,__Inherit,__Module,__Obj])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(callXOnList,__Op,[__First|__Rest],__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(16,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(__Op,__First,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^tblflapply)(callXOnList,__Op,__Rest,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(booleanMethodInh,__Method,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(18,'javaAPI.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(booleanMethodAny,__Method,'INHERITABLE',__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(booleanMethodNoninh,__Method,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(20,'javaAPI.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(booleanMethodAny,__Method,'NONINHERITABLE',__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(booleanMethodAny,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(22,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(boolMethodGet,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(boolMethodGetAll,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(boolMethodSet,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),FLORA_THIS_WORKSPACE(d^tblflapply)(boolMethodDelete,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(proceduralMethodInh,__Method,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(24,'javaAPI.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(proceduralMethodAny,__Method,'INHERITABLE',__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(proceduralMethodNoninh,__Method,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(26,'javaAPI.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(proceduralMethodAny,__Method,'NONINHERITABLE',__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(proceduralMethodAny,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(28,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(procMethodGet,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(procMethodGetAll,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(procMethodSet,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),FLORA_THIS_WORKSPACE(d^tblflapply)(procMethodDelete,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(valueMethodInh,__Method,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(30,'javaAPI.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(valueMethodAny,__Method,'INHERITABLE',__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(valueMethodNoninh,__Method,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(32,'javaAPI.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(valueMethodAny,__Method,'NONINHERITABLE',__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(valueMethodAny,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(34,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(valueMethodGet,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(valueMethodGetAll,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(valueMethodSet,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(valueMethodDelete,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),FLORA_THIS_WORKSPACE(d^tblflapply)(valueMethodDeleteAll,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(boolMethodGet,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(36,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(boolMethodGetProto,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^tblflapply)(boolMethodGetBody,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(boolMethodGetAll,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(38,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(boolMethodGetAllProto,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^tblflapply)(boolMethodGetAllBody,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(boolMethodSet,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(40,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(boolMethodSetProto,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^tblflapply)(boolMethodSetBody,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(boolMethodDelete,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(42,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(boolMethodDeleteProto,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^tblflapply)(boolMethodDeleteBody,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(boolMethodGetProto,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(44,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__Method,[__H|__Args]),','(';'(->(=(__H,flapply(hilog,__FnName)),=(__Args,__FnArgs)),=(__Args,[__FnName|__FnArgs])),','(';'(','(==(__DataOrSign,'DATA'),','(!,=(__Modifier1,'D'))),=(__Modifier1,'S')),','(';'(','(==(__Inherit,'INHERITABLE'),','(!,=(__Modifier2,'I'))),=(__Modifier2,'N')),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(format,format('public boolean getB~w~w_',[__Modifier1,__Modifier2])),','(FLORA_WORKSPACE(\\io,d^tblflapply)(write,__FnName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(write('('),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeParlist,__FnArgs,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),writeln(')')))))))))),fllibexecute_delayed_calls([__Args,__DataOrSign,__FnArgs,__FnName,__H,__Inherit,__Method,__Modifier1,__Modifier2],[__DataOrSign,__Inherit,__Method])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(boolMethodGetAllProto,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(46,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__Method,[__H|__Args]),','(';'(->(=(__H,flapply(hilog,__FnName)),=(__Args,__FnArgs)),=(__Args,[__FnName|__FnArgs])),','(';'(','(==(__DataOrSign,'DATA'),','(!,=(__Modifier1,'D'))),=(__Modifier1,'S')),','(';'(','(==(__Inherit,'INHERITABLE'),','(!,=(__Modifier2,'I'))),=(__Modifier2,'N')),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(format,format('public Iterator<HashMap<String,FloraObject>> getB~w~wall_',[__Modifier1,__Modifier2])),','(FLORA_WORKSPACE(\\io,d^tblflapply)(write,__FnName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(write('('),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeParlist,__FnArgs,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),writeln(')')))))))))),fllibexecute_delayed_calls([__Args,__DataOrSign,__FnArgs,__FnName,__H,__Inherit,__Method,__Modifier1,__Modifier2],[__DataOrSign,__Inherit,__Method])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(boolMethodGetBody,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(48,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(writeln('{'),','(FLORA_THIS_WORKSPACE(d^tblflapply)(parentCallGetBody,__Method,__Inherit,getboolean,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),writeln('}
'))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(boolMethodGetAllBody,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(50,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(writeln('{'),','(FLORA_THIS_WORKSPACE(d^tblflapply)(parentCallGetBody,__Method,__Inherit,getbooleanAll,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),writeln('}
'))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(boolMethodSetProto,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(52,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__Method,[__H|__Args]),','(';'(->(=(__H,flapply(hilog,__FnName)),=(__Args,__FnArgs)),=(__Args,[__FnName|__FnArgs])),','(';'(','(==(__DataOrSign,'DATA'),','(!,=(__Modifier1,'D'))),=(__Modifier1,'S')),','(';'(','(==(__Inherit,'INHERITABLE'),','(!,=(__Modifier2,'I'))),=(__Modifier2,'N')),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(format,format('public boolean setB~w~w_',[__Modifier1,__Modifier2])),','(FLORA_WORKSPACE(\\io,d^tblflapply)(write,__FnName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(write('('),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeParlist,__FnArgs,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),writeln(')')))))))))),fllibexecute_delayed_calls([__Args,__DataOrSign,__FnArgs,__FnName,__H,__Inherit,__Method,__Modifier1,__Modifier2],[__DataOrSign,__Inherit,__Method])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(boolMethodSetBody,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(54,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(writeln('{'),','(FLORA_THIS_WORKSPACE(d^tblflapply)(parentCallSetBody,__Method,__Inherit,setboolean,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),writeln('}
'))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(boolMethodDeleteProto,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(56,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__Method,[__H|__Args]),','(';'(->(=(__H,flapply(hilog,__FnName)),=(__Args,__FnArgs)),=(__Args,[__FnName|__FnArgs])),','(';'(','(==(__DataOrSign,'DATA'),','(!,=(__Modifier1,'D'))),=(__Modifier1,'S')),','(';'(','(==(__Inherit,'INHERITABLE'),','(!,=(__Modifier2,'I'))),=(__Modifier2,'N')),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(format,format('public boolean deleteB~w~w_',[__Modifier1,__Modifier2])),','(FLORA_WORKSPACE(\\io,d^tblflapply)(write,__FnName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(write('('),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeParlist,__FnArgs,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),writeln(')')))))))))),fllibexecute_delayed_calls([__Args,__DataOrSign,__FnArgs,__FnName,__H,__Inherit,__Method,__Modifier1,__Modifier2],[__DataOrSign,__Inherit,__Method])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(boolMethodDeleteBody,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(58,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(writeln('{'),','(FLORA_THIS_WORKSPACE(d^tblflapply)(parentCallDeleteBody,__Method,__Inherit,deleteboolean,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),writeln('}
'))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(procMethodGet,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(60,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(procMethodGetProto,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^tblflapply)(procMethodGetBody,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(procMethodGetAll,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(62,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(procMethodGetAllProto,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^tblflapply)(procMethodGetAllBody,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(procMethodSet,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(64,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(procMethodSetProto,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^tblflapply)(procMethodSetBody,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(procMethodDelete,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(66,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(procMethodDeleteProto,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^tblflapply)(procMethodDeleteBody,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(procMethodGetProto,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(68,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__Method,[__H|__Args]),','(';'(->(=(__H,flapply(hilog,__FnName)),=(__Args,__FnArgs)),=(__Args,[__FnName|__FnArgs])),','(';'(','(==(__DataOrSign,'DATA'),','(!,=(__Modifier1,'D'))),=(__Modifier1,'S')),','(';'(','(==(__Inherit,'INHERITABLE'),','(!,=(__Modifier2,'I'))),=(__Modifier2,'N')),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(format,format('public boolean getP~w~w_',[__Modifier1,__Modifier2])),','(FLORA_WORKSPACE(\\io,d^tblflapply)(write,__FnName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(write('('),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeParlist,__FnArgs,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),writeln(')')))))))))),fllibexecute_delayed_calls([__Args,__DataOrSign,__FnArgs,__FnName,__H,__Inherit,__Method,__Modifier1,__Modifier2],[__DataOrSign,__Inherit,__Method])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(procMethodGetAllProto,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(70,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__Method,[__H|__Args]),','(';'(->(=(__H,flapply(hilog,__FnName)),=(__Args,__FnArgs)),=(__Args,[__FnName|__FnArgs])),','(';'(','(==(__DataOrSign,'DATA'),','(!,=(__Modifier1,'D'))),=(__Modifier1,'S')),','(';'(','(==(__Inherit,'INHERITABLE'),','(!,=(__Modifier2,'I'))),=(__Modifier2,'N')),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(format,format('public Iterator<HashMap<String,FloraObject>> getallP~w~w_',[__Modifier1,__Modifier2])),','(FLORA_WORKSPACE(\\io,d^tblflapply)(write,__FnName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(write('('),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeParlist,__FnArgs,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),writeln(')')))))))))),fllibexecute_delayed_calls([__Args,__DataOrSign,__FnArgs,__FnName,__H,__Inherit,__Method,__Modifier1,__Modifier2],[__DataOrSign,__Inherit,__Method])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(procMethodGetBody,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(72,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(writeln('{'),','(FLORA_THIS_WORKSPACE(d^tblflapply)(parentCallGetBody,__Method,__Inherit,getprocedural,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),writeln('}
'))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(procMethodGetAllBody,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(74,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(writeln('{'),','(FLORA_THIS_WORKSPACE(d^tblflapply)(parentCallGetBody,__Method,__Inherit,getproceduralAll,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),writeln('}
'))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(procMethodSetProto,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(76,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__Method,[__H|__Args]),','(';'(->(=(__H,flapply(hilog,__FnName)),=(__Args,__FnArgs)),=(__Args,[__FnName|__FnArgs])),','(';'(','(==(__DataOrSign,'DATA'),','(!,=(__Modifier1,'D'))),=(__Modifier1,'S')),','(';'(','(==(__Inherit,'INHERITABLE'),','(!,=(__Modifier2,'I'))),=(__Modifier2,'N')),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(format,format('public boolean setP~w~w_',[__Modifier1,__Modifier2])),','(FLORA_WORKSPACE(\\io,d^tblflapply)(write,__FnName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(write('('),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeParlist,__FnArgs,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),writeln(')')))))))))),fllibexecute_delayed_calls([__Args,__DataOrSign,__FnArgs,__FnName,__H,__Inherit,__Method,__Modifier1,__Modifier2],[__DataOrSign,__Inherit,__Method])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(procMethodSetBody,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(78,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(writeln('{'),','(FLORA_THIS_WORKSPACE(d^tblflapply)(parentCallSetBody,__Method,__Inherit,setprocedural,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),writeln('}
'))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(procMethodDeleteProto,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(80,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__Method,[__H|__Args]),','(';'(->(=(__H,flapply(hilog,__FnName)),=(__Args,__FnArgs)),=(__Args,[__FnName|__FnArgs])),','(';'(','(==(__DataOrSign,'DATA'),','(!,=(__Modifier1,'D'))),=(__Modifier1,'S')),','(';'(','(==(__Inherit,'INHERITABLE'),','(!,=(__Modifier2,'I'))),=(__Modifier2,'N')),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(format,format('public boolean deleteP~w~w_',[__Modifier1,__Modifier2])),','(FLORA_WORKSPACE(\\io,d^tblflapply)(write,__FnName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(write('('),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeParlist,__FnArgs,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),writeln(')')))))))))),fllibexecute_delayed_calls([__Args,__DataOrSign,__FnArgs,__FnName,__H,__Inherit,__Method,__Modifier1,__Modifier2],[__DataOrSign,__Inherit,__Method])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(procMethodDeleteBody,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(82,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(writeln('{'),','(FLORA_THIS_WORKSPACE(d^tblflapply)(parentCallDeleteBody,__Method,__Inherit,deleteprocedural,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),writeln('}
'))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(valueMethodSet,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(84,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(valueMethodSetProto,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(valueMethodSetBody,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(valueMethodSetProtoOneVal,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),FLORA_THIS_WORKSPACE(d^tblflapply)(valueMethodSetBody,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(valueMethodGet,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(86,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(valueMethodGetProto,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^tblflapply)(valueMethodGetBody,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(valueMethodGetAll,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(88,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(valueMethodGetAllProto,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^tblflapply)(valueMethodGetAllBody,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(valueMethodDelete,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(90,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(valueMethodDeleteProto,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(valueMethodDeleteBody,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(valueMethodDeleteProtoOneVal,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),FLORA_THIS_WORKSPACE(d^tblflapply)(valueMethodDeleteBody,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(valueMethodDeleteAll,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(92,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(valueMethodDeleteAllProto,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^tblflapply)(valueMethodDeleteAllBody,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(valueMethodSetProtoOneVal,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(94,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__Method,[__H|__Args]),','(fllibifthenelse(FLORA_THIS_MODULE_NAME,=(__H,flapply(hilog,__FnName)),','(=(__Args,__FnArgs),=(__Msg,',Object value)')),','(=(__Args,[__FnName|__FnArgs]),=(__Msg,'Object value)')),394,'javaAPI.flr'),','(';'(','(==(__DataOrSign,'DATA'),','(!,=(__Modifier1,'D'))),=(__Modifier1,'S')),','(';'(','(==(__Inherit,'INHERITABLE'),','(!,=(__Modifier2,'I'))),=(__Modifier2,'N')),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(format,format('public boolean setV~w~w_',[__Modifier1,__Modifier2])),','(FLORA_WORKSPACE(\\io,d^tblflapply)(write,__FnName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(write('('),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeParlist,__FnArgs,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),writeln(__Msg)))))))))),fllibexecute_delayed_calls([__Args,__DataOrSign,__FnArgs,__FnName,__H,__Inherit,__Method,__Modifier1,__Modifier2,__Msg],[__DataOrSign,__Inherit,__Method])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(valueMethodSetProto,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(96,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__Method,[__H|__Args]),','(fllibifthenelse(FLORA_THIS_MODULE_NAME,=(__H,flapply(hilog,__FnName)),','(=(__Args,__FnArgs),=(__Msg,',Vector<Object> value)')),','(=(__Args,[__FnName|__FnArgs]),=(__Msg,'Vector<Object> value)')),407,'javaAPI.flr'),','(';'(','(==(__DataOrSign,'DATA'),','(!,=(__Modifier1,'D'))),=(__Modifier1,'S')),','(';'(','(==(__Inherit,'INHERITABLE'),','(!,=(__Modifier2,'I'))),=(__Modifier2,'N')),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(format,format('public boolean setV~w~w_',[__Modifier1,__Modifier2])),','(FLORA_WORKSPACE(\\io,d^tblflapply)(write,__FnName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(write('('),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeParlist,__FnArgs,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),writeln(__Msg)))))))))),fllibexecute_delayed_calls([__Args,__DataOrSign,__FnArgs,__FnName,__H,__Inherit,__Method,__Modifier1,__Modifier2,__Msg],[__DataOrSign,__Inherit,__Method])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(valueMethodGetProto,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(98,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__Method,[__H|__Args]),','(';'(->(=(__H,flapply(hilog,__FnName)),=(__Args,__FnArgs)),=(__Args,[__FnName|__FnArgs])),','(';'(','(==(__DataOrSign,'DATA'),','(!,=(__Modifier1,'D'))),=(__Modifier1,'S')),','(';'(','(==(__Inherit,'INHERITABLE'),','(!,=(__Modifier2,'I'))),=(__Modifier2,'N')),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(format,format('public Iterator<FloraObject> getV~w~w_',[__Modifier1,__Modifier2])),','(FLORA_WORKSPACE(\\io,d^tblflapply)(write,__FnName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(write('('),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeParlist,__FnArgs,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),write(')')))))))))),fllibexecute_delayed_calls([__Args,__DataOrSign,__FnArgs,__FnName,__H,__Inherit,__Method,__Modifier1,__Modifier2],[__DataOrSign,__Inherit,__Method])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(valueMethodGetAllProto,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(100,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__Method,[__H|__Args]),','(';'(->(=(__H,flapply(hilog,__FnName)),=(__Args,__FnArgs)),=(__Args,[__FnName|__FnArgs])),','(';'(','(==(__DataOrSign,'DATA'),','(!,=(__Modifier1,'D'))),=(__Modifier1,'S')),','(';'(','(==(__Inherit,'INHERITABLE'),','(!,=(__Modifier2,'I'))),=(__Modifier2,'N')),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(format,format('public Iterator<HashMap<String,FloraObject>> getallV~w~w_',[__Modifier1,__Modifier2])),','(FLORA_WORKSPACE(\\io,d^tblflapply)(write,__FnName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(write('('),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeParlist,__FnArgs,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),write(')')))))))))),fllibexecute_delayed_calls([__Args,__DataOrSign,__FnArgs,__FnName,__H,__Inherit,__Method,__Modifier1,__Modifier2],[__DataOrSign,__Inherit,__Method])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(valueMethodDeleteProtoOneVal,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(102,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__Method,[__H|__Args]),','(fllibifthenelse(FLORA_THIS_MODULE_NAME,=(__H,flapply(hilog,__FnName)),','(=(__Args,__FnArgs),=(__Msg,',Object value)')),','(=(__Args,[__FnName|__FnArgs]),=(__Msg,'Object value)')),450,'javaAPI.flr'),','(';'(','(==(__DataOrSign,'DATA'),','(!,=(__Modifier1,'D'))),=(__Modifier1,'S')),','(';'(','(==(__Inherit,'INHERITABLE'),','(!,=(__Modifier2,'I'))),=(__Modifier2,'N')),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(format,format('public boolean deleteV~w~w_',[__Modifier1,__Modifier2])),','(FLORA_WORKSPACE(\\io,d^tblflapply)(write,__FnName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(write('('),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeParlist,__FnArgs,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),writeln(__Msg)))))))))),fllibexecute_delayed_calls([__Args,__DataOrSign,__FnArgs,__FnName,__H,__Inherit,__Method,__Modifier1,__Modifier2,__Msg],[__DataOrSign,__Inherit,__Method])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(valueMethodDeleteProto,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(104,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__Method,[__H|__Args]),','(fllibifthenelse(FLORA_THIS_MODULE_NAME,=(__H,flapply(hilog,__FnName)),','(=(__Args,__FnArgs),=(__Msg,',Vector<Object> value)')),','(=(__Args,[__FnName|__FnArgs]),=(__Msg,'Vector<Object> value)')),464,'javaAPI.flr'),','(';'(','(==(__DataOrSign,'DATA'),','(!,=(__Modifier1,'D'))),=(__Modifier1,'S')),','(';'(','(==(__Inherit,'INHERITABLE'),','(!,=(__Modifier2,'I'))),=(__Modifier2,'N')),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(format,format('public boolean deleteV~w~w_',[__Modifier1,__Modifier2])),','(FLORA_WORKSPACE(\\io,d^tblflapply)(write,__FnName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(write('('),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeParlist,__FnArgs,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),writeln(__Msg)))))))))),fllibexecute_delayed_calls([__Args,__DataOrSign,__FnArgs,__FnName,__H,__Inherit,__Method,__Modifier1,__Modifier2,__Msg],[__DataOrSign,__Inherit,__Method])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(valueMethodDeleteAllProto,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(106,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__Method,[__H|__Args]),','(';'(->(=(__H,flapply(hilog,__FnName)),=(__Args,__FnArgs)),=(__Args,[__FnName|__FnArgs])),','(';'(','(==(__DataOrSign,'DATA'),','(!,=(__Modifier1,'D'))),=(__Modifier1,'S')),','(';'(','(==(__Inherit,'INHERITABLE'),','(!,=(__Modifier2,'I'))),=(__Modifier2,'N')),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(format,format('public boolean deleteV~w~w_',[__Modifier1,__Modifier2])),','(FLORA_WORKSPACE(\\io,d^tblflapply)(write,__FnName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(write('('),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeParlist,__FnArgs,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),write(')')))))))))),fllibexecute_delayed_calls([__Args,__DataOrSign,__FnArgs,__FnName,__H,__Inherit,__Method,__Modifier1,__Modifier2],[__DataOrSign,__Inherit,__Method])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(valueMethodSetBody,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(108,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(writeln('{'),','(FLORA_THIS_WORKSPACE(d^tblflapply)(parentCallSetBody,__Method,__Inherit,setvalue,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),writeln('}
'))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(valueMethodGetBody,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(110,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(writeln('{'),','(FLORA_THIS_WORKSPACE(d^tblflapply)(parentCallGetBody,__Method,__Inherit,getvalue,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),writeln('}
'))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(valueMethodGetAllBody,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(112,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(writeln('{'),','(FLORA_THIS_WORKSPACE(d^tblflapply)(parentCallGetBody,__Method,__Inherit,getvalueAll,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),writeln('}
'))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(valueMethodDeleteBody,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(114,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(writeln('{'),','(FLORA_THIS_WORKSPACE(d^tblflapply)(parentCallDeleteBody,__Method,__Inherit,deletevalue,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),writeln('}
'))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(valueMethodDeleteAllBody,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(116,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(writeln('{'),','(FLORA_THIS_WORKSPACE(d^tblflapply)(parentCallDeleteAllBody,__Method,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),writeln('}
'))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(parentCallSetBody,__Method,__Inherit,__Type,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(118,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__Method,[__H|__Args]),','(';'(->(=(__H,flapply(hilog,__FnName)),=(__Args,__FnArgs)),=(__Args,[__FnName|__FnArgs])),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeVectorParsInit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeBodyList,__FnArgs,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_THIS_WORKSPACE(d^tblflapply)(writeProxySetCall,__FnName,__Inherit,__Type,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)))))),fllibexecute_delayed_calls([__Args,__DataOrSign,__FnArgs,__FnName,__H,__Inherit,__Method,__Type],[__DataOrSign,__Inherit,__Method,__Type])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(writeVectorParsInit,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(120,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),writeln('Vector<Object> pars = new Vector<Object>();')))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(writeProxySetCall,__FnName,__Inherit,__Type,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(122,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(','(';'(','(==(__Inherit,'INHERITABLE'),','(!,=(__Modifier,'I'))),=(__Modifier,'N')),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(format,format('return sourceFloraObject.~w(moduleName,"',[__Type])),','(FLORA_WORKSPACE(\\io,d^tblflapply)(write,__FnName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(write('",'),','(FLORA_WORKSPACE(\\io,d^tblflapply)(write,__Inherit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),','(write(','),','(FLORA_WORKSPACE(\\io,d^tblflapply)(write,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),';'(','(==(__Type,setvalue),','(!,writeln(',pars,value);'))),writeln(',pars);')))))))))),fllibexecute_delayed_calls([__DataOrSign,__FnName,__Inherit,__Modifier,__Type],[__DataOrSign,__FnName,__Inherit,__Type])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(parentCallGetBody,__Method,__Inherit,__Type,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(124,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__Method,[__H|__Args]),','(';'(->(=(__H,flapply(hilog,__FnName)),=(__Args,__FnArgs)),=(__Args,[__FnName|__FnArgs])),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeVectorParsInit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeBodyList,__FnArgs,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_THIS_WORKSPACE(d^tblflapply)(writeProxyGetCall,__FnName,__Inherit,__Type,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)))))),fllibexecute_delayed_calls([__Args,__DataOrSign,__FnArgs,__FnName,__H,__Inherit,__Method,__Type],[__DataOrSign,__Inherit,__Method,__Type])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(writeProxyGetCall,__FnName,__Inherit,__Type,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(126,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(format,format('return sourceFloraObject.~w(moduleName,"',[__Type])),','(FLORA_WORKSPACE(\\io,d^tblflapply)(write,__FnName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(write('",'),','(FLORA_WORKSPACE(\\io,d^tblflapply)(write,__Inherit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),','(write(','),','(FLORA_WORKSPACE(\\io,d^tblflapply)(write,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),writeln(',pars);')))))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(parentCallGetAllBody,__Method,__Inherit,__Type,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(128,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__Method,[__H|__Args]),','(';'(->(=(__H,flapply(hilog,__FnName)),=(__Args,__FnArgs)),=(__Args,[__FnName|__FnArgs])),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeVectorParsInit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeGetAllBodyList,__FnArgs,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_THIS_WORKSPACE(d^tblflapply)(writeProxyGetCall,__FnName,__Inherit,__Type,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)))))),fllibexecute_delayed_calls([__Args,__DataOrSign,__FnArgs,__FnName,__H,__Inherit,__Method,__Type],[__DataOrSign,__Inherit,__Method,__Type])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(parentCallDeleteBody,__Method,__Inherit,__Type,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(130,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__Method,[__H|__Args]),','(';'(->(=(__H,flapply(hilog,__FnName)),=(__Args,__FnArgs)),=(__Args,[__FnName|__FnArgs])),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeVectorParsInit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeBodyList,__FnArgs,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_THIS_WORKSPACE(d^tblflapply)(writeProxyDeleteBody,__FnName,__Inherit,__Type,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)))))),fllibexecute_delayed_calls([__Args,__DataOrSign,__FnArgs,__FnName,__H,__Inherit,__Method,__Type],[__DataOrSign,__Inherit,__Method,__Type])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(writeProxyDeleteBody,__FnName,__Inherit,__Type,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(132,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(format,format('return sourceFloraObject.~w(moduleName,"',[__Type])),','(FLORA_WORKSPACE(\\io,d^tblflapply)(write,__FnName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(write('",'),','(FLORA_WORKSPACE(\\io,d^tblflapply)(write,__Inherit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),','(write(','),','(FLORA_WORKSPACE(\\io,d^tblflapply)(write,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),';'(','(==(__Type,deletevalue),','(!,writeln(',pars,value);'))),writeln(',pars);'))))))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(parentCallDeleteAllBody,__Method,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(134,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__Method,[__H|__Args]),','(';'(->(=(__H,flapply(hilog,__FnName)),=(__Args,__FnArgs)),=(__Args,[__FnName|__FnArgs])),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeVectorParsInit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(writeBodyList,__FnArgs,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_THIS_WORKSPACE(d^tblflapply)(writeProxyDeleteAllBody,__FnName,__Inherit,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)))))),fllibexecute_delayed_calls([__Args,__DataOrSign,__FnArgs,__FnName,__H,__Inherit,__Method],[__DataOrSign,__Inherit,__Method])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(writeProxyDeleteAllBody,__FnName,__Inherit,__DataOrSign,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(136,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(write('return sourceFloraObject.deletevalue(moduleName,"'),','(FLORA_WORKSPACE(\\io,d^tblflapply)(write,__FnName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(write('",'),','(FLORA_WORKSPACE(\\io,d^tblflapply)(write,__Inherit,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),','(write(','),','(FLORA_WORKSPACE(\\io,d^tblflapply)(write,__DataOrSign,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),writeln(',pars);')))))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(writeParlist,[],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(138,'javaAPI.flr',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(writeParlist,[__A|__X],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(140,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(write('Object '),','(FLORA_WORKSPACE(\\io,d^tblflapply)(write,__A,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),fllibunlessdo(FLORA_THIS_MODULE_NAME,==(__X,[]),','(write(', '),FLORA_THIS_WORKSPACE(d^tblflapply)(writeParlist,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))),632,'javaAPI.flr'))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(writeBodyList,[],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(142,'javaAPI.flr',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(writeBodyList,[__A|__X],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(144,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(write('pars.add('),','(FLORA_WORKSPACE(\\io,d^tblflapply)(write,__A,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(writeln(');'),FLORA_THIS_WORKSPACE(d^tblflapply)(writeBodyList,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(writeGetAllBodyList,[],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(146,'javaAPI.flr',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(writeGetAllBodyList,[__A|__X],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(148,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(indent,2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(write('pars.add("Par_'),','(FLORA_WORKSPACE(\\io,d^tblflapply)(write,__A,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(writeln('");'),FLORA_THIS_WORKSPACE(d^tblflapply)(writeGetAllBodyList,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(indent,0,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(150,'javaAPI.flr',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(indent,1,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(152,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(!,write('    ')))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(indent,__N,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(154,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(','(fllibdelayedliteral(>,'javaAPI.flr',656,[__N,1]),','(write('  '),','(fllibdelayedliteral('\\is','javaAPI.flr',656,[__N1,-(__N,1)]),FLORA_THIS_WORKSPACE(d^tblflapply)(indent,__N1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))),fllibexecute_delayed_calls([__N,__N1],[__N])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(good_method,__M,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(156,'javaAPI.flr',FLORA_THIS_MODULE_NAME),','(','(:(flora_ground,flrground(__M)),\+(:(basics,memberchk(__M,[','(__newdontcarevar3,__newdontcarevar4),';'(__newdontcarevar5,__newdontcarevar6),?-(__newdontcarevar7),+(__newdontcarevar8,__newdontcarevar9)])))),fllibexecute_delayed_calls([__M,__newdontcarevar10],[__M])))).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rule signatures %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%% Signatures for latent queries %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%% Queries found in the source file %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_WORKSPACE(\\system,d^meth)('Method',flapply(mustDefine,on),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar1,__newcontextvar2))),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_WORKSPACE(\\system,d^meth)('Method',flapply(mustDefine,off,','(fllibmodlit('d^boolsig',[__newdontcarevar1,__newdontcarevar2,'_$ctxt'(__newcontextvar3,__newcontextvar4,__newcontextvar5)],__A,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),','(fllibmodlit('d^iboolsig',[__newdontcarevar8,__newdontcarevar9,'_$ctxt'(__newcontextvar10,__newcontextvar11,__newcontextvar12)],__A,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14)),','(fllibmodlit('d^transig',[__newdontcarevar15,__newdontcarevar16,'_$ctxt'(__newcontextvar17,__newcontextvar18,__newcontextvar19)],__A,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar20,__newcontextvar21)),','(fllibmodlit('d^itransig',[__newdontcarevar22,__newdontcarevar23,'_$ctxt'(__newcontextvar24,__newcontextvar25,__newcontextvar26)],__A,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar27,__newcontextvar28)),','(fllibmodlit('d^mvdsig',[__newdontcarevar29,__newdontcarevar30,__newdontcarevar31,'_$ctxt'(__newcontextvar32,__newcontextvar33,__newcontextvar34)],__A,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar35,__newcontextvar36)),fllibmodlit('d^imvdsig',[__newdontcarevar37,__newdontcarevar38,__newdontcarevar39,'_$ctxt'(__newcontextvar40,__newcontextvar41,__newcontextvar42)],__A,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar43,__newcontextvar44)))))))),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar45,__newcontextvar46))),[=('?A',__A)])).

 
#if !defined(FLORA_FLS2_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLS2_FILENAME  'javaAPI.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('javaAPI.ergo',FLORA_THIS_MODULE_NAME))).

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

