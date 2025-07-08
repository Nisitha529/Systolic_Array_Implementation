`timescale 1ns/1ps
module tb_data_extractor_mat_A();

  localparam DATA_WIDTH   = 32;
  localparam FIF0_DEPTH   = 16;
  localparam MATRIX_WIDTH = 4;
  localparam CLK_CYCLE    = 10;
  
  reg                               clk;
  reg                               rst;
  
  reg [DATA_WIDTH-1:0]              data_in;
  reg                               valid_in;
  reg                               enable;
  
  reg                               completed;
  reg [$clog2(FIF0_DEPTH)-1:0]      fifo_addr;
  reg                               fifo_operation;
  reg [MATRIX_WIDTH*DATA_WIDTH-1:0] west_ports;
  
  data_extractor_mat_A
  #(
    .DATA_WIDTH     (DATA_WIDTH),
    .FIF0_DEPTH     (FIF0_DEPTH),
    .MATRIX_WIDTH   (MATRIX_WIDTH)
  )
  data_extractor_mat_A_01
  (
    .clk            (clk),
    .rst            (rst),
    
    .data_in        (data_in),
    .valid_in       (valid_in),
    .enable         (enable),
    
    .completed      (completed),
    .fifo_addr      (fifo_addr),
    .fifo_operation (fifo_operation),
    .west_ports     (west_ports)
  );
  
  reg [FIF0_DEPTH-1:0] [DATA_WIDTH-1:0] data_reg;
  
  always begin
    #(CLK_CYCLE/2);
    clk    = ~clk;
  end
  
  initial begin
    clk      = 1;
    rst      = 1;
    data_in  = 32'd0;
    valid_in = 0;
    
    repeat (8) @(posedge clk);
    
    for (int i = 0; i < FIF0_DEPTH; i = i + 1) begin
      data_reg[i] = i;
      #1;
    end
    
    @(posedge clk);
    enable   = 1;
    rst      = 0;
    #(CLK_CYCLE*2);
    
    valid_in = 1;
    # (CLK_CYCLE*2);
    
    @(posedge clk);
    if (!fifo_operation) begin
      data_in = data_reg[fifo_addr];
      #(CLK_CYCLE);
    end
    
    repeat (24) @(posedge clk);

  end
  
endmodule
