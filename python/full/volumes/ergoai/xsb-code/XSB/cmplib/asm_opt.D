% THIS FILE IS AUTOMATICALLY GENERATED.
% DO NOT EDIT; ALL CHANGES WILL BE LOST!

:- mode asm_direct(?,?,+,?).
:- mode asm_opt(?,?,?,+,?).
:- mode asm_optimize(?,?,+,?).
:- mode asm_pre(?,?,?).
:- mode asm_transform(?,?,?).
:- mode force_asm_opt_loaded.

:- mode_on_success asm_direct(A,B,g,A).
:- mode_on_success asm_direct(ng,ng,g,g).
:- mode_on_success asm_opt(g,A,B,g,g).
:- mode_on_success asm_opt(g,ng,A,g,ng).
:- mode_on_success asm_opt(ng,A,B,g,C).
:- mode_on_success asm_optimize(A,B,g,A).
:- mode_on_success asm_optimize(ng,ng,g,g).
:- mode_on_success asm_pre(A,B,g).
:- mode_on_success asm_pre(g,ng,ng).
:- mode_on_success asm_pre(ng,A,ng).
:- mode_on_success asm_transform(A,B,g).
:- mode_on_success asm_transform(g,ng,ng).
:- mode_on_success asm_transform(ng,A,ng).
:- mode_on_success force_asm_opt_loaded.
