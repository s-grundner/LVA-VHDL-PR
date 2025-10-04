--------------------------------------------------------------------------------
-- file: top_level.vhd
-- type: Top Level Entity / Architecture
-- author: Simon Grundner (k12136610)
-- brief: Top level entity for the finite state machine
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity top_level is
	port (
		clk_i          : in  std_ulogic;
		rst_i          : in  std_ulogic;
		start_button_i : in  std_ulogic;
		led_o          : out std_ulogic
	);
end top_level;

architecture rtl of top_level is

	constant CNT_LEN : natural := 4;
	signal counter_restart_strobe : std_ulogic;
	signal counter_value          : unsigned(CNT_LEN-1 downto 0);

begin

	-- Instantiate submodules
	counter_inst : entity work.counter(rtl)
	generic map (
		CNT_LEN => 4
	)
	port map (
		clk_i      => clk_i,
		rst_i      => rst_i,
		sync_rst_i => counter_restart_strobe,
		cnt_o      => counter_value
	);

	fsm_inst : entity work.fsm(rtl)
	port map (
		clk_i                    => clk_i,
		rst_i                    => rst_i,
		start_button_i           => start_button_i,
		counter_value_i          => counter_value,
		counter_restart_strobe_o => counter_restart_strobe,
		led_o                  	 => led_o
	);

end rtl;
