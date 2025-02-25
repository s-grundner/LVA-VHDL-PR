--------------------------------------------------------------------------------
-- file: combinatorial_a.vhd
-- type: Architecture
-- author: Simon Grundner (k12136610)
-- brief: Module implementation of combinatorial circuit of task 1
--------------------------------------------------------------------------------

architecture rtl of combinatorial is
begin
	
	and_comb : process(operand_a_i, operand_b_i) is
	begin
		and_o <= operand_a_i and operand_b_i;
	end process and_comb;
	
	or_comb : process(operand_a_i, operand_b_i) is
	begin
		or_o <= operand_a_i or operand_b_i;
	end process or_comb;
	
end architecture rtl;