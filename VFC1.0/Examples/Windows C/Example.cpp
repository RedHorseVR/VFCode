/* includes */
   #include <windows.h>
   #include"resource.h" 
/* defines */ 
   #define  START_BACKGROUND     GRAY_BRUSH
   #define STARTWIDTH  400
   #define STARTHEIGHT  300
   #define STARTPOSITION_X   CW_USEDEFAULT
   #define STARTPOSITION_Y   CW_USEDEFAULT
   #define  WINDOW_CLASS    "Example_WClass"
   #define  WINDOW_NAME  "Example - an Insecta Built Windows Program"
   #define  WINDOW_STYLE   WS_OVERLAPPEDWINDOW
   #define  SHOWSTATE   SW_SHOW
/* globals */
   HANDLE hInst; 
   HWND MainWindow;
   WNDCLASS  wc; 
/* prototypes */ 
   int WINAPI WinMain(HANDLE, HANDLE, LPSTR, int);
   int CALLBACK  Example(HWND, UINT, WPARAM, LPARAM);
   LRESULT CALLBACK About_DlgProc(HWND hDlg,UINT uMessage,WPARAM wParam,LPARAM lParam);

int WINAPI  Example(HWND hWnd,UINT message,WPARAM wParam,LPARAM lParam) {
   switch (message) { 
   case WM_COMMAND:   
      switch(wParam) { 
      case IDM_ABOUT :
         DialogBox( NULL, "About" , hWnd , (DLGPROC) About_DlgProc );
         break; 
         
      case IDCANCEL: 
         DestroyWindow(hWnd);
         break; 
         
      } 
   case WM_CREATE:
      break; 
      
   case WM_DESTROY:
      PostQuitMessage(0);
      break; 
      
   default: 
      return (DefWindowProc(hWnd, message, wParam, lParam));
      
   }
return FALSE;} 
int CALLBACK WinMain(HANDLE hInstance, HANDLE hPrevInstance, LPSTR lpCmdLine,int nCmdShow) {
   if (!hPrevInstance)   
   {
      wc.style = 0; 
      wc.lpfnWndProc = (WNDPROC) Example;
      wc.cbClsExtra = 0; 
      wc.cbWndExtra = 0; 
      wc.hInstance = hInstance; 
      wc.hIcon = LoadIcon(hInstance, "Icon");
      wc.hCursor = LoadCursor(NULL, IDC_ARROW); 
      wc.hbrBackground = GetStockObject( START_BACKGROUND );
      wc.lpszMenuName =  "Menu";
      wc.lpszClassName =WINDOW_CLASS;
      if (!RegisterClass(&wc))
      { 
         return (FALSE);   
      }
      MainWindow = CreateWindow( WINDOW_CLASS, WINDOW_NAME,  WINDOW_STYLE,STARTPOSITION_X,
      STARTPOSITION_Y, STARTWIDTH, STARTHEIGHT ,NULL,NULL,hInstance,NULL);
      if ( ! MainWindow  )
      { 
         return (FALSE); 
      }else{ 
         ShowWindow( MainWindow , SHOWSTATE  );
         UpdateWindow( MainWindow );
      }
   }else{ 
   }
   MSG msg; 
   while ( GetMessage(&msg, NULL, 0, 0)  ) {
      TranslateMessage(&msg);   
      DispatchMessage(&msg); 
   } 
return (msg.wParam);} 

// ----------------------------------------------------------------------------------------------;

//  Exported By Insecta Version 2.0 - October 1996 Beta 3;
//  Insecta File: Example.ins;
//  Export  File: Example.cpp;
//  Export  Date: 01:56:13 AM - 31:Jan:1997;

