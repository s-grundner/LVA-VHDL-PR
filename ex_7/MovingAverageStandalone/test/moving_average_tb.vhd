library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity moving_average_filter_tb is
end moving_average_filter_tb ;

architecture arch of moving_average_filter_tb is

	constant t_clk_tb : time := 10 ns;

	signal clk_tb : std_logic := '0';
	signal rst_tb : std_logic := '0';

	signal data_in_tb : unsigned(7 downto 0) := (others => '0');
	signal data_out_tb : unsigned(7 downto 0);

	signal data_valid_strobe_tb : std_logic := '0';

begin

	moving_average_filter_dut : entity work.moving_average_filter(behav)
		generic map (
			N => 2,
			BITWIDTH => 8
		)
		port map (
			clk_i => clk_tb,
			rst_i => rst_tb,
			strb_data_valid_i => data_valid_strobe_tb,
			strb_data_valid_o => open,
			data_i => data_in_tb,
			data_o => data_out_tb
		);

	clk_proc : process is
	begin
		wait for t_clk_tb/2;
		clk_tb <= not clk_tb;
	end process;

	stimulus : process is
	begin
		
		rst_tb <= '1';
		wait for t_clk_tb * 2;
		rst_tb <= '0';
		wait for t_clk_tb * 2;
		
		data_valid_strobe_tb <= '1';

		-- Test 1

		data_in_tb <= to_unsigned(14, 8);
		wait for t_clk_tb;
		data_in_tb <= to_unsigned(22, 8);
		wait for t_clk_tb;
		data_in_tb <= to_unsigned(34, 8);
		wait for t_clk_tb;
		data_in_tb <= to_unsigned(24, 8);
		wait for t_clk_tb;
		data_in_tb <= to_unsigned(4, 8);
		wait for t_clk_tb;
		data_in_tb <= to_unsigned(24, 8);

		wait for 20 us;

	end process stimulus;

end architecture arch;

