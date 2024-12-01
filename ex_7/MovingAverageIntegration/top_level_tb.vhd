library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use ieee.math_real.all;

library work;
use work.servo_pkg.all;

-- entity

entity top_level_tb is
end top_level_tb;

architecture behav of top_level_tb is

	constant T_CLK : time := 20 ns; --50MHz
	signal clk_tb : std_ulogic := '0';
	signal rst_tb : std_ulogic := '0';

	signal x_comp_tb : std_ulogic := '0';
	signal y_comp_tb : std_ulogic := '0';

	signal x_adc_pwm_tb : std_ulogic;
	signal y_adc_pwm_tb : std_ulogic;

	signal x_servo_pwm_tb : std_ulogic;
	signal y_servo_pwm_tb : std_ulogic;

	type seg is array (integer range <>) of std_ulogic_vector(0 to 6);

	signal x_seg_tb : seg(0 to 2);
	signal y_seg_tb : seg(0 to 2);


begin

	top_level_dut : entity work.top_level(behav)
		port map (
			clk_i => clk_tb,
			rst_i => rst_tb,
			x_comp => x_comp_tb,
			y_comp => y_comp_tb,
			x_servo_pwm_o => x_servo_pwm_tb,
			y_servo_pwm_o => y_servo_pwm_tb,
			x_adc_pwm_o => x_adc_pwm_tb,
			y_adc_pwm_o => x_adc_pwm_tb,
			x_seg_ones_o => x_seg_o(0),
			x_seg_tens_o => x_seg_o(1),
			x_seg_hundreds_o => x_seg_o(2),
			y_seg_ones_o => y_seg_o(0),
			y_seg_tens_o => y_seg_o(1),
			y_seg_hundreds_o => y_seg_o(2)
		);

	clk_proc : process is
	begin
		wait for T_CLK/2;
		clk_tb <= not clk_tb;
	end process;

	stimulus : process is
	begin
		wait for T_CLK*10;
		rst_tb <= '1';
		wait for T_CLK*10;
		rst_tb <= '0';
		wait;
		
	end process;


end architecture behav;