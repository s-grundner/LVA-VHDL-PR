vlib work
vmap work work

vcom -work work pwm_e.vhd
vcom -work work pwm_a.vhd
vcom -work work pwm_tb.vhd

vsim work.pwm_tb

add wave -noupdate -color {Cyan} 			-label {CLK} 		/pwm_tb/tb_clk
add wave -noupdate -color {Red} 			-label {RST} 		/pwm_tb/tb_rst
add wave -noupdate -color {Medium Orchid} 	-label {Period} 	/pwm_tb/tb_Period_counter_val
add wave -noupdate -color {Lime Green} 		-label {Duty Cycle} /pwm_tb/tb_ON_counter_val
add wave -noupdate -color {Yellow} 			-label {PWM-Out} 	/pwm_tb/tb_PWM_pin
add wave -noupdate -color {Salmon} 			-label {Count} 		/pwm_tb/pwm_dut/count
add wave -noupdate -color {Orange} 			-label {Count RST Flag} /pwm_tb/pwm_dut/count_reset_flag

configure wave -namecolwidth 119
configure wave -valuecolwidth 48

run 2000 ns

WaveRestoreZoom {0 ps} {2000000 ps}	