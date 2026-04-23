`timescale 1ns / 1ps

module half_adder_tb;
  logic a;
  logic b;
  logic sum;
  logic carry;

  half_adder dut (
      .a(a),
      .b(b),
      .sum(sum),
      .carry(carry)
  );

  task check;
    input expected_sum;
    input expected_carry;
    begin
      #1;
      if (sum !== expected_sum || carry !== expected_carry) begin
        $display("FAIL half_adder: a=%0b b=%0b sum=%0b carry=%0b", a, b, sum, carry);
        $finish;
      end
    end
  endtask

  initial begin
    $dumpfile("waves/half_adder.vcd");
    $dumpvars(0, half_adder_tb);

    a = 0;
    b = 0;
    check(0, 0);
    a = 0;
    b = 1;
    check(1, 0);
    a = 1;
    b = 0;
    check(1, 0);
    a = 1;
    b = 1;
    check(0, 1);

    $display("PASS half_adder_tb");
    $finish;
  end
endmodule

