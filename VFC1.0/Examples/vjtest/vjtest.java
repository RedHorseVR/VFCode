/**  C:\WINDOWS\PROFILES\LUIS\DESKTOP\VJTEST\VJTEST~1.JAV  **/  

import java.applet.*; 
import java.awt.*; 
import vjtestFrame; 
public class vjtest extends Applet implements Runnable { 
private Thread m_vjtest = null;
private Graphics m_Graphics; 
private Image m_Images[];
private int m_nCurrImage; 
private int m_nImgWidth =0; 
private int m_nImgHeight =0; 
private boolean m_fAllLoaded =false; 
private final int NUM_IMAGES =18; 



private boolean m_fStandAlone =false; 
public static void main(String args[]) 
   { 
   vjtestFrame frame =new vjtestFrame("vjtest"); 
   
   
   frame.show(); 
   frame.hide(); 
   frame.resize(frame.insets().left + frame.insets().right + 320, frame.insets().top + frame.insets().bottom + 240); 
   vjtest applet_vjtest =new vjtest(); 
   frame.add("Center", applet_vjtest); 
   applet_vjtest.m_fStandAlone =true; 
   applet_vjtest.init(); 
   applet_vjtest.start(); 
   frame.show(); 
} 
public vjtest() 
   { 
} 
public String getAppletInfo() 
   { 
return "Name: vjtest\r\n" + "Author: Luis Lopez\r\n" + "Created with Microsoft Visual J++ Version 1.1"; 
} 
public void init() 
   { 
   resize(320, 240); 
} 
public void destroy() 
   { 
} 
private synchronized   void displayImage(Graphics g)
   { 
   if (!m_fAllLoaded) 
   
      return; 
      
   
   g.drawImage(m_Images[m_nCurrImage], (size().width - m_nImgWidth) / 2, (size().height - m_nImgHeight) / 2, null); 
   try 
   {  
      
   }  catch(InterruptedException e) {
      g.drawString("! Interrupted ...", 10, 20);
   } 
} 
public void paint(Graphics g) 
   
   
   
   
   
   { 
   if (m_fAllLoaded) 
   { 
      Rectangle r =g.getClipRect(); 
      g.clearRect(r.x, r.y, r.width, r.height); 
      displayImage(g); 
      } 
   else 
      g.drawString("Loading images...", 10, 20); 
   
} 
public void start() 
   { 
   if (m_vjtest == null) 
   { 
      m_vjtest =new Thread(this); 
      m_vjtest.start(); 
   
} } 
public void stop() 
   { 
   if (m_vjtest != null) 
   { 
      m_vjtest.stop(); 
      m_vjtest =null; 
   
} } 
public void run() 
   { 
   m_nCurrImage =0; 
   
   
   
   if (!m_fAllLoaded) 
   { 
      repaint(); 
      m_Graphics =getGraphics(); 
      m_Images =new Image[NUM_IMAGES]; 
      MediaTracker tracker =new MediaTracker(this); 
      String strImage; 
      
      
      
      
      
      for (int i = 1; i <= NUM_IMAGES; i++) { 
         strImage ="images/img00" + ((i < 10) ? "0" : "") + i + ".gif"; 
         if (m_fStandAlone) 
         
            m_Images[i-1] =Toolkit.getDefaultToolkit().getImage(strImage); 
         else 
            m_Images[i-1] =getImage(getDocumentBase(), strImage); 
         
         tracker.addImage(m_Images[i-1], 0); 
      } 
      
      try { 
      
         tracker.waitForAll(); 
         m_fAllLoaded =!tracker.isErrorAny(); 
         } 
      catch (InterruptedException e) { 
      } 
      
      if (!m_fAllLoaded) 
      { 
         stop(); 
         m_Graphics.drawString("Error loading images!", 10, 40); 
         return; 
         
      
      } m_nImgWidth =m_Images[0].getWidth(this); 
      m_nImgHeight =m_Images[0].getHeight(this); 
   
   }repaint(); 
   while (true) { 
      try { 
      
         displayImage(m_Graphics); 
         m_nCurrImage++; 
         if (m_nCurrImage == NUM_IMAGES) 
         
            m_nCurrImage =0; 
         
         Thread.sleep(50); 
         } 
      catch (InterruptedException e) { 
         stop(); 
      } 
   } 
} 
public boolean mouseDown(Event evt, int x, int y) 
   { 
return true; 
} 
public boolean mouseUp(Event evt, int x, int y) 
   { 
return true; 
} 
public boolean mouseDrag(Event evt, int x, int y) 
   { 
return true; 
} 
public boolean mouseMove(Event evt, int x, int y) 
   { 
return true; 
} 
public boolean mouseEnter(Event evt, int x, int y) 
   { 
return true; 
} 
public boolean mouseExit(Event evt, int x, int y) 
   { 
return true; 
} 
} 


// ----------------------------------------------------------------------------------------------...

//  Exported By Insecta Version 2.0 - October 1996 Beta 3...
//  Insecta File: VJTEST.ins...
//  Export  File: vjtest.java...
//  Export  Date: 10:17:53 PM - 10:Aug:1997...

