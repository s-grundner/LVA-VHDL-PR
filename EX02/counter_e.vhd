--------------------------------------------------------------------------------
-- file: counter_e.vhd
-- type: Entity
-- author: Simon Grundner (k12136610)
-- brief: Counter module declaration
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- ENTITY

entity counter is
    generic (
        CNT_LEN : natural
    );
    port (
        clk_i      : in std_ulogic;
        rst_i      : in std_ulogic;
        sync_rst_i : in std_ulogic;
        cnt_o      : out unsigned(CNT_LEN-1 downto 0)
    );
end entity counter;
