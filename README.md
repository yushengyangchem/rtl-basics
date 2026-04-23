# rtl-basics

A hands-on SystemVerilog learning project focused on digital design basics, simulation,
and hardware thinking.

## Learning Goals

This repository is for learning how to:

- write basic combinational and sequential SystemVerilog
- build confidence with simulation and testbenches
- understand the difference between software flow and hardware concurrency
- model state machines and timing behavior
- prepare for CPU / accelerator RTL work

## Project Structure

```text
rtl-basics/
├── Makefile
├── README.md
├── docs/
│   └── roadmap.md
├── rtl/
│   ├── 00_combinational/
│   │   ├── half_adder.sv
│   │   ├── full_adder.sv
│   │   └── mux2.sv
│   ├── 01_sequential/
│   │   ├── dff.sv
│   │   └── counter8.sv
│   └── 02_fsm/
│       └── traffic_light_fsm.sv
└── tb/
    ├── half_adder_tb.sv
    ├── full_adder_tb.sv
    ├── mux2_tb.sv
    ├── dff_tb.sv
    ├── counter8_tb.sv
    └── traffic_light_fsm_tb.sv
```

## Current Milestones

### 1. Combinational Logic

Learn pure logic with no memory:

- half adder
- full adder
- 2:1 mux

### 2. Sequential Logic

Learn clocked state:

- D flip-flop with reset
- 8-bit counter with enable

### 3. Finite State Machine

Learn controlled state transitions:

- traffic light controller FSM

## Build And Run

### Prerequisites

You need:

- Icarus Verilog with SystemVerilog support (`iverilog` and `vvp`)
- `make`
- a waveform viewer such as `surfer`

Check the main simulator install with:

```bash
iverilog -V
```

If you use the provided `shell.nix`, these tools are included.
This repo defaults to `surfer` as the waveform viewer, which tends to work better on modern Wayland desktops than GTKWave.

### Run everything

```bash
make test
```

### Run one module at a time

```bash
make sim-half-adder
make sim-full-adder
make sim-mux2
make sim-dff
make sim-counter8
make sim-traffic-light
```

Waveforms are written to `waves/`.

### Open one waveform

```bash
make view-half-adder
make view-full-adder
make view-mux2
make view-dff
make view-counter8
make view-traffic-light
```

If you want a different viewer, override `WAVE_VIEWER`:

```bash
make view-counter8 WAVE_VIEWER=gtkwave
```

## How To Study This Repo

Suggested order:

1. read one RTL module
2. predict its behavior before simulation
3. read the matching testbench
4. run `make sim-...`
5. inspect the waveform if the timing is not obvious
6. modify the design or testbench and rerun

## Why This Project Matters

This repository is not trying to be a large FPGA project.
Its job is to build instinct for:

- `always @(*)` vs `always @(posedge clk)`
- blocking vs non-blocking assignment
- reset behavior
- state transitions
- writing testbenches that check behavior instead of guessing

Once these feel natural, you will be in a much better place to build:

- a tiny SystemVerilog CPU
- memory-mapped peripherals
- simple MAC / GeMM building blocks
- accelerator control FSMs

More detailed study guidance is in [docs/roadmap.md](docs/roadmap.md).
