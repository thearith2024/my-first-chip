## How it works

This project is a simple 24-bit counter that divides the main clock frequency. 
The 23rd bit of the counter is connected to the output pin `uo_out[0]`, 
which creates a visible blinking effect on an LED when a 10MHz clock is applied.

## How to test

1. Apply a clock signal to the `clk` pin.
2. Set the `rst_n` (reset) pin to high (1).
3. Observe the LED blinking on the output pin `uo_out[0]`.
4. To reset the counter, pull the `rst_n` pin to low (0) momentarily.