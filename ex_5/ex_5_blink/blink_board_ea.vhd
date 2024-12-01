library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use ieee.math_real.all;

entity blink is
    generic (
        MAX_COUNTER : natural := 50; -- this determines the blinking frequency
        SYNC_DFF_CNT : natural := 4
    );
    
    port (
        clk_i           : in std_ulogic;
        rst_i           : in std_ulogic;
        start_button_i  : in std_ulogic;
        led_o           : out std_ulogic
    );
end blink;

architecture behav of blink is

    constant COUNTER_LEN : natural := natural(ceil(log2(real(MAX_COUNTER-1))));

    signal counter_rst_strobe : std_ulogic;
    signal counter            : unsigned(COUNTER_LEN-1 downto 0);
    signal sync_start_button  : std_ulogic;

begin

    counter_ent : entity work.counter(behav)
        generic map (
            COUNTER_LEN => COUNTER_LEN
        )
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            counter_o => counter,
            counter_rst_strobe_i => counter_rst_strobe
        );

    fsm_ent : entity work.fsm(behav)
        generic map (
            MAX_COUNTER => MAX_COUNTER
        )
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            start_button_i => sync_start_button,
            counter_i => counter,
            counter_rst_strobe_o => counter_rst_strobe,
            led_o => led_o
        );

    sync_ent : entity work.sync(behav)
        generic map (
            N_DFF => SYNC_DFF_CNT
        )
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            sig_i => start_button_i,
            sig_o => sync_start_button
        );
end architecture;
