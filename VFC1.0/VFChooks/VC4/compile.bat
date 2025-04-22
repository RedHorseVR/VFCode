REM C COMPILE
  MKDIR obj
  ECHO OFF 
  ECHO ._______________________________________________
  c:\msdev\bin\CL %1.C  /Ic:\MSDEV\INCLUDE  /I. /nologo /W3 /GX /D "WIN32" /c
  COPY %1.obj   obj\%1.obj
  DEL %1.obj
  ECHO OFF 
  ECHO COMPILE FINISHED
EXIT 
REM  FlowCode File: compile.ins
REM  Export  File: compile.bat
REM  Export  Date: 11:27:44 PM - 19:Jan:1999

