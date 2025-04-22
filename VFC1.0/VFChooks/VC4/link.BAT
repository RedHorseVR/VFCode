REM NORMAL BATCH FILE
  
  MKDIR obj
  ECHO OFF 
  ECHO .___COPYING %1.obj____________________________________________
  COPY %1.obj   obj\%1.obj
  DEL %1.obj
  ECHO .___COPYING %1.res____________________________________________
  COPY %1.res   obj\%1.res
  DEL %1.res
  ECHO .______________________LINKING_________________________
  c:\msdev\bin\link /out:%1.exe *.obj  obj\*.obj  *.res /LibPath:c:\msdev\lib\  kernel32.lib comctl32.lib user32.lib gdi32.lib winspool.lib advapi32.lib shell32.lib comdlg32.lib
  ECHO OFF 
  ECHO ._______________________________________________
  ECHO LINK FINISHED
EXIT 
REM  FlowCode File: link.ins
REM  Export  File: link.BAT
REM  Export  Date: 11:09:53 PM - 19:Jan:1999

