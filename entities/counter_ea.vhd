library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- entitiy

entity counter is
    generic (
        CNT_LEN : natural
    );
    port (
        clk_i 	   : in std_ulogic;
        rst_i 	   : in std_ulogic;
		sync_rst_i : in std_ulogic;
        cnt_o 	   : out unsigned(CNT_LEN-1 downto 0)
    );
end entity counter;

-- architecture

architecture behav of counter is

	signal curr_cnt, next_cnt : unsigned(CNT_LEN-1 downto 0) := (others => '0');

begin

	reg_seq : process (clk_i, rst_i) is
    begin
        if rst_i = '1' then
            curr_cnt <= (others => '0');
        elsif rising_edge(clk_i) then
            curr_cnt <= next_cnt;
        end if;
    end process reg_seq;

    next_cnt <= (others => '0') when sync_rst_i = '1' else curr_cnt + 1;
    cnt_o <= curr_cnt;

end behav; 