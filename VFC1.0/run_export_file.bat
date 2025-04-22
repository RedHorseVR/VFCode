
echo off
echo DIR------------------
echo %CD%
echo FILE-----------------
for %%a in ("%1") do set FILE=%%~nxa
echo file: %FILE%
FOR %%f IN (%FILE%) DO set EXPORT=%%~nf
echo export: %EXPORT%

rem cmd / k 

cd 

echo %EXPORT% | findstr /I ".py" >nul
if %errorlevel% equ 0 (
    echo The file has a .py extension. Using Python
    start python %CD%/%EXPORT%
) else (
    echo The file does not have a .py extension.
)

pause