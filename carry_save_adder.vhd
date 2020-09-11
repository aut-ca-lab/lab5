----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:01:19 09/11/2020 
-- Design Name: 
-- Module Name:    carry_save_adder_multiplier - structure 
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

entity carry_save_adder_multiplier is
    Port ( A : in STD_LOGIC_Vector(3 downto 0);
           B : in STD_LOGIC_Vector(3 downto 0);
           P : out STD_LOGIC_Vector(7 downto 0)
	 );	  
end carry_save_adder_multiplier;

architecture structure of carry_save_adder_multiplier is


	component full_adder is
		Port ( i0 : in  STD_LOGIC;
				 i1 : in  STD_LOGIC;
				 cin : in  STD_LOGIC;
				 s : out  STD_LOGIC;
				 cout : out  STD_LOGIC);
	end component full_adder;
		
		
	component half_adder is
      Port ( in1 : in  STD_LOGIC;
             in2 : in  STD_LOGIC;
             out1 : out  STD_LOGIC;
             out2 : out  STD_LOGIC);
	end component half_adder;
	
	
	component and_gate is
      Port ( A : in  STD_LOGIC;
             B : in  STD_LOGIC;
             C : out  STD_LOGIC);
	end component and_gate;
	
	signal and_out_vec : STD_LOGIC_Vector(15 downto 0);
	signal sum_wire_vec : STD_LOGIC_Vector(5 downto 0);
	signal carry_wire_vec : STD_LOGIC_Vector(10 downto 0);

begin

							-----------------  AND GATES  -----------------
						
						
and_gate_instance0: and_gate port map ( A => A(0), B => B(0), C => and_out_vec(0));
and_gate_instance1: and_gate port map ( A => A(0), B => B(1), C => and_out_vec(1));
and_gate_instance2: and_gate port map ( A => A(1), B => B(0), C => and_out_vec(2));
and_gate_instance3: and_gate port map ( A => A(0), B => B(2), C => and_out_vec(3));
and_gate_instance4: and_gate port map ( A => A(1), B => B(1), C => and_out_vec(4));
and_gate_instance5: and_gate port map ( A => A(0), B => B(3), C => and_out_vec(5));
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

						-----------------  LAYER ONE -----------------


half_adder_instance0: half_adder port map ( in1 => and_out_vec(1), in2 => and_out_vec(2), out1 => P(1) , out2 => carry_wire_vec(0) );
half_adder_instance1: half_adder port map ( in1 => and_out_vec(3), in2 => and_out_vec(4), out1 => sum_wire_vec(0) , out2 => carry_wire_vec(1) );
half_adder_instance2: half_adder port map ( in1 => and_out_vec(5), in2 => and_out_vec(6), out1 => sum_wire_vec(1) , out2 => carry_wire_vec(2) );


						-----------------  LAYER TWO -----------------


full_adder_instance0: full_adder port map ( i0 => and_out_vec(8), i1 => sum_wire_vec(0) , cin => carry_wire_vec(0) , s =>P(2) , cout => carry_wire_vec(3));						
full_adder_instance1: full_adder port map ( i0 => and_out_vec(9), i1 => sum_wire_vec(1) , cin => carry_wire_vec(1) , s =>sum_wire_vec(2) , cout => carry_wire_vec(4));						
full_adder_instance2: full_adder port map ( i0 => and_out_vec(10), i1 =>and_out_vec(7)  , cin => carry_wire_vec(2) , s =>sum_wire_vec(3) , cout => carry_wire_vec(5));						

						
						-----------------  LAYER THREE -----------------
						

full_adder_instance3: full_adder port map ( i0 => and_out_vec(12), i1 => sum_wire_vec(2) , cin => carry_wire_vec(3) , s =>P(3) , cout => carry_wire_vec(6));						
full_adder_instance4: full_adder port map ( i0 => and_out_vec(13), i1 => sum_wire_vec(3) , cin => carry_wire_vec(4) , s =>sum_wire_vec(4) , cout => carry_wire_vec(7));						
full_adder_instance5: full_adder port map ( i0 => and_out_vec(14), i1 => and_out_vec(11) , cin => carry_wire_vec(5) , s =>sum_wire_vec(5) , cout => carry_wire_vec(8));						

						
						-----------------  LAYER FOUR -----------------
						

half_adder_instance3: half_adder port map ( in1 => carry_wire_vec(6), in2 => sum_wire_vec(4), out1 => P(4) , out2 => carry_wire_vec(9) );
full_adder_instance6: full_adder port map ( i0 => carry_wire_vec(9), i1 =>sum_wire_vec(5), cin => carry_wire_vec(7) , s =>P(5) , cout => carry_wire_vec(10));						
full_adder_instance7: full_adder port map ( i0 => carry_wire_vec(10), i1 => and_out_vec(15) , cin => carry_wire_vec(8) , s =>P(6) , cout => P(7));						




end structure;

