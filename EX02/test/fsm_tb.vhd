--------------------------------------------------------------------------------
-- file: fsm_tb.vhd
-- type: Testbench
-- author: Simon Grundner (k12136610)
-- brief: Finite state machine testbench
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity fsm_tb is
end fsm_tb;

architecture rtl of fsm_tb is

    -- Testbench Signals, connections in Blockdiagram
    signal tb_clk, tb_rst            : std_ulogic;
    signal tb_start_button, tb_led   : std_ulogic;
    constant t_clk : time := 10 ns;

begin
    -- connect devices under test
    dut_tl : entity work.top_level(rtl)
    port map (
        clk_i          => tb_clk,
        rst_i          => tb_rst,
        start_button_i => tb_start_button,
        led_o          => tb_led
    );

    -- Clock Process: 50 MHz
    clk_process : process
    begin
        tb_clk <= '0';
        wait for t_clk;
        tb_clk <= '1';
        wait for t_clk;
    end process clk_process;

    -- Stim Process
    stim : process
    begin

        -- Initialize
        tb_rst <= '1';
        tb_start_button <= '0';
        wait for 20 ns;
        tb_rst <= '0';
        wait for 20 ns;

        -- Press Start Button
        tb_start_button <= '1';
        wait for 50 ns;
        tb_start_button <= '0';

        wait for 100 ns; 

        -- Press Start Button Multiple Times
        tb_start_button <= '1';
        wait for 50 ns;
        tb_start_button <= '0';

        wait for 100 ns; 

        tb_start_button <= '1';
        wait for 50 ns;
        tb_start_button <= '0';

        wait for 100 ns; 

        tb_start_button <= '1';
        wait for 50 ns;
        tb_start_button <= '0';

        wait for 800 ns; 

    end process stim;

end rtl;
