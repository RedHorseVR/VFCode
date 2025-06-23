REM PATH=C:\Program Files\Python312\Scripts\;C:\Program Files\Python312\;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\WINDOWS\System32\OpenSSH\;C:\Program Files\TortoiseGit\bin;C:\Strawberry\c\bin;C:\Strawberry\perl\site\bin;C:\Strawberry\perl\bin;C:\Program Files\Microsoft SQL Server\150\Tools\Binn\;C:\Program Files\dotnet\;C:\Program Files (x86)\Incredibuild;C:\Program Files (x86)\Windows Kits\10\Windows Performance Toolkit\;C:\Program Files\Git\cmd;C:\Program Files\nodejs\;C:\Program Files\MATLAB\R2023a\bin;
PATH=C:\Program Files\Python312\Scripts;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0;C:\WINDOWS\System32\OpenSSH;C:\Program Files\TortoiseGit\bin;C:\Strawberry\c\bin;C:\Strawberry\perl\site\bin;C:\Strawberry\perl\bin;C:\Program Files\dotnet;C:\Program Files (x86)\Windows Kits\10\Windows Performance Toolkit;C:\Program Files\Git\cmd;C:\Program Files\nodejs;C:\Program Files\MATLAB\R2023a\bin;

SETX MY_LOCAL "C:\Users\lopezl10\AppData\Local"
SETX JAVA_HOME "%MY_LOCAL%\Java"
SETX RUSTUP_HOME "C:\Users\lopezl10\source\repos\rustup"
SETX CARGO_HOME "C:\Users\lopezl10\source\repos\rustup\cargo"
SETX RHVR_HOME "%MY_LOCAL%\RedHorseVR"


rem SETX PATH "%PATH%;%RHVR_HOME%\VFC_Matlab;%RHVR_HOME%\VFCode\VFC1.0;%RHVR_HOME%\C2VFC_parser;%RHVR_HOME%\WinDiff;C:\Users\lopezl10\AppData\Roaming\Python\Python312\Scripts;%MY_LOCAL%\Maven\bin;%MY_LOCAL%\Java\bin;%MY_LOCAL%\xmind;%CARGO_HOME%\bin;C:\Users\lopezl10\.vcpkg\"
echo off


SET PATHVAR=%RHVR_HOME%\VFCode\VFC1.0
SET PATHVAR=%PATHVAR%;%RHVR_HOME%\VFC_Matlab
SET PATHVAR=%PATHVAR%;%RHVR_HOME%\C2VFC_parser
SET PATHVAR=%PATHVAR%;%RHVR_HOME%\parser_Python
SET PATHVAR=%PATHVAR%;%RHVR_HOME%\WinDiff
SET PATHVAR=%PATHVAR%;%RHVR_HOME%\TOOLS
SET PATHVAR=%PATHVAR%;%RHVR_HOME%\VFCode\VFC1.0\tools
SET PATHVAR=%PATHVAR%;C:\Users\lopezl10\AppData\Roaming\Python\Python312\Scripts
rem SET PATHVAR=%PATHVAR%;%MY_LOCAL%\Maven\bin
SET PATHVAR=%PATHVAR%;%MY_LOCAL%\Java\bin
SET PATHVAR=%PATHVAR%;%MY_LOCAL%\xmind
rem SET PATHVAR=%PATHVAR%;C:\Users\lopezl10\.vcpkg\
SET PATHVAR=%PATHVAR%;%MY_LOCAL%\NuGet
SET PATHVAR=%PATHVAR%;%CARGO_HOME%\bin

REM Assign accumulated PATHVAR to PATH
SETX PATH "%PATH%;%PATHVAR%"
pause