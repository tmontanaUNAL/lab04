transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/Users/tisam.SUPER-PC/Documents/GitHub/lab04/lab04-master {E:/Users/tisam.SUPER-PC/Documents/GitHub/lab04/lab04-master/display.v}
vlog -vlog01compat -work work +incdir+E:/Users/tisam.SUPER-PC/Documents/GitHub/lab04/lab04-master {E:/Users/tisam.SUPER-PC/Documents/GitHub/lab04/lab04-master/bcdtosseg.v}
vlog -vlog01compat -work work +incdir+E:/Users/tisam.SUPER-PC/Documents/GitHub/lab04/lab04-master {E:/Users/tisam.SUPER-PC/Documents/GitHub/lab04/lab04-master/bancoregistro.v}

vlog -vlog01compat -work work +incdir+E:/Users/tisam.SUPER-PC/Documents/GitHub/lab04/lab04-master {E:/Users/tisam.SUPER-PC/Documents/GitHub/lab04/lab04-master/TestBench.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  TestBench

add wave *
view structure
view signals
run -all
