REM   Batch file process to set up and run java compiler on %1 in its own environment
   
   
   
   ECHO OFF 

SET INCLUDE=
SET LIB=
SET HOMEDRIVE=
SET HOMEPATH=
SET JAVA_HOME=
set PATH=
set TMPDIR=
set DJGPP=
set ADA_INCLUDE_PATH=
set ADA_OBJECTS_PATH=
set GW-GNAT=

ECHO on
SET CLASSPATH=.;C:\Jdk1.1\LIB;C:\bdk\beanbox\classes\sun\beanbox
ECHO Running Javac ...
c:\Jdk1.1\bin\javac %1   | more
ECHO Done.
EXIT 

REM ----------------------------------------------------------------------------------------------

REM  Exported By Insecta Version 2.0 - October 1996 Beta 3
REM  Insecta File: COMPILE.INS
REM  Export  File: COMPILE.BAT
REM  Export  Date: 01:47:14 AM - 20:Jul:1997

