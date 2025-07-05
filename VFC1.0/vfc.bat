

echo off
echo 		FILE: [%1]  


IF "%~1"=="" (
    echo 		No file given, launching VFC2000
    start vfc2000
) ELSE (

    if /I not "%~x1"==".vfc" (
        IF NOT EXIST "%~1.vfc" (
            echo 	PARSING %1
            echo 	---  
            C++parse.bat %~1 
            echo 		--- PARSED %1 COMPLETED
	    timeout 1
	    vfc2000 %1.vfc -Goto %2
	    exit
        )
    	echo 		--- VFC FILE %1 OPEN %2
        echo 		--- done 
    	start vfc2000 %1.vfc -Goto %2
	rem timeout 1
    ) ELSE (
        echo 		--- EXISTING VFC FILE %1 -Goto %2
        echo 		--- done 
    	start vfc2000 %1 -Goto %2    
    )
)
