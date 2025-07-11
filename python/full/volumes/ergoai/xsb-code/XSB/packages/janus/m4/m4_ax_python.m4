# ===========================================================================
#        https://www.gnu.org/software/autoconf-archive/ax_python.html
# ===========================================================================
#
# SYNOPSIS
#
#   AX_PYTHON
#
# DESCRIPTION
#
#   This macro does a complete Python development environment check.
#
#   It checks for all known versions. When it finds an executable, it looks
#   to find the header files and library.
#
#   It sets PYTHON_BIN to the name of the python executable,
#   PYTHON_INCLUDE_DIR to the directory holding the header files, and
#   PYTHON_LIB to the name of the Python library.
#
#   This macro calls AC_SUBST on PYTHON_BIN (via AC_CHECK_PROG),
#   PYTHON_INCLUDE_DIR and PYTHON_LIB.
#
# LICENSE
#
#   Copyright (c) 2008 Michael Tindal
#
#   This program is free software; you can redistribute it and/or modify it
#   under the terms of the GNU General Public License as published by the
#   Free Software Foundation; either version 2 of the License, or (at your
#   option) any later version.
#
#   This program is distributed in the hope that it will be useful, but
#   WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
#   Public License for more details.
#
#   You should have received a copy of the GNU General Public License along
#   with this program. If not, see <https://www.gnu.org/licenses/>.
#
#   As a special exception, the respective Autoconf Macro's copyright owner
#   gives unlimited permission to copy, distribute and modify the configure
#   scripts that are the output of Autoconf when processing the Macro. You
#   need not follow the terms of the GNU General Public License when using
#   or distributing such scripts, even though portions of the text of the
#   Macro appear in them. The GNU General Public License (GPL) does govern
#   all other use of the material that constitutes the Autoconf Macro.
#
#   This special exception to the GPL applies to versions of the Autoconf
#   Macro released by the Autoconf Archive. When you make and distribute a
#   modified version of the Autoconf Macro, you may extend this special
#   exception to the GPL to apply to your modified version as well.

#serial 19

# if this is changed, execute 
#   autoreconf -i
# in ../

AC_DEFUN([AX_PYTHON],
[AC_MSG_CHECKING(for python build information)
AC_MSG_RESULT([])

# ac_preferred_python may be set by configure so the below will select 
# that version of Python

for python in $ac_preferred_python python3.19m python3.19 python3.18m python3.18 python3.17m python3.17 python3.16m python3.16 python3.15m python3.15 python3.14m python3.14 python3.13m python3.13 python3.12m python3.12  python3.11m python3.11 python3.10m python3.10 python3.9m python3.9 python3.8m python3.8 python3.7m python3.7 python3.6m python3.6 ; do
AC_CHECK_PROGS(PYTHON_BIN, [$python])
ax_python_bin=$PYTHON_BIN
if test "x$ax_python_bin" != "x"; then
   # if pip is not installed, arrange for exit
   $PYTHON_BIN -m pip help > /dev/null 2>&1 || pip_not_installed=1
   $PYTHON_BIN -m pipx environment > /dev/null 2>&1 || pip_not_installed=1

   save_path=$PATH
   # is it possible that the bin dir will be other than $HOME/.local/bin ??
   ## It seems PIPX_BIN_DIR env var can override this.
   ## Deal with it later
   PATH="$HOME/.local/bin":$save_path
   ax_python_conflib=`$PYTHON_BIN -m find_libpython 2> /dev/null || ($PYTHON_BIN -m pipx install find_libpython > /dev/null 2>&1; find_libpython)`
   PATH=$save_path

   ax_python_lib=`$ax_python_bin -c "from sysconfig import *; print(get_config_var('LIBDEST'))"`
   ax_python_extra_lib=`$ax_python_bin -c "from sysconfig import *; print(get_config_var('BLDLIBRARY'))"`
   ax_python_header=`$ax_python_bin -c "from sysconfig import *; print(get_config_var('CONFINCLUDEPY'))"`
   if test "x$ax_python_header" != "x" -a "x$ax_python_conflib" != "xno"; then
     break;
   fi
fi
done
if test -n "$pip_not_installed" ; then
   echo
   echo "***** pip or pipx is not installed for $PYTHON_BIN -- please install both!"
   echo
fi
if test "x$ax_python_bin" = "x"; then
   ax_python_bin=no
fi
if test "x$ax_python_header" = "x"; then
   ax_python_header=no
fi
if test "x$ax_python_conflib" = "x"; then
   ax_python_conflib=no
fi
if test "x$ax_python_lib" = "x"; then
   ax_python_lib=no
fi
if test "x$ax_python_extra_lib" = "x"; then
   ax_python_extra_lib=no
fi

AC_MSG_RESULT([  results of the Python check:])
AC_MSG_RESULT([    Binary:          $ax_python_bin])
AC_MSG_RESULT([    Devel library:   $ax_python_conflib])
AC_MSG_RESULT([    Library:         $ax_python_lib])
AC_MSG_RESULT([    Extra library:   $ax_python_extra_lib])
AC_MSG_RESULT([    Include Dir:     $ax_python_header])

if test "x$ax_python_header" != xno; then
  PYTHON_INCLUDE_DIR=$ax_python_header
  AC_SUBST(PYTHON_INCLUDE_DIR)
fi
if test "x$ax_python_lib" != "xno"; then
  PYTHON_LIB=$ax_python_lib
  AC_SUBST(PYTHON_LIB)
fi
if test "x$ax_python_extra_lib" != "xno"; then
  PYTHON_EXTRA_LIB=$ax_python_extra_lib
  AC_SUBST(PYTHON_EXTRA_LIB)
fi
if test "x$ax_python_conflib" != "xno"; then
  PYTHON_CONFLIB=$ax_python_conflib
  AC_SUBST(PYTHON_CONFLIB)
fi
])dnl
