library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

library work;
use work.std_definitions.all;

entity tl_tb is
end tl_tb;

architecture behav of tl_tb is

	constant T_CLK : time := 20 ns; -- 50 MHz

	signal clk_tb : std_ulogic := '0';
	signal rst_tb : std_ulogic := '0';

	signal start_strb_tb : std_ulogic := '0';
	signal drawing_tb : std_ulogic := '0';

	signal x_servo_pwm_tb : std_ulogic;
	signal y_servo_pwm_tb : std_ulogic;
	signal z_servo_pwm_tb : std_ulogic;

begin

	tb_dut : entity work.tl
		port map (
			clk_i => clk_tb,
			rst_i => rst_tb,
			start_strb_i => start_strb_tb,
			drawing_o => drawing_tb,
			x_servo_pwm_o => x_servo_pwm_tb,
			y_servo_pwm_o => y_servo_pwm_tb,
			z_servo_pwm_o => z_servo_pwm_tb
		);

	clk_proc : process is
	begin
		wait for T_CLK/2;
		clk_tb <= not clk_tb;
	end process clk_proc;

	stimulus : process is
	begin
		rst_tb <= '1';
		wait for T_CLK*2;
		rst_tb <= '0';
		wait for T_CLK*10;

		start_strb_tb <= '1';
		wait for T_CLK;
		start_strb_tb <= '0';
		
		wait for 1350 ms;
	
	end process stimulus;

end architecture;