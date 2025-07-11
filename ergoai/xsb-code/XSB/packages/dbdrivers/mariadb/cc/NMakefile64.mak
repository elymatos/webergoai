# Make file for mysql_driver.dll

# !!!!
# !!!! TOO DAMN HARD TO LINK WITH MariaDB ON WINDOWS.
# !!!! Replace with a correct path to MariaDB!!! No quotes around!!
# mysqlclient.lib -static library; libmysql.lib - used with dynamic library
#MariaDBLib=<Insert Proper Path>\mysqlclient.lib
#MariaDBLib=<Insert Proper Path>\libmysql.lib
#MariaDBIncludeDir=<Insert Proper Path>
# !!!! Dont't put quotes around!
#MariaDBLib=C:\Program Files\MySQL\MySQL Server 5.7\lib\mysqlclient.lib
MariaDBLib=C:\Program Files\MySQL\MySQL Server 5.7\lib\libmysql.lib
MariaDBIncludeDir=C:\Program Files\MySQL\MySQL Server 5.7\include

# For MariaDB
#MariaDBLib=C:\Program Files\MariaDB 10.1\lib\mysqlclient.lib
#MariaDBLib=C:\Program Files\MariaDB 10.1\lib\libmysql.lib
#MariaDBIncludeDir=C:\Program Files\MariaDB 10.1\include\mysql

XSBDIR=..\..\..\..
MYPROGRAM=mysql_driver

CPP=cl.exe
LINKER=link.exe

OUTDIR     = windows64
ARCHDIR    =$(XSBDIR)\config\x64-pc-windows
ARCHBINDIR =$(ARCHDIR)\bin
ARCHOBJDIR =$(ARCHDIR)\saved.o
INTDIR=.

ALL : "$(OUTDIR)\$(MYPROGRAM).dll"

CLEAN :
	-@if exist "$(INTDIR)\*.obj" erase "$(INTDIR)\*.obj"
	-@if exist "$(INTDIR)\*.dll" erase "$(INTDIR)\*.dll"
	-@if exist "$(INTDIR)\*.exp" erase "$(INTDIR)\*.exp"


# /MT - static linking; /MD - dynamic linking
#CPP_PROJ=/nologo /MT /W3 /EHsc /O2 /I "$(ARCHDIR)" \
CPP_PROJ=/nologo /MD /W3 /EHsc /O2 /I "$(ARCHDIR)" \
		 /I "$(XSBDIR)\emu" /I "$(XSBDIR)\prolog_includes" \
		 /I "$(XSBDIR)\packages\dbdrivers\cc" \
		 /I "$(MariaDBIncludeDir)" \
		 /D "WIN64" /D "WIN_NT" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" \
		 /Fo"$(ARCHOBJDIR)\\" /Fd"$(ARCHOBJDIR)\\" /c 
	
SOURCE=$(MYPROGRAM).c
"$(ARCHOBJDIR)\$(MYPROGRAM).obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)

LINK_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib \
		advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib \
		odbc32.lib odbccp32.lib \
		WS2_32.lib \
		..\..\cc\windows64\driver_manager.lib "$(MariaDBLib)" \
		/nologo /dll \
		/machine:x64 /out:"$(OUTDIR)\$(MYPROGRAM).dll" \
		/libpath:"$(ARCHBINDIR)"

LINK_OBJS=  "$(ARCHOBJDIR)\$(MYPROGRAM).obj"

"$(OUTDIR)\$(MYPROGRAM).dll" : "$(ARCHBINDIR)" $(LINK_OBJS)
    $(LINKER) @<<
  $(LINK_FLAGS) $(LINK_OBJS)
<<
