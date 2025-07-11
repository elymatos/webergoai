% THIS FILE IS AUTOMATICALLY GENERATED.
% DO NOT EDIT; ALL CHANGES WILL BE LOST!

:- mode body_calls_sym(?,?).
:- mode call_in_arg(?,?).
:- mode call_in_meta_pred(?,?).
:- mode call_themselves(?,?,?).
:- mode 'cheaper table choice'(+,+,?,?,?).
:- mode 'cheaper table choice'(+,?,?,?,?).
:- mode 'cheaper table choice'(?,+,?,?,?).
:- mode 'cheaper table choice'(?,?,?,?,?).
:- mode clauses_call_sym(?,?).
:- mode decreasing_ground_arg(?,?,+,?).
:- mode exclude(?,?,?,?).
:- mode 'exported choice'(+,+,?,?,?).
:- mode 'exported choice'(+,?,?,?,?).
:- mode 'exported choice'(?,+,?,?,?).
:- mode 'exported choice'(?,?,?,?,?).
:- mode goal_arg(?,?).
:- mode goal_arg_smaller(?,?).
:- mode 'greedy choice'(?,+,?,+,?).
:- mode 'greedy choice'(?,?,?,?,?).
:- mode 'greedy choice'(+,?,+,?,?).
:- mode 'greedy choice'(+,+,+,+,?).
:- mode is_meta_pred(?).
:- mode lp(?,?,?).
:- mode lp(?,?,?).
:- mode lp_num(?,?,?,?,+,?).
:- mode lp_num(+,+,+,+,+,?).
:- mode lp_sym(?,?,?,+,?).
:- mode lp_sym(+,+,?,+,?).
:- mode lp_sym(?,+,?,+,?).
:- mode needs_tabling(?).
:- mode optimal_sym(?,?,?).
:- mode path(?,?,?).
:- mode path_in_body(?,?,?,?).
:- mode path_in_clauses(?,?,?,?).
:- mode path_in_meta_pred_arg(?,?,?,?).
:- mode path_in_meta_pred_args(?,?,?,?).
:- mode perform_auto_table(?).
:- mode perform_table_all(?).
:- mode proven_terminating(?).
:- mode remove_tabled_preds(?,?).
:- mode table_all_predicates(?).
:- mode table_arg(?,+,+).
:- mode table_immediate_recursions(?,?).
:- mode table_in_clause(?).
:- mode table_in_pred(?).
:- mode table_it(?).
:- mode table_preds_in_tabling_meta_preds(?).
:- mode table_preds_in_tabling_meta_preds(?,?,?).
:- mode table_sym_of_arg(?,+,+).
:- mode table_to_break_all_loops(?).
:- mode tabling_meta_predicate_exists(?).
:- mode terminating_body(?,?,?,?).
:- mode terminating_body(?,?,?,+).
:- mode terminating_clauses(?,?,?).
:- mode terminating_clauses(?,?,+).
:- mode 'two way choice'(?,?,?).
:- mode var_in_structure(?,?).

:- mode_on_success body_calls_sym(A,g).
:- mode_on_success body_calls_sym(A,A).
:- mode_on_success body_calls_sym(ng,A).
:- mode_on_success call_in_arg(A,g).
:- mode_on_success call_in_arg(A,A).
:- mode_on_success call_in_arg(ng,A).
:- mode_on_success call_in_meta_pred(A,g).
:- mode_on_success call_in_meta_pred(A,A).
:- mode_on_success call_in_meta_pred(ng,A).
:- mode_on_success call_themselves(A,g,B).
:- mode_on_success call_themselves(ng,ng,A).
:- mode_on_success 'cheaper table choice'(A,g,ng,g,B).
:- mode_on_success 'cheaper table choice'(A,ng,ng,ng,ng).
:- mode_on_success 'cheaper table choice'(g,g,A,ng,ng).
:- mode_on_success 'cheaper table choice'(g,g,g,A,g).
:- mode_on_success 'cheaper table choice'(g,ng,g,ng,A).
:- mode_on_success 'cheaper table choice'(ng,g,ng,ng,ng).
:- mode_on_success clauses_call_sym(A,g).
:- mode_on_success clauses_call_sym(ng,A).
:- mode_on_success decreasing_ground_arg(A,B,g,C).
:- mode_on_success exclude(A,g,g,A).
:- mode_on_success exclude(g,A,B,g).
:- mode_on_success exclude(ng,A,B,C).
:- mode_on_success 'exported choice'(A,g,ng,g,B).
:- mode_on_success 'exported choice'(A,ng,ng,ng,ng).
:- mode_on_success 'exported choice'(g,g,A,ng,ng).
:- mode_on_success 'exported choice'(g,g,g,A,g).
:- mode_on_success 'exported choice'(g,ng,g,ng,A).
:- mode_on_success 'exported choice'(ng,g,ng,ng,ng).
:- mode_on_success goal_arg(A,g).
:- mode_on_success goal_arg(ng,A).
:- mode_on_success goal_arg_smaller(g,A).
:- mode_on_success goal_arg_smaller(ng,ng).
:- mode_on_success 'greedy choice'(g,g,A,ng,ng).
:- mode_on_success 'greedy choice'(g,g,g,A,g).
:- mode_on_success 'greedy choice'(g,g,ng,g,A).
:- mode_on_success is_meta_pred(A).
:- mode_on_success lp(g,A,g).
:- mode_on_success lp(ng,ng,A).
:- mode_on_success lp_num(A,B,C,ng,g,g).
:- mode_on_success lp_num(g,g,g,g,g,g).
:- mode_on_success lp_sym(A,ng,ng,g,g).
:- mode_on_success lp_sym(g,g,A,g,g).
:- mode_on_success lp_sym(ng,g,ng,g,g).
:- mode_on_success needs_tabling(A).
:- mode_on_success optimal_sym(A,ng,ng).
:- mode_on_success optimal_sym(g,A,g).
:- mode_on_success optimal_sym(ng,g,A).
:- mode_on_success optimal_sym(ng,ng,g).
:- mode_on_success path(A,ng,g).
:- mode_on_success path(A,B,ng).
:- mode_on_success path(g,g,A).
:- mode_on_success path(ng,g,g).
:- mode_on_success path_in_body(A,B,C,D).
:- mode_on_success path_in_clauses(A,B,C,D).
:- mode_on_success path_in_meta_pred_arg(A,B,C,D).
:- mode_on_success path_in_meta_pred_args(A,B,C,D).
:- mode_on_success perform_auto_table(A).
:- mode_on_success perform_table_all(A).
:- mode_on_success proven_terminating(A).
:- mode_on_success remove_tabled_preds(A,g).
:- mode_on_success remove_tabled_preds(ng,ng).
:- mode_on_success table_all_predicates(A).
:- mode_on_success table_arg(A,g,g).
:- mode_on_success table_immediate_recursions(A,g).
:- mode_on_success table_immediate_recursions(ng,ng).
:- mode_on_success table_in_clause(A).
:- mode_on_success table_in_pred(A).
:- mode_on_success table_it(A).
:- mode_on_success table_preds_in_tabling_meta_preds(A).
:- mode_on_success table_preds_in_tabling_meta_preds(A,ng,g).
:- mode_on_success table_preds_in_tabling_meta_preds(A,B,B).
:- mode_on_success table_sym_of_arg(A,g,g).
:- mode_on_success table_to_break_all_loops(A).
:- mode_on_success tabling_meta_predicate_exists(A).
:- mode_on_success terminating_body(A,B,ng,C).
:- mode_on_success terminating_body(A,B,C,g).
:- mode_on_success terminating_clauses(A,ng,B).
:- mode_on_success terminating_clauses(A,B,g).
:- mode_on_success 'two way choice'(A,ng,ng).
:- mode_on_success 'two way choice'(g,A,g).
:- mode_on_success 'two way choice'(ng,g,A).
:- mode_on_success var_in_structure(g,A).
:- mode_on_success var_in_structure(ng,ng).
