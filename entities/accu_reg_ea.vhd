library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

library work;
use work.std_definitions.all;

-- entitiy

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

-- architecture

architecture behav of accu_reg is

    signal sum : signed(BITWIDTH-1+D downto 0) := to_signed(INIT_SUM, BITWIDTH+D);
    signal next_sum : signed(BITWIDTH-1+D downto 0) := to_signed(INIT_SUM, BITWIDTH+D);

begin

    reg_seq : process (clk_i, rst_i) is
    begin
        if rst_i = '1' then
            sum <= (others => '0');
        elsif rising_edge(clk_i) then
            sum <= next_sum;
        end if;
    end process reg_seq;

    next_sum <= sum + signed(data_i) when accu_strb_i = '1' else sum;
    data_o <= sum(BITWIDTH-1+D downto D);

end architecture behav;