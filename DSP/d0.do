vlib work
vlog MINI_tb.V
vsim -voptargs=+acc work.DSP_tb
add wave *
run -all