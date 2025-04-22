del main.py
copy %1 main.py
dir *.py

AMPY --port %2 rm  main.py

rem AMPY --port %2 rm  %1

AMPY --port %2 put main.py

rem #  AMPY --port %2 ls
