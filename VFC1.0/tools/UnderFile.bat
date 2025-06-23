IF EXIST "_%~1" (
    	_COPY EXISITS
) ELSE (
    	MAKING _COPY
	copy "%~1" "_%~1"
)

PAUSE