vlib work
vmap work work

vcom -work work counter_e.vhd
vcom -work work counter_a.vhd
vcom -work work pwm_e.vhd
vcom -work work pwm_a.vhd
vcom -work work strb_generator_e.vhd
vcom -work work strb_generator_a.vhd
vcom -work work delta_adc_e.vhd
vcom -work work delta_adc_a.vhd
vcom -work work delta_adc_tb.vhd

vsim work.delta_adc_tb

add wave -r -label {CLK} 				-color {Cyan} /delta_adc_tb/tb_clk
add wave -r -label {RST} 				-color {Red} /delta_adc_tb/tb_rst
add wave -r -label {PWM} 				-color {Medium Orchid} /delta_adc_tb/tb_PWM
add wave -r -label {ADC Valid} 			-color {Lime Green} /delta_adc_tb/tb_ADC_valid_strobe
add wave -r -label {ADC} 				-color {Yellow} /delta_adc_tb/tb_ADC_Value
add wave -r -label {Comp} 				-color {Orange} /delta_adc_tb/tb_Comparator
add wave -r -label {PrevComp} 			-color {Orange} /delta_adc_tb/delta_adc_dut/prev_comp
add wave -r -label {Sampling Strobe} 	-color {Orange} /delta_adc_tb/delta_adc_dut/sampling_strobe
add wave -r -label {PWM ON CNT} 		-color {Orange} /delta_adc_tb/delta_adc_dut/pwm_ent/ON_counter_val_i

run 20000 ns

WaveRestoreZoom {0 ps} {20000000 ps}	