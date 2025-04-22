/* defines */ 
   #define TRUE 1
   #define FALSE 0
   #define NULL 0
   
   #define LOOPS  5000 /* Use this for slow or 16 bit machines */
   
   
   
   #ifdef NOSTRUCTASSIGN
   
      #undef  NOSTRUCTASSIGN
   #endif
   
   
   
   
   
   
   #define HZ  60 /* times(2) returns 1/60 second (most) */
   
   
   
   #ifdef GOOF 
   
      char Version[] ="1.0";
   #else 
      char Version[] ="1.1";
   #endif 
   #ifdef NOSTRUCTASSIGN
   
      #define structassign(d, s)  memcpy(&(d), &(s), sizeof(d))
   #else 
      #define structassign(d, s)   d = s
   #endif 
   #ifdef NOENUM
   
      #define Ident1 1
      #define Ident2 2
      #define Ident3 3
      #define Ident4 4
      #define Ident5 5
      typedef int Enumeration;
   #else 
      typedef enum{Ident1, Ident2, Ident3, Ident4, Ident5} 
      Enumeration; 
   #endif 
/* typedefs */
   typedef int OneToThirty;
   typedef int OneToFifty;
   typedef char CapitalLetter;
   typedef char String30[31];
   typedef int Array1Dim[51];
   typedef int Array2Dim[51][51];
   typedef struct Record RecordType; 
   typedef RecordType *RecordPtr; 
   typedef int boolean;
   struct Record {
   struct Record *PtrComp;
   Enumeration Discr;
   Enumeration  EnumComp;
   OneToFifty  IntComp;
   String30  StringComp;
   }; 
   #ifndef  REG
   
      #define REG
   #endif 
   extern EnumerationFunc1(); 
   extern booleanFunc2(); 
   #ifdef DEBUG 
   
      #define dprintf  printf
   #else 
      #define dprintf(s) 
   #endif 

/* prototypes */ 
   
   void printf(char *fmt, ...) ;
   void strcpy(char *fmt, char *s2 ) ;
   int strcmp(char *StrParI1, char *StrParI2);
   void  main() ;
   void  Proc0() ;
   void  Proc1(REG RecordPtr PtrParIn);
   void  Proc2(OneToFifty  *IntParIO);
   void  Proc3( RecordPtr *PtrParOut );
   void  Proc4() ;
   void  Proc5() ;
   void  Proc6( REG Enumeration EnumParIn, REG Enumeration *EnumParOut );
   void  Proc7( OneToFifty IntParI1, OneToFifty IntParI2, OneToFifty *IntParOut );
   void  Proc8(Array1Dim Array1Par, Array2Dim Array2Par, OneToFifty IntParI1, OneToFifty IntParI2);
   Enumeration Func1(CapitalLetter  CharPar1, CapitalLetter CharPar2 );
   boolean Func2(String30 StrParI1, String30 StrParI2);
   boolean Func3( REG Enumeration  EnumParIn );

void   main()
   { 
   printf ("dhrystone - 1.1 (C/1.1, 01/06/86)\n"); 
   
   Proc0(); 
} 
RecordType x1, x2; 

int IntGlob;
boolean BoolGlob;
char Char1Glob;
char  Char2Glob;
Array1Dim  Array1Glob;
Array2Dim  Array2Glob;
RecordPtr  PtrGlb;
RecordPtr PtrGlbNext;

void   Proc0()
   { 
   OneToFifty  IntLoc1;
   REG OneToFifty  IntLoc2;
   OneToFifty  IntLoc3;
   
   REG char  CharIndex;
   Enumeration   EnumLoc;
   String30  String1Loc;
   String30  String2Loc;
   register unsigned int i;
   dprintf("Proc0\n"); 
   PtrGlbNext =(RecordPtr) &x1; 
   PtrGlb =(RecordPtr) &x2; 
   PtrGlb->PtrComp =PtrGlbNext; 
   PtrGlb->Discr =Ident1; 
   PtrGlb->EnumComp =Ident3; 
   PtrGlb->IntComp =40; 
   strcpy(PtrGlb->StringComp, "DHRYSTONE PROGRAM, SOME STRING"); 
   #ifndef  GOOF
   
      strcpy(String1Loc, "DHRYSTONE PROGRAM, 1'ST STRING"); 
      
   #endif 
   Array2Glob[8][7] =10; 
   
   for (i = 0; i < LOOPS; ++i) { 
      Proc5(); 
      Proc4(); 
      IntLoc1 =2; 
      IntLoc2 =3; 
      strcpy(String2Loc, "DHRYSTONE PROGRAM, 2'ND STRING"); 
      EnumLoc =Ident2; 
      BoolGlob =! Func2(String1Loc, String2Loc); 
      while (IntLoc1 < IntLoc2) { 
         IntLoc3 =5 * IntLoc1 - IntLoc2; 
         Proc7(IntLoc1, IntLoc2, &IntLoc3); 
         ++IntLoc1; 
      } 
      Proc8(Array1Glob, Array2Glob, IntLoc1, IntLoc3); 
      Proc1(PtrGlb); 
      for (CharIndex = 'A'; CharIndex <= Char2Glob; ++CharIndex) if 
         (EnumLoc == Func1(CharIndex, 'C')) 
         
            Proc6(Ident1, &EnumLoc); 
         
      IntLoc3 =IntLoc2 * IntLoc1; 
      IntLoc2 =IntLoc3 / IntLoc1; 
      IntLoc2 =7 * (IntLoc3 - IntLoc2) - IntLoc1; 
      Proc2(&IntLoc1); 
   } 
   printf("Dhrystone done\n"); 
} 
void   Proc1(PtrParIn)REG RecordPtr PtrParIn;
   { 
   #define NextRecord  (*(PtrParIn->PtrComp))
   dprintf("Proc1\n"); 
   structassign(NextRecord, *PtrGlb); 
   PtrParIn->IntComp =5; 
   NextRecord.IntComp =PtrParIn->IntComp; 
   NextRecord.PtrComp =PtrParIn->PtrComp; 
   Proc3(&NextRecord.PtrComp);
   if (NextRecord.Discr == Ident1) 
   { 
      NextRecord.IntComp =6; 
      Proc6(PtrParIn->EnumComp, &NextRecord.EnumComp); 
      NextRecord.PtrComp =PtrGlb->PtrComp; 
      Proc7(NextRecord.IntComp, 10, &NextRecord.IntComp); 
      } 
   else 
      structassign(*PtrParIn, NextRecord); 
   
   #undef NextRecord
} 
void   Proc2(IntParIO)OneToFifty  *IntParIO;
   { 
   REG OneToFifty  IntLoc;
   REG Enumeration EnumLoc;
   dprintf("Proc2\n"); 
   IntLoc =*IntParIO + 10; 
   for(;;) { 
      if (Char1Glob == 'A') 
      { 
         --IntLoc; 
         *IntParIO =IntLoc - IntGlob; 
         EnumLoc =Ident1; 
      
      } 
      if (EnumLoc == Ident1) 
      
         break; 
         
      
   } 
} 
void   Proc3( RecordPtr*PtrParOut )
   { 
   dprintf("Proc3\n"); 
   if (PtrGlb != NULL) 
   
      *PtrParOut =PtrGlb->PtrComp; 
   else 
      IntGlob =100; 
   
   Proc7(10, IntGlob, &PtrGlb->IntComp); 
} 
void   Proc4()
   { 
   REG boolean BoolLoc;
   dprintf("Proc4\n"); 
   BoolLoc =Char1Glob =='A'; 
   BoolLoc |=BoolGlob; 
   Char2Glob ='B'; 
} 
void   Proc5()
   { 
   dprintf("Proc5\n"); 
   Char1Glob ='A'; 
   BoolGlob =FALSE; 
} 
void   Proc6(REG Enumeration EnumParIn , REG Enumeration *EnumParOut )
   { 
   dprintf("Proc6\n"); 
   *EnumParOut =EnumParIn; 
   if (! Func3(EnumParIn) ) 
   
      *EnumParOut =Ident4; 
   
   switch (EnumParIn) { 
   case Ident1: 
      *EnumParOut =Ident1; 
      break; 
      
   case Ident2: 
      if (IntGlob > 100) 
      
         *EnumParOut =Ident1; 
      else 
         *EnumParOut =Ident4; 
      
      break; 
      
   case Ident3: 
      *EnumParOut =Ident2; 
      break; 
      
   case Ident4: 
      break; 
      
   case Ident5: 
      *EnumParOut =Ident3; 
   } 
} 
void   Proc7(IntParI1, IntParI2, IntParOut)OneToFifty IntParI1; OneToFifty IntParI2; OneToFifty *IntParOut;
   { 
   REG OneToFifty IntLoc;
   dprintf("Proc7\n"); 
   IntLoc =IntParI1 + 2; 
   *IntParOut =IntParI2 + IntLoc; 
} 
void   Proc8(Array1Par, Array2Par, IntParI1, IntParI2)Array1Dim Array1Par; Array2Dim Array2Par; OneToFifty IntParI1; OneToFifty IntParI2;
   { 
   REG OneToFifty IntLoc;
   REG OneToFifty IntIndex;
   dprintf("Proc8\n"); 
   IntLoc =IntParI1 + 5; 
   Array1Par[IntLoc] =IntParI2; 
   Array1Par[IntLoc+1] =Array1Par[IntLoc]; 
   Array1Par[IntLoc+30] =IntLoc; 
   for (IntIndex = IntLoc; IntIndex <= (IntLoc+1); ++IntIndex) Array2Par[IntLoc][IntIndex] =IntLoc; 
   
   ++Array2Par[IntLoc][IntLoc-1]; 
   Array2Par[IntLoc+20][IntLoc] =Array1Par[IntLoc]; 
   IntGlob =5; 
} 
Enumeration Func1( CapitalLetter  CharPar1 , CapitalLetter CharPar2 )
   { 
   REG CapitalLetter  CharLoc1;
   REG CapitalLetter  CharLoc2;
   dprintf("Func1\n"); 
   CharLoc1 =CharPar1; 
   CharLoc2 =CharLoc1; 
   if (CharLoc2 != CharPar2) 
   
      return (Ident1); 
   
return (Ident2); 
} 
boolean Func2(String30 StrParI1, String30 StrParI2)
   { 
   REG OneToThirty  IntLoc;
   REG CapitalLetter  CharLoc;
   dprintf("Func2\n"); 
   IntLoc =1; 
   while (IntLoc <= 1) if 
      (Func1(StrParI1[IntLoc], StrParI2[IntLoc+1]) == Ident1) 
      { 
         CharLoc ='A'; 
         ++IntLoc; 
      
   } 
   if (CharLoc >= 'W' && CharLoc <= 'Z') 
   
      IntLoc =7; 
   
   if (CharLoc == 'X') 
   
      return(TRUE); 
      
   else 
      { 
      if (strcmp(StrParI1, StrParI2) > 0) 
      { 
         IntLoc +=7; 
         return (TRUE); 
         
         } 
      else 
         return (FALSE); 
         
      
   }
}
boolean Func3(REG Enumeration  EnumParIn )
   { 
   REG Enumeration EnumLoc;
   dprintf("Func3\n"); 
   EnumLoc =EnumParIn; 
   if (EnumLoc == Ident3)
   {
      return (TRUE);
   } 
   return (FALSE);
   }
   #ifdef NOSTRUCTASSIGN
   
   memcpy(d, s, l)
      register char *d;
      register char *s;
      register int l;
      {
      while (l--) *d++ = *s++;
      
      }
   #endif

void  strcpy(char *d, char *s)
   {
   while (*d++ = *s++)
   ;
}
int strcmp(char *d, char *s)
   {
   while (*d && *d == *s)
   d++, s++;
   return *d == *s; /* not correct but good enough for this pgm */
}

/* ----------------------------------------------------------------------------------------------*/

/*  Exported By Insecta Version 2.0 - October 1996 Beta 3*/
/*  Insecta File: dhry.ins*/
/*  Export  File: dhry.c*/
/*  Export  Date: 05:39:12 AM - 09:Aug:1997*/

