library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all; 

-- entity

entity servo_tb is
end servo_tb;

-- architecture

architecture behav of servo_tb is

	constant CLK_PERIOD : time := 20 ns; -- 50MHz
	constant PWM_PERIOD : time := 20 ms; -- 50 Hz

	constant PWM_MAX_COUNT : integer := integer(PWM_PERIOD / CLK_PERIOD); --1000000
	constant PWM_RESOLUTION : natural := natural(ceil(log2(real(PWM_MAX_COUNT-1)))); -- 20

	constant ANGLE_T_MIN  : time := 1 ms; -- 1 ms for 0 degree
	constant ANGLE_T_MAX  : time := 2 ms; -- 2 ms for 180 degree

	constant ANGLE_MIN_COUNT : integer := integer(ANGLE_T_MIN / CLK_PERIOD); -- 50000
	constant ANGLE_MAX_COUNT : integer := integer(ANGLE_T_MAX / CLK_PERIOD); -- 100000

	signal tb_clk : std_ulogic := '0';
	signal tb_rst : std_ulogic := '0';

	constant ANGLE_SIZE : integer := integer(ceil(log2(real(ANGLE_MAX_COUNT-1))));

	signal tb_encoded_angle : unsigned(PWM_RESOLUTION-1 downto 0);
	signal tb_pwm : std_ulogic := '0';

begin

	servo_dut : entity work.servo(behav)
		generic map (
			PWM_MAX_COUNT => PWM_MAX_COUNT,
			PWM_RESOLUTION => PWM_RESOLUTION
		)
		port map (
			clk_i => tb_clk,
			rst_i => tb_rst,
			encoded_angle_i => tb_encoded_angle,
			pwm_o => tb_pwm
		);

	tb_clk_proc : process
	begin
		wait for CLK_PERIOD / 2;
		tb_clk <= not tb_clk;
	end process tb_clk_proc;

	stimulus : process
	begin
		-- reset
		tb_rst <= '1';
		tb_encoded_angle <= (others => '0');
		wait for 100 ns;
		tb_rst <= '0';
		wait for 100 ns;

		-- 0 degree

		-- tb_encoded_angle <= to_unsigned(ANGLE_MIN_COUNT, PWM_RESOLUTION);

		-- wait for 1000 ms;

		-- 180 degree

		-- tb_encoded_angle <= to_unsigned(ANGLE_MAX_COUNT, PWM_RESOLUTION);

		-- wait for 1000 ms;

		-- 90 degree

		tb_encoded_angle <= to_unsigned((ANGLE_MIN_COUNT + ANGLE_MAX_COUNT) / 2, PWM_RESOLUTION);

		wait for 1000 ms;	
	end process;
	
end architecture; -- arch