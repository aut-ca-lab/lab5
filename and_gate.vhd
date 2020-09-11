----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:21:20 08/21/2020 
-- Design Name: 
-- Module Name:    and_gate - gatelevel 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity and_gate is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : out  STD_LOGIC);
end and_gate;

architecture gatelevel of and_gate is

begin
	C <= A and B;
end gatelevel;

