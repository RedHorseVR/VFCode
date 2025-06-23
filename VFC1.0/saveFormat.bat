REM CODE DIFFERENCE CHECK ...
@echo off
setlocal enabledelayedexpansion


ECHO ---------------------------------
set "fileDir=%CD%"
echo Current directory is: %fileDir%
cd
ECHO FILE1: %~1
ECHO ---------------------------------


set "clean1=%1"

set STYLE="C:\Users\lopezl10\AppData\Local\RedHorseVR\C2VFC_parser\.clang-format"

echo FOMRATTING ::::::::::::::::::::::::::::::::::
clang-format -style=file:"%STYLE%"  -i "%clean1%"


echo FORMATTED USING  -style=file:"%STYLE%"
timeout /T 5


