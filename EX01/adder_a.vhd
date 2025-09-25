--------------------------------------------------------------------------------
-- file: adder_a.vhd
-- type: Architecture
-- author: Simon Grundner (k12136610)
-- brief: Module implementation for the adder of task 2
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- ARCHITECTURE

architecture rtl of adder is
begin

	add_comb : process (operand_a_i, operand_b_i) is
	begin
		result_o <= std_ulogic_vector(resize(unsigned(operand_a_i), BITWIDTH + 1) + resize(unsigned(operand_b_i), BITWIDTH + 1));
	end process add_comb;

end architecture rtl;