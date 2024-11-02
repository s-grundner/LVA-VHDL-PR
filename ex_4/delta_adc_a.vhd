library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

architecture behav of delta_adc is

	constant MAX_COUNTER_VAL : unsigned(BITWIDTH-1 downto 0) := (others => '1');

	signal ON_counter_val : unsigned(BITWIDTH-1 downto 0) := (others => '0');
	signal sampling_strobe : std_ulogic := '0';
	signal prev_comp : std_logic := '0';

begin

	pwm_ent : entity work.pwm(behav)
		generic map (
			COUNTER_LEN => BITWIDTH
		)
		port map (
			clk_i => clk_i,
			rst_i => rst_i,
			Period_counter_val_i => MAX_COUNTER_VAL,
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

	adc_comb_proc : process(sampling_strobe, Comparator_i) is
	begin
		if sampling_strobe = '1' then
			if Comparator_i = '1' then
				ON_counter_val <= ON_counter_val + 1;
				prev_comp <= '1';
			else 
				ON_counter_val <= ON_counter_val - 1;
				prev_comp <= '0';
			end if;
		end if;
	end process adc_comb_proc;

	validate_comb_proc : process(Comparator_i, prev_comp) is
	begin
		if Comparator_i = not prev_comp then
			ADC_valid_strobe_o <= '1';
		else
			ADC_valid_strobe_o <= '0';
		end if;
	end process validate_comb_proc;

	seq_proc : process(clk_i, rst_i) is
	begin
		if rst_i = '1' then
			ADC_Value_o <= (others => '0');
		elsif rising_edge(clk_i) then
			ADC_Value_o <= ON_counter_val;
		end if;
	end process seq_proc;

end behav;