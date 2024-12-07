library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- entitiy

entity accu_reg is
    generic (
        D : integer := 2;
        BITWIDTH : integer := 8
    );
    port (
        clk_i : in std_ulogic;
        rst_i : in std_ulogic;

        accu_strb_i : in std_ulogic;
        data_i : in std_ulogic_vector(BITWIDTH-1 downto 0);
        data_o : out unsigned(BITWIDTH-1 downto 0)
    );
end accu_reg;

-- architecture

architecture behav of accu_reg is

    signal sum : signed(BITWIDTH-1+D downto 0) := (others => '0');
    signal next_sum : signed(BITWIDTH-1+D downto 0) := (others => '0');

begin

    reg_seq : process (clk_i, rst_i) is
    begin
        if rst_i = '1' then
            sum <= (others => '0');
        elsif rising_edge(clk_i) then
            sum <= next_sum;
        end if;
    end process reg_seq;

    accumulate_comb : process (data_i, accu_strb_i) is
    begin
        next_sum <= sum;

        if accu_strb_i = '1' then
            next_sum <= sum + signed(data_i);
        end if;
    end process accumulate_comb;

    data_o <= unsigned(sum(BITWIDTH-1+D downto D));

end architecture behav;