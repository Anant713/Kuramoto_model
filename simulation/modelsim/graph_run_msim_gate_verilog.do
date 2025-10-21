transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {graph.vo}

vlog -vlog01compat -work work +incdir+C:/Users/Anant/quartus_files/EE224_project/testbenches {C:/Users/Anant/quartus_files/EE224_project/testbenches/tb_DFF.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L gate_work -L work -voptargs="+acc"  tb_D_ff

add wave *
view structure
view signals
run -all
