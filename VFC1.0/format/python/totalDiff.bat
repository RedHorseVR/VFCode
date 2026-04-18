@echo off


echo  python CODE DIFFERENCE CHECK ...


setlocal enabledelayedexpansion

echo %CD% 

echo %1  %2

python %~dp0\format.py %1
python %~dp0\format.py %2


WinMergeU.exe %1 %2

 

ECHO python CODE DIFF CHECK EXIT ... 


pause