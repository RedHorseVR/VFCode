REM Compile DLL
  SET INCLUDE="C:\Program Files\Microsoft Visual Studio\VC98\INCLUDE"
  PATH="C:\Program Files\Microsoft Visual Studio\VC98\Bin;C:\Program Files\Microsoft Visual Studio\COMMON\MSDEV98\Bin"
  CL.EXE %1  /nologo /W3 /GX /D "WIN32" /c /I"C:\Program Files\Microsoft Visual Studio\VC98\INCLUDE"
  ECHO ._______________________________________________
  ECHO COMPILE FINISHED
EXIT 
EXIT 
REM  FlowCode File: cmpDLL.ins
REM  Export  File: cmpDLL.BAT
REM  Export  Date: 03:35:11 AM - 20:Jan:1999

