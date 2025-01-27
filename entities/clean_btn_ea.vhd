library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.std_definitions.all;

entity clean_btn is
    port (
        clk_i : in std_ulogic;
        rst_i : in std_ulogic;
        btn_i : in std_ulogic;
        btn_o : out std_ulogic
    );
end clean_btn;

architecture rtl of clean_btn is

    signal btn_sync : std_ulogic := '0';

begin

    sync_ent : entity work.sync(rtl)
    generic map (
        N_DFF => DEFAULT_N_SYNC_DFF
    )
    port map (
        clk_i => clk_i,
        rst_i => rst_i,
        sig_i => btn_i,
        sig_o => btn_sync
    );
    
    debouncer_ent : entity work.debouncer(rtl)
    port map (
        clk_i => clk_i,
        rst_i => rst_i,
        sig_i => btn_sync,
        sig_o => btn_o
    );

end architecture;