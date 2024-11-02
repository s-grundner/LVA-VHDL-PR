library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

architecture behav of counter is

	signal curr_cnt : unsigned(COUNTER_LEN-1 downto 0) := (others => '0');
    signal next_cnt : unsigned(COUNTER_LEN-1 downto 0);

begin

	seq_proc : process (clk_i, rst_i) is
    begin
		if rst_i = '1' then
			curr_cnt <= (others => '0');
        elsif rising_edge(clk_i) then
            curr_cnt <= next_cnt;
        end if;
    end process seq_proc;

	comb_proc : process (curr_cnt, counter_rst_strobe_i) is
    begin
        if counter_rst_strobe_i = '1' then
            next_cnt <= (others => '0');
        else
            next_cnt <= curr_cnt + 1;
        end if;
    end process comb_proc;

	counter_o <= curr_cnt;

end behav;