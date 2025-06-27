
:-(compiler_options([xpp_on,canonical])).

/********** Tabling and Trailer Control Variables ************/

#define EQUALITYnone
#define INHERITANCEflogic
#define TABLINGreactive
#define TABLINGvariant
#define CUSTOMnone

#define FLORA_INCREMENTAL_TABLING 

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
#define FLORA_THIS_FILENAME  'flrbasetype.ergo'
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
  file: syslibinc/flrerrhandler_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBERRHANDLER))).

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
  file: libinc/flrbasetype_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(':'(flrlibman,flora_load_system_module(FLSYSMODBASETYPE))).

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

:-(dynamic(as(','(/(FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(class_type_error)),3),/(FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(class_type_error)),3)),opaque))).
:-(FLORA_THIS_WORKSPACE(class_type_error)(_h2259082,_h2259084,FWContext),FLORA_THIS_WORKSPACE(FLDYNAPREFIX_UNQ(class_type_error))(_h2259082,_h2259084,FWContext)).
 
#if !defined(FLORA_FDB_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FDB_FILENAME  'flrbasetype.fdb'
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
#define FLORA_FLM_FILENAME  'flrbasetype.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(flrbasetype,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'flrbasetype.fld'
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
#define FLORA_FLS_FILENAME  'flrbasetype.fls'
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

?-(:(flrprolog,flora_define_modular_prolog([prolog(class_type_error,2,FLORA_THIS_MODULE_NAME)]))).
:-(fllibexport([[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar1,rawValue,__newdontcarevar2,__newcontextvar5))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar6,typeName,__newdontcarevar7,__newcontextvar10))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar11,flapply(equals,__newdontcarevar12),__newcontextvar15))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar16,flapply(isTypeOf,__newdontcarevar17),__newcontextvar20))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar21,flapply(lessThan,__newdontcarevar22),__newcontextvar25))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar26,flapply(lessEq,__newdontcarevar27),__newcontextvar30))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar31,flapply(gt,__newdontcarevar32),__newcontextvar35))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar36,flapply(gtEq,__newdontcarevar37),__newcontextvar40))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar41,flapply(add,__newdontcarevar42),__newdontcarevar43,__newcontextvar46))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar47,inverse,__newdontcarevar48,__newcontextvar51))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar52,flapply(toType,__newdontcarevar53),__newdontcarevar54,__newcontextvar57))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar58,flapply(toType,__newdontcarevar59,__newdontcarevar60),__newdontcarevar61,__newcontextvar64))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar65,flapply(toType,__newdontcarevar66,__newdontcarevar67,__newdontcarevar68,__newdontcarevar69,__newdontcarevar70,__newdontcarevar71),__newdontcarevar72,__newcontextvar75))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar76,flapply(toType,__newdontcarevar77,__newdontcarevar78,__newdontcarevar79,__newdontcarevar80,__newdontcarevar81,__newdontcarevar82,__newdontcarevar83),__newdontcarevar84,__newcontextvar87))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar88,flapply(toType,__newdontcarevar89,__newdontcarevar90,__newdontcarevar91,__newdontcarevar92,__newdontcarevar93,__newdontcarevar94,__newdontcarevar95,__newdontcarevar96,__newdontcarevar97,__newdontcarevar98),__newdontcarevar99,__newcontextvar102))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar103,flapply(toDateTime,__newdontcarevar104,__newdontcarevar105,__newdontcarevar106),__newdontcarevar107,__newcontextvar110))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar111,flapply(toDateTime,__newdontcarevar112),__newdontcarevar113,__newcontextvar116))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar117,toDate,__newdontcarevar118,__newcontextvar121))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar122,monthend,__newdontcarevar123,__newcontextvar126))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar127,monthstart,__newdontcarevar128,__newcontextvar131))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar132,flapply(days_until,__newdontcarevar133),__newdontcarevar134,__newcontextvar137))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar138,date,__newdontcarevar139,__newcontextvar142))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar143,time,__newdontcarevar144,__newcontextvar147))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar148,flapply(nextday,__newdontcarevar149),__newdontcarevar150,__newcontextvar153))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar154,flapply(nextmonth,__newdontcarevar155),__newdontcarevar156,__newcontextvar159))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar160,flapply(nextyear,__newdontcarevar161),__newdontcarevar162,__newcontextvar165))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar166,flapply(nexthour,__newdontcarevar167),__newdontcarevar168,__newcontextvar171))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar172,flapply(nextminute,__newdontcarevar173),__newdontcarevar174,__newcontextvar177))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar178,flapply(nextsecond,__newdontcarevar179),__newdontcarevar180,__newcontextvar183))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar184,flapply(minus,__newdontcarevar185),__newdontcarevar186,__newcontextvar189))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar190,now,__newdontcarevar191,__newcontextvar194))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar195,flapply(now,__newdontcarevar196),__newdontcarevar197,__newcontextvar200))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar201,hour,__newdontcarevar202,__newcontextvar205))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar206,minute,__newdontcarevar207,__newcontextvar210))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar211,second,__newdontcarevar212,__newcontextvar215))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar216,dateSign,__newdontcarevar217,__newcontextvar220))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar221,year,__newdontcarevar222,__newcontextvar225))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar226,month,__newdontcarevar227,__newcontextvar230))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar231,day,__newdontcarevar232,__newcontextvar235))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar236,zoneSign,__newdontcarevar237,__newcontextvar240))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar241,zoneHour,__newdontcarevar242,__newcontextvar245))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar246,zoneMinute,__newdontcarevar247,__newcontextvar250))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar251,localtime,__newdontcarevar252,__newcontextvar255))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar256,flapply(toUTC,__newdontcarevar257,__newdontcarevar258),__newdontcarevar259,__newcontextvar262))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar263,islocaltime,__newcontextvar266))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar267,flapply(toTZ,__newdontcarevar268,__newdontcarevar269),__newdontcarevar270,__newcontextvar273))]])).
:-(fllibexport([[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar1,weekend,__newdontcarevar11,__newcontextvar17)),flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar1,weekstart,__newdontcarevar8,__newcontextvar16)),flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar1,weeknum,__newdontcarevar5,__newcontextvar15)),flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar1,weekday,__newdontcarevar2,__newcontextvar14))]])).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)('\\opaqueJustification',__newdontcarevar1,__newvar2,'_$ctxt'(_CallerModuleVar,__newcontextvar7,__newcontextvar8)),','('_$_$_ergo''rule_enabled'(4,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(fllibmodobj(head,libmod_wrapper,__newdontcarevar3,'\\basetype','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5),__newvar6),fllibuniveqform(__newvar2,__newvar6)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,__M,__newdontcarevar1,'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(6,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(:(flrdatatype,flora_is_var_prim(__M)),','(!,FLORA_WORKSPACE(\\system,d^tblflapply)(sysabort,['Attempt to apply an unbound method ',__M,' to a basic data type object ',__D],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,__M,__Result,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(8,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(:(flrdatatype,flora_is_var_prim(__D)),','(:(flrdatatype,flora_is_var_prim(__Result)),','(\==(__M,toSymbol),','(\==(__M,rawValue),','(\==(__M,typeName),','(!,'\\false')))))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__D,flapply(lessThan,__D2),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(10,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(';'(:(flrdatatype,flora_is_var_prim(__D)),','(:(flrdatatype,flora_is_var_prim(__D2)),','(!,','(:(flrdecode,flora_decode_oid_as_atom(__D,__PrintableD)),','(:(flrdecode,flora_decode_oid_as_atom(__D2,__PrintableD2)),FLORA_WORKSPACE(\\system,d^tblflapply)(sysabort,['in ',__PrintableD,'[lessThan(',__PrintableD2,')]: both arguments must be bound'],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))))),fllibexecute_delayed_calls([__D,__D2,__PrintableD,__PrintableD2],[__D,__D2])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__D,flapply(lessEq,__D2),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(12,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(';'(:(flrdatatype,flora_is_var_prim(__D)),','(:(flrdatatype,flora_is_var_prim(__D2)),','(!,','(:(flrdecode,flora_decode_oid_as_atom(__D,__PrintableD)),','(:(flrdecode,flora_decode_oid_as_atom(__D2,__PrintableD2)),FLORA_WORKSPACE(\\system,d^tblflapply)(sysabort,['in ',__PrintableD,'[lessEq(',__PrintableD2,')]: both arguments must be bound'],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))))),fllibexecute_delayed_calls([__D,__D2,__PrintableD,__PrintableD2],[__D,__D2])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,hour,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(14,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\time','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,hour(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,minute,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(16,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\time','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,minute(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,second,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(18,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\time','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,second(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,zoneSign,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(20,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\time','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,zoneSign(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,zoneHour,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(22,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\time','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,zoneHour(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,zoneMinute,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(24,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\time','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,zoneMinute(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,localtime,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(26,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\time','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,localtime(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,flapply(toUTC,__H,__M),__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(28,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\time','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,toUTC(__D,__H,__M,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,flapply(toTZ,__H,__M),__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(30,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\time','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,toTZ(__D,__H,__M,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__D,islocaltime,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(32,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\time','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,zoneSign(__D,0)),!)))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__D,flapply(lessThan,__D2),'_$ctxt'(_CallerModuleVar,__newcontextvar9,__newcontextvar10)),','('_$_$_ergo''rule_enabled'(34,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\time','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrwhen,flora_put_attr(__newdontcarevar8,'\\$typed variable',','(__newdontcarevar5,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar5,'\\time','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7))))),=(__D2,__newdontcarevar8))),','(','(:(flrdatatype,flora_type_numeric_value(__D,__V)),','(:(flrdatatype,flora_type_numeric_value(__D2,__V2)),','(!,@<(__V,__V2)))),fllibexecute_delayed_calls([__D,__D2,__V,__V2],[__D,__D2]))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__D,flapply(lessEq,__D2),'_$ctxt'(_CallerModuleVar,__newcontextvar9,__newcontextvar10)),','('_$_$_ergo''rule_enabled'(36,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\time','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrwhen,flora_put_attr(__newdontcarevar8,'\\$typed variable',','(__newdontcarevar5,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar5,'\\time','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7))))),=(__D2,__newdontcarevar8))),','(','(:(flrdatatype,flora_type_numeric_value(__D,__V)),','(:(flrdatatype,flora_type_numeric_value(__D2,__V2)),','(!,@=<(__V,__V2)))),fllibexecute_delayed_calls([__D,__D2,__V,__V2],[__D,__D2]))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)('\\time',now,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(38,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(!,','(get_localdate(___Y,___Mo,___D,__H,__Mi,__S),FLORA_THIS_WORKSPACE(d^mvd)('\\time',flapply(toType,__H,__Mi,__S,1,0,0),__V,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))),fllibexecute_delayed_calls([__H,__Mi,__S,__V,___D,___Mo,___Y],[__V])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)('\\time',flapply(now,__TZ),__V,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(40,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(usermod,number(__TZ)),','(!,','(';'(->(fllibdelayedliteral(<,'flrbasetype.flr',170,[__TZ,0]),','(=(__Sign,-1),fllibdelayedliteral('\\is','flrbasetype.flr',170,[__TZpos,*(-1,__TZ)]))),','(=(__Sign,1),=(__TZpos,__TZ))),','(fllibdelayedliteral('\\is','flrbasetype.flr',173,[__TZH,floor(__TZpos)]),','(fllibdelayedliteral('\\is','flrbasetype.flr',174,[__TZM,floor(*(100,-(__TZpos,__TZH)))]),','(get_utcdate(___Y,___Mo,___D,__H,__Mi,__S),FLORA_THIS_WORKSPACE(d^mvd)('\\time',flapply(toType,__H,__Mi,__S,__Sign,__TZH,__TZM),__V,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))))))),fllibexecute_delayed_calls([__H,__Mi,__S,__Sign,__TZ,__TZH,__TZM,__TZpos,__V,___D,___Mo,___Y],[__TZ,__V])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)('\\time',flapply(now,utc),__V,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(42,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(!,','(get_utcdate(___Y,___Mo,___D,__H,__Mi,__S),FLORA_THIS_WORKSPACE(d^mvd)('\\time',flapply(toType,__H,__Mi,__S,1,0,0),__V,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))),fllibexecute_delayed_calls([__H,__Mi,__S,__V,___D,___Mo,___Y],[__V])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,dateSign,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(44,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\date','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,datesign(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,year,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(46,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\date','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,year(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,month,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(48,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\date','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,month(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,day,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(50,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\date','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,day(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__newdontcarevar1,hour,0,'_$ctxt'(_CallerModuleVar,__newcontextvar6,__newcontextvar7)),','('_$_$_ergo''rule_enabled'(52,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar5,'\\$typed variable',','(__newdontcarevar2,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar2,'\\date','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))),=(__newdontcarevar1,__newdontcarevar5)),!))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__newdontcarevar1,minute,0,'_$ctxt'(_CallerModuleVar,__newcontextvar6,__newcontextvar7)),','('_$_$_ergo''rule_enabled'(54,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar5,'\\$typed variable',','(__newdontcarevar2,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar2,'\\date','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))),=(__newdontcarevar1,__newdontcarevar5)),!))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__newdontcarevar1,second,0,'_$ctxt'(_CallerModuleVar,__newcontextvar6,__newcontextvar7)),','('_$_$_ergo''rule_enabled'(56,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar5,'\\$typed variable',','(__newdontcarevar2,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar2,'\\date','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))),=(__newdontcarevar1,__newdontcarevar5)),!))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,zoneSign,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(58,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\date','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,zoneSign(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,zoneHour,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(60,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\date','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,zoneHour(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,zoneMinute,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(62,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\date','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,zoneMinute(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,localtime,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(64,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\date','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,localtime(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,flapply(toUTC,__H,__M),__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(66,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\date','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,toUTC(__D,__H,__M,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,flapply(toTZ,__H,__M),__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(68,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\date','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,toTZ(__D,__H,__M,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__D,islocaltime,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(70,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\date','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,zoneSign(__D,0)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(___D,date,___D,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(72,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\date','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(___D,__newdontcarevar4)),!))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__newdontcarevar1,time,'\\datatype'('\\time'(0,0,'0',0,0,0,','(0,'00')),'\\time'),'_$ctxt'(_CallerModuleVar,__newcontextvar6,__newcontextvar7)),','('_$_$_ergo''rule_enabled'(74,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar5,'\\$typed variable',','(__newdontcarevar2,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar2,'\\date','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))),=(__newdontcarevar1,__newdontcarevar5)),!))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__D,flapply(lessThan,__D2),'_$ctxt'(_CallerModuleVar,__newcontextvar9,__newcontextvar10)),','('_$_$_ergo''rule_enabled'(76,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\date','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrwhen,flora_put_attr(__newdontcarevar8,'\\$typed variable',','(__newdontcarevar5,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar5,'\\date','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7))))),=(__D2,__newdontcarevar8))),','(','(:(flrdatatype,flora_type_numeric_value(__D,__V)),','(:(flrdatatype,flora_type_numeric_value(__D2,__V2)),','(!,@<(__V,__V2)))),fllibexecute_delayed_calls([__D,__D2,__V,__V2],[__D,__D2]))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__D,flapply(lessEq,__D2),'_$ctxt'(_CallerModuleVar,__newcontextvar9,__newcontextvar10)),','('_$_$_ergo''rule_enabled'(78,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\date','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrwhen,flora_put_attr(__newdontcarevar8,'\\$typed variable',','(__newdontcarevar5,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar5,'\\date','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7))))),=(__D2,__newdontcarevar8))),','(','(:(flrdatatype,flora_type_numeric_value(__D,__V)),','(:(flrdatatype,flora_type_numeric_value(__D2,__V2)),','(!,@=<(__V,__V2)))),fllibexecute_delayed_calls([__D,__D2,__V,__V2],[__D,__D2]))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,flapply(minus,__D2),__D3,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(80,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(:(flora_ground,flrground(__D)),','(:(flora_ground,flrground(__D2)),:(flrdatatype,date_time_minus(__D,__D2,__D3)))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,flapply(toDateTime,__X,__Y,__Z),__D2,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(82,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),:(flrdatatype,to_dateTime(__D,__X,__Y,__Z,__D2)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,flapply(toDateTime,__X),__D2,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(84,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),:(flrdatatype,to_dateTime(__D,__X,__D2)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,toDate,__D2,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(86,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),:(flrdatatype,to_date(__D,__D2)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)('\\date',now,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(88,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(!,','(get_localdate(__Y,__Mo,__D,___H,___Mi,___S),FLORA_THIS_WORKSPACE(d^mvd)('\\date',flapply(toType,1,__Y,__Mo,__D,1,0,0),__V,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))),fllibexecute_delayed_calls([__D,__Mo,__V,__Y,___H,___Mi,___S],[__V])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)('\\date',flapply(now,__TZ),__V,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(90,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(usermod,number(__TZ)),','(!,','(';'(->(fllibdelayedliteral(<,'flrbasetype.flr',230,[__TZ,0]),','(=(__Sign,-1),fllibdelayedliteral('\\is','flrbasetype.flr',230,[__TZpos,*(-1,__TZ)]))),','(=(__Sign,1),=(__TZpos,__TZ))),','(fllibdelayedliteral('\\is','flrbasetype.flr',233,[__TZH,floor(__TZpos)]),','(fllibdelayedliteral('\\is','flrbasetype.flr',234,[__TZM,floor(*(100,-(__TZpos,__TZH)))]),','(get_utcdate(__Y,__Mo,__D,___H,___Mi,___S),FLORA_THIS_WORKSPACE(d^mvd)('\\date',flapply(toType,1,__Y,__Mo,__D,__Sign,__TZH,__TZM),__V,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))))))),fllibexecute_delayed_calls([__D,__Mo,__Sign,__TZ,__TZH,__TZM,__TZpos,__V,__Y,___H,___Mi,___S],[__TZ,__V])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)('\\date',flapply(now,utc),__V,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(92,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(!,','(get_utcdate(__Y,__Mo,__D,___H,___Mi,___S),FLORA_THIS_WORKSPACE(d^mvd)('\\date',flapply(toType,1,__Y,__Mo,__D,1,0,0),__V,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))),fllibexecute_delayed_calls([__D,__Mo,__V,__Y,___H,___Mi,___S],[__V])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,hour,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(94,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\dateTime','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,hour(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,minute,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(96,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\dateTime','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,minute(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,second,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(98,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\dateTime','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,second(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,dateSign,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(100,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\dateTime','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,datesign(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,year,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(102,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\dateTime','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,year(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,month,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(104,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\dateTime','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,month(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,day,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(106,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\dateTime','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,day(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,zoneSign,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(108,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\dateTime','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,zoneSign(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,zoneHour,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(110,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\dateTime','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,zoneHour(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,zoneMinute,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(112,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\dateTime','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,zoneMinute(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,localtime,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(114,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\dateTime','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,localtime(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,flapply(toUTC,__H,__M),__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(116,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\dateTime','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,toUTC(__D,__H,__M,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,flapply(toTZ,__H,__M),__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(118,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\dateTime','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,toTZ(__D,__H,__M,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__D,islocaltime,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(120,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\dateTime','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,zoneSign(__D,0)),!)))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__D,flapply(lessThan,__D2),'_$ctxt'(_CallerModuleVar,__newcontextvar9,__newcontextvar10)),','('_$_$_ergo''rule_enabled'(122,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\dateTime','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrwhen,flora_put_attr(__newdontcarevar8,'\\$typed variable',','(__newdontcarevar5,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar5,'\\dateTime','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7))))),=(__D2,__newdontcarevar8))),','(','(:(flrdatatype,flora_type_numeric_value(__D,__V)),','(:(flrdatatype,flora_type_numeric_value(__D2,__V2)),','(!,@<(__V,__V2)))),fllibexecute_delayed_calls([__D,__D2,__V,__V2],[__D,__D2]))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__D,flapply(lessEq,__D2),'_$ctxt'(_CallerModuleVar,__newcontextvar9,__newcontextvar10)),','('_$_$_ergo''rule_enabled'(124,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\dateTime','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrwhen,flora_put_attr(__newdontcarevar8,'\\$typed variable',','(__newdontcarevar5,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar5,'\\dateTime','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7))))),=(__D2,__newdontcarevar8))),','(','(:(flrdatatype,flora_type_numeric_value(__D,__V)),','(:(flrdatatype,flora_type_numeric_value(__D2,__V2)),','(!,@=<(__V,__V2)))),fllibexecute_delayed_calls([__D,__D2,__V,__V2],[__D,__D2]))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__D,flapply(lessThan,__D2),'_$ctxt'(_CallerModuleVar,__newcontextvar9,__newcontextvar10)),','('_$_$_ergo''rule_enabled'(126,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\dateTime','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrwhen,flora_put_attr(__newdontcarevar8,'\\$typed variable',','(__newdontcarevar5,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar5,'\\date','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7))))),=(__D2,__newdontcarevar8))),','(','(:(flrdatatype,flora_type_numeric_value(__D,__V)),','(:(flrdatatype,flora_type_numeric_value(__D2,__V2)),','(!,@<(__V,__V2)))),fllibexecute_delayed_calls([__D,__D2,__V,__V2],[__D,__D2]))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__D,flapply(lessEq,__D2),'_$ctxt'(_CallerModuleVar,__newcontextvar9,__newcontextvar10)),','('_$_$_ergo''rule_enabled'(128,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\dateTime','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrwhen,flora_put_attr(__newdontcarevar8,'\\$typed variable',','(__newdontcarevar5,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar5,'\\date','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7))))),=(__D2,__newdontcarevar8))),','(','(:(flrdatatype,flora_type_numeric_value(__D,__V)),','(:(flrdatatype,flora_type_numeric_value(__D2,__V2)),','(!,@=<(__V,__V2)))),fllibexecute_delayed_calls([__D,__D2,__V,__V2],[__D,__D2]))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__D,flapply(lessThan,__D2),'_$ctxt'(_CallerModuleVar,__newcontextvar9,__newcontextvar10)),','('_$_$_ergo''rule_enabled'(130,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\date','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrwhen,flora_put_attr(__newdontcarevar8,'\\$typed variable',','(__newdontcarevar5,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar5,'\\dateTime','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7))))),=(__D2,__newdontcarevar8))),','(','(:(flrdatatype,flora_type_numeric_value(__D,__V)),','(:(flrdatatype,flora_type_numeric_value(__D2,__V2)),','(!,@<(__V,__V2)))),fllibexecute_delayed_calls([__D,__D2,__V,__V2],[__D,__D2]))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__D,flapply(lessEq,__D2),'_$ctxt'(_CallerModuleVar,__newcontextvar9,__newcontextvar10)),','('_$_$_ergo''rule_enabled'(132,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\date','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrwhen,flora_put_attr(__newdontcarevar8,'\\$typed variable',','(__newdontcarevar5,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar5,'\\dateTime','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7))))),=(__D2,__newdontcarevar8))),','(','(:(flrdatatype,flora_type_numeric_value(__D,__V)),','(:(flrdatatype,flora_type_numeric_value(__D2,__V2)),','(!,@=<(__V,__V2)))),fllibexecute_delayed_calls([__D,__D2,__V,__V2],[__D,__D2]))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,date,__D2,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(134,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\dateTime','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),:(flrdatatype,datetime_to_time('\\date',__D,__D2))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,time,__D2,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(136,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\dateTime','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),:(flrdatatype,datetime_to_time('\\time',__D,__D2))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)('\\dateTime',now,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(138,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(!,','(get_localdate(__Y,__Mo,__D,__H,__Mi,__S),FLORA_THIS_WORKSPACE(d^mvd)('\\dateTime',flapply(toType,1,__Y,__Mo,__D,__H,__Mi,__S,1,0,0),__V,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))),fllibexecute_delayed_calls([__D,__H,__Mi,__Mo,__S,__V,__Y],[__V])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)('\\dateTime',flapply(now,__TZ),__V,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(140,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(usermod,number(__TZ)),','(!,','(';'(->(fllibdelayedliteral(<,'flrbasetype.flr',305,[__TZ,0]),','(=(__Sign,-1),fllibdelayedliteral('\\is','flrbasetype.flr',305,[__TZpos,*(-1,__TZ)]))),','(=(__Sign,1),=(__TZpos,__TZ))),','(fllibdelayedliteral('\\is','flrbasetype.flr',308,[__TZH,floor(__TZpos)]),','(fllibdelayedliteral('\\is','flrbasetype.flr',309,[__TZM,floor(*(100,-(__TZpos,__TZH)))]),','(get_utcdate(__Y,__Mo,__D,__H,__Mi,__S),FLORA_THIS_WORKSPACE(d^mvd)('\\dateTime',flapply(toType,1,__Y,__Mo,__D,__H,__Mi,__S,__Sign,__TZH,__TZM),__V,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))))))),fllibexecute_delayed_calls([__D,__H,__Mi,__Mo,__S,__Sign,__TZ,__TZH,__TZM,__TZpos,__V,__Y],[__TZ,__V])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)('\\dateTime',flapply(now,utc),__V,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(142,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(!,','(get_utcdate(__Y,__Mo,__D,__H,__Mi,__S),FLORA_THIS_WORKSPACE(d^mvd)('\\dateTime',flapply(toType,1,__Y,__Mo,__D,__H,__Mi,__S,1,0,0),__V,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))),fllibexecute_delayed_calls([__D,__H,__Mi,__Mo,__S,__V,__Y],[__V])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,flapply(nextday,__Increment),__Y,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(144,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(next,day,__X,__Y,__Increment,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,flapply(nextmonth,__Increment),__Y,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(146,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(next,month,__X,__Y,__Increment,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,flapply(nextyear,__Increment),__Y,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(148,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(next,year,__X,__Y,__Increment,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,flapply(nexthour,__Increment),__Y,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(150,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(next,hour,__X,__Y,__Increment,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,flapply(nextminute,__Increment),__Y,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(152,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(next,minute,__X,__Y,__Increment,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,flapply(nextsecond,__Increment),__Y,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(154,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(next,second,__X,__Y,__Increment,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(next,__period,__X,__Y,__Increment,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(156,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(:(usermod,integer(__Increment)),','(';'(FLORA_THIS_WORKSPACE(d^isa)(__X,'\\date','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),';'(FLORA_THIS_WORKSPACE(d^isa)(__X,'\\dateTime','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),FLORA_THIS_WORKSPACE(d^isa)(__X,'\\time','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)))),','(!,','(';'(->(fllibdelayedliteral(>=,'flrbasetype.flr',328,[__Increment,0]),','(=(__Sign,1),=(__Increment1,__Increment))),','(=(__Sign,-1),fllibdelayedliteral('\\is','flrbasetype.flr',329,[__Increment1,-(__Increment)]))),','(';'(->(==(__period,year),=(__DurOp,flapply(toType,__Sign,__Increment1,0,0,0,0,0))),';'(->(==(__period,month),=(__DurOp,flapply(toType,__Sign,0,__Increment1,0,0,0,0))),';'(->(==(__period,day),=(__DurOp,flapply(toType,__Sign,0,0,__Increment1,0,0,0))),';'(->(==(__period,hour),=(__DurOp,flapply(toType,__Sign,0,0,0,__Increment1,0,0))),';'(->(==(__period,minute),=(__DurOp,flapply(toType,__Sign,0,0,0,0,__Increment1,0))),->(==(__period,second),=(__DurOp,flapply(toType,__Sign,0,0,0,0,0,__Increment1)))))))),','(FLORA_THIS_WORKSPACE(d^mvd)('\\duration',__DurOp,__Duration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),FLORA_THIS_WORKSPACE(d^mvd)(__X,flapply(add,__Duration),__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12))))))))),fllibexecute_delayed_calls([__DurOp,__Duration,__Increment,__Increment1,__Sign,__X,__Y,__period],[__Increment,__X,__Y,__period])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,hour,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(158,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\duration','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,hour(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,minute,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(160,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\duration','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,minute(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,second,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(162,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\duration','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,second(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,dateSign,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(164,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\duration','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,datesign(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,year,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(166,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\duration','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,year(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,month,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(168,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\duration','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,month(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,day,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(170,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\duration','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,day(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__D,flapply(lessThan,__D2),'_$ctxt'(_CallerModuleVar,__newcontextvar9,__newcontextvar10)),','('_$_$_ergo''rule_enabled'(172,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\duration','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrwhen,flora_put_attr(__newdontcarevar8,'\\$typed variable',','(__newdontcarevar5,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar5,'\\duration','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7))))),=(__D2,__newdontcarevar8))),','(','(:(flrdatatype,flora_type_numeric_value(__D,__V)),','(:(flrdatatype,flora_type_numeric_value(__D2,__V2)),','(!,@<(__V,__V2)))),fllibexecute_delayed_calls([__D,__D2,__V,__V2],[__D,__D2]))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__D,flapply(lessEq,__D2),'_$ctxt'(_CallerModuleVar,__newcontextvar9,__newcontextvar10)),','('_$_$_ergo''rule_enabled'(174,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\duration','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrwhen,flora_put_attr(__newdontcarevar8,'\\$typed variable',','(__newdontcarevar5,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar5,'\\duration','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7))))),=(__D2,__newdontcarevar8))),','(','(:(flrdatatype,flora_type_numeric_value(__D,__V)),','(:(flrdatatype,flora_type_numeric_value(__D2,__V2)),','(!,@=<(__V,__V2)))),fllibexecute_delayed_calls([__D,__D2,__V,__V2],[__D,__D2]))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__D,flapply(lessThan,__D2),'_$ctxt'(_CallerModuleVar,__newcontextvar9,__newcontextvar10)),','('_$_$_ergo''rule_enabled'(176,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\currency','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrwhen,flora_put_attr(__newdontcarevar8,'\\$typed variable',','(__newdontcarevar5,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar5,'\\currency','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7))))),=(__D2,__newdontcarevar8))),','(','(:(flrdatatype,flora_type_numeric_value(__D,__V)),','(:(flrdatatype,flora_type_numeric_value(__D2,__V2)),','(!,fllibdelayedliteral(<,'flrbasetype.flr',365,[__V,__V2])))),fllibexecute_delayed_calls([__D,__D2,__V,__V2],[__D,__D2]))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__D,flapply(lessEq,__D2),'_$ctxt'(_CallerModuleVar,__newcontextvar9,__newcontextvar10)),','('_$_$_ergo''rule_enabled'(178,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\currency','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrwhen,flora_put_attr(__newdontcarevar8,'\\$typed variable',','(__newdontcarevar5,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar5,'\\currency','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7))))),=(__D2,__newdontcarevar8))),','(','(:(flrdatatype,flora_type_numeric_value(__D,__V)),','(:(flrdatatype,flora_type_numeric_value(__D2,__V2)),','(!,fllibdelayedliteral(=<,'flrbasetype.flr',370,[__V,__V2])))),fllibexecute_delayed_calls([__D,__D2,__V,__V2],[__D,__D2]))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__N,flapply(lessThan,__N2),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(180,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(number(__N),','(number(__N2),','(!,fllibdelayedliteral(<,'flrbasetype.flr',373,[__N,__N2])))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__N,flapply(lessEq,__N2),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(182,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(number(__N),','(number(__N2),','(!,fllibdelayedliteral(=<,'flrbasetype.flr',374,[__N,__N2])))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__N,flapply(lessThan,__N2),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(184,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__N,rawValue,__V,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(d^mvd)(__N2,rawValue,__V2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(number(__V),','(number(__V2),','(!,fllibdelayedliteral(<,'flrbasetype.flr',381,[__V,__V2])))))),fllibexecute_delayed_calls([__N,__N2,__V,__V2],[__N,__N2])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__N,flapply(lessEq,__N2),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(186,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__N,rawValue,__V,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(d^mvd)(__N2,rawValue,__V2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),','(number(__V),','(number(__V2),','(!,fllibdelayedliteral(=<,'flrbasetype.flr',387,[__V,__V2])))))),fllibexecute_delayed_calls([__N,__N2,__V,__V2],[__N,__N2])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__N,flapply(lessThan,__N2),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(188,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(:(flrdtype_sub,dtype_isa(__N,'\\string')),','(','(FLORA_THIS_WORKSPACE(d^isa)(__N2,'\\string','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),:(flrdtype_sub,dtype_isa(__N2))),','(!,','(','(FLORA_THIS_WORKSPACE(d^mvd)(__N,rawValue,__newquantvar5,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),FLORA_THIS_WORKSPACE(d^mvd)(__N2,rawValue,__newquantvar8,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10))),@<(__newquantvar5,__newquantvar8))))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__N,flapply(lessEq,__N2),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(190,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(:(flrdtype_sub,dtype_isa(__N,'\\string')),','(','(FLORA_THIS_WORKSPACE(d^isa)(__N2,'\\string','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),:(flrdtype_sub,dtype_isa(__N2))),','(!,','(','(FLORA_THIS_WORKSPACE(d^mvd)(__N,rawValue,__newquantvar5,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)),FLORA_THIS_WORKSPACE(d^mvd)(__N2,rawValue,__newquantvar8,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10))),@=<(__newquantvar5,__newquantvar8))))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__N,flapply(lessThan,__N2),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(192,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(:(flrdtype_sub,dtype_isa(__N,'\\symbol')),','(:(flrdtype_sub,dtype_isa(__N2,'\\symbol')),','(!,','(','(FLORA_THIS_WORKSPACE(d^mvd)(__N,rawValue,__newquantvar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),FLORA_THIS_WORKSPACE(d^mvd)(__N2,rawValue,__newquantvar6,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))),@<(__newquantvar3,__newquantvar6))))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__N,flapply(lessEq,__N2),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(194,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(:(flrdtype_sub,dtype_isa(__N,'\\symbol')),','(:(flrdtype_sub,dtype_isa(__N2,'\\symbol')),','(!,','(','(FLORA_THIS_WORKSPACE(d^mvd)(__N,rawValue,__newquantvar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),FLORA_THIS_WORKSPACE(d^mvd)(__N2,rawValue,__newquantvar6,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))),@=<(__newquantvar3,__newquantvar6))))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__N,flapply(lessThan,__N2),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(196,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(:(flrdtype_sub,dtype_isa(__N,'\\iri')),','(:(flrdtype_sub,dtype_isa(__N2,'\\iri')),','(!,','(','(FLORA_THIS_WORKSPACE(d^mvd)(__N,rawValue,__newquantvar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),FLORA_THIS_WORKSPACE(d^mvd)(__N2,rawValue,__newquantvar6,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))),@<(__newquantvar3,__newquantvar6))))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__N,flapply(lessEq,__N2),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(198,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(:(flrdtype_sub,dtype_isa(__N,'\\iri')),','(:(flrdtype_sub,dtype_isa(__N2,'\\iri')),','(!,','(','(FLORA_THIS_WORKSPACE(d^mvd)(__N,rawValue,__newquantvar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),FLORA_THIS_WORKSPACE(d^mvd)(__N2,rawValue,__newquantvar6,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))),@=<(__newquantvar3,__newquantvar6))))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__X,flapply(gt,__Y),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(200,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^meth)(__Y,flapply(lessThan,__X),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__X,flapply(gtEq,__Y),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(202,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^meth)(__Y,flapply(lessEq,__X),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,rawValue,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(204,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(:(flrdatatype,flora_datatype_raw_value(__D,__V)),!))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,typeName,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(206,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(:(flrdatatype,flora_datatype_name(__D,__V)),!))).
:-(FLORA_THIS_WORKSPACE(static^meth)(___D,flapply(equals,___D),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(208,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(static^meth)(__T,flapply(isTypeOf,__V),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(210,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(:(flrdatatype,flora_datatype_name(__V,__T)),!))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__T,flapply(isTypeOf,__newdontcarevar1),'_$ctxt'(_CallerModuleVar,__newcontextvar2,__newcontextvar3)),','('_$_$_ergo''rule_enabled'(212,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(class_type_error)(__T,'\\isTypeOf(?) -> ?','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__T,flapply(toType,__newdontcarevar1),__newdontcarevar2,'_$ctxt'(_CallerModuleVar,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''rule_enabled'(214,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(class_type_error)(__T,'toType(?) -> ?','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__T,flapply(toType,__newdontcarevar1,__newdontcarevar2),__newdontcarevar3,'_$ctxt'(_CallerModuleVar,__newcontextvar4,__newcontextvar5)),','('_$_$_ergo''rule_enabled'(216,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(class_type_error)(__T,'toType(?) -> ?','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__T,flapply(toType,__newdontcarevar1,__newdontcarevar2,__newdontcarevar3,__newdontcarevar4,__newdontcarevar5,__newdontcarevar6),__newdontcarevar7,'_$ctxt'(_CallerModuleVar,__newcontextvar8,__newcontextvar9)),','('_$_$_ergo''rule_enabled'(218,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(class_type_error)(__T,'toType(?) -> ?','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__T,flapply(toType,__newdontcarevar1,__newdontcarevar2,__newdontcarevar3,__newdontcarevar4,__newdontcarevar5,__newdontcarevar6,__newdontcarevar7),__newdontcarevar8,'_$ctxt'(_CallerModuleVar,__newcontextvar9,__newcontextvar10)),','('_$_$_ergo''rule_enabled'(220,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(class_type_error)(__T,'toType(?) -> ?','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__T,flapply(toType,__newdontcarevar1,__newdontcarevar2,__newdontcarevar3,__newdontcarevar4,__newdontcarevar5,__newdontcarevar6,__newdontcarevar7,__newdontcarevar8,__newdontcarevar9,__newdontcarevar10),__newdontcarevar11,'_$ctxt'(_CallerModuleVar,__newcontextvar12,__newcontextvar13)),','('_$_$_ergo''rule_enabled'(222,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(class_type_error)(__T,'toType(?) -> ?','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar14,__newcontextvar15)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__T,flapply(toType,__A),__Obj,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(224,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(==(__T,'\\symbol'),','(!,FLORA_THIS_WORKSPACE(d^mvd)(__A,toSymbol,__Obj,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__T,flapply(toType,__A),__Obj,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(226,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(';'(==(__T,'\\string'),==(__T,'\\iri')),','(!,','(:(flrdatatype,flora_datatype_raw_value(__A,__ARaw)),','(fllibmetauniv(__ParsedRepr,[__T,__ARaw]),','(:(flrdatatype,flora_special_datatype_internal_representation(__ParsedRepr,__Obj)),!))))),fllibexecute_delayed_calls([__A,__ARaw,__Obj,__ParsedRepr,__T],[__A,__Obj,__T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__T,flapply(toType,__A),__Obj,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(228,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__A,rawValue,__RA,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(flrdatatype_parse,flora_make_datatype(__T,__RA,__Obj1)),fllibifthenelse(FLORA_THIS_MODULE_NAME,==(__T,'\\iri'),FLORA_THIS_WORKSPACE(d^mvd)(__Obj1,toSymbol,__Obj,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),=(__Obj,__Obj1),482,'flrbasetype.flr'))),fllibexecute_delayed_calls([__A,__Obj,__Obj1,__RA,__T],[__A,__Obj,__T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__T,flapply(toType,__A1,__A2),__Obj,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(230,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(==(__T,'\\currency'),:(flrdatatype_parse,flora_make_datatype(__T,','(__A1,__A2),__Obj))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__T,flapply(toType,__A1,__A2,__A3,__A4,__A5,__A6),__Obj,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(232,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(==(__T,'\\time'),:(flrdatatype_parse,flora_make_datatype(__T,','(__A1,','(__A2,','(__A3,','(__A4,','(__A5,__A6))))),__Obj))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__T,flapply(toType,__A1,__A2,__A3,__A4,__A5,__A6,__A7),__Obj,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(234,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(basics,member(__T,['\\date','\\uri','\\duration'])),','(:(flrdatatype_parse,flora_make_datatype(__T,','(__A1,','(__A2,','(__A3,','(__A4,','(__A5,','(__A6,__A7)))))),__Obj1)),fllibifthenelse(FLORA_THIS_MODULE_NAME,==(__T,'\\iri'),FLORA_THIS_WORKSPACE(d^mvd)(__Obj1,toSymbol,__Obj,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),=(__Obj,__Obj1),498,'flrbasetype.flr'))),fllibexecute_delayed_calls([__A1,__A2,__A3,__A4,__A5,__A6,__A7,__Obj,__Obj1,__T],[__A1,__A2,__A3,__A4,__A5,__A6,__A7,__Obj,__T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__T,flapply(toType,__A1,__A2,__A3,__A4,__A5,__A6,__A7,__A8,__A9,__A10),__Obj,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(236,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(==(__T,'\\dateTime'),:(flrdatatype_parse,flora_make_datatype(__T,','(__A1,','(__A2,','(__A3,','(__A4,','(__A5,','(__A6,','(__A7,','(__A8,','(__A9,__A10))))))))),__Obj))))).
:-(FLORA_THIS_WORKSPACE(class_type_error)(__Typ,__Meth,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(238,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(','(:(flrdatatype,flora_builtin_datatype(__BI)),','(fllibifthen(FLORA_THIS_MODULE_NAME,','(FLORA_WORKSPACE(\\system,d^meth)('Method',flapply(mustDefine,__Mode),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),==(__Mode,on)),FLORA_WORKSPACE(\\system,d^meth)('Method',flapply(mustDefine,off),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),509,'flrbasetype.flr'),','(fllibifthenelse(FLORA_THIS_MODULE_NAME,','(:(flrdtype_sub,dtype_isa(__Typ,__BI)),','(fllibdelayedliteral('!==','flrbasetype.flr',511,[__BI,'\\string']),fllibdelayedliteral('!==','flrbasetype.flr',511,[__BI,'\\symbol']))),FLORA_WORKSPACE(\\system,d^meth)('Method',flapply(mustDefine,__Mode),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),','(FLORA_WORKSPACE(\\system,d^meth)('Method',flapply(mustDefine,__Mode),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar10)),'\\false'),511,'flrbasetype.flr'),','(:(flrdecode,flora_decode_oid_as_atom(__Typ,__PrintableT)),FLORA_WORKSPACE(\\system,d^tblflapply)(sysabort,[__PrintableT,'[',__Meth,']: ',__PrintableT,' must be a data type'],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)))))),fllibexecute_delayed_calls([__BI,__Meth,__Mode,__PrintableT,__Typ],[__Meth,__Typ])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__T,flapply(add,__T1),__T2,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(240,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(:(flrdatatype,flora_dt_add(__T,__T1,__T2)),!))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__T,inverse,__T1,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(242,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),';'(->(:(usermod,number(__T)),fllibdelayedliteral('\\is','flrbasetype.flr',524,[__T1,-(__T)])),->(:(flrdatatype,flora_datatype_name(__T,'\\duration')),:(flrdatatype,flora_duration_inverse(__T,__T1)))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__T,weekday,__DayOfWk,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(244,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(:(flrdatatype,flora_dt_date_week(__T,__DayOfWk,__WkNum,__WkStart,__WkEnd)),fllibexecute_delayed_calls([__DayOfWk,__T,__WkEnd,__WkNum,__WkStart],[__DayOfWk,__T])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__T,weeknum,__WkNum,'_$ctxt'(_CallerModuleVar,__newcontextvar3,__newcontextvar4)),','('_$_$_ergo''rule_enabled'(244,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(:(flrdatatype,flora_dt_date_week(__T,__DayOfWk,__WkNum,__WkStart,__WkEnd)),fllibexecute_delayed_calls([__DayOfWk,__T,__WkEnd,__WkNum,__WkStart],[__T,__WkNum])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__T,weekstart,__WkStart,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(244,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(:(flrdatatype,flora_dt_date_week(__T,__DayOfWk,__WkNum,__WkStart,__WkEnd)),fllibexecute_delayed_calls([__DayOfWk,__T,__WkEnd,__WkNum,__WkStart],[__T,__WkStart])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__T,weekend,__WkEnd,'_$ctxt'(_CallerModuleVar,__newcontextvar7,__newcontextvar8)),','('_$_$_ergo''rule_enabled'(244,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),','(:(flrdatatype,flora_dt_date_week(__T,__DayOfWk,__WkNum,__WkStart,__WkEnd)),fllibexecute_delayed_calls([__DayOfWk,__T,__WkEnd,__WkNum,__WkStart],[__T,__WkEnd])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__T,monthend,__E,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(246,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),:(flrdatatype,last_day_of_month(__T,__E)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__T,monthstart,__E,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(248,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),:(flrdatatype,first_day_of_month(__T,__E)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Dt,flapply(days_until,__Dt2),__Days,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(250,'flrbasetype.flr',FLORA_THIS_MODULE_NAME),:(flrdatatype,flora_dt_days_between_dates(__Dt,__Dt2,__Days)))).
:-(fllibexport([[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar1,toSymbol,__newdontcarevar2,__newcontextvar5))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar6,toNumber,__newdontcarevar7,__newcontextvar10))]])).
:-(FLORA_THIS_WORKSPACE(static^mvd)('\\symbol',flapply(concat,__List),__Atom,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(252,'flrbasetype_symbol.flh',FLORA_THIS_MODULE_NAME),','(!,FLORA_THIS_WORKSPACE(d^mvd)('\\symbol',flapply('_$concat',__List),__Atom,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)('\\symbol',flapply('_$concat',[]),'','_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(254,'flrbasetype_symbol.flh',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(static^mvd)('\\symbol',flapply('_$concat',[__Item|__List]),__Result,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(256,'flrbasetype_symbol.flh',FLORA_THIS_MODULE_NAME),','(','(!,','(FLORA_THIS_WORKSPACE(d^mvd)(__Item,toSymbol,__ItemSym,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(FLORA_THIS_WORKSPACE(d^mvd)('\\symbol',flapply('_$concat',__List),__ListSym,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)),:(flrporting,flora_concat_atoms([__ItemSym,__ListSym],__Result))))),fllibexecute_delayed_calls([__Item,__ItemSym,__List,__ListSym,__Result],[__Item,__List,__Result])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,toNumber,__D,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(258,'flrbasetype_symbol.flh',FLORA_THIS_MODULE_NAME),','(:(usermod,number(__D)),!))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,toNumber,__N,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(260,'flrbasetype_symbol.flh',FLORA_THIS_MODULE_NAME),','(','(:(usermod,atom(__D)),','(!,','(atom_codes(__D,__Codes),fllibcatch(number_codes(__N,__Codes),__newdontcarevar3,','(FLORA_WORKSPACE(\\system,d^tblflapply)(warning,['toNumber(): ',__D,' is not convertible to a number; leaving as is'],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),=(__N,__D)))))),fllibexecute_delayed_calls([__Codes,__D,__N,__newdontcarevar6],[__D,__N])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,toSymbol,__VA,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(262,'flrbasetype_symbol.flh',FLORA_THIS_MODULE_NAME),','(:(flrdatatype,flora_is_var_prim(__D)),','(!,fmt_write_string(__VA,'?%S',arg(__D)))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,toSymbol,__VA,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(264,'flrbasetype_symbol.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrdatatype,flora_printable_type_representation(__D,[___T,__V])),','(!,';'(->(:(usermod,number(__V)),','(number_codes(__V,__VC),atom_codes(__VA,__VC))),=(__VA,__V)))),fllibexecute_delayed_calls([__D,__V,__VA,__VC,___T],[__D,__VA])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,toSymbol,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(266,'flrbasetype_symbol.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrdatatype,flora_datatype_name(__D,__TN)),','(';'(==(__TN,'\\charlist'),';'(==(__TN,'\\symbol'),==(__TN,'\\boolean'))),','(!,:(flrdatatype,flora_datatype_raw_value(__D,__V))))),fllibexecute_delayed_calls([__D,__TN,__V],[__D,__V])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,toSymbol,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(268,'flrbasetype_symbol.flh',FLORA_THIS_MODULE_NAME),:(flrdecode,flora_decode_oid_as_atom_substitute_vars(__D,__V)))).
:-(fllibexport([[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar1,scheme,__newdontcarevar2,__newcontextvar5))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar6,user,__newdontcarevar7,__newcontextvar10))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar11,host,__newdontcarevar12,__newcontextvar15))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar16,port,__newdontcarevar17,__newcontextvar20))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar21,path,__newdontcarevar22,__newcontextvar25))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar26,query,__newdontcarevar27,__newcontextvar30))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar31,fragment,__newdontcarevar32,__newcontextvar35))]])).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,toSymbol,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(270,'flrbasetype_iri.flh',FLORA_THIS_MODULE_NAME),','(','(';'(atom(__D),is_charlist(__D)),','(:(flrdatatype_parse,flora_make_datatype('\\iri',__D,__IRI)),','(:(flrdatatype,flora_printable_type_representation(__IRI,[___TName,__V])),!))),fllibexecute_delayed_calls([__D,__IRI,__V,___TName],[__D,__V])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,scheme,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(272,'flrbasetype_iri.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\iri','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,scheme(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,user,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(274,'flrbasetype_iri.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\iri','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,user(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,host,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(276,'flrbasetype_iri.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\iri','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,host(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,port,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(278,'flrbasetype_iri.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\iri','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,port(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,path,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(280,'flrbasetype_iri.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\iri','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,path(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,query,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(282,'flrbasetype_iri.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\iri','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,query(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,fragment,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(284,'flrbasetype_iri.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\iri','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__D,__newdontcarevar4)),','(:(flrdatatype,fragment(__D,__V)),!)))).
:-(FLORA_THIS_WORKSPACE(static^meth)('\\uri',flapply(isTypeOf,___V),'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(286,'flrbasetype_iri.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\iri','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(___V,__newdontcarevar4)),!))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,scheme,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(288,'flrbasetype_iri.flh',FLORA_THIS_MODULE_NAME),','(','(';'(atom(__D),is_charlist(__D)),','(:(flrdatatype_parse,flora_make_datatype('\\iri',__D,__iri)),','(:(flrdatatype,scheme(__iri,__V)),!))),fllibexecute_delayed_calls([__D,__V,__iri],[__D,__V])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,user,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(290,'flrbasetype_iri.flh',FLORA_THIS_MODULE_NAME),','(','(';'(atom(__D),is_charlist(__D)),','(:(flrdatatype_parse,flora_make_datatype('\\iri',__D,__iri)),','(:(flrdatatype,user(__iri,__V)),!))),fllibexecute_delayed_calls([__D,__V,__iri],[__D,__V])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,host,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(292,'flrbasetype_iri.flh',FLORA_THIS_MODULE_NAME),','(','(';'(atom(__D),is_charlist(__D)),','(:(flrdatatype_parse,flora_make_datatype('\\iri',__D,__iri)),','(:(flrdatatype,host(__iri,__V)),!))),fllibexecute_delayed_calls([__D,__V,__iri],[__D,__V])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,port,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(294,'flrbasetype_iri.flh',FLORA_THIS_MODULE_NAME),','(','(';'(atom(__D),is_charlist(__D)),','(:(flrdatatype_parse,flora_make_datatype('\\iri',__D,__iri)),','(:(flrdatatype,port(__iri,__V)),!))),fllibexecute_delayed_calls([__D,__V,__iri],[__D,__V])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,path,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(296,'flrbasetype_iri.flh',FLORA_THIS_MODULE_NAME),','(','(';'(atom(__D),is_charlist(__D)),','(:(flrdatatype_parse,flora_make_datatype('\\iri',__D,__iri)),','(:(flrdatatype,path(__iri,__V)),!))),fllibexecute_delayed_calls([__D,__V,__iri],[__D,__V])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,query,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(298,'flrbasetype_iri.flh',FLORA_THIS_MODULE_NAME),','(','(';'(atom(__D),is_charlist(__D)),','(:(flrdatatype_parse,flora_make_datatype('\\iri',__D,__iri)),','(:(flrdatatype,query(__iri,__V)),!))),fllibexecute_delayed_calls([__D,__V,__iri],[__D,__V])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__D,fragment,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(300,'flrbasetype_iri.flh',FLORA_THIS_MODULE_NAME),','(','(';'(atom(__D),is_charlist(__D)),','(:(flrdatatype_parse,flora_make_datatype('\\iri',__D,__iri)),','(:(flrdatatype,fragment(__iri,__V)),!))),fllibexecute_delayed_calls([__D,__V,__iri],[__D,__V])))).
:-(fllibexport([[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar1,floor,__newdontcarevar2,__newcontextvar5))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar6,ceiling,__newdontcarevar7,__newcontextvar10))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar11,round,__newdontcarevar12,__newcontextvar15))]])).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,floor,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(302,'flrbasetype_double.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\double','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(!,is(__V,floor(__X)))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,ceiling,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(304,'flrbasetype_double.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\double','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(!,is(__V,ceiling(__X)))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,round,__V,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(306,'flrbasetype_double.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\double','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(!,is(__V,round(__X)))))).
:-(fllibexport([[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar1,flapply(startsWith,__newdontcarevar2),__newcontextvar5))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar6,flapply(endsWith,__newdontcarevar7),__newcontextvar10))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar11,flapply(contains,__newdontcarevar12),__newcontextvar15))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar16,flapply(member,__newdontcarevar17),__newcontextvar20))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar21,flapply(ith,__newdontcarevar22),__newdontcarevar23,__newcontextvar26))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar27,flapply(append,__newdontcarevar28),__newdontcarevar29,__newcontextvar32))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar33,flapply(delete,__newdontcarevar34),__newdontcarevar35,__newcontextvar38))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar39,flapply(select,__newdontcarevar40),__newdontcarevar41,__newcontextvar44))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar45,length,__newdontcarevar46,__newcontextvar49))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar50,reverse,__newdontcarevar51,__newcontextvar54))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar55,toTuple,__newdontcarevar56,__newcontextvar59))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar60,flatten,__newdontcarevar61,__newcontextvar64))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar65,sort,__newdontcarevar66,__newcontextvar69))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar70,flapply(subset,__newdontcarevar71),__newcontextvar74))]])).
:-(FLORA_THIS_WORKSPACE(static^meth)(__X,flapply(startsWith,__Y),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(308,'flrbasetype_list.flh',FLORA_THIS_MODULE_NAME),','(:(usermod,is_list(__X)),','(:(usermod,is_list(__Y)),','(!,:(flrdatatype_utils,flora_startsWith_list(__X,__Y))))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__X,flapply(startsWith,__Y),'_$ctxt'(_CallerModuleVar,__newcontextvar9,__newcontextvar10)),','('_$_$_ergo''rule_enabled'(310,'flrbasetype_list.flh',FLORA_THIS_MODULE_NAME),','(','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\list','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(:(flrwhen,flora_put_attr(__newdontcarevar8,'\\$typed variable',','(__newdontcarevar5,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar5,'\\list','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7))))),=(__Y,__newdontcarevar8))),','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(!,:(flrdatatype_utils,flora_startsWith_list(__X,__Y))))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__X,flapply(endsWith,__Y),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(312,'flrbasetype_list.flh',FLORA_THIS_MODULE_NAME),','(','(:(usermod,is_list(__X)),','(:(usermod,is_list(__Y)),','(!,','(:(basics,reverse(__X,__RX)),','(:(basics,reverse(__Y,__RY)),:(flrdatatype_utils,flora_startsWith_list(__RX,__RY))))))),fllibexecute_delayed_calls([__RX,__RY,__X,__Y],[__X,__Y])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__X,flapply(endsWith,__Y),'_$ctxt'(_CallerModuleVar,__newcontextvar9,__newcontextvar10)),','('_$_$_ergo''rule_enabled'(314,'flrbasetype_list.flh',FLORA_THIS_MODULE_NAME),','(','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\list','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(:(flrwhen,flora_put_attr(__newdontcarevar8,'\\$typed variable',','(__newdontcarevar5,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar5,'\\list','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7))))),=(__Y,__newdontcarevar8))),','(','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(!,','(:(basics,reverse(__X,__RX)),','(:(basics,reverse(__Y,__RY)),:(flrdatatype_utils,flora_startsWith_list(__RX,__RY)))))),fllibexecute_delayed_calls([__RX,__RY,__X,__Y],[__X,__Y]))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__X,flapply(contains,__Y),'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(316,'flrbasetype_list.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\list','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__Y,__newdontcarevar4)),','(','(:(usermod,is_list(__X)),','(:(usermod,is_list(__Y)),','(!,:(basics,subseq(__X,__Y,__newdontcarevar7))))),fllibexecute_delayed_calls([__X,__Y,__newdontcarevar8],[__X,__Y]))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__X,flapply(contains,__Y),'_$ctxt'(_CallerModuleVar,__newcontextvar9,__newcontextvar10)),','('_$_$_ergo''rule_enabled'(318,'flrbasetype_list.flh',FLORA_THIS_MODULE_NAME),','(','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\list','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(:(flrwhen,flora_put_attr(__newdontcarevar8,'\\$typed variable',','(__newdontcarevar5,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar5,'\\list','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7))))),=(__Y,__newdontcarevar8))),','(','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(:(flrdatatype,flora_is_nonvar_prim(__Y)),','(!,:(basics,subseq(__X,__Y,__newdontcarevar11))))),fllibexecute_delayed_calls([__X,__Y,__newdontcarevar12],[__X,__Y]))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__X,flapply(member,__Y),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(320,'flrbasetype_list.flh',FLORA_THIS_MODULE_NAME),','(:(usermod,is_list(__X)),','(!,:(basics,member(__Y,__X)))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__X,flapply(member,__Y),'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(322,'flrbasetype_list.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\list','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(!,:(basics,member(__Y,__X))))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,flapply(select,__Y),__R,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(324,'flrbasetype_list.flh',FLORA_THIS_MODULE_NAME),','(:(usermod,is_list(__X)),','(!,:(lists,select(__Y,__X,__R)))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,flapply(select,__Y),__R,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(326,'flrbasetype_list.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\list','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(!,:(lists,select(__Y,__X,__R))))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,flapply(delete,__Y),__R,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(328,'flrbasetype_list.flh',FLORA_THIS_MODULE_NAME),','(:(usermod,is_list(__X)),','(!,:(lists,delete(__X,__Y,__R)))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,flapply(delete,__Y),__R,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(330,'flrbasetype_list.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\list','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(!,:(lists,delete(__X,__Y,__R))))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,flapply(append,__Y),__R,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(332,'flrbasetype_list.flh',FLORA_THIS_MODULE_NAME),','(:(usermod,is_list(__X)),','(:(usermod,is_list(__Y)),','(!,:(basics,append(__X,__Y,__R))))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,flapply(append,__Y),__R,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(334,'flrbasetype_list.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\list','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(';'(:(flrdatatype,flora_is_nonvar_prim(__X)),:(usermod,is_list(__R))),','(!,:(basics,append(__X,__Y,__R))))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)('\\list',flapply(append,[]),[],'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(336,'flrbasetype_list.flh',FLORA_THIS_MODULE_NAME),!)).
:-(FLORA_THIS_WORKSPACE(static^mvd)('\\list',flapply(append,[__L|__Ls]),__R,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(338,'flrbasetype_list.flh',FLORA_THIS_MODULE_NAME),','(','(!,','(FLORA_THIS_WORKSPACE(d^mvd)(__L,flapply(append,__Rest),__R,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),FLORA_THIS_WORKSPACE(d^mvd)('\\list',flapply(append,__Ls),__Rest,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar6)))),fllibexecute_delayed_calls([__L,__Ls,__R,__Rest],[__L,__Ls,__R])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,length,__R,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(340,'flrbasetype_list.flh',FLORA_THIS_MODULE_NAME),','(:(usermod,is_list(__X)),','(!,:(basics,length(__X,__R)))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,length,__R,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(342,'flrbasetype_list.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\list','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(';'(->(','(:(flrdatatype,flora_is_var_prim(__R)),:(flrdatatype,flora_is_nonvar_prim(__X))),'\\true'),:(usermod,integer(__R))),','(!,:(basics,length(__X,__R))))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,reverse,__R,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(344,'flrbasetype_list.flh',FLORA_THIS_MODULE_NAME),','(:(usermod,is_list(__X)),','(!,:(basics,reverse(__X,__R)))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,reverse,__R,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(346,'flrbasetype_list.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\list','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(!,:(basics,reverse(__X,__R))))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,toTuple,__R,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(348,'flrbasetype_list.flh',FLORA_THIS_MODULE_NAME),','(:(usermod,is_list(__X)),','(!,:(flrauxil,list2commalist(__X,__R)))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,toTuple,__R,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(350,'flrbasetype_list.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\list','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(!,:(flrauxil,list2commalist(__X,__R))))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,flatten,__R,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(352,'flrbasetype_list.flh',FLORA_THIS_MODULE_NAME),','(:(usermod,is_list(__X)),','(!,:(basics,flatten(__X,__R)))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,flatten,__R,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(354,'flrbasetype_list.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\list','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(!,:(basics,flatten(__X,__R))))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,sort,__R,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(356,'flrbasetype_list.flh',FLORA_THIS_MODULE_NAME),','(:(usermod,is_list(__X)),','(!,sort(__X,__R))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,sort,__R,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(358,'flrbasetype_list.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\list','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(!,sort(__X,__R)))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__X,flapply(subset,__Y),'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(360,'flrbasetype_list.flh',FLORA_THIS_MODULE_NAME),','(:(usermod,is_list(__X)),','(:(usermod,is_list(__Y)),','(!,:(basics,subset(__Y,__X))))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__X,flapply(subset,__Y),'_$ctxt'(_CallerModuleVar,__newcontextvar9,__newcontextvar10)),','('_$_$_ergo''rule_enabled'(362,'flrbasetype_list.flh',FLORA_THIS_MODULE_NAME),','(','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\list','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(:(flrwhen,flora_put_attr(__newdontcarevar8,'\\$typed variable',','(__newdontcarevar5,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar5,'\\list','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7))))),=(__Y,__newdontcarevar8))),','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(:(flrdatatype,flora_is_nonvar_prim(__Y)),','(!,:(basics,subset(__Y,__X)))))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,flapply(ith,__N),__Y,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(364,'flrbasetype_list.flh',FLORA_THIS_MODULE_NAME),','(:(usermod,is_list(__X)),','(!,:(basics,ith(__N,__X,__Y)))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,flapply(ith,__N),__Y,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(366,'flrbasetype_list.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\list','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(!,:(basics,ith(__N,__X,__Y))))))).
:-(fllibexport([[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar1,flapply(startsWith,__newdontcarevar2),__newcontextvar5))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar6,flapply(endsWith,__newdontcarevar7),__newcontextvar10))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^meth)(__newdontcarevar11,flapply(contains,__newdontcarevar12),__newcontextvar15))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar16,flapply(contains,__newdontcarevar17),__newdontcarevar18,__newcontextvar21))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar22,flapply(concat,__newdontcarevar23),__newdontcarevar24,__newcontextvar27))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar28,reverse,__newdontcarevar29,__newcontextvar32))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar33,length,__newdontcarevar34,__newcontextvar37))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar38,toUpper,__newdontcarevar39,__newcontextvar42))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar43,toLower,__newdontcarevar44,__newcontextvar47))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar48,toList,__newdontcarevar49,__newcontextvar52))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar53,flapply(substring,__newdontcarevar54,__newdontcarevar55),__newdontcarevar56,__newcontextvar59))]])).
:-(FLORA_THIS_WORKSPACE(static^meth)(__X,flapply(startsWith,__Y),'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(368,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\string','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(:(usermod,atom(__Y)),','(!,','(','(FLORA_THIS_WORKSPACE(d^mvd)(__Y,rawValue,__newquantvar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),FLORA_THIS_WORKSPACE(d^mvd)(__X,rawValue,__newquantvar10,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12))),:(flrporting,flora_match_substring(__newquantvar7,__newquantvar10,0))))))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__X,flapply(startsWith,__Y),'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(370,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\symbol','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(:(usermod,atom(__Y)),','(!,','(FLORA_THIS_WORKSPACE(d^mvd)(__Y,rawValue,__newquantvar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),:(flora_ground,flratom_begins_with(__X,__newquantvar7))))))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__X,flapply(endsWith,__Y),'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(372,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\string','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(:(usermod,atom(__Y)),','(!,','(','(FLORA_THIS_WORKSPACE(d^mvd)(__X,rawValue,__newquantvar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),FLORA_THIS_WORKSPACE(d^mvd)(__Y,rawValue,__newquantvar10,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12))),:(flora_ground,flratom_ends_with(__newquantvar7,__newquantvar10))))))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__X,flapply(endsWith,__Y),'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(374,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\symbol','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(:(usermod,atom(__Y)),','(!,','(FLORA_THIS_WORKSPACE(d^mvd)(__Y,rawValue,__newquantvar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),:(flora_ground,flratom_ends_with(__X,__newquantvar7))))))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__X,flapply(contains,__Y),'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(376,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\string','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(:(usermod,atom(__Y)),','(!,','(','(FLORA_THIS_WORKSPACE(d^mvd)(__Y,rawValue,__newquantvar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),FLORA_THIS_WORKSPACE(d^mvd)(__X,rawValue,__newquantvar10,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12))),:(flrporting,flora_match_substring(__newquantvar7,__newquantvar10,__newdontcarevar13)))))),fllibexecute_delayed_calls([__X,__Y,__newdontcarevar14],[__X,__Y]))))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__X,flapply(contains,__Y),'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(378,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\symbol','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(:(usermod,atom(__Y)),','(!,','(FLORA_THIS_WORKSPACE(d^mvd)(__Y,rawValue,__newquantvar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),:(flrporting,flora_match_substring(__newquantvar7,__X,__newdontcarevar10)))))),fllibexecute_delayed_calls([__X,__Y,__newdontcarevar11],[__X,__Y]))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,flapply(contains,__Y),[__Beg,__End],'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(380,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\string','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(:(usermod,atom(__Y)),','(!,','(','(FLORA_THIS_WORKSPACE(d^mvd)(__Y,rawValue,__newquantvar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),FLORA_THIS_WORKSPACE(d^mvd)(__X,rawValue,__newquantvar10,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12))),:(flrporting,flora_match_substring(__newquantvar7,__newquantvar10,forward,__Beg,__End))))))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,flapply(contains,__Y),[__Beg,__End],'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(382,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\symbol','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(:(usermod,atom(__Y)),','(!,','(FLORA_THIS_WORKSPACE(d^mvd)(__Y,rawValue,__newquantvar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),:(flrporting,flora_match_substring(__newquantvar7,__X,forward,__Beg,__End))))))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,flapply(concat,__Y),__R,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(384,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\string','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(:(usermod,atom(__Y)),','(!,','(','(','(FLORA_THIS_WORKSPACE(d^mvd)(__X,rawValue,__newquantvar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),FLORA_THIS_WORKSPACE(d^mvd)(__Y,rawValue,__newquantvar10,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12))),:(flrporting,flora_concat_atoms([__newquantvar7,__newquantvar10],__R1))),FLORA_THIS_WORKSPACE(d^mvd)('\\string',flapply(toType,__R1),__R,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,__newcontextvar14)))))),fllibexecute_delayed_calls([__R,__R1,__X,__Y],[__R,__X,__Y]))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,flapply(concat,__Y),__R,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(386,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\symbol','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(:(usermod,atom(__Y)),','(!,','(FLORA_THIS_WORKSPACE(d^mvd)(__Y,rawValue,__newquantvar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),:(flrporting,flora_concat_atoms([__X,__newquantvar7],__R))))))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,flapply(concat,__Y),__R,'_$ctxt'(_CallerModuleVar,__newcontextvar9,__newcontextvar10)),','('_$_$_ergo''rule_enabled'(388,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),','(','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\charlist','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(:(flrwhen,flora_put_attr(__newdontcarevar8,'\\$typed variable',','(__newdontcarevar5,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar5,'\\charlist','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7))))),=(__Y,__newdontcarevar8))),','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(:(flrdatatype,flora_is_nonvar_prim(__Y)),','(!,:(basics,append(__X,__Y,__R)))))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,reverse,__R,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(390,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\string','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(!,','(','(FLORA_THIS_WORKSPACE(d^mvd)(__X,rawValue,__newquantvar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),atom_codes(__newquantvar7,__Codes)),','(:(basics,reverse(__Codes,__CodesR)),','(atom_codes(__R1,__CodesR),FLORA_THIS_WORKSPACE(d^mvd)('\\string',flapply(toType,__R1),__R,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11))))))),fllibexecute_delayed_calls([__Codes,__CodesR,__R,__R1,__X],[__R,__X]))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,reverse,__R,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(392,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\symbol','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(!,','(atom_codes(__X,__Codes),','(:(basics,reverse(__Codes,__CodesRvrs)),atom_codes(__R,__CodesRvrs))))),fllibexecute_delayed_calls([__Codes,__CodesRvrs,__R,__X],[__R,__X]))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,length,__N,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(394,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\string','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(!,','(FLORA_THIS_WORKSPACE(d^mvd)(__X,rawValue,__newquantvar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),:(flrporting,flora_atom_length(__newquantvar7,__N)))))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,length,__N,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(396,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\symbol','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(!,:(flrporting,flora_atom_length(__X,__N))))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,toUpper,__R,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(398,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\string','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(!,','(','(FLORA_THIS_WORKSPACE(d^mvd)(__X,rawValue,__newquantvar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),:(flrdatatype_utils,flora_toUpper(__newquantvar7,__R1))),FLORA_THIS_WORKSPACE(d^mvd)('\\string',flapply(toType,__R1),__R,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11))))),fllibexecute_delayed_calls([__R,__R1,__X],[__R,__X]))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,toUpper,__R,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(400,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\symbol','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(!,:(flrdatatype_utils,flora_toUpper(__X,__R))))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,toUpper,__R,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(402,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\charlist','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(!,','(:(flrdatatype_utils,flora_toUpper(__X,__R1)),atom_codes(__R1,__R)))),fllibexecute_delayed_calls([__R,__R1,__X],[__R,__X]))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,toLower,__R,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(404,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\string','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(!,','(','(FLORA_THIS_WORKSPACE(d^mvd)(__X,rawValue,__newquantvar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),:(flrdatatype_utils,flora_toLower(__newquantvar7,__R1))),FLORA_THIS_WORKSPACE(d^mvd)('\\string',flapply(toType,__R1),__R,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11))))),fllibexecute_delayed_calls([__R,__R1,__X],[__R,__X]))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,toLower,__R,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(406,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\symbol','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(!,:(flrdatatype_utils,flora_toLower(__X,__R))))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,toLower,__R,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(408,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\charlist','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(!,','(:(flrdatatype_utils,flora_toLower(__X,__R1)),atom_codes(__R1,__R)))),fllibexecute_delayed_calls([__R,__R1,__X],[__R,__X]))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,toList,__R,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(410,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\string','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(!,','(FLORA_THIS_WORKSPACE(d^mvd)(__X,rawValue,__newquantvar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar9)),atom_codes(__newquantvar7,__R))))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,toList,__R,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(412,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\symbol','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(!,atom_codes(__X,__R)))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,flapply(substring,__Beg,__End),__R,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(414,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\string','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(:(usermod,integer(__Beg)),','(:(usermod,integer(__End)),','(FLORA_THIS_WORKSPACE(d^mvd)(__X,length,__Len,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),','(fllibdelayedliteral(>=,'flrbasetype_string.flh',189,[__Beg,0]),','(';'(','(fllibdelayedliteral(>=,'flrbasetype_string.flh',189,[__End,__Beg]),fllibdelayedliteral(=<,'flrbasetype_string.flh',189,[__End,__Len])),','(fllibdelayedliteral(<,'flrbasetype_string.flh',189,[__End,0]),fllibdelayedliteral(=<,'flrbasetype_string.flh',189,[__Beg,+(__Len,__End)]))),','(!,','(','(FLORA_THIS_WORKSPACE(d^mvd)(__X,rawValue,__newquantvar9,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar11)),:(flrporting,flora_get_substring(__newquantvar9,__Beg,__End,__R1))),FLORA_THIS_WORKSPACE(d^mvd)('\\string',flapply(toType,__R1),__R,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar13)))))))))),fllibexecute_delayed_calls([__Beg,__End,__Len,__R,__R1,__X],[__Beg,__End,__R,__X]))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,flapply(substring,__Beg,__End),__R,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(416,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\symbol','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(:(usermod,integer(__Beg)),','(:(usermod,integer(__End)),','(FLORA_THIS_WORKSPACE(d^mvd)(__X,length,__Len,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),','(fllibdelayedliteral(>=,'flrbasetype_string.flh',197,[__Beg,0]),','(';'(','(fllibdelayedliteral(>=,'flrbasetype_string.flh',197,[__End,__Beg]),fllibdelayedliteral(=<,'flrbasetype_string.flh',197,[__End,__Len])),','(fllibdelayedliteral(<,'flrbasetype_string.flh',197,[__End,0]),fllibdelayedliteral(=<,'flrbasetype_string.flh',197,[__Beg,+(__Len,__End)]))),','(!,:(flrporting,flora_get_substring(__X,__Beg,__End,__R))))))))),fllibexecute_delayed_calls([__Beg,__End,__Len,__R,__X],[__Beg,__End,__R,__X]))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,flapply(substring,__Beg,__End),__R,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(418,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\charlist','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(','(:(flrdatatype,flora_is_nonvar_prim(__X)),','(:(usermod,integer(__Beg)),','(:(usermod,integer(__End)),','(FLORA_THIS_WORKSPACE(d^mvd)(__X,length,__Len,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)),','(fllibdelayedliteral(>=,'flrbasetype_string.flh',204,[__Beg,0]),','(';'(','(fllibdelayedliteral(>=,'flrbasetype_string.flh',204,[__End,__Beg]),fllibdelayedliteral(=<,'flrbasetype_string.flh',204,[__End,__Len])),','(fllibdelayedliteral(<,'flrbasetype_string.flh',204,[__End,0]),fllibdelayedliteral(=<,'flrbasetype_string.flh',204,[__Beg,+(__Len,__End)]))),','(!,','(atom_codes(__XX,__X),','(:(flrporting,flora_get_substring(__XX,__Beg,__End,__R1)),atom_codes(__R1,__R)))))))))),fllibexecute_delayed_calls([__Beg,__End,__Len,__R,__R1,__X,__XX],[__Beg,__End,__R,__X]))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,flapply(substring,__Beg,__End),__Y,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(420,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),','(';'(:(usermod,atom(__X)),:(usermod,is_charlist(__X))),','(';'(:(usermod,atom(__Y)),:(usermod,is_charlist(__Y))),','(!,','(','(FLORA_THIS_WORKSPACE(d^mvd)(__Y,rawValue,__newquantvar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5)),FLORA_THIS_WORKSPACE(d^mvd)(__X,rawValue,__newquantvar6,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))),:(flrporting,flora_match_substring(__newquantvar3,__newquantvar6,forward,__Beg,__End)))))))).
:-(fllibexport([[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar1,flapply(matchOne,__newdontcarevar2),__newdontcarevar3,__newcontextvar6))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar7,flapply(matchAll,__newdontcarevar8),__newdontcarevar9,__newcontextvar12))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar13,flapply(substitute,__newdontcarevar14,__newdontcarevar15),__newdontcarevar16,__newcontextvar19))]])).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Symbol,flapply(matchOne,__Pattern),__Result,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(422,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(check_pcrelib,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(usermod,atom(__Symbol)),','(:(usermod,atom(__Pattern)),','(!,','(','(','(flora_plg2hlg(__newvar5,__Pattern,flapply,0),','(flora_plg2hlg(__newvar6,__Symbol,flapply,0),','(flora_plg2hlg(__newvar7,__ResList,flapply,0),flora_plg2hlg(__newvar8,one,flapply,0)))),','(:(pcre,match(__newvar5,__newvar6,__newvar7,__newvar8)),','(flora_plg2hlg(__newvar5,__Pattern,flapply,1),','(flora_plg2hlg(__newvar6,__Symbol,flapply,1),','(flora_plg2hlg(__newvar7,__ResList,flapply,1),flora_plg2hlg(__newvar8,one,flapply,1)))))),=(__ResList,[__Result])))))),fllibexecute_delayed_calls([__Pattern,__ResList,__Result,__Symbol],[__Pattern,__Result,__Symbol])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Symbol,flapply(matchAll,__Pattern),__Result,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(424,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(check_pcrelib,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(usermod,atom(__Symbol)),','(:(usermod,atom(__Pattern)),','(!,','(','(','(flora_plg2hlg(__newvar5,__Pattern,flapply,0),','(flora_plg2hlg(__newvar6,__Symbol,flapply,0),','(flora_plg2hlg(__newvar7,__ResList,flapply,0),flora_plg2hlg(__newvar8,bulk,flapply,0)))),','(:(pcre,match(__newvar5,__newvar6,__newvar7,__newvar8)),','(flora_plg2hlg(__newvar5,__Pattern,flapply,1),','(flora_plg2hlg(__newvar6,__Symbol,flapply,1),','(flora_plg2hlg(__newvar7,__ResList,flapply,1),flora_plg2hlg(__newvar8,bulk,flapply,1)))))),=(__ResList,__Result)))))),fllibexecute_delayed_calls([__Pattern,__ResList,__Result,__Symbol],[__Pattern,__Result,__Symbol])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__Symbol,flapply(substitute,__Pattern,__Substitution),__Result,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(426,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(check_pcrelib,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)),','(:(usermod,atom(__Symbol)),','(:(usermod,atom(__Pattern)),','(:(usermod,atom(__Substitution)),','(!,','(:(pcre,substitute(__Pattern,__Symbol,__Substitution,__ResList)),=(__ResList,__Result))))))),fllibexecute_delayed_calls([__Pattern,__ResList,__Result,__Substitution,__Symbol],[__Pattern,__Result,__Substitution,__Symbol])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(check_pcrelib,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(428,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),','(fllibcatch(:(pcre,check_installation),__newdontcarevar3,FLORA_THIS_WORKSPACE(d^tblflapply)(pcrelib_missing_handler,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar5))),fllibexecute_delayed_calls([__newdontcarevar6],[])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(pcrelib_missing_handler,'_$ctxt'(_CallerModuleVar,__newcontextvar1,__newcontextvar2)),','('_$_$_ergo''rule_enabled'(430,'flrbasetype_string.flh',FLORA_THIS_MODULE_NAME),FLORA_WORKSPACE(\\system,d^tblflapply)(sysabort,['The pattern matching package has not been installed. Please
','	install the packages libpcre & libpcre-dev (or pcre & pcre-devel -- ','	whichever is appropriate for your system) then reconfigure Ergo.'],'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar4)))).
:-(fllibexport([[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar1,flapply(add,__newdontcarevar2),__newdontcarevar3,__newcontextvar6))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar7,flapply(times,__newdontcarevar8),__newdontcarevar9,__newcontextvar12))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar13,flapply(ratio,__newdontcarevar14),__newdontcarevar15,__newcontextvar18))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar19,unit,__newdontcarevar20,__newcontextvar23))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar24,amount,__newdontcarevar25,__newcontextvar28))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar29,description,__newdontcarevar30,__newcontextvar33))],[flexport(readable,FLORA_THIS_MODULE_NAME,[],FLORA_THIS_WORKSPACE(d^mvd)(__newdontcarevar34,sign,__newdontcarevar35,__newcontextvar38))]])).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,unit,__R,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(432,'flrbasetype_currency.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\currency','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),:(flrdatatype,money_unit(__X,__R))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,amount,__R,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(434,'flrbasetype_currency.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\currency','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),:(flrdatatype,money_amount(__X,__R))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,description,__R,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(436,'flrbasetype_currency.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\currency','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(:(flrdatatype,money_info(__X,__R,__newdontcarevar7)),fllibexecute_delayed_calls([__R,__X,__newdontcarevar8],[__R,__X]))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,sign,__R,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(438,'flrbasetype_currency.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\currency','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(:(flrdatatype,money_info(__X,__newdontcarevar7,__R)),fllibexecute_delayed_calls([__R,__X,__newdontcarevar8],[__R,__X]))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,flapply(add,-(__Y)),__R,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(440,'flrbasetype_currency.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\currency','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(','(!,','(:(flrdatatype,money_unit(__X,__U)),','(';'(:(flrdatatype,money_unit(__Y,__U)),:(usermod,number(__Y))),','(!,','(:(flrdatatype,flora_type_numeric_value(__X,__V)),','(:(flrdatatype,flora_type_numeric_value(__Y,__V2)),','(fllibdelayedliteral('\\is','flrbasetype_currency.flh',48,[__R1,-(__V,__V2)]),FLORA_THIS_WORKSPACE(d^mvd)('\\currency',flapply(toType,__U,__R1),__R,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))))))))),fllibexecute_delayed_calls([__R,__R1,__U,__V,__V2,__X,__Y],[__R,__X,__Y]))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,flapply(add,__Y),__R,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(442,'flrbasetype_currency.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\currency','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(','(:(flrdatatype,money_unit(__X,__U)),','(';'(:(flrdatatype,money_unit(__Y,__U)),:(usermod,number(__Y))),','(!,','(:(flrdatatype,flora_type_numeric_value(__X,__V)),','(:(flrdatatype,flora_type_numeric_value(__Y,__V2)),','(fllibdelayedliteral('\\is','flrbasetype_currency.flh',56,[__R1,+(__V,__V2)]),FLORA_THIS_WORKSPACE(d^mvd)('\\currency',flapply(toType,__U,__R1),__R,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8)))))))),fllibexecute_delayed_calls([__R,__R1,__U,__V,__V2,__X,__Y],[__R,__X,__Y]))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,flapply(times,__Y),__R,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(444,'flrbasetype_currency.flh',FLORA_THIS_MODULE_NAME),','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\currency','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(','(:(flrdatatype,money_unit(__X,__U)),','(:(usermod,number(__Y)),','(!,','(:(flrdatatype,flora_type_numeric_value(__X,__V)),','(fllibdelayedliteral('\\is','flrbasetype_currency.flh',64,[__R1,*(__V,__Y)]),FLORA_THIS_WORKSPACE(d^mvd)('\\currency',flapply(toType,__U,__R1),__R,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newcontextvar8))))))),fllibexecute_delayed_calls([__R,__R1,__U,__V,__X,__Y],[__R,__X,__Y]))))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,flapply(ratio,__Y),__R,'_$ctxt'(_CallerModuleVar,__newcontextvar9,__newcontextvar10)),','('_$_$_ergo''rule_enabled'(446,'flrbasetype_currency.flh',FLORA_THIS_MODULE_NAME),','(','(','(:(flrwhen,flora_put_attr(__newdontcarevar4,'\\$typed variable',','(__newdontcarevar1,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar1,'\\currency','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar3))))),=(__X,__newdontcarevar4)),','(:(flrwhen,flora_put_attr(__newdontcarevar8,'\\$typed variable',','(__newdontcarevar5,FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar5,'\\currency','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar7))))),=(__Y,__newdontcarevar8))),','(','(:(flrdatatype,money_unit(__X,__U)),','(:(flrdatatype,money_unit(__Y,__U)),','(!,','(:(flrdatatype,flora_type_numeric_value(__X,__V)),','(:(flrdatatype,flora_type_numeric_value(__Y,__V2)),','(fllibdelayedliteral('\\is','flrbasetype_currency.flh',73,[__R1,/(__V,__V2)]),FLORA_THIS_WORKSPACE(d^mvd)('\\currency',flapply(toType,__U,__R1),__R,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar12)))))))),fllibexecute_delayed_calls([__R,__R1,__U,__V,__V2,__X,__Y],[__R,__X,__Y]))))).

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
#define FLORA_FLS2_FILENAME  'flrbasetype.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('flrbasetype.ergo',FLORA_THIS_MODULE_NAME))).

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

:-(FLORA_THIS_WORKSPACE(class_type_error)(_h2312619,_h2312621,FWContext),FLORA_THIS_WORKSPACE(FLDYNZPREFIX_UNQ(class_type_error))(_h2312619,_h2312621,FWContext)).
