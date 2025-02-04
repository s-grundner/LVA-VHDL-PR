vlib work
vmap work work

vcom -work work ../../packages/std_definitions.vhd
vcom -work work ../../packages/Commands_p.vhd

vcom -work work ../../entities/sync_ea.vhd
vcom -work work ../../entities/counter_ea.vhd
vcom -work work ../../entities/strb_generator_ea.vhd
vcom -work work ../../entities/debouncer_ea.vhd
vcom -work work ../../entities/clean_btn_ea.vhd
vcom -work work ../../entities/accu_reg_ea.vhd
vcom -work work ../../entities/bcd_to_7seg_ea.vhd
vcom -work work ../../entities/bin2bcd_ea.vhd
vcom -work work ../../entities/btn_ctrl_ea.vhd
vcom -work work ../../entities/btn2strb.vhd
vcom -work work ../../entities/cmd_rom_ea.vhd
vcom -work work ../../entities/cmd_proc_ea.vhd
vcom -work work ../../entities/pwm_ea.vhd
vcom -work work ../../entities/delta_adc_ea.vhd
vcom -work work ../../entities/moving_average_ea.vhd
vcom -work work ../../entities/sample_hold_ea.vhd
vcom -work work ../../entities/servo_ea.vhd
vcom -work work ../../entities/tilt_ea.vhd
vcom -work work ../../entities/tilt_axis_ea.vhd

vcom -work work ../tl_ea.vhd

vcom -work work ../test/tl_tb.vhd

vsim work.tl_tb

# --- INSTERT WAVES ---

# Top Level

add wave -r -noupdate -radix unsigned /tl_tb/tb_dut/*

run 1000 ms

WaveRestoreZoom {0 ps} {200 ms}

configure wave -timelineunits us
configure wave -namecolwidth 339
configure wave -valuecolwidth 165