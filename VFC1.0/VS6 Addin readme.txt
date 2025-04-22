THE ADDINS PROVIDED HERE ARE PRELIMINARY.  THE VC++ IS MUCH MORE DEVELOPED THAN THE VB ADDIN.
___________________________________________________________

COVERED IN THIS README FILE:

	The Visual C++ AddIn

	The Visual Basic AddIn
___________________________________________________________


Visual C++:

    INSTALL:
	Start Visual C++

	From the main menu select:
		Tools -> Customize ...
	
	Select the Add-ins and Macro Files Tab

	Press the Browse ... Button and locate the VFC install directory 
		(e.g. C:\Program Files\FlowLynx\VFC)

	Set the Files of type: to Add-ins(.dll)

	Locate and select the file: VFC_AddIn_VC60.dll and double click it

	Select OK to any popup dialogs and close the Tools -> Customize Dialog box

	The AddIn should now be loaded and will display a button with a small white flowcode icon on it
		

    USAGE:
	To open the VFC toolbar you must be able to see the custom tools bar button.  It has a small white flowcode icon on it.  Pressing this button once opens the VFC AddIn toolbar.  Pressing it a second time will cause the AddIn to look for a flowcode file to display.
	To get a flowcode file to display, simply select a code file in Visual Studio and press the VFC AddIn Tool's WHITE Button Icon on the tool bar or on the Visual Studio tool menu.  The VFC AddIn will look for a flowcode file and try to generate one if not found.  Other buttons are equivalent to Visual Studio debugging buttons except that they animate the flowcode while you walk the code.
	From within a flowfile you may select a code object block and right click a popup menu that provides an item ' Synchronize with Visual Studio File .'  This will ONLY appear if the VFC Addin Toolbar is present.

    KNOWN PROBLEMS AND WORK AROUNDS:

	No tooltip help on the toolbar at this time.

	At times the AddIn cannot locate a flowfile even if it exisits.  Other times it trys to flow an exisiting code file and the Parse Manager fails to locate it.  This problem can be fixed (partially) via Visual C++.  

	From the main menu select:
		Project -> Add to Project -> Files

	Find the code file that the VFC AddIn has trouble with and add it to your project.  This may cause Visual C++ to note that the file is already in the project and cannot be added.  
	Cancel any dialog boxes and try the VFC AddIn again - It should work now.

	What happened?  

	Even though Visual C++ did not change the project in any way, the Automation Object model now can provide accurate file location information to the VFC AddIn. Is this a Visual C++ Studio bug?  We do not know, but the upcoming VC++ addin should implement a remedy for this.
	
___________________________________________________________


Visual Basic:
	
    INSTALL:

	Run the file: setup_addins.BAT

	Alternatively you can issue the command:  
		C:\WINDOWS\SYSTEM\REGSVR32.EXE VFC_AddIn_VB60.dll

	Start Visual Basic and Select from the main menu:
		Add-Ins -> FlowLynx VFC AddIn for VB6.0

	The AddIn should now be loaded and will display a button with a small white flowcode icon on it

    USAGE:

	Simply select a code file in Visual Basic and press the VFC AddIn Tool Button Icon.  It will look for a flowcode file and try to generate one if not found.

    KNOWN PROBLEMS AND WORK AROUNDS:

	This AddIn only autoparses .frm file extensions as Visual Basic files.  Also, for the VB Addin to find the proper files you must have 'syncrhonized' the names of the VB6 objects with their respective filenames AND flowcode filenames.
e.g. 
	flowcode name:     MyFile.bas.ins
	export name :      MyFile.bas


Sinc the VB Addin will only autoparse .frm files, you must 'manually' parse other extensions (e.g. .bas, .dsr, etc.) initially.  Thereafter, if your VB object names, file names and flowcode names are synchronized, the VB Addin should find them.  
	
	This Addin will not exactly synchronize a placement in the flowcode to a placement in the text code.  You may find it puts you within ~ 10 lines of code from your desired placement.  These problems are related to the integration of the VB parser and the VB AddIn along with the VB6.0 Automation Object model. 
	
	Upcoming versions of both VB6.par and the VB6 AddIn will have tighter integration and better VB6 recognition.