`timescale 1ns / 1ps

module tb_top_module();

  localparam DATA_WIDTH      = 32;
  localparam DATA_DEPTH      = 64;
  localparam DATA_BUFFER     = 2;
  localparam FIF0_DEPTH      = 2048;
  localparam DATA_DEPTH_ROOT = 16;    
  localparam FIF0_DEPTH_ROOT = 32;
  localparam MATRIX_WIDTH    = 8;
  localparam MAX_SIZE        = 16;
  localparam CLK_CYCLE       = 10;
  
  reg                          clk;
  reg                          rst_n;
  
  reg                          enable;
  reg [$clog2(MAX_SIZE):0]     matrix_size;
  reg                          data_valid;
  
  reg                          matrix_completed;
  
  top_module
  #
  (
  .DATA_WIDTH       (DATA_WIDTH),
  .DATA_DEPTH       (DATA_DEPTH),
  .DATA_BUFFER      (DATA_BUFFER),
  .FIF0_DEPTH       (FIF0_DEPTH),
  .DATA_DEPTH_ROOT  (DATA_DEPTH_ROOT),
  .FIF0_DEPTH_ROOT  (FIF0_DEPTH_ROOT),
  .MATRIX_WIDTH     (MATRIX_WIDTH),
  .MAX_SIZE         (MAX_SIZE)   
  )
  top_module_01
  (
  .clk              (clk),
  .rst_n            (rst_n),
  
  .enable           (enable),
  .matrix_size      (matrix_size),
  .data_valid       (data_valid),
  
  .matrix_completed (matrix_completed)
  );
  
always begin
  #(CLK_CYCLE/2);
  clk   = ~clk;
end

initial begin
  clk         = 1;
  rst_n       = 0;
  enable      = 0;
  data_valid  = 0;
  matrix_size = 5'd8;
  #(CLK_CYCLE*2);
  
//  for (int i = 0; i < FIF0_DEPTH; i = i + 1) begin
//    data_reg_pile[i] = i;
//    #1;
//  end
  
  @(posedge clk);
  rst_n       = 1;
  enable      = 1;
  #(CLK_CYCLE*2);
  
  data_valid  = 1;
  #(CLK_CYCLE);
  data_valid  = 0;
  
//  repeat (DATA_DEPTH*3) begin
//    data_in   = data_reg_pile[fifo_addr];
//  end
  
  $finish;
  
end

endmodule
