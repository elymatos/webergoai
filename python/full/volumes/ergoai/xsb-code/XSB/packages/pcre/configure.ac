## File:      packages/pcre/configure.in
## Author(s): Michael Kifer
## Contact:   xsb-contact@cs.sunysb.edu
## 
## Copyright (C) The Research Foundation of SUNY, 2010
## 
## XSB is free software; you can redistribute it and/or modify it under the
## terms of the GNU Library General Public License as published by the Free
## Software Foundation; either version 2 of the License, or (at your option)
## any later version.
## 
## XSB is distributed in the hope that it will be useful, but WITHOUT ANY
## WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
## FOR A PARTICULAR PURPOSE.  See the GNU Library General Public License for
## more details.
## 
## You should have received a copy of the GNU Library General Public License
## along with XSB; if not, write to the Free Software Foundation,
## Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
##
## $Id: configure.in,v 1.6 2011-05-18 06:15:06 kifer Exp $
## 
##

dnl  Autoconf script for pcre
dnl  To rebuild the `configure' script from this, execute the command
dnl	autoconf
dnl  in the directory containing this script.
dnl
dnl

AC_PREREQ([2.71])dnl

AC_INIT
AC_CONFIG_SRCDIR([pcreconfig.P])

SHELL=/bin/sh

build_dir="`pwd`"
# strip the last two directories and possibly trailing slashes
topdir=`echo "${build_dir}" | sed 's,/[[^/]][[^/]]*/*/[[^/]][[^/]]*/*$,,'`


# Tell where the autoconf scripts are
AC_CONFIG_AUX_DIR("../../build")

AC_ARG_WITH(pcre-libdir,
[  --with-pcre-libdir=DIR       the location of the libpcre.so is at DIR])
AC_ARG_WITH(pcre-incdir,
[  --with-pcre-incdir=DIR       the location of the include files for the PCRE library is at DIR])

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

if test -z "$with_pcre_libdir" ; then
   libdir=
else
   libdir=$with_pcre_libdir
fi
if test -z "$with_pcre_incdir" ; then
   incdir=
else
   incdir=$with_pcre_incdir
fi

# check if libpcre.so can be found
# If the PCRE library is missing, set pcre_error
# If libpcre.so is not in a standard place, we must use --with-pcre-libdir
if test -n "$with_pcre_libdir" ; then
   LDFLAGS="-L${with_pcre_libdir} ${LDFLAGS}"
fi

AC_CHECK_LIB(pcre, main, , pcre_error=yes)

# Here we provide additional directories to check headers in
# AC_CHECK_HEADERS uses CPPFLAGS to find the include path.
#
# If any of the headers is not in a standard place, use --with-pcre-incdir
if test -n "${with_pcre_incdir}"; then
   CPPFLAGS="-I${with_pcre_incdir} ${CPPFLAGS}"
   CFLAGS="-I${with_pcre_incdir} ${CPFLAGS}"
fi

AC_CHECK_HEADERS(pcre.h , with_pcre=yes, pcre=yes)

if test "$pcre" = "yes"; then
echo ""
AC_MSG_WARN([ ****Your system is missing pcre.h, which is required
    for PCRE (Perl pattern matching library) to function.
****PCRE support will be disabled. To use PCRE, please install the packages
    libpcre3 and libpcre3-dev.])
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

AC_CONFIG_FILES([pcre_info.P:pcre_info.in])
AC_OUTPUT

(
echo "  PCRE support (Perl pattern matching):           $support"
if test "$support" = "yes"; then
   cat <<EOT
  PCRE C flags:        	                          $ccflags
  PCRE loader flags:                              $ldflags

EOT
fi
) | tee Installation_summary
