entity counter is
	port (
		clk_i 						: in bit;
		rst_i 						: in bit;
		counter_restart_strobe_i	: in bit;
		counter_value_o 			: out natural
	);
end entity counter;