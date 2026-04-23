`timescale 1ns / 1ps

module full_adder_tb;
  logic a;
  logic b;
  logic cin;
  logic sum;
  logic cout;
  integer i;
  logic [1:0] expected;

  full_adder dut (
      .a(a),
      .b(b),
      .cin(cin),
      .sum(sum),
      .cout(cout)
  );

  initial begin
    $dumpfile("waves/full_adder.vcd");
    $dumpvars(0, full_adder_tb);

    for (i = 0; i < 8; i = i + 1) begin
      {a, b, cin} = i[2:0];
      #1;
      expected = a + b + cin;
      if ({cout, sum} !== expected) begin
        $display("FAIL full_adder: a=%0b b=%0b cin=%0b sum=%0b cout=%0b", a, b, cin, sum, cout);
        $finish;
      end
    end

    $display("PASS full_adder_tb");
    $finish;
  end
endmodule

