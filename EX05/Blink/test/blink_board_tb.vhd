library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 


entity blink_board_tb is
end blink_board_tb;

architecture behav of blink_board_tb is

	-- Clock
	constant t_clk : time := 20 ns;

	-- Signals
	signal tb_clk : std_ulogic;
	signal tb_rst : std_ulogic;
	signal tb_start_button : std_ulogic;
	signal tb_led : std_ulogic;

begin

	dut_blink : entity work.blink(behav)
		generic map (
			MAX_COUNTER => 50,
			SYNC_DFF_CNT => 4
		)
		port map (
			clk_i => tb_clk,
			rst_i => tb_rst,
			start_button_i => tb_start_button,
			led_o => tb_led
		);

	-- Clock Process: 50 MHz
	clk_process : process is
	begin
		tb_clk <= '0';
		wait for t_clk;
		tb_clk <= '1';
		wait for t_clk;
	end process clk_process;

	-- Stimuli Process
	stimuli : process is
	begin
		
		-- Initialize
		tb_rst <= '1';
		tb_start_button <= '0';
		wait for 20 ns;
		tb_rst <= '0';
		wait for 20 ns;

		-- Press Start Button
		tb_start_button <= '1';
		wait for 200 ns;
		tb_start_button <= '0';

		wait for 5000 ns;

		-- Initialize
		tb_rst <= '1';
		tb_start_button <= '0';
		wait for 20 ns;
		tb_rst <= '0';
		wait for 20 ns;

		-- Simulate Bouncing
		tb_start_button <= '1';
		wait for 20 ns;
		tb_start_button <= '0';
		wait for 50 ns;
		tb_start_button <= '1';
		wait for 10 ns;
		tb_start_button <= '0';
		wait for 50 ns;
		tb_start_button <= '1';
		wait for 200 ns;
		tb_start_button <= '0';	

		wait for 2000 ns;

	end process stimuli;

end architecture;