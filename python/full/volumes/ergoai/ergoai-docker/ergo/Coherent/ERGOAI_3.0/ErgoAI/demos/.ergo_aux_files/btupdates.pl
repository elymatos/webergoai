
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
#define FLORA_THIS_FILENAME  'btupdates.ergo'
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
  file: syslibinc/flrbtdbop_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBBTDBOP))).

/***********************************************************************/

/************************************************************************
  file: syslibinc/flrbtdbop_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBBTDBOP))).

/***********************************************************************/

/************************************************************************
  file: syslibinc/flrbtdbop_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBBTDBOP))).

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

 
#if !defined(FLORA_FDB_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FDB_FILENAME  'btupdates.fdb'
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
#define FLORA_FLM_FILENAME  'btupdates.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(btupdates,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'btupdates.fld'
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
#define FLORA_FLS_FILENAME  'btupdates.fls'
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

:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(rr,2010,'_$ctxt'(_CallerModuleVar,4,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(4,'btupdates.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(true,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,4)))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(rr,3000,'_$ctxt'(_CallerModuleVar,6,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(6,'btupdates.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(true,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,6)))).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rule signatures %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibinsrulesig(4,'btupdates.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,34,FLORA_THIS_WORKSPACE(d^nontblflapply)(rr,2010,'_$ctxt'(_CallerModuleVar,4,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(true,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,4)),null,'_$_$_ergo''rule_enabled'(4,'btupdates.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(6,'btupdates.flr','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,35,FLORA_THIS_WORKSPACE(d^nontblflapply)(rr,3000,'_$ctxt'(_CallerModuleVar,6,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(true,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,6)),null,'_$_$_ergo''rule_enabled'(6,'btupdates.flr',FLORA_THIS_MODULE_NAME),null,true)).


%%%%%%%%%%%%%%%%%%%%%%%%% Signatures for latent queries %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%% Queries found in the source file %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),fllibload([>>(module2,mod2)],'/home/kifer/ERGOAI/ErgoEngine/ErgoAI/demos/btupdates.flr',FLORA_THIS_MODULE_NAME,[4,4])),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),writeln('Query 1 begins')),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(fllibbtinsert(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(mvd)(a,f,d,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar1,__newcontextvar2)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),','(fllibbtdelete(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(mvd)(a,f,b,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar3)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),','(fllibdelete(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_WORKSPACE(mod2,mvd)(mary,flapply(salary,1990),__newdontcarevar5,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar6)),FLORA_FDB_STORAGE(mod2),mod2)]),','(fllibbtdelete(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_WORKSPACE(mod2,mvd)(mary,flapply(salary,___X),__newdontcarevar8,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar9)),FLORA_FDB_STORAGE(mod2),mod2)],';'(=(___X,1991),';'(=(___X,1992),=(___X,1993)))),FLORA_THIS_WORKSPACE(d^tblflapply)(fail,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar11))))))),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(writeln('After the no-effect query:'),FLORA_THIS_WORKSPACE(d^mvd)(a,f,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1)))),[=('?X',__X)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_WORKSPACE(mod2,d^mvd)(mary,flapply(salary,__Y),__V,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[=('?Y',__Y),=('?V',__V)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),writeln('Query 2 begins')),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(fllibbtinsert(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(mvd)(a,f,d,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar1,__newcontextvar2)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),','(fllibbtdelete(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(mvd)(a,f,b,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar3)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),fllibbtdelete(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_WORKSPACE(mod2,mvd)(mary,flapply(salary,___X),__newdontcarevar5,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar6)),FLORA_FDB_STORAGE(mod2),mod2)],';'(=(___X,1991),';'(=(___X,1992),=(___X,1993))))))),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(writeln('After query2:'),FLORA_THIS_WORKSPACE(d^mvd)(a,f,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1)))),[=('?X',__X)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_WORKSPACE(mod2,d^mvd)(mary,flapply(salary,__Y),__V,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[=('?Y',__Y),=('?V',__V)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),writeln('Query 3 begins')),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(fllibbtinsert(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(mvd)(a,f,e,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar1,__newcontextvar2)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),','(';'(','(fllibbtdeleteall(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(mvd)(a,f,___X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar3)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),FLORA_THIS_WORKSPACE(d^tblflapply)(fail,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar5))),fllibbtdelete(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(mvd)(a,f,e,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar7)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)])),','(fllibbtinsert(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(mvd)(a,f,f,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar9,__newcontextvar10)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),','(fllibbtdeleteall(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_WORKSPACE(mod2,mvd)(mary,flapply(salary,___XX),__newdontcarevar11,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar12)),FLORA_FDB_STORAGE(mod2),mod2)],';'(=(___XX,1991),';'(=(___XX,1992),=(___XX,1993)))),fllibbtinsert(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_WORKSPACE(mod2,mvd)(mary,flapply(salary,1999),100,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar14,__newcontextvar15)),FLORA_FDB_STORAGE(mod2),mod2)])))))),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(writeln('After query3:'),FLORA_THIS_WORKSPACE(d^mvd)(a,f,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1)))),[=('?X',__X)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_WORKSPACE(mod2,d^mvd)(mary,flapply(salary,__Y),__V,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[=('?Y',__Y),=('?V',__V)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),writeln('Query 4 begins')),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(p,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1)),fllibbtdelete(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_WORKSPACE(mod2,mvd)(mary,flapply(salary,__Y),__V,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar3)),FLORA_FDB_STORAGE(mod2),mod2)]))),[=('?Y',__Y),=('?V',__V)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(writeln('After query4:'),FLORA_WORKSPACE(mod2,d^mvd)(mary,flapply(salary,__Y),__V,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1)))),[=('?Y',__Y),=('?V',__V)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),writeln('Query 5 begins')),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^nontblflapply)(q,__Y,__S,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1)),fllibbtinsert(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_WORKSPACE(mod2,mvd)(mary,flapply(salary,__Y),__S,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar3,__newcontextvar4)),FLORA_FDB_STORAGE(mod2),mod2)]),61,'btupdates.flr')),[=('?Y',__Y),=('?S',__S)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(writeln('After query5:'),FLORA_WORKSPACE(mod2,d^mvd)(mary,flapply(salary,__Y),__V,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1)))),[=('?Y',__Y),=('?V',__V)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),writeln('Query 6 begins')),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),fllibinsert(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_WORKSPACE(mod2,mvd)(mary,flapply(salary,2010),200,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar1,__newcontextvar2)),FLORA_FDB_STORAGE(mod2),mod2)])),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^nontblflapply)(rr,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1)),fllibbtdelete(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_WORKSPACE(mod2,mvd)(mary,flapply(salary,__Y),__newdontcarevar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar4)),FLORA_FDB_STORAGE(mod2),mod2)]),72,'btupdates.flr')),[=('?Y',__Y)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(writeln('After query6:'),FLORA_WORKSPACE(mod2,d^mvd)(mary,flapply(salary,__Y),__V,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1)))),[=('?Y',__Y),=('?V',__V)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),writeln('Query 7 begins')),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),fllibdountil(FLORA_THIS_MODULE_NAME,fllibbtdelete(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_WORKSPACE(mod2,mvd)(mary,flapply(salary,___Y),___S,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1)),FLORA_FDB_STORAGE(mod2),mod2)]),','(fllibcount(__newdontcarevar7,[],[],','(FLORA_WORKSPACE(mod2,d^mvd)(mary,flapply(salary,__newdontcarevar7),__newdontcarevar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar4)),fllibexecute_delayed_calls([__newdontcarevar6,__newdontcarevar7],[])),__newvar8),fllibdelayedliteral(>,'btupdates.flr',87,[3,__newvar8])),86,'btupdates.flr')),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(writeln('After query7:'),FLORA_WORKSPACE(mod2,d^mvd)(mary,flapply(salary,__Y),__V,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1)))),[=('?Y',__Y),=('?V',__V)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),writeln('Query 8 begins')),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),fllibinsert(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_WORKSPACE(mod2,mvd)(mary,flapply(salary,1999),99,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar1,__newcontextvar2)),FLORA_FDB_STORAGE(mod2),mod2),flsysdbupdate(FLORA_WORKSPACE(mod2,mvd)(mary,flapply(salary,1998),88,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar3,__newcontextvar4)),FLORA_FDB_STORAGE(mod2),mod2)])),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),fllibdountil(FLORA_THIS_MODULE_NAME,fllibbtdelete(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_WORKSPACE(mod2,mvd)(mary,flapply(salary,__Y),__S,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1)),FLORA_FDB_STORAGE(mod2),mod2)]),','(fllibcount(__newdontcarevar7,[],[],','(FLORA_WORKSPACE(mod2,d^mvd)(mary,flapply(salary,__newdontcarevar7),__newdontcarevar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar4)),fllibexecute_delayed_calls([__newdontcarevar7,__newdontcarevar6],[])),__newvar8),fllibdelayedliteral(>,'btupdates.flr',101,[3,__newvar8])),100,'btupdates.flr')),[=('?Y',__Y),=('?S',__S)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(writeln('After query8:'),FLORA_WORKSPACE(mod2,d^mvd)(mary,flapply(salary,__Y),__V,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1)))),[=('?Y',__Y),=('?V',__V)])).

 
#if !defined(FLORA_FLS2_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLS2_FILENAME  'btupdates.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('btupdates.ergo',FLORA_THIS_MODULE_NAME))).

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

