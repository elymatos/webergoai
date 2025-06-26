
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

#define FLORA_COMPILATION_ID 2

#mode save
#mode nocomment "%"
#define FLORA_THIS_FILENAME  'family_obj.ergo'
#mode restore
/************************************************************************
  file: headerinc/flrheader2_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
  It has files that must be included in the header and typically
  contain some Prolog statements. Such files cannot appear
  in flrheader.flh because flrheader.flh is included in various restricted
  contexts where Prolog statements are not allowed.

  Included ONLY IN ADDED files (compiled for addition)
************************************************************************/

:-(compiler_options([xpp_on])).

#define TABLING_CONNECTIVE  :-

%% flora_tabling_methods is included here to affect preprocessing of
%% <filename>.flt files, which contain table declarations for Prolog and
%% UDF predicates.
#include "flora_tabling_methods.flh"

%% include list of tabled predicates
#mode save
#mode nocomment "%"
#if defined(FLORA_FLT_FILENAME)
#include FLORA_FLT_FILENAME
#endif
#mode restore

/***********************************************************************/

:-(import(from(/(flora_warning_line,1),flrprint))).
?-(catch(abolish_all_tables,_,flora_warning_line('a tabled subgoal depends on ~w.~n		  The program might not function correctly.~n		  Indicator: ~w~n		  Offending module:  ~w~n		  Offending predicate: ~w~n', ['\\add', FLORA_THIS_FILENAME, FLORA_THIS_MODULE_NAME]))).
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
  file: syslibinc/flrdynrule_inc.flh

  Author(s): Chang Zhao

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLSYSRULEUPDATE))).

/***********************************************************************/

/************************************************************************
  file: syslibinc/flrdynrule_inc.flh

  Author(s): Chang Zhao

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLSYSRULEUPDATE))).

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

#ifndef FLORA_TABLING_METHODS_INCLUDED
#include "flora_tabling_methods.flh"
#endif
 
#if !defined(FLORA_FDB_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FDB_FILENAME  'family_obj#for_add.fdb'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FDB_FILENAME,FLORA_THIS_MODULE_NAME,'fdb'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_canonical_and_insert(FLORA_FDB_FILENAME,FLORA_THIS_FDB_STORAGE))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'family_obj#for_add.fld'
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


%%%%%%%%%%%%%%%%%%%%%%%%%%% Rule insertion statements %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(','(:(flrwhen,flora_put_attr(__newvar4,'\\$dynrule variable',[=('?Y',__Y),=('?X',__X)])),','(:(flrwhen,flora_put_attr(__newvar3,'\\$dynrule variable',[=('?X',__X),=('?Y',__Y)])),fllibinsertrule_z(FLORA_THIS_MODULE_NAME,[flsysruleupdate(__newvar1,dynrule('family_obj.flr'),'_$_$_ergo''descr_vars',20,['_$_$_ergo''prop_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,type,rule,'_$_$_ergo''descr_vars'),'_$_$_ergo''tag_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,__newvar1,'_$_$_ergo''descr_vars'),'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),'_$_$_ergo''bool_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,strict,'_$_$_ergo''descr_vars')],[FLORA_THIS_WORKSPACE(d^mvd)(__X,spouse,__Y,'_$ctxt'(_DynRuleCallerModuleVar,__newvar1,__newcontextvar2))],FLORA_THIS_WORKSPACE(d^mvd)(__Y,spouse,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newvar1)),__newvar3,__newvar4,true,[null],[null],'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),[null],true)])))).
?-(','(:(flrwhen,flora_put_attr(__newvar4,'\\$dynrule variable',[=('?X',__X),=('?Y',__Y)])),','(:(flrwhen,flora_put_attr(__newvar3,'\\$dynrule variable',[=('?X',__X),=('?Y',__Y)])),fllibinsertrule_z(FLORA_THIS_MODULE_NAME,[flsysruleupdate(__newvar1,dynrule('family_obj.flr'),'_$_$_ergo''descr_vars',21,['_$_$_ergo''prop_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,type,rule,'_$_$_ergo''descr_vars'),'_$_$_ergo''tag_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,__newvar1,'_$_$_ergo''descr_vars'),'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),'_$_$_ergo''bool_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,strict,'_$_$_ergo''descr_vars')],[FLORA_THIS_WORKSPACE(d^mvd)(__X,parent,__Y,'_$ctxt'(_DynRuleCallerModuleVar,__newvar1,__newcontextvar2))],FLORA_THIS_WORKSPACE(d^mvd)(__X,father,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newvar1)),__newvar3,__newvar4,true,[null],[null],'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),[null],true)])))).
?-(','(:(flrwhen,flora_put_attr(__newvar4,'\\$dynrule variable',[=('?X',__X),=('?Y',__Y)])),','(:(flrwhen,flora_put_attr(__newvar3,'\\$dynrule variable',[=('?X',__X),=('?Y',__Y)])),fllibinsertrule_z(FLORA_THIS_MODULE_NAME,[flsysruleupdate(__newvar1,dynrule('family_obj.flr'),'_$_$_ergo''descr_vars',22,['_$_$_ergo''prop_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,type,rule,'_$_$_ergo''descr_vars'),'_$_$_ergo''tag_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,__newvar1,'_$_$_ergo''descr_vars'),'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),'_$_$_ergo''bool_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,strict,'_$_$_ergo''descr_vars')],[FLORA_THIS_WORKSPACE(d^mvd)(__X,parent,__Y,'_$ctxt'(_DynRuleCallerModuleVar,__newvar1,__newcontextvar2))],FLORA_THIS_WORKSPACE(d^mvd)(__X,mother,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newvar1)),__newvar3,__newvar4,true,[null],[null],'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),[null],true)])))).
?-(','(:(flrwhen,flora_put_attr(__newvar4,'\\$dynrule variable',[=('?Y',__Y),=('?X',__X)])),','(:(flrwhen,flora_put_attr(__newvar3,'\\$dynrule variable',[=('?X',__X),=('?Y',__Y)])),fllibinsertrule_z(FLORA_THIS_MODULE_NAME,[flsysruleupdate(__newvar1,dynrule('family_obj.flr'),'_$_$_ergo''descr_vars',23,['_$_$_ergo''prop_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,type,rule,'_$_$_ergo''descr_vars'),'_$_$_ergo''tag_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,__newvar1,'_$_$_ergo''descr_vars'),'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),'_$_$_ergo''bool_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,strict,'_$_$_ergo''descr_vars')],[FLORA_THIS_WORKSPACE(d^mvd)(__X,son,__Y,'_$ctxt'(_DynRuleCallerModuleVar,__newvar1,__newcontextvar2))],','(FLORA_THIS_WORKSPACE(d^mvd)(__Y,parent,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newvar1)),FLORA_THIS_WORKSPACE(d^isa)(__Y,male,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newvar1))),__newvar3,__newvar4,true,[null],[null],'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),[null],true)])))).
?-(','(:(flrwhen,flora_put_attr(__newvar4,'\\$dynrule variable',[=('?Y',__Y),=('?X',__X)])),','(:(flrwhen,flora_put_attr(__newvar3,'\\$dynrule variable',[=('?X',__X),=('?Y',__Y)])),fllibinsertrule_z(FLORA_THIS_MODULE_NAME,[flsysruleupdate(__newvar1,dynrule('family_obj.flr'),'_$_$_ergo''descr_vars',24,['_$_$_ergo''prop_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,type,rule,'_$_$_ergo''descr_vars'),'_$_$_ergo''tag_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,__newvar1,'_$_$_ergo''descr_vars'),'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),'_$_$_ergo''bool_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,strict,'_$_$_ergo''descr_vars')],[FLORA_THIS_WORKSPACE(d^mvd)(__X,daughter,__Y,'_$ctxt'(_DynRuleCallerModuleVar,__newvar1,__newcontextvar2))],','(FLORA_THIS_WORKSPACE(d^mvd)(__Y,parent,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newvar1)),FLORA_THIS_WORKSPACE(d^isa)(__Y,female,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newvar1))),__newvar3,__newvar4,true,[null],[null],'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),[null],true)])))).
?-(','(:(flrwhen,flora_put_attr(__newvar4,'\\$dynrule variable',[=('?X',__X),=('?Y',__Y)])),','(:(flrwhen,flora_put_attr(__newvar3,'\\$dynrule variable',[=('?X',__X),=('?Y',__Y)])),fllibinsertrule_z(FLORA_THIS_MODULE_NAME,[flsysruleupdate(__newvar1,dynrule('family_obj.flr'),'_$_$_ergo''descr_vars',25,['_$_$_ergo''prop_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,type,rule,'_$_$_ergo''descr_vars'),'_$_$_ergo''tag_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,__newvar1,'_$_$_ergo''descr_vars'),'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),'_$_$_ergo''bool_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,strict,'_$_$_ergo''descr_vars')],[FLORA_THIS_WORKSPACE(d^mvd)(__X,brother,__Y,'_$ctxt'(_DynRuleCallerModuleVar,__newvar1,__newcontextvar2))],','(','(FLORA_THIS_WORKSPACE(d^mvd)(__X,parent,__newquantvar5,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newvar1)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar5,son,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newvar1))),\+(=(__X,__Y))),__newvar3,__newvar4,true,[null],[null],'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),[null],true)])))).
?-(','(:(flrwhen,flora_put_attr(__newvar4,'\\$dynrule variable',[=('?X',__X),=('?Y',__Y)])),','(:(flrwhen,flora_put_attr(__newvar3,'\\$dynrule variable',[=('?X',__X),=('?Y',__Y)])),fllibinsertrule_z(FLORA_THIS_MODULE_NAME,[flsysruleupdate(__newvar1,dynrule('family_obj.flr'),'_$_$_ergo''descr_vars',26,['_$_$_ergo''prop_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,type,rule,'_$_$_ergo''descr_vars'),'_$_$_ergo''tag_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,__newvar1,'_$_$_ergo''descr_vars'),'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),'_$_$_ergo''bool_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,strict,'_$_$_ergo''descr_vars')],[FLORA_THIS_WORKSPACE(d^mvd)(__X,sister,__Y,'_$ctxt'(_DynRuleCallerModuleVar,__newvar1,__newcontextvar2))],','(','(FLORA_THIS_WORKSPACE(d^mvd)(__X,parent,__newquantvar5,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newvar1)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar5,daughter,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newvar1))),\+(=(__X,__Y))),__newvar3,__newvar4,true,[null],[null],'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),[null],true)])))).
?-(','(:(flrwhen,flora_put_attr(__newvar4,'\\$dynrule variable',[=('?X',__X),=('?Y',__Y)])),','(:(flrwhen,flora_put_attr(__newvar3,'\\$dynrule variable',[=('?X',__X),=('?Y',__Y)])),fllibinsertrule_z(FLORA_THIS_MODULE_NAME,[flsysruleupdate(__newvar1,dynrule('family_obj.flr'),'_$_$_ergo''descr_vars',27,['_$_$_ergo''prop_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,type,rule,'_$_$_ergo''descr_vars'),'_$_$_ergo''tag_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,__newvar1,'_$_$_ergo''descr_vars'),'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),'_$_$_ergo''bool_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,strict,'_$_$_ergo''descr_vars')],[FLORA_THIS_WORKSPACE(d^mvd)(__X,brother_in_law,__Y,'_$ctxt'(_DynRuleCallerModuleVar,__newvar1,__newcontextvar2))],','(FLORA_THIS_WORKSPACE(d^mvd)(__X,sister,__newquantvar5,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newvar1)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar5,spouse,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newvar1))),__newvar3,__newvar4,true,[null],[null],'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),[null],true)])))).
?-(','(:(flrwhen,flora_put_attr(__newvar4,'\\$dynrule variable',[=('?X',__X),=('?Y',__Y)])),','(:(flrwhen,flora_put_attr(__newvar3,'\\$dynrule variable',[=('?X',__X),=('?Y',__Y)])),fllibinsertrule_z(FLORA_THIS_MODULE_NAME,[flsysruleupdate(__newvar1,dynrule('family_obj.flr'),'_$_$_ergo''descr_vars',28,['_$_$_ergo''prop_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,type,rule,'_$_$_ergo''descr_vars'),'_$_$_ergo''tag_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,__newvar1,'_$_$_ergo''descr_vars'),'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),'_$_$_ergo''bool_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,strict,'_$_$_ergo''descr_vars')],[FLORA_THIS_WORKSPACE(d^mvd)(__X,brother_in_law,__Y,'_$ctxt'(_DynRuleCallerModuleVar,__newvar1,__newcontextvar2))],','(FLORA_THIS_WORKSPACE(d^mvd)(__X,spouse,__newquantvar5,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newvar1)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar5,brother,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newvar1))),__newvar3,__newvar4,true,[null],[null],'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),[null],true)])))).
?-(','(:(flrwhen,flora_put_attr(__newvar4,'\\$dynrule variable',[=('?X',__X),=('?Y',__Y)])),','(:(flrwhen,flora_put_attr(__newvar3,'\\$dynrule variable',[=('?X',__X),=('?Y',__Y)])),fllibinsertrule_z(FLORA_THIS_MODULE_NAME,[flsysruleupdate(__newvar1,dynrule('family_obj.flr'),'_$_$_ergo''descr_vars',29,['_$_$_ergo''prop_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,type,rule,'_$_$_ergo''descr_vars'),'_$_$_ergo''tag_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,__newvar1,'_$_$_ergo''descr_vars'),'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),'_$_$_ergo''bool_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,strict,'_$_$_ergo''descr_vars')],[FLORA_THIS_WORKSPACE(d^mvd)(__X,sister_in_law,__Y,'_$ctxt'(_DynRuleCallerModuleVar,__newvar1,__newcontextvar2))],','(FLORA_THIS_WORKSPACE(d^mvd)(__X,brother,__newquantvar5,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newvar1)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar5,spouse,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newvar1))),__newvar3,__newvar4,true,[null],[null],'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),[null],true)])))).
?-(','(:(flrwhen,flora_put_attr(__newvar4,'\\$dynrule variable',[=('?X',__X),=('?Y',__Y)])),','(:(flrwhen,flora_put_attr(__newvar3,'\\$dynrule variable',[=('?X',__X),=('?Y',__Y)])),fllibinsertrule_z(FLORA_THIS_MODULE_NAME,[flsysruleupdate(__newvar1,dynrule('family_obj.flr'),'_$_$_ergo''descr_vars',30,['_$_$_ergo''prop_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,type,rule,'_$_$_ergo''descr_vars'),'_$_$_ergo''tag_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,__newvar1,'_$_$_ergo''descr_vars'),'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),'_$_$_ergo''bool_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,strict,'_$_$_ergo''descr_vars')],[FLORA_THIS_WORKSPACE(d^mvd)(__X,sister_in_law,__Y,'_$ctxt'(_DynRuleCallerModuleVar,__newvar1,__newcontextvar2))],','(FLORA_THIS_WORKSPACE(d^mvd)(__X,spouse,__newquantvar5,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newvar1)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar5,sister,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newvar1))),__newvar3,__newvar4,true,[null],[null],'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),[null],true)])))).
?-(','(:(flrwhen,flora_put_attr(__newvar4,'\\$dynrule variable',[=('?X',__X),=('?Y',__Y)])),','(:(flrwhen,flora_put_attr(__newvar3,'\\$dynrule variable',[=('?X',__X),=('?Y',__Y)])),fllibinsertrule_z(FLORA_THIS_MODULE_NAME,[flsysruleupdate(__newvar1,dynrule('family_obj.flr'),'_$_$_ergo''descr_vars',31,['_$_$_ergo''prop_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,type,rule,'_$_$_ergo''descr_vars'),'_$_$_ergo''tag_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,__newvar1,'_$_$_ergo''descr_vars'),'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),'_$_$_ergo''bool_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,strict,'_$_$_ergo''descr_vars')],[FLORA_THIS_WORKSPACE(d^mvd)(__X,uncle,__Y,'_$ctxt'(_DynRuleCallerModuleVar,__newvar1,__newcontextvar2))],','(FLORA_THIS_WORKSPACE(d^mvd)(__X,parent,__newquantvar5,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newvar1)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar5,brother,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newvar1))),__newvar3,__newvar4,true,[null],[null],'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),[null],true)])))).
?-(','(:(flrwhen,flora_put_attr(__newvar4,'\\$dynrule variable',[=('?X',__X),=('?Y',__Y)])),','(:(flrwhen,flora_put_attr(__newvar3,'\\$dynrule variable',[=('?X',__X),=('?Y',__Y)])),fllibinsertrule_z(FLORA_THIS_MODULE_NAME,[flsysruleupdate(__newvar1,dynrule('family_obj.flr'),'_$_$_ergo''descr_vars',32,['_$_$_ergo''prop_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,type,rule,'_$_$_ergo''descr_vars'),'_$_$_ergo''tag_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,__newvar1,'_$_$_ergo''descr_vars'),'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),'_$_$_ergo''bool_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,strict,'_$_$_ergo''descr_vars')],[FLORA_THIS_WORKSPACE(d^mvd)(__X,uncle,__Y,'_$ctxt'(_DynRuleCallerModuleVar,__newvar1,__newcontextvar2))],','(FLORA_THIS_WORKSPACE(d^mvd)(__X,parent,__newquantvar5,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newvar1)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar5,brother_in_law,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newvar1))),__newvar3,__newvar4,true,[null],[null],'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),[null],true)])))).
?-(','(:(flrwhen,flora_put_attr(__newvar4,'\\$dynrule variable',[=('?X',__X),=('?Y',__Y)])),','(:(flrwhen,flora_put_attr(__newvar3,'\\$dynrule variable',[=('?X',__X),=('?Y',__Y)])),fllibinsertrule_z(FLORA_THIS_MODULE_NAME,[flsysruleupdate(__newvar1,dynrule('family_obj.flr'),'_$_$_ergo''descr_vars',33,['_$_$_ergo''prop_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,type,rule,'_$_$_ergo''descr_vars'),'_$_$_ergo''tag_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,__newvar1,'_$_$_ergo''descr_vars'),'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),'_$_$_ergo''bool_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,strict,'_$_$_ergo''descr_vars')],[FLORA_THIS_WORKSPACE(d^mvd)(__X,aunt,__Y,'_$ctxt'(_DynRuleCallerModuleVar,__newvar1,__newcontextvar2))],','(FLORA_THIS_WORKSPACE(d^mvd)(__X,parent,__newquantvar5,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newvar1)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar5,sister,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newvar1))),__newvar3,__newvar4,true,[null],[null],'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),[null],true)])))).
?-(','(:(flrwhen,flora_put_attr(__newvar4,'\\$dynrule variable',[=('?X',__X),=('?Y',__Y)])),','(:(flrwhen,flora_put_attr(__newvar3,'\\$dynrule variable',[=('?X',__X),=('?Y',__Y)])),fllibinsertrule_z(FLORA_THIS_MODULE_NAME,[flsysruleupdate(__newvar1,dynrule('family_obj.flr'),'_$_$_ergo''descr_vars',34,['_$_$_ergo''prop_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,type,rule,'_$_$_ergo''descr_vars'),'_$_$_ergo''tag_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,__newvar1,'_$_$_ergo''descr_vars'),'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),'_$_$_ergo''bool_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,strict,'_$_$_ergo''descr_vars')],[FLORA_THIS_WORKSPACE(d^mvd)(__X,aunt,__Y,'_$ctxt'(_DynRuleCallerModuleVar,__newvar1,__newcontextvar2))],','(FLORA_THIS_WORKSPACE(d^mvd)(__X,parent,__newquantvar5,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newvar1)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar5,sister_in_law,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newvar1))),__newvar3,__newvar4,true,[null],[null],'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),[null],true)])))).
?-(','(:(flrwhen,flora_put_attr(__newvar4,'\\$dynrule variable',[=('?X',__X),=('?Y',__Y)])),','(:(flrwhen,flora_put_attr(__newvar3,'\\$dynrule variable',[=('?X',__X),=('?Y',__Y)])),fllibinsertrule_z(FLORA_THIS_MODULE_NAME,[flsysruleupdate(__newvar1,dynrule('family_obj.flr'),'_$_$_ergo''descr_vars',35,['_$_$_ergo''prop_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,type,rule,'_$_$_ergo''descr_vars'),'_$_$_ergo''tag_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,__newvar1,'_$_$_ergo''descr_vars'),'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),'_$_$_ergo''bool_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,strict,'_$_$_ergo''descr_vars')],[FLORA_THIS_WORKSPACE(d^mvd)(__X,ancestor,__Y,'_$ctxt'(_DynRuleCallerModuleVar,__newvar1,__newcontextvar2))],FLORA_THIS_WORKSPACE(d^mvd)(__X,parent,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newvar1)),__newvar3,__newvar4,true,[null],[null],'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),[null],true)])))).
?-(','(:(flrwhen,flora_put_attr(__newvar4,'\\$dynrule variable',[=('?X',__X),=('?Y',__Y)])),','(:(flrwhen,flora_put_attr(__newvar3,'\\$dynrule variable',[=('?X',__X),=('?Y',__Y)])),fllibinsertrule_z(FLORA_THIS_MODULE_NAME,[flsysruleupdate(__newvar1,dynrule('family_obj.flr'),'_$_$_ergo''descr_vars',36,['_$_$_ergo''prop_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,type,rule,'_$_$_ergo''descr_vars'),'_$_$_ergo''tag_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,__newvar1,'_$_$_ergo''descr_vars'),'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),'_$_$_ergo''bool_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,strict,'_$_$_ergo''descr_vars')],[FLORA_THIS_WORKSPACE(d^mvd)(__X,ancestor,__Y,'_$ctxt'(_DynRuleCallerModuleVar,__newvar1,__newcontextvar2))],','(FLORA_THIS_WORKSPACE(d^mvd)(__X,ancestor,__newquantvar5,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newvar1)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar5,ancestor,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newvar1))),__newvar3,__newvar4,true,[null],[null],'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),[null],true)])))).
?-(','(:(flrwhen,flora_put_attr(__newvar4,'\\$dynrule variable',[=('?X',__X),=('?F',__F),=('?M',__M),=('?S',__S)])),','(:(flrwhen,flora_put_attr(__newvar3,'\\$dynrule variable',[=('?X',__X)])),fllibinsertrule_z(FLORA_THIS_MODULE_NAME,[flsysruleupdate(__newvar1,dynrule('family_obj.flr'),'_$_$_ergo''descr_vars',37,['_$_$_ergo''prop_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,type,rule,'_$_$_ergo''descr_vars'),'_$_$_ergo''tag_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,__newvar1,'_$_$_ergo''descr_vars'),'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),'_$_$_ergo''bool_descriptor'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME,strict,'_$_$_ergo''descr_vars')],[FLORA_THIS_WORKSPACE(d^isa)(__X,illegitimate,'_$ctxt'(_DynRuleCallerModuleVar,__newvar1,__newcontextvar2))],','(','(FLORA_THIS_WORKSPACE(d^mvd)(__X,father,__F,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newvar1)),FLORA_THIS_WORKSPACE(d^mvd)(__X,mother,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newvar1))),','(FLORA_THIS_WORKSPACE(d^mvd)(__M,spouse,__S,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,__newvar1)),\=(__S,__F))),__newvar3,__newvar4,true,[null],[null],'_$_$_ergo''rule_enabled'(__newvar1,dynrule('family_obj.flr'),FLORA_THIS_MODULE_NAME),[fllibexecute_delayed_calls([__F,__M,__S,__X],[__X])],true)])))).


%%%%%%%%%%%%%%%%%%%%%%%%% Signatures for latent queries %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%% Queries found in the source file %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(FLORA_WORKSPACE(\\io,d^tblflapply)(writeln,'Q1','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar2)),FLORA_THIS_WORKSPACE(d^isa)(albert,__C,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar4)))),[=('?C',__C)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(FLORA_WORKSPACE(\\io,d^tblflapply)(writeln,'Q2','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar2)),','(','(FLORA_THIS_WORKSPACE(d^mvdsig)(albert,__M,__newdontcarevar4,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar5)),FLORA_THIS_WORKSPACE(d^mvdcon)(albert,__M,1,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar7))),FLORA_THIS_WORKSPACE(d^mvd)(albert,__M,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar9))))),[=('?M',__M),=('?X',__X)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(FLORA_WORKSPACE(\\io,d^tblflapply)(writeln,'Q3','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar2)),','(FLORA_THIS_WORKSPACE(d^mvd)(albert,__M,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar4)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(','(FLORA_THIS_WORKSPACE(d^mvdsig)(albert,__M,__newdontcarevar6,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar7)),FLORA_THIS_WORKSPACE(d^mvdcon)(albert,__M,1,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar9))),fllibexecute_delayed_calls([__M],[]))),[],92,'family_obj.flr'))))),[=('?M',__M),=('?X',__X)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(FLORA_WORKSPACE(\\io,d^tblflapply)(writeln,'Q5','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar2)),','(','(FLORA_THIS_WORKSPACE(d^mvdsig)(___o,__S,__newdontcarevar4,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar5)),FLORA_THIS_WORKSPACE(d^mvdcon)(___o,__S,1,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar7))),FLORA_THIS_WORKSPACE(d^mvd)(___o,__S,__newquantvar9,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar10))))),[=('?S',__S)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(FLORA_WORKSPACE(\\io,d^tblflapply)(writeln,'Q6','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar2)),','(FLORA_THIS_WORKSPACE(d^mvd)(___o,__M,__newquantvar4,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar5)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(','(FLORA_THIS_WORKSPACE(d^mvdsig)(___o,__M,__newdontcarevar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar8)),FLORA_THIS_WORKSPACE(d^mvdcon)(___o,__M,1,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar10))),fllibexecute_delayed_calls([__M,___o],[]))),[],96,'family_obj.flr'))))),[=('?M',__M)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(FLORA_WORKSPACE(\\io,d^tblflapply)(writeln,'Q7','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar2)),','(FLORA_THIS_WORKSPACE(d^exists)(__newdontcarevar4,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar7)),FLORA_THIS_WORKSPACE(d^isa)(__newdontcarevar4,__C,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar5))))),[=('?C',__C)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(FLORA_WORKSPACE(\\io,d^tblflapply)(writeln,'Q8','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar2)),','(','(FLORA_THIS_WORKSPACE(d^mvd)(albert,parent,__newquantvar4,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar5)),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar4,uncle,__newquantvar7,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,__newcontextvar8))),FLORA_THIS_WORKSPACE(d^mvd)(__newquantvar7,sister_in_law,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar10))))),[=('?Y',__Y)])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),','(FLORA_WORKSPACE(\\io,d^tblflapply)(writeln,'Q9','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,__newcontextvar2)),FLORA_THIS_WORKSPACE(d^mvd)(__X,sister_in_law,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,__newcontextvar4)))),[=('?X',__X),=('?Y',__Y)])).

 
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

