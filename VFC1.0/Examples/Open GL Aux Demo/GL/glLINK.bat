REM NORMAL BATCH FILE 
   
   
   c:\msdev\bin\link  /out:%1.exe  *.obj  *.res  /LibPath:c:\msdev\lib\   libc.lib oldnames.lib  kernel32.lib Gdi32.lib User32.lib  Comdlg32.lib Opengl32.lib Glu32.lib Glaux.lib  Advapi32.lib|
EXIT 

REM ----------------------------------------------------------------------------------------------

REM  Exported By Insecta Version 2.0 - October 1996 Beta 3
REM  Insecta File: glLink.ins
REM  Export  File: glLINK.bat
REM  Export  Date: 01:41:02 PM - 16:Aug:1997

