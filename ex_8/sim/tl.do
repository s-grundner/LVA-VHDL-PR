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
add wave -noupdate -expand -group {TOP LEVEL} -label CLK -radix binary /tl_tb/tb_dut/clk_i
add wave -noupdate -expand -group {TOP LEVEL} -label RST -radix binary /tl_tb/tb_dut/rst_i
add wave -noupdate -expand -group {TOP LEVEL} -label {X Servo PWM} -radix binary /tl_tb/tb_dut/x_servo_pwm_o
add wave -noupdate -expand -group {TOP LEVEL} -label {Y Servo PWM} -radix binary /tl_tb/tb_dut/y_servo_pwm_o
add wave -noupdate -expand -group {TOP LEVEL} -label {Z Servo PWM} -radix binary /tl_tb/tb_dut/z_servo_pwm_o
add wave -noupdate -expand -group {TOP LEVEL} -label {Start Strobe} -radix binary /tl_tb/tb_dut/start_strb_i
add wave -noupdate -expand -group {TOP LEVEL} -label Drawing -radix binary /tl_tb/tb_dut/drawing_o
add wave -noupdate -expand -group {TOP LEVEL} -label {X Servo On Counter Val} -radix unsigned /tl_tb/tb_dut/x_servo
add wave -noupdate -expand -group {TOP LEVEL} -label {Y Servo On Counter Val} -radix unsigned /tl_tb/tb_dut/y_servo
add wave -noupdate -expand -group {TOP LEVEL} -label {Y Servo On Counter Val} -radix unsigned /tl_tb/tb_dut/z_servo

# Command Processor
add wave -noupdate -expand -group {CMD PROC} -color {Dark Orchid} -label CLK -radix binary /tl_tb/tb_dut/cmd_proc_ent/clk_i
add wave -noupdate -expand -group {CMD PROC} -color {Dark Orchid} -label {FSM State} -radix unsigned /tl_tb/tb_dut/cmd_proc_ent/fsm_state
add wave -noupdate -expand -group {CMD PROC} -color {Dark Orchid} -label {Current Address} -radix unsigned /tl_tb/tb_dut/cmd_proc_ent/curr_addr
add wave -noupdate -expand -group {CMD PROC} -color {Dark Orchid} -label {Current CMD (dTheta and dR concatenated)} -radix unsigned /tl_tb/tb_dut/cmd_proc_ent/curr_cmd
add wave -noupdate -expand -group {CMD PROC} -color {Dark Orchid} -label {Next Move Strobe (20ms Period)} -radix unsigned /tl_tb/tb_dut/cmd_proc_ent/next_move_strb
add wave -noupdate -expand -group {CMD PROC} -color {Dark Orchid} -label {Next Move Strobe Gen: Sync Reset} -radix unsigned /tl_tb/tb_dut/cmd_proc_ent/sync_rst
add wave -noupdate -expand -group {CMD PROC} -color {Dark Orchid} -label dx -radix decimal /tl_tb/tb_dut/cmd_proc_ent/dx
add wave -noupdate -expand -group {CMD PROC} -color {Dark Orchid} -label dy -radix decimal /tl_tb/tb_dut/cmd_proc_ent/dy

# Command Processor: Delta R Accumulator
add wave -noupdate -expand -group {CMD PROC DR} -color Orange -label CLK -radix binary /tl_tb/tb_dut/cmd_proc_ent/accu_reg_dr_ent/clk_i
add wave -noupdate -expand -group {CMD PROC DR} -color Orange -label {Accumulate Strobe} -radix decimal /tl_tb/tb_dut/cmd_proc_ent/accu_reg_dr_ent/accu_strb_i
add wave -noupdate -expand -group {CMD PROC DR} -color Orange -label {Radius Data In (From ROM)} -radix decimal /tl_tb/tb_dut/cmd_proc_ent/accu_reg_dr_ent/data_i
add wave -noupdate -expand -group {CMD PROC DR} -color Orange -label {Radius Data Out (Summed and Divided)} -radix decimal /tl_tb/tb_dut/cmd_proc_ent/accu_reg_dr_ent/data_o
add wave -noupdate -expand -group {CMD PROC DR} -color Orange -label {Current Radius Sum} -radix decimal /tl_tb/tb_dut/cmd_proc_ent/accu_reg_dr_ent/sum

# Command Processor: Delta Theta Accumulator
add wave -noupdate -expand -group {CMD PROC DTHETA} -color Orange -label CLK -radix binary /tl_tb/tb_dut/cmd_proc_ent/accu_reg_dtheta_ent/clk_i
add wave -noupdate -expand -group {CMD PROC DTHETA} -color Orange -label {Accumulate Strobe} -radix decimal /tl_tb/tb_dut/cmd_proc_ent/accu_reg_dtheta_ent/accu_strb_i
add wave -noupdate -expand -group {CMD PROC DTHETA} -color Orange -label {Theta Data In (From ROM)} -radix decimal /tl_tb/tb_dut/cmd_proc_ent/accu_reg_dtheta_ent/data_i
add wave -noupdate -expand -group {CMD PROC DTHETA} -color Orange -label {Theta Data Out (Summed and Divided)} -radix decimal /tl_tb/tb_dut/cmd_proc_ent/accu_reg_dtheta_ent/data_o
add wave -noupdate -expand -group {CMD PROC DTHETA} -color Orange -label {Current Theta Sum} -radix decimal /tl_tb/tb_dut/cmd_proc_ent/accu_reg_dtheta_ent/sum

# Servo XYZ
add wave -noupdate -expand -group {SERVO X} -color {Cornflower Blue} -label CLK -radix binary /tl_tb/tb_dut/servo_x_ent/clk_i
add wave -noupdate -expand -group {SERVO X} -color {Cornflower Blue} -label {Encoded Angle} -radix unsigned /tl_tb/tb_dut/servo_x_ent/encoded_angle_i
add wave -noupdate -expand -group {SERVO X} -color {Cornflower Blue} -label PWM -radix binary /tl_tb/tb_dut/servo_x_ent/pwm_o
add wave -noupdate -expand -group {SERVO X} -color {Cornflower Blue} -label {On Counter Val} -radix unsigned /tl_tb/tb_dut/servo_x_ent/ON_counter_val
add wave -noupdate -expand -group {SERVO Y} -color {Cornflower Blue} -label CLK -radix binary /tl_tb/tb_dut/servo_y_ent/clk_i
add wave -noupdate -expand -group {SERVO Y} -color {Cornflower Blue} -label {Encoded Angle} -radix unsigned /tl_tb/tb_dut/servo_y_ent/encoded_angle_i
add wave -noupdate -expand -group {SERVO Y} -color {Cornflower Blue} -label PWM -radix binary /tl_tb/tb_dut/servo_y_ent/pwm_o
add wave -noupdate -expand -group {SERVO Y} -color {Cornflower Blue} -label {On Counter Val} -radix unsigned /tl_tb/tb_dut/servo_y_ent/ON_counter_val
add wave -noupdate -expand -group {SERVO Z} -color {Cornflower Blue} -label CLK -radix binary /tl_tb/tb_dut/servo_z_ent/clk_i
add wave -noupdate -expand -group {SERVO Z} -color {Cornflower Blue} -label {Encoded Angle} -radix unsigned /tl_tb/tb_dut/servo_z_ent/encoded_angle_i
add wave -noupdate -expand -group {SERVO Z} -color {Cornflower Blue} -label PWM -radix binary /tl_tb/tb_dut/servo_z_ent/pwm_o
add wave -noupdate -expand -group {SERVO Z} -color {Cornflower Blue} -label {On Counter Val} -radix unsigned /tl_tb/tb_dut/servo_z_ent/ON_counter_val

# ROM
add wave -noupdate -expand -group {ROM} -color {Dark Olive Green} -label CLK -radix binary /tl_tb/tb_dut/cmd_proc_ent/rom_ent/ROMMEM

# --- RUN SIMULATION ---

TreeUpdate [SetDefaultTree]

run 500 ms

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

WaveRestoreZoom {0 ps} {550 ms}