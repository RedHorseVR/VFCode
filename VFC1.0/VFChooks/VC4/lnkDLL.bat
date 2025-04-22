REM NORMAL BATCH FILE 
  PATH "C:\msdev\bin"
  link /DEF:export.def -out:%1.dll -dll -entry:"DLLMain" *.obj /LibPath:C:\msdev\LIB   kernel32.lib comctl32.lib comdlg32.lib user32.lib gdi32.lib winspool.lib advapi32.lib shell32.lib
  ECHO Finished %1 ______________________________________ 

REM  FlowCode File: lnkDLL.ins
REM  Export  File: lnkDLL.bat
REM  Export  Date: 03:37:51 AM - 20:Jan:1999

