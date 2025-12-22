REM CODE DIFFERENCE CHECK ...
@echo off
setlocal enabledelayedexpansion

echo ------------------------------------
echo %1
echo %2
 
 
if "%~1"=="" (
    echo Usage: cDiff.bat file1 file2
    exit /b
)
if "%~2"=="" (
    echo Usage: cDiff.bat file1 file2
    exit /b
)

ECHO ---------------------------------
set "fileDir=%CD%"
echo Current directory is: %fileDir%
cd
ECHO FILE1: %~1 
ECHO FILE2: %~2 
ECHO ---------------------------------


set "clean1=%1
set "clean2=%2


echo FOMATTING ::::::::::::::::::::::::::::::::::
clang-format -style=file:"C:/Users/lopezl10/AppData/Local/RedHorseVR/VFCode/VFC1.0/.clang-format" -i "%1"

rem  set STYLE="C:\Users\lopezl10\AppData\Local\RedHorseVR\C2VFC_parser\.clang-format"
rem  clang-format -style=file:"%STYLE%"  -i "%clean1%"
rem  clang-format -style=file:"%STYLE%"  -i "%clean2%"

WinMergeU.exe "%1" "%2"

ECHO C CODE DIFF CHECK EXIT ... 


