## Getting Started


### Installation of binary VFC1.0 for Windows:

```
# Clone the repository 

git clone https://github.com/RedHorseVR/VFCode.git

# Place the VFC1.0 Folder at a location with install permission 
   E.g. <YOUR INSTALL FOLDER> = C:/Users/Default/VFC1.0

# Navigate to the project directory
   cd  <YOUR INSTALL FOLDER>

# set a path to <YOUR INSTALL FOLDER> using Windows 
   Open System Properties:  
         Right-click on the "This PC" or "My Computer" icon on your desktop or in File Explorer.         
         Select Properties from the context menu.        
         Click on Advanced system settings.
   Access Environment Variables:
         In the System Properties window, click the Environment Variables button near the bottom.
   Edit the PATH Variable:        
         Under the "System variables" section, find the Path variable (scroll down if necessary).
         Select it and click Edit.
         Add a new path by clicking New and typing the folder path as
            <YOUR INSTALL FOLDER>
         Confirm Your Changes.
   Test Your Changes:    
      Open Command Prompt (Press Windows + R, type cmd, and hit Enter).
      Type echo %Path% to see if your changes are reflected.

# first time run:
1) Make sure you are in <YOUR INSTALL FOLDER> 
2) run VFC from a command line locally from its install directory:
   > CD <YOUR INSTALL FOLDER>
   > VFC2000.exe

# from VFC window menu:
1) select Settings - VFC System Directories ...
2) select User Currenct then SET DIRECTORIES ...
3) press Continue to let VFC set registry to where VFC and the tools are installed
# if your system permission blocks registry additions, place the VFC in a folder on your local account.
```

### Quick Start Exporting a File

```
Once the tool is running you can export code from a diagram uisng this workflow:

   a) on the menu select the languge drop list if not already selected
   b) either experiement with sybols to create a flwowcode diagram or load an example or other flowcode.
   c) once you have a diagram and want to export the code to a file - from the menu select Settings - Export & Language Settings ...
   d) in the popup dialog enter the text file name for the code you will export an dverify the Key File is set to the correct Language
   e) check the box 'Automatically Export on Save' and close the diaglog window- alternative3ly ther is an 'Export fiel' checkbox on the menu bar
   f) once the Export check is set it will output all the text in the diagram to your export file name
   
```
