--------------------------------------------------------------------------------
-- file: fsm_e.vhd
-- type: Entity
-- author: Simon Grundner (k12136610)
-- brief: Finite state machine module declaration
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- ENTITY 

entity fsm is
    generic (
        CNT_LEN : natural := 4
    );
    port (
        clk_i                    : in std_ulogic;
        rst_i                    : in std_ulogic;
        start_button_i           : in std_ulogic;
        counter_value_i          : in unsigned(CNT_LEN-1 downto 0);
        counter_restart_strobe_o : out std_ulogic;
        led_o                    : out std_ulogic
    );
end entity fsm;
