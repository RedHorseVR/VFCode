
echo off
rem   	ampy (Adafruit MicroPython Tool):

rem		Install with: pip install adafruit-ampy
rem		List files: ampy --port COM<X> ls
rem		Get a file: ampy --port COM<X> get <filename>
rem		Put a file: ampy --port COM<X> put <filename>

rem


rem DOS batch file to use Python output

@echo off
REM This batch file calls the Python script and uses its output

REM Call the Python script and store its output in the MY_VAR variable

for /f "delims=" %%i in ('python getCOM.py') do set MY_VAR=%%i

REM Echo the value of MY_VAR
echo The value returned by the Python script is: %MY_VAR%

REM Use the variable in further processing
if "%MY_VAR%"=="Hello from Python!" (
    echo The Python script returned the expected greeting.
) else (
    echo The Python script returned an unexpected value.
)

ampy --port %MY_VAR% put %1
ampy --port %MY_VAR% ls
ampy --port %MY_VAR% run %1

echo Running ... %1
 

rem ampy --port COM<X> run -c "import machine; machine.reset()"

pause

