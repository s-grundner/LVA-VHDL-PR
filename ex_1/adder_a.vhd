library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

architecture behav of adder is
begin
	ADD_O : process( operand_a_i, operand_b_i ) is
	begin
		result_o <= std_ulogic_vector(resize(unsigned(operand_a_i), BITWIDTH + 1) + resize(unsigned(operand_b_i), BITWIDTH + 1));
	end process ADD_O;

end architecture behav;