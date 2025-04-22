REM Compile DLL
  SET INCLUDE="c:\msdev\INCLUDE"
  PATH=c:\msdev\Bin
  CL.EXE %1  /nologo /W3 /GX /D "WIN32" /c /I"c:\msdev\INCLUDE"
  ECHO ._______________________________________________
  ECHO COMPILE FINISHED
EXIT 
EXIT 
REM  FlowCode File: cmpDLL.ins
REM  Export  File: cmpDLL.BAT
REM  Export  Date: 03:37:58 AM - 20:Jan:1999

