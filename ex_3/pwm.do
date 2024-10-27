vlib work
vmap work work

vcom -work work pwm_e.vhd
vcom -work work pwm_a.vhd
vcom -work work pwm_tb.vhd

vsim work.pwm_tb

add wave -noupdate /pwm_tb/tb_clk
add wave -noupdate /pwm_tb/tb_rst
add wave -noupdate /pwm_tb/tb_Period_counter_val
add wave -noupdate /pwm_tb/tb_ON_counter_val
add wave -noupdate /pwm_tb/tb_PWM_pin
add wave -noupdate /pwm_tb/pwm_dut/count
add wave -noupdate /pwm_tb/pwm_dut/count_reset_flag

configure wave -namecolwidth 238
configure wave -valuecolwidth 169

run 2000 ns

WaveRestoreZoom {0 ps} {2000000 ps}	