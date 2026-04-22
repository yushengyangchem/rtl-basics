# ==========================================
# rtl-basics Makefile
# ==========================================

IVERILOG = iverilog
VVP = vvp
WAVE_VIEWER ?= surfer
IVERILOG_FLAGS = -g2012 -Wall
BUILD_DIR = build
WAVE_DIR = waves

.PHONY: all clean test test-comb test-seq test-fsm \
	sim-half-adder sim-full-adder sim-mux2 sim-dff sim-counter8 sim-traffic-light \
	view-half-adder view-full-adder view-mux2 view-dff view-counter8 view-traffic-light

all: test

test: test-comb test-seq test-fsm

test-comb: sim-half-adder sim-full-adder sim-mux2

test-seq: sim-dff sim-counter8

test-fsm: sim-traffic-light

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(WAVE_DIR):
	mkdir -p $(WAVE_DIR)

sim-half-adder: $(BUILD_DIR) $(WAVE_DIR)
	$(IVERILOG) $(IVERILOG_FLAGS) -o $(BUILD_DIR)/half_adder.out rtl/00_combinational/half_adder.sv tb/half_adder_tb.sv
	$(VVP) $(BUILD_DIR)/half_adder.out

sim-full-adder: $(BUILD_DIR) $(WAVE_DIR)
	$(IVERILOG) $(IVERILOG_FLAGS) -o $(BUILD_DIR)/full_adder.out rtl/00_combinational/full_adder.sv tb/full_adder_tb.sv
	$(VVP) $(BUILD_DIR)/full_adder.out

sim-mux2: $(BUILD_DIR) $(WAVE_DIR)
	$(IVERILOG) $(IVERILOG_FLAGS) -o $(BUILD_DIR)/mux2.out rtl/00_combinational/mux2.sv tb/mux2_tb.sv
	$(VVP) $(BUILD_DIR)/mux2.out

sim-dff: $(BUILD_DIR) $(WAVE_DIR)
	$(IVERILOG) $(IVERILOG_FLAGS) -o $(BUILD_DIR)/dff.out rtl/01_sequential/dff.sv tb/dff_tb.sv
	$(VVP) $(BUILD_DIR)/dff.out

sim-counter8: $(BUILD_DIR) $(WAVE_DIR)
	$(IVERILOG) $(IVERILOG_FLAGS) -o $(BUILD_DIR)/counter8.out rtl/01_sequential/counter8.sv tb/counter8_tb.sv
	$(VVP) $(BUILD_DIR)/counter8.out

sim-traffic-light: $(BUILD_DIR) $(WAVE_DIR)
	$(IVERILOG) $(IVERILOG_FLAGS) -o $(BUILD_DIR)/traffic_light.out rtl/02_fsm/traffic_light_fsm.sv tb/traffic_light_fsm_tb.sv
	$(VVP) $(BUILD_DIR)/traffic_light.out

view-half-adder: sim-half-adder
	$(WAVE_VIEWER) $(WAVE_DIR)/half_adder.vcd

view-full-adder: sim-full-adder
	$(WAVE_VIEWER) $(WAVE_DIR)/full_adder.vcd

view-mux2: sim-mux2
	$(WAVE_VIEWER) $(WAVE_DIR)/mux2.vcd

view-dff: sim-dff
	$(WAVE_VIEWER) $(WAVE_DIR)/dff.vcd

view-counter8: sim-counter8
	$(WAVE_VIEWER) $(WAVE_DIR)/counter8.vcd

view-traffic-light: sim-traffic-light
	$(WAVE_VIEWER) $(WAVE_DIR)/traffic_light_fsm.vcd

clean:
	rm -rf $(BUILD_DIR) $(WAVE_DIR)
