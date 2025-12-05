REM CODE DIFFERENCE CHECK ...
@echo off
setlocal enabledelayedexpansion


ECHO ---------------------------------
set "fileDir=%CD%"
echo Current directory is: %fileDir%
cd
ECHO FILE1: %~1 
ECHO FILE2: %~2 
ECHO ---------------------------------


"WinMergeU.exe" "%FILE1%" "%FILE2%"

ECHO CODE DIFF EXIT ... 


