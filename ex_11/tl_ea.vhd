library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

library work;
use work.std_definitions.all;

-- ENTITY

entity tl is
    port (
        clk_i : in std_ulogic;
        rst_i : in std_ulogic;

        sw_filter_en_async_i : in std_ulogic;
        sw_dgb_en_async_i    : in std_ulogic;
        sw_dbg_axis_async_i  : in std_ulogic;
        sw_z_axis_async_i    : in std_ulogic;
        btn_draw_k_async_i   : in std_ulogic;

        sw_mode_async_i : in std_ulogic; 
        btn_inc_async_i : in std_ulogic;
        btn_dec_async_i : in std_ulogic;

        x_comp_async_i : in std_ulogic;
        y_comp_async_i : in std_ulogic;

        x_adc_pwm_o : out std_ulogic;
        y_adc_pwm_o : out std_ulogic;

        x_servo_pwm_o : out std_ulogic;
        y_servo_pwm_o : out std_ulogic;
        z_servo_pwm_o : out std_ulogic;

        x_seg_ones_o     : out std_logic_vector (0 to 6);
        x_seg_tens_o     : out std_logic_vector (0 to 6);
        x_seg_hundreds_o : out std_logic_vector (0 to 6);
            
        y_seg_ones_o     : out std_logic_vector (0 to 6);
        y_seg_tens_o     : out std_logic_vector (0 to 6);
        y_seg_hundreds_o : out std_logic_vector (0 to 6)
    );
end tl;

-- ARCHITECTURE

architecture rtl of tl is

    -- Sync Signals
    signal filter_en_sync : std_ulogic := '0';
    signal dbg_en_sync    : std_ulogic := '0';
    signal dbg_axis_sync  : std_ulogic := '0';
    signal z_axis_sync    : std_ulogic := '0';
	signal draw_k_sync    : std_ulogic := '0';

    signal dbg_val : unsigned(ADC_RESOLUTION-1 downto 0) := (others => '0');
    signal dbg_valid_strb : std_ulogic := '0';

	signal x_angle, y_angle, z_angle : unsigned(SERVO_RESOLUTION-1 downto 0) := (others => '0');
    signal x_tilt_angle, y_tilt_angle, z_tilt_angle : unsigned(SERVO_RESOLUTION-1 downto 0) := (others => '0');
    signal x_cmd_angle, y_cmd_angle, z_cmd_angle    : unsigned(SERVO_RESOLUTION-1 downto 0) := (others => '0');
    signal processing, start_strb, next_start_strb  : std_ulogic := '0';
    signal x_dbg_valid_strb, y_dbg_valid_strb       : std_ulogic := '0';

begin

    -- SERVOS

    z_tilt_angle <= SERVO_MIN_ANGLE when z_axis_sync = '1' else SERVO_MAX_ANGLE;
    x_angle <= x_cmd_angle when processing = '1' else x_tilt_angle;
	y_angle <= y_cmd_angle when processing = '1' else y_tilt_angle;
	z_angle <= z_cmd_angle when processing = '1' else z_tilt_angle;

    servo_x_ent : entity work.servo(rtl)
    port map (
        clk_i   => clk_i,
        rst_i   => rst_i,
        angle_i => x_angle,
        pwm_o   => x_servo_pwm_o
    );

    servo_y_ent : entity work.servo(rtl)
    port map (
        clk_i   => clk_i,
        rst_i   => rst_i,
        angle_i => y_angle,
        pwm_o   => y_servo_pwm_o
    );

    servo_z_ent : entity work.servo(rtl)
    port map (
        clk_i   => clk_i,
        rst_i   => rst_i,
        angle_i => z_angle,
        pwm_o   => z_servo_pwm_o
    );

    -- BUTTONS
    
    btn_ctrl_ent : entity work.btn_ctrl(rtl)
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            sw_mode_async_i => sw_mode_async_i,
            btn_inc_async_i => btn_inc_async_i,
            btn_dec_async_i => btn_dec_async_i,
            dbg_val_o => dbg_val,
            dbg_valid_strb_o => dbg_valid_strb
        );

    -- TILT AXES

    x_dbg_valid_strb <= dbg_valid_strb and dbg_axis_sync;
    y_dbg_valid_strb <= dbg_valid_strb and not dbg_axis_sync;

    tilt_x : entity work.tilt_axis(rtl)
        port map (
            clk_i            => clk_i,
            rst_i            => rst_i,
            filter_en_i      => filter_en_sync,
            dbg_en_i         => dbg_en_sync,
            dbg_val_i        => dbg_val,
            dbg_valid_strb_i => x_dbg_valid_strb,
            axis_comp_i      => x_comp_async_i,
            axis_angle_o     => x_tilt_angle,
            axis_adc_pwm_o   => x_adc_pwm_o,
            seg_ones_o       => x_seg_ones_o,
            seg_tens_o       => x_seg_tens_o,
            seg_hundreds_o   => x_seg_hundreds_o
        );

    tilt_y : entity work.tilt_axis(rtl)
        port map (
            clk_i            => clk_i,
            rst_i            => rst_i,
            filter_en_i      => filter_en_sync,
            dbg_en_i         => dbg_en_sync,
            dbg_val_i        => dbg_val,
            dbg_valid_strb_i => y_dbg_valid_strb,
            axis_comp_i      => y_comp_async_i,
            axis_angle_o     => y_tilt_angle,
            axis_adc_pwm_o   => y_adc_pwm_o,
            seg_ones_o       => y_seg_ones_o,
            seg_tens_o       => y_seg_tens_o,
            seg_hundreds_o   => y_seg_hundreds_o
        );

    -- COMMAND PROCESSOR

    btn2strb : entity work.btn2strb(rtl)
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            btn_i => draw_k_sync,
            strb_o => start_strb
        );
            
    cmd_proc_ent : entity work.cmd_proc(rtl)
        generic map (
            D => 4
        )
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            start_strb_i => start_strb,
            drawing_o => processing,
            x_angle_o => x_cmd_angle,
            y_angle_o => y_cmd_angle,
            z_angle_o => z_cmd_angle
        );

    -- SYNCHRONIZERS

    dbg_axis_sync_ent : entity work.clean_btn(rtl)
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            btn_i => sw_dbg_axis_async_i,
            btn_o => dbg_axis_sync
        );

    sw_dbg_en_sync_ent : entity work.clean_btn(rtl)
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            btn_i => sw_dgb_en_async_i,
            btn_o => dbg_en_sync
        );

    z_axis_sync_ent : entity work.clean_btn(rtl)
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            btn_i => sw_z_axis_async_i,
            btn_o => z_axis_sync
        );

    btn_filter_en_sync_ent : entity work.clean_btn(rtl)
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            btn_i => sw_filter_en_async_i,
            btn_o => filter_en_sync
        );

    btn_k_sync_ent : entity work.clean_btn(rtl)
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            btn_i => btn_draw_k_async_i,
            btn_o => draw_k_sync
        );

end architecture rtl;