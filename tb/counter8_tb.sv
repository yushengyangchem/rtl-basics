`timescale 1ns / 1ps

module counter8_tb;
  logic clk;
  logic rst;
  logic en;
  logic [7:0] count;

  counter8 dut (
      .clk(clk),
      .rst(rst),
      .en(en),
      .count(count)
  );

  always #5 clk = ~clk;

  initial begin
    $dumpfile("waves/counter8.vcd");
    $dumpvars(0, counter8_tb);

    clk = 0;
    rst = 1;
    en  = 0;

    @(posedge clk);
    #1;
    if (count !== 8'd0) begin
      $display("FAIL counter8: reset should clear count");
      $finish;
    end

    rst = 0;
    en  = 1;

    repeat (3) @(posedge clk);
    #1;
    if (count !== 8'd3) begin
      $display("FAIL counter8: expected count=3, got %0d", count);
      $finish;
    end

    en = 0;
    @(posedge clk);
    #1;
    if (count !== 8'd3) begin
      $display("FAIL counter8: count should hold when en=0");
      $finish;
    end

    $display("PASS counter8_tb");
    $finish;
  end
endmodule

