entity combinatorial_tb is
end entity combinatorial_tb;

architecture test_combinatorial of combinatorial_tb is
	signal tb_operand_a_i, tb_operand_b_i, tb_and_o, tb_or_o : bit;
	
begin
	dut : entity work.combinatorial(behav)
		port map ( tb_operand_a_i, tb_operand_b_i, tb_and_o, tb_or_o );
		
	stimuli : process is
	begin
		tb_operand_a_i <= '0'; tb_operand_b_i <= '0'; wait for 20 ns;
		tb_operand_a_i <= '1'; tb_operand_b_i <= '0'; wait for 20 ns;
		tb_operand_a_i <= '0'; tb_operand_b_i <= '1'; wait for 20 ns;
		tb_operand_a_i <= '1'; tb_operand_b_i <= '1'; wait for 20 ns;
	end process stimuli;

end architecture test_combinatorial;