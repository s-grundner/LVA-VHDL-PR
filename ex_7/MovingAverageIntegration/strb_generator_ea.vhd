library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use ieee.math_real.all;

-- entity

entity strb_generator is
	generic (
		PRESCALER : natural
	);
	port (
		clk_i  : in std_ulogic;
		rst_i  : in std_ulogic;
		strb_o : out std_ulogic
	);
end entity strb_generator;

-- architecture

architecture behav of strb_generator is

	constant PS_WIDTH : natural := natural(ceil(log2(real(PRESCALER))));

	signal next_strobe : std_ulogic := '0';
	signal curr_strobe : std_ulogic := '0';
	signal strb_counter : unsigned(PS_WIDTH-1 downto 0) := (others => '0');

begin

	counter_ent : entity work.counter(behav)
		generic map (
			COUNTER_LEN => PS_WIDTH
		)
		port map (
			clk_i => clk_i,
			rst_i => rst_i,
			counter_rst_strobe_i => curr_strobe,
			counter_o => strb_counter
		);

	reg_seq : process (clk_i, rst_i) is
	begin
		if rst_i = '1' then
			curr_strobe <= '0';
		elsif rising_edge(clk_i) then
			curr_strobe <= next_strobe;
		end if;
	end process reg_seq;

	strb_comb : process (strb_counter) is
	begin
		next_strobe <= '0';
		if strb_counter = PRESCALER-1 then
			next_strobe <= '1';
		end if;
	end process strb_comb;

	strb_o <= curr_strobe;

end behav;