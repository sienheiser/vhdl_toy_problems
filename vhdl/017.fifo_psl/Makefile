all:
	ghdl -a --std=08 fifo.vhdl
	ghdl -a --std=08 fifo.psl
	ghdl -e --std=08 fifo
	ghdl -r --std=08 fifo	
synth:
	ghdl --synth --std=08 fifo.vhdl fifo.psl -e fifo > fifo_synth.vhdl

clean:
	ghdl --clean