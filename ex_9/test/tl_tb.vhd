library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

library work;
use work.std_definitions.all;

-- entity

entity tl_tb is
end tl_tb;

architecture behav of tl_tb is

	constant T_CLK : time := 20 ns; --50MHz
	signal clk_tb  : std_ulogic := '0';
	signal rst_tb  : std_ulogic := '0';

	signal x_comp_tb : std_ulogic := '0';
	signal y_comp_tb : std_ulogic := '0';

	signal x_adc_pwm_tb : std_ulogic;
	signal y_adc_pwm_tb : std_ulogic;
	signal x_servo_pwm_tb : std_ulogic;
	signal y_servo_pwm_tb : std_ulogic;

	signal sw_axis_tb : std_ulogic := '0';
	signal sw_mode_tb : std_ulogic := '0';
	signal btn_inc_tb : std_ulogic := '0';
	signal btn_dec_tb : std_ulogic := '0';

	type seg is array (integer range <>) of std_ulogic_vector(0 to 6);
	signal x_seg_tb : seg(0 to 2);
	signal y_seg_tb : seg(0 to 2);

begin

	tl_dut : entity work.tl(behav)
		port map (
			clk_i => clk_tb,
			rst_i => rst_tb,
			
			sw_axis_i => sw_axis_tb,
			sw_mode_i => sw_mode_tb,
			btn_inc_i => btn_inc_tb,
			btn_dec_i => btn_dec_tb,

			x_comp_i => x_comp_tb,
			y_comp_i => y_comp_tb,

			x_adc_pwm_o   => x_adc_pwm_tb,
			y_adc_pwm_o   => y_adc_pwm_tb,
			x_servo_pwm_o => x_servo_pwm_tb,
			y_servo_pwm_o => y_servo_pwm_tb
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
		wait for 5 ms;

		sw_axis_tb <= '0'; -- x axis
		sw_mode_tb <= '0'; -- step size 1

		btn_inc_tb <= '1';
		wait for T_CLK*5;
		btn_inc_tb <= '0';
		wait for T_CLK*5;
		btn_inc_tb <= '1';
		wait for T_CLK*5;
		btn_inc_tb <= '0';

		sw_mode_tb <= '1'; -- step size 10

		btn_dec_tb <= '1';
		wait for T_CLK*5;
		btn_dec_tb <= '0';
		wait for T_CLK*5;
		btn_dec_tb <= '1';
		wait for T_CLK*5;
		btn_dec_tb <= '0';

		wait for 10 ms;

		sw_axis_tb <= '1'; -- y axis
		sw_mode_tb <= '0'; -- step size 1

		btn_inc_tb <= '1';
		wait for T_CLK*5;
		btn_inc_tb <= '0';
		wait for T_CLK*5;
		btn_inc_tb <= '1';
		wait for T_CLK*5;
		btn_inc_tb <= '0';

		sw_mode_tb <= '1'; -- step size 10

		btn_dec_tb <= '1';
		wait for T_CLK*5;
		btn_dec_tb <= '0';
		wait for T_CLK*5;
		btn_dec_tb <= '1';
		wait for T_CLK*5;
		btn_dec_tb <= '0';


		wait for 50 ms;
	end process;

end architecture behav;