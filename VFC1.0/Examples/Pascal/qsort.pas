unit qsort; 
   interface
   
   implementation
      const max = 100;
      type list = array[1..max] of integer; 
      var data: list; 
      i: integer; 
   
   procedure quicksort(var a: list; Lo,Hi: integer); 
      
      
      procedure sort(l,r: integer); 
         
         var 
            i,j,x,y: integer; 
         
         begin 
         
            i:=l; 
            j:=r; 
            x:=a[(l+r) DIV 2]; 
            repeat
               while a[i]<x do
               i:=i+1; 
               while x<a[j] do 
               j:=j-1; 
               if i<=j then
               begin
                  y:=a[i]; a[i]:=a[j]; a[j]:=y;
                  i:=i+1; j:=j-1;
               end;
            until i>j;
            if l<j 
            then 
               sort(l,j); 
            
            if i<r 
            then 
               sort(i,r); 
            
         end;
      begin {quicksort};
         sort(Lo,Hi);
         end;
         
      
   
   begin {qsort}
      writeln;
      writeln;
      Write('Now generating some random numbers...');
      writeln;
      Randomize;
      for i:=1 to max do begin
         data[i]:=Random(30000);
         Write(data[i]:8);
      end;
      writeln;
      writeln;
      Write('Now sorting random numbers...');
      writeln;
      quicksort(data,1,max);
      for i:=1 to max do
         Write(data[i]:8);
      
      end.
      
   

{ ----------------------------------------------------------------------------------------------}

{  Exported By Insecta Version 2.0 - October 1996 Beta 3}
{  Insecta File: QSORT.ins}
{  Export  File: QSORT.PAS}
{  Export  Date: 09:51:24 PM - 10:Aug:1997}

