In this directory we define a FIFO in fifo.vhdl. Then define some properties that it must satisfy in fifo.psl. The fifo.sby script was made use the Yoysys simulator with ghdl. To check that fifo.vhdl satifies the properties in fifo.psl run the following command
```
sby -f fifo.sby
```