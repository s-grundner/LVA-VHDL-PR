library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

library work;
use work.std_definitions.all;

-- entity

entity tl is
	port (
		clk_i : in std_ulogic;
		rst_i : in std_ulogic;
		
		sw_axis_i : in std_ulogic;
		sw_mode_i : in std_ulogic; 
		btn_inc_i : in std_ulogic;
		btn_dec_i : in std_ulogic;

		x_comp_i : in std_ulogic;
		y_comp_i : in std_ulogic;

		x_servo_pwm_o : out std_ulogic;
		x_adc_pwm_o   : out std_ulogic;
		y_servo_pwm_o : out std_ulogic;
		y_adc_pwm_o   : out std_ulogic;

		x_seg_ones_o     : out std_ulogic_vector (0 to 6);
		x_seg_tens_o     : out std_ulogic_vector (0 to 6);
		x_seg_hundreds_o : out std_ulogic_vector (0 to 6);
		y_seg_ones_o     : out std_ulogic_vector (0 to 6);
		y_seg_tens_o     : out std_ulogic_vector (0 to 6);
		y_seg_hundreds_o : out std_ulogic_vector (0 to 6)
	);
end tl;

architecture behav of tl is

	signal x_btn_inc, x_btn_dec: std_ulogic := '0';
	signal y_btn_inc, y_btn_dec: std_ulogic := '0';

begin

	x_btn_inc <= btn_inc_i when sw_axis_i = '0' else '0';
	x_btn_dec <= btn_dec_i when sw_axis_i = '0' else '0';
	y_btn_inc <= btn_inc_i when sw_axis_i = '1' else '0';
	y_btn_dec <= btn_dec_i when sw_axis_i = '1' else '0';

	tilt_x : entity work.tilt_axis(behav)
		port map (
			clk_i            => clk_i,
			rst_i            => rst_i,
			sw_mode_i        => sw_mode_i,
			btn_inc_i        => x_btn_inc,
			btn_dec_i        => x_btn_dec,
			axis_comp_i      => x_comp_i,
			axis_servo_pwm_o => x_servo_pwm_o,
			axis_adc_pwm_o   => x_adc_pwm_o,
			seg_ones_o       => x_seg_ones_o,
			seg_tens_o       => x_seg_tens_o,
			seg_hundreds_o   => x_seg_hundreds_o
		);

	tilt_y : entity work.tilt_axis(behav)
		port map (
			clk_i            => clk_i,
			rst_i            => rst_i,
			sw_mode_i        => sw_mode_i,
			btn_inc_i        => y_btn_inc,
			btn_dec_i        => y_btn_dec,
			axis_comp_i      => y_comp_i,
			axis_servo_pwm_o => y_servo_pwm_o,
			axis_adc_pwm_o   => y_adc_pwm_o,
			seg_ones_o       => y_seg_ones_o,
			seg_tens_o       => y_seg_tens_o,
			seg_hundreds_o   => y_seg_hundreds_o
		);

end architecture behav;