REM NORMAL BATCH FILE 
  
  
  SET LIB="C:\Program Files\Microsoft Visual Studio\VC98\LIB
  PATH="C:\Program Files\Microsoft Visual Studio\VC98\Bin\"
  ECHO .___COPYING %1.obj____________________________________________
  DEL %1.obj
  link.exe  /out:%1.exe  OBJ\*.obj    OBJ\*.res  kernel32.lib comctl32.lib user32.lib gdi32.lib winspool.lib advapi32.lib shell32.lib comdlg32.lib  Opengl32.lib Glu32.lib Glaux.lib
  
PAUSE 
EXIT 
REM  FlowCode File: glLink.ins
REM  Export  File: glLINK.bat
REM  Export  Date: 09:37:38 AM - 01:May:2009

