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
AC_CONFIG_SRCDIR([mysql_driver_config.P])

SHELL=/bin/sh

AC_ARG_WITH(mysql-libdir,
[  --with-mysql-libdir=DIR	   the directory where the MySQL library lives])
AC_ARG_WITH(mysql-incdir,
[  --with-mysql-incdir=DIR	   the directory of MySQL include files])

AC_ARG_WITH(odbc-libdir,
[  --with-odbc-libdir=DIR	   ignored])
AC_ARG_WITH(odbc-incdir,
[  --with-odbc-incdir=DIR	   ignored])
AC_ARG_WITH(mysqlembedded-libdir,
[  --with-mysqlembedded-libdir=DIR	   ignored])
AC_ARG_WITH(mysqlembedded-incdir,
[  --with-mysqlembedded-incdir=DIR	   ignored])
AC_ARG_WITH(mariadb-libdir,
[  --with-mariadb-libdir=DIR	   ignored])
AC_ARG_WITH(mariadb-incdir,
[  --with-mariadb-incdir=DIR	   ignored])



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

with_mysql=
mysql_error=

if test -z "$with_mysql_libdir" ; then
   if test -d `mysql_config --variable=pkglibdir 2> /dev/null` ; then
      libdir="`mysql_config --variable=pkglibdir 2> /dev/null`"
   elif test -d /usr/lib/mysql ; then
      libdir="/usr/lib/mysql"
   elif test -d /usr/local/mysql/lib ; then
      libdir="/usr/local/mysql/lib"
   else
      echo "***Configuring MySQL failed: cannot find installation; please use the option --with-mysql-libdir"
      exit 1
   fi
else
   libdir=$with_mysql_libdir
fi

if test -z "$with_mysql_incdir" ; then
   if test -d `mysql_config --variable=pkgincludedir 2> /dev/null` ; then
       incdir="`mysql_config --variable=pkgincludedir 2> /dev/null`"
   elif test -d /usr/include/mysql ; then
       incdir="/usr/include/mysql"
   elif test -d /usr/local/mysql/include ; then
       incdir="/usr/local/mysql/include"
   else
      echo "***Configuring MySQL failed: cannot find installation; please use the option --with-mysql-incdir"
      exit 1
   fi
else
   incdir=$with_mysql_incdir
fi

# check if libmysqlclient.so can be found
# If the MySQL library is missing, set mysql_error
# If libmysqlclient.so is not in a standard place, we must use --with-mysql-libdir
if test -n "$libdir" ; then
   LDFLAGS="-L${libdir} ${LDFLAGS}"
fi

# Here we provide additional directories to check headers in
# AC_CHECK_HEADERS uses CPPFLAGS to find the include path.
#
# If any of the headers is not in a standard place, use --with-mysql-incdir
if test -n "${incdir}"; then
   CPPFLAGS=" -I${incdir} ${CPPFLAGS}"
   CFLAGS="-I${incdir} ${CPFLAGS}"
fi

echo $incdir
echo $libdir

AC_CHECK_LIB(mysqlclient, main, , mysql_error=yes)
AC_CHECK_HEADERS(mysql.h , with_mysql=yes, mysql_error=yes)

if test "$mysql_error" = "yes"; then
echo ""
AC_MSG_WARN([ ****Your system is missing mysql.h or mysql_com.h, which are required for MySQL support
****MySQL driver will be disabled])
echo ""

support=no
else
support=yes
fi

CFLAGS="`mysql_config --cflags 2> /dev/null`"
LDFLAGS="`mysql_config --libs 2> /dev/null`"

AC_SUBST(support)
AC_SUBST(libdir)
AC_SUBST(CFLAGS)
AC_SUBST(LDFLAGS)


(
echo "  MySQL support:                                  $support"
echo "  MySQL library directory:                        $libdir"
echo "  MySQL header directory:                         $incdir"
echo "  MySQL C Flags:                                  $CFLAGS"
echo "  MySQL Loader Flags:                             $LDFLAGS"
echo ""
) | tee Installation_summary

AC_CONFIG_FILES([mysql_init.P:mysql_init.in])
AC_OUTPUT
