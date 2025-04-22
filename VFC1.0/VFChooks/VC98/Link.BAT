REM NORMAL BATCH FILE
  SET LIB="C:\Program Files\Microsoft Visual Studio\VC98\LIB
  PATH="C:\Program Files\Microsoft Visual Studio\VC98\Bin\"
  ECHO .___COPYING %1.obj____________________________________________
  
  link.exe  /out:%1.exe  OBJ\*.obj    OBJ\*.res  kernel32.lib comctl32.lib user32.lib gdi32.lib winspool.lib advapi32.lib shell32.lib comdlg32.lib
  ECHO ._______________________________________________
  ECHO LINK FINISHED
PAUSE 
EXIT 
REM  FlowCode File: Link.ins
REM  Export  File: Link.BAT
REM  Export  Date: 03:53:22 PM - 19:Oct:2009

