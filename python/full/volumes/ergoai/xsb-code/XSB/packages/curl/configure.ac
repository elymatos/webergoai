## File:      packages/curl/configure.in
## Author(s): Michael Kifer
## Contact:   xsb-contact@cs.sunysb.edu
## 
## Copyright (C) The Research Foundation of SUNY, 2010
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

dnl  Autoconf script for libcurl
dnl  To rebuild the `configure' script from this, execute the command
dnl	autoconf
dnl  in the directory containing this script.
dnl
dnl

AC_PREREQ([2.71])dnl

AC_INIT
AC_CONFIG_SRCDIR([curlconfig.P])

SHELL=/bin/sh

build_dir="`pwd`"
# strip the last two directories and possibly trailing slashes
topdir=`echo "${build_dir}" | sed 's,/[[^/]][[^/]]*/*/[[^/]][[^/]]*/*$,,'`


# Tell where the autoconf scripts are
AC_CONFIG_AUX_DIR("../../build")

AC_ARG_WITH(curl-libdir,
[  --with-curl-libdir=DIR       the location of the libcurl.so is at DIR])
AC_ARG_WITH(curl-incdir,
[  --with-curl-incdir=DIR       the location of the include files for the Curl library is at DIR])

dnl Check configuration for a Unix variant
echo '
- You did not tell me what kind of host system you want to configure.
- I will attempt to guess the kind of system this is.
' 1>&6
AC_CANONICAL_HOST
canonical=$host
configuration=$host_alias


# make sure new files are readable 
umask 022

if test -z "$with_curl_libdir" ; then
   libdir=
else
   libdir=$with_curl_libdir
fi
if test -z "$with_curl_incdir" ; then
   incdir=
else
   incdir=$with_curl_incdir
fi

# check if libcurl.so can be found
# If the CURL library is missing, set curl_error
# If libcurl.so is not in a standard place, we must use --with-curl-libdir
if test -n "$with_curl_libdir" ; then
   LDFLAGS="-L${with_curl_libdir} ${LDFLAGS}"
fi

AC_CHECK_LIB(curl, main, , curl_error=yes)

# Here we provide additional directories to check headers in
# AC_CHECK_HEADERS uses CPPFLAGS to find the include path.
#
# If any of the headers is not in a standard place, use --with-curl-incdir
if test -n "${with_curl_incdir}"; then
   CPPFLAGS="-I${with_curl_incdir} ${CPPFLAGS}"
   CFLAGS="-I${with_curl_incdir} ${CPFLAGS}"
fi

AC_CHECK_HEADERS(curl/curl.h , with_curl=yes, curl_error=yes)

if test "$curl_error" = "yes"; then
echo ""
AC_MSG_WARN([ ****Your system is missing curl/curl.h, which is required
    for Curl to function.
****Curl support will be disabled. To use Curl, please install the packages
    libcurl and libcurl-dev (or similarly named, depending on your system).])
echo ""

support=no
else
support=yes
fi

ccflags=${CFLAGS}
ldflags=${LDFLAGS}


AC_SUBST(support)
AC_SUBST(ccflags)
AC_SUBST(ldflags)

AC_CONFIG_FILES([curl_info.P:curl_info.in])
AC_OUTPUT

(
echo "  Curl support (HTTP protocol library):           $support"
if test "$support" = "yes"; then
   cat <<EOT
  Curl C flags:        	                          $ccflags
  Curl loader flags:                              $ldflags

EOT
fi
) | tee Installation_summary
