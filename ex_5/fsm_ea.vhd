library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use ieee.math_real.all;

entity fsm is
    generic (
        MAX_COUNTER : natural		
    );
    port (
        clk_i           : in std_ulogic;
        rst_i           : in std_ulogic;
        start_button_i  : in std_ulogic;
        counter_i       : in unsigned(integer(ceil(log2(real(MAX_COUNTER))))-1 downto 0);
        counter_rst_strobe_o : out std_ulogic;
        led_o           : out std_ulogic
    );
end entity;

-- enum

package std_definitions is
    type curr_state_type is (START, WAIT_ON_CNT, LED_ON);
end package std_definitions;

use work.std_definitions.all;


architecture behav of fsm is

signal curr_state, next_state : curr_state_type;

begin

    reg_seq : process(clk_i, rst_i) is
    begin
        if rst_i = '1' then
            curr_state <= START;
        elsif rising_edge(clk_i) then
            curr_state <= next_state;
        end if;
    end process;

    fsm_comb : process(curr_state, start_button_i, counter_i) is
    begin
        next_state <= curr_state;
        counter_rst_strobe_o <= '0';
        led_o <= '0';

        case curr_state is
            when START =>
                if start_button_i = '1' then
                    counter_rst_strobe_o <= '1';
                    next_state <= WAIT_ON_CNT;
                end if;

            when WAIT_ON_CNT =>
                if counter_i = MAX_COUNTER then 
                    counter_rst_strobe_o <= '1';
                    next_state <= LED_ON;
                end if;

            when LED_ON =>
                led_o <= '1';
                if counter_i = MAX_COUNTER then 
                    counter_rst_strobe_o <= '1';
                    next_state <= START;
                end if;

            when others => 
                next_state <= START;
        end case;
    end process;

end behav;