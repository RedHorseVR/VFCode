/* includes */
#include <windows.h>
#include <commdlg.h>
#include <stdio.h> 
#include <sys\types.h>
#include <sys\stat.h>

/* defines */
#define TRACKING    1
#define TRACK  if( TRACKING )  {char cmd[255]; wsprintf(cmd,"c:\\program files\\insecta\\insecta2.exe %s -Goto %d %d", "MyDLL.ins" ,__LINE__);  WinExec(cmd, (UINT) NULL); }
#define BREAK  {char cmd [255]; if(TRACKING){wsprintf( cmd , "c:\\program files\\insecta\\insecta2.exe  %s  -Goto %d  %d ", __FILE__ , __LINE__ );  WinExec( command , NULL ); MESSG}} 
/* globals */
HWND OwnerWindow = NULL;
HINSTANCE hInst=NULL;
/* prototypes */
void Function();
BOOL WINAPI DllMain (HINSTANCE hDLL, DWORD dwReason, LPVOID lpReserved) ;  
void GetFileName(  HWND hWnd, char * filename, char * exten, char * prompt) ;
void Find_Dlg( HWND hWnd , char * string_to_find ) ;

void main() {  
} //end main() 
void GetFileName(  HWND hWnd, char * filename, char * exten, char * prompt) {
OPENFILENAME OpenFileName;
char DefName[258];
char   choice_buffer[1000];
strcpy(filename,"");
wsprintf(choice_buffer,   "Record File: %s;\0%s;\0" , filename , exten );
wsprintf( DefName, "*.%s", exten );



OpenFileName.lStructSize = sizeof(OPENFILENAME);
OpenFileName.hwndOwner = hWnd;
OpenFileName.hInstance = hInst;
OpenFileName.lpstrFilter = NULL ;
OpenFileName.lpstrCustomFilter = NULL;
OpenFileName.nMaxCustFilter = 40;
OpenFileName.nFilterIndex = 0;
OpenFileName.lpstrFile =   DefName;
OpenFileName.nMaxFile = sizeof(filename);
OpenFileName.lpstrFileTitle = filename;
OpenFileName.nMaxFileTitle = 255;
OpenFileName.lpstrInitialDir = NULL;
OpenFileName.lpstrTitle = prompt;
OpenFileName.nFileOffset = 0;
OpenFileName.nFileExtension = 0;
OpenFileName.lpstrDefExt = exten ;
OpenFileName.lCustData = (LPARAM) NULL;
OpenFileName.lpfnHook = NULL;
OpenFileName.lpTemplateName = NULL;
OpenFileName.Flags = OFN_SHOWHELP | OFN_EXPLORER;


TRACK  if ( !GetOpenFileName(&OpenFileName))
{
char buff[255];
struct _stat buf;
int result;
result = _stat( filename , &buf );

TRACK if( result == 0 )
{ TRACK
wsprintf(buff,"%s is in use.  Use it anyway?",filename);
if( (IDYES==MessageBox(hWnd,buff,"Insecta",MB_YESNO)) )
{
TRACK
return;
}else{ TRACK
strcpy(filename,""); 
} 
}else{  TRACK
} 
}else{ TRACK
MessageBox( hWnd , "File open dialog did not open. Resources may be too low." , "File Open Failure", 0 );
}  TRACK
}
void Function() {
MessageBox( OwnerWindow, "DLL Function test", " Generic DLL", MB_OK);
}
void Find_Dlg( HWND hWnd , char * string_to_find ){
HWND hDlg;
FINDREPLACE fr;

/* Set all structure fields to zero. */
memset(&fr, 0, sizeof(FINDREPLACE));
fr.lStructSize = sizeof(FINDREPLACE);
fr.hwndOwner = hWnd ;
fr.lpstrFindWhat = string_to_find ;
fr.wFindWhatLen = sizeof(  string_to_find );
hDlg = FindText(&fr);
MessageBox( hDlg , "DLL Find test", " Generic DLL", MB_OK);
DestroyWindow( hDlg );
} 
BOOL WINAPI DLLMain (HINSTANCE hDLL, DWORD dwReason, LPVOID lpReserved){
hInst = hDLL;
if( dwReason == DLL_PROCESS_ATTACH )
{

}else{
}
if( dwReason == DLL_PROCESS_DETACH )
{

}else{
}
return TRUE;}

// ----------------------------------------------------------------------------------------------;

//  Exported By Insecta Version 2.0 - October 1996 Beta 3;
//  Insecta File: MyDLL.ins;
//  Export  File: MyDLL.c;
//  Export  Date: 11:31:52 AM - 24:Oct:1997;

