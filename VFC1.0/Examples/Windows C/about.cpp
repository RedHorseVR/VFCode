/* includes */
   #include <windows.h>
   #include "resource.h"
/*------------*/
/* About Modal Dialog  */
   /* 
   DialogBox( NULL, "About" , hWnd , (DLGPROC) About_DlgProc );
   LRESULT CALLBACK About_DlgProc(HWND hDlg,UINT uMessage,WPARAM wParam,LPARAM lParam);
   */ 
LRESULT CALLBACK About_DlgProc(HWND hDlg,UINT uMessage,WPARAM wParam,LPARAM lParam){
   switch (uMessage){
   case WM_INITDIALOG:
      { 
      return TRUE;
      }
   case WM_COMMAND:
      switch(wParam ){
      case IDCANCEL:
         { 
         EndDialog( hDlg , FALSE );
         break; 
         }
      case IDOK:
         { 
         EndDialog( hDlg , TRUE );
         return TRUE;
         }
      default:
         break; 
         
      } 
   } 
return FALSE;
} 

// ----------------------------------------------------------------------------------------------;

//  Exported By Insecta Version 2.0 - October 1996 Beta 3;
//  Insecta File: About.ins;
//  Export  File: About.cpp;
//  Export  Date: 01:42:57 AM - 31:Jan:1997;

