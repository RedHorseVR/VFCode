
echo off
echo DIR------------------
echo %CD%
echo FILE-----------------
for %%a in ("%1") do set FILE=%%~nxa
echo file: %FILE%
FOR %%f IN (%FILE%) DO set EXPORT=%%~nf
echo export: %EXPORT%

rem cmd / k 

cd %2

echo %FILE% | findstr /I "_w.py" >nul
	if %errorlevel% equ 0 (
		echo The file has a .wpy extension. Using PythonW
		start pythonW %CD%/%EXPORT%
		exit
	)  

echo %EXPORT% | findstr /I ".py" >nul
	if %errorlevel% equ 0 (
		echo The file has a .py extension. Using Python
		start python %CD%/%EXPORT%
	)


::pause

EXIT

