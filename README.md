# Verilog Control Circuits

This repo includes basic control and logic modules designed in Verilog.

## 🔧 Modules

- `mux_2to1.v`: 2-to-1 multiplexer
- `counter_4bit.v`: 4-bit binary up counter

## 🧪 Simulation

```bash
iverilog counter_4bit.v counter_4bit_tb.v -o counter
vvp counter
