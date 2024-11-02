library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity delta_adc_tb is
end entity delta_adc_tb;

architecture behav of delta_adc_tb is

	constant t_clk 			 : time := 10 ns;
	constant tb_BITWIDTH 	 : natural := 4;
	constant tb_SAMPLING_PSC : natural := 32;

	signal tb_clk : std_ulogic := '0';
	signal tb_rst : std_ulogic := '0';
	signal tb_PWM : std_ulogic := '0';
	signal tb_ADC_valid_strobe : std_ulogic := '0';
	signal tb_ADC_Value : unsigned(tb_BITWIDTH-1 downto 0) := (others => '0');
	signal tb_Comparator : std_logic := '0';

begin

	clk : process is
	begin
		wait for t_clk / 2;
		tb_clk <= not tb_clk;
	end process;

	delta_adc_dut : entity work.delta_adc(behav)
		generic map (
			BITWIDTH => tb_BITWIDTH,
			SAMPLING_PSC => tb_SAMPLING_PSC
		)
		port map (
			clk_i => tb_clk,
			rst_i => tb_rst,
			PWM_o => tb_PWM,
			ADC_valid_strobe_o => tb_ADC_valid_strobe,
			ADC_Value_o => tb_ADC_Value,
			Comparator_i => tb_Comparator
		);
	
	stimulus : process is
	begin
		
		tb_rst <= '1';
		wait for 20 ns;
		tb_rst <= '0';
		wait for 20 ns;

		tb_Comparator <= '1';

		wait for 2000 ns;

		tb_Comparator <= '0';

		wait for 1800 ns;

		tb_Comparator <= '1';

		wait for 4000 ns;

		tb_Comparator <= '0';

		wait for 10000 ns;

	end process;

end behav;