vlib work
vmap work work

vcom -work work ${workspaceFolder}/packages/std_definitions.vhd
vcom -work work ${workspaceFolder}/packages/bcd_to_7seg_ea.vhd
vcom -work work ${workspaceFolder}/packages/bin2bcd_ea.vhd
vcom -work work ${workspaceFolder}/packages/servo_pkg.vhd

vcom -work work ${workspaceFolder}/counter_ea.vhd
vcom -work work ${workspaceFolder}/pwm_ea.vhd
vcom -work work ${workspaceFolder}/strb_generator_ea.vhd
vcom -work work ${workspaceFolder}/delta_adc_ea.vhd
vcom -work work ${workspaceFolder}/sample_hold_ea.vhd
vcom -work work ${workspaceFolder}/servo_ea.vhd
vcom -work work ${workspaceFolder}/sync_ea.vhd
vcom -work work ${workspaceFolder}/moving_average_ea.vhd
vcom -work work ${workspaceFolder}/tilt_ea.vhd
vcom -work work ${workspaceFolder}/tilt_axis_ea.vhd
vcom -work work ${workspaceFolder}/top_level_ea.vhd

vcom -work work ${workspaceFolder}/test/top_level_tb.vhd

vsim work.top_level_tb

add wave -r *

run 50 ms

WaveRestoreZoom {0 ps} {50 ms}

configure wave -timelineunits us
update