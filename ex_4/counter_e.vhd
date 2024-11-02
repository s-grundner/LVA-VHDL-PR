library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity counter is
    generic (
        COUNTER_LEN : natural
    );
    port (
        clk_i 				 : in std_ulogic;
        rst_i 				 : in std_ulogic;
		counter_rst_strobe_i : in std_ulogic;
        counter_o 			 : out unsigned(COUNTER_LEN-1 downto 0)
    );
end entity counter;