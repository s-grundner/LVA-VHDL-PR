vlib work
vmap work work

vcom -work work ../../packages/std_definitions.vhd
vcom -work work ../../packages/Commands_p.vhd

vcom -work work ../../entities/sync_ea.vhd
vcom -work work ../../entities/counter_ea.vhd
vcom -work work ../../entities/strb_generator_ea.vhd
vcom -work work ../../entities/debouncer_ea.vhd
vcom -work work ../../entities/clean_btn_ea.vhd

vcom -work work ../test/cb_tb.vhd

vsim work.cb_tb

# --- INSTERT WAVES ---

# Top Level

add wave -r -noupdate -group {TOP LEVEL} -radix unsigned *

run 50 us

WaveRestoreZoom {0 ps} {10 us}

configure wave -timelineunits us