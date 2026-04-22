`timescale 1ns / 1ps

module dff (
    input  wire clk,
    input  wire rst,
    input  wire d,
    output reg  q
);
  always @(posedge clk) begin
    if (rst) begin
      q <= 1'b0;
    end else begin
      q <= d;
    end
  end
endmodule
