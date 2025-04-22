	
                 FlowLynx's Visual FlowCoder

                  January 1999 Release 1.0


            NOTE:  SETUP ON NT SYSTEMS REQUIRES 
                   ADMINISTRATION PRIVILEGES.

-----------------------------------------------------------------------------------------------
Release 1.0 Notes : January 1999
-----------------------------------------------------------------------------------------------

NEW AND IMPROVED FEATURES  SINCE THE PRE-RELEASE
· Support for compiled HTML help.
· New Users Manual and Tutorials available in printed and/or electronic format.
· Improved Import Paste can be programmed to recognize most structured languages.  Check the web for more detailed instructions, tutorials and additional keyfiles for several popular languages.
· Right mouse feature for creating embedded hyper links from any object in a flowcode file to another flowcode file.
· Several improved right mouse desktop control features.
· Improved ParseManager.
· Imporved VFCpipe.
· Improved User Registration Number handling and backup.
· Menu commands to start the VFCkeyedit tool (e.g. VFCkeyedit is a VFC utility for editing keyfiles)
· Several additional keyfile macros for better integration with command line tools.
· Several command line arguments to allow you to control the VFC from other tools.
· Setup program will not overwrite your keyfiles.  However, uninstall will delete any keyfiles that were originally installed -even if you have edited them.


TIPS AND GLITCHES 

	OPERATING SYSTEM AND EXTERNAL TOOLS
If your Windows 98 network is not responding for some reason, VFC may become slow or unstable.  We have noticed this effect on other Windows programs running under Windows 98 as well.  This problem depends on the tools VFC may be using, and your network configuration.
If FastFind.exe is running while you are using VFC, some of its common dialogs may cause a kernal32.exe crash.  Also, on some Windows 98 configurations certain VFCtools can become unstable and make VFC unstable while FastFind.exe is running.
The Export Toolbar's drop list will not show any newly created keyfiles until you restart VFC.
If you are using IntelliPoint on your desktop it may move windows with the mouse depending on the focus change.  This may cause some problems when using VFC's GUI.
A rare problem occurs when  you try to open an extremely corrupt flowcode file.  It may cause VFC to ask for your registration number again  (e.g. a corrupt flowcode file may be the result of parsing poorly structured code, or parsing code with the wrong parser).
Drag Drop to open a flowcode file does not resolve shortcuts to targets.

	REMOVING COMPILED HTML HELP FILES
If you install the compiled HTML files and later want to remove them, just delete all the *.chm files from the VFC installation directory.  VFC  will then use the .hlp versions of these files.
TOOLS AND LINKS TO TOOLS 
VFCpipe tool may become unstable in some Win98/95 configurations.  
VFCpipe will generally work, although in its current state, may provide 'cluttered' output.
Links to call VFC tools will usually break across network connections (e.g. \\ComputerName\ ) and sometimes on mapped drives.

	THE WIN95/98 BUILT-IN CONSOLE TOOL
does not always jump to a located file and line.  Sometimes it depends on text qualifier characters (e.g. the " ).
cannot fully process long file names.  If you are using it, program any keyfile entries with short file names only.  You can get the short name from short cut properties.
does not find <file>.ext.ins files when a line is double clicked.  It only looks for <file>.ins.
VISUAL STUDIO ADD-INS
The Visual Studio C++  Add-in may not find an existing flowcode file.  This can be fixed via Visual Studio:    Use PROJECT \  ADD \  FILE  … and select the text code file that you want to see a flowcode file for.  Visual Studio will complain that the file is already in the project, but if you try the flowcode Add-in button again it should find it.
After using the Visual Studio C++ Add-in and exiting Visual Studio, the system may leave a MSDEV.exe process hanging. This depends on the VFC tools that you used.

	THE VFC GUI
Metafile copies of a selected LEND object may not be completely Black and White.  The connecting line from the LEND to the LOOP will have the color of your VFC file session.
At times you may notice a  FOCUS  bug when using the Statement Viewer.  It may cause you to jump to the wrong place in the file.  If this happens, try the jump again, and it should work.
Certain Rare combinations of characters may not hold comments properly.  Example: 
THIS DOES NOT HOLD COMMENTS >>> char   buff[1056]="\""  ;
The menu item View \ Clear All Bookmarks  will only clear bookmarks that were created by setting a bookmark for a selected object .. 'empty' bookmark dialogs (e.g. got line number dialogs) will remain.
The Keep On Top flag can get unset when an external process makes VFC jump to a line.
If a keyfile is not found VFC may warn you twice about it.  

	IMPORT PAST ENGINE
Import paste will map nested logic and iteration but will not map nested inputs.
The import paste may not always apply the MATCH_ORDER or CASE_SENSITIVE keyfile  flags.
If you choose to import paste after a normal paste does not locate VFC objects,  the first line of pasted code may get misplaced or lost

	THE TEMPLATE ENGINE
A benign bug in the Template processing module presents );\\ in prompt box if you use a ) character in the prompt.
A bug in the Template processing module can lose a double quote (e.g. ") when processing.  To fix the template use 2 double quotes where it occurs. 

	MISCELLANEOUS
When you have the Explore FlowCode Neighborhood dialog open and you shut down VFC,  a vfc99.exe process may stay open in the system.
Maximum size of a flowcode parameter line and comment line is 200 characters each.  Use structured programming techniques and/or continuation marks to keep the code lines shorter.  Long lines may be truncated or can cause VFC to become unstable.
Any export names with spaces will break the next time you load the flowcode file
If resources are low and too many VFC sessions are open, things can get slow and unresponsive or they may not draw completely.
VFC will not open two files with the exact same names. 

	SIMULATION MODE
As of this release not much attention has gone towards the simulation module, so be careful.  Future releases may address the simulation module and possibly add hooks for running other language interpreters.
MSGBOX does not work with array elements.
In this version the variables window will not display element names or values.  You can still double-click the window to define or re-define variables.
An event and stack bug may make the interpreter fail to return from a function or subroutine call properly.  Adding extra event labels to the flowcode might allow the call to operate.
The equation and logic parser may not report all cases of bad expression usage.  Be sure all logic and control statements use only the operators listed in the IRL help reference.  The IRL help is ancient but usable.

The equation parser does not support intrinsic math functions in this release.  However, you can compute math functions using a custom DLL function.  Some examples are provided. 
When jumping between errors in simulation mode the edit statement option may get confused about what statement to edit.
With certain types of errors messages may not accurately reflect the actual problem.  Please report these errors along with the VFC file that caused it.
Simulation speed control may not respond as expected.  Be aware that on slower computers a fast simulation can backlog the message queue.

