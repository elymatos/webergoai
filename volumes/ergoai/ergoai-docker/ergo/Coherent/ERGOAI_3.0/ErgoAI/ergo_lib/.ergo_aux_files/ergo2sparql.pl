
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
#define FLORA_THIS_FILENAME  'ergo2sparql.ergo'
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

 
#if !defined(FLORA_FLM_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLM_FILENAME  'ergo2sparql.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(ergo2sparql,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'ergo2sparql.fld'
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
#define FLORA_FLS_FILENAME  'ergo2sparql.fls'
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

:-(fllibexport([[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar1,flapply(open,__newdontcarevar2,__newdontcarevar3,__newdontcarevar4,__newdontcarevar5),__newcontextvar8))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar9,flapply(close,__newdontcarevar10),__newcontextvar13))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar14,flapply(connectionType,__newdontcarevar15),__newdontcarevar16,__newcontextvar19))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar20,flapply(connectionURL,__newdontcarevar21),__newdontcarevar22,__newcontextvar25))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar26,flapply(select,__newdontcarevar27,__newdontcarevar28),__newdontcarevar29,__newcontextvar32))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar33,flapply(selectAll,__newdontcarevar34,__newdontcarevar35),__newdontcarevar36,__newcontextvar39))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar40,flapply(construct,__newdontcarevar41,__newdontcarevar42),__newdontcarevar43,__newcontextvar46))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar47,flapply(constructAll,__newdontcarevar48,__newdontcarevar49),__newdontcarevar50,__newcontextvar53))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar54,flapply(ask,__newdontcarevar55,__newdontcarevar56),__newcontextvar59))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar60,flapply(describe,__newdontcarevar61,__newdontcarevar62),__newdontcarevar63,__newcontextvar66))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar67,flapply(describeAll,__newdontcarevar68,__newdontcarevar69),__newdontcarevar70,__newcontextvar73))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar74,flapply(update,__newdontcarevar75,__newdontcarevar76),__newcontextvar79))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(ensure_loaded,__newcontextvar82))]])).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(initialize,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(4,'ergo2sparql.ergo',FLORA_THIS_MODULE_NAME),','(','(:(flrporting,flora_install_dir(__ErgoDir)),','(:(flrporting,flora_slash(__S)),','(:(flrporting,flora_concat_atoms([__ErgoDir,__S,ergosuite,__S,jena,__S,'JenaAllInOne.jar'],___JenaJar)),','(:(flrporting,flora_concat_atoms([__ErgoDir,__S,ergo_lib,__S,ergo2sparql],__E2Sdir)),','(:(flrporting,flora_concat_atoms([__E2Sdir,__S,java,__S,'ergoSPARQL.jar'],___SparqlJar)),','(FLORA_WORKSPACE(\\e2j,d^tblflapply)(ensure_loaded,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_WORKSPACE(\\system,d^meth)('Libpath',flapply(add,__E2Sdir),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),fllibload([ergo_sparql],'/home/kifer/ERGOAI/ErgoEngine/ErgoAI/ergo_lib/ergo2sparql.ergo',FLORA_THIS_MODULE_NAME,[68,9])))))))),fllibexecute_delayed_calls([__E2Sdir,__ErgoDir,__S,___JenaJar,___SparqlJar],[])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(initialize,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(6,'ergo2sparql.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(ensure_loaded,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(8,'ergo2sparql.ergo',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(static^meth)('System',flapply(open,flapply(__Type,__ConnectionId),__EndpointURL,__Username,__Password),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(10,'ergo2sparql.ergo',FLORA_THIS_MODULE_NAME),','(:(usermod,atom(__Type)),','(:(flrsetops,flora_list_member(__Type,[query,update])),','(:(usermod,atom(__ConnectionId)),','(!,:(ergo_sparql,sparqlOpen(__Type,__ConnectionId,__EndpointURL,__Username,__Password)))))))).
:-(FLORA_THIS_WORKSPACE(static^meth)('System',flapply(open,__ConnectionId,__EndpointURL,__Username,__Password),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(12,'ergo2sparql.ergo',FLORA_THIS_MODULE_NAME),','(:(usermod,atom(__ConnectionId)),','(!,:(ergo_sparql,sparqlOpen(query,__ConnectionId,__EndpointURL,__Username,__Password)))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)('System',flapply(connectionType,__ConnectionId),__Type,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(14,'ergo2sparql.ergo',FLORA_THIS_MODULE_NAME),','(:(usermod,atom(__ConnectionId)),','(!,:(ergo_sparql,sparqlConnectionType(__ConnectionId,__Type)))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)('System',flapply(connectionURL,__ConnectionId),__URL,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(16,'ergo2sparql.ergo',FLORA_THIS_MODULE_NAME),','(:(usermod,atom(__ConnectionId)),','(!,:(ergo_sparql,sparqlConnectionURL(__ConnectionId,__URL)))))).
:-(FLORA_THIS_WORKSPACE(static^meth)('System',flapply(close,__ConnectionId),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(18,'ergo2sparql.ergo',FLORA_THIS_MODULE_NAME),:(ergo_sparql,sparqlClose(__ConnectionId)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)('Query',flapply(select,__ConnectionId,__QueryList),__Result,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(20,'ergo2sparql.ergo',FLORA_THIS_MODULE_NAME),','(','(:(ergo_sparql,prepareSparqlQuery(__QueryList,__Query)),:(ergo_sparql,sparqlSelect(__ConnectionId,__Query,__Result))),fllibexecute_delayed_calls([__ConnectionId,__Query,__QueryList,__Result],[__ConnectionId,__QueryList,__Result])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)('Query',flapply(selectAll,__ConnectionId,__QueryList),__ResultList,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(22,'ergo2sparql.ergo',FLORA_THIS_MODULE_NAME),','(','(:(ergo_sparql,prepareSparqlQuery(__QueryList,__Query)),:(ergo_sparql,sparqlSelectAll(__ConnectionId,__Query,__ResultList))),fllibexecute_delayed_calls([__ConnectionId,__Query,__QueryList,__ResultList],[__ConnectionId,__QueryList,__ResultList])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)('Query',flapply(construct,__ConnectionId,__QueryList),__Result,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(24,'ergo2sparql.ergo',FLORA_THIS_MODULE_NAME),','(','(:(ergo_sparql,prepareSparqlQuery(__QueryList,__Query)),:(ergo_sparql,sparqlConstruct(__ConnectionId,__Query,__Result))),fllibexecute_delayed_calls([__ConnectionId,__Query,__QueryList,__Result],[__ConnectionId,__QueryList,__Result])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)('Query',flapply(constructAll,__ConnectionId,__QueryList),__ResultList,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(26,'ergo2sparql.ergo',FLORA_THIS_MODULE_NAME),','(','(:(ergo_sparql,prepareSparqlQuery(__QueryList,__Query)),:(ergo_sparql,sparqlConstructAll(__ConnectionId,__Query,__ResultList))),fllibexecute_delayed_calls([__ConnectionId,__Query,__QueryList,__ResultList],[__ConnectionId,__QueryList,__ResultList])))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Query',flapply(ask,__ConnectionId,__QueryList),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(28,'ergo2sparql.ergo',FLORA_THIS_MODULE_NAME),','(','(:(ergo_sparql,prepareSparqlQuery(__QueryList,__Query)),:(ergo_sparql,sparqlAsk(__ConnectionId,__Query))),fllibexecute_delayed_calls([__ConnectionId,__Query,__QueryList],[__ConnectionId,__QueryList])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)('Query',flapply(describe,__ConnectionId,__QueryList),__Result,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(30,'ergo2sparql.ergo',FLORA_THIS_MODULE_NAME),','(','(:(ergo_sparql,prepareSparqlQuery(__QueryList,__Query)),:(ergo_sparql,sparqlDescribe(__ConnectionId,__Query,__Result))),fllibexecute_delayed_calls([__ConnectionId,__Query,__QueryList,__Result],[__ConnectionId,__QueryList,__Result])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)('Query',flapply(describeAll,__ConnectionId,__QueryList),__ResultList,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(32,'ergo2sparql.ergo',FLORA_THIS_MODULE_NAME),','(','(:(ergo_sparql,prepareSparqlQuery(__QueryList,__Query)),:(ergo_sparql,sparqlDescribeAll(__ConnectionId,__Query,__ResultList))),fllibexecute_delayed_calls([__ConnectionId,__Query,__QueryList,__ResultList],[__ConnectionId,__QueryList,__ResultList])))).
:-(FLORA_THIS_WORKSPACE(static^meth)('Query',flapply(update,__ConnectionId,__UpdateList),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(34,'ergo2sparql.ergo',FLORA_THIS_MODULE_NAME),','(','(:(ergo_sparql,prepareSparqlQuery(__UpdateList,__Update)),:(ergo_sparql,sparqlUpdate(__ConnectionId,__Update))),fllibexecute_delayed_calls([__ConnectionId,__Update,__UpdateList],[__ConnectionId,__UpdateList])))).

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
#define FLORA_FLS2_FILENAME  'ergo2sparql.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('ergo2sparql.ergo',FLORA_THIS_MODULE_NAME))).

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

