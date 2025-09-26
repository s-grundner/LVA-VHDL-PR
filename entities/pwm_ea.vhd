--------------------------------------------------------------------------------
-- file: pwm_ea.vhd
-- type: Entity / Architecture
-- author: Simon Grundner (k12136610)
-- brief: PWM module declaration
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- ENTITY

entity pwm is
    generic (
        CNT_LEN : natural
    );
    port (
        clk_i            : in std_ulogic;
        rst_i            : in std_ulogic;
        period_cnt_val_i : in unsigned(CNT_LEN-1 downto 0);
        on_cnt_val_i 	 : in unsigned(CNT_LEN-1 downto 0);
        pwm_o 			 : out std_ulogic
    );
end entity pwm;

-- ARCHITECTURE

architecture rtl of pwm is

    signal cnt : unsigned(CNT_LEN-1 downto 0) := (others => '0');
    signal sync_rst : std_ulogic;

begin
    cnt_ent : entity work.counter(rtl)
        generic map (
            CNT_LEN => CNT_LEN
        )
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            sync_rst_i => sync_rst,
            cnt_o => cnt
        );
    
    pwm_o    <= '1' when cnt < on_cnt_val_i else '0';
    sync_rst <= '1' when cnt = period_cnt_val_i-1 else '0';

end rtl;