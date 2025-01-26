library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use ieee.math_real.all;

-- entity

entity strb_generator is
    generic (
        PRESCALER : natural := 1
    );
    port (
        clk_i      : in std_ulogic;
        rst_i      : in std_ulogic;
        sync_rst_i : in std_ulogic;
        strb_o     : out std_ulogic
    );
end entity strb_generator;

-- architecture

architecture behav of strb_generator is

    constant PS_SIZE : natural := natural(ceil(log2(real(PRESCALER))));
    signal next_strb : std_ulogic := '0';
    signal curr_strb : std_ulogic := '0';
    signal cnt       : unsigned(PS_SIZE-1 downto 0) := (others => '0');

begin

    cnt_ent : entity work.counter(behav)
    generic map (
        CNT_LEN => PS_SIZE
    )
    port map (
        clk_i      => clk_i,
        rst_i      => rst_i,
        sync_rst_i => curr_strb or sync_rst_i,
        cnt_o      => cnt
    );

    reg_seq : process (clk_i, rst_i) is
    begin
        if rst_i = '1' then
            curr_strb <= '0';
        elsif rising_edge(clk_i) then
            curr_strb <= next_strb;
        end if;
    end process reg_seq;

    next_strb <= '1' when cnt = PRESCALER-1 else '0'; 
    strb_o <= curr_strb;

end behav;