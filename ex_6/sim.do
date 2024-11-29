vlib work
vmap work work

vcom -work work bcd_to_7seg_ea.vhd
vcom -work work bin2bcd_ea.vhd
vcom -work work servo_pkg.vhd

vcom -work work counter_ea.vhd
vcom -work work pwm_ea.vhd
vcom -work work strb_generator_ea.vhd
vcom -work work delta_adc_ea.vhd
vcom -work work sample_hold_ea.vhd
vcom -work work servo_ea.vhd
vcom -work work sync_ea.vhd
vcom -work work tilt_ea.vhd
vcom -work work top_level_ea.vhd
vcom -work work top_level_tb.vhd
# vcom -work work sample_hold_tb.vhd
# vcom -work work tilt_tb.vhd

vsim work.top_level_tb

add wave -r *

run 50 ms

WaveRestoreZoom {0 ps} {5000000 ps}	