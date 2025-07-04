

echo off
echo ---  [%1]  
cd 

IF "%~1"=="" (
    echo file: [%1]--- No file given, launching VFC2000
    start vfc2000
) ELSE (

    if /I not "%~x1"==".vfc" (
        IF NOT EXIST "%~1.vfc" (
            echo --- PARSING %1
            echo ---  
            C++parse.bat %~1
            echo --- PARSED %1 COMPLETED
        )
    	echo --- VFC FILE %1 READY TO GOTO %2
    	start vfc2000 %1.vfc -Goto %2
	timout 3
    ) ELSE (
        echo --- EXISTING VFC FILE %1 -Goto %2
    	start vfc2000 %1 -Goto %2    
    )
)
