`timescale 1ns / 1ps
module tb_data_feeder();

  localparam DATA_WIDTH      = 32;
  localparam DATA_DEPTH      = 16;
  localparam DATA_BUFFER     = 2;
  localparam FIF0_DEPTH      = 2048;
  localparam DATA_DEPTH_ROOT = 4;
  localparam FIF0_DEPTH_ROOT = 32;
  localparam MATRIX_WIDTH    = 4;
  localparam MAX_SIZE        = 16;
  localparam CLK_CYCLE       = 10;
  
  reg                          clk;
  reg                          rst_n;
  reg                          rst_flush;
  
  reg                          data_valid;
  reg [DATA_WIDTH-1:0]         data_in;
  reg [$clog2(MAX_SIZE):0]     matrix_size;
  
  reg                          completed;
  reg [$clog2(FIF0_DEPTH)-1:0] fifo_addr; 
  
  data_feeder 
  #(
  .DATA_WIDTH       (DATA_WIDTH),
  .DATA_DEPTH       (DATA_DEPTH),
  .DATA_BUFFER      (DATA_BUFFER),
  .FIF0_DEPTH       (FIF0_DEPTH),
  .DATA_DEPTH_ROOT  (DATA_DEPTH_ROOT),
  .FIF0_DEPTH_ROOT  (FIF0_DEPTH_ROOT),
  .MATRIX_WIDTH     (MATRIX_WIDTH),
  .MAX_SIZE         (MAX_SIZE)
  )
  data_feeder_01
  (
  .clk              (clk),
  .rst_n            (rst_n),
  .rst_flush        (rst_flush),
  .data_valid       (data_valid),
  .data_in          (data_in),
  .matrix_size      (matrix_size),
  .completed        (completed),
  .fifo_addr        (fifo_addr)
  );

reg [FIF0_DEPTH-1:0] [DATA_WIDTH-1:0] data_reg_pile;

always begin
  #(CLK_CYCLE/2);
  clk   = ~clk;
end

initial begin
  clk         = 1;
  rst_n       = 0;
  rst_flush   = 0;
  data_valid  = 0;
  data_in     = 32'd0;
  matrix_size = 5'd4;
  #(CLK_CYCLE*2);
  
  for (int i = 0; i < FIF0_DEPTH; i = i + 1) begin
    data_reg_pile[i] = i;
    #1;
  end
  
  @(posedge clk);
  rst_n       = 1;
  #(CLK_CYCLE*2);
  
  repeat (DATA_DEPTH*3) begin
    data_valid = 1;
    data_in    = data_reg_pile[fifo_addr];
  end
  
  $finish;
  
end

endmodule