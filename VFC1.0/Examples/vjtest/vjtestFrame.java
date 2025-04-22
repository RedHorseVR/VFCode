/**  C:\WINDOWS\Profiles\luis\Desktop\vjtest\vjtestFrame.java  **/

import java.awt.*; 
class vjtestFrame extends Frame { 
public vjtestFrame(String str) 
   { 
   super (str); 
} 
public boolean handleEvent(Event evt) 
   { 
   switch (evt.id) { 
   case Event.WINDOW_DESTROY: 
      dispose(); 
      System.exit(0); 
      return true; 
      
   default: 
      return super.handleEvent(evt); 
      
   } 
} 
} 


// ----------------------------------------------------------------------------------------------...

//  Exported By Insecta Version 2.0 - October 1996 Beta 3...
//  Insecta File: vjtestFrame.ins...
//  Export  File: vjtestFrame.java...
//  Export  Date: 02:23:39 PM - 09:Aug:1997...

