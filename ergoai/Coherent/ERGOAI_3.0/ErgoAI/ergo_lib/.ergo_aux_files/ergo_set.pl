
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
#define FLORA_THIS_FILENAME  'ergo_set.ergo'
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

:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(check_set_name)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(check_set_name)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(check_set_name)(_h649118,_h649120,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(check_set_name))(_h649118,_h649120,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(copy_into)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(copy_into)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(copy_into)(_h649798,_h649800,_h649802,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(copy_into))(_h649798,_h649800,_h649802,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(copy_into_intersect)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(copy_into_intersect)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(copy_into_intersect)(_h650402,_h650404,_h650406,_h650408,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(copy_into_intersect))(_h650402,_h650404,_h650406,_h650408,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(copy_into_minus)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(copy_into_minus)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(copy_into_minus)(_h651170,_h651172,_h651174,_h651176,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(copy_into_minus))(_h651170,_h651172,_h651174,_h651176,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(delete_all_pairs)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(delete_all_pairs)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(delete_all_pairs)(_h651874,_h651876,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(delete_all_pairs))(_h651874,_h651876,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(delete_facts)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(delete_facts)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(delete_facts)(_h652586,_h652588,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(delete_facts))(_h652586,_h652588,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(delete_from)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(delete_from)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(delete_from)(_h653234,_h653236,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(delete_from))(_h653234,_h653236,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(genericdelete)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(genericdelete)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(genericdelete)(_h653866,_h653868,_h653870,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(genericdelete))(_h653866,_h653868,_h653870,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(genericinsert)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(genericinsert)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(genericinsert)(_h654534,_h654536,_h654538,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(genericinsert))(_h654534,_h654536,_h654538,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(genericintersect)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(genericintersect)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(genericintersect)(_h655202,_h655204,_h655206,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(genericintersect))(_h655202,_h655204,_h655206,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(genericmember)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(genericmember)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(genericmember)(_h655918,_h655920,_h655922,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(genericmember))(_h655918,_h655920,_h655922,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(genericminus)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(genericminus)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(genericminus)(_h656586,_h656588,_h656590,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(genericminus))(_h656586,_h656588,_h656590,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(genericsubset)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(genericsubset)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(genericsubset)(_h657238,_h657240,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(genericsubset))(_h657238,_h657240,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(genericunion)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(genericunion)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(genericunion)(_h657902,_h657904,_h657906,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(genericunion))(_h657902,_h657904,_h657906,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(get_storage_name)),5),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(get_storage_name)),5)),opaque))).
:-(FLORA_THIS_WORKSPACE(get_storage_name)(_h658554,_h658556,_h658558,_h658560,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(get_storage_name))(_h658554,_h658556,_h658558,_h658560,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(insert_facts)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(insert_facts)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(insert_facts)(_h659274,_h659276,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(insert_facts))(_h659274,_h659276,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(registry_of_sets)),4),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(registry_of_sets)),4)),opaque))).
:-(FLORA_THIS_WORKSPACE(registry_of_sets)(_h659922,_h659924,_h659926,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(registry_of_sets))(_h659922,_h659924,_h659926,FWContext)).
:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(struct_printable_type)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(struct_printable_type)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(struct_printable_type)(_h660638,_h660640,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(struct_printable_type))(_h660638,_h660640,FWContext)).
 
#if !defined(FLORA_FLM_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLM_FILENAME  'ergo_set.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(ergo_set,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'ergo_set.fld'
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
#define FLORA_FLS_FILENAME  'ergo_set.fls'
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

:-(fllibexport([[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar1,flapply(insert,__newdontcarevar2),__newcontextvar5))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar6,flapply(delete,__newdontcarevar7),__newcontextvar10))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar11,member,__newdontcarevar12,__newcontextvar15))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar16,flapply(mapinsert,__newdontcarevar17),__newcontextvar20))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar21,flapply(mapreplace,__newdontcarevar22),__newcontextvar25))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar26,flapply(mapdelete,__newdontcarevar27),__newcontextvar30))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar31,flapply(maperase,__newdontcarevar32),__newcontextvar35))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar36,flapply(mapfind,__newdontcarevar37),__newdontcarevar38,__newcontextvar41))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar42,flapply(mvminsert,__newdontcarevar43),__newcontextvar46))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar47,flapply(mvmdelete,__newdontcarevar48),__newcontextvar51))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar52,flapply(mvmerase,__newdontcarevar53),__newcontextvar56))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar57,flapply(mvmfind,__newdontcarevar58),__newdontcarevar59,__newcontextvar62))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar63,exists,__newcontextvar66))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar67,empty,__newcontextvar70))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar71,type,__newdontcarevar72,__newcontextvar75))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar76,tolist,__newdontcarevar77,__newcontextvar80))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar81,toList,__newdontcarevar82,__newcontextvar85))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar86,copy,__newdontcarevar87,__newcontextvar90))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar91,destroy,__newcontextvar94))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar95,flapply(union,__newdontcarevar96),__newdontcarevar97,__newcontextvar100))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar101,flapply(minus,__newdontcarevar102),__newdontcarevar103,__newcontextvar106))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar107,flapply(intersect,__newdontcarevar108),__newdontcarevar109,__newcontextvar112))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar113,flapply(equal,__newdontcarevar114),__newcontextvar117))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar118,flapply(subset,__newdontcarevar119),__newcontextvar122))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(ensure_loaded,__newcontextvar125))]])).
?-(:(flrprolog,flora_define_modular_prolog([prolog(struct_printable_type,2,FLORA_THIS_MODULE_NAME),prolog(copy_into,3,FLORA_THIS_MODULE_NAME),prolog(copy_into_minus,4,FLORA_THIS_MODULE_NAME),prolog(copy_into_intersect,4,FLORA_THIS_MODULE_NAME),prolog(delete_from,2,FLORA_THIS_MODULE_NAME),prolog(insert_facts,2,FLORA_THIS_MODULE_NAME),prolog(delete_facts,2,FLORA_THIS_MODULE_NAME),prolog(delete_all_pairs,2,FLORA_THIS_MODULE_NAME),prolog(check_set_name,2,FLORA_THIS_MODULE_NAME),prolog(genericmember,3,FLORA_THIS_MODULE_NAME),prolog(genericinsert,3,FLORA_THIS_MODULE_NAME),prolog(genericdelete,3,FLORA_THIS_MODULE_NAME),prolog(genericsubset,2,FLORA_THIS_MODULE_NAME),prolog(genericintersect,3,FLORA_THIS_MODULE_NAME),prolog(genericunion,3,FLORA_THIS_MODULE_NAME),prolog(genericminus,3,FLORA_THIS_MODULE_NAME),prolog(registry_of_sets,3,FLORA_THIS_MODULE_NAME),prolog(get_storage_name,4,FLORA_THIS_MODULE_NAME)]))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(ensure_loaded,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(4,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(static^meth)(__Set,exists,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(6,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(registry_of_sets)(__Set,__newdontcarevar3,__newdontcarevar4,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibexecute_delayed_calls([__Set,__newdontcarevar7],[__Set])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Set,type,__T,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(8,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(registry_of_sets)(__Set,__newdontcarevar3,__T,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),fllibexecute_delayed_calls([__Set,__T,__newdontcarevar6],[__Set,__T])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__Set,empty,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(10,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(check_set_name)(__Set,FLORA_THIS_WORKSPACE(d^meth)(__Set,empty,'_$ctxt'(__newcontextvar3,__newcontextvar4,__newcontextvar5)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),','(\+(FLORA_THIS_WORKSPACE(d^mvd)(__Set,member,__newdontcarevar8,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10))),!)),fllibexecute_delayed_calls([__Set,__newdontcarevar11],[__Set])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__Set,flapply(insert,__Fact),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(12,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(genericinsert)(__Set,set,__Fact,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(genericinsert)(__Set,__Type,__Fact,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(14,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(get_storage_name)(__Set,__StorageName,__Type,FLORA_THIS_WORKSPACE(d^meth)(__Set,flapply(insert,__Fact),'_$ctxt'(__newcontextvar3,__newcontextvar4,__newcontextvar5)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),','(!,';'(->(:(usermod,is_list(__Fact)),FLORA_THIS_WORKSPACE(insert_facts)(__Fact,__StorageName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9))),:(storage,incr_storage_insert_fact(__StorageName,__Fact,__newdontcarevar10))))),fllibexecute_delayed_calls([__Fact,__Set,__StorageName,__Type,__newdontcarevar11],[__Fact,__Set,__Type])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__Set,flapply(delete,__Fact),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(16,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(genericdelete)(__Set,set,__Fact,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(genericdelete)(__Set,__Type,__Fact,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(18,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(get_storage_name)(__Set,__StorageName,__Type,FLORA_THIS_WORKSPACE(d^meth)(__Set,flapply(delete,__Fact),'_$ctxt'(__newcontextvar3,__newcontextvar4,__newcontextvar5)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),','(!,';'(->(:(usermod,is_list(__Fact)),FLORA_THIS_WORKSPACE(delete_facts)(__Fact,__StorageName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9))),:(storage,incr_storage_delete_fact(__StorageName,__Fact,__newdontcarevar10))))),fllibexecute_delayed_calls([__Fact,__Set,__StorageName,__Type,__newdontcarevar11],[__Fact,__Set,__Type])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Set,member,__Fact,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(20,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(genericmember)(__Set,set,__Fact,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(genericmember)(__Set,__Type,__Fact,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(22,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(check_set_name)(__Set,FLORA_THIS_WORKSPACE(d^mvd)(__Set,member,__Fact,'_$ctxt'(__newcontextvar3,__newcontextvar4,__newcontextvar5)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),','(FLORA_THIS_WORKSPACE(registry_of_sets)(__Set,__StorageName,__Type,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),:(storage,incr_storage_find_fact(__StorageName,__Fact)))),fllibexecute_delayed_calls([__Fact,__Set,__StorageName,__Type],[__Fact,__Set,__Type])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__Set,destroy,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(24,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(check_set_name)(__Set,FLORA_THIS_WORKSPACE(d^meth)(__Set,destroy,'_$ctxt'(__newcontextvar3,__newcontextvar4,__newcontextvar5)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),','(FLORA_THIS_WORKSPACE(registry_of_sets)(__Set,__StorageName,__Type,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),','(!,','(fllibdelete(FLORA_THIS_MODULE_NAME,[flsysdbupdate('_$_$_ergo''dynprologfact'(FLORA_THIS_WORKSPACE(registry_of_sets)(__Set,__StorageName,__Type,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11))),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),:(storage,incr_storage_delete_all(__StorageName)))))),fllibexecute_delayed_calls([__Set,__StorageName,__Type],[__Set])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__newdontcarevar1,destroy,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(26,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Set,flapply(union,__Set2),__Set3,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(28,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(genericunion)(__Set,__Set2,__Set3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(genericunion)(__Set,__Set2,__Set3,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(30,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(check_set_name)(__Set,FLORA_THIS_WORKSPACE(d^mvd)(__Set,flapply(union,__Set2),__Set3,'_$ctxt'(__newcontextvar3,__newcontextvar4,__newcontextvar5)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),','(FLORA_THIS_WORKSPACE(check_set_name)(__Set2,FLORA_THIS_WORKSPACE(d^mvd)(__Set,flapply(union,__Set2),__Set3,'_$ctxt'(__newcontextvar8,__newcontextvar9,__newcontextvar10)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)),','(FLORA_THIS_WORKSPACE(check_set_name)(__Set3,FLORA_THIS_WORKSPACE(d^mvd)(__Set,flapply(union,__Set2),__Set3,'_$ctxt'(__newcontextvar13,__newcontextvar14,__newcontextvar15)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar16,__newcontextvar17)),','(FLORA_THIS_WORKSPACE(d^mvd)(__Set,type,__Type,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar18,__newcontextvar19)),','(';'(->(==(__Set,__Set3),FLORA_THIS_WORKSPACE(copy_into)(__Set2,__Set3,__Type,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar20,__newcontextvar21))),';'(->(==(__Set2,__Set3),FLORA_THIS_WORKSPACE(copy_into)(__Set,__Set3,__Type,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar22,__newcontextvar23))),','(FLORA_THIS_WORKSPACE(d^mvd)(__Set,copy,__Set3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar24,__newcontextvar25)),FLORA_THIS_WORKSPACE(copy_into)(__Set2,__Set3,__Type,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar26,__newcontextvar27))))),!))))),fllibexecute_delayed_calls([__Set,__Set2,__Set3,__Type],[__Set,__Set2,__Set3])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Set,flapply(intersect,__Set2),__Set3,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(32,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(genericintersect)(__Set,__Set2,__Set3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(genericintersect)(__Set,__Set2,__Set3,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(34,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(check_set_name)(__Set,FLORA_THIS_WORKSPACE(d^mvd)(__Set,flapply(intersect,__Set2),__Set3,'_$ctxt'(__newcontextvar3,__newcontextvar4,__newcontextvar5)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),','(FLORA_THIS_WORKSPACE(check_set_name)(__Set2,FLORA_THIS_WORKSPACE(d^mvd)(__Set,flapply(intersect,__Set2),__Set3,'_$ctxt'(__newcontextvar8,__newcontextvar9,__newcontextvar10)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)),','(FLORA_THIS_WORKSPACE(check_set_name)(__Set3,FLORA_THIS_WORKSPACE(d^mvd)(__Set,flapply(intersect,__Set2),__Set3,'_$ctxt'(__newcontextvar13,__newcontextvar14,__newcontextvar15)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar16,__newcontextvar17)),','(FLORA_THIS_WORKSPACE(d^mvd)(__Set,type,__Type,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar18,__newcontextvar19)),','(';'(->(==(__Set,__Set3),FLORA_WORKSPACE(\\system,d^tblflapply)(sysabort,[<,'\\set','> Set1[intersect(Set2)->Set3]: Set1 must be != Set3'],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar20,__newcontextvar21))),';'(->(==(__Set2,__Set3),FLORA_WORKSPACE(\\system,d^tblflapply)(sysabort,[<,'\\set','> Set1[intersect(Set2)->Set3]: Set2 must be != Set3'],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar22,__newcontextvar23))),','(FLORA_THIS_WORKSPACE(d^meth)(__Set3,destroy,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar24,__newcontextvar25)),FLORA_THIS_WORKSPACE(copy_into_intersect)(__Set,__Set2,__Set3,__Type,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar26,__newcontextvar27))))),!))))),fllibexecute_delayed_calls([__Set,__Set2,__Set3,__Type],[__Set,__Set2,__Set3])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Set,flapply(minus,__Set2),__Set3,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(36,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(genericminus)(__Set,__Set2,__Set3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(genericminus)(__Set,__Set2,__Set3,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(38,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(check_set_name)(__Set,FLORA_THIS_WORKSPACE(d^mvd)(__Set,flapply(minus,__Set2),__Set3,'_$ctxt'(__newcontextvar3,__newcontextvar4,__newcontextvar5)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),','(FLORA_THIS_WORKSPACE(check_set_name)(__Set2,FLORA_THIS_WORKSPACE(d^mvd)(__Set,flapply(minus,__Set2),__Set3,'_$ctxt'(__newcontextvar8,__newcontextvar9,__newcontextvar10)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)),','(FLORA_THIS_WORKSPACE(check_set_name)(__Set3,FLORA_THIS_WORKSPACE(d^mvd)(__Set,flapply(minus,__Set2),__Set3,'_$ctxt'(__newcontextvar13,__newcontextvar14,__newcontextvar15)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar16,__newcontextvar17)),','(';'(->(==(__Set,__Set3),FLORA_THIS_WORKSPACE(delete_from)(__Set,__Set2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar18,__newcontextvar19))),';'(->(==(__Set2,__Set3),FLORA_WORKSPACE(\\system,d^tblflapply)(sysabort,[<,'\\set','> Set1[minus(Set2)->Set3]: Set2 must be != Set3'],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar20,__newcontextvar21))),','(FLORA_THIS_WORKSPACE(d^meth)(__Set3,destroy,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar22,__newcontextvar23)),','(FLORA_THIS_WORKSPACE(d^mvd)(__Set,type,__Type,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar24,__newcontextvar25)),FLORA_THIS_WORKSPACE(copy_into_minus)(__Set,__Set2,__Set3,__Type,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar26,__newcontextvar27)))))),!)))),fllibexecute_delayed_calls([__Set,__Set2,__Set3,__Type],[__Set,__Set2,__Set3])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__Set,flapply(subset,__Set2),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(40,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(genericsubset)(__Set,__Set2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(genericsubset)(__Set,__Set2,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(42,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(check_set_name)(__Set,:(flrsetops,flora_list_subset(__Set,__Set2)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(check_set_name)(__Set2,:(flrsetops,flora_list_subset(__Set,__Set2)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(\+(','(FLORA_THIS_WORKSPACE(d^mvd)(__Set,member,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),\+(FLORA_THIS_WORKSPACE(d^mvd)(__Set2,member,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10))))),!))),fllibexecute_delayed_calls([__M,__Set,__Set2],[__Set,__Set2])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__Set,flapply(equal,__Set2),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(44,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(check_set_name)(__Set,FLORA_THIS_WORKSPACE(d^meth)(__Set,flapply(equal,__Set2),'_$ctxt'(__newcontextvar3,__newcontextvar4,__newcontextvar5)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),','(FLORA_THIS_WORKSPACE(check_set_name)(__Set2,FLORA_THIS_WORKSPACE(d^meth)(__Set,flapply(equal,__Set2),'_$ctxt'(__newcontextvar8,__newcontextvar9,__newcontextvar10)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)),','(\+(','(FLORA_THIS_WORKSPACE(d^mvd)(__Set,member,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14)),\+(FLORA_THIS_WORKSPACE(d^mvd)(__Set2,member,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,__newcontextvar16))))),','(\+(','(FLORA_THIS_WORKSPACE(d^mvd)(__Set2,member,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar17,__newcontextvar18)),\+(FLORA_THIS_WORKSPACE(d^mvd)(__Set,member,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar19,__newcontextvar20))))),!)))),fllibexecute_delayed_calls([__M,__Set,__Set2],[__Set,__Set2])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__Set,flapply(mapinsert,=(__Key,__Fact)),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(46,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(get_storage_name)(__Set,__StorageName,map,FLORA_THIS_WORKSPACE(d^meth)(__Set,flapply(mapinsert,=(__Key,__Fact)),'_$ctxt'(__newcontextvar3,__newcontextvar4,__newcontextvar5)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),','(!,','(:(storage,incr_storage_insert_keypair(__StorageName,__Key,__Fact,__Res)),\==(__Res,-1)))),fllibexecute_delayed_calls([__Fact,__Key,__Res,__Set,__StorageName],[__Fact,__Key,__Set])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__Set,flapply(mapreplace,=(__Key,__Fact)),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(48,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(get_storage_name)(__Set,__StorageName,map,FLORA_THIS_WORKSPACE(d^meth)(__Set,flapply(mapreplace,=(__Key,__Fact)),'_$ctxt'(__newcontextvar3,__newcontextvar4,__newcontextvar5)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),','(!,','(:(storage,incr_storage_delete_keypair(__StorageName,__Key,__newdontcarevar8)),','(:(storage,incr_storage_insert_keypair(__StorageName,__Key,__Fact,__newdontcarevar9)),!)))),fllibexecute_delayed_calls([__Fact,__Key,__Set,__StorageName,__newdontcarevar10],[__Fact,__Key,__Set])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__Set,flapply(mapdelete,__Key),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(50,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(get_storage_name)(__Set,__StorageName,map,FLORA_THIS_WORKSPACE(d^meth)(__Set,flapply(mapdelete,__Key),'_$ctxt'(__newcontextvar3,__newcontextvar4,__newcontextvar5)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),','(!,:(storage,incr_storage_delete_keypair(__StorageName,__Key,1)))),fllibexecute_delayed_calls([__Key,__Set,__StorageName],[__Key,__Set])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__Set,flapply(maperase,__Key),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(52,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(get_storage_name)(__Set,__StorageName,map,FLORA_THIS_WORKSPACE(d^meth)(__Set,flapply(maperase,__Key),'_$ctxt'(__newcontextvar3,__newcontextvar4,__newcontextvar5)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),','(!,:(storage,incr_storage_delete_keypair(__StorageName,__Key,__newdontcarevar8)))),fllibexecute_delayed_calls([__Key,__Set,__StorageName,__newdontcarevar9],[__Key,__Set])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Set,flapply(mapfind,__Key),__Fact,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(54,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(check_set_name)(__Set,FLORA_THIS_WORKSPACE(d^mvd)(__Set,flapply(mapfind,__Key),__Fact,'_$ctxt'(__newcontextvar3,__newcontextvar4,__newcontextvar5)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),','(FLORA_THIS_WORKSPACE(registry_of_sets)(__Set,__StorageName,map,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),:(storage,incr_storage_find_keypair(__StorageName,__Key,__Fact)))),fllibexecute_delayed_calls([__Fact,__Key,__Set,__StorageName],[__Fact,__Key,__Set])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__Set,flapply(mvminsert,=(__Key,__Fact)),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(56,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(get_storage_name)(__Set,__StorageName,mvm,FLORA_THIS_WORKSPACE(d^meth)(__Set,flapply(mvminsert,=(__Key,__Fact)),'_$ctxt'(__newcontextvar3,__newcontextvar4,__newcontextvar5)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),','(!,:(storage,incr_storage_insert_fact(__StorageName,pair(__Key,__Fact),__newdontcarevar8)))),fllibexecute_delayed_calls([__Fact,__Key,__Set,__StorageName,__newdontcarevar9],[__Fact,__Key,__Set])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__Set,flapply(mvmdelete,=(__Key,__Value)),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(58,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(get_storage_name)(__Set,__StorageName,mvm,FLORA_THIS_WORKSPACE(d^meth)(__Set,flapply(mvmdelete,=(__Key,__Value)),'_$ctxt'(__newcontextvar3,__newcontextvar4,__newcontextvar5)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),','(!,:(storage,incr_storage_delete_fact(__StorageName,pair(__Key,__Value),__newdontcarevar8)))),fllibexecute_delayed_calls([__Key,__Set,__StorageName,__Value,__newdontcarevar9],[__Key,__Set,__Value])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__Set,flapply(mvmerase,__Key),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(60,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(get_storage_name)(__Set,__StorageName,mvm,FLORA_THIS_WORKSPACE(d^meth)(__Set,flapply(mvmerase,__Key),'_$ctxt'(__newcontextvar3,__newcontextvar4,__newcontextvar5)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),','(!,FLORA_THIS_WORKSPACE(delete_all_pairs)(__StorageName,__Key,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)))),fllibexecute_delayed_calls([__Key,__Set,__StorageName],[__Key,__Set])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Set,flapply(mvmfind,__Key),__Fact,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(62,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(check_set_name)(__Set,FLORA_THIS_WORKSPACE(d^mvd)(__Set,flapply(mvmfind,__Key),__Fact,'_$ctxt'(__newcontextvar3,__newcontextvar4,__newcontextvar5)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),','(FLORA_THIS_WORKSPACE(registry_of_sets)(__Set,__StorageName,mvm,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),:(storage,incr_storage_find_keypair(__StorageName,__Key,__Fact)))),fllibexecute_delayed_calls([__Fact,__Key,__Set,__StorageName],[__Fact,__Key,__Set])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Set,toList,__L,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(64,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^mvd)(__Set,tolist,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Set,tolist,__L,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(66,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(check_set_name)(__Set,FLORA_THIS_WORKSPACE(d^mvd)(__Set,tolist,__L,'_$ctxt'(__newcontextvar3,__newcontextvar4,__newcontextvar5)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),','(';'(->(FLORA_THIS_WORKSPACE(registry_of_sets)(__Set,__StorageName,set,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),','(fllibsetof(__newdontcarevar12,[],[],','(FLORA_THIS_WORKSPACE(d^mvd)(__Set,member,__newdontcarevar12,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11)),fllibexecute_delayed_calls([__newdontcarevar12,__Set],[])),__newvar13),=(__L,__newvar13))),';'(->(FLORA_THIS_WORKSPACE(registry_of_sets)(__Set,__StorageName,map,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar14,__newcontextvar15)),','(fllibsetof(__newdontcarevar18,[],[],','(','(FLORA_THIS_WORKSPACE(d^mvd)(__Set,flapply(mapfind,__Key),__Elt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar16,__newcontextvar17)),=(__newdontcarevar18,=(__Key,__Elt))),fllibexecute_delayed_calls([__Elt,__Key,__newdontcarevar18,__Set],[])),__newvar19),=(__L,__newvar19))),->(FLORA_THIS_WORKSPACE(registry_of_sets)(__Set,__StorageName,mvm,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar20,__newcontextvar21)),','(fllibsetof(__newdontcarevar24,[],[],','(','(FLORA_THIS_WORKSPACE(d^mvd)(__Set,flapply(mvmfind,__Key),__Elt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar22,__newcontextvar23)),=(__newdontcarevar24,=(__Key,__Elt))),fllibexecute_delayed_calls([__Elt,__Key,__newdontcarevar24,__Set],[])),__newvar25),=(__L,__newvar25))))),!)),fllibexecute_delayed_calls([__Elt,__Key,__L,__Set,__StorageName],[__L,__Set])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Set,copy,__Set2,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(68,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(check_set_name)(__Set,FLORA_THIS_WORKSPACE(d^mvd)(__Set,copy,__Set2,'_$ctxt'(__newcontextvar3,__newcontextvar4,__newcontextvar5)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),','(FLORA_THIS_WORKSPACE(check_set_name)(__Set2,FLORA_THIS_WORKSPACE(d^mvd)(__Set,copy,__Set2,'_$ctxt'(__newcontextvar8,__newcontextvar9,__newcontextvar10)),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)),','(FLORA_THIS_WORKSPACE(d^meth)(__Set2,destroy,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14)),','(FLORA_THIS_WORKSPACE(d^mvd)(__Set,type,__Type,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,__newcontextvar16)),','(FLORA_THIS_WORKSPACE(copy_into)(__Set,__Set2,__Type,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar17,__newcontextvar18)),!))))),fllibexecute_delayed_calls([__Set,__Set2,__Type],[__Set,__Set2])))).
:-(FLORA_THIS_WORKSPACE(get_storage_name)(__Set,__StorageName,__Type,__Op,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(70,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(check_set_name)(__Set,__Op,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(registry_of_sets)(__Set,__StorageName,__Type2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(';'(->(\=(__Type,__Type2),','(FLORA_THIS_WORKSPACE(struct_printable_type)(__Type,__TypeP,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),','(FLORA_THIS_WORKSPACE(struct_printable_type)(__Type2,__Type2P,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),','(FLORA_WORKSPACE(\\show,d^mvd)(__Op,flapply(show,goal),__OpString,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)),FLORA_WORKSPACE(\\system,d^tblflapply)(sysabort,[__OpString,': structure ',__Set,' was created for ',__Type2P,'s but used with a ',__TypeP,' operation'],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14)))))),'\\true'),!))),fllibexecute_delayed_calls([__Op,__OpString,__Set,__StorageName,__Type,__Type2,__Type2P,__TypeP],[__Op,__Set,__StorageName,__Type])))).
:-(FLORA_THIS_WORKSPACE(get_storage_name)(__Set,__StorageName,__Type,___op,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(72,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral('\\is','ergo_set.ergo',298,[__StorageName,'||'('_$_$_ergo''set_struct^',__Set)]),fllibinsert(FLORA_THIS_MODULE_NAME,[flsysdbupdate('_$_$_ergo''dynprologfact'(FLORA_THIS_WORKSPACE(registry_of_sets)(__Set,__StorageName,__Type,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar3,__newcontextvar4))),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)])))).
:-(FLORA_THIS_WORKSPACE(copy_into)(__Set,__Set2,__Type,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(74,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(','(repeat,';'(','(FLORA_THIS_WORKSPACE(genericmember)(__Set,__newdontcarevar3,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),','(FLORA_THIS_WORKSPACE(genericinsert)(__Set2,__Type,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),'\\false')),'\\true')),fllibexecute_delayed_calls([__M,__Set,__Set2,__Type,__newdontcarevar8],[__Set,__Set2,__Type])))).
:-(FLORA_THIS_WORKSPACE(copy_into_minus)(__Set,__Set2,__Set3,__Type,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(76,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(','(repeat,';'(','(FLORA_THIS_WORKSPACE(genericmember)(__Set,__newdontcarevar3,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),','(\+(FLORA_THIS_WORKSPACE(genericmember)(__Set2,__newdontcarevar6,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))),','(FLORA_THIS_WORKSPACE(genericinsert)(__Set3,__Type,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),'\\false'))),'\\true')),fllibexecute_delayed_calls([__M,__Set,__Set2,__Set3,__Type,__newdontcarevar11],[__Set,__Set2,__Set3,__Type])))).
:-(FLORA_THIS_WORKSPACE(copy_into_intersect)(__Set,__Set2,__Set3,__Type,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(78,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(','(repeat,';'(','(FLORA_THIS_WORKSPACE(genericmember)(__Set,__newdontcarevar3,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),','(FLORA_THIS_WORKSPACE(genericmember)(__Set2,__newdontcarevar6,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),','(FLORA_THIS_WORKSPACE(genericinsert)(__Set3,__Type,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),'\\false'))),'\\true')),fllibexecute_delayed_calls([__M,__Set,__Set2,__Set3,__Type,__newdontcarevar11],[__Set,__Set2,__Set3,__Type])))).
:-(FLORA_THIS_WORKSPACE(delete_from)(__Set,__Set2,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(80,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(','(repeat,';'(','(FLORA_THIS_WORKSPACE(genericmember)(__Set2,__newdontcarevar3,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),','(FLORA_THIS_WORKSPACE(genericmember)(__Set,__newdontcarevar6,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),','(FLORA_THIS_WORKSPACE(genericdelete)(__Set,__newdontcarevar9,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11)),'\\false'))),'\\true')),fllibexecute_delayed_calls([__M,__Set,__Set2,__newdontcarevar12],[__Set,__Set2])))).
:-(FLORA_THIS_WORKSPACE(insert_facts)([],___StorageName,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(82,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(insert_facts)([__Fact|__Rest],__StorageName,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(84,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(','(:(storage,incr_storage_insert_fact(__StorageName,__Fact,__newdontcarevar3)),FLORA_THIS_WORKSPACE(insert_facts)(__Rest,__StorageName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5))),fllibexecute_delayed_calls([__Fact,__Rest,__StorageName,__newdontcarevar6],[__Fact,__Rest,__StorageName])))).
:-(FLORA_THIS_WORKSPACE(delete_facts)([],___StorageName,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(86,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(delete_facts)([__Fact|__Rest],__StorageName,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(88,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(','(:(storage,incr_storage_delete_fact(__StorageName,__Fact,__newdontcarevar3)),FLORA_THIS_WORKSPACE(delete_facts)(__Rest,__StorageName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5))),fllibexecute_delayed_calls([__Fact,__Rest,__StorageName,__newdontcarevar6],[__Fact,__Rest,__StorageName])))).
:-(FLORA_THIS_WORKSPACE(delete_all_pairs)(__StorageName,__Key,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(90,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(','(:(storage,incr_storage_delete_fact(__StorageName,pair(__Key,__newdontcarevar3),__newdontcarevar4)),'\\false'),fllibexecute_delayed_calls([__Key,__StorageName,__newdontcarevar5],[__Key,__StorageName])))).
:-(FLORA_THIS_WORKSPACE(delete_all_pairs)(__newdontcarevar1,__newdontcarevar2,'_$ctxt'(_CallerModuleVar,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''rule_enabled'(92,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),'\\true')).
:-(FLORA_THIS_WORKSPACE(check_set_name)(__Set,__newdontcarevar1,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(94,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(:(usermod,atom(__Set)),!))).
:-(FLORA_THIS_WORKSPACE(check_set_name)(__newdontcarevar1,__Op,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(96,'ergo_set.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_WORKSPACE(\\show,d^mvd)(__Op,flapply(show,goal),__OpString,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),FLORA_WORKSPACE(\\system,d^tblflapply)(sysabort,[__OpString,': non-symbol set name in a set operation'],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7))),fllibexecute_delayed_calls([__Op,__OpString],[__Op,__newdontcarevar8])))).
FLORA_THIS_WORKSPACE(struct_printable_type)(set,set,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)).
FLORA_THIS_WORKSPACE(struct_printable_type)(map,'regular map','_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)).
FLORA_THIS_WORKSPACE(struct_printable_type)(mvm,'MV-map','_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)).

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
#define FLORA_FLS2_FILENAME  'ergo_set.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('ergo_set.ergo',FLORA_THIS_MODULE_NAME))).

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

:-(FLORA_THIS_WORKSPACE(check_set_name)(_h687198,_h687200,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(check_set_name))(_h687198,_h687200,FWContext)).
:-(FLORA_THIS_WORKSPACE(copy_into)(_h687873,_h687875,_h687877,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(copy_into))(_h687873,_h687875,_h687877,FWContext)).
:-(FLORA_THIS_WORKSPACE(copy_into_intersect)(_h688472,_h688474,_h688476,_h688478,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(copy_into_intersect))(_h688472,_h688474,_h688476,_h688478,FWContext)).
:-(FLORA_THIS_WORKSPACE(copy_into_minus)(_h689235,_h689237,_h689239,_h689241,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(copy_into_minus))(_h689235,_h689237,_h689239,_h689241,FWContext)).
:-(FLORA_THIS_WORKSPACE(delete_all_pairs)(_h689934,_h689936,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(delete_all_pairs))(_h689934,_h689936,FWContext)).
:-(FLORA_THIS_WORKSPACE(delete_facts)(_h690641,_h690643,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(delete_facts))(_h690641,_h690643,FWContext)).
:-(FLORA_THIS_WORKSPACE(delete_from)(_h691284,_h691286,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(delete_from))(_h691284,_h691286,FWContext)).
:-(FLORA_THIS_WORKSPACE(genericdelete)(_h691911,_h691913,_h691915,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(genericdelete))(_h691911,_h691913,_h691915,FWContext)).
:-(FLORA_THIS_WORKSPACE(genericinsert)(_h692574,_h692576,_h692578,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(genericinsert))(_h692574,_h692576,_h692578,FWContext)).
:-(FLORA_THIS_WORKSPACE(genericintersect)(_h693237,_h693239,_h693241,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(genericintersect))(_h693237,_h693239,_h693241,FWContext)).
:-(FLORA_THIS_WORKSPACE(genericmember)(_h693948,_h693950,_h693952,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(genericmember))(_h693948,_h693950,_h693952,FWContext)).
:-(FLORA_THIS_WORKSPACE(genericminus)(_h694611,_h694613,_h694615,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(genericminus))(_h694611,_h694613,_h694615,FWContext)).
:-(FLORA_THIS_WORKSPACE(genericsubset)(_h695258,_h695260,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(genericsubset))(_h695258,_h695260,FWContext)).
:-(FLORA_THIS_WORKSPACE(genericunion)(_h695917,_h695919,_h695921,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(genericunion))(_h695917,_h695919,_h695921,FWContext)).
:-(FLORA_THIS_WORKSPACE(get_storage_name)(_h696564,_h696566,_h696568,_h696570,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(get_storage_name))(_h696564,_h696566,_h696568,_h696570,FWContext)).
:-(FLORA_THIS_WORKSPACE(insert_facts)(_h697279,_h697281,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(insert_facts))(_h697279,_h697281,FWContext)).
:-(FLORA_THIS_WORKSPACE(registry_of_sets)(_h697922,_h697924,_h697926,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(registry_of_sets))(_h697922,_h697924,_h697926,FWContext)).
:-(FLORA_THIS_WORKSPACE(struct_printable_type)(_h698633,_h698635,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(struct_printable_type))(_h698633,_h698635,FWContext)).
