## File:      configure.in
## Author(s): Rohan Shirwaikar
## Contact:   xsb-contact@cs.sunysb.edu
## 
## Copyright (C) The Research Foundation of SUNY, 2004
## 
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
##      http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
## 
##

dnl  Autoconf script for xpath
dnl  To rebuild the `configure' script from this, execute the command
dnl	autoconf
dnl  in the directory containing this script.
dnl
dnl

AC_PREREQ([2.71])dnl

AC_INIT
AC_CONFIG_SRCDIR([xpathconfig.P])

SHELL=/bin/sh

build_dir="`pwd`"
# strip the last two directories and possibly trailing slashes
topdir=`echo "${build_dir}" | sed 's,/[[^/]][[^/]]*/*/[[^/]][[^/]]*/*$,,'`


# Tell where the autoconf scripts are
AC_CONFIG_AUX_DIR("../../build")

dnl Check configuration for a Unix variant
AC_CANONICAL_HOST
canonical=$host
configuration=$host_alias


# make sure new files are readable 
umask 022


ccflags=
ldflags=


case "$canonical" in
     *-cygwin*)
        pkg_src_dir=$build_dir/cc
	pkg_libxml_include_dir=$pkg_src_dir/libxml
	pkg_bin_dir=$pkg_src_dir/bin
	xmllib_ccflags=" -I$pkg_libxml_include_dir -I$pkg_src_dir "
	ldflags=" -L$pkg_bin_dir -lxml2 -lz -liconv -lm "
	;;
     *)  # Unix
	xpath_config_prog="./xml2-config"  # we keep our own copy for Unix
	
	if test "$prefix" != "NONE" ; then
    	   prefix_option="--prefix=$prefix"
        fi

	xmllib_ccflags=`sh $xpath_config_prog $prefix_option --cflags`
	ldflags="`sh $xpath_config_prog $prefix_option --libs`"
	;;
esac


ccflags="$xmllib_ccflags"	
if test  "$xmllib_ccflags" != "ERROR" && test "$ldflags" != "ERROR"  ; then
   support=yes
else
   support=no
fi

AC_SUBST(support)
AC_SUBST(ccflags)
AC_SUBST(ldflags)

(
echo "  XPath support:				  $support"
if test "$support" = "yes"; then
   cat <<EOT
  XPath C flags:				  $ccflags
  XPath loader flags:				  $ldflags

EOT
fi
) | tee Installation_summary

AC_CONFIG_FILES([xpath_init.P:xpath_init.in])
AC_OUTPUT
