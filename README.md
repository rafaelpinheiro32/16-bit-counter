# 16-bit-counter
16-bit counter in Verilog.

Module file defines the behavior of the counter. Counter and load signals synchronous to negative clock edges, reset signal asynchronous.

Testbench file tests its functionality. Images of waveform:
Zoom in of behavior in the first 120ns:
![image](https://github.com/rafaelpinheiro32/16-bit-counter/assets/151592512/be5ae688-3061-4e12-a357-c5073116377a)

Zoom in when load signal is high, interval around 100ns:
![image](https://github.com/rafaelpinheiro32/16-bit-counter/assets/151592512/2b4b5355-d0bb-494c-ae86-278ff849ceaf)

Whenever reset signal is set to 0, cout will be 0.

Operation modes, from high to low priority:

Load: if load is high, cout is set to start

Hold: if count is low, cout holds on negative clock edges.

Count: if cout is not 0, subtract one at the next negative clock edge. If cout is 0, cout goes back to start value, wrap toggles from 0 to 1 for 1 clock cycle.
