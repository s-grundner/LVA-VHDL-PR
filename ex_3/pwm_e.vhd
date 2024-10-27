library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 


entity pwm is
    generic(
        COUNTER_LEN : natural
    );
    port (
        clk_i 				 : in std_ulogic;
        rst_i 				 : in std_ulogic;
        Period_counter_val_i : in unsigned (COUNTER_LEN-1 downto 0);
        ON_counter_val_i 	 : in unsigned (COUNTER_LEN-1 downto 0);
        PWM_pin_o 			 : out std_ulogic
    );
end entity pwm;