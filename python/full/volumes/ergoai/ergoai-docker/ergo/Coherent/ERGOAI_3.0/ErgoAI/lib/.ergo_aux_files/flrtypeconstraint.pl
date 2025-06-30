
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
#define FLORA_THIS_FILENAME  'flrtypeconstraint.ergo'
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

:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(boundViolated)),6),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(boundViolated)),6)),opaque))).
:-(FLORA_THIS_WORKSPACE(boundViolated)(_h649107,_h649109,_h649111,_h649113,_h649115,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(boundViolated))(_h649107,_h649109,_h649111,_h649113,_h649115,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(checkBounds)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(checkBounds)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(checkBounds)(_h649783,_h649785,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(checkBounds))(_h649783,_h649785,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(is_native)),2),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(is_native)),2)),opaque))).
:-(FLORA_THIS_WORKSPACE(is_native)(_h650415,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(is_native))(_h650415,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(not_complies_with_type_list)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(not_complies_with_type_list)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(not_complies_with_type_list)(_h651011,_h651013,_h651015,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(not_complies_with_type_list))(_h651011,_h651013,_h651015,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(typeCheckBoolInternal)),7),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(typeCheckBoolInternal)),7)),opaque))).
:-(FLORA_THIS_WORKSPACE(typeCheckBoolInternal)(_h651903,_h651905,_h651907,_h651909,_h651911,_h651913,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(typeCheckBoolInternal))(_h651903,_h651905,_h651907,_h651909,_h651911,_h651913,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(typeCheckInternal)),7),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(typeCheckInternal)),7)),opaque))).
:-(FLORA_THIS_WORKSPACE(typeCheckInternal)(_h652711,_h652713,_h652715,_h652717,_h652719,_h652721,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(typeCheckInternal))(_h652711,_h652713,_h652715,_h652717,_h652719,_h652721,FWContext)).
 
#if !defined(FLORA_FLM_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLM_FILENAME  'flrtypeconstraint.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(flrtypeconstraint,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'flrtypeconstraint.fld'
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
#define FLORA_FLS_FILENAME  'flrtypeconstraint.fls'
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

?-(:(flrprolog,flora_define_modular_prolog([prolog(boundViolated,5,FLORA_THIS_MODULE_NAME),prolog(not_complies_with_type_list,3,FLORA_THIS_MODULE_NAME),prolog(checkBounds,2,FLORA_THIS_MODULE_NAME)]))).
?-(:(flrprolog,flora_define_modular_prolog([prolog(is_native,1,FLORA_THIS_MODULE_NAME),prolog(typeCheckInternal,6,FLORA_THIS_MODULE_NAME),prolog(typeCheckBoolInternal,6,FLORA_THIS_MODULE_NAME)]))).
:-(fllibexport([[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar1,flapply(check,__newdontcarevar2,__newdontcarevar3),__newcontextvar6))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar7,flapply(check,__newdontcarevar8),__newcontextvar11))]])).
:-(FLORA_THIS_WORKSPACE(static^meth)('Cardinality',flapply(check,__Spec),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(4,'flrtypeconstraint.flr',FLORA_THIS_MODULE_NAME),','(','(\+(fllibuniveqform(__Spec,fllibmodlit('d^mvdsig',[__Obj,__Meth,__newdontcarevar3,'_$ctxt'(__newcontextvar4,__newcontextvar5,__newcontextvar6)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)))),','(\+(fllibuniveqform(__Spec,','(fllibmodlit('d^mvdsig',[__Obj,__Meth,__newdontcarevar9,'_$ctxt'(__newcontextvar10,__newcontextvar11,__newcontextvar12)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14)),fllibmodlit('d^mvdcon',[__Obj,__Meth,__LowBound,__HighBound,'_$ctxt'(__newcontextvar15,__newcontextvar16,__newcontextvar17)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar18,__newcontextvar19))))),','(\+(fllibuniveqform(__Spec,fllibmodlit('d^imvdsig',[__Obj,__Meth,__newdontcarevar20,'_$ctxt'(__newcontextvar21,__newcontextvar22,__newcontextvar23)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar24,__newcontextvar25)))),','(\+(fllibuniveqform(__Spec,','(fllibmodlit('d^imvdsig',[__Obj,__Meth,__newdontcarevar26,'_$ctxt'(__newcontextvar27,__newcontextvar28,__newcontextvar29)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar30,__newcontextvar31)),fllibmodlit('d^imvdcon',[__Obj,__Meth,__LowBound,__HighBound,'_$ctxt'(__newcontextvar32,__newcontextvar33,__newcontextvar34)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar35,__newcontextvar36))))),','(:(flrdecode,flora_decode_goal_as_atom(__Spec,__AtmString)),FLORA_WORKSPACE(\\system,d^tblflapply)(abort,['Cardinality[check(',__AtmString,')]@\\typecheck: Invalid signature argument'],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar37,__newcontextvar38))))))),fllibexecute_delayed_calls([__AtmString,__HighBound,__LowBound,__Meth,__Mod,__Obj,__Spec,__newdontcarevar39],[__Spec])))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Cardinality',flapply(check,__Spec),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(6,'flrtypeconstraint.flr',FLORA_THIS_MODULE_NAME),','(','(';'(fllibuniveqform(__Spec,fllibmodlit('d^mvdsig',[__Obj,__Meth,__newdontcarevar3,'_$ctxt'(__newcontextvar4,__newcontextvar5,__newcontextvar6)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))),fllibuniveqform(__Spec,','(fllibmodlit('d^mvdsig',[__Obj,__Meth,__newdontcarevar9,'_$ctxt'(__newcontextvar10,__newcontextvar11,__newcontextvar12)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14)),fllibmodlit('d^mvdcon',[__Obj,__Meth,__LowBound,__HighBound,'_$ctxt'(__newcontextvar15,__newcontextvar16,__newcontextvar17)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar18,__newcontextvar19))))),','(fllibifthenelse(FLORA_THIS_MODULE_NAME,==(__Mod,'\\typecheck'),'_$_$_ergo''silent_equal'(_CallerModuleVar,__RealMod),=(__RealMod,__Mod),65,'flrtypeconstraint.flr'),','(FLORA_THIS_WORKSPACE(checkBounds)(__LowBound,__HighBound,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar20,__newcontextvar21)),','(','(fllibmodobj(body,objeql,[__newdontcarevar22,__newdontcarevar23,'_$ctxt'(__newcontextvar24,__newcontextvar25,__newcontextvar26)],__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar27,__newcontextvar28),__newvar29),:(flrauxil,generalize_method_eq(__Meth,__GenMeth,__MArgs,__GMArgs,__newvar29))),','(','(fllibmodlit('d^mvdsig',[__Obj,__GenMeth,__newdontcarevar30,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar31,__newcontextvar32)],__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar33,__newcontextvar34)),fllibmodlit('d^mvdcon',[__Obj,__GenMeth,__Low,__High,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar35,__newcontextvar36)],__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar37,__newcontextvar38))),','(','(','(fllibmodobj(body,'d^isa',[__newdontcarevar39,__newdontcarevar40,'_$ctxt'(__newcontextvar41,__newcontextvar42,__newcontextvar43)],__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar44,__newcontextvar45),__newvar46),fllibmodobj(body,objeql,[__newdontcarevar47,__newdontcarevar48,'_$ctxt'(__newcontextvar49,__newcontextvar50,__newcontextvar51)],__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar52,__newcontextvar53),__newvar54)),:(flrauxil,list_isa_eq(__MArgs,__GMArgs,__newvar46,__newvar54))),','(';'(','(fllibmodobj(body,'d^mvd',[__newdontcarevar55,__Meth,__newdontcarevar56,'_$ctxt'(__newcontextvar57,__newcontextvar58,__newcontextvar59)],__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar60,__newcontextvar61),__newvar62),FLORA_THIS_WORKSPACE(is_native)(__newvar62,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar63,__newcontextvar64))),','(fllibmodobj(body,'d^mvddef',[__newdontcarevar65,__Meth,'_$ctxt'(__newcontextvar66,__newcontextvar67,__newcontextvar68)],__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar69,__newcontextvar70),__newvar71),FLORA_THIS_WORKSPACE(is_native)(__newvar71,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar72,__newcontextvar73)))),','(','(fllibcount(__newdontcarevar78,[],[],','(fllibmodlit('d^mvd',[__Obj,__Meth,__newdontcarevar78,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar74,__newcontextvar75)],__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar76,__newcontextvar77)),fllibexecute_delayed_calls([__Meth,__Obj,__RealMod,__newdontcarevar78],[])),__newvar79),=(__Count,__newvar79)),','(';'(fllibdelayedliteral(<,'flrtypeconstraint.flr',81,[__Count,__Low]),@>(__Count,__High)),FLORA_THIS_WORKSPACE(boundViolated)(__Count,__Low,__High,__LowBound,__HighBound,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar80,__newcontextvar81))))))))))),fllibexecute_delayed_calls([__Count,__GMArgs,__GenMeth,__High,__HighBound,__Low,__LowBound,__MArgs,__Meth,__Mod,__Obj,__RealMod,__Spec,__newdontcarevar82],[__Spec])))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Cardinality',flapply(check,__Spec),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(8,'flrtypeconstraint.flr',FLORA_THIS_MODULE_NAME),','(','(';'(fllibuniveqform(__Spec,fllibmodlit('d^imvdsig',[__Obj,__Meth,__newdontcarevar3,'_$ctxt'(__newcontextvar4,__newcontextvar5,__newcontextvar6)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))),fllibuniveqform(__Spec,','(fllibmodlit('d^imvdsig',[__Obj,__Meth,__newdontcarevar9,'_$ctxt'(__newcontextvar10,__newcontextvar11,__newcontextvar12)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14)),fllibmodlit('d^imvdcon',[__Obj,__Meth,__LowBound,__HighBound,'_$ctxt'(__newcontextvar15,__newcontextvar16,__newcontextvar17)],__Mod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar18,__newcontextvar19))))),','(fllibifthenelse(FLORA_THIS_MODULE_NAME,==(__Mod,'\\typecheck'),'_$_$_ergo''silent_equal'(_CallerModuleVar,__RealMod),=(__RealMod,__Mod),90,'flrtypeconstraint.flr'),','(FLORA_THIS_WORKSPACE(checkBounds)(__LowBound,__HighBound,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar20,__newcontextvar21)),','(','(fllibmodobj(body,objeql,[__newdontcarevar22,__newdontcarevar23,'_$ctxt'(__newcontextvar24,__newcontextvar25,__newcontextvar26)],__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar27,__newcontextvar28),__newvar29),:(flrauxil,generalize_method_eq(__Meth,__GenMeth,__MArgs,__GMArgs,__newvar29))),','(','(fllibmodlit('d^imvdsig',[__Obj,__GenMeth,__newdontcarevar30,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar31,__newcontextvar32)],__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar33,__newcontextvar34)),fllibmodlit('d^imvdcon',[__Obj,__GenMeth,__Low,__High,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar35,__newcontextvar36)],__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar37,__newcontextvar38))),','(','(','(fllibmodobj(body,'d^isa',[__newdontcarevar39,__newdontcarevar40,'_$ctxt'(__newcontextvar41,__newcontextvar42,__newcontextvar43)],__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar44,__newcontextvar45),__newvar46),fllibmodobj(body,objeql,[__newdontcarevar47,__newdontcarevar48,'_$ctxt'(__newcontextvar49,__newcontextvar50,__newcontextvar51)],__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar52,__newcontextvar53),__newvar54)),:(flrauxil,list_isa_eq(__MArgs,__GMArgs,__newvar46,__newvar54))),','(';'(','(fllibmodobj(body,'d^imvd',[__newdontcarevar55,__Meth,__newdontcarevar56,'_$ctxt'(__newcontextvar57,__newcontextvar58,__newcontextvar59)],__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar60,__newcontextvar61),__newvar62),FLORA_THIS_WORKSPACE(is_native)(__newvar62,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar63,__newcontextvar64))),','(fllibmodobj(body,'d^imvddef',[__newdontcarevar65,__Meth,'_$ctxt'(__newcontextvar66,__newcontextvar67,__newcontextvar68)],__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar69,__newcontextvar70),__newvar71),FLORA_THIS_WORKSPACE(is_native)(__newvar71,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar72,__newcontextvar73)))),','(','(fllibcount(__newdontcarevar78,[],[],','(fllibmodlit('d^imvd',[__Obj,__Meth,__newdontcarevar78,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar74,__newcontextvar75)],__RealMod,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar76,__newcontextvar77)),fllibexecute_delayed_calls([__Meth,__Obj,__RealMod,__newdontcarevar78],[])),__newvar79),=(__Count,__newvar79)),','(';'(fllibdelayedliteral(<,'flrtypeconstraint.flr',106,[__Count,__Low]),@>(__Count,__High)),FLORA_THIS_WORKSPACE(boundViolated)(__Count,__Low,__High,__LowBound,__HighBound,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar80,__newcontextvar81))))))))))),fllibexecute_delayed_calls([__Count,__GMArgs,__GenMeth,__High,__HighBound,__Low,__LowBound,__MArgs,__Meth,__Mod,__Obj,__RealMod,__Spec,__newdontcarevar82],[__Spec])))).
:-(FLORA_THIS_WORKSPACE(checkBounds)(__LowBound,__HighBound,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(10,'flrtypeconstraint.flr',FLORA_THIS_MODULE_NAME),','(fllibifthen(FLORA_THIS_MODULE_NAME,==(__HighBound,__LowBound),FLORA_WORKSPACE(\\system,d^tblflapply)(abort,'Error in Cardinality[check(?[?Method {?Low..?High} => ?])]@\\typecheck: Low and high bounds must be different','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),120,'flrtypeconstraint.flr'),','(fllibifthen(FLORA_THIS_MODULE_NAME,:(flrdatatype,flora_is_nonvar_prim(__LowBound)),FLORA_WORKSPACE(\\system,d^tblflapply)(abort,'Error in Cardinality[check(?[?Method {?Low..?High} => ?])]@\\typecheck: ?Low must be an unbound variable','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),122,'flrtypeconstraint.flr'),fllibifthen(FLORA_THIS_MODULE_NAME,:(flrdatatype,flora_is_nonvar_prim(__HighBound)),FLORA_WORKSPACE(\\system,d^tblflapply)(abort,'Error in Cardinality[check(?[?Method {?Low..?High} => ?])]@\\typecheck: ?High must be an unbound variable','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),124,'flrtypeconstraint.flr'))))).
:-(FLORA_THIS_WORKSPACE(boundViolated)(__Count,__Low,__High,__LowBound,__HighBound,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(12,'flrtypeconstraint.flr',FLORA_THIS_MODULE_NAME),','(fllibifthenelse(FLORA_THIS_MODULE_NAME,fllibdelayedliteral(<,'flrtypeconstraint.flr',135,[__Count,__Low]),=(__LowBound,__Low),=(__LowBound,ok),135,'flrtypeconstraint.flr'),fllibifthenelse(FLORA_THIS_MODULE_NAME,@>(__Count,__High),=(__HighBound,__High),=(__HighBound,ok),139,'flrtypeconstraint.flr')))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Type',flapply(check,__Spec,__Result),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(14,'flrtypeconstraint.flr',FLORA_THIS_MODULE_NAME),','(','('_$_$_ergo''silent_equal'(_CallerModuleVar,__CallerMod),','(FLORA_WORKSPACE(\\system,d^meth)('Method',flapply(mustDefine,flapply(__Stat,__CallerMod)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_WORKSPACE(\\system,d^meth)('Method',flapply(mustDefine,flapply(off,__CallerMod)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(','(fllibsetof(__newdontcarevar9,[],[],','(fllibtruthvalue(true,FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^meth)('Type',flapply(check,__Spec,__CallerMod,__newdontcarevar9),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))),fllibexecute_delayed_calls([__CallerMod,__newdontcarevar9,__Spec],[])),__newvar10),=(__Result,__newvar10)),FLORA_WORKSPACE(\\system,d^meth)('Method',flapply(mustDefine,flapply(__Stat,__CallerMod)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)))))),fllibexecute_delayed_calls([__CallerMod,__Result,__Spec,__Stat],[__Result,__Spec])))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Type',flapply(check,__Spec,__CallerMod,__Result),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(16,'flrtypeconstraint.flr',FLORA_THIS_MODULE_NAME),','(','(fllibuniveqform(__Spec,fllibmodlit('d^mvd',[__Class,__Meth,__newdontcarevar3,'_$ctxt'(__newcontextvar4,__newcontextvar5,__newcontextvar6)],__newdontcarevar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9))),','(:(flrregistry,flora_user_module_registry(__CallerMod)),','(!,FLORA_THIS_WORKSPACE(typeCheckInternal)(__newdontcarevar10,__newdontcarevar11,__Class,__Meth,__CallerMod,__Result,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar13))))),fllibexecute_delayed_calls([__CallerMod,__Class,__Meth,__Result,__Spec,__newdontcarevar14],[__CallerMod,__Result,__Spec])))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Type',flapply(check,__Spec,__CallerMod,__Result),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(18,'flrtypeconstraint.flr',FLORA_THIS_MODULE_NAME),','(','(fllibuniveqform(__Spec,fllibmodlit('d^imvd',[__Class,__Meth,__newdontcarevar3,'_$ctxt'(__newcontextvar4,__newcontextvar5,__newcontextvar6)],__newdontcarevar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9))),','(:(flrregistry,flora_user_module_registry(__CallerMod)),','(!,FLORA_THIS_WORKSPACE(typeCheckInternal)(defaultonly,__newdontcarevar10,__Class,__Meth,__CallerMod,__Result,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12))))),fllibexecute_delayed_calls([__CallerMod,__Class,__Meth,__Result,__Spec,__newdontcarevar13],[__CallerMod,__Result,__Spec])))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Type',flapply(check,__Spec,__CallerMod,__Result),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(20,'flrtypeconstraint.flr',FLORA_THIS_MODULE_NAME),','(','(fllibuniveqform(__Spec,fllibmodlit('d^mvdsig',[__Class,__Meth,__newdontcarevar3,'_$ctxt'(__newcontextvar4,__newcontextvar5,__newcontextvar6)],__newdontcarevar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9))),','(:(flrregistry,flora_user_module_registry(__CallerMod)),','(!,FLORA_THIS_WORKSPACE(typeCheckInternal)(__newdontcarevar10,nonstrict,__Class,__Meth,__CallerMod,__Result,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12))))),fllibexecute_delayed_calls([__CallerMod,__Class,__Meth,__Result,__Spec,__newdontcarevar13],[__CallerMod,__Result,__Spec])))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Type',flapply(check,__Spec,__CallerMod,__Result),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(22,'flrtypeconstraint.flr',FLORA_THIS_MODULE_NAME),','(','(fllibuniveqform(__Spec,fllibmodlit('d^imvdsig',[__Class,__Meth,__newdontcarevar3,'_$ctxt'(__newcontextvar4,__newcontextvar5,__newcontextvar6)],__newdontcarevar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9))),','(:(flrregistry,flora_user_module_registry(__CallerMod)),','(!,FLORA_THIS_WORKSPACE(typeCheckInternal)(defaultonly,nonstrict,__Class,__Meth,__CallerMod,__Result,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11))))),fllibexecute_delayed_calls([__CallerMod,__Class,__Meth,__Result,__Spec,__newdontcarevar12],[__CallerMod,__Result,__Spec])))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Type',flapply(check,__Spec,__CallerMod,__Result),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(24,'flrtypeconstraint.flr',FLORA_THIS_MODULE_NAME),','(','(fllibuniveqform(__Spec,fllibmodlit('d^meth',[__Class,__Meth,'_$ctxt'(__newcontextvar3,__newcontextvar4,__newcontextvar5)],__newdontcarevar6,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))),','(:(flrregistry,flora_user_module_registry(__CallerMod)),','(!,FLORA_THIS_WORKSPACE(typeCheckBoolInternal)(__newdontcarevar9,__newdontcarevar10,__Class,__Meth,__CallerMod,__Result,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12))))),fllibexecute_delayed_calls([__CallerMod,__Class,__Meth,__Result,__Spec,__newdontcarevar13],[__CallerMod,__Result,__Spec])))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Type',flapply(check,__Spec,__CallerMod,__Result),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(26,'flrtypeconstraint.flr',FLORA_THIS_MODULE_NAME),','(','(fllibuniveqform(__Spec,fllibmodlit('d^imeth',[__Class,__Meth,'_$ctxt'(__newcontextvar3,__newcontextvar4,__newcontextvar5)],__newdontcarevar6,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))),','(:(flrregistry,flora_user_module_registry(__CallerMod)),','(!,FLORA_THIS_WORKSPACE(typeCheckBoolInternal)(defaultonly,__newdontcarevar9,__Class,__Meth,__CallerMod,__Result,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11))))),fllibexecute_delayed_calls([__CallerMod,__Class,__Meth,__Result,__Spec,__newdontcarevar12],[__CallerMod,__Result,__Spec])))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Type',flapply(check,__Spec,__CallerMod,__Result),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(28,'flrtypeconstraint.flr',FLORA_THIS_MODULE_NAME),','(','(fllibuniveqform(__Spec,fllibmodlit('d^boolsig',[__Class,__Meth,'_$ctxt'(__newcontextvar3,__newcontextvar4,__newcontextvar5)],__newdontcarevar6,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))),','(:(flrregistry,flora_user_module_registry(__CallerMod)),','(!,FLORA_THIS_WORKSPACE(typeCheckBoolInternal)(__newdontcarevar9,nonstrict,__Class,__Meth,__CallerMod,__Result,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11))))),fllibexecute_delayed_calls([__CallerMod,__Class,__Meth,__Result,__Spec,__newdontcarevar12],[__CallerMod,__Result,__Spec])))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Type',flapply(check,__Spec,__CallerMod,__Result),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(30,'flrtypeconstraint.flr',FLORA_THIS_MODULE_NAME),','(','(fllibuniveqform(__Spec,fllibmodlit('d^iboolsig',[__Class,__Meth,'_$ctxt'(__newcontextvar3,__newcontextvar4,__newcontextvar5)],__newdontcarevar6,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))),','(:(flrregistry,flora_user_module_registry(__CallerMod)),','(!,FLORA_THIS_WORKSPACE(typeCheckBoolInternal)(defaultonly,nonstrict,__Class,__Meth,__CallerMod,__Result,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10))))),fllibexecute_delayed_calls([__CallerMod,__Class,__Meth,__Result,__Spec,__newdontcarevar11],[__CallerMod,__Result,__Spec])))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Type',flapply(check,__Spec,___Mod,___Result),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(32,'flrtypeconstraint.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrdecode,flora_decode_goal_as_atom(__Spec,__AtmString)),FLORA_WORKSPACE(\\system,d^tblflapply)(abort,['Type[check(',__AtmString,',?Result',')]@\\typecheck: Invalid first argument'],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))),fllibexecute_delayed_calls([__AtmString,__Spec],[__Spec,___Mod,___Result])))).
:-(FLORA_THIS_WORKSPACE(typeCheckInternal)(allsigns,__newdontcarevar1,__Class,__Method,__Module,__Result,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(34,'flrtypeconstraint.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrregistry,flora_user_module_registry(__Module)),','(';'(','(fllibmodobj(body,'d^mvd',[__newdontcarevar4,__Method,__newdontcarevar5,'_$ctxt'(__newcontextvar6,__newcontextvar7,__newcontextvar8)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10),__newvar11),FLORA_THIS_WORKSPACE(is_native)(__newvar11,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar13))),','(fllibmodobj(body,'d^imvd',[__newdontcarevar14,__Method,__newdontcarevar15,'_$ctxt'(__newcontextvar16,__newcontextvar17,__newcontextvar18)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar19,__newcontextvar20),__newvar21),FLORA_THIS_WORKSPACE(is_native)(__newvar21,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar22,__newcontextvar23)))),','(','(fllibmodlit('d^mvd',[__O,__Method,__Val,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar24,__newcontextvar25)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar26,__newcontextvar27)),fllibmodlit('d^mvdsig',[__O,__Method,__Type,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar28,__newcontextvar29)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar30,__newcontextvar31))),','(fllibifthen(FLORA_THIS_MODULE_NAME,:(flrdatatype,flora_is_nonvar_prim(__Class)),fllibmodlit('d^isa',[__O,__Class,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar32,__newcontextvar33)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar34,__newcontextvar35)),231,'flrtypeconstraint.flr'),','(','(fllibmodobj(body,'d^isa',[__Val,__Type,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar36,__newcontextvar37)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar38,__newcontextvar39),__newvar40),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__newvar40,fllibexecute_delayed_calls([__Module,__Type,__Val],[]))),[__Val,__Type,__Module],232,'flrtypeconstraint.flr'))),fllibuniveqform(__Result,','(fllibmodlit('d^mvd',[__O,__Method,__Val,'_$ctxt'(__newcontextvar41,__newcontextvar42,__newcontextvar43)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar44,__newcontextvar45)),fllibmodlit('d^mvdsig',[__O,__Method,__Type,'_$ctxt'(__newcontextvar46,__newcontextvar47,__newcontextvar48)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar49,__newcontextvar50))))))))),fllibexecute_delayed_calls([__Class,__Method,__Module,__O,__Result,__Type,__Val,__newdontcarevar51],[__Class,__Method,__Module,__Result,__newdontcarevar52])))).
:-(FLORA_THIS_WORKSPACE(typeCheckInternal)(allsigns,strict,__Class,__Method,__Module,__Result,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(36,'flrtypeconstraint.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrregistry,flora_user_module_registry(__Module)),','(';'(','(fllibmodobj(body,'d^mvd',[__newdontcarevar3,__Method,__newdontcarevar4,'_$ctxt'(__newcontextvar5,__newcontextvar6,__newcontextvar7)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9),__newvar10),FLORA_THIS_WORKSPACE(is_native)(__newvar10,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12))),';'(','(fllibmodobj(body,'d^mvddef',[__newdontcarevar13,__Method,'_$ctxt'(__newcontextvar14,__newcontextvar15,__newcontextvar16)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar17,__newcontextvar18),__newvar19),FLORA_THIS_WORKSPACE(is_native)(__newvar19,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar20,__newcontextvar21))),','(fllibmodobj(body,'d^imvd',[__newdontcarevar22,__Method,__newdontcarevar23,'_$ctxt'(__newcontextvar24,__newcontextvar25,__newcontextvar26)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar27,__newcontextvar28),__newvar29),FLORA_THIS_WORKSPACE(is_native)(__newvar29,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar30,__newcontextvar31))))),','(','(';'(','(fllibmodlit('d^mvd',[__O,__Method,__Val,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar32,__newcontextvar33)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar34,__newcontextvar35)),fllibuniveqform(__Result,fllibmodlit('d^mvd',[__O,__Method,__Val,'_$ctxt'(__newcontextvar36,__newcontextvar37,__newcontextvar38)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar39,__newcontextvar40)))),','(fllibmodlit('d^mvddef',[__O,__Method,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar41,__newcontextvar42)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar43,__newcontextvar44)),fllibuniveqform(__Result,fllibmodlit('d^mvddef',[__O,__Method,'_$ctxt'(__newcontextvar45,__newcontextvar46,__newcontextvar47)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar48,__newcontextvar49))))),','(fllibmodobj(body,'d^mvdsig',[__O,__Method,__newdontcarevar50,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar51,__newcontextvar52)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar53,__newcontextvar54),__newvar55),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__newvar55,fllibexecute_delayed_calls([__Method,__Module,__O],[]))),[__O,__Method,__Module],247,'flrtypeconstraint.flr')))),','(fllibifthen(FLORA_THIS_MODULE_NAME,:(flrdatatype,flora_is_nonvar_prim(__Class)),fllibmodlit('d^isa',[__O,__Class,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar56,__newcontextvar57)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar58,__newcontextvar59)),248,'flrtypeconstraint.flr'),fllibuniveqform(__Result,fllibmodlit('d^mvd',[__O,__Method,__Val,'_$ctxt'(__newcontextvar60,__newcontextvar61,__newcontextvar62)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar63,__newcontextvar64))))))),fllibexecute_delayed_calls([__Class,__Method,__Module,__O,__Result,__Val,__newdontcarevar65],[__Class,__Method,__Module,__Result])))).
:-(FLORA_THIS_WORKSPACE(typeCheckInternal)(__newdontcarevar1,__newdontcarevar2,__Class,__Method,__Module,__Result,'_$ctxt'(_CallerModuleVar,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''rule_enabled'(38,'flrtypeconstraint.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrregistry,flora_user_module_registry(__Module)),','(','(fllibmodobj(body,'d^imvd',[__newdontcarevar5,__Method,__newdontcarevar6,'_$ctxt'(__newcontextvar7,__newcontextvar8,__newcontextvar9)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11),__newvar12),FLORA_THIS_WORKSPACE(is_native)(__newvar12,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14))),','(','(fllibmodlit('d^imvd',[__O,__Method,__Val,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,__newcontextvar16)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar17,__newcontextvar18)),fllibmodlit('d^imvdsig',[__O,__Method,__Type,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar19,__newcontextvar20)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar21,__newcontextvar22))),','(fllibifthen(FLORA_THIS_MODULE_NAME,:(flrdatatype,flora_is_nonvar_prim(__Class)),fllibmodlit('d^isa',[__O,__Class,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar23,__newcontextvar24)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar25,__newcontextvar26)),256,'flrtypeconstraint.flr'),','(','(fllibmodobj(body,'d^isa',[__Val,__Type,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar27,__newcontextvar28)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar29,__newcontextvar30),__newvar31),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__newvar31,fllibexecute_delayed_calls([__Module,__Type,__Val],[]))),[__Val,__Type,__Module],257,'flrtypeconstraint.flr'))),fllibuniveqform(__Result,','(fllibmodlit('d^imvd',[__O,__Method,__Val,'_$ctxt'(__newcontextvar32,__newcontextvar33,__newcontextvar34)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar35,__newcontextvar36)),fllibmodlit('d^imvdsig',[__O,__Method,__Type,'_$ctxt'(__newcontextvar37,__newcontextvar38,__newcontextvar39)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar40,__newcontextvar41))))))))),fllibexecute_delayed_calls([__Class,__Method,__Module,__O,__Result,__Type,__Val,__newdontcarevar42],[__Class,__Method,__Module,__Result,__newdontcarevar43])))).
:-(FLORA_THIS_WORKSPACE(typeCheckInternal)(__newdontcarevar1,strict,__Class,__Method,__Module,__Result,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(40,'flrtypeconstraint.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrregistry,flora_user_module_registry(__Module)),','(';'(','(fllibmodobj(body,'d^imvd',[__newdontcarevar4,__Method,__newdontcarevar5,'_$ctxt'(__newcontextvar6,__newcontextvar7,__newcontextvar8)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10),__newvar11),FLORA_THIS_WORKSPACE(is_native)(__newvar11,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar13))),','(fllibmodobj(body,'d^imvddef',[__newdontcarevar14,__Method,'_$ctxt'(__newcontextvar15,__newcontextvar16,__newcontextvar17)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar18,__newcontextvar19),__newvar20),FLORA_THIS_WORKSPACE(is_native)(__newvar20,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar21,__newcontextvar22)))),','(','(';'(','(fllibmodlit('d^imvd',[__O,__Method,__Val,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar23,__newcontextvar24)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar25,__newcontextvar26)),fllibuniveqform(__Result,fllibmodlit('d^imvd',[__O,__Method,__Val,'_$ctxt'(__newcontextvar27,__newcontextvar28,__newcontextvar29)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar30,__newcontextvar31)))),','(fllibmodlit('d^imvddef',[__O,__Method,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar32,__newcontextvar33)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar34,__newcontextvar35)),fllibuniveqform(__Result,fllibmodlit('d^imvddef',[__O,__Method,'_$ctxt'(__newcontextvar36,__newcontextvar37,__newcontextvar38)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar39,__newcontextvar40))))),','(fllibmodobj(body,'d^imvdsig',[__O,__Method,__newdontcarevar41,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar42,__newcontextvar43)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar44,__newcontextvar45),__newvar46),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__newvar46,fllibexecute_delayed_calls([__Method,__Module,__O],[]))),[__O,__Method,__Module],271,'flrtypeconstraint.flr')))),fllibifthen(FLORA_THIS_MODULE_NAME,:(flrdatatype,flora_is_nonvar_prim(__Class)),fllibmodlit('d^isa',[__O,__Class,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar47,__newcontextvar48)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar49,__newcontextvar50)),272,'flrtypeconstraint.flr')))),fllibexecute_delayed_calls([__Class,__Method,__Module,__O,__Result,__Val,__newdontcarevar51],[__Class,__Method,__Module,__Result,__newdontcarevar52])))).
:-(FLORA_THIS_WORKSPACE(typeCheckBoolInternal)(allsigns,__newdontcarevar1,__Class,__Method,__Module,__Result,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(42,'flrtypeconstraint.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrregistry,flora_user_module_registry(__Module)),','(';'(','(fllibmodobj(body,'d^meth',[__newdontcarevar4,__Method,'_$ctxt'(__newcontextvar5,__newcontextvar6,__newcontextvar7)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9),__newvar10),FLORA_THIS_WORKSPACE(is_native)(__newvar10,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12))),','(fllibmodobj(body,'d^imeth',[__newdontcarevar13,__Method,'_$ctxt'(__newcontextvar14,__newcontextvar15,__newcontextvar16)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar17,__newcontextvar18),__newvar19),FLORA_THIS_WORKSPACE(is_native)(__newvar19,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar20,__newcontextvar21)))),','(fllibmodlit('d^meth',[__O,__Method,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar22,__newcontextvar23)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar24,__newcontextvar25)),','(:(flrauxil,generalize_method(__Method,__MethodType,__MethArgs,__Types)),','(fllibmodlit('d^boolsig',[__O,__MethodType,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar26,__newcontextvar27)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar28,__newcontextvar29)),','(fllibifthen(FLORA_THIS_MODULE_NAME,:(flrdatatype,flora_is_nonvar_prim(__Class)),fllibmodlit('d^isa',[__O,__Class,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar30,__newcontextvar31)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar32,__newcontextvar33)),286,'flrtypeconstraint.flr'),','(FLORA_THIS_WORKSPACE(not_complies_with_type_list)(__MethArgs,__Types,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar34,__newcontextvar35)),fllibuniveqform(__Result,','(fllibmodlit('d^meth',[__O,__Method,'_$ctxt'(__newcontextvar36,__newcontextvar37,__newcontextvar38)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar39,__newcontextvar40)),fllibmodlit('d^boolsig',[__O,__MethodType,'_$ctxt'(__newcontextvar41,__newcontextvar42,__newcontextvar43)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar44,__newcontextvar45))))))))))),fllibexecute_delayed_calls([__Class,__MethArgs,__Method,__MethodType,__Module,__O,__Result,__Types,__newdontcarevar46],[__Class,__Method,__Module,__Result,__newdontcarevar47])))).
:-(FLORA_THIS_WORKSPACE(typeCheckBoolInternal)(allsigns,strict,__Class,__Method,__Module,__Result,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(44,'flrtypeconstraint.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrregistry,flora_user_module_registry(__Module)),','(';'(','(fllibmodobj(body,'d^meth',[__newdontcarevar3,__Method,'_$ctxt'(__newcontextvar4,__newcontextvar5,__newcontextvar6)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8),__newvar9),FLORA_THIS_WORKSPACE(is_native)(__newvar9,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11))),','(fllibmodobj(body,'d^imeth',[__newdontcarevar12,__Method,'_$ctxt'(__newcontextvar13,__newcontextvar14,__newcontextvar15)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar16,__newcontextvar17),__newvar18),FLORA_THIS_WORKSPACE(is_native)(__newvar18,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar19,__newcontextvar20)))),','(fllibmodlit('d^meth',[__O,__Method,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar21,__newcontextvar22)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar23,__newcontextvar24)),','(:(flrauxil,generalize_method(__Method,__MethodType,__newdontcarevar25,__newdontcarevar26)),','(','(fllibmodobj(body,'d^boolsig',[__O,__MethodType,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar27,__newcontextvar28)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar29,__newcontextvar30),__newvar31),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__newvar31,fllibexecute_delayed_calls([__MethodType,__Module,__O],[]))),[__O,__MethodType,__Module],298,'flrtypeconstraint.flr'))),','(fllibifthen(FLORA_THIS_MODULE_NAME,:(flrdatatype,flora_is_nonvar_prim(__Class)),fllibmodlit('d^isa',[__O,__Class,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar32,__newcontextvar33)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar34,__newcontextvar35)),299,'flrtypeconstraint.flr'),fllibuniveqform(__Result,fllibmodlit('d^meth',[__O,__Method,'_$ctxt'(__newcontextvar36,__newcontextvar37,__newcontextvar38)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar39,__newcontextvar40))))))))),fllibexecute_delayed_calls([__Class,__Method,__MethodType,__Module,__O,__Result,__newdontcarevar41],[__Class,__Method,__Module,__Result])))).
:-(FLORA_THIS_WORKSPACE(typeCheckBoolInternal)(__newdontcarevar1,__newdontcarevar2,__Class,__Method,__Module,__Result,'_$ctxt'(_CallerModuleVar,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''rule_enabled'(46,'flrtypeconstraint.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrregistry,flora_user_module_registry(__Module)),','(','(fllibmodobj(body,'d^imeth',[__newdontcarevar5,__Method,'_$ctxt'(__newcontextvar6,__newcontextvar7,__newcontextvar8)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10),__newvar11),FLORA_THIS_WORKSPACE(is_native)(__newvar11,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar13))),','(fllibmodlit('d^imeth',[__O,__Method,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar14,__newcontextvar15)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar16,__newcontextvar17)),','(:(flrauxil,generalize_method(__Method,__MethodType,__MethArgs,__Types)),','(fllibmodlit('d^iboolsig',[__O,__MethodType,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar18,__newcontextvar19)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar20,__newcontextvar21)),','(fllibifthen(FLORA_THIS_MODULE_NAME,:(flrdatatype,flora_is_nonvar_prim(__Class)),fllibmodlit('d^isa',[__O,__Class,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar22,__newcontextvar23)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar24,__newcontextvar25)),309,'flrtypeconstraint.flr'),','(FLORA_THIS_WORKSPACE(not_complies_with_type_list)(__MethArgs,__Types,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar26,__newcontextvar27)),fllibuniveqform(__Result,','(fllibmodlit('d^imeth',[__O,__Method,'_$ctxt'(__newcontextvar28,__newcontextvar29,__newcontextvar30)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar31,__newcontextvar32)),fllibmodlit('d^iboolsig',[__O,__MethodType,'_$ctxt'(__newcontextvar33,__newcontextvar34,__newcontextvar35)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar36,__newcontextvar37))))))))))),fllibexecute_delayed_calls([__Class,__MethArgs,__Method,__MethodType,__Module,__O,__Result,__Types,__newdontcarevar38],[__Class,__Method,__Module,__Result,__newdontcarevar39])))).
:-(FLORA_THIS_WORKSPACE(typeCheckBoolInternal)(__newdontcarevar1,strict,__Class,__Method,__Module,__Result,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(48,'flrtypeconstraint.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrregistry,flora_user_module_registry(__Module)),','(','(fllibmodobj(body,'d^imeth',[__newdontcarevar4,__Method,'_$ctxt'(__newcontextvar5,__newcontextvar6,__newcontextvar7)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9),__newvar10),FLORA_THIS_WORKSPACE(is_native)(__newvar10,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12))),','(fllibmodlit('d^imeth',[__O,__Method,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,__newcontextvar16)),','(:(flrauxil,generalize_method(__Method,__MethodType,__newdontcarevar17,__newdontcarevar18)),','(','(fllibmodobj(body,'d^iboolsig',[__O,__MethodType,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar19,__newcontextvar20)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar21,__newcontextvar22),__newvar23),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__newvar23,fllibexecute_delayed_calls([__MethodType,__Module,__O],[]))),[__O,__MethodType,__Module],319,'flrtypeconstraint.flr'))),','(fllibifthen(FLORA_THIS_MODULE_NAME,:(flrdatatype,flora_is_nonvar_prim(__Class)),fllibmodlit('d^isa',[__O,__Class,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar24,__newcontextvar25)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar26,__newcontextvar27)),320,'flrtypeconstraint.flr'),fllibuniveqform(__Result,fllibmodlit('d^imeth',[__O,__Method,'_$ctxt'(__newcontextvar28,__newcontextvar29,__newcontextvar30)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar31,__newcontextvar32))))))))),fllibexecute_delayed_calls([__Class,__Method,__MethodType,__Module,__O,__Result,__newdontcarevar33],[__Class,__Method,__Module,__Result,__newdontcarevar34])))).
:-(FLORA_THIS_WORKSPACE(not_complies_with_type_list)([],[],__newdontcarevar1,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(50,'flrtypeconstraint.flr',FLORA_THIS_MODULE_NAME),','(!,'\\false'))).
:-(FLORA_THIS_WORKSPACE(not_complies_with_type_list)([__Arg|__newdontcarevar1],[__Type|__newdontcarevar2],__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''rule_enabled'(52,'flrtypeconstraint.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmodobj(body,'d^isa',[__Arg,__Type,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8),__newvar9),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(__newvar9,fllibexecute_delayed_calls([__Arg,__Module,__Type],[]))),[__Arg,__Type,__Module],329,'flrtypeconstraint.flr'))),!))).
:-(FLORA_THIS_WORKSPACE(not_complies_with_type_list)([__Arg|__ArgList],[__Type|__TypeList],__Module,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(54,'flrtypeconstraint.flr',FLORA_THIS_MODULE_NAME),','(fllibmodlit('d^isa',[__Arg,__Type,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)],__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_THIS_WORKSPACE(not_complies_with_type_list)(__ArgList,__TypeList,__Module,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))))).
:-(FLORA_THIS_WORKSPACE(is_native)(__Call,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(56,'flrtypeconstraint.flr',FLORA_THIS_MODULE_NAME),:(flrauxil,is_native(__Call)))).

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
#define FLORA_FLS2_FILENAME  'flrtypeconstraint.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('flrtypeconstraint.ergo',FLORA_THIS_MODULE_NAME))).

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

:-(FLORA_THIS_WORKSPACE(boundViolated)(_h677597,_h677599,_h677601,_h677603,_h677605,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(boundViolated))(_h677597,_h677599,_h677601,_h677603,_h677605,FWContext)).
:-(FLORA_THIS_WORKSPACE(checkBounds)(_h678268,_h678270,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(checkBounds))(_h678268,_h678270,FWContext)).
:-(FLORA_THIS_WORKSPACE(is_native)(_h678895,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(is_native))(_h678895,FWContext)).
:-(FLORA_THIS_WORKSPACE(not_complies_with_type_list)(_h679486,_h679488,_h679490,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(not_complies_with_type_list))(_h679486,_h679488,_h679490,FWContext)).
:-(FLORA_THIS_WORKSPACE(typeCheckBoolInternal)(_h680373,_h680375,_h680377,_h680379,_h680381,_h680383,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(typeCheckBoolInternal))(_h680373,_h680375,_h680377,_h680379,_h680381,_h680383,FWContext)).
:-(FLORA_THIS_WORKSPACE(typeCheckInternal)(_h681176,_h681178,_h681180,_h681182,_h681184,_h681186,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(typeCheckInternal))(_h681176,_h681178,_h681180,_h681182,_h681184,_h681186,FWContext)).
