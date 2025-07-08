`timescale 1ns / 1ps

module top(
  input                               clk,
  input                               rst_n,
  
  input                               enable,
  input      [4:0]     matrix_size,
  input                               data_valid,
  
  input                               bram_input_proc_0_we ,      // input wire [0 : 0] wea
  input       [10:0]                  bram_input_proc_0_addr,    // input wire [10 : 0] addra
  input       [31:0]                  bram_input_proc_0_din,  
  
  output wire    [63:0]                   bram_result_0_din ,
  output wire    [10:0]                   bram_result_0_addr,
  output wire                             bram_result_0_we,
  output wire                               result_wr_comp,
  output wire                               result_wr_comp2
  );
  parameter DATA_WIDTH      = 32;
  parameter DATA_DEPTH      = 64;    //Matr_Width * Matr_Height
  parameter DATA_BUFFER     = 2;
  parameter FIF0_DEPTH      = 2048;
  parameter DATA_DEPTH_ROOT = 16;
  parameter FIF0_DEPTH_ROOT = 64;
  parameter MATRIX_WIDTH    = 8;
  parameter MAX_SIZE        = 16;
  
  //input read bram port
  reg  start_op;
  reg start_op2;
  wire [10:0] bram_input_0_addr;
  wire [10:0] bram_0_addr;
  wire [10:0] bram_input_0_addr_read_mat;
  wire [10:0] bram_input_0_addr_read_mat2;
  wire  [31:0]  bram_input_0_data;
wire  [31:0]  bram_input_0_data_read_mat;


reg [1:0] enable_parallel;
reg [4:0] mat_size;
reg [10:0] bram_portb_0_addr;
wire  [31:0] bram_portb_0_dout;
reg [4:0] mat_size2;
  //result write  bram port
  // wire   [63:0] bram_result_0_din ;
  // wire [10:0] bram_result_0_addr;
  // wire  bram_result_0_we;
  //wire result_wr_comp;
  
top_module dut(
     .clk(clk),
    .rst_n(rst_n & rst_top),
  
  .enable(1'b1),
  .matrix_size(mat_size),
  .data_valid(start_op),

  //input read bram port
  .bram_input_0_addr(bram_input_0_addr_read_mat),
  .bram_input_0_data(bram_input_0_data_read_mat),

  //result write  bram port
   .bram_result_0_din (bram_result_0_din),
  .bram_result_0_addr(bram_result_0_addr),
  .bram_result_0_we(bram_result_0_we),

  .result_wr_complete(result_wr_comp)
);

top_module dut2(
     .clk(clk),
    .rst_n(rst_n & rst_top2),
  
  .enable(1'b1),
  .matrix_size(mat_size2),
  .data_valid(start_op2),

  //input read bram port
  .bram_input_0_addr(bram_input_0_addr_read_mat2),
  .bram_input_0_data(d_out_a),

  //result write  bram port
   .bram_result_0_din (),
  .bram_result_0_addr(),
  .bram_result_0_we(),

  .result_wr_complete(result_wr_comp2)
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
  
  reg  [$clog2(FIF0_DEPTH)-1:0]    base_addr_in_a_1;
  reg  [$clog2(DATA_DEPTH_ROOT):0] matrix_width_in_a_1;
  reg  [$clog2(FIF0_DEPTH)-1:0]    base_addr_in_b_1; 
  reg  [$clog2(DATA_DEPTH_ROOT):0] matrix_width_in_b_1;
  reg                              rst_top;
  reg                              rst_top2;
  reg   [31:0]                     mat_start_val;

blk_mem_gen_0 blk_mem_gen_1_01 (
  .clka                (clk),       // input wire clka
  .ena                 (1'b1),    // input wire ena
  .wea                 (bram_input_proc_0_we),      // input wire [0 : 0] wea
  .addra               (bram_0_addr),    // input wire [10 : 0] addra
  .dina                (bram_input_proc_0_din),    // input wire [31 : 0] dina
  .douta               (d_out_a),   // output wire [31 : 0] douta
  
  .clkb                (clk),       // input wire clkb
  .enb                 (1'b1),    // input wire enb
  .web                 (we_b),      // input wire [0 : 0] web
  .addrb               (bram_input_0_addr),    // input wire [10 : 0] addrb
  .dinb                (din_b),     // input wire [31 : 0] dinb
  .doutb               (bram_input_0_data)    // output wire [31 : 0] doutb
);

assign bram_input_0_addr = start_op ? bram_input_0_addr_read_mat : bram_portb_0_addr; 
assign bram_input_0_data_read_mat = start_op ? bram_input_0_data : 32'b0; 
assign bram_portb_0_dout = start_op ?  32'b0 : bram_input_0_data; 


assign bram_0_addr = start_op2 ? bram_input_0_addr_read_mat2 : bram_input_proc_0_addr ; 
  

  
 


  parameter IDLE = 5'b00001,
    LOAD = 5'b00010,
    WRITE = 5'b00100,
    STOR = 5'b01000,
    STORCOMP = 5'b10000;


    reg [4:0] next_state;
    reg [4:0] current_state;

  always @(posedge clk) begin
    if (~rst_n)begin
      current_state <= IDLE;
    end
    else begin
      current_state <= next_state;
  end
  end

  
  always @(posedge clk) begin
    if (~rst_n) begin
      mat_size<= 5'b0;
      start_op <=0;
      start_op2 <=0;
      rst_top <= 0;
      rst_top2 <= 0;
      bram_portb_0_addr <= 11'b0;
       
    end 
    else begin
    
    case (current_state)
      IDLE: begin
  
        if(data_valid == 1)begin
          start_op <=0;
          start_op2 <=0;
          rst_top <= 0;
          next_state <= LOAD;
          bram_portb_0_addr <= 11'b0;  
        end
        else begin
      
          next_state <= IDLE;    
        end
        end// End of idle
      LOAD: begin
        next_state <= WRITE;
        
      end
      WRITE :begin
        enable_parallel <= bram_portb_0_dout[11:10];
        mat_size <= bram_portb_0_dout[4:0];
        mat_size2 <= bram_portb_0_dout[9:5];
        next_state <= STOR; 
      end
      STOR :begin
        start_op <=1;
        rst_top <= 1;
        next_state <= STORCOMP; 
      end   
      STORCOMP  :begin
        if (enable_parallel == 2'b01)begin
          mat_start_val <= (mat_size2+mat_size2+5);
          start_op2 <=1;
          rst_top2 <= 1;
          next_state <= IDLE; 

        end
        else begin
        next_state <= IDLE; 
        end
      end 
    endcase
    end
  end




endmodule