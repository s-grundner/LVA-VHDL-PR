library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity tilt_tb is
end tilt_tb ;

architecture behav of tilt_tb is

	constant T_CLK : time := 20 ns; --50MHz
	signal clk_tb : std_ulogic := '0';
	signal rst_tb : std_ulogic := '0';

begin

	tilt_dut : entity work.tilt(behav)
		generic map (
			ADC_RESOLUTION => 8,
			SERVO_RESOLUTION => 20
		)
		port map (
			clk_i => clk_tb,
			rst_i => rst_tb,
			value_i => "00000000000000000000",
			on_cnt_o => open
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