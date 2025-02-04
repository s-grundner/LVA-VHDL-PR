library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use ieee.math_real.all;

library work;
use work.std_definitions.all;

-- entity

entity tilt_axis is
    port (
        clk_i            : in std_ulogic;
        rst_i            : in std_ulogic;

        filter_en_i      : in std_ulogic;
        dbg_en_i         : in std_ulogic;
        dbg_valid_strb_i : in std_ulogic;
        dbg_val_i        : in unsigned(ADC_RESOLUTION-1 downto 0);

        axis_comp_i    : in std_ulogic;
        axis_adc_pwm_o : out std_ulogic;
        axis_angle_o   : out unsigned(SERVO_RESOLUTION-1 downto 0);

        seg_ones_o     : out std_logic_vector (0 to 6);
        seg_tens_o     : out std_logic_vector (0 to 6);
        seg_hundreds_o : out std_logic_vector (0 to 6)
    );
end tilt_axis;

-- architecture

architecture rtl of tilt_axis is

    signal adc_valid_strb, adc_valid_strb_filter : std_ulogic := '0';
    signal adc_val, adc_val_filter : unsigned(ADC_RESOLUTION-1 downto 0) := (others => '0');
    signal comp_sync : std_ulogic := '0';
    signal hold_val  : unsigned(ADC_RESOLUTION-1 downto 0) := (others => '0');
    signal ones_bcd, tens_bcd, hundreds_bcd : std_ulogic_vector(3 downto 0);
    signal hold_val_bcd : std_ulogic_vector(15 downto 0);

begin

    comp_sync_ent : entity work.sync(rtl)
        generic map (
            N_DFF => DEFAULT_N_SYNC_DFF
        )
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            sig_i => axis_comp_i,
            sig_o => comp_sync
        );

    adc_ent : entity work.delta_adc(debug_rtl)
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            dbg_en_i  => dbg_en_i,
            dbg_val_i => dbg_val_i,
            dbg_valid_strb_i => dbg_valid_strb_i,
            comp_i    => comp_sync,
            pwm_o     => axis_adc_pwm_o,
            adc_val_o => adc_val, 
            adc_valid_strb_o => adc_valid_strb
        );

    -- FILTER

    mov_avg_ent : entity work.moving_average_filter(rtl)
        generic map (
            N => FILTER_ORDER,
            BITWIDTH => ADC_RESOLUTION
        )
        port map (
            clk_i  => clk_i,
            rst_i  => rst_i,
            data_i => adc_val,
            data_o => adc_val_filter,
            filter_en_i => filter_en_i,
            strb_data_valid_i => adc_valid_strb,
            strb_data_valid_o => adc_valid_strb_filter
        );

    sample_hold_ent : entity work.sample_hold(rtl)
        port map (
            clk_i  => clk_i,
            rst_i  => rst_i,
            strb_i => adc_valid_strb_filter,
            val_i  => adc_val_filter,
            hold_val_o => hold_val
        );    

    tilt_ent : entity work.tilt(rtl)
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            adc_i => hold_val,
            angle_o => axis_angle_o
        );
        
    -- DISPLAY

    hold_val_bcd <= std_ulogic_vector(resize(hold_val, 16));

    bin2bcd_ent : entity work.bin2bcd(rtl)
        port map (
            binary_i => hold_val_bcd,
            ones_o   => ones_bcd,
            tens_o   => tens_bcd,
            hundreds_o => hundreds_bcd
        );

    seg_ones_ent : entity work.bcd_to_7seg(rtl)
        port map (
            bcd_i => ones_bcd,
            led_o => seg_ones_o
        );

    seg_tens_ent : entity work.bcd_to_7seg(rtl)
        port map (
            bcd_i => tens_bcd,
            led_o => seg_tens_o
        );
    
    seg_hundreds_ent : entity work.bcd_to_7seg(rtl)
        port map (
            bcd_i => hundreds_bcd,
            led_o => seg_hundreds_o
        );

end architecture rtl;