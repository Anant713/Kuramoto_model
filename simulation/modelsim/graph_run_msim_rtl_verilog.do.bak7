transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Anant/quartus_files/EE224_project/src {C:/Users/Anant/quartus_files/EE224_project/src/D_ff.v}

vlog -vlog01compat -work work +incdir+C:/Users/Anant/quartus_files/EE224_project/testbenches {C:/Users/Anant/quartus_files/EE224_project/testbenches/tb_DFF.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  tb_D_ff

add wave *
view structure
view signals
run -all
