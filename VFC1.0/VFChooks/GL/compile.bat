REM C COMPILE
  
  
  
  
  ECHO ._______________________________________________
  ECHO ON 
  SET INCLUDE="C:\Program Files\Microsoft Visual Studio\VC98\INCLUDE"
  PATH="C:\Program Files\Microsoft Visual Studio\VC98\Bin\"
  PATH 
  MKDIR obj
  CD  
  CL.EXE %1  /nologo /W3 /GX /D "WIN32" /c /I"C:\Program Files\Microsoft Visual Studio\VC98\INCLUDE"
  COPY *.obj   obj\*.obj
  DEL *.obj
  
  ECHO OFF 
  ECHO ._______________________________________________
  ECHO COMPILE FINISHED
PAUSE 
EXIT 
REM  FlowCode File: Compile.ins
REM  Export  File: compile.bat
REM  Export  Date: 09:33:17 AM - 01:May:2009

