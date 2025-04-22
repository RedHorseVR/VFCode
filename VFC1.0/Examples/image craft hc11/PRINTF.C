/*  F:\US&R\WWW_WORK\NEWPAGE\FLOWCO~1\KITS\HC11CO~1\SAMPLES\PRINTF.C  */  


















/* defines */ 
   #define MAXCHARS 512
   #define LEN 20
/* prototypes */ 
   static void itoa(char **buf, int i, int base); 
   void   putchar(char );
   void printf(char *fmt, int arg, ...) ;

void printf(char *fmt, int arg, ...)
   { 
   int *p =&arg; 
   char *bp, *s; 
   int i; 
   char buf[MAXCHARS]; 
   bp =buf; 
   *bp =0; 
   while (*fmt)
      if (*fmt != '%')
      {
         *bp++ =*fmt++; 
      } else {
         { 
         switch (*++fmt) {
         case 'd': 
            i =*p++; 
            if (i < 0) 
            { 
               *bp++ ='-'; 
               i =-i; 
            }
            itoa(&bp, i, 10);
            break; 
            
         case 'o': 
            i =*p++; 
            if (i < 0) 
            { 
               *bp++ ='-'; 
               i =-i; 
            }
            *bp++ ='0';
            itoa(&bp, i, 8); 
            break; 
            
         case 'x': 
            i =*p++; 
            if (i < 0) 
            { 
               *bp++ ='-'; 
               i =-i; 
            }
            *bp++ ='0';
            *bp++ ='x'; 
            itoa(&bp, i, 16); 
            break; 
            
         case 'c': 
            *bp++ =*p++; 
            break; 
            
         case 's': 
            s =*(char **)p; 
            p +=sizeof (char **) / sizeof (int); 
            if (!s) 
            
               s ="(null)"; 
            
            while (*s)
            *bp++ =*s++;
            break; 
            
         } 
         
         fmt++; 
      }
   } 
   *bp =0; 
   for (bp = buf; *bp; bp++) putchar(*bp) 
   ; 
} 
static void itoa(char **buf, int i, int base) 
   { 
   char *s; 
   int rem; 
   static char rev[LEN+1]; 
   rev[LEN] =0; 
   if (i == 0) 
   { 
      (*buf)[0] ='0'; 
      ++(*buf); 
      return; 
      
   }
   s =&rev[LEN];
   while (i) { 
      rem =i % base; 
      if (rem <= 10) 
      
         *--s =rem + '0'; 
      else 
         if (base == 16) 
         
            *--s ="abcdef"[rem - 10]; 
         
      
      i /=base; 
   } 
   while (*s) { 
      (*buf)[0] =*s++; 
      ++(*buf); 
   } 
} 


/* ----------------------------------------------------------------------------------------------*/

/*  Exported By Insecta Version 2.0 - October 1996 Beta 3*/
/*  Insecta File: PRINTF.ins*/
/*  Export  File: PRINTF.c*/
/*  Export  Date: 05:48:44 AM - 09:Aug:1997*/

