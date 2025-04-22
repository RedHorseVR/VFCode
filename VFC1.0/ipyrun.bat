echo off
prompt ::
                rem set OCTAVE_HOME="C:\Users\luis.lopez\Programs\Octave-6.2.0"
                rem set OCTAVE_EXECUTABLE="C:\Users\luis.lopez\Programs\Octave-6.2.0\mingw64\bin\octave-cli.exe"

set path=%path%;C:\Program Files\GNU Octave\Octave-6.2.0;C:\Program Files\GNU Octave\Octave-6.2.0\mingw64\bin


echo ----------------------
echo OCTAVE_HOME  %OCTAVE_HOME%
echo OCTAVE_EXECUTABLE  %OCTAVE_EXECUTABLE%
%echo ----------------------

echo "DEBUGGING on base environment ... %1.py" 
echo on
activate base & ipython -i %1.py 
