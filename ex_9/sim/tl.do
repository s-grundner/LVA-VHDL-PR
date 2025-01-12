vlib work
vmap work work

vcom -work work ../../packages/std_definitions.vhd

vcom -work work ../../entities/bcd_to_7seg_ea.vhd
vcom -work work ../../entities/bin2bcd_ea.vhd

vcom -work work ../../entities/counter_ea.vhd
vcom -work work ../../entities/pwm_ea.vhd
vcom -work work ../../entities/strb_generator_ea.vhd
vcom -work work ../../entities/sample_hold_ea.vhd
vcom -work work ../../entities/servo_ea.vhd
vcom -work work ../../entities/sync_ea.vhd
vcom -work work ../../entities/tilt_ea.vhd

vcom -work work ../btn_ctrl_ea.vhd
vcom -work work ../delta_adc_debug_ea.vhd
vcom -work work ../tilt_axis_debug_ea.vhd
vcom -work work ../tl_ea.vhd

vcom -work work ../test/tl_tb.vhd
vsim work.tl_tb

# --- INSTERT WAVES ---

# Top Level
add wave -noupdate -expand -group TL-DUT -color {Cornflower Blue} -label CLK /tl_tb/tl_dut/clk_i
add wave -noupdate -expand -group TL-DUT -color {Cornflower Blue} -label RST /tl_tb/tl_dut/rst_i
add wave -noupdate -expand -group TL-DUT -color {Lime} -label {X Comp In} /tl_tb/tl_dut/x_comp_i
add wave -noupdate -expand -group TL-DUT -color {Lime} -label {Y Comp In} /tl_tb/tl_dut/y_comp_i
add wave -noupdate -expand -group TL-DUT -color {Cornflower Blue} -label {X ADC PWM} /tl_tb/tl_dut/x_adc_pwm_o
add wave -noupdate -expand -group TL-DUT -color {Cornflower Blue} -label {Y ADC PWM} /tl_tb/tl_dut/y_adc_pwm_o

add wave -noupdate -expand -group TL-DUT -group DISPLAY -color {Violet Red} -radix hexadecimal /tl_tb/tl_dut/x_seg_ones_o
add wave -noupdate -expand -group TL-DUT -group DISPLAY -color {Violet Red} -radix hexadecimal /tl_tb/tl_dut/x_seg_tens_o
add wave -noupdate -expand -group TL-DUT -group DISPLAY -color {Violet Red} -radix hexadecimal /tl_tb/tl_dut/x_seg_hundreds_o
add wave -noupdate -expand -group TL-DUT -group DISPLAY -color {Violet Red} -radix hexadecimal /tl_tb/tl_dut/y_seg_ones_o
add wave -noupdate -expand -group TL-DUT -group DISPLAY -color {Violet Red} -radix hexadecimal /tl_tb/tl_dut/y_seg_tens_o
add wave -noupdate -expand -group TL-DUT -group DISPLAY -color {Violet Red} -radix hexadecimal /tl_tb/tl_dut/y_seg_hundreds_o

# X-Axis
add wave -noupdate -expand -group X-Axis -color Cyan -label {ADC Valid Strobe} /tl_tb/tl_dut/tilt_x/adc_valid_strb
add wave -noupdate -expand -group X-Axis -color Cyan -label {ADC Value} -radix unsigned /tl_tb/tl_dut/tilt_x/adc_val
add wave -noupdate -expand -group X-Axis -color {Cornflower Blue} -label Holdvalue -radix unsigned /tl_tb/tl_dut/tilt_x/hold_val
add wave -noupdate -expand -group X-Axis -color {Cornflower Blue} -label {Current Servo Period} -radix unsigned /tl_tb/tl_dut/tilt_x/servo_ent/on_cnt_val

# Y-Axis
add wave -noupdate -expand -group Y-Axis -color Salmon -label {ADC Valid Strobe} /tl_tb/tl_dut/tilt_y/adc_valid_strb
add wave -noupdate -expand -group Y-Axis -color Salmon -label {ADC Value} -radix unsigned /tl_tb/tl_dut/tilt_y/adc_val
add wave -noupdate -expand -group Y-Axis -color {Orange Red} -label Holdvalue -radix unsigned /tl_tb/tl_dut/tilt_y/hold_val
add wave -noupdate -expand -group Y-Axis -color {Orange Red} -label {Current Servo Period} -radix unsigned /tl_tb/tl_dut/tilt_y/servo_ent/on_cnt_val

# Buttons

add wave -noupdate -expand -group Buttons -color {Lime} -label {Inc} /tl_tb/tl_dut/btn_inc_i
add wave -noupdate -expand -group Buttons -color {Lime} -label {Dec} /tl_tb/tl_dut/btn_dec_i

add wave -noupdate -expand -group Buttons -color {Lime} -label {Axis (0 X, 1Y)} /tl_tb/tl_dut/sw_axis_i
add wave -noupdate -expand -group Buttons -color {Lime} -label {Mode (1 UP, 0 DN)} /tl_tb/tl_dut/sw_mode_i

add wave -noupdate -expand -group Buttons -color {Lime} -label {X Inc} /tl_tb/tl_dut/tilt_x/btn_inc_i
add wave -noupdate -expand -group Buttons -color {Lime} -label {X Dec} /tl_tb/tl_dut/tilt_x/btn_dec_i

add wave -noupdate -expand -group Buttons -color {Lime} -label {Y Inc} /tl_tb/tl_dut/tilt_y/btn_inc_i
add wave -noupdate -expand -group Buttons -color {Lime} -label {Y Dec} /tl_tb/tl_dut/tilt_y/btn_dec_i

# ---

run 50 ms

WaveRestoreZoom {0 ps} {50 ms}

configure wave -timelineunits us
configure wave -namecolwidth 339
configure wave -valuecolwidth 165