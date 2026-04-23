`timescale 1ns / 1ps

module mux2 (
    input  logic sel,
    input  logic d0,
    input  logic d1,
    output logic y
);
  assign y = sel ? d1 : d0;
endmodule
