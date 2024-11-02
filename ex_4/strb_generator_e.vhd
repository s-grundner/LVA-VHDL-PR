library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity strb_generator is
	generic (
		PRESCALER : natural
	);
	port (
		clk_i  : in std_ulogic;
		rst_i  : in std_ulogic;
		strb_o : out std_ulogic
	);
end entity strb_generator;