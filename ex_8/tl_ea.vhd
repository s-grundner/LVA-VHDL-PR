library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

library work;
use work.std_definitions.all;

entity tl is
	port (
		clk_i : in std_ulogic;
		rst_i : in std_ulogic;

		x_servo_pwm_o : out std_ulogic;
		y_servo_pwm_o : out std_ulogic;
		z_servo_pwm_o : out std_ulogic;

		start_strb_i : in std_ulogic;
		drawing_o : out std_ulogic
	);
end tl;

architecture behav of tl is

signal x_servo : unsigned(SERVO_RESOLUTION-1 downto 0);
signal y_servo : unsigned(SERVO_RESOLUTION-1 downto 0);
signal z_servo : unsigned(SERVO_RESOLUTION-1 downto 0); 

begin

	cmd_proc_ent : entity work.cmd_proc(behav)
	generic map (
		D => 4
	)
	port map (
		clk_i => clk_i,
		rst_i => rst_i,
		start_strb_i => start_strb_i,
		drawing_o => drawing_o,
		x_servo_o => x_servo,
		y_servo_o => y_servo,
		z_servo_o => z_servo
	);

	servo_x_ent : entity work.servo(behav)
	port map (
		clk_i => clk_i,
		rst_i => rst_i,
		encoded_angle_i => x_servo,
		pwm_o => x_servo_pwm_o
	);

	servo_y_ent : entity work.servo(behav)
	port map (
		clk_i => clk_i,
		rst_i => rst_i,
		encoded_angle_i => y_servo,
		pwm_o => y_servo_pwm_o
	);

	servo_z_ent : entity work.servo(behav)
	port map (
		clk_i => clk_i,
		rst_i => rst_i,
		encoded_angle_i => z_servo,
		pwm_o => z_servo_pwm_o
	);

end architecture behav;