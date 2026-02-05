REM CODE DIFFERENCE CHECK ...
@echo off
setlocal enabledelayedexpansion

echo %CD% 

echo %1  %2

pause

if "%~1"=="" (
    echo Usage: gDiff.bat file1.exten file2.exten
    pause
    exit /b
)
if "%~2"=="" (
    echo Usage: gDiff.bat file1.exten file2.exten
    pause
    exit /b
)

set /p exten="Enter code file extension: "
echo EXTEN:%exten%!




python C:\Users\lopezl10\AppData\Local\RedHorseVR\Cleaner\Cleaner.py %CD%\%1.%exten%
python C:\Users\lopezl10\AppData\Local\RedHorseVR\Cleaner\Cleaner.py %CD%\%2.%exten%

set "clean1=%1.%exten%.clean"
set "clean2=%2.%exten%.clean"


WinMergeU.exe "%clean1%" "%clean2%"

 

del "%clean2%"
del "%clean1%" 

ECHO C CODE DIFF CHECK EXIT ... 


