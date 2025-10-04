--------------------------------------------------------------------------------
-- file: pwm_e.vhd
-- type: Entity
-- author: Simon Grundner (k12136610)
-- brief: PWM module declaration
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- ENTITY

entity pwm is
	generic(
		CNT_LEN : natural := 4
	);
	port (
		clk_i            : in std_ulogic;
		rst_i            : in std_ulogic;
		period_cnt_val_i : in unsigned(CNT_LEN-1 downto 0);
		on_cnt_val_i     : in unsigned(CNT_LEN-1 downto 0);
		pwm_o            : out std_ulogic
	);
end entity pwm;