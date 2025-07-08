`timescale 1ns/1ps
module block #(
  parameter  DATA_WIDTH = 32
)(
  input      [DATA_WIDTH-1:0]   input_north,
  input      [DATA_WIDTH-1:0]   input_west,

  input                         clk,
  input                         rst_n,
  input                         rst_flush,
  input                         valid,

  output reg [DATA_WIDTH-1:0]   output_south,
  output reg [DATA_WIDTH-1:0]   output_east,
  output reg [2*DATA_WIDTH-1:0] result
);

  wire       [2*DATA_WIDTH-1:0] multiplication;

  always @(posedge clk) begin
    if (!rst_n | rst_flush) begin
      output_south   <= 32'd0;
      output_east    <= 32'd0;
      result         <= 64'd0;
    end else begin
      if (valid) begin
        output_south <= input_north;
        output_east  <= input_west;
        result       <= result + multiplication;
      end
    end
  end

  assign multiplication = input_north * input_west;
    
endmodule