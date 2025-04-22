/* includes */ /* input:1:FILE: glos.h*/
   #include "glos.h" /* generic:2:  */
   #include <GL/gl.h> /* generic:3:  */
   #include <GL/glu.h> /* generic:4:  */
   #include <GL/glaux.h> /* generic:5:  */
/* prototypes */  /* input:6:*/
   GLvoid Initialize(GLvoid); /* generic:7:  */
   GLvoid CALLBACK drawScene(GLvoid); /* generic:8:  */
   GLvoid CALLBACK resize(GLsizei, GLsizei); /* generic:9:  */
   GLvoid drawLight(GLvoid); /* generic:10:  */
   void polarView( GLdouble, GLdouble, GLdouble, GLdouble); /* generic:11:  */
   GLfloat latitude, longitude, radius; /* generic:12:  */
/*------------*/ /* end:13: */
void _CRTAPI1 main(void){ /* input:14:  */
   Initialize(); /* generic:15:  */
   auxMainLoop( drawScene ); /* generic:16:  */
}  /* end:17:  */
/*------------*/ /* end:18: */
GLvoid CALLBACK resize( GLsizei width, GLsizei height ){ /* input:19:  */
   GLfloat aspect; /* generic:20:  */
   glViewport( 0, 0, width, height ); /* generic:21:  */
   aspect = (GLfloat) width / height; /* generic:22:  */
   glMatrixMode( GL_PROJECTION ); /* generic:23:  */
   glLoadIdentity(); /* generic:24:  */
   gluPerspective( 45.0, aspect, 3.0, 7.0 ); /* generic:25:  */
   glMatrixMode( GL_MODELVIEW ); /* generic:26:  */
}  /* end:27:  */
/*------------*/ /* end:28: */
GLvoid Initialize(GLvoid){ /* input:29:  */
   GLfloat maxObjectSize, aspect; /* generic:30:  */
   GLdouble near_plane, far_plane; /* generic:31:  */
   GLsizei width, height; /* generic:32:  */
   GLfloat ambientProperties[] = {0.7, 0.7, 0.7, 1.0}; /* set:33:*/
   GLfloat diffuseProperties[] = {0.8, 0.8, 0.8, 1.0}; /* generic:34:  */
   GLfloat specularProperties[] = {1.0, 1.0, 1.0, 1.0}; /* generic:35:  */
   width = 512.0; /* generic:36:  */
   height = 380.0; /* generic:37:  */
   auxInitPosition( width/4, height/4, width/2, height/2); /* generic:38:  */
   auxInitDisplayMode( AUX_RGB | AUX_DEPTH | AUX_DOUBLE ); /* generic:39:  */
   auxInitWindow( "Flowcoded OpenGL Demo" ); /* generic:40:auxInitWindow( "AUX Library Demo" );*/
   auxIdleFunc( drawScene ); /* generic:41:  */
   auxReshapeFunc( resize ); /* generic:42:  */
   glClearColor( 0.0, 0.0, 0.0, 1.0 ); /* generic:43:  */
   glClearDepth( 1.0 ); /* generic:44:  */
   glEnable(GL_DEPTH_TEST); /* generic:45:  */
   glEnable(GL_LIGHTING); /* generic:46:  */
   glLightfv( GL_LIGHT0, GL_AMBIENT, ambientProperties); /* generic:47:  */
   glLightfv( GL_LIGHT0, GL_DIFFUSE, diffuseProperties); /* generic:48:  */
   glLightfv( GL_LIGHT0, GL_SPECULAR, specularProperties); /* generic:49:  */
   glLightModelf(GL_LIGHT_MODEL_TWO_SIDE, 1.0); /* generic:50:  */
   glEnable( GL_LIGHT0 ); /* generic:51:  */
   glMatrixMode( GL_PROJECTION ); /* generic:52:  */
   aspect = (GLfloat) width / height; /* generic:53:  */
   gluPerspective( 45.0, aspect, 3.0, 7.0 ); /* generic:54:  */
   glMatrixMode( GL_MODELVIEW ); /* generic:55:  */
   near_plane = 3.0; /* generic:56:  */
   far_plane = 7.0; /* generic:57:  */
   maxObjectSize = 3.0; /* generic:58:  */
   radius = near_plane + maxObjectSize/2.0; /* generic:59:  */
   latitude = 0.0; /* generic:60:  */
   longitude = 0.0; /* generic:61:  */
   }  /* generic:62:  */
/*------------*/ /* end:63: */
void polarView(GLdouble radius, GLdouble twist, GLdouble latitude,       GLdouble longitude){ /* input:64:  */
   glTranslated(0.0, 0.0, -radius); /* generic:65:  */
   glRotated( -twist, 0.0, 0.0, 1.0 ); /* generic:66:  */
   glRotated( -latitude, 1.0, 0.0, 0.0); /* generic:67:  */
   glRotated( longitude, 0.0, 0.0, 1.0); /* generic:68:  */
}  /* end:69:  */
/*------------*/ /* end:70: */
GLvoid CALLBACK drawScene(GLvoid){ /* input:71:  */
   static GLfloat whiteAmbient[] = {0.3, 0.3, 0.3, 1.0}; /* set:72:*/
   static GLfloat redAmbient[] = {0.3, 0.1, 0.1, 1.0}; /* generic:73:  */
   static GLfloat greenAmbient[] = {0.1, 0.3, 0.1, 1.0}; /* generic:74:  */
   static GLfloat blueAmbient[] = {0.1, 0.1, 0.3, 1.0}; /* generic:75:  */
   static GLfloat whiteDiffuse[] = {1.0, 1.0, 1.0, 1.0}; /* generic:76:  */
   static GLfloat redDiffuse[] = {1.0, 0.0, 0.0, 1.0}; /* generic:77:  */
   static GLfloat greenDiffuse[] = {0.0, 1.0, 0.0, 1.0}; /* generic:78:  */
   static GLfloat blueDiffuse[] = {0.0, 0.0, 1.0, 1.0}; /* generic:79:  */
   static GLfloat whiteSpecular[] = {1.0, 1.0, 1.0, 1.0}; /* generic:80:  */
   static GLfloat redSpecular[] = {1.0, 0.0, 0.0, 1.0}; /* generic:81:  */
   static GLfloat greenSpecular[] = {0.0, 1.0, 0.0, 1.0}; /* generic:82:  */
   static GLfloat blueSpecular[] = {0.0, 0.0, 1.0, 1.0}; /* generic:83:  */
   static GLfloat lightPosition0[] = {1.0, 1.0, 1.0, 1.0}; /* generic:84:  */
   static GLfloat angle = 0.0; /* generic:85:  */
   glClear( GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT ); /* generic:86:  */
   glPushMatrix(); /* generic:87:  */
   latitude += 4.0; /* generic:88:  */
   longitude += 2.5; /* generic:89:  */
   polarView( radius, 0, latitude, longitude ); /* generic:90:  */
   glPushMatrix(); /* generic:91:  */
   angle += 20.0; /* generic:92:  angle += 1.0;  // Speed of orbiting light object*/
   glRotatef(angle, 1.0, 0.0, 1.0); /* generic:93:  */
   glTranslatef( 0.0, 1.5, 0.0); /* generic:94:  */
   glLightfv(GL_LIGHT0, GL_POSITION, lightPosition0); /* generic:95:  */
   drawLight(); /* generic:96:  */
   glPopMatrix(); /* generic:97:  */
   glPushAttrib(GL_LIGHTING_BIT); /* generic:98:  */
   glMaterialfv(GL_FRONT_AND_BACK, GL_AMBIENT, redAmbient); /* generic:99:  */
   glMaterialfv(GL_FRONT_AND_BACK, GL_DIFFUSE, redDiffuse); /* generic:100:  */
   glMaterialfv(GL_FRONT_AND_BACK, GL_SPECULAR, whiteSpecular); /* generic:101:  */
   glMaterialf(GL_FRONT, GL_SHININESS, 100.0); /* generic:102:  */
   auxSolidCone( 0.3, 0.6 ); /* generic:103:  */
   glPopAttrib(); /* generic:104:  */
   auxWireSphere(1.5); /* generic:105:  */
   glPushAttrib(GL_LIGHTING_BIT); /* generic:106:  */
   glMaterialfv(GL_BACK, GL_AMBIENT, greenAmbient); /* generic:107:  */
   glMaterialfv(GL_BACK, GL_DIFFUSE, greenDiffuse); /* generic:108:  */
   glMaterialfv(GL_FRONT, GL_AMBIENT, blueAmbient); /* generic:109:  */
   glMaterialfv(GL_FRONT, GL_DIFFUSE, blueDiffuse); /* generic:110:  */
   glMaterialfv(GL_FRONT, GL_SPECULAR, blueSpecular); /* generic:111:  */
   glMaterialf(GL_FRONT, GL_SHININESS, 50.0); /* generic:112:  */
   glPushMatrix(); /* generic:113:  */
   glTranslatef(0.8, -0.65, 0.0); /* generic:114:  */
   glRotatef(30.0, 1.0, 0.5, 1.0); /* generic:115:  */
   auxSolidCylinder( 0.3, 0.6 ); /* generic:116:  */
   glPopMatrix(); /* generic:117:  */
   glPopAttrib(); /* generic:118:  */
   glPopMatrix(); /* generic:119:  */
   auxSwapBuffers(); /* generic:120:  */
   }  /* generic:121:  */
/*------------*/ /* end:122: */
GLvoid drawLight(GLvoid){ /* input:123:  */
   glPushAttrib(GL_LIGHTING_BIT); /* generic:124:  */
   glDisable(GL_LIGHTING); /* generic:125:  */
   glColor3f(1.0, 1.0, 1.0); /* generic:126:  */
   auxSolidDodecahedron(0.1); /* generic:127:  */
   glPopAttrib(); /* generic:128:  */
}  /* end:129:  */

/* ----------------------------------------------------------------------------------------------*/

/*  Exported By Insecta Version 2.0 - October 1996 Beta 3*/
/*  Insecta File: AUXDEMO.ins*/
/*  Export  File: Auxdemo.c*/
/*  Export  Date: 11:55:55 AM - 19:Nov:1996*/

