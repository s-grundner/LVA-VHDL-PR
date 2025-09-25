architecture behav of combinatorial is
begin
	AND_P : process(operand_a_i, operand_b_i) is
	begin
		and_o <= operand_a_i and operand_b_i;
	end process AND_P;
	
	OR_P : process(operand_a_i, operand_b_i) is
	begin
		or_o <= operand_a_i or operand_b_i;
	end process OR_P;
	
end architecture behav;