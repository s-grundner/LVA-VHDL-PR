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

# Servo XYZ
add wave -noupdate -color {Cornflower Blue} -label {X Encoded Angle} -radix unsigned /tl_tb/tb_dut/servo_x_ent/encoded_angle_i
add wave -noupdate -color {Cornflower Blue} -label {Y Encoded Angle} -radix unsigned /tl_tb/tb_dut/servo_y_ent/encoded_angle_i
add wave -noupdate -color {Cornflower Blue} -label {Z Encoded Angle} -radix unsigned /tl_tb/tb_dut/servo_z_ent/encoded_angle_i
add wave -noupdate -color Orange -label {Accumulate Strobe} -radix decimal /tl_tb/tb_dut/cmd_proc_ent/accu_reg_dr_ent/accu_strb_i

# --- RUN SIMULATION ---

TreeUpdate [SetDefaultTree]

run 1300 ms

configure wave -namecolwidth 288
configure wave -valuecolwidth 75
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits us
update

WaveRestoreZoom {0 ps} {1350 ms}