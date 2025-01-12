library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity sync is
    generic (
        N_DFF : natural := 1
    );
    port (
        clk_i : in std_ulogic;
        rst_i : in std_ulogic;
        sig_i : in std_ulogic;
        sig_o : out std_ulogic
    );
end sync;

architecture behav of sync is

    signal sync_chain : std_logic_vector(N_DFF-1 downto 0) := (others => '0');
    signal next_sync_chain : std_logic_vector(N_DFF-1 downto 0) := (others => '0');
    
begin
    
    reg_seq : process(clk_i, rst_i) is
    begin
        if rst_i = '1' then
            sync_chain <= (others => '0');
        elsif rising_edge(clk_i) then
            sync_chain <= next_sync_chain;
        end if;
    end process;

    comb : process(sig_i, sync_chain) is
    begin
        next_sync_chain(0) <= sig_i;
        for i in 1 to N_DFF-1 loop
            next_sync_chain(i) <= sync_chain(i-1);
        end loop;
    end process;

    sig_o <= sync_chain(N_DFF-1);

end architecture;


