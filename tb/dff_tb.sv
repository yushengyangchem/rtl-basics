`timescale 1ns / 1ps

module dff_tb;
  logic clk;
  logic rst;
  logic d;
  logic q;

  dff dut (
      .clk,
      .rst,
      .d,
      .q
  );

  always #5 clk = ~clk;

  initial begin
    $dumpfile("waves/dff.vcd");
    $dumpvars(0, dff_tb);

    clk = 0;
    rst = 1;
    d   = 0;

    @(posedge clk);
    #1;
    if (q !== 1'b0) begin
      $display("FAIL dff: reset should clear q");
      $finish;
    end

    rst = 0;
    d   = 1;
    @(posedge clk);
    #1;
    if (q !== 1'b1) begin
      $display("FAIL dff: q should capture d=1");
      $finish;
    end

    d = 0;
    @(posedge clk);
    #1;
    if (q !== 1'b0) begin
      $display("FAIL dff: q should capture d=0");
      $finish;
    end

    $display("PASS dff_tb");
    $finish;
  end
endmodule

