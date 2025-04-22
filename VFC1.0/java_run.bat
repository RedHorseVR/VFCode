

echo off
cls  
echo ------- RUNNING JAVA CLASS: %1.class ------
echo .
echo .
java %1 %2
echo .
echo .
echo ------- done ------------------------
timeout 5

echo ------- DONE ------



