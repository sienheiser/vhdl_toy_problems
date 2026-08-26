
In this directory we define a FIFO in fifo.vhdl. Then define some properties that it must satisfy in fifo.psl. The fifo.sby script was made use the Yoysys simulator with ghdl. To check that fifo.vhdl satifies the properties in fifo.psl run the following command
```
sby -f fifo.sby
```

Before running the above command make sure you have the correct environment. If you have not installed Yosys use the instructions below to download and activate the environment
```
# grab the latest release tarball from:
# https://github.com/YosysHQ/oss-cad-suite-build/releases
wget https://github.com/YosysHQ/oss-cad-suite-build/releases/download/<date>/oss-cad-suite-linux-x64-<date>.tgz
tar -xzf oss-cad-suite-linux-x64-<date>.tgz
cd oss-cad-suite
source environment
```
