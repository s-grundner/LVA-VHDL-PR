library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use ieee.math_real.all;


entity top_level_tb is
end top_level_tb ;

architecture behav of top_level_tb is

	constant T_CLK : time := 20 ns; --50MHz
	signal clk_tb : std_ulogic := '0';
	signal rst_tb : std_ulogic := '0';
	signal tb_comp : std_ulogic := '0';
	signal adc_val_tb : unsigned(7 downto 0) := (others => '0');

begin

	top_level_dut : entity work.tilt_tl(behav)
		port map (
			clk_i => clk_tb,
			rst_i => rst_tb,
			
			axis_comp_i => tb_comp,
			axis_servo_pwm_o => open,
			axis_adc_pwm_o => open,

			seg_ones_o => open,
			seg_tens_o => open,
			seg_hundreds_o => open,

			adc_value_test => adc_val_tb
		);
	
	clk_proc : process is
	begin
		wait for T_CLK/2;
		clk_tb <= not clk_tb;
	end process;

	stimulus : process is
	begin
		rst_tb <= '1';
		wait for T_CLK*5;
		rst_tb <= '0';
		wait for 40 ms;

	end process;

end architecture behav;