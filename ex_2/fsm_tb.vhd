entity fsm_tb is
end fsm_tb;

architecture behav of fsm_tb is

	-- Testbench Signals, connections in Blockdiagram
	signal tb_clk, tb_rst				: bit;
	signal tb_start_button, tb_led 		: bit;
	signal tb_counter_restart_strobe 	: bit;
	signal tb_counter_value 			: natural;
	
	constant t_clk : time := 10 ns;

begin
	-- connect devices under test
	dut_counter : entity work.counter(behav)
	port map (
		clk_i						=> tb_clk,
		rst_i 					 	=> tb_rst,
		counter_restart_strobe_i 	=> tb_counter_restart_strobe,
		counter_value_o 		 	=> tb_counter_value
	);

	dut_fsm : entity work.fsm(behav)
	port map (
		clk_i                   	=> tb_clk,
		rst_i                   	=> tb_rst,
		start_button_i          	=> tb_start_button,
		counter_value_i         	=> tb_counter_value,
		counter_restart_strobe_o 	=> tb_counter_restart_strobe,
		led_o                   	=> tb_led
	);

	-- Clock Process: 50 MHz
	clk_process : process
	begin
		tb_clk <= '0';
		wait for t_clk;
		tb_clk <= '1';
		wait for t_clk;
	end process clk_process;

	-- Stimuli Process
	stimuli : process
	begin
		
		-- Initialize
		tb_rst <= '1';
		tb_start_button <= '0';
		wait for 20 ns;
		tb_rst <= '0';
		wait for 20 ns;

		-- Press Start Button
		tb_start_button <= '1';
		wait for 50 ns;
		tb_start_button <= '0';

		wait for 100 ns; 

		-- Press Start Button Multiple Times
		tb_start_button <= '1';
		wait for 50 ns;
		tb_start_button <= '0';

		wait for 100 ns; 

		tb_start_button <= '1';
		wait for 50 ns;
		tb_start_button <= '0';

		wait for 100 ns; 

		tb_start_button <= '1';
		wait for 50 ns;
		tb_start_button <= '0';

		wait for 800 ns; 

	end process stimuli;

end behav;