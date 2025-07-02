
echo off

echo ---  %1  

IF "%1"=="" (
    echo --- No file given, launching VFC2000
    start vfc2000
) ELSE (

    if /I not "%~x1"==".vfc" (
        IF NOT EXIST "%~1.vfc" (
            echo --- PARSING %1
            echo ---  
            C++parse.bat %~1
            echo --- PARSED %1 COMPLETED
        )
    	echo --- VFC FILE READY GOTO %2
    	start vfc2000 "%~1.vfc -Goto %2"

    ) ELSE (
    	start vfc2000 "%~1.vfc -Goto %2"
    )

)
