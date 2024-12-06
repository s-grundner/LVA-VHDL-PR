library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use ieee.math_real.all;

library work;
use work.servo_pkg.all;

-- entity

entity tilt_axis is
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
end tilt_axis;

-- architecture

architecture behav of tilt_axis is

    signal comp_sync : std_ulogic;

    
    signal adc_value : unsigned(ADC_RESOLUTION-1 downto 0);
    signal adc_valid_strb : std_ulogic;
    signal adc_value_filter : unsigned(ADC_RESOLUTION-1 downto 0);
    signal adc_valid_strb_filter : std_ulogic;

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

    mov_avg_ent : entity work.moving_average_filter(behav)
        generic map (
            N => 8,
            BITWIDTH => ADC_RESOLUTION
        )
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            data_i => adc_value,
            data_o => adc_value_filter,
            strb_data_valid_i => adc_valid_strb,
            strb_data_valid_o => adc_valid_strb_filter
        );

    sample_hold_ent : entity work.sample_hold(behav)
        port map (
            clk_i        => clk_i,
            rst_i        => rst_i,
            strb_i       => adc_valid_strb_filter,
            value_i      => adc_value_filter,
            hold_value_o => hold_value
        );    

    tilt_ent : entity work.tilt(behav)
        port map (
            clk_i   => clk_i,
            rst_i   => rst_i,
            value_i => hold_value,
            angle_o => servo_encoded_angle
        );
        

    servo_ent : entity work.servo(behav)
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            encoded_angle_i => servo_encoded_angle,
            PWM_o => axis_servo_pwm_o
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