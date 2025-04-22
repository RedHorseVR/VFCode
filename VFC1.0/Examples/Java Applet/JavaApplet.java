/** recipe log **/
   /** <TIME_STAMP>  inserted an image img1.gif  using segment: 'Animate images.sg'  **/
   /**<TIME_STAMP> added Cross Hairs segments using: 'CrossHair.sg'  **/
   /** <TIME_STAMP> LANGUAGE: Java ;   started Applet / Application  JavaApplet.class   using frame: 'Basic Applet.fm'   **/

/** Imports **/
   import java.awt.*;
   import java.applet.*;
   import java.net.*;
   
/*------------*/
public class JavaApplet  extends Applet {
/** class data **/
   URL CodeBase;
   
   int CrossSize =  200; 
   int CrossXPos = 10; 
   int CrossYPos = 10; 
   Image im;
   Image im2;
   int ImageXPos = 10;
   int ImageYPos = 10;
   int Image = 0;
/** end variables **/ 
/** methods **/
   void drawCrossHair( Graphics g, int x, int y, int size ){
   g.drawLine( x - size, y, x +size, y);
   g.drawLine( x, y - size , x, y + size );
   } 
   boolean processCrossHairPosition( Event e ){
   switch (e.id){
      case Event.MOUSE_DOWN:
      case Event.MOUSE_DRAG:
         CrossXPos = e.x;
         CrossYPos = e.y;
         repaint();
         return true;
         
   } 
return false;} 

public void init(){
   im = getImage(getCodeBase(),"img1.gif ");
   im2 = getImage(getCodeBase(),"img2.gif ");
   CodeBase = getCodeBase();
   
} 
public static void main(String args[]){
   JavaApplet  Obj = new JavaApplet();
   //setup frame using MAIN controls
} 
public void paint(Graphics g){
   if( Image==1)
      {
         Image=0;
         g.drawImage(im, ImageXPos, ImageYPos+50, this );
      }else{
         Image=1;
         g.drawImage(im2, ImageXPos, ImageYPos+50, this );
   }
   drawCrossHair( g, CrossXPos, CrossYPos, CrossSize );
} 
public boolean handleEvent(Event e){
   if( processCrossHairPosition( e ) )
      {
         return true;
   }
   switch (e.id){
      case Event.ACTION_EVENT:
         if( "OK".equals(e.arg) || "CLOSE".equals(e.arg)  )
            { 
               System.exit(0);
               return true; 
         } 
         break; 
      case Event.WINDOW_DESTROY:
         System.exit(0);
         return true;
         
   } 
return false; }
}       /** end of class definition **/

// ----------------------------------------------------------------------------------------------...

//  Exported By Insecta Version 2.0 - October 1996 Beta 3...
//  Insecta File: JavaApplet.ins...
//  Export  File: JavaApplet.java...
//  Export  Date: 09:10:19 AM - 20:Nov:1996...

