`timescale 1ns/1ns
module sys_array_tb;
localparam CLK_CYCLE       = 10;
parameter MAX_SIZE        = 16;


reg rst_n, clk,enable,data_valid;
reg [$clog2(MAX_SIZE):0]     matrix_size;
reg                              bram_input_proc_0_we ;     // input wire [0 : 0] wea
reg       [10:0]                  bram_input_proc_0_addr;    // input wire [10 : 0] addra
reg       [31:0]                  bram_input_proc_0_din;

 wire bram_result_0_din ;
 wire  bram_result_0_addr;
  wire bram_result_0_we;
  wire result_wr_comp;


top dut(
     .clk(clk),
    .rst_n(rst_n),
  
  .enable(enable),
  .matrix_size(matrix_size),
  .data_valid(data_valid),
  .bram_input_proc_0_we (bram_input_proc_0_we),      // input wire [0 : 0] wea
  .bram_input_proc_0_addr(bram_input_proc_0_addr),    // input wire [10 : 0] addra
  .bram_input_proc_0_din(bram_input_proc_0_din),  
  .bram_result_0_din (bram_result_0_din),
  .bram_result_0_addr(bram_result_0_addr),
  .bram_result_0_we(bram_result_0_we),
  .result_wr_comp(result_wr_comp)
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
  //matrix_size = 5'd8;
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
