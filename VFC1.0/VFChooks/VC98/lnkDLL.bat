REM NORMAL BATCH FILE 
  SET LIB="C:\Program Files\Microsoft Visual Studio\VC98\LIB
  PATH="C:\Program Files\Microsoft Visual Studio\VC98\Bin\"
  link /DEF:export.def -out:%1.dll -dll -entry:"DLLMain" *.obj    kernel32.lib comctl32.lib comdlg32.lib user32.lib gdi32.lib winspool.lib advapi32.lib shell32.lib
  ECHO Finished %1 ______________________________________ 
PAUSE 

REM  FlowCode File: lnkDLL.ins
REM  Export  File: lnkDLL.bat
REM  Export  Date: 01:09:34 PM - 01:Jun:2009

