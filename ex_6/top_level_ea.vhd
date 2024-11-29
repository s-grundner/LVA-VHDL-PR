library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use ieee.math_real.all;

library work;
use work.servo_pkg.all;

-- entity

entity tilt_tl is
    port (
        clk_i            : in std_ulogic;
        rst_i            : in std_ulogic;

        axis_comp_i      : in std_ulogic;
        axis_servo_pwm_o : out std_ulogic;
        axis_adc_pwm_o   : out std_ulogic;

        seg_ones_o      : out  std_ulogic_vector (0 to 6);
        seg_tens_o      : out  std_ulogic_vector (0 to 6);
        seg_hundreds_o  : out  std_ulogic_vector (0 to 6)
    );
end tilt_tl;

-- architecture

architecture behav of tilt_tl is

    signal comp_sync : std_ulogic;

    signal adc_valid_strb : std_ulogic;
    signal adc_value : unsigned(ADC_RESOLUTION-1 downto 0);
    signal hold_value : unsigned(15 downto 0);
    
    signal servo_encoded_angle : unsigned(SERVO_RESOLUTION-1 downto 0);

    -- DISPLAY
    signal ones_bcd : std_ulogic_vector(3 downto 0);
    signal tens_bcd : std_ulogic_vector(3 downto 0);
    signal hundreds_bcd : std_ulogic_vector(3 downto 0);

begin

    sync_ent : entity work.sync(behav)
        generic map (
            N_DFF => 3
        )
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            sig_i => axis_comp_i,
            sig_o => comp_sync
        );


    adc_ent : entity work.delta_adc(behav)
        generic map (
            ADC_RESOLUTION => ADC_RESOLUTION,
            SAMPLING_PSC => ADC_SAMPLING_PSC,
            MAX_COUNTER_VAL => ADC_MAX_VAL
        )
        port map (
            clk_i        => clk_i,
            rst_i        => rst_i,
            Comparator_i => comp_sync,
            PWM_o        => axis_adc_pwm_o,
            ADC_valid_strobe_o => adc_valid_strb,
            ADC_Value_o  => adc_value
        );

    sample_hold_ent : entity work.sample_hold(behav)
        port map (
            clk_i        => clk_i,
            rst_i        => rst_i,
            strb_i       => adc_valid_strb,
            value_i      => adc_value,
            hold_value_o => hold_value
        );    

    tilt_ent : entity work.tilt(behav)
        port map (
            clk_i    => clk_i,
            rst_i    => rst_i,
            value_i  => hold_value,
            on_cnt_o => servo_encoded_angle
        );
        

    servo_ent : entity work.servo(behav)
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            encoded_angle_i => servo_encoded_angle,
            pwm_o => axis_servo_pwm_o
        );

    -- DISPLAY

    bin2bcd_ent : entity work.bin2bcd(rtl)
        port map (
            binary_i => std_ulogic_vector(hold_value),
            ones_o => ones_bcd,
            tens_o => tens_bcd,
            hundreds_o => hundreds_bcd
        );

    seg_ones_ent : entity work.bcd_to_7seg(rtl)
        port map (
            bcd_i => ones_bcd,
            LED_o => seg_ones_o
        );

    seg_tens_ent : entity work.bcd_to_7seg(rtl)
        port map (
            bcd_i => tens_bcd,
            LED_o => seg_tens_o
        );
    
    seg_hundreds_ent : entity work.bcd_to_7seg(rtl)
        port map (
            bcd_i => hundreds_bcd,
            LED_o => seg_hundreds_o
        );

end architecture behav;