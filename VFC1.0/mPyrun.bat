del main.py
copy %1 main.py
dir *.py


rem uses Ampy to seriall load and run the main.py

AMPY --port %2 ls
AMPY --port %2 put main.py
AMPY --port %2 ls

rem AMPY --port %2 run main.py

pause