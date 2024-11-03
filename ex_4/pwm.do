vlib work
vmap work work

vcom -work work counter_e.vhd
vcom -work work counter_a.vhd
vcom -work work pwm_e.vhd
vcom -work work pwm_a.vhd
vcom -work work pwm_tb.vhd

vsim work.pwm_tb

add wave -noupdate -label {CLK} 		-color {Cyan} 			/pwm_tb/tb_clk
add wave -noupdate -label {RST} 		-color {Red} 			/pwm_tb/tb_rst
add wave -noupdate -label {PWM Period} 	-color {Medium Orchid} 	/pwm_tb/tb_Period_counter_val
add wave -noupdate -label {ON Period} 	-color {Lime Green} 	/pwm_tb/tb_ON_counter_val
add wave -noupdate -label {PWM} 		-color {Yellow} 		/pwm_tb/tb_PWM_pin
add wave -noupdate -label {Next PWM} 	-color {Salmon} 		/pwm_tb/pwm_dut/next_pwm
add wave -noupdate -label {CNT RST} 	-color {Orange} 		/pwm_tb/pwm_dut/counter_ent/counter_rst_strobe_i
add wave -noupdate -label {CNT} 		-color {Green} 			/pwm_tb/pwm_dut/counter_ent/counter_o
add wave -noupdate -label {Next CNT} 	-color {Green} 			/pwm_tb/pwm_dut/counter_ent/next_cnt

run 2000 ns

WaveRestoreZoom {0 ps} {2000000 ps}	