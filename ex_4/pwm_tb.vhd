library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity pwm_tb is
end entity pwm_tb;

architecture behav of pwm_tb is

	constant t_clk : time := 10 ns;
	constant tb_COUNTER_LEN : natural := 4;

	signal tb_clk 					: std_ulogic := '0';
	signal tb_rst 					: std_ulogic := '0';
	signal tb_Period_counter_val 	: unsigned(tb_COUNTER_LEN-1 downto 0) := (others => '0');
	signal tb_ON_counter_val 		: unsigned(tb_COUNTER_LEN-1 downto 0) := (others => '0');
	signal tb_PWM_pin 				: std_ulogic := '0';

begin

	pwm_dut : entity work.pwm(behav)
	generic map (
		COUNTER_LEN => tb_COUNTER_LEN
	)
	port map (
		clk_i 				 => tb_clk,
		rst_i 				 => tb_rst,
		Period_counter_val_i => tb_Period_counter_val,
		ON_counter_val_i 	 => tb_ON_counter_val,
		PWM_o 				 => tb_PWM_pin
	);

	clk : process is
	begin
		tb_clk <= not tb_clk;
		wait for t_clk / 2;
	end process;

	stimulus : process is
	begin
		
		tb_rst <= '1';
		wait for 20 ns;
		tb_rst <= '0';
		wait for 20 ns;

		-- Test case

		tb_Period_counter_val <= "1111";
		tb_ON_counter_val <= "1111";

		wait for 2000 ns;
	end process;

end behav;