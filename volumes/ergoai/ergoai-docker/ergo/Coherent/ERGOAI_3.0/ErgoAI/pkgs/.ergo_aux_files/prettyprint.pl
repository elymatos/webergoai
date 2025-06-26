
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

#define FLORA_COMPILATION_ID 4

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
#define FLORA_THIS_FILENAME  'prettyprint.ergo'
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

 
#if !defined(FLORA_FLM_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLM_FILENAME  'prettyprint.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(prettyprint,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'prettyprint.fld'
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
#define FLORA_FLS_FILENAME  'prettyprint.fls'
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

:-(fllibexport([[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar1,flapply(pp_class,__newdontcarevar2,__newdontcarevar3),__newcontextvar6))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar7,flapply(pp_class,__newdontcarevar8),__newcontextvar11))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar12,pp_class,__newcontextvar15))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar16,flapply(pp_self,__newdontcarevar17,__newdontcarevar18),__newcontextvar21))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar22,flapply(pp_self,__newdontcarevar23),__newcontextvar26))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar27,pp_self,__newcontextvar30))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar31,flapply(pp_isa,__newdontcarevar32,__newdontcarevar33),__newcontextvar36))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar37,flapply(pp_isa,__newdontcarevar38),__newcontextvar41))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar42,pp_isa,__newcontextvar45))]])).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_print_ignore,'________','_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(4,'prettyprint.flr',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(static^meth)(__Class,flapply(pp_class,__Module,__Outfile),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(6,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(tell(__Outfile),','(FLORA_THIS_WORKSPACE(d^meth)(__Class,flapply(pp_class,__Module),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),told)))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__Class,flapply(pp_class,__Module),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(8,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_immediate_superclasses,__Class,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(d^meth)(__Class,flapply(pp_self,__Module),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(fllibmodlit('d^isa',[__X,__Class,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),','(:(flora_ground,flrground(__X)),','(FLORA_THIS_WORKSPACE(d^meth)(__X,flapply(pp_self,__Module),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)),'\\false'))))),fllibexecute_delayed_calls([__Class,__Module,__X],[__Class,__Module])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(___Class,flapply(pp_class,__newdontcarevar1),'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(10,'prettyprint.flr',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(static^meth)(__Class,pp_class,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(12,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),FLORA_THIS_WORKSPACE(d^meth)(__Class,flapply(pp_class,__Mod),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),fllibexecute_delayed_calls([__Class,__Mod],[__Class])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__X,flapply(pp_self,__Module),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(14,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_immediate_classes,__X,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_header,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(print_class,__X,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_header,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),FLORA_THIS_WORKSPACE(d^tblflapply)(print_object,__X,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(print_class,__X,__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(16,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(','(writeln('[|'),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_body_iset,__X,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_comma_conditional,','(fllibmodlit('d^imvd',[__X,__newdontcarevar5,__newdontcarevar6,'_$ctxt'(__newcontextvar7,__newcontextvar8,__newcontextvar9)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11)),fllibmodlit('d^imeth',[__X,__newdontcarevar12,'_$ctxt'(__newcontextvar13,__newcontextvar14,__newcontextvar15)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar16,__newcontextvar17))),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar18,__newcontextvar19)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_body_ibool,__X,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar20,__newcontextvar21)),','(nl,','(writeln('|].'),nl)))))),fllibexecute_delayed_calls([__Module,__X,__newdontcarevar22],[__Module,__X])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(print_object,__X,__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(18,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(','(writeln('['),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_body_set,__X,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_comma_conditional,','(fllibmodlit('d^mvd',[__X,__newdontcarevar5,__newdontcarevar6,'_$ctxt'(__newcontextvar7,__newcontextvar8,__newcontextvar9)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11)),fllibmodlit('d^meth',[__X,__newdontcarevar12,'_$ctxt'(__newcontextvar13,__newcontextvar14,__newcontextvar15)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar16,__newcontextvar17))),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar18,__newcontextvar19)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_body_bool,__X,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar20,__newcontextvar21)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_comma_conditional,','(fllibmodlit('d^meth',[__X,__newdontcarevar22,'_$ctxt'(__newcontextvar23,__newcontextvar24,__newcontextvar25)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar26,__newcontextvar27)),fllibmodlit('d^tran',[__X,__newdontcarevar28,'_$ctxt'(__newcontextvar29,__newcontextvar30,__newcontextvar31)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar32,__newcontextvar33))),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar34,__newcontextvar35)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_body_tran,__X,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar36,__newcontextvar37)),','(nl,','(writeln('].'),nl)))))))),fllibexecute_delayed_calls([__Module,__X,__newdontcarevar38],[__Module,__X])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__X,flapply(pp_self,__Module,__Outfile),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(20,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(tell(__Outfile),','(FLORA_THIS_WORKSPACE(d^meth)(__X,flapply(pp_self,__Module),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),told)))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__X,pp_self,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(22,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),FLORA_THIS_WORKSPACE(d^meth)(__X,flapply(pp_self,__Mod),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),fllibexecute_delayed_calls([__Mod,__X],[__X])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__Class,flapply(pp_isa,__Module),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(24,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_immediate_isa,__Class,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_subclasses_isa,__Class,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__Class,flapply(pp_isa,__Module,__File),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(26,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(tell(__File),','(FLORA_THIS_WORKSPACE(d^meth)(__Class,flapply(pp_isa,__Module),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),told)))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__Class,pp_isa,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(28,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__Mod),FLORA_THIS_WORKSPACE(d^meth)(__Class,flapply(pp_isa,__Mod),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),fllibexecute_delayed_calls([__Class,__Mod],[__Class])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_header,__X,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(30,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(atom(__X),','(!,FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'''%s''',__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_header,__X,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(32,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(is_charlist(__X),','(!,FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'"%s"',__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_header,__X,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(34,'prettyprint.flr',FLORA_THIS_MODULE_NAME),FLORA_WORKSPACE(\\io,d^tblflapply)(write,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_body_scalar,__Obj,__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(36,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(','(','(fllibsetof(__newdontcarevar9,[],[],','(fllibmodlit('d^mvd',[__Obj,__newdontcarevar9,__newdontcarevar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),fllibexecute_delayed_calls([__Module,__Obj,__newdontcarevar9,__newdontcarevar8],[])),__newvar10),=(__MethLst1,__newvar10)),','(sort(__MethLst1,__MethLst2),FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_body_scalar1,__Obj,__MethLst2,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)))),fllibexecute_delayed_calls([__MethLst1,__MethLst2,__Module,__Obj,__newdontcarevar13],[__Module,__Obj])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_body_scalar1,__newdontcarevar1,[],___Module,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(38,'prettyprint.flr',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_body_scalar1,__Obj,[__MethInv|__MethInvs],__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(40,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(','(=(__MethInv,[__M|___Args]),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_print_ignore,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(!,FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_body_scalar1,__Obj,__MethInvs,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))),fllibexecute_delayed_calls([__M,__MethInv,__MethInvs,__Module,__Obj,___Args],[__MethInv,__MethInvs,__Module,__Obj])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_body_scalar1,__Obj,[__MethInv|__MethInvs],__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(42,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmodlit('d^mvd',[__Obj,__MethInv,__Val,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(write('    '),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_method_invocation,__MethInv,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),','(write(' -> '),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_value,__Val,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_comma_maybe,__MethInvs,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)),FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_body_scalar1,__Obj,__MethInvs,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14)))))))),fllibexecute_delayed_calls([__MethInv,__MethInvs,__Module,__Obj,__Val],[__MethInv,__MethInvs,__Module,__Obj])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_body_iscalar,__Obj,__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(44,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(','(','(fllibsetof(__newdontcarevar9,[],[],','(fllibmodlit('d^imvd',[__Obj,__newdontcarevar9,__newdontcarevar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),fllibexecute_delayed_calls([__Module,__Obj,__newdontcarevar9,__newdontcarevar8],[])),__newvar10),=(__MethLst1,__newvar10)),','(sort(__MethLst1,__MethLst2),FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_body_iscalar1,__Obj,__MethLst2,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)))),fllibexecute_delayed_calls([__MethLst1,__MethLst2,__Module,__Obj,__newdontcarevar13],[__Module,__Obj])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_body_iscalar1,__newdontcarevar1,[],___Module,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(46,'prettyprint.flr',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_body_iscalar1,__Obj,[__MethInv|__MethInvs],__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(48,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(','(=(__MethInv,[__M|___Args]),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_print_ignore,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(!,FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_body_iscalar1,__Obj,__MethInvs,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))),fllibexecute_delayed_calls([__M,__MethInv,__MethInvs,__Module,__Obj,___Args],[__MethInv,__MethInvs,__Module,__Obj])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_body_iscalar1,__Obj,[__MethInv|__MethInvs],__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(50,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmodlit('d^imvd',[__Obj,__MethInv,__Val,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(write('    '),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_method_invocation,__MethInv,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),','(write(' -> '),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_value,__Val,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_comma_maybe,__MethInvs,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)),FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_body_iscalar1,__Obj,__MethInvs,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14)))))))),fllibexecute_delayed_calls([__MethInv,__MethInvs,__Module,__Obj,__Val],[__MethInv,__MethInvs,__Module,__Obj])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_body_set,__Obj,__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(52,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(','(','(fllibsetof(__newdontcarevar9,[],[],','(fllibmodlit('d^mvd',[__Obj,__newdontcarevar9,__newdontcarevar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),fllibexecute_delayed_calls([__newdontcarevar9,__Module,__Obj,__newdontcarevar8],[])),__newvar10),=(__MethLst1,__newvar10)),','(sort(__MethLst1,__MethLst2),FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_body_set1,__Obj,__MethLst2,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)))),fllibexecute_delayed_calls([__MethLst1,__MethLst2,__Module,__Obj,__newdontcarevar13],[__Module,__Obj])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_body_set1,___Obj,[],___Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(54,'prettyprint.flr',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_body_set1,__Obj,[__MethInv|__MethInvs],__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(56,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(','(=(__MethInv,[__M|___Args]),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_print_ignore,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(!,FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_body_set1,__Obj,__MethInvs,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))),fllibexecute_delayed_calls([__M,__MethInv,__MethInvs,__Module,__Obj,___Args],[__MethInv,__MethInvs,__Module,__Obj])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_body_set1,__Obj,[__MethInv|__MethInvs],__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(58,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(','(','(fllibsetof(__newdontcarevar7,[],[],','(fllibmodlit('d^mvd',[__Obj,__MethInv,__newdontcarevar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__MethInv,__Module,__Obj,__newdontcarevar7],[])),__newvar8),=(__Vals,__newvar8)),','(write('    '),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_method_invocation,__MethInv,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),','(write(' -> '),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_set,__Vals,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_comma_maybe,__MethInvs,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14)),FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_body_set1,__Obj,__MethInvs,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,__newcontextvar16)))))))),fllibexecute_delayed_calls([__MethInv,__MethInvs,__Module,__Obj,__Vals],[__MethInv,__MethInvs,__Module,__Obj])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_body_iset,__Obj,__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(60,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(','(','(fllibsetof(__newdontcarevar9,[],[],','(fllibmodlit('d^imvd',[__Obj,__newdontcarevar9,__newdontcarevar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),fllibexecute_delayed_calls([__newdontcarevar9,__Module,__Obj,__newdontcarevar8],[])),__newvar10),=(__MethLst1,__newvar10)),','(sort(__MethLst1,__MethLst2),FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_body_iset1,__Obj,__MethLst2,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)))),fllibexecute_delayed_calls([__MethLst1,__MethLst2,__Module,__Obj,__newdontcarevar13],[__Module,__Obj])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_body_iset1,___Obj,[],___Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(62,'prettyprint.flr',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_body_iset1,__Obj,[__MethInv|__MethInvs],__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(64,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(','(=(__MethInv,[__M|___Args]),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_print_ignore,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(!,FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_body_iset1,__Obj,__MethInvs,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))),fllibexecute_delayed_calls([__M,__MethInv,__MethInvs,__Module,__Obj,___Args],[__MethInv,__MethInvs,__Module,__Obj])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_body_iset1,__Obj,[__MethInv|__MethInvs],__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(66,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(','(','(fllibsetof(__newdontcarevar7,[],[],','(fllibmodlit('d^imvd',[__Obj,__MethInv,__newdontcarevar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__MethInv,__Module,__Obj,__newdontcarevar7],[])),__newvar8),=(__Vals,__newvar8)),','(write('    '),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_method_invocation,__MethInv,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),','(write(' -> '),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_set,__Vals,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_comma_maybe,__MethInvs,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14)),FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_body_iset1,__Obj,__MethInvs,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,__newcontextvar16)))))))),fllibexecute_delayed_calls([__MethInv,__MethInvs,__Module,__Obj,__Vals],[__MethInv,__MethInvs,__Module,__Obj])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_body_tran,__Obj,__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(68,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(','(','(fllibsetof(__newdontcarevar7,[],[],','(fllibmodlit('d^tran',[__Obj,__newdontcarevar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__Module,__Obj,__newdontcarevar7],[])),__newvar8),=(__MethLst1,__newvar8)),','(sort(__MethLst1,__MethLst2),FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_body_tran1,__Obj,__MethLst2,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)))),fllibexecute_delayed_calls([__MethLst1,__MethLst2,__Module,__Obj],[__Module,__Obj])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_body_tran1,___Obj,[],___Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(70,'prettyprint.flr',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_body_tran1,__Obj,[__MethInv|__MethInvs],__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(72,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(','(=(__MethInv,[__M|___Args]),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_print_ignore,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(!,FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_body_tran1,__Obj,__MethInvs,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))),fllibexecute_delayed_calls([__M,__MethInv,__MethInvs,__Module,__Obj,___Args],[__MethInv,__MethInvs,__Module,__Obj])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_body_tran1,__Obj,[__MethInv|__MethInvs],__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(74,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(write('    %'),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_method_invocation,__MethInv,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_comma_maybe,__MethInvs,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_body_tran1,__Obj,__MethInvs,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_body_bool,__Obj,__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(76,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(','(','(fllibsetof(__newdontcarevar7,[],[],','(fllibmodlit('d^meth',[__Obj,__newdontcarevar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__newdontcarevar7,__Module,__Obj],[])),__newvar8),=(__MethLst1,__newvar8)),','(sort(__MethLst1,__MethLst2),FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_body_bool1,__Obj,__MethLst2,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)))),fllibexecute_delayed_calls([__MethLst1,__MethLst2,__Module,__Obj],[__Module,__Obj])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_body_bool1,___Obj,[],___Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(78,'prettyprint.flr',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_body_bool1,__Obj,[__MethInv|__MethInvs],__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(80,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(','(=(__MethInv,[__M|___Args]),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_print_ignore,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(!,FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_body_bool1,__Obj,__MethInvs,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))),fllibexecute_delayed_calls([__M,__MethInv,__MethInvs,__Module,__Obj,___Args],[__MethInv,__MethInvs,__Module,__Obj])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_body_bool1,__Obj,[__MethInv|__MethInvs],__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(82,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(write('    '),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_method_invocation,__MethInv,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_comma_maybe,__MethInvs,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_body_bool1,__Obj,__MethInvs,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_body_ibool,__Obj,__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(84,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(','(','(fllibsetof(__newdontcarevar7,[],[],','(fllibmodlit('d^imeth',[__Obj,__newdontcarevar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__newdontcarevar7,__Module,__Obj],[])),__newvar8),=(__MethLst1,__newvar8)),','(sort(__MethLst1,__MethLst2),FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_body_ibool1,__Obj,__MethLst2,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)))),fllibexecute_delayed_calls([__MethLst1,__MethLst2,__Module,__Obj],[__Module,__Obj])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_body_ibool1,___Obj,[],___Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(86,'prettyprint.flr',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_body_ibool1,__Obj,[__MethInv|__MethInvs],__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(88,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(','(=(__MethInv,[__M|___Args]),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_print_ignore,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(!,FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_body_ibool1,__Obj,__MethInvs,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6))))),fllibexecute_delayed_calls([__M,__MethInv,__MethInvs,__Module,__Obj,___Args],[__MethInv,__MethInvs,__Module,__Obj])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_body_ibool1,__Obj,[__MethInv|__MethInvs],__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(90,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(write('    '),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_method_invocation,__MethInv,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_comma_maybe,__MethInvs,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_body_ibool1,__Obj,__MethInvs,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_comma_maybe,[],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(92,'prettyprint.flr',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_comma_maybe,[___First|___Rest],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(94,'prettyprint.flr',FLORA_THIS_MODULE_NAME),writeln(','))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_comma_conditional,__Cond,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(96,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(fllibifthen(FLORA_THIS_MODULE_NAME,fllibmodlit(libmod_wrapper,__Cond,'_invalid_flora_module_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),writeln(','),294,'prettyprint.flr'),!))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_method_invocation,__M,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(98,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmetauniv(__M,__ML),','(FLORA_THIS_WORKSPACE(d^tblflapply)(ground_list,__ML,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_WORKSPACE(\\io,d^tblflapply)(write,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__M,__ML],[__M])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_set,__L,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(100,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(write('{'),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_set1,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),write('}'))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_set1,[],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(102,'prettyprint.flr',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_set1,[__Elt],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(104,'prettyprint.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_value,__Elt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_set1,[__Elt,__Elt2|__Rest],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(106,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_value,__Elt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(write(','),FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_set1,[__Elt2|__Rest],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_value,__Val,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(108,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(atom(__Val),','(!,FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%s',__Val,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_value,__Val,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(110,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(is_charlist(__Val),','(!,FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'"%s"',__Val,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_write_value,__Val,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(112,'prettyprint.flr',FLORA_THIS_MODULE_NAME),FLORA_WORKSPACE(\\io,d^tblflapply)(write,__Val,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_immediate_isa,__Class,__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(114,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_WORKSPACE(\\sub,d^tblflapply)(immediate_isa,__X,__Class,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_value,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(write('		:  '),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_value,__Class,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),','(writeln('.'),'\\false'))))),fllibexecute_delayed_calls([__Class,__Module,__X],[__Class,__Module])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_immediate_isa,__newdontcarevar1,__newdontcarevar2,'_$ctxt'(_CallerModuleVar,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''rule_enabled'(116,'prettyprint.flr',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_subclasses_isa,__Class,__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(118,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_WORKSPACE(\\sub,d^tblflapply)(immediate_sub,__Sub,__Class,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_immediate_isa,__Sub,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_subclasses_isa,__Sub,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),'\\false'))),fllibexecute_delayed_calls([__Class,__Module,__Sub],[__Class,__Module])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_subclasses_isa,__newdontcarevar1,__newdontcarevar2,'_$ctxt'(_CallerModuleVar,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''rule_enabled'(120,'prettyprint.flr',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_immediate_classes,__Obj,__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(122,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(','(:(flora_ground,flrground(__Obj)),','(FLORA_WORKSPACE(\\sub,d^tblflapply)(immediate_isa,__Obj,__Class,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_value,__Obj,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(write('	:  '),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_value,__Class,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),','(write('.'),','(nl,'\\false'))))))),fllibexecute_delayed_calls([__Class,__Module,__Obj],[__Module,__Obj])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_immediate_classes,___Obj,___Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(124,'prettyprint.flr',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_immediate_superclasses,__Class,__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(126,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_WORKSPACE(\\sub,d^tblflapply)(immediate_sub,__Class,__Super,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_value,__Class,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(write('	:: '),','(FLORA_THIS_WORKSPACE(d^tblflapply)(flora_pp_write_value,__Super,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),','(write('.'),','(nl,'\\false')))))),fllibexecute_delayed_calls([__Class,__Module,__Super],[__Class,__Module])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(flora_pp_immediate_superclasses,__newdontcarevar1,__newdontcarevar2,'_$ctxt'(_CallerModuleVar,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''rule_enabled'(128,'prettyprint.flr',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(ground_list,[],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(130,'prettyprint.flr',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(ground_list,[__H|__T],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(132,'prettyprint.flr',FLORA_THIS_MODULE_NAME),','(';'(','(:(flrdatatype,flora_is_var_prim(__H)),','(!,=(__H,'?VAR'))),'\\true'),FLORA_THIS_WORKSPACE(d^tblflapply)(ground_list,__T,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))).

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
#define FLORA_FLS2_FILENAME  'prettyprint.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('prettyprint.ergo',FLORA_THIS_MODULE_NAME))).

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

