--------------------------------------------------------------------------------
-- file: pwm_a.vhd
-- type: Architecture
-- author: Simon Grundner (k12136610)
-- brief: PWM module implementation
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- ARCHITECTURE

architecture rtl of pwm is

	signal count : unsigned(COUNTER_LEN-1 downto 0);
	signal count_reset_flag : std_ulogic := '0';

begin

	cnt_reg : process (rst_i, clk_i) is
	begin
		if rst_i = '1' then
			count <= (others => '0');
		elsif rising_edge(clk_i) then
			count <= count + 1;
			if count_reset_flag = '1' then
				count <= (others => '0');
			end if;
		end if;
	end process cnt_reg;

	pwm_comb : process (count, ON_counter_val_i) is
	begin
		if count < ON_counter_val_i then
			PWM_pin_o <= '1';
		else
			PWM_pin_o <= '0';
		end if;
	end process pwm_comb;

	sync_reset_comb : process (count, Period_counter_val_i) is
	begin
		if count = Period_counter_val_i-1 then
			count_reset_flag <= '1';
		else 
			count_reset_flag <= '0';
		end if;
	end process sync_reset_comb;
	
end rtl;
