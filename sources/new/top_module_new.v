`timescale 1ns / 1ns

module top_module #(
  parameter DATA_WIDTH      = 32,
  parameter DATA_DEPTH      = 64,    //Matr_Width * Matr_Height
  parameter DATA_BUFFER     = 2,
  parameter FIF0_DEPTH      = 2048,
  parameter DATA_DEPTH_ROOT = 16,
  parameter FIF0_DEPTH_ROOT = 64,
  parameter MATRIX_WIDTH    = 8,
  parameter MAX_SIZE        = 16
)(
  input                               clk,
  input                               rst_n,
  
  input                               enable,
  input      [$clog2(MAX_SIZE):0]     matrix_size,
  input                               data_valid,  //when mat write to bram completed

  //input read bram port
  output [$clog2(FIF0_DEPTH)-1:0] bram_input_0_addr,
  input  [DATA_WIDTH-1:0]  bram_input_0_data,

  //result write  bram port
  output    wire [63:0] bram_result_0_din ,
  output wire [10:0] bram_result_0_addr,
  output wire bram_result_0_we,
  output reg result_wr_complete
  
);

  wire                             en_a;
  wire                             we_a;
  wire [$clog2(FIF0_DEPTH)-1:0]    addr_a;
  wire [DATA_WIDTH-1:0]            d_in_a;
  wire [DATA_WIDTH-1:0]            d_out_a;
  wire                             en_b;
  wire                             we_b; 
  wire [$clog2(FIF0_DEPTH)-1:0]    addr_b;
  wire [DATA_WIDTH-1:0]            d_in_b;
  wire [DATA_WIDTH-1:0]            d_out_b;
  wire                              matrix_completed;
  reg                              rst_flush;
  wire                             result_w_comp;
  
  reg  [$clog2(FIF0_DEPTH)-1:0]    base_addr_in_a_1;
  reg  [$clog2(DATA_DEPTH_ROOT):0] matrix_width_in_a_1;
  reg  [$clog2(FIF0_DEPTH)-1:0]    base_addr_in_b_1; 
  reg  [$clog2(DATA_DEPTH_ROOT):0] matrix_width_in_b_1;
  reg                              data_valid_holder;

  reg                             result_w_com_count; 
  reg [3:0]                       r_count;
data_feeder
#(
  .DATA_WIDTH          (DATA_WIDTH),
  .DATA_DEPTH          (DATA_DEPTH),
  .DATA_BUFFER         (DATA_BUFFER),
  .FIF0_DEPTH          (FIF0_DEPTH),
  .DATA_DEPTH_ROOT     (DATA_DEPTH_ROOT),
  .FIF0_DEPTH_ROOT     (FIF0_DEPTH_ROOT),
  .MATRIX_WIDTH        (MATRIX_WIDTH),
  .MAX_SIZE            (MAX_SIZE)          ///Maximum Matrix Size
)
data_feeder_01
(
  .clk                 (clk),
  .rst_n               (rst_n),
  .rst_flush           (rst_flush),
  
  .data_valid          (data_valid_holder),
  .data_in             (bram_input_0_data),
  .matrix_size         (matrix_size),
  .base_addr_in_a_1    (base_addr_in_a_1),
  .matrix_width_in_a_1 (matrix_width_in_a_1),
  .base_addr_in_b_1    (base_addr_in_b_1),
  .matrix_width_in_b_1 (matrix_width_in_b_1),
  .bram_portb_0_din (bram_result_0_din ),
  .bram_portb_0_addr (bram_result_0_addr),
  .bram_portb_0_we(bram_result_0_we),
  .completed           (matrix_completed),
  .fifo_addr           (bram_input_0_addr),
  .result_w_comp       (result_w_comp)
);


always @(posedge clk) begin
  if (!rst_n) begin
    result_w_com_count <= 0;
    result_wr_complete <=0;
    r_count <= 4'd0;
  end else begin
    if (result_w_comp) begin
      result_w_com_count <= 1;
      result_wr_complete <=1;
    end else begin
      if( result_w_com_count)begin
        if(r_count == 4'd6)begin
          result_wr_complete <=0;
          result_w_com_count <= 0;
          r_count <= 4'd0;
        end
        else begin
          r_count <= r_count +1;
        end
      end
        else begin 
          result_wr_complete <=0;
        end
    end
    end

  
end

//assign result_wr_complete = result_w_comp;
// blk_mem_gen_1 blk_mem_gen_1_01 (
//   .clka                (clk),       // input wire clka
//   .ena                 (enable),    // input wire ena
//   .wea                 (we_a),      // input wire [0 : 0] wea
//   .addra               (addr_a),    // input wire [10 : 0] addra
//   .dina                (d_in_a),    // input wire [31 : 0] dina
//   .douta               (d_out_a),   // output wire [31 : 0] douta
  
//   .clkb                (clk),       // input wire clkb
//   .enb                 (enable),    // input wire enb
//   .web                 (we_b),      // input wire [0 : 0] web
//   .addrb               (bram_input_0_addr),    // input wire [10 : 0] addrb
//   .dinb                (din_b),     // input wire [31 : 0] dinb
//   .doutb               (d_out_b)    // output wire [31 : 0] doutb
// );

always @(posedge clk) begin
  if (!rst_n) begin
    rst_flush   <= 0;
    base_addr_in_a_1    <= matrix_size - 1;
    matrix_width_in_a_1 <= matrix_size;
    base_addr_in_b_1    <= 2*matrix_size*matrix_size - matrix_size + DATA_BUFFER;// - 1;//matrix_size*matrix_size - matrix_size + matrix_size*matrix_size + DATA_BUFFER - 1 // Mat_B base_addr + Mat_A_size + Buffer;
    matrix_width_in_b_1 <= matrix_size;
  end else begin
    if (data_valid) begin
      data_valid_holder <= 1;
    end else if (matrix_completed) begin
      data_valid_holder <= 0;
    end
    if (matrix_completed && result_w_comp) begin
      rst_flush <= 1;
    end else begin
      rst_flush <= 0;
    end
  end
end
  
endmodule
