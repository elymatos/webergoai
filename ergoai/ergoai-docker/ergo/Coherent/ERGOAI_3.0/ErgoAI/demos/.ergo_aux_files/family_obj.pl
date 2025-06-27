
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
#define FLORA_THIS_FILENAME  'family_obj.ergo'
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
  file: syslibinc/flrclause_inc.flh

  Author(s): Chang Zhao

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBCLAUSE))).

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

 
#if !defined(FLORA_FDB_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FDB_FILENAME  'family_obj.fdb'
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
#define FLORA_FLM_FILENAME  'family_obj.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(family_obj,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'family_obj.fld'
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
#define FLORA_FLS_FILENAME  'family_obj.fls'
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

:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,spouse,__Y,'_$ctxt'(_CallerModuleVar,4,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(4,'family_obj.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^mvd)(__Y,spouse,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,4)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,parent,__Y,'_$ctxt'(_CallerModuleVar,6,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(6,'family_obj.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^mvd)(__X,father,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,6)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,parent,__Y,'_$ctxt'(_CallerModuleVar,8,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(8,'family_obj.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^mvd)(__X,mother,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,8)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,son,__Y,'_$ctxt'(_CallerModuleVar,10,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(10,'family_obj.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^mvd)(__Y,parent,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,10)),FLORA_THIS_WORKSPACE(d^isa)(__Y,male,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,10))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,daughter,__Y,'_$ctxt'(_CallerModuleVar,12,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(12,'family_obj.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^mvd)(__Y,parent,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,12)),FLORA_THIS_WORKSPACE(d^isa)(__Y,female,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,12))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,brother,__Y,'_$ctxt'(_CallerModuleVar,14,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(14,'family_obj.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__X,parent,__newquantvar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,14)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar2,son,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,14))),\+(=(__X,__Y))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,sister,__Y,'_$ctxt'(_CallerModuleVar,16,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(16,'family_obj.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__X,parent,__newquantvar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,16)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar2,daughter,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,16))),\+(=(__X,__Y))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,brother_in_law,__Y,'_$ctxt'(_CallerModuleVar,18,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(18,'family_obj.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^mvd)(__X,sister,__newquantvar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,18)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar2,spouse,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,18))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,brother_in_law,__Y,'_$ctxt'(_CallerModuleVar,20,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(20,'family_obj.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^mvd)(__X,spouse,__newquantvar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,20)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar2,brother,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,20))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,sister_in_law,__Y,'_$ctxt'(_CallerModuleVar,22,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(22,'family_obj.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^mvd)(__X,brother,__newquantvar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,22)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar2,spouse,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,22))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,sister_in_law,__Y,'_$ctxt'(_CallerModuleVar,24,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(24,'family_obj.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^mvd)(__X,spouse,__newquantvar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,24)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar2,sister,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,24))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,uncle,__Y,'_$ctxt'(_CallerModuleVar,26,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(26,'family_obj.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^mvd)(__X,parent,__newquantvar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,26)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar2,brother,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,26))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,uncle,__Y,'_$ctxt'(_CallerModuleVar,28,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(28,'family_obj.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^mvd)(__X,parent,__newquantvar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,28)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar2,brother_in_law,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,28))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,aunt,__Y,'_$ctxt'(_CallerModuleVar,30,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(30,'family_obj.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^mvd)(__X,parent,__newquantvar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,30)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar2,sister,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,30))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,aunt,__Y,'_$ctxt'(_CallerModuleVar,32,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(32,'family_obj.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^mvd)(__X,parent,__newquantvar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,32)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar2,sister_in_law,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,32))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,ancestor,__Y,'_$ctxt'(_CallerModuleVar,34,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(34,'family_obj.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^mvd)(__X,parent,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,34)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,ancestor,__Y,'_$ctxt'(_CallerModuleVar,36,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(36,'family_obj.flr',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^mvd)(__X,ancestor,__newquantvar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,36)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar2,ancestor,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,36))))).
:-(FLORA_THIS_WORKSPACE(static^isa)(__X,illegitimate,'_$ctxt'(_CallerModuleVar,38,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(38,'family_obj.flr',FLORA_THIS_MODULE_NAME),','(','(','(FLORA_THIS_WORKSPACE(d^mvd)(__X,father,__F,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,38)),FLORA_THIS_WORKSPACE(d^mvd)(__X,mother,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,38))),','(FLORA_THIS_WORKSPACE(d^mvd)(__M,spouse,__S,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,38)),\=(__S,__F))),fllibexecute_delayed_calls([__F,__M,__S,__X],[__X])))).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rule signatures %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibinsrulesig(4,'family_obj.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20,FLORA_THIS_WORKSPACE(d^mvd)(__X,spouse,__Y,'_$ctxt'(_CallerModuleVar,4,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^mvd)(__Y,spouse,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,4)),null,'_$_$_ergo''rule_enabled'(4,'family_obj.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(6,'family_obj.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,21,FLORA_THIS_WORKSPACE(d^mvd)(__X,parent,__Y,'_$ctxt'(_CallerModuleVar,6,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^mvd)(__X,father,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,6)),null,'_$_$_ergo''rule_enabled'(6,'family_obj.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(8,'family_obj.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,22,FLORA_THIS_WORKSPACE(d^mvd)(__X,parent,__Y,'_$ctxt'(_CallerModuleVar,8,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^mvd)(__X,mother,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,8)),null,'_$_$_ergo''rule_enabled'(8,'family_obj.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(10,'family_obj.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,23,FLORA_THIS_WORKSPACE(d^mvd)(__X,son,__Y,'_$ctxt'(_CallerModuleVar,10,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^mvd)(__Y,parent,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,10)),FLORA_THIS_WORKSPACE(d^isa)(__Y,male,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,10))),null,'_$_$_ergo''rule_enabled'(10,'family_obj.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(12,'family_obj.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,24,FLORA_THIS_WORKSPACE(d^mvd)(__X,daughter,__Y,'_$ctxt'(_CallerModuleVar,12,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^mvd)(__Y,parent,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,12)),FLORA_THIS_WORKSPACE(d^isa)(__Y,female,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,12))),null,'_$_$_ergo''rule_enabled'(12,'family_obj.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(14,'family_obj.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,25,FLORA_THIS_WORKSPACE(d^mvd)(__X,brother,__Y,'_$ctxt'(_CallerModuleVar,14,__newcontextvar1)),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__X,parent,__newquantvar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,14)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar2,son,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,14))),\+(=(__X,__Y))),null,'_$_$_ergo''rule_enabled'(14,'family_obj.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(16,'family_obj.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,26,FLORA_THIS_WORKSPACE(d^mvd)(__X,sister,__Y,'_$ctxt'(_CallerModuleVar,16,__newcontextvar1)),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__X,parent,__newquantvar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,16)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar2,daughter,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,16))),\+(=(__X,__Y))),null,'_$_$_ergo''rule_enabled'(16,'family_obj.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(18,'family_obj.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,27,FLORA_THIS_WORKSPACE(d^mvd)(__X,brother_in_law,__Y,'_$ctxt'(_CallerModuleVar,18,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^mvd)(__X,sister,__newquantvar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,18)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar2,spouse,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,18))),null,'_$_$_ergo''rule_enabled'(18,'family_obj.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(20,'family_obj.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,28,FLORA_THIS_WORKSPACE(d^mvd)(__X,brother_in_law,__Y,'_$ctxt'(_CallerModuleVar,20,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^mvd)(__X,spouse,__newquantvar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,20)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar2,brother,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,20))),null,'_$_$_ergo''rule_enabled'(20,'family_obj.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(22,'family_obj.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,29,FLORA_THIS_WORKSPACE(d^mvd)(__X,sister_in_law,__Y,'_$ctxt'(_CallerModuleVar,22,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^mvd)(__X,brother,__newquantvar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,22)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar2,spouse,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,22))),null,'_$_$_ergo''rule_enabled'(22,'family_obj.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(24,'family_obj.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,30,FLORA_THIS_WORKSPACE(d^mvd)(__X,sister_in_law,__Y,'_$ctxt'(_CallerModuleVar,24,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^mvd)(__X,spouse,__newquantvar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,24)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar2,sister,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,24))),null,'_$_$_ergo''rule_enabled'(24,'family_obj.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(26,'family_obj.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,31,FLORA_THIS_WORKSPACE(d^mvd)(__X,uncle,__Y,'_$ctxt'(_CallerModuleVar,26,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^mvd)(__X,parent,__newquantvar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,26)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar2,brother,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,26))),null,'_$_$_ergo''rule_enabled'(26,'family_obj.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(28,'family_obj.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,32,FLORA_THIS_WORKSPACE(d^mvd)(__X,uncle,__Y,'_$ctxt'(_CallerModuleVar,28,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^mvd)(__X,parent,__newquantvar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,28)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar2,brother_in_law,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,28))),null,'_$_$_ergo''rule_enabled'(28,'family_obj.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(30,'family_obj.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,33,FLORA_THIS_WORKSPACE(d^mvd)(__X,aunt,__Y,'_$ctxt'(_CallerModuleVar,30,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^mvd)(__X,parent,__newquantvar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,30)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar2,sister,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,30))),null,'_$_$_ergo''rule_enabled'(30,'family_obj.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(32,'family_obj.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,34,FLORA_THIS_WORKSPACE(d^mvd)(__X,aunt,__Y,'_$ctxt'(_CallerModuleVar,32,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^mvd)(__X,parent,__newquantvar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,32)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar2,sister_in_law,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,32))),null,'_$_$_ergo''rule_enabled'(32,'family_obj.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(34,'family_obj.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,35,FLORA_THIS_WORKSPACE(d^mvd)(__X,ancestor,__Y,'_$ctxt'(_CallerModuleVar,34,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^mvd)(__X,parent,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,34)),null,'_$_$_ergo''rule_enabled'(34,'family_obj.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(36,'family_obj.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,36,FLORA_THIS_WORKSPACE(d^mvd)(__X,ancestor,__Y,'_$ctxt'(_CallerModuleVar,36,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^mvd)(__X,ancestor,__newquantvar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,36)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar2,ancestor,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,36))),null,'_$_$_ergo''rule_enabled'(36,'family_obj.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(38,'family_obj.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,37,FLORA_THIS_WORKSPACE(d^isa)(__X,illegitimate,'_$ctxt'(_CallerModuleVar,38,__newcontextvar1)),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__X,father,__F,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,38)),FLORA_THIS_WORKSPACE(d^mvd)(__X,mother,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,38))),','(FLORA_THIS_WORKSPACE(d^mvd)(__M,spouse,__S,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,38)),\=(__S,__F))),null,'_$_$_ergo''rule_enabled'(38,'family_obj.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__F,__M,__S,__X],[__X]),true)).


%%%%%%%%%%%%%%%%%%%%%%%%% Signatures for latent queries %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%% Queries found in the source file %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(FLORA_WORKSPACE(\\io,d^tblflapply)(writeln,'Q1','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^isa)(albert,__C,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar3)))),[=('?C',__C)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(FLORA_WORKSPACE(\\io,d^tblflapply)(writeln,'Q2','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1)),','(','(FLORA_THIS_WORKSPACE(d^mvdsig)(albert,__M,__newdontcarevar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^mvdcon)(albert,__M,1,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar6))),FLORA_THIS_WORKSPACE(d^mvd)(albert,__M,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar8))))),[=('?M',__M),=('?X',__X)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(FLORA_WORKSPACE(\\io,d^tblflapply)(writeln,'Q3','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^mvd)(albert,__M,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar3)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(','(FLORA_THIS_WORKSPACE(d^mvdsig)(albert,__M,__newdontcarevar5,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar6)),FLORA_THIS_WORKSPACE(d^mvdcon)(albert,__M,1,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar8))),fllibexecute_delayed_calls([__M],[]))),[],92,'family_obj.flr'))))),[=('?M',__M),=('?X',__X)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(FLORA_WORKSPACE(\\io,d^tblflapply)(writeln,'Q5','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1)),','(','(FLORA_THIS_WORKSPACE(d^mvdsig)(___o,__S,__newdontcarevar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^mvdcon)(___o,__S,1,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar6))),FLORA_THIS_WORKSPACE(d^mvd)(___o,__S,__newquantvar8,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar9))))),[=('?S',__S)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(FLORA_WORKSPACE(\\io,d^tblflapply)(writeln,'Q6','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^mvd)(___o,__M,__newquantvar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar4)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(','(FLORA_THIS_WORKSPACE(d^mvdsig)(___o,__M,__newdontcarevar6,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar7)),FLORA_THIS_WORKSPACE(d^mvdcon)(___o,__M,1,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar9))),fllibexecute_delayed_calls([__M,___o],[]))),[],96,'family_obj.flr'))))),[=('?M',__M)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(FLORA_WORKSPACE(\\io,d^tblflapply)(writeln,'Q7','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^exists)(__newdontcarevar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar6)),FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar3,__C,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar4))))),[=('?C',__C)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(FLORA_WORKSPACE(\\io,d^tblflapply)(writeln,'Q8','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1)),','(','(FLORA_THIS_WORKSPACE(d^mvd)(albert,parent,__newquantvar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar3,uncle,__newquantvar6,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar7))),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar6,sister_in_law,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar9))))),[=('?Y',__Y)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(FLORA_WORKSPACE(\\io,d^tblflapply)(writeln,'Q9','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^mvd)(__X,sister_in_law,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar3)))),[=('?X',__X),=('?Y',__Y)])).

 
#if !defined(FLORA_FLS2_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLS2_FILENAME  'family_obj.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('family_obj.ergo',FLORA_THIS_MODULE_NAME))).

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

