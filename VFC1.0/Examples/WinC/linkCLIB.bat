REM NORMAL BATCH FILE 
   
   
   ECHO OFF 
   DEL y_tab.obj
   ECHO ._______________________________________________
   ECHO ON 
   c:\msdev\bin\link /out:%1.exe *.obj *.res /LibPath:c:\msdev\lib\  kernel32.lib comctl32.lib user32.lib gdi32.lib winspool.lib advapi32.lib shell32.lib comdlg32.lib  *.lib
   ECHO OFF 
   ECHO ._______________________________________________
   ECHO LINK FINISHED
EXIT 

REM ----------------------------------------------------------------------------------------------

REM  Exported By Insecta Version 2.0 - October 1996 Beta 3
REM  Insecta File: LinkCLIB.ins
REM  Export  File: linkCLIB.bat
REM  Export  Date: 12:07:22 AM - 06:Jun:1997

