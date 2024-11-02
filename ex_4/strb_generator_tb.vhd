library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity strb_generator_tb is
end entity strb_generator_tb;

architecture behav of strb_generator_tb is

	constant tb_PRESCALER : natural := 10;
	constant t_clk : time := 10 ns;

	signal tb_clk : std_ulogic := '0';
	signal tb_rst : std_ulogic := '0';
	signal tb_strb : std_ulogic := '0'; 	

begin

	strb_dut : entity work.strb_generator(behav)
		generic map (
			PRESCALER => tb_PRESCALER
		)
		port map (
			clk_i => tb_clk,
			rst_i => tb_rst,
			strb_o => tb_strb
		);

	clk_proc : process is
	begin
		wait for t_clk/2;
		tb_clk <= not tb_clk;
	end process clk_proc;

	stimulus : process is
	begin
		tb_rst <= '1';
		wait for 20 ns;
		tb_rst <= '0';
		wait for 20 ns;

		wait for 2000 ns;
	end process stimulus;

end behav;