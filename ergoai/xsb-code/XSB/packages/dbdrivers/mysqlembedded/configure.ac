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
AC_CONFIG_SRCDIR([mysqlembedded_driver_config.P])

SHELL=/bin/sh

AC_ARG_WITH(mysqlembedded-libdir,
[  --with-mysqlembedded-libdir=DIR	   the directory where the MySQL Embedded Server library lives])
AC_ARG_WITH(mysqlembedded-incdir,
[  --with-mysqlembedded-incdir=DIR	   the directory of MySQL Embedded Server include files])

AC_ARG_WITH(odbc-libdir,
[  --with-odbc-libdir=DIR	   ignored])
AC_ARG_WITH(odbc-incdir,
[  --with-odbc-incdir=DIR	   ignored])
AC_ARG_WITH(mysql-libdir,
[  --with-mysql-libdir=DIR	   ignored])
AC_ARG_WITH(mysql-incdir,
[  --with-mysql-incdir=DIR	   ignored])

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

with_mysqlembedded=
mysqlembedded_error=

if test -z "$with_mysqlembedded_libdir" ; then
   if test -d `mysql_config --variable=pkglibdir 2> /dev/null` ; then
      mysqld_libs="`mysql_config --libmysqld-libs 2> /dev/null`"
      libdir=`mysql_config --variable=pkglibdir 2> /dev/null`
   elif test -d /usr/lib/mysql ; then
      mysqld_libs="-L/usr/lib/mysql"
      libdir="/usr/lib/mysql"
   elif test -d /usr/local/mysql/lib ; then
      mysqld_libs="-L/usr/local/mysql/lib"
      libdir="/usr/local/mysql/lib"
   else
      echo "***Configuring MySQL Embedded Server failed: cannot find installation; please use the option --with-mysqlembedded-libdir"
      exit 1
   fi
else
   libdir=$with_mysqlembedded_libdir
fi
if test -z "$with_mysqlembedded_incdir" ; then
   if test -d `mysql_config --variable=pkgincludedir 2> /dev/null` ; then
       incdir="`mysql_config --variable=pkgincludedir 2> /dev/null`"
       mysqld_includes=`mysql_config --include 2> /dev/null`
   elif test -d /usr/include/mysql ; then
       incdir="/usr/include/mysql"
       mysqld_includes="-I/usr/include/mysql"
   elif test -d /usr/local/mysql/include ; then
       incdir="/usr/local/mysql/include"
       mysqld_includes="-I/usr/local/mysql/include"
   else
      echo "***Configuring MySQL Embedded Server failed: cannot find installation; please use the option --with-mysqlembedded-incdir"
      exit 1
   fi
else
   incdir=$with_mysqlembedded_incdir
fi

# check if libmysqld.a can be found
AC_CHECK_LIB(mysqld, main, , mysqlembedded_error=yes)

# If the MySQL Embedded Server library is missing, set mysqlembedded_error
# If libmysqld.a is not in a standard place, we must use --with-mysqlembedded-libdir
LDFLAGS="${mysqld_libs} ${LDFLAGS}"

# Here we provide additional directories to check headers in
# AC_CHECK_HEADERS uses CPPFLAGS to find the include path.
#
# If any of the headers is not in a standard place, use --with-mysqlembedded-incdir
CPPFLAGS="${mysqld_includes} -D_THREAD_SAFE -D_REENTRANT ${CPPFLAGS}"
CFLAGS="-g -W -Wall ${mysqld_includes} ${CFLAGS}"

if test -z "$mysqlembedded_error" ; then
    AC_CHECK_HEADERS(mysql.h , with_mysqlembedded=yes, mysqlembedded_error=yes)
fi

if test "$mysqlembedded_error" = "yes"; then
echo ""
AC_MSG_WARN([ ****Your system is missing mysqld or mysql.h, which are required for MySQL Embedded Server support
****MySQL Embedded Server driver will be disabled])
echo ""

support=no
else
support=yes
fi

AC_SUBST(support)
AC_SUBST(libdir)
AC_SUBST(CFLAGS)
AC_SUBST(LDFLAGS)


(
echo "  MySQL Embedded Server support:                  $support"
echo "  MySQL Embedded Server library directory:        $libdir"
echo "  MySQL Embedded Server header directory:         $incdir"
echo "  MySQL Embedded Server C Flags:                  $CFLAGS"
echo "  MySQL Embedded Server Loader Flags:             $LDFLAGS"
echo ""
) | tee Installation_summary

AC_CONFIG_FILES([mysqlembedded_init.P:mysqlembedded_init.in])
AC_OUTPUT
