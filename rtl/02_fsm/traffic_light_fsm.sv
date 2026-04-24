`timescale 1ns / 1ps

module traffic_light_fsm (
    input  logic clk,
    input  logic rst,
    output logic main_red,
    output logic main_yellow,
    output logic main_green,
    output logic side_red,
    output logic side_yellow,
    output logic side_green
);
  localparam [1:0] MAIN_GO = 2'd0;
  localparam [1:0] MAIN_WAIT = 2'd1;
  localparam [1:0] SIDE_GO = 2'd2;
  localparam [1:0] SIDE_WAIT = 2'd3;

  logic [1:0] state;
  logic [1:0] timer;

  always_ff @(posedge clk) begin
    if (rst) begin
      state <= MAIN_GO;
      timer <= '0;
    end else begin
      case (state)
        MAIN_GO: begin
          if (timer == 2'd2) begin
            state <= MAIN_WAIT;
            timer <= '0;
          end else begin
            timer <= timer + 1'b1;
          end
        end
        MAIN_WAIT: begin
          state <= SIDE_GO;
          timer <= '0;
        end
        SIDE_GO: begin
          if (timer == 2'd2) begin
            state <= SIDE_WAIT;
            timer <= '0;
          end else begin
            timer <= timer + 1'b1;
          end
        end
        SIDE_WAIT: begin
          state <= MAIN_GO;
          timer <= '0;
        end
        default: begin
          state <= MAIN_GO;
          timer <= '0;
        end
      endcase
    end
  end

  always_comb begin
    main_red    = '0;
    main_yellow = '0;
    main_green  = '0;
    side_red    = '0;
    side_yellow = '0;
    side_green  = '0;

    case (state)
      MAIN_GO: begin
        main_green = 1'b1;
        side_red   = 1'b1;
      end
      MAIN_WAIT: begin
        main_yellow = 1'b1;
        side_red    = 1'b1;
      end
      SIDE_GO: begin
        main_red   = 1'b1;
        side_green = 1'b1;
      end
      SIDE_WAIT: begin
        main_red    = 1'b1;
        side_yellow = 1'b1;
      end
      default: begin
        main_green = 1'b1;
        side_red   = 1'b1;
      end
    endcase
  end
endmodule
