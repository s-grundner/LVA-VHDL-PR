--------------------------------------------------------------------------------
-- file: pwm_tb.vhd
-- type: Testbench
-- author: Simon Grundner (k12136610)
-- brief: PWM module testcases: 50MHz, max counter 15, on time counter 4
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity pwm_tb is
end pwm_tb;

architecture rtl of pwm_tb is
	
	constant t_clk : time := 20 ns;
	constant tb_CNT_LEN : natural := 4;

	signal tb_clk            : std_ulogic := '0';
	signal tb_rst            : std_ulogic := '0';
	signal tb_period_cnt_val : unsigned(tb_CNT_LEN-1 downto 0) := "0000";
	signal tb_on_cnt_val     : unsigned(tb_CNT_LEN-1 downto 0) := "0000";
	signal tb_pwm            : std_ulogic := '0';
begin

	pwm_dut : entity work.pwm(rtl)
	generic map (
		CNT_LEN => tb_CNT_LEN
	)
	port map (
		clk_i            => tb_clk,
		rst_i            => tb_rst,
		period_cnt_val_i => tb_period_cnt_val,
		on_cnt_val_i     => tb_on_cnt_val,
		pwm_o            => tb_pwm
	);

	clk_proc : process -- 50 MHz
	begin
		tb_clk <= '0';
		wait for t_clk / 2;
		tb_clk <= '1';
		wait for t_clk / 2;
	end process clk_proc;

	stimuli : process
	begin
		
		tb_rst <= '1';
		wait for 20 ns;
		tb_rst <= '0';
		wait for 20 ns;

		-- Test case

		tb_period_cnt_val <= "1111";
		tb_on_cnt_val <= "0100";

		wait for 2000 ns;

	end process stimuli;
end rtl;