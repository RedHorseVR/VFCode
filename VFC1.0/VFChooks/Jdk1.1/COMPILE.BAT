REM   Batch file process to set up and run java compiler on %1 in its own environment
  ECHO on
  PROMPT 
  SET  "JAVA_HOME=C:\Program Files\Java\jdk1.6.0_13\bin"
  SET CLASSPATH=".;C:\Program Files\Java\jdk1.6.0_13\LIB;"
  ECHO Running Javac ...
  "C:\Program Files\Java\jdk1.6.0_13\bin\javac" %1
  ECHO Done.
PAUSE 
EXIT 