# Roadmap

This repository is designed as a bridge from software simulation to RTL design.

## Phase 1: Combinational Thinking

Goal: train yourself to think in truth tables and signal flow.

Focus on:

- half adder
- full adder
- mux
- simple decoder
- equality comparator

Questions to be able to answer:

- what is combinational logic?
- why should outputs change immediately with inputs?
- when should `assign` be preferred over `always @(*)`?

## Phase 2: Sequential Thinking

Goal: get comfortable with registers, clocks, reset, and cycle-by-cycle behavior.

Focus on:

- DFF
- register with enable
- counter
- shift register

Questions to be able to answer:

- what changes only on the clock edge?
- why is non-blocking assignment the default in clocked logic?
- what does reset really initialize?

## Phase 3: FSM Thinking

Goal: model a control process that evolves over time.

Focus on:

- simple traffic light FSM
- sequence detector
- handshake controller

Questions to be able to answer:

- what are the states?
- what causes a transition?
- what is Moore vs Mealy style output logic?

## Phase 4: Datapath + Control

Goal: start combining arithmetic hardware and state machines.

Suggested modules:

- adder tree
- multiply-accumulate cell
- vector reduction engine
- simple matrix multiply tile

This is the point where your earlier C kernels start to become very useful as golden references.

## A Good Learning Rhythm

For each new module:

1. write down the interface first
2. describe the behavior in plain language
3. write a small RTL version
4. write a testbench with checks
5. simulate and inspect waveforms
6. only then refactor or optimize

## Future Project Connection

This repository should prepare you for later work such as:

- a single-cycle toy CPU
- a multi-cycle control FSM
- a memory-mapped accelerator wrapper
- a small GeMM datapath with control
