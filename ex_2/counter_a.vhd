architecture behav of counter is
	-- signals
	signal count : natural := 0;

begin
	-- Register Process: Reset and Clock behavior
	reg_proc : process (rst_i, clk_i) is
	begin
		if rst_i = '1' then
			count <= 0;
		elsif rising_edge(clk_i) then
			if counter_restart_strobe_i = '1' then
				count <= 0;
			else
				count <= count + 1;
			end if;
		end if;
	end process reg_proc;
	
	-- Assign previously determined counter value
	counter_value_o <= count;

end behav;