entity sample_hold_tb is
end sample_hold_tb;

architecture behav of sample_hold_tb is

	constant T_CLK : time := 20 ns; --50MHz
	signal clk_tb : std_ulogic := '0';
	signal rst_tb : std_ulogic := '0';

begin

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