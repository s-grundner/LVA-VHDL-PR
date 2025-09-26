--------------------------------------------------------------------------------
-- file: accu_reg_ea.vhd
-- type: Entity / Architecture
-- author: Simon Grundner (k12136610)
-- brief: Accumulation Register Module. Sums data and returns the most
--        significant bits 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

library work;
use work.std_definitions.all;

-- ENTITIY

entity accu_reg is
    generic (
        D : natural;
        BITWIDTH : integer;
        INIT_SUM : integer := 0
    );
    port (
        clk_i : in std_ulogic;
        rst_i : in std_ulogic;

        accu_strb_i : in std_ulogic;
        data_i : in std_ulogic_vector(BITWIDTH-1 downto 0);
        data_o : out signed(BITWIDTH-1 downto 0)
    );
end accu_reg;

-- ARCHITECTURE

architecture rtl of accu_reg is

    signal sum, next_sum : signed(BITWIDTH-1+D downto 0);

begin

    reg_seq : process (clk_i, rst_i) is
    begin
        if rst_i = '1' then
            sum <= to_signed(INIT_SUM, BITWIDTH+D);
        elsif rising_edge(clk_i) then
            sum <= next_sum;
        end if;
    end process reg_seq;

    next_sum <= sum + signed(data_i) when accu_strb_i = '1' else sum;
    data_o <= sum(BITWIDTH-1+D downto D);

end architecture rtl;