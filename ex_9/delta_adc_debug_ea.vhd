library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

library work;
use work.std_definitions.all;

-- entity

entity delta_adc_debug is
	generic (
		ADC_RESOLUTION : natural := ADC_RESOLUTION;
		SAMPLING_PSC   : natural := 4;
		MAX_CNT_VAL    : natural
	);
	port (
		clk_i         : in std_ulogic;
		rst_i         : in std_ulogic;
		pwm_o         : out std_logic;
		adc_in_strb_i : in std_ulogic;
		comp_i        : in std_ulogic;
		adc_debug_i   : in unsigned(ADC_RESOLUTION-1 downto 0)
	);
end delta_adc_debug;

-- architecture

architecture behav of delta_adc_debug is

	signal on_cnt_val, next_on_cnt_val : unsigned(ADC_RESOLUTION-1 downto 0) := (others => '0');

begin

	pwm_ent : entity work.pwm(behav)
		generic map (
			CNT_LEN => ADC_RESOLUTION
		)
		port map (
			clk_i => clk_i,
			rst_i => rst_i,
			period_cnt_val_i => to_unsigned(MAX_CNT_VAL, ADC_RESOLUTION),
			on_cnt_val_i => adc_debug_i,
			pwm_o => pwm_o
		);
	
	reg_seq : process(clk_i, rst_i) is
	begin
		if rst_i = '1' then
			on_cnt_val <= (others => '0');
		elsif rising_edge(clk_i) then
			on_cnt_val <= next_on_cnt_val;
		end if;
	end process reg_seq;

	adc_comb : process(on_cnt_val, comp_i, adc_debug_i) is
	begin
		if adc_in_strb_i = '1' then
			next_on_cnt_val <= adc_debug_i;
		elsif comp_i = '1' then
			next_on_cnt_val <= on_cnt_val + 1;
		else
			next_on_cnt_val <= on_cnt_val - 1;
		end if;
	end process adc_comb;

end behav;