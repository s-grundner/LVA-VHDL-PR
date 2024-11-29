library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- entity

entity delta_adc is
	generic (
		ADC_RESOLUTION : natural := 8;
		SAMPLING_PSC : natural := 4;
		MAX_COUNTER_VAL : natural
	);
	port (
		clk_i				: in std_ulogic;
		rst_i				: in std_ulogic;
		PWM_o 				: out std_logic;
		ADC_valid_strobe_o 	: out std_ulogic := '0';
		ADC_Value_o 		: out unsigned(ADC_RESOLUTION-1 downto 0);
		Comparator_i 		: in std_logic
	);
end delta_adc;

-- architecture

architecture behav of delta_adc is


	signal ON_counter_val : unsigned(ADC_RESOLUTION-1 downto 0) := (others => '0');
	signal sampling_strobe : std_ulogic := '0';

	signal next_adc_valid_strobe : std_ulogic := '0';

begin

	pwm_ent : entity work.pwm(behav)
		generic map (
			COUNTER_LEN => ADC_RESOLUTION
		)
		port map (
			clk_i => clk_i,
			rst_i => rst_i,
			Period_counter_val_i => to_unsigned(MAX_COUNTER_VAL, ADC_RESOLUTION),
			ON_counter_val_i => ON_counter_val,
			PWM_o => PWM_o
		);
	
	sampling_strobe_ent : entity work.strb_generator(behav)
		generic map (
			PRESCALER => SAMPLING_PSC
		)
		port map (
			clk_i  => clk_i,
			rst_i  => rst_i,
			strb_o => sampling_strobe
		);

	reg_seq : process(clk_i, rst_i) is
	begin
		if rst_i = '1' then
			ADC_Value_o <= (others => '0');
		elsif rising_edge(clk_i) then
			ADC_Value_o <= ON_counter_val;
			ADC_Valid_strobe_o <= next_adc_valid_strobe;
		end if;
	end process reg_seq;

	adc_comb : process (sampling_strobe, Comparator_i) is
	begin
		if sampling_strobe = '1' then
			next_adc_valid_strobe <= '0';
			if Comparator_i = '1' then
				ON_counter_val <= ON_counter_val + 1;
			else 
				ON_counter_val <= ON_counter_val - 1;
			end if;
		end if;
		next_adc_valid_strobe <= '1';
	end process adc_comb;

end behav;