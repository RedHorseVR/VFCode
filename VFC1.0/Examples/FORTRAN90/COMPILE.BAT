REM   Batch file process to set up and run compiler in its own environment
   SET LIB=
   SET PATH=C:\ELF90
   SET  LIB=C:\ELF90
   COPY C:\ELF90\TNT.EXE
   COPY C:\ELF90\dosstyle.dll
   C:\ELF90\Elf90.exe  %1
EXIT 

REM ----------------------------------------------------------------------------------------------

REM  Exported By Insecta Version 2.0 - October 1996 Beta 3
REM  Insecta File: Compile.ins
REM  Export  File: COMPILE.BAT
REM  Export  Date: 05:27:36 PM - 12:Aug:1997

