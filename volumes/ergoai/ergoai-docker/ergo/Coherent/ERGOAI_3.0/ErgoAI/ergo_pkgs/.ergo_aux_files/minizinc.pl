
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
#define FLORA_THIS_FILENAME  'minizinc.ergo'
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

 
#if !defined(FLORA_FLM_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLM_FILENAME  'minizinc.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(minizinc,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'minizinc.fld'
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
#define FLORA_FLS_FILENAME  'minizinc.fls'
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

:-(fllibexport([[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(show,__newdontcarevar1,__newcontextvar4))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(delete,__newdontcarevar5,__newcontextvar8))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(keep_tmpfiles,__newcontextvar11))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(show_mzn_cmd,__newcontextvar14))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(dbg_clear,__newcontextvar17))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(solve,__newdontcarevar18,__newdontcarevar19,__newdontcarevar20,__newdontcarevar21,__newdontcarevar22,__newdontcarevar23,__newdontcarevar24,__newdontcarevar25,__newcontextvar28))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^tblflapply)(solve_flex,__newdontcarevar29,__newdontcarevar30,__newdontcarevar31,__newdontcarevar32,__newdontcarevar33,__newdontcarevar34,__newdontcarevar35,__newdontcarevar36,__newcontextvar39))]])).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(solve,__MZNFile,__DataFileList,__InParams,__Solver,__NumSolutions,__OutTemplate,__Result,__Exceptions,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(4,'minizinc.ergo',FLORA_THIS_MODULE_NAME),','(','(flora_plg2hlg(__InParamsPlg,__InParams,flapply,1),','(flora_plg2hlg(__OutTemplatePlg,__OutTemplate,flapply,1),','(fllibifthen(FLORA_THIS_MODULE_NAME,:(flrdatatype,flora_is_nonvar_prim(__Result)),flora_plg2hlg(__ResultPlg,__Result,flapply,1),42,'minizinc.ergo'),','(:(minizinc,solve(__MZNFile,__DataFileList,__InParamsPlg,__Solver,__NumSolutions,__OutTemplatePlg,__ResultPlg,__ExceptionsPlg)),','(flora_plg2hlg(__ResultPlg,__Result,flapply,1),flora_plg2hlg(__ExceptionsPlg,__Exceptions,flapply,1)))))),fllibexecute_delayed_calls([__DataFileList,__Exceptions,__ExceptionsPlg,__InParams,__InParamsPlg,__MZNFile,__NumSolutions,__OutTemplate,__OutTemplatePlg,__Result,__ResultPlg,__Solver],[__DataFileList,__Exceptions,__InParams,__MZNFile,__NumSolutions,__OutTemplate,__Result,__Solver])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(solve_flex,__MZNFile,__DataFileList,__InParams,__Solver,__NumSolutions,__OutTemplate,__Result,__Exceptions,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(6,'minizinc.ergo',FLORA_THIS_MODULE_NAME),fllibdelayedliteral('_$_$_ergo''delay_quantifier','minizinc.ergo',49,[must,','(ground(__InParams),ground(__OutTemplate)),FLORA_THIS_WORKSPACE(d^tblflapply)(solve,__MZNFile,__DataFileList,__InParams,__Solver,__NumSolutions,__OutTemplate,__Result,__Exceptions,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))]))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(show,__X,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(8,'minizinc.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibifthen(FLORA_THIS_MODULE_NAME,:(flrdatatype,flora_is_nonvar_prim(__X)),flora_plg2hlg(__Y,__X,flapply,1),56,'minizinc.ergo'),','(:(minizinc,show(__Y)),flora_plg2hlg(__Y,__X,flapply,1))),fllibexecute_delayed_calls([__X,__Y],[__X])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(delete,__X,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(10,'minizinc.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibifthen(FLORA_THIS_MODULE_NAME,:(flrdatatype,flora_is_nonvar_prim(__X)),flora_plg2hlg(__Y,__X,flapply,1),62,'minizinc.ergo'),:(minizinc,delete(__Y))),fllibexecute_delayed_calls([__X,__Y],[__X])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(keep_tmpfiles,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(12,'minizinc.ergo',FLORA_THIS_MODULE_NAME),:(minizinc,keep_tmpfiles))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(show_mzn_cmd,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(14,'minizinc.ergo',FLORA_THIS_MODULE_NAME),:(minizinc,show_mzn_cmd))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(dbg_clear,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(16,'minizinc.ergo',FLORA_THIS_MODULE_NAME),:(minizinc,dbg_clear))).

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
#define FLORA_FLS2_FILENAME  'minizinc.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('minizinc.ergo',FLORA_THIS_MODULE_NAME))).

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

