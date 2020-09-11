--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:41:47 08/21/2020
-- Design Name:   
-- Module Name:   C:/VHDL_Projects/LAB_1/full_adder_testbench.vhd
-- Project Name:  LAB_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: full_adder
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY full_adder_testbench IS
END full_adder_testbench;
 
ARCHITECTURE behavior OF full_adder_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT full_adder
    PORT(
         i0 : IN  std_logic;
         i1 : IN  std_logic;
         cin : IN  std_logic;
         s : OUT  std_logic;
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal i0 : std_logic := '0';
   signal i1 : std_logic := '0';
   signal cin : std_logic := '0';

 	--Outputs
   signal s : std_logic;
   signal cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: full_adder PORT MAP (
          i0 => i0,
          i1 => i1,
          cin => cin,
          s => s,
          cout => cout
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      
		-- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		
		i0 <= '0';
		i1 <= '0';
		cin <= '0';
		
		wait for 20 ns;
		
		i0 <= '1';
		i1 <= '0';
		cin <= '0';
		
		wait for 20 ns;
		
		i0 <= '0';
		i1 <= '1';
		cin <= '0';
		
		wait for 20 ns;
		
		i0 <= '1';
		i1 <= '1';
		cin <= '0';
		
		wait for 20 ns;
		
		i0 <= '0';
		i1 <= '0';
		cin <= '1';
		
		wait for 20 ns;
		
		i0 <= '1';
		i1 <= '0';
		cin <= '1';
		
		wait for 20 ns;
		
		i0 <= '0';
		i1 <= '1';
		cin <= '1';
		
		wait for 20 ns;
		
		i0 <= '1';
		i1 <= '1';
		cin <= '1';
		
		wait for 20 ns;
      
		
		wait;
   end process;

END;
