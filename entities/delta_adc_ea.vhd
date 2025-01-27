library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 


library work;
use work.std_definitions.all;

-- entity

entity delta_adc is
    port (
        clk_i			 : in std_ulogic;
        rst_i			 : in std_ulogic;

        dbg_en_i         : in std_ulogic := '0';
        dbg_valid_strb_i : in std_ulogic := '0';
        dbg_val_i        : in unsigned(ADC_RESOLUTION-1 downto 0);

        pwm_o 			 : out std_logic  := '0';
        adc_valid_strb_o : out std_ulogic := '0';
        adc_val_o 		 : out unsigned(ADC_RESOLUTION-1 downto 0);
        comp_i 		     : in std_logic := '0'
    );
end delta_adc;

-- DEBUG ARCHITECTURE

architecture debug_rtl of delta_adc is

    signal on_cnt_val, next_on_cnt_val : unsigned(ADC_RESOLUTION-1 downto 0);
    signal sampling_strb       : std_ulogic := '0';
    signal next_adc_valid_strb : std_ulogic := '0';

begin 

    adc_valid_strb_o <= next_adc_valid_strb;

    reg_seq : process(clk_i, rst_i) is
    begin
        if rst_i = '1' then
            on_cnt_val <= (others => '0');
            adc_val_o <= (others => '0');
            next_adc_valid_strb <= '0';
        elsif rising_edge(clk_i) then
            on_cnt_val <= next_on_cnt_val;
            adc_val_o <= next_on_cnt_val;
            next_adc_valid_strb <= sampling_strb;
        end if;
    end process reg_seq;

    adc_comb : process(on_cnt_val, dbg_val_i, dbg_valid_strb_i, dbg_en_i, sampling_strb, comp_i) is
    begin
        next_on_cnt_val	<= on_cnt_val;
        if dbg_en_i = '1' and dbg_valid_strb_i = '1' then
            next_on_cnt_val <= dbg_val_i;
        elsif dbg_en_i = '0' and sampling_strb = '1' then
            next_on_cnt_val <= on_cnt_val - 1;
            if comp_i = '1' then
                next_on_cnt_val <= on_cnt_val + 1;
            end if;
        end if;
    end process adc_comb;
    
    pwm_ent : entity work.pwm(rtl)
        generic map (
            CNT_LEN => ADC_RESOLUTION
        )
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            period_cnt_val_i => ADC_MAX_VAL,
            on_cnt_val_i => on_cnt_val,
            pwm_o => pwm_o
        );
    
    sampling_strb_ent : entity work.strb_generator(rtl)
        generic map (
            PRESCALER => ADC_SAMPLING_PSC
        )
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            sync_rst_i => '0',
            strb_o => sampling_strb
        );

end debug_rtl;