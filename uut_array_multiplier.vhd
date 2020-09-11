--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:48:41 09/11/2020
-- Design Name:   
-- Module Name:   E:/Education/CA/Lab/LAB_5/Code/uut_array_multiplier.vhd
-- Project Name:  LAB_5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: array_multiplier
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use std.env.finish;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY uut_array_multiplier IS
END uut_array_multiplier;
 
ARCHITECTURE behavior OF uut_array_multiplier IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT array_multiplier
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         P : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal P : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: array_multiplier PORT MAP (
          A => A,
          B => B,
          P => P
        );



   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		A <= "1001";
		B <= "1010";
		wait for 20 ns;
		
		A <= "0111";
		B <= "1010";
		wait for 20 ns;
		
		A <= "1001";
		B <= "1011";
		wait for 20 ns;
		
		A <= "1101";
		B <= "0011";
		wait for 20 ns;
		
		
		A <= "1001";
		B <= "1111";
		wait for 20 ns;
		
		A <= "1111";
		B <= "1111";
		wait for 20 ns;

      finish;
   end process;

END;
