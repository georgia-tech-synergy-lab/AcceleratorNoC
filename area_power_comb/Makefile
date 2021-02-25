#include ../Makefile.include

SCRIPT_DIR=./scripts

all: flow

flow: clean synth pnr

py_sweep_tree:
	python3 ./scripts/python_wrapper/run_dc_tree.py

py_sweep_fifo:
	python3 ./scripts/python_wrapper/run_dc_fifo.py

py_sweep_xbar:
	python3 ./scripts/python_wrapper/run_dc_xbar.py


synth:
	mkdir -p SYNTH/rpt
	cd SYNTH ; dc_shell -f ../scripts/dc/dc_script.tcl -o synth.log
	
pnr:
	mkdir PNR
	cd PNR ; innovus -64 -init ../scripts/innovus/pnr_script.tcl -log pnr.log


clean:
	rm -rf SYNTH PNR
	rm -f simv
	rm -f *.vcd
	rm -f *.key
	rm -rf csrc/
	rm -rf *.rpt
	rm -rf *.log
	rm -rf *.svf
	rm -rf *.ddc
	rm -rf results_synthesized.v
	rm -rf results_synthesized.sdc
	rm -rf alib-52/
	rm -rf rpt/
	rm -rf simv.daidir/
	rm -rf encounter*

