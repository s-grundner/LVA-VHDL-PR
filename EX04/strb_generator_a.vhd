--------------------------------------------------------------------------------
-- file: strb_generator_a.vhd
-- type: Architecture
-- author: Simon Grundner (k12136610)
-- brief: strobe generator module implementation
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use ieee.math_real.all;

-- ARCHITECTURE

architecture rtl of strb_generator is

	signal next_strobe : std_ulogic := '0';
	signal curr_strobe : std_ulogic := '0';
	signal strb_counter : unsigned(PRESCALER-1 downto 0) := (others => '0');

begin

	counter_ent : entity work.counter(rtl)
		generic map (
			COUNTER_LEN => PRESCALER
		)
		port map (
			clk_i => clk_i,
			rst_i => rst_i,
			counter_rst_strobe_i => curr_strobe,
			counter_o => strb_counter
		);

	strb_reg : process (clk_i, rst_i) is
	begin
		if rst_i = '1' then
			curr_strobe <= '0';
		elsif rising_edge(clk_i) then
			curr_strobe <= next_strobe;
		end if;
	end process strb_reg;

	strb_comb : process (strb_counter) is
	begin
		next_strobe <= '0';
		if strb_counter = PRESCALER-1 then
			next_strobe <= '1';
		end if;
	end process strb_comb;

	strb_o <= curr_strobe;

end rtl;