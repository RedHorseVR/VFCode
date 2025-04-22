REM C COMPILE
  
  
  
  
  
  SET INCLUDE="C:\Program Files\Microsoft Visual Studio\VC98\INCLUDE"
  PATH="C:\Program Files\Microsoft Visual Studio\VC98\Bin\"
  PATH 
  MKDIR obj
  CD  
  CL.EXE %1  /nologo /W3 /GX /D "WIN32" /c /I"C:\Program Files\Microsoft Visual Studio\VC98\INCLUDE"
  
  COPY *.obj   obj\*.obj
  DEL *.obj
  ECHO ._______________________________________________
  ECHO COMPILE FINISHED
PAUSE 
EXIT 
REM  FlowCode File: Compile.ins
REM  Export  File: Compile.BAT
REM  Export  Date: 04:01:11 PM - 19:Oct:2009

