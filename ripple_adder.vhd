----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:44:31 08/27/2020 
-- Design Name: 
-- Module Name:    ripple_adder - structure 
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

entity ripple_adder is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (3 downto 0));
end ripple_adder;

architecture structure of ripple_adder is

	component full_adder is
		Port ( i0 : in  STD_LOGIC;
				i1 : in  STD_LOGIC;
				cin : in  STD_LOGIC;
				s : out  STD_LOGIC;
				cout : out  STD_LOGIC);
	end component full_adder;
	
	signal cin_1 , cin_2 , cin_3 : STD_LOGIC;

begin

	 full_adder_instance0:full_adder port map ( i0 => A(0), i1 => B(0), cin => cin ,cout => cin_1, s => S(0));
	 full_adder_instance1:full_adder port map ( i0 => A(1), i1 => B(1), cin => cin_1 ,cout => cin_2, s => S(1));
	 full_adder_instance2:full_adder port map ( i0 => A(2), i1 => B(2), cin => cin_2 ,cout => cin_3, s => S(2));
	 full_adder_instance3:full_adder port map ( i0 => A(3), i1 => B(3), cin => cin_3 ,cout => cout, s => S(3));

end structure;

