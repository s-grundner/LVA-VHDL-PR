library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.std_definitions.all;

-- clean button test bench

entity cb_tb is
end cb_tb;

architecture rtl of cb_tb is

    constant CLK_HALF_TB : time := 10 ns;
    signal clk_tb : std_ulogic := '0';
    signal rst_tb : std_ulogic := '0';
    signal btn_i : std_ulogic := '0';
    signal btn_o : std_ulogic := '0';

    begin

    cb_dut : entity work.clean_btn(rtl)
    port map(
        clk_i => clk_tb,
        rst_i => rst_tb,
        btn_i => btn_i,
        btn_o => btn_o
    );

    clk_proc : process is
    begin
        clk_tb <= not clk_tb;
        wait for CLK_HALF_TB;
    end process clk_proc;

    stimulus : process is
    begin
        rst_tb <= '1';
        wait for 10*CLK_HALF_TB;
        rst_tb <= '0';
        wait for 2*CLK_HALF_TB;

        btn_i <= '1';
        wait for 5*CLK_HALF_TB;
        btn_i <= '0';
        wait for 5*CLK_HALF_TB;
        btn_i <= '1';
        wait for 5*CLK_HALF_TB;
        btn_i <= '0';
        wait for 5*CLK_HALF_TB;
        btn_i <= '1';
        wait for 5*CLK_HALF_TB;
        btn_i <= '0';
        wait for 5*CLK_HALF_TB;
        btn_i <= '1';
        wait for 5*CLK_HALF_TB;
        btn_i <= '0';
        wait for 5*CLK_HALF_TB;
        btn_i <= '1';
        wait for 5*CLK_HALF_TB;
        btn_i <= '0';
        wait for 5*CLK_HALF_TB;
        btn_i <= '1';
        wait for 5*CLK_HALF_TB;
        btn_i <= '0';
        wait for 5*CLK_HALF_TB;
        btn_i <= '1';
        wait for 5*CLK_HALF_TB;
        btn_i <= '0';
        wait for 5*CLK_HALF_TB;
        btn_i <= '1';
        wait for 5*CLK_HALF_TB;
        btn_i <= '0';
        wait for 5*CLK_HALF_TB;
        btn_i <= '1';
        wait for 5*CLK_HALF_TB;
        btn_i <= '0';
        wait for 5*CLK_HALF_TB;
        btn_i <= '1';
        wait for 5*CLK_HALF_TB;
        btn_i <= '0';
        wait for 5*CLK_HALF_TB;
        btn_i <= '1';
        wait for 5*CLK_HALF_TB;
        btn_i <= '0';
        wait for 5*CLK_HALF_TB;
        btn_i <= '1';
        wait for 5*CLK_HALF_TB;
        btn_i <= '0';
        wait for 5*CLK_HALF_TB;
        btn_i <= '1';
        wait for 5*CLK_HALF_TB;
        btn_i <= '0';
        wait for 5*CLK_HALF_TB;
        btn_i <= '1';
        wait for 5*CLK_HALF_TB;
        btn_i <= '0';
        wait for 5*CLK_HALF_TB;
        btn_i <= '1';
        wait for 5*CLK_HALF_TB;
        btn_i <= '0';
        wait for 5*CLK_HALF_TB;
        btn_i <= '1';
        wait for 5*CLK_HALF_TB;
        btn_i <= '0';
        wait for 5*CLK_HALF_TB;
        btn_i <= '1';

        wait for 10 ms;

    end process stimulus;

end rtl;