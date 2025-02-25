--------------------------------------------------------------------------------
-- file: counter_a.vhd
-- type: Architecture
-- author: Simon Grundner (k12136610)
-- brief: Counter module implementation
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-- ARCHITECTURE

architecture rtl of counter is

    signal count : natural := 0;
    signal count_reset_flag : std_ulogic := '0'; 

begin
    -- Register Process: Reset and Clock behavior
    register : process (rst_i, clk_i) is
    begin
        if rst_i = '1' then
            count <= 0;
        elsif rising_edge(clk_i) then
            if count_reset_flag = '1' then
                count <= 0;
            else
                count <= count + 1;
            end if;
        end if;
    end process register;

    -- Assign previously determined counter value
    combinatorial : process (counter_restart_strobe_i)
    begin
        count_reset_flag <= counter_reset_strobe_i;
        counter_value_o <= count;
    end process combinatorial;

end rtl;
