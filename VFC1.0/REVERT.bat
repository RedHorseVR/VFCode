echo ------------------
echo off

choice /C YN /M "Do you want to delete %1 and revert to original?"
if errorlevel 2 (
    echo Operation canceled.
	
	
) else (
    echo Proceeding...
	del %1
	copy _%1 %1
	pause
)

pause
