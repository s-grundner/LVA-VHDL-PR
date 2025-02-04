library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.std_definitions.all;

entity tl_tb is
end tl_tb;

architecture rtl of tl_tb is

constant CLK_HALF_TB : time := 10 ns;
signal clk_tb : std_ulogic := '0';

signal btn_rst    : std_ulogic := '0';
signal btn_inc    : std_ulogic := '0';
signal btn_dec    : std_ulogic := '0';
signal btn_draw_k : std_ulogic := '0';

signal sw_dbg_en    : std_ulogic := '0';
signal sw_filter_en : std_ulogic := '0';
signal sw_mode   	: std_ulogic := '0';
signal sw_dbg_axis 	: std_ulogic := '0';
signal sw_z_axis    : std_ulogic := '0';

signal x_comp : std_ulogic := '0';
signal y_comp : std_ulogic := '0';

signal x_adc_pwm : std_ulogic := '0';
signal y_adc_pwm : std_ulogic := '0';

begin

	tb_dut : entity work.tl(rtl)
	port map(
		clk_i => clk_tb,
		rst_i => btn_rst,

		sw_filter_en_async_i => sw_filter_en,
		sw_dgb_en_async_i    => sw_dbg_en,
		sw_dbg_axis_async_i  => sw_dbg_axis,
		sw_mode_async_i      => sw_mode,
		sw_z_axis_async_i    => sw_z_axis,

		btn_draw_k_async_i   => btn_draw_k,
		btn_inc_async_i      => btn_inc,
		btn_dec_async_i      => btn_dec,

		x_comp_async_i => x_comp,
		y_comp_async_i => y_comp,

		x_adc_pwm_o => x_adc_pwm,
		y_adc_pwm_o => y_adc_pwm
	);


	clk_proc : process is
	begin
		clk_tb <= not clk_tb;
		wait for CLK_HALF_TB;
	end process clk_proc;

	stimulus_proc : process is
	begin
		btn_rst <= '1';
		wait for CLK_HALF_TB;
		btn_rst <= '0';
		wait for CLK_HALF_TB;

		sw_dbg_en <= '1';
		
		wait for 2000 ms;

	end process;

end architecture;