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
		clk_i  : in std_ulogic;
		rst_i  : in std_ulogic;
		sync_rst_i : in std_ulogic;
		strb_o : out std_ulogic
	);
end entity strb_generator;

-- architecture

architecture behav of strb_generator is

	constant PS_WIDTH           : natural := natural(ceil(log2(real(PRESCALER))));
	signal next_strb, curr_strb : std_ulogic := '0';
	signal cnt                  : unsigned(PS_WIDTH-1 downto 0) := (others => '0');

begin

	cnt_ent : entity work.counter(behav)
		generic map (
			CNT_LEN => PS_WIDTH
		)
		port map (
			clk_i      => clk_i,
			rst_i      => rst_i,
			sync_rst_i => curr_strb,
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

	strb_comb : process (cnt, sync_rst_i) is
	begin
		next_strb <= '0';
		if sync_rst_i = '1' then
			next_strb <= '0';
		elsif cnt = PRESCALER-1 then
			next_strb <= '1';
		end if;
		
	end process strb_comb;

	strb_o <= curr_strb;

end behav;