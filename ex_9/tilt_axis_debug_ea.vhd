library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

library work;
use work.std_definitions.all;

-- entity

entity tilt_axis is
    port (
        clk_i            : in std_ulogic;
        rst_i            : in std_ulogic;

        sw_mode_i        : in std_ulogic;
        btn_inc_i        : in std_ulogic;
        btn_dec_i        : in std_ulogic;

        axis_comp_i      : in std_ulogic;
        axis_servo_pwm_o : out std_ulogic;
        axis_adc_pwm_o   : out std_ulogic;

        seg_ones_o       : out std_ulogic_vector (0 to 6);
        seg_tens_o       : out std_ulogic_vector (0 to 6);
        seg_hundreds_o   : out std_ulogic_vector (0 to 6)
    );
end tilt_axis;

-- architecture

architecture behav of tilt_axis is

    signal adc_val        : unsigned(ADC_RESOLUTION-1 downto 0) := (others => '0');
    signal adc_valid_strb : std_ulogic := '0';
    signal comp_sync      : std_ulogic := '0';
    signal hold_val       : unsigned(15 downto 0) := (others => '0');
    signal encoded_angle  : unsigned(SERVO_RESOLUTION-1 downto 0) := to_unsigned(SERVO_MIN_ANGLE, SERVO_RESOLUTION);

    -- DISPLAY
    signal ones_bcd, tens_bcd, hundreds_bcd : std_ulogic_vector(3 downto 0);

begin

    btn_ctrl_ent : entity work.btn_ctrl(behav)
        port map (
            clk_i            => clk_i,
            rst_i            => rst_i,
            sw_mode_i        => sw_mode_i,
            btn_inc_i        => btn_inc_i,
            btn_dec_i        => btn_dec_i,
            adc_val_o        => adc_val,
            adc_valid_strb_o => adc_valid_strb
        );

    adc_debug_ent : entity work.delta_adc_debug(behav)
        generic map (
            ADC_RESOLUTION => ADC_RESOLUTION,
            SAMPLING_PSC   => ADC_SAMPLING_PSC,
            MAX_CNT_VAL    => ADC_MAX_VAL
        )
        port map (
            clk_i  => clk_i,
            rst_i  => rst_i,
            comp_i => comp_sync,
            pwm_o  => axis_adc_pwm_o,
            adc_debug_i   => adc_val,
            adc_in_strb_i => adc_valid_strb
        );

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

    sample_hold_ent : entity work.sample_hold(behav)
        port map (
            clk_i      => clk_i,
            rst_i      => rst_i,
            strb_i     => adc_valid_strb,
            val_i      => adc_val,
            hold_val_o => hold_val
        );    

    tilt_ent : entity work.tilt(behav)
        port map (
            clk_i   => clk_i,
            rst_i   => rst_i,
            adc_i => hold_val,
            angle_o => encoded_angle
        );
        

    servo_ent : entity work.servo(behav)
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            encoded_angle_i => encoded_angle,
            pwm_o => axis_servo_pwm_o
        );

    -- DISPLAY

    bin2bcd_ent : entity work.bin2bcd(behav)
        port map (
            binary_i => std_ulogic_vector(hold_val),
            ones_o => ones_bcd,
            tens_o => tens_bcd,
            hundreds_o => hundreds_bcd
        );

    seg_ones_ent : entity work.bcd_to_7seg(behav)
        port map (
            bcd_i => ones_bcd,
            led_o => seg_ones_o
        );

    seg_tens_ent : entity work.bcd_to_7seg(behav)
        port map (
            bcd_i => tens_bcd,
            led_o => seg_tens_o
        );
    
    seg_hundreds_ent : entity work.bcd_to_7seg(behav)
        port map (
            bcd_i => hundreds_bcd,
            led_o => seg_hundreds_o
        );

end architecture behav;