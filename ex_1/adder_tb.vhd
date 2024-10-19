library ieee ;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_tb is
end entity adder_tb;

--- 4-Bit Adder test

architecture test_adder_4 of adder_tb is
	constant tb_BITWIDTH  : natural := 4;
	signal tb_operand_a_i : std_ulogic_vector(tb_BITWIDTH-1 downto 0);
	signal tb_operand_b_i : std_ulogic_vector(tb_BITWIDTH-1 downto 0);
	signal tb_result_o    : std_ulogic_vector(tb_BITWIDTH downto 0);
	
begin
	dut : entity work.adder(behav)
		generic map (
			BITWIDTH => tb_BITWIDTH
		)
		port map (
			operand_a_i => tb_operand_a_i,
			operand_b_i => tb_operand_b_i,
			result_o => tb_result_o
		);
	
	stimuli : process is
	begin
	
	tb_operand_a_i <= std_ulogic_vector(to_unsigned(3,tb_BITWIDTH));
	tb_operand_b_i <= std_ulogic_vector(to_unsigned(4,tb_BITWIDTH));
	wait for 20 ns;
	
	tb_operand_a_i <= std_ulogic_vector(to_unsigned(4,tb_BITWIDTH));
	tb_operand_b_i <= std_ulogic_vector(to_unsigned(10,tb_BITWIDTH));
	wait for 20 ns;
	
	tb_operand_a_i <= std_ulogic_vector(to_unsigned(15,tb_BITWIDTH));
	tb_operand_b_i <= std_ulogic_vector(to_unsigned(15,tb_BITWIDTH));
	wait for 20 ns;
	
	tb_operand_a_i <= std_ulogic_vector(to_unsigned(14,tb_BITWIDTH));
	tb_operand_b_i <= std_ulogic_vector(to_unsigned(2,tb_BITWIDTH));
	wait for 20 ns;
	
	tb_operand_a_i <= std_ulogic_vector(to_unsigned(1,tb_BITWIDTH));
	tb_operand_b_i <= std_ulogic_vector(to_unsigned(1,tb_BITWIDTH));
	wait for 20 ns;
	
	end process stimuli;
	
end architecture test_adder_4;


architecture test_adder_12 of adder_tb is
	constant tb_BITWIDTH  : natural := 12;
	signal tb_operand_a_i : std_ulogic_vector(tb_BITWIDTH-1 downto 0);
	signal tb_operand_b_i : std_ulogic_vector(tb_BITWIDTH-1 downto 0);
	signal tb_result_o    : std_ulogic_vector(tb_BITWIDTH downto 0);
	
begin
	dut : entity work.adder(behav)
		generic map (
			BITWIDTH => tb_BITWIDTH
		)
		port map ( 
			operand_a_i => tb_operand_a_i,
			operand_b_i => tb_operand_b_i,
			result_o => tb_result_o
		);
	
	stimuli : process is
	begin
	
	tb_operand_a_i <= std_ulogic_vector(to_unsigned(2090,tb_BITWIDTH));
	tb_operand_b_i <= std_ulogic_vector(to_unsigned(3294,tb_BITWIDTH));
	wait for 20 ns;
	
	tb_operand_a_i <= std_ulogic_vector(to_unsigned(532,tb_BITWIDTH));
	tb_operand_b_i <= std_ulogic_vector(to_unsigned(2090,tb_BITWIDTH));
	wait for 20 ns;
	
	tb_operand_a_i <= std_ulogic_vector(to_unsigned(488,tb_BITWIDTH));
	tb_operand_b_i <= std_ulogic_vector(to_unsigned(535,tb_BITWIDTH));
	wait for 20 ns;
	
	tb_operand_a_i <= std_ulogic_vector(to_unsigned(3276,tb_BITWIDTH));
	tb_operand_b_i <= std_ulogic_vector(to_unsigned(644,tb_BITWIDTH));
	wait for 20 ns;
	
	tb_operand_a_i <= std_ulogic_vector(to_unsigned(4095,tb_BITWIDTH));
	tb_operand_b_i <= std_ulogic_vector(to_unsigned(4095,tb_BITWIDTH));
	wait for 20 ns;
	
	end process stimuli;
	
end architecture test_adder_12;