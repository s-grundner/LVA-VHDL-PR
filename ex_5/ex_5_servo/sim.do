vlib work
vmap work work

vcom -work work counter_ea.vhd
vcom -work work pwm_ea.vhd
vcom -work work servo_ea.vhd
vcom -work work servo_tb.vhd

vsim work.servo_tb

add wave -noupdate -label CLK /servo_tb/tb_clk
add wave -noupdate -color Red -label RST /servo_tb/tb_rst
add wave -noupdate -color Gold -label Angle -radix unsigned /servo_tb/tb_encoded_angle
add wave -noupdate -label PWM /servo_tb/tb_pwm
add wave -noupdate -label {PWM Period} -radix unsigned /servo_tb/servo_dut/pwm_ent/Period_counter_val_i
add wave -noupdate -label {PWM DutyCycle} -radix unsigned /servo_tb/servo_dut/pwm_ent/ON_counter_val_i

run 40 ms

WaveRestoreCursors {{Cursor 1} {20000110000 ps} 0} {{Cursor 2} {21000110000 ps} 0}

WaveRestoreZoom {0 ps} {34726060490 ps}