vlib work
vmap work work

vcom -work work ../packages/std_definitions.vhd
vcom -work work ../packages/Commands_p.vhd

vcom -work work ../accu_reg_ea.vhd
vcom -work work ../counter_ea.vhd
vcom -work work ../strb_generator_ea.vhd
vcom -work work ../CommandROM_ea.vhd
vcom -work work ../CommandProc_ea.vhd
vcom -work work ../pwm_ea.vhd
vcom -work work ../servo_ea.vhd
vcom -work work ../tl_ea.vhd

vcom -work work ../test/tl_tb.vhd

vsim work.tl_tb

# --- INSTERT WAVES ---

# Top Level

add wave -noupdate -group {TOP LEVEL} -radix unsigned /tl_tb/tb_dut/*
add wave -noupdate -group {CMD PROC} -radix unsigned /tl_tb/tb_dut/cmd_proc_ent/*
add wave -noupdate -group {CMD PROC DR} -radix decimal /tl_tb/tb_dut/cmd_proc_ent/accu_reg_dr_ent/*
add wave -noupdate -group {CMD PROC DTHETA} -radix decimal /tl_tb/tb_dut/cmd_proc_ent/accu_reg_dtheta_ent/*

add wave -noupdate -group {SERVO X} -radix unsigned /tl_tb/tb_dut/servo_x_ent/*
add wave -noupdate -group {SERVO Y} -radix unsigned /tl_tb/tb_dut/servo_y_ent/*
add wave -noupdate -group {SERVO Z} -radix unsigned /tl_tb/tb_dut/servo_z_ent/*

run 1000 ms

WaveRestoreZoom {0 ps} {200 ms}

configure wave -timelineunits us
configure wave -namecolwidth 339
configure wave -valuecolwidth 165