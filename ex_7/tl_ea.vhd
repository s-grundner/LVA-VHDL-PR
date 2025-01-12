library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use ieee.math_real.all;

library work;
use work.std_definitions.all;

-- entity

entity tl is
	port (
		clk_i : in std_ulogic;
		rst_i : in std_ulogic;

		x_comp : in std_ulogic;
		y_comp : in std_ulogic;

		x_servo_pwm_o : out std_ulogic;
		y_servo_pwm_o : out std_ulogic;
		
		x_adc_pwm_o : out std_ulogic;
		y_adc_pwm_o : out std_ulogic;

		x_seg_ones_o     : out std_ulogic_vector (0 to 6);
		x_seg_tens_o     : out std_ulogic_vector (0 to 6);
		x_seg_hundreds_o : out std_ulogic_vector (0 to 6);

		y_seg_ones_o     : out std_ulogic_vector (0 to 6);
		y_seg_tens_o     : out std_ulogic_vector (0 to 6);
		y_seg_hundreds_o : out std_ulogic_vector (0 to 6)
	);
end tl;

architecture behav of tl is

begin

	tilt_x : entity work.tilt_axis(behav)
		port map (
			clk_i            => clk_i,
			rst_i            => rst_i,
			axis_comp_i      => x_comp,
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
			axis_comp_i      => y_comp,
			axis_servo_pwm_o => y_servo_pwm_o,
			axis_adc_pwm_o   => y_adc_pwm_o,
			seg_ones_o       => y_seg_ones_o,
			seg_tens_o       => y_seg_tens_o,
			seg_hundreds_o   => y_seg_hundreds_o
		);

end architecture behav;