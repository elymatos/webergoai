## File:      configure.in
## Author(s): kifer
## Contact:   xsb-contact@cs.sunysb.edu
## 
## Copyright (C) The Research Foundation of SUNY, 2003
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

dnl  Autoconf script for XSB
dnl  To rebuild the `configure' script from this, execute the command
dnl	autoconf
dnl  in the directory containing this script.
dnl
dnl

AC_PREREQ([2.71])dnl

AC_INIT
AC_CONFIG_SRCDIR([odbc_driver_config.P])

SHELL=/bin/sh

AC_ARG_WITH(odbc-libdir,
[  --with-odbc-libdir=DIR	   the directory where the ODBC library lives])
AC_ARG_WITH(odbc-incdir,
[  --with-odbc-incdir=DIR	   the directory of ODBC include files])

AC_ARG_WITH(mysql-libdir,
[  --with-mysql-libdir=DIR	   ignored])
AC_ARG_WITH(mysql-incdir,
[  --with-mysql-incdir=DIR	   ignored])
AC_ARG_WITH(mariadb-libdir,
[  --with-mariadb-libdir=DIR	   ignored])
AC_ARG_WITH(mariadb-incdir,
[  --with-mariadb-incdir=DIR	   ignored])
AC_ARG_WITH(mysqlembedded-libdir,
[  --with-mysqlembedded-libdir=DIR	   ignored])
AC_ARG_WITH(mysqlembedded-incdir,
[  --with-mysqlembedded-incdir=DIR	   ignored])



build_dir="`pwd`"
# strip the last three directories and possibly trailing slashes
topdir=`echo "${build_dir}" | sed 's,/[[^/]][[^/]]*/*/[[^/]][[^/]]*/*/[[^/]][[^/]]*/*$,,'`


# Tell where the autoconf scripts are
AC_CONFIG_AUX_DIR(../../../build)

dnl Check configuration for a Unix variant
if test -z "$with_config"; then
echo '
- You did not tell me what kind of host system you want to configure.
- I will attempt to guess the kind of system this is.
' 1>&6
    AC_CANONICAL_HOST
    canonical=$host
    configuration=$host_alias
fi


# make sure new files are readable 
umask 022

/bin/rm -f config.cache

with_odbc=
odbc_error=

if test -z "$with_odbc_libdir" ; then
   libdir=
else
   libdir=$with_odbc_libdir
fi
if test -z "$with_odbc_incdir" ; then
   incdir=
else
   incdir=$with_odbc_incdir
fi

# check if libodbc.so can be found
# If the ODBC library is missing, set odbc_error
# If libodbc.so is not in a standard place, we must use --with-odbc-libdir
if test -n "$with_odbc_libdir" ; then
   LDFLAGS="-L${with_odbc_libdir} ${LDFLAGS}"
fi

AC_CHECK_LIB(odbc, main, , odbc_error=yes)

# Here we provide additional directories to check headers in
# AC_CHECK_HEADERS uses CPPFLAGS to find the include path.
#
# If any of the headers is not in a standard place, use --with-odbc-incdir
if test -n "${with_odbc_incdir}"; then
   CPPFLAGS="-I${with_odbc_incdir} ${CPPFLAGS}"
   CFLAGS="-I${with_odbc_incdir} ${CFLAGS}"
fi

AC_CHECK_HEADERS(sql.h sqlext.h sqltypes.h, with_odbc=yes, odbc_error=yes)

if test "$odbc_error" = "yes"; then
echo ""
AC_MSG_WARN([ ****Your system is missing libodbc, sql.h, sqlext.h, or sqltypes.h, which are required for ODBC support
****ODBC driver will be disabled])
echo ""

support=no
else
support=yes
fi

CFLAGS="`odbc_config --cflags 2> /dev/null`"
LDFLAGS="`odbc_config --libs 2> /dev/null`"

AC_SUBST(support)
AC_SUBST(libdir)
AC_SUBST(CFLAGS)
AC_SUBST(LDFLAGS)


(
echo ""
echo "  ODBC support:                                   $support"
echo "  ODBC library directory:                         $libdir"
echo "  ODBC C Flags:                                   $CFLAGS"
echo "  ODBC Loader Flags:                              $LDFLAGS"
echo ""
) | tee Installation_summary

AC_CONFIG_FILES([odbc_init.P:odbc_init.in])
AC_OUTPUT
