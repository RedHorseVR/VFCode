[RUN_BUTTON]
NGINX.exe

[COMPILE_BUTTON]
"stop-nginx.bat"


[POSTEXPORTCOMMAND]
CMD /C "ECHO ... <ExportFileName> This is a post export command in defined the keyfile ... & timeout 5" 

[TOOLS]
CONSOLE:
CMD


"stop-nginx.bat"


test-config.bat nginx.conf

