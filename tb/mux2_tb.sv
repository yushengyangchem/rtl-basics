`timescale 1ns / 1ps

module mux2_tb;
  logic sel;
  logic d0;
  logic d1;
  logic y;

  mux2 dut (
      .sel,
      .d0,
      .d1,
      .y
  );

  task check;
    input expected_y;
    begin
      #1;
      if (y !== expected_y) begin
        $display("FAIL mux2: sel=%0b d0=%0b d1=%0b y=%0b", sel, d0, d1, y);
        $finish;
      end
    end
  endtask

  initial begin
    $dumpfile("waves/mux2.vcd");
    $dumpvars(0, mux2_tb);

    sel = 0;
    d0  = 0;
    d1  = 1;
    check(0);
    sel = 0;
    d0  = 1;
    d1  = 0;
    check(1);
    sel = 1;
    d0  = 0;
    d1  = 1;
    check(1);
    sel = 1;
    d0  = 1;
    d1  = 0;
    check(0);

    $display("PASS mux2_tb");
    $finish;
  end
endmodule

