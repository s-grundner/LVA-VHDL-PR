library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- entitiy

entity moving_average_filter is
    generic (
        N : integer := 2; -- LOG2 of filter order
        BITWIDTH : integer := 8
    );
    port (
        clk_i : in std_ulogic;
        rst_i : in std_ulogic;

        strb_data_valid_i : in std_ulogic;
        strb_data_valid_o : out std_ulogic;

        data_i : in unsigned(BITWIDTH-1 downto 0);
        data_o : out unsigned(BITWIDTH-1 downto 0)
    );
end moving_average_filter;

-- architecture

architecture behav of moving_average_filter is

    type filter_reg_t is array (0 to 2**N-1) of signed(BITWIDTH-1 downto 0);
    
    signal filter_reg : filter_reg_t := (others => (others => '0'));
    signal next_filter_reg : filter_reg_t := (others => (others => '0'));
    
    signal sum : signed(BITWIDTH-1+N downto 0) := (others => '0');
    signal next_sum : signed(BITWIDTH-1+N downto 0) := (others => '0');
    
    signal next_strobe : std_ulogic := '0';
begin

    reg_seq : process (clk_i, rst_i) is
    begin
        if rst_i = '1' then
            filter_reg <= (others => (others => '0'));
            sum <= (others => '0');
            next_strobe <= '0';
        elsif rising_edge(clk_i) then
            filter_reg <= next_filter_reg;
            sum <= next_sum;
            next_strobe <= strb_data_valid_i;
        end if;
    end process reg_seq;

    comb_filter : process (data_i, filter_reg, strb_data_valid_i) is
    begin
        next_sum <= sum;
        next_filter_reg <= filter_reg;

        if(strb_data_valid_i = '1') then
            next_filter_reg(0) <= signed(data_i);
            next_sum <= sum + signed(data_i) - filter_reg(2**N-1);
            for i in 1 to 2**N-1 loop
                next_filter_reg(i) <= filter_reg(i-1);
            end loop;
        end if;
    end process comb_filter;

    -- Divide by shift right
    data_o <= unsigned(sum(BITWIDTH-1+N downto N));
    strb_data_valid_o <= next_strobe;

end architecture behav;