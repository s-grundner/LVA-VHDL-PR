library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity pwm_tb is
end pwm_tb;

architecture behav of pwm_tb is
	
	constant t_clk : time := 20 ns;
	constant tb_COUNTER_LEN : natural := 4;

	signal tb_clk 					: std_ulogic := '0';
	signal tb_rst 					: std_ulogic := '0';
	signal tb_Period_counter_val 	: unsigned(tb_COUNTER_LEN-1 downto 0) := "0000";
	signal tb_ON_counter_val 		: unsigned(tb_COUNTER_LEN-1 downto 0) := "0000";
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
		PWM_pin_o 			 => tb_PWM_pin
	);

	clk_proc : process -- 50 MHz
	begin
		tb_clk <= '0';
		wait for t_clk / 2;
		tb_clk <= '1';
		wait for t_clk / 2;
	end process clk_proc;

	stimuli : process
	begin
		
		tb_rst <= '1';
		wait for 20 ns;
		tb_rst <= '0';
		wait for 20 ns;

		-- Test case 1

		tb_Period_counter_val <= "1111";
		tb_ON_counter_val <= "0111";

		wait for 2000 ns;

	end process stimuli;
end behav;