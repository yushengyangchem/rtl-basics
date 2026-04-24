`timescale 1ns / 1ps

module traffic_light_fsm_tb;
  logic clk;
  logic rst;
  logic main_red;
  logic main_yellow;
  logic main_green;
  logic side_red;
  logic side_yellow;
  logic side_green;

  traffic_light_fsm dut (
      .clk,
      .rst,
      .main_red,
      .main_yellow,
      .main_green,
      .side_red,
      .side_yellow,
      .side_green
  );

  always #5 clk = ~clk;

  task expect_lights;
    input exp_main_red;
    input exp_main_yellow;
    input exp_main_green;
    input exp_side_red;
    input exp_side_yellow;
    input exp_side_green;
    begin
      #1;
      if (main_red !== exp_main_red ||
                main_yellow !== exp_main_yellow ||
                main_green !== exp_main_green ||
                side_red !== exp_side_red ||
                side_yellow !== exp_side_yellow ||
                side_green !== exp_side_green) begin
        $display("FAIL traffic_light_fsm");
        $display("main: R=%0b Y=%0b G=%0b", main_red, main_yellow, main_green);
        $display("side: R=%0b Y=%0b G=%0b", side_red, side_yellow, side_green);
        $finish;
      end
    end
  endtask

  initial begin
    $dumpfile("waves/traffic_light_fsm.vcd");
    $dumpvars(0, traffic_light_fsm_tb);

    clk = 0;
    rst = 1;

    @(posedge clk);
    expect_lights(0, 0, 1, 1, 0, 0);

    rst = 0;

    repeat (2) begin
      @(posedge clk);
      expect_lights(0, 0, 1, 1, 0, 0);
    end

    @(posedge clk);
    expect_lights(0, 1, 0, 1, 0, 0);

    @(posedge clk);
    expect_lights(1, 0, 0, 0, 0, 1);

    repeat (2) begin
      @(posedge clk);
      expect_lights(1, 0, 0, 0, 0, 1);
    end

    @(posedge clk);
    expect_lights(1, 0, 0, 0, 1, 0);

    @(posedge clk);
    expect_lights(0, 0, 1, 1, 0, 0);

    $display("PASS traffic_light_fsm_tb");
    $finish;
  end
endmodule
