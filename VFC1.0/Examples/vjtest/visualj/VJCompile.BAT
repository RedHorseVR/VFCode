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
   prompt %1:
   ECHO Compiling ******** ______________________________________
   ECHO ON 
   set  CLASSPATH = C:\WINDOWS\java\classes;C:\WINDOWS\java\trustlib;C:\WINDOWS\java\packages;C:\Program Files\DevStudio\SharedIDE\bin;C:\JDK1.1\LIB;C:\BDK\BEANBOX\classes;C:\liquid_real\lib\;C:\Program 
   ECHO OFF 
   "C:\Program Files\DevStudio\SharedIDE\bin\JVC.EXE"  %1
   ECHO Finished %1 ______________________________________


REM ----------------------------------------------------------------------------------------------

REM  Exported By Insecta Version 2.0 - October 1996 Beta 3
REM  Insecta File: VJCompile.ins
REM  Export  File: VJCompile.BAT
REM  Export  Date: 10:17:04 PM - 10:Aug:1997

