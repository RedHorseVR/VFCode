cls
echo %1
echo off
echo -------------COMPILING JAVA PROGRAM %1.java ----------------
echo .
echo .

javac %1.java

echo .
echo .

echo --- compiled complete ---
echo .

dir %1.class

timeout 5
