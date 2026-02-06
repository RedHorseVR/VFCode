echo ===================================
echo    python CODE DIFFERENCE CHECK ...
echo ===================================
@echo off
setlocal enabledelayedexpansion

echo %CD% 

echo %1  %2

python format.py %1



WinMergeU.exe %1 %2

 

ECHO python CODE DIFF CHECK EXIT ... 


