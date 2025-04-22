-- F:\US&R\INSECT~2\VHDLTE~1\TESTCOMP.VHD --   --   FILE:F:\US&R\INSECT~2\VHDLTE~1\TESTCOMP.VHD ..

 --   -----------------------------------------------------..   Test bench for 8-bit c..
 --  omparator..   This test bench verifies the operation of the..   comparator. There..
 --   are three alternate architectures..   provided in the comparator source file (co..
 --  mpare.vhd),..   so this test bench will make use of configuration..   specificati..
 --  ons to create three unique instances of the..   lower-level entity, each represen..
 --  ting one of the..   three types of comparators...   Copyright 1995, Accolade Desi..
library ieee;  --  gn Automation, Inc...   Load the ieee 1164 library.. ..
use ieee.std_logic_1164.all;  --  --  Make the package 'visible'..  ..
use work.compare;  --  --  Make the contents of 'work' available..  ..
entity testcomp is  --    The top level entity of the test bench has no ports..... ..
end testcomp;  
architecture stimulus of testcomp is  
   component compare  --    First, declare the lower-level entity (compare)..... ..
   port (a,b: in std_ulogic_vector(0 to 7);  
   EQ: out std_ulogic);  
end component;  
signal a,b: std_ulogic_vector(0 to 7);  --    Next, declare some local signals to assign values to..... ..
signal EQ,LT,GT: std_ulogic;  
for COMP1: compare use entity work.compare(equality);  --    Now, create the three unique configurations..... ..
for COMP2: compare use entity work.compare(less_than);  
for COMP3: compare use entity work.compare(greater_than);  
begin  
COMP1: compare port map(A,B,EQ);  --    Create the three instances of the comparator circuit..... ..
COMP2: compare port map(A,B,LT);  
COMP3: compare port map(A,B,GT);  
process  --    Now run a process to apply some stimulus over time..... ..
   constant PERIOD: time := 40 ns;  
   begin  
   A <= "00001111";  --   ... 0F.. ..
   B <= "11110000";  --   ... F0.. ..
   wait for PERIOD;  
   A <= "11111111";  --   ... FF.. ..
   B <= "11111111";  --   ... FF.. ..
   wait for PERIOD;  
   A <= "10101010";  --   ... AA.. ..
   B <= "01010101";  --   ... 55.. ..
   wait for PERIOD;  
   A <= "10101010";  --   ... AA.. ..
   B <= "10101010";  --   ... AA.. ..
   wait for PERIOD;  
   A <= "11111010";  --   ... FA.. ..
   B <= "01011111";  --   ... 5F.. ..
   wait for PERIOD;  
   A <= "00000000";  --   ... 00.. ..
   B <= "00000000";  --   ... 00.. ..
   wait for PERIOD;  
   wait;  
end process;  
end stimulus;  
 --   --------------------------------------------------------------------------------..
 --  --------------..   Exported By Insecta Version 2.0 - October 1996 Beta 3..   Inse..
 --  cta File: Test Compare.ins..   Export  File: Testcomp.vhd..   Export  Date: 01:30..


-- ----------------------------------------------------------------------------------------------..

--  Exported By Insecta Version 2.0 - October 1996 Beta 3..
--  Insecta File: Testcomp.ins..
--  Export  File: TESTCOMP.VHD..
--  Export  Date: 01:46:17 AM - 12:May:1997..

