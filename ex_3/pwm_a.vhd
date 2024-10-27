library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

architecture behav of pwm is

	signal count : unsigned(COUNTER_LEN-1 downto 0);
	signal count_reset_flag : std_ulogic := '0';

begin

	reg_proc : process (rst_i, clk_i) is
	begin
		if rst_i = '1' then
			count <= (others => '0');
		elsif rising_edge(clk_i) then
			count <= count + 1;
			if count_reset_flag = '1' then
				count <= (others => '0');
			end if;
		end if;
	end process reg_proc;

	pwm_proc : process (count, ON_counter_val_i) is
	begin
		if count < ON_counter_val_i then
			PWM_pin_o <= '1';
		else
			PWM_pin_o <= '0';
		end if;
	end process pwm_proc;

	rst_proc : process (Period_counter_val_i) is
	begin
		if count > Period_counter_val_i then
			count_reset_flag <= '1';
		else 
			count_reset_flag <= '0';
		end if;
	end process rst_proc;
end behav;