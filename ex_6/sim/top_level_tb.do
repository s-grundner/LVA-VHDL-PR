vlib work
vmap work work

vcom -work work ../packages/std_definitions.vhd
vcom -work work ../packages/servo_pkg.vhd

vcom -work work ../bcd_to_7seg_ea.vhd
vcom -work work ../bin2bcd_ea.vhd

vcom -work work ../counter_ea.vhd
vcom -work work ../pwm_ea.vhd
vcom -work work ../strb_generator_ea.vhd
vcom -work work ../delta_adc_ea.vhd
vcom -work work ../sample_hold_ea.vhd
vcom -work work ../servo_ea.vhd
vcom -work work ../sync_ea.vhd
vcom -work work ../tilt_ea.vhd
vcom -work work ../top_level_ea.vhd

vcom -work work ../test/top_level_tb.vhd

vsim work.top_level_tb


add wave -noupdate -label CLK /top_level_tb/clk_tb
add wave -noupdate -label RST /top_level_tb/rst_tb
add wave -noupdate -label {Comparator Feedback} /top_level_tb/top_level_dut/axis_comp_i

add wave -noupdate -expand -group ADC -color Orange -label {ADC PWM} /top_level_tb/top_level_dut/axis_adc_pwm_o
add wave -noupdate -expand -group ADC -color Orange -label {ADC PWM Period}        -radix unsigned /top_level_tb/top_level_dut/adc_ent/pwm_ent/Period_counter_val_i
add wave -noupdate -expand -group ADC -color Orange -label {ADC Value}             -radix unsigned /top_level_tb/top_level_dut/adc_value
add wave -noupdate -expand -group ADC -color Orange -label {ADC PWM CNT}           -radix unsigned /top_level_tb/top_level_dut/adc_ent/pwm_ent/counter_ent/counter_o
add wave -noupdate -expand -group ADC -color Orange -label {ADC Prescaler Counter} -radix unsigned /top_level_tb/top_level_dut/adc_ent/sampling_strobe_ent/strb_counter
add wave -noupdate -expand -group ADC -color Orange -label {ADC Valid Strobe} /top_level_tb/top_level_dut/adc_ent/ADC_valid_strobe_o
add wave -noupdate -expand -group ADC -color Orange -label {ADC Sampling Strobe} /top_level_tb/top_level_dut/adc_ent/sampling_strobe

add wave -noupdate -expand -group Servo -color {Cornflower Blue} -label {Servo PWM} /top_level_tb/top_level_dut/axis_servo_pwm_o
add wave -noupdate -expand -group Servo -color {Cornflower Blue} -label {Servo Encoded Angle}   -radix unsigned /top_level_tb/top_level_dut/servo_encoded_angle
add wave -noupdate -expand -group Servo -color {Cornflower Blue} -label {Servo PWM Period}      -radix unsigned /top_level_tb/top_level_dut/servo_ent/pwm_ent/Period_counter_val_i
add wave -noupdate -expand -group Servo -color {Cornflower Blue} -label {Current Servo On-Time} -radix unsigned /top_level_tb/top_level_dut/servo_ent/pwm_ent/ON_counter_val_i

add wave -noupdate -expand -group {Comparator Input} -label {Comparator Feedback (Sync)} /top_level_tb/top_level_dut/comp_sync
add wave -noupdate -expand -group {Comparator Input} -label {Comp Sync Chain} /top_level_tb/top_level_dut/sync_ent/sync_chain
add wave -noupdate -expand -group {Comparator Input} -label {Comp Next Sync Chain} /top_level_tb/top_level_dut/sync_ent/next_sync_chain

add wave -noupdate -group DISPLAY /top_level_tb/top_level_dut/bin2bcd_ent/binary_i
add wave -noupdate -group DISPLAY /top_level_tb/top_level_dut/bin2bcd_ent/ones_o
add wave -noupdate -group DISPLAY /top_level_tb/top_level_dut/bin2bcd_ent/tens_o
add wave -noupdate -group DISPLAY /top_level_tb/top_level_dut/bin2bcd_ent/hundreds_o
add wave -noupdate -group DISPLAY /top_level_tb/top_level_dut/bin2bcd_ent/thousands_o
add wave -noupdate -group DISPLAY /top_level_tb/top_level_dut/bin2bcd_ent/tenthousands_o
add wave -noupdate -group DISPLAY /top_level_tb/top_level_dut/seg_ones_ent/bcd_i
add wave -noupdate -group DISPLAY /top_level_tb/top_level_dut/seg_ones_ent/LED_o
add wave -noupdate -group DISPLAY /top_level_tb/top_level_dut/seg_tens_ent/bcd_i
add wave -noupdate -group DISPLAY /top_level_tb/top_level_dut/seg_tens_ent/LED_o
add wave -noupdate -group DISPLAY /top_level_tb/top_level_dut/seg_hundreds_ent/bcd_i
add wave -noupdate -group DISPLAY /top_level_tb/top_level_dut/seg_hundreds_ent/LED_o

run 50 ms

WaveRestoreZoom {0 ps} {50 ms}

configure wave -timelineunits us
update