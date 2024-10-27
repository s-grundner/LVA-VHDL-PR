library ieee.std_logic_1164.all;

architecture behav of pwm is

	signal count : natural := 0;

begin

	reg_proc : process (rst_i, clk_i) is
	begin
		if rst_i = '1' then
			count <= 0;
		elsif rising_edge(clk_i) then
			count <= count + 1;
			if count = Period_counter_val_i then
				count <= 0;
			end if;
		end if;
	end process reg_proc;

	pwm_proc : process (count, Period_counter_val_i, ON_counter_val_i) is
	begin
		if count < ON_counter_val_i then
			PWM_pin_o <= '1';
		else
			PWM_pin_o <= '0';
		end if;
	end process pwm_proc;

end behav; 