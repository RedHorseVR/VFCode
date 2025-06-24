
echo off

echo --- CHECKING %1 AND PARSING IF NEEDED  

IF "%1"=="" (
    echo --- No file given, launching VFC2000
    start vfc2000
) ELSE (

    if /I not "%~x1"==".vfc" (
        IF NOT EXIST "%~1.vfc" (
            echo --- PARSING %1
            echo ---  
            C++parse.bat %~1
            echo --- PARSING COMPLETED
        )

        echo --- VFC FILE READY 
        IF "%~2"=="" (
            start vfc2000 "%~1.vfc" -Reload
        ) ELSE ( 
            start vfc2000 "%~1.vfc" -Goto %2
        )

    ) ELSE (
        IF "%~2"=="" (
            start vfc2000 "%~1" -Reload
        ) ELSE ( 
            start vfc2000 "%~1" -Goto %2
        )
    )

)
