----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:12:54 09/11/2020 
-- Design Name: 
-- Module Name:    array_multiplier - Behavioral 
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

entity array_multiplier is
    Port ( A : in STD_LOGIC_Vector(3 downto 0);
           B : in STD_LOGIC_Vector(3 downto 0);
           P : out STD_LOGIC_Vector(7 downto 0));
end array_multiplier;

architecture structure of array_multiplier is

	component ripple_adder is
		 Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
				  B : in  STD_LOGIC_VECTOR (3 downto 0);
				  cin : in  STD_LOGIC;
				  cout : out  STD_LOGIC;
				  S : out  STD_LOGIC_VECTOR (3 downto 0));
	end component ripple_adder;
	
	component and_gate
		Port (A : in STD_LOGIC;
				B : in STD_LOGIC;
				C : out STD_LOGIC
	 );
	end component;
	
	signal and_out_vec : STD_LOGIC_Vector(15 downto 0);
	signal carry_vec: STD_LOGIC_VECTOR(1 downto 0);
	signal sum_1_vec, sum_2_vec : STD_LOGIC_VECTOR(3 downto 0);
	
begin


						-----------------  AND GATES  -----------------
						
						
and_gate_instance0: and_gate port map ( A => A(0), B => B(0), C => and_out_vec(0));
and_gate_instance1: and_gate port map ( A => A(0), B => B(1), C => and_out_vec(1));
and_gate_instance2: and_gate port map ( A => A(0), B => B(2), C => and_out_vec(2));
and_gate_instance3: and_gate port map ( A => A(0), B => B(3), C => and_out_vec(3));
and_gate_instance4: and_gate port map ( A => A(1), B => B(0), C => and_out_vec(4));
and_gate_instance5: and_gate port map ( A => A(1), B => B(1), C => and_out_vec(5));
and_gate_instance6: and_gate port map ( A => A(1), B => B(2), C => and_out_vec(6));
and_gate_instance7: and_gate port map ( A => A(1), B => B(3), C => and_out_vec(7));
and_gate_instance8: and_gate port map ( A => A(2), B => B(0), C => and_out_vec(8));
and_gate_instance9: and_gate port map ( A => A(2), B => B(1), C => and_out_vec(9));
and_gate_instance10: and_gate port map ( A => A(2), B => B(2), C => and_out_vec(10));
and_gate_instance11: and_gate port map ( A => A(2), B => B(3), C => and_out_vec(11));
and_gate_instance12: and_gate port map ( A => A(3), B => B(0), C => and_out_vec(12));
and_gate_instance13: and_gate port map ( A => A(3), B => B(1), C => and_out_vec(13));
and_gate_instance14: and_gate port map ( A => A(3), B => B(2), C => and_out_vec(14));
and_gate_instance15: and_gate port map ( A => A(3), B => B(3), C => and_out_vec(15));


P(0) <= and_out_vec(0);
	
						-----------------  4 BIT ADDERS  -----------------

ripple_adder_instance0: ripple_adder port map ( A => and_out_vec(7) & and_out_vec(6) & and_out_vec(5) & and_out_vec(4) , B => '0' & and_out_vec(3) & and_out_vec(2) & and_out_vec(1), cin => '0', S => sum_1_vec , cout => carry_vec(0) );
P(1) <= sum_1_vec(0);

ripple_adder_instance1: ripple_adder port map ( A => carry_vec(0) & sum_1_vec(3) & sum_1_vec(2) & sum_1_vec(1) , B => and_out_vec(11) & and_out_vec(10) & and_out_vec(9) & and_out_vec(8), cin =>'0' , S => sum_2_vec, cout => carry_vec(1) );
P(2) <= sum_2_vec(0);

ripple_adder_instance2: ripple_adder port map ( A => carry_vec(1) & sum_2_vec(3) & sum_2_vec(2) & sum_2_vec(1), B => and_out_vec(15) & and_out_vec(14) & and_out_vec(13) & and_out_vec(12), cin => '0', S => P(6 downto 3), cout => P(7));


end structure;

