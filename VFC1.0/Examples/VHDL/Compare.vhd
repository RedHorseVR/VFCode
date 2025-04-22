-- Module  Compare.vhd -- --   FILE:Compare.vhd ..

 --   Use the file "Testcomp.ins" to test this -- FILE:   Testcomp.ins..  ------------..
 --  -----------------------------------------..   8-bit comparator..   This example i..
 --  s a simple combinational circuit..   described using the dataflow level of abstra..
 --  ction...   Three architectures are provided for this 8-bit..   comparator, repres..
 --  enting an equality comparator,..   a 'less than' magnitude comparator, and a 'gre..
 --  ater..   than' magnitude comparator. The test bench for..   this example demonstr..
 --  ates how these three alternative..   architectures can be selected and used...   ..
 --  This module is synthesizable: to synthesize a..   comparator, you must select one..
 --   of the three..   architectures as the top-level architecture, then..   invoke sy..
 --  nthesis...   A test bench has been provided (in testcomp.vhd)..   that verifies t..
 --  he operation of the circuit. To use..   the test bench with this circuit, you mus..
 --  t compile..   this source file (compare.vhd) into the library..   'work' (the def..
 --  ault library)...   Copyright 1995, Accolade Design Automation, Inc...  Library   ..
library ieee;  --  Load the ieee 1164 library.. ..
use ieee.std_logic_1164.all;  --  --  Make the ieee package 'visible'..  ..
entity compare is  --  --  Define the top-level interface (ports) for the circuit.....  ..
   port( A, B: in std_ulogic_vector(0 to 7); EQ: out std_ulogic );  
end compare;  
architecture equality of compare is  --   contents --  Now define the contents of the entity..... ..
   begin  
   EQ <= '1' when --  EQ <= '0' when..
    
      (A = B)  --   --  Concurrent assignment..  ..
   else  
      '0'; --   '1';..
    
end equality;  
architecture less_than of compare is  
   begin  
   EQ <= '1' when  
    
      (A < B)  --   --  Concurrent assignment.. ..
   else  
      '0';  
    
end less_than;  
architecture greater_than of compare is  
   begin  
   EQ <= '1' when  
    
      (A > B)  --   --  Concurrent assignment..  ..
   else  
      '0';  
    
end greater_than;  


-- ----------------------------------------------------------------------------------------------..

--  Exported By Insecta Version 2.0 - October 1996 Beta 3..
--  Insecta File: Compare.ins..
--  Export  File: Compare.vhd..
--  Export  Date: 01:45:46 AM - 12:May:1997..

