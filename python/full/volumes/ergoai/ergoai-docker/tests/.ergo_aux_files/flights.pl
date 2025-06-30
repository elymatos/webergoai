
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
   that exclude tabling non-signature frames
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
#define FLORA_THIS_FILENAME  'flights.ergo'
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
  file: syslibinc/flraggmax_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBMAX))).

/***********************************************************************/

 
#if !defined(FLORA_FDB_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FDB_FILENAME  'flights.fdb'
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
#define FLORA_FLM_FILENAME  'flights.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(flights,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'flights.fld'
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
#define FLORA_FLS_FILENAME  'flights.fls'
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

:-(FLORA_THIS_WORKSPACE(static^tblflapply)(passenger,__passengerName,'_$ctxt'(_CallerModuleVar,4,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(4,'flights.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)('Ticket',___ticketNum,__passengerName,___travelAgent,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,4)),fllibexecute_delayed_calls([___ticketNum,___travelAgent,__passengerName],[__passengerName])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(query1,__passengerName,'_$ctxt'(_CallerModuleVar,6,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(6,'flights.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(passenger,__passengerName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,6)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(','(FLORA_THIS_WORKSPACE(d^tblflapply)('Flight',__newquantvar10,'NYC','Seattle',__newquantvar5,__newquantvar4,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,6)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(','(FLORA_THIS_WORKSPACE(d^tblflapply)('Ticket',__newquantvar9,__passengerName,__newquantvar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,6)),FLORA_THIS_WORKSPACE(d^tblflapply)('Itinerary',__newquantvar9,__newquantvar10,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,6))),fllibexecute_delayed_calls([__newquantvar10,__newquantvar7,__newquantvar9,__passengerName],[]))),[__passengerName,__passengerName,__newquantvar10],56,'flights.ergo'))),fllibexecute_delayed_calls([__newquantvar10,__newquantvar4,__newquantvar5,__newquantvar7,__newquantvar9,__passengerName],[]))),[__passengerName,__passengerName,__passengerName,__passengerName,__passengerName],null,'flights.ergo'))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(query1_2,__passengerName,'_$ctxt'(_CallerModuleVar,8,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(8,'flights.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(passenger,__passengerName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,8)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(','(FLORA_THIS_WORKSPACE(d^tblflapply)('Flight',__newquantvar10,'NYC','Seattle',__newquantvar9,__newquantvar8,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,8)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(','(FLORA_THIS_WORKSPACE(d^tblflapply)('Ticket',__newquantvar6,__passengerName,__newquantvar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,8)),FLORA_THIS_WORKSPACE(d^tblflapply)('Itinerary',__newquantvar6,__newquantvar10,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,8))),fllibexecute_delayed_calls([__newquantvar10,__newquantvar6,__newquantvar7,__passengerName],[]))),[__passengerName,__newquantvar10],72,'flights.ergo'))),fllibexecute_delayed_calls([__newquantvar10,__newquantvar6,__newquantvar7,__newquantvar8,__newquantvar9,__passengerName],[]))),[__passengerName,__passengerName,__passengerName],70,'flights.ergo'))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(query1_3,__passengerName,'_$ctxt'(_CallerModuleVar,10,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(10,'flights.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(passenger,__passengerName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,10)),','(','(fllibcount(__newdontcarevar4,[],[],','(FLORA_THIS_WORKSPACE(d^tblflapply)('Flight',__newdontcarevar4,'NYC','Seattle',___departureDateTime,___arrivalDateTime,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,10)),fllibexecute_delayed_calls([___arrivalDateTime,___departureDateTime,__newdontcarevar4],[])),__newvar5),fllibcountdistinct(__newdontcarevar9,[],[],','(','(FLORA_THIS_WORKSPACE(d^tblflapply)('Flight',__newdontcarevar9,'NYC','Seattle',___departureDateTime,___arrivalDateTime,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,10)),','(FLORA_THIS_WORKSPACE(d^tblflapply)('Ticket',__ticketNum,__passengerName,___travelAgent,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,10)),FLORA_THIS_WORKSPACE(d^tblflapply)('Itinerary',__ticketNum,__newdontcarevar9,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,10)))),fllibexecute_delayed_calls([___arrivalDateTime,___departureDateTime,___travelAgent,__newdontcarevar9,__passengerName,__ticketNum],[])),__newvar10)),=(__newvar5,__newvar10))),fllibexecute_delayed_calls([___arrivalDateTime,___departureDateTime,___travelAgent,__passengerName,__ticketNum],[__passengerName])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(query2,__passengerName,'_$ctxt'(_CallerModuleVar,12,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(12,'flights.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(passenger,__passengerName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,12)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(','(FLORA_THIS_WORKSPACE(d^tblflapply)('Flight',__newquantvar10,'NYC','Seattle',__newquantvar5,__newquantvar4,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,12)),','(FLORA_THIS_WORKSPACE(d^tblflapply)('Ticket',__newquantvar8,__passengerName,__newquantvar9,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,12)),FLORA_THIS_WORKSPACE(d^tblflapply)('Itinerary',__newquantvar8,__newquantvar10,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,12)))),fllibexecute_delayed_calls([__newquantvar10,__newquantvar4,__newquantvar5,__newquantvar8,__newquantvar9,__passengerName],[]))),[__passengerName,__passengerName],null,'flights.ergo'))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(query2_2,__passengerName,'_$ctxt'(_CallerModuleVar,14,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(14,'flights.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(passenger,__passengerName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,14)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(','(FLORA_THIS_WORKSPACE(d^tblflapply)('Flight',__newquantvar10,'NYC','Seattle',__newquantvar9,__newquantvar8,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,14)),','(FLORA_THIS_WORKSPACE(d^tblflapply)('Ticket',__newquantvar6,__passengerName,__newquantvar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,14)),FLORA_THIS_WORKSPACE(d^tblflapply)('Itinerary',__newquantvar6,__newquantvar10,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,14)))),fllibexecute_delayed_calls([__newquantvar10,__newquantvar6,__newquantvar7,__newquantvar8,__newquantvar9,__passengerName],[]))),[__passengerName,__passengerName],117,'flights.ergo'))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(query2_3,__passengerName,'_$ctxt'(_CallerModuleVar,16,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(16,'flights.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(passenger,__passengerName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,16)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(','(FLORA_THIS_WORKSPACE(d^tblflapply)('Flight',__newquantvar8,'NYC','Seattle',__newquantvar7,__newquantvar6,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,16)),','(FLORA_THIS_WORKSPACE(d^tblflapply)('Ticket',__newquantvar9,__passengerName,__newquantvar10,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,16)),FLORA_THIS_WORKSPACE(d^tblflapply)('Itinerary',__newquantvar9,__newquantvar8,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,16)))),fllibexecute_delayed_calls([__newquantvar10,__newquantvar6,__newquantvar7,__newquantvar8,__newquantvar9,__passengerName],[]))),[__passengerName],132,'flights.ergo'))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(query2_4,__passengerName,'_$ctxt'(_CallerModuleVar,18,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(18,'flights.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(passenger,__passengerName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,18)),','(fllibcount(__newdontcarevar6,[],[],','(','(FLORA_THIS_WORKSPACE(d^tblflapply)('Flight',__newdontcarevar6,'NYC','Seattle',___departureDateTime,___arrivalDateTime,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,18)),','(FLORA_THIS_WORKSPACE(d^tblflapply)('Ticket',__ticketNum,__passengerName,___travelAgent,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,18)),FLORA_THIS_WORKSPACE(d^tblflapply)('Itinerary',__ticketNum,__newdontcarevar6,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,18)))),fllibexecute_delayed_calls([___arrivalDateTime,___departureDateTime,___travelAgent,__newdontcarevar6,__passengerName,__ticketNum],[])),__newvar7),=(__newvar7,0))),fllibexecute_delayed_calls([___arrivalDateTime,___departureDateTime,___travelAgent,__passengerName,__ticketNum],[__passengerName])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(travelAgent,__travelAgent,'_$ctxt'(_CallerModuleVar,20,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(20,'flights.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)('Ticket',___ticketNum,___passengerName,__travelAgent,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,20)),fllibexecute_delayed_calls([___passengerName,___ticketNum,__travelAgent],[__travelAgent])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(query3,__travelAgent,'_$ctxt'(_CallerModuleVar,22,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(22,'flights.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(travelAgent,__travelAgent,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,22)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(passenger,__newquantvar6,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,22)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)('Ticket',__newquantvar5,__newquantvar6,__travelAgent,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,22)),fllibexecute_delayed_calls([__newquantvar5,__newquantvar6,__travelAgent],[]))),[__newquantvar6,__travelAgent],163,'flights.ergo'))),fllibexecute_delayed_calls([__newquantvar5,__newquantvar6,__travelAgent],[]))),[__travelAgent,__travelAgent,__travelAgent],160,'flights.ergo'))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(query3_2,__travelAgent,'_$ctxt'(_CallerModuleVar,24,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(24,'flights.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(travelAgent,__travelAgent,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,24)),','(','(fllibcountdistinct(__newdontcarevar4,[],[],','(FLORA_THIS_WORKSPACE(d^tblflapply)(passenger,__newdontcarevar4,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,24)),fllibexecute_delayed_calls([__newdontcarevar4],[])),__newvar5),fllibcountdistinct(__newdontcarevar9,[],[],','(','(FLORA_THIS_WORKSPACE(d^tblflapply)('Flight',__flightNum,___start,___destination,___departureDateTime,___arrivalDateTime,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,24)),','(FLORA_THIS_WORKSPACE(d^tblflapply)('Ticket',__ticketNum,__newdontcarevar9,__travelAgent,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,24)),FLORA_THIS_WORKSPACE(d^tblflapply)('Itinerary',__ticketNum,__flightNum,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,24)))),fllibexecute_delayed_calls([___arrivalDateTime,___departureDateTime,___destination,___start,__flightNum,__newdontcarevar9,__ticketNum,__travelAgent],[])),__newvar10)),=(__newvar5,__newvar10))),fllibexecute_delayed_calls([___arrivalDateTime,___departureDateTime,___destination,___start,__flightNum,__ticketNum,__travelAgent],[__travelAgent])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(query3_3,__travelAgent,'_$ctxt'(_CallerModuleVar,26,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(26,'flights.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(travelAgent,__travelAgent,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,26)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(passenger,__newquantvar6,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,26)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)('Ticket',__newquantvar5,__newquantvar6,__travelAgent,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,26)),fllibexecute_delayed_calls([__newquantvar5,__newquantvar6,__travelAgent],[]))),[__newquantvar6,__travelAgent],189,'flights.ergo'))),fllibexecute_delayed_calls([__newquantvar5,__newquantvar6,__travelAgent],[]))),[__travelAgent,__travelAgent,__travelAgent],187,'flights.ergo'))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(query4,__travelAgent,'_$ctxt'(_CallerModuleVar,28,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(28,'flights.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(travelAgent,__travelAgent,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,28)),','(','(fllibcount(__newdontcarevar4,[__passengerName],[],','(FLORA_THIS_WORKSPACE(d^tblflapply)('Ticket',__newdontcarevar4,__passengerName,__travelAgent,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,28)),fllibexecute_delayed_calls([__passengerName,__newdontcarevar4,__travelAgent],[])),__newvar5),=(__N,__newvar5)),fllibdelayedliteral(>=,'flights.ergo',201,[__N,4]))),fllibexecute_delayed_calls([__N,__passengerName,__travelAgent],[__travelAgent])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(query5,__travelAgent,'_$ctxt'(_CallerModuleVar,30,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(30,'flights.ergo',FLORA_THIS_MODULE_NAME),','(','(','(fllibmax(__newdontcarevar5,[],[],','(','(fllibcount(__newdontcarevar3,[__travelAgent2],[],','(FLORA_THIS_WORKSPACE(d^tblflapply)('Ticket',__newdontcarevar3,___passengerName,__travelAgent2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,30)),fllibexecute_delayed_calls([___passengerName,__newdontcarevar3,__travelAgent2],[])),__newvar4),=(__newdontcarevar5,__newvar4)),fllibexecute_delayed_calls([__newdontcarevar5,___passengerName,__travelAgent2],[])),__newvar6),=(__Max,__newvar6)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(travelAgent,__travelAgent,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,30)),','(fllibcount(__newdontcarevar9,[],[],','(FLORA_THIS_WORKSPACE(d^tblflapply)('Ticket',__newdontcarevar9,___passengerName,__travelAgent,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,30)),fllibexecute_delayed_calls([___passengerName,__newdontcarevar9,__travelAgent],[])),__newvar10),=(__Max,__newvar10)))),fllibexecute_delayed_calls([__Max,___passengerName,__travelAgent,__travelAgent2],[__travelAgent])))).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rule signatures %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibinsrulesig(4,'flights.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,17,FLORA_THIS_WORKSPACE(d^tblflapply)(passenger,__passengerName,'_$ctxt'(_CallerModuleVar,4,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)('Ticket',___ticketNum,__passengerName,___travelAgent,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,4)),null,'_$_$_ergo''rule_enabled'(4,'flights.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([___ticketNum,___travelAgent,__passengerName],[__passengerName]),true)).
?-(fllibinsrulesig(6,'flights.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,18,FLORA_THIS_WORKSPACE(d^tblflapply)(query1,__passengerName,'_$ctxt'(_CallerModuleVar,6,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(passenger,__passengerName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,6)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(','(FLORA_THIS_WORKSPACE(d^tblflapply)('Flight',__newquantvar10,'NYC','Seattle',__newquantvar5,__newquantvar4,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,6)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(','(FLORA_THIS_WORKSPACE(d^tblflapply)('Ticket',__newquantvar9,__passengerName,__newquantvar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,6)),FLORA_THIS_WORKSPACE(d^tblflapply)('Itinerary',__newquantvar9,__newquantvar10,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,6))),fllibexecute_delayed_calls([__newquantvar10,__newquantvar7,__newquantvar9,__passengerName],[]))),[__passengerName,__passengerName,__newquantvar10],56,'flights.ergo'))),fllibexecute_delayed_calls([__newquantvar10,__newquantvar4,__newquantvar5,__newquantvar7,__newquantvar9,__passengerName],[]))),[__passengerName,__passengerName,__passengerName,__passengerName,__passengerName],null,'flights.ergo'))),null,'_$_$_ergo''rule_enabled'(6,'flights.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(8,'flights.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,19,FLORA_THIS_WORKSPACE(d^tblflapply)(query1_2,__passengerName,'_$ctxt'(_CallerModuleVar,8,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(passenger,__passengerName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,8)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(','(FLORA_THIS_WORKSPACE(d^tblflapply)('Flight',__newquantvar10,'NYC','Seattle',__newquantvar9,__newquantvar8,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,8)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(','(FLORA_THIS_WORKSPACE(d^tblflapply)('Ticket',__newquantvar6,__passengerName,__newquantvar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,8)),FLORA_THIS_WORKSPACE(d^tblflapply)('Itinerary',__newquantvar6,__newquantvar10,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,8))),fllibexecute_delayed_calls([__newquantvar10,__newquantvar6,__newquantvar7,__passengerName],[]))),[__passengerName,__newquantvar10],72,'flights.ergo'))),fllibexecute_delayed_calls([__newquantvar10,__newquantvar6,__newquantvar7,__newquantvar8,__newquantvar9,__passengerName],[]))),[__passengerName,__passengerName,__passengerName],70,'flights.ergo'))),null,'_$_$_ergo''rule_enabled'(8,'flights.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(10,'flights.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20,FLORA_THIS_WORKSPACE(d^tblflapply)(query1_3,__passengerName,'_$ctxt'(_CallerModuleVar,10,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(passenger,__passengerName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,10)),','(','(fllibcount(__newdontcarevar4,[],[],','(FLORA_THIS_WORKSPACE(d^tblflapply)('Flight',__newdontcarevar4,'NYC','Seattle',___departureDateTime,___arrivalDateTime,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,10)),fllibexecute_delayed_calls([___arrivalDateTime,___departureDateTime,__newdontcarevar4],[])),__newvar5),fllibcountdistinct(__newdontcarevar9,[],[],','(','(FLORA_THIS_WORKSPACE(d^tblflapply)('Flight',__newdontcarevar9,'NYC','Seattle',___departureDateTime,___arrivalDateTime,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,10)),','(FLORA_THIS_WORKSPACE(d^tblflapply)('Ticket',__ticketNum,__passengerName,___travelAgent,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,10)),FLORA_THIS_WORKSPACE(d^tblflapply)('Itinerary',__ticketNum,__newdontcarevar9,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,10)))),fllibexecute_delayed_calls([___arrivalDateTime,___departureDateTime,___travelAgent,__newdontcarevar9,__passengerName,__ticketNum],[])),__newvar10)),=(__newvar5,__newvar10))),null,'_$_$_ergo''rule_enabled'(10,'flights.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([___arrivalDateTime,___departureDateTime,___travelAgent,__passengerName,__ticketNum],[__passengerName]),true)).
?-(fllibinsrulesig(12,'flights.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,21,FLORA_THIS_WORKSPACE(d^tblflapply)(query2,__passengerName,'_$ctxt'(_CallerModuleVar,12,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(passenger,__passengerName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,12)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(','(FLORA_THIS_WORKSPACE(d^tblflapply)('Flight',__newquantvar10,'NYC','Seattle',__newquantvar5,__newquantvar4,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,12)),','(FLORA_THIS_WORKSPACE(d^tblflapply)('Ticket',__newquantvar8,__passengerName,__newquantvar9,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,12)),FLORA_THIS_WORKSPACE(d^tblflapply)('Itinerary',__newquantvar8,__newquantvar10,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,12)))),fllibexecute_delayed_calls([__newquantvar10,__newquantvar4,__newquantvar5,__newquantvar8,__newquantvar9,__passengerName],[]))),[__passengerName,__passengerName],null,'flights.ergo'))),null,'_$_$_ergo''rule_enabled'(12,'flights.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(14,'flights.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,22,FLORA_THIS_WORKSPACE(d^tblflapply)(query2_2,__passengerName,'_$ctxt'(_CallerModuleVar,14,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(passenger,__passengerName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,14)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(','(FLORA_THIS_WORKSPACE(d^tblflapply)('Flight',__newquantvar10,'NYC','Seattle',__newquantvar9,__newquantvar8,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,14)),','(FLORA_THIS_WORKSPACE(d^tblflapply)('Ticket',__newquantvar6,__passengerName,__newquantvar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,14)),FLORA_THIS_WORKSPACE(d^tblflapply)('Itinerary',__newquantvar6,__newquantvar10,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,14)))),fllibexecute_delayed_calls([__newquantvar10,__newquantvar6,__newquantvar7,__newquantvar8,__newquantvar9,__passengerName],[]))),[__passengerName,__passengerName],117,'flights.ergo'))),null,'_$_$_ergo''rule_enabled'(14,'flights.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(16,'flights.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,23,FLORA_THIS_WORKSPACE(d^tblflapply)(query2_3,__passengerName,'_$ctxt'(_CallerModuleVar,16,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(passenger,__passengerName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,16)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(','(FLORA_THIS_WORKSPACE(d^tblflapply)('Flight',__newquantvar8,'NYC','Seattle',__newquantvar7,__newquantvar6,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,16)),','(FLORA_THIS_WORKSPACE(d^tblflapply)('Ticket',__newquantvar9,__passengerName,__newquantvar10,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,16)),FLORA_THIS_WORKSPACE(d^tblflapply)('Itinerary',__newquantvar9,__newquantvar8,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,16)))),fllibexecute_delayed_calls([__newquantvar10,__newquantvar6,__newquantvar7,__newquantvar8,__newquantvar9,__passengerName],[]))),[__passengerName],132,'flights.ergo'))),null,'_$_$_ergo''rule_enabled'(16,'flights.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(18,'flights.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,24,FLORA_THIS_WORKSPACE(d^tblflapply)(query2_4,__passengerName,'_$ctxt'(_CallerModuleVar,18,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(passenger,__passengerName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,18)),','(fllibcount(__newdontcarevar6,[],[],','(','(FLORA_THIS_WORKSPACE(d^tblflapply)('Flight',__newdontcarevar6,'NYC','Seattle',___departureDateTime,___arrivalDateTime,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,18)),','(FLORA_THIS_WORKSPACE(d^tblflapply)('Ticket',__ticketNum,__passengerName,___travelAgent,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,18)),FLORA_THIS_WORKSPACE(d^tblflapply)('Itinerary',__ticketNum,__newdontcarevar6,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,18)))),fllibexecute_delayed_calls([___arrivalDateTime,___departureDateTime,___travelAgent,__newdontcarevar6,__passengerName,__ticketNum],[])),__newvar7),=(__newvar7,0))),null,'_$_$_ergo''rule_enabled'(18,'flights.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([___arrivalDateTime,___departureDateTime,___travelAgent,__passengerName,__ticketNum],[__passengerName]),true)).
?-(fllibinsrulesig(20,'flights.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,25,FLORA_THIS_WORKSPACE(d^tblflapply)(travelAgent,__travelAgent,'_$ctxt'(_CallerModuleVar,20,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)('Ticket',___ticketNum,___passengerName,__travelAgent,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,20)),null,'_$_$_ergo''rule_enabled'(20,'flights.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([___passengerName,___ticketNum,__travelAgent],[__travelAgent]),true)).
?-(fllibinsrulesig(22,'flights.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,26,FLORA_THIS_WORKSPACE(d^tblflapply)(query3,__travelAgent,'_$ctxt'(_CallerModuleVar,22,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(travelAgent,__travelAgent,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,22)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(passenger,__newquantvar6,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,22)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)('Ticket',__newquantvar5,__newquantvar6,__travelAgent,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,22)),fllibexecute_delayed_calls([__newquantvar5,__newquantvar6,__travelAgent],[]))),[__newquantvar6,__travelAgent],163,'flights.ergo'))),fllibexecute_delayed_calls([__newquantvar5,__newquantvar6,__travelAgent],[]))),[__travelAgent,__travelAgent,__travelAgent],160,'flights.ergo'))),null,'_$_$_ergo''rule_enabled'(22,'flights.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(24,'flights.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,27,FLORA_THIS_WORKSPACE(d^tblflapply)(query3_2,__travelAgent,'_$ctxt'(_CallerModuleVar,24,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(travelAgent,__travelAgent,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,24)),','(','(fllibcountdistinct(__newdontcarevar4,[],[],','(FLORA_THIS_WORKSPACE(d^tblflapply)(passenger,__newdontcarevar4,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,24)),fllibexecute_delayed_calls([__newdontcarevar4],[])),__newvar5),fllibcountdistinct(__newdontcarevar9,[],[],','(','(FLORA_THIS_WORKSPACE(d^tblflapply)('Flight',__flightNum,___start,___destination,___departureDateTime,___arrivalDateTime,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,24)),','(FLORA_THIS_WORKSPACE(d^tblflapply)('Ticket',__ticketNum,__newdontcarevar9,__travelAgent,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,24)),FLORA_THIS_WORKSPACE(d^tblflapply)('Itinerary',__ticketNum,__flightNum,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,24)))),fllibexecute_delayed_calls([___arrivalDateTime,___departureDateTime,___destination,___start,__flightNum,__newdontcarevar9,__ticketNum,__travelAgent],[])),__newvar10)),=(__newvar5,__newvar10))),null,'_$_$_ergo''rule_enabled'(24,'flights.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([___arrivalDateTime,___departureDateTime,___destination,___start,__flightNum,__ticketNum,__travelAgent],[__travelAgent]),true)).
?-(fllibinsrulesig(26,'flights.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,28,FLORA_THIS_WORKSPACE(d^tblflapply)(query3_3,__travelAgent,'_$ctxt'(_CallerModuleVar,26,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(travelAgent,__travelAgent,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,26)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(passenger,__newquantvar6,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,26)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)('Ticket',__newquantvar5,__newquantvar6,__travelAgent,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,26)),fllibexecute_delayed_calls([__newquantvar5,__newquantvar6,__travelAgent],[]))),[__newquantvar6,__travelAgent],189,'flights.ergo'))),fllibexecute_delayed_calls([__newquantvar5,__newquantvar6,__travelAgent],[]))),[__travelAgent,__travelAgent,__travelAgent],187,'flights.ergo'))),null,'_$_$_ergo''rule_enabled'(26,'flights.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(28,'flights.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,29,FLORA_THIS_WORKSPACE(d^tblflapply)(query4,__travelAgent,'_$ctxt'(_CallerModuleVar,28,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(travelAgent,__travelAgent,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,28)),','(','(fllibcount(__newdontcarevar4,[__passengerName],[],','(FLORA_THIS_WORKSPACE(d^tblflapply)('Ticket',__newdontcarevar4,__passengerName,__travelAgent,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,28)),fllibexecute_delayed_calls([__passengerName,__newdontcarevar4,__travelAgent],[])),__newvar5),=(__N,__newvar5)),fllibdelayedliteral(>=,'flights.ergo',201,[__N,4]))),null,'_$_$_ergo''rule_enabled'(28,'flights.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__N,__passengerName,__travelAgent],[__travelAgent]),true)).
?-(fllibinsrulesig(30,'flights.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,30,FLORA_THIS_WORKSPACE(d^tblflapply)(query5,__travelAgent,'_$ctxt'(_CallerModuleVar,30,__newcontextvar1)),','(','(fllibmax(__newdontcarevar5,[],[],','(','(fllibcount(__newdontcarevar3,[__travelAgent2],[],','(FLORA_THIS_WORKSPACE(d^tblflapply)('Ticket',__newdontcarevar3,___passengerName,__travelAgent2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,30)),fllibexecute_delayed_calls([___passengerName,__newdontcarevar3,__travelAgent2],[])),__newvar4),=(__newdontcarevar5,__newvar4)),fllibexecute_delayed_calls([__newdontcarevar5,___passengerName,__travelAgent2],[])),__newvar6),=(__Max,__newvar6)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(travelAgent,__travelAgent,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,30)),','(fllibcount(__newdontcarevar9,[],[],','(FLORA_THIS_WORKSPACE(d^tblflapply)('Ticket',__newdontcarevar9,___passengerName,__travelAgent,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,30)),fllibexecute_delayed_calls([___passengerName,__newdontcarevar9,__travelAgent],[])),__newvar10),=(__Max,__newvar10)))),null,'_$_$_ergo''rule_enabled'(30,'flights.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Max,___passengerName,__travelAgent,__travelAgent2],[__travelAgent]),true)).


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
#define FLORA_FLS2_FILENAME  'flights.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('flights.ergo',FLORA_THIS_MODULE_NAME))).

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

