%% This file is generated on-the-fly by curlconfig.P
%% Do not edit--any changes will be written over.
%% config:    x86_64-pc-linux-gnu
%% CC:        gcc
%% CC Opts:    -O3 -fno-strict-aliasing   -fPIC -Wall -pipe -fsigned-char    -I /home/ematos/devel/ergo/XSB/config/x86_64-pc-linux-gnu /home/ematos/devel/ergo/XSB/packages/curl/cc/load_page.c
:- export pl_load_page/1, curl_allocate_error_term/2, curl_finalize_warn/1, pl_encode_url/2.
:- ldoption('  -lm -ldl -Wl,-export-dynamic -lpthread -lcurl').
