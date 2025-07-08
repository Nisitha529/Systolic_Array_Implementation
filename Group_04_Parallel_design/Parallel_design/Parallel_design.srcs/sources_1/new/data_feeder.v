`timescale 1ns / 1ps
module data_feeder #(
  parameter DATA_WIDTH      = 32,
  parameter DATA_DEPTH      = 64,    //Matr_Width * Matr_Height
  parameter DATA_BUFFER     = 2,
  parameter FIF0_DEPTH      = 2048,
  parameter DATA_DEPTH_ROOT = 16,
  parameter FIF0_DEPTH_ROOT = 64,
  parameter MATRIX_WIDTH    = 8,
  parameter MAX_SIZE        = 16
)(
  input                                  clk,
  input                                  rst_n,
  input                                  rst_flush,
  
  input                                  data_valid,
  input      [DATA_WIDTH-1:0]            data_in,
  input      [$clog2(MAX_SIZE):0]        matrix_size,
  input      [$clog2(FIF0_DEPTH)-1:0]    base_addr_in_a_1,
  input      [$clog2(DATA_DEPTH_ROOT):0] matrix_width_in_a_1,
  input      [$clog2(FIF0_DEPTH)-1:0]    base_addr_in_b_1, 
  input      [$clog2(DATA_DEPTH_ROOT):0] matrix_width_in_b_1,  
  
  output                                 result_w_comp ,
  output wire [63:0]                     bram_portb_0_din ,
  output wire [10:0]                     bram_portb_0_addr ,
  output wire                            bram_portb_0_we,  
  output reg                             completed,
  output reg [$clog2(FIF0_DEPTH)-1:0]    fifo_addr
);

  localparam MATRIX_HEIGHT = MATRIX_WIDTH;
  localparam FIF0_DEPTH_01 = MATRIX_WIDTH*MATRIX_WIDTH;
  
  reg  [$clog2(MAX_SIZE):0]             completion_counter;
  reg  [$clog2(DATA_DEPTH_ROOT):0]      residual_counter;
  reg  [1:0]                            bram_counter;
  reg                                   sys_enable;
  reg  [2*MATRIX_WIDTH*DATA_WIDTH-1:0]  north_ports_zeros;
  reg  [2*MATRIX_WIDTH*DATA_WIDTH-1:0]  west_ports_zeros;
  
  reg                                   enable_a_1;
  reg                                   enable_b_1;
  reg                                   enable_2;
  wire                                  mul_done_1;
  reg                                   valid_in_1;
  
  wire                                  completed_a_1;
  wire [$clog2(FIF0_DEPTH)-1:0]         fifo_addr_a_1;
  wire                                  fifo_operation_a_1;
  wire [MATRIX_WIDTH*DATA_WIDTH-1:0]    west_ports_1;
  reg                                   valid_in_a_1;
  wire  [DATA_WIDTH-1:0]                 west_port_array_out_0;
  wire  [DATA_WIDTH-1:0]                 west_port_array_out_1;
  wire  [DATA_WIDTH-1:0]                 west_port_array_out_2;
  wire  [DATA_WIDTH-1:0]                 west_port_array_out_3;
  wire  [DATA_WIDTH-1:0]                 west_port_array_out_4;
  wire  [DATA_WIDTH-1:0]                 west_port_array_out_5;
  wire  [DATA_WIDTH-1:0]                 west_port_array_out_6;
  wire  [DATA_WIDTH-1:0]                 west_port_array_out_7;
//  reg  [$clog2(FIF0_DEPTH)-1:0]         base_addr_in_a_1;
//  reg  [$clog2(DATA_DEPTH_ROOT):0]      matrix_width_in_a_1;
  
  wire                                  completed_b_1;
  wire [$clog2(FIF0_DEPTH)-1:0]         fifo_addr_b_1;
  wire                                  fifo_operation_b_1;
  wire [MATRIX_WIDTH*DATA_WIDTH-1:0]    north_ports_1;
  reg                                   valid_in_b_1;
  wire  [DATA_WIDTH-1:0]                 north_port_array_out_0;
  wire  [DATA_WIDTH-1:0]                 north_port_array_out_1;
  wire  [DATA_WIDTH-1:0]                 north_port_array_out_2;
  wire  [DATA_WIDTH-1:0]                 north_port_array_out_3;
  wire  [DATA_WIDTH-1:0]                 north_port_array_out_4;
  wire  [DATA_WIDTH-1:0]                 north_port_array_out_5;
  wire  [DATA_WIDTH-1:0]                 north_port_array_out_6;
  wire  [DATA_WIDTH-1:0]                 north_port_array_out_7;
//  reg  [$clog2(FIF0_DEPTH)-1:0]         base_addr_in_b_1; 
//  reg  [$clog2(DATA_DEPTH_ROOT):0]      matrix_width_in_b_1;
  
  data_extractor_mat_A
  #(
    .DATA_WIDTH      (DATA_WIDTH),
    .DATA_DEPTH      (DATA_DEPTH),
    .FIF0_DEPTH      (FIF0_DEPTH),
    .MATRIX_WIDTH    (MATRIX_WIDTH)
  )
  data_extractor_mat_A_01
  (
    .clk             (clk),
    .rst_n           (rst_n),
    .rst_flush       (rst_flush),
    
    .data_in         (data_in | sys_enable),
    .valid_in        (valid_in_a_1),
    .enable          (enable_a_1),
    .base_addr_in    (base_addr_in_a_1),
    .matrix_width_in (matrix_width_in_a_1),
    
    .completed       (completed_a_1),
    .fifo_addr       (fifo_addr_a_1),
    .fifo_operation  (fifo_operation_a_1),
    //.west_ports      (west_ports_1)
    .west_port_array_out_0  (west_port_array_out_0),
    .west_port_array_out_1  (west_port_array_out_1),
    .west_port_array_out_2  (west_port_array_out_2),
    .west_port_array_out_3  (west_port_array_out_3),
    .west_port_array_out_4  (west_port_array_out_4),
    .west_port_array_out_5  (west_port_array_out_5),
    .west_port_array_out_6  (west_port_array_out_6),
    .west_port_array_out_7  (west_port_array_out_7)
  );
  
  data_extractor_mat_B
  #(
    .DATA_WIDTH      (DATA_WIDTH),
    .DATA_DEPTH      (DATA_DEPTH),
    .FIF0_DEPTH      (FIF0_DEPTH),
    .MATRIX_HEIGHT   (MATRIX_WIDTH),
    .MAX_SIZE        (MAX_SIZE)
  )
  data_extractor_mat_B_01
  (
    .clk             (clk),
    .rst_n           (rst_n),
    .rst_flush       (rst_flush),
    
    .data_in         (data_in),
    .valid_in        (valid_in_b_1),
    .enable          (enable_b_1),
    .base_addr_in    (base_addr_in_b_1),
    .matrix_width_in (matrix_width_in_b_1),
//    .matrix_size     (matrix_size),
    
    .completed       (completed_b_1),
    .fifo_addr       (fifo_addr_b_1),
    .fifo_operation  (fifo_operation_b_1),
    //.north_ports     (north_ports_1)
    .north_port_array_out_0  (north_port_array_out_0),
    .north_port_array_out_1  (north_port_array_out_1),
    .north_port_array_out_2  (north_port_array_out_2),
    .north_port_array_out_3  (north_port_array_out_3),
    .north_port_array_out_4  (north_port_array_out_4),
    .north_port_array_out_5  (north_port_array_out_5),
    .north_port_array_out_6  (north_port_array_out_6),
    .north_port_array_out_7  (north_port_array_out_7)
  );
  
  systolic_array_8x8 systolic_array_01(
    .clk               (clk),
    .rst_n             (rst_n),
    .rst_flush         (rst_flush),
    
    .valid             (valid_in_1),
    .complete_matmul   (completed),
    
    .inp_west0         (west_port_array_out_0 + west_ports_zeros[DATA_WIDTH*1-1:0]),
    .inp_west8         (west_port_array_out_1 + west_ports_zeros[DATA_WIDTH*2-1:DATA_WIDTH*1]),
    .inp_west16        (west_port_array_out_2 + west_ports_zeros[DATA_WIDTH*3-1:DATA_WIDTH*2]),
    .inp_west24        (west_port_array_out_3 + west_ports_zeros[DATA_WIDTH*4-1:DATA_WIDTH*3]),
    
    .inp_west_32       (west_port_array_out_4 + west_ports_zeros[DATA_WIDTH*5-1:DATA_WIDTH*4]),
    .inp_west_40       (west_port_array_out_5 + west_ports_zeros[DATA_WIDTH*6-1:DATA_WIDTH*5]),
    .inp_west_48       (west_port_array_out_6 + west_ports_zeros[DATA_WIDTH*7-1:DATA_WIDTH*6]),
    .inp_west_56       (west_port_array_out_7 + west_ports_zeros[DATA_WIDTH*8-1:DATA_WIDTH*7]),

    .inp_north0        (north_port_array_out_0 + north_ports_zeros[DATA_WIDTH*1-1:0]),
    .inp_north1        (north_port_array_out_1 + north_ports_zeros[DATA_WIDTH*2-1:DATA_WIDTH*1]),
    .inp_north2        (north_port_array_out_2 + north_ports_zeros[DATA_WIDTH*3-1:DATA_WIDTH*2]),
    .inp_north3        (north_port_array_out_3 + north_ports_zeros[DATA_WIDTH*4-1:DATA_WIDTH*3]),
    
    .inp_north_4       (north_port_array_out_4 + north_ports_zeros[DATA_WIDTH*5-1:DATA_WIDTH*4]),
    .inp_north_5       (north_port_array_out_5 + north_ports_zeros[DATA_WIDTH*6-1:DATA_WIDTH*5]),
    .inp_north_6       (north_port_array_out_6 + north_ports_zeros[DATA_WIDTH*7-1:DATA_WIDTH*6]),
    .inp_north_7       (north_port_array_out_7 + north_ports_zeros[DATA_WIDTH*8-1:DATA_WIDTH*7]),
    
    .bram_portb_0_we   (bram_portb_0_we), 
    .bram_portb_0_addr (bram_portb_0_addr),  
    .bram_portb_0_din  (bram_portb_0_din),
    .result_w_comp     (result_w_comp)
  );  
  
 always @ (posedge clk) begin
    if (!rst_n | rst_flush) begin
      completed           <= 0;
      enable_a_1          <= 1;
      enable_b_1          <= 0;
      valid_in_a_1        <= 0;
      valid_in_b_1        <= 0;
      valid_in_1          <= 0;
      bram_counter        <= 0;
      completion_counter  <= 0;
      residual_counter    <= 0;
      sys_enable          <= 0;
      north_ports_zeros   <= 0;
      west_ports_zeros    <= 0;
//      base_addr_in_a_1    <= matrix_size - 1;
//      matrix_width_in_a_1 <= matrix_size;
//      base_addr_in_b_1    <= 2*matrix_size*matrix_size - matrix_size + DATA_BUFFER - 1;//matrix_size*matrix_size - matrix_size + matrix_size*matrix_size + DATA_BUFFER - 1 // Mat_B base_addr + Mat_A_size + Buffer;
//      matrix_width_in_b_1 <= matrix_size;
    end else begin            
      if (enable_a_1 && data_valid) begin
        if (bram_counter == 2 && !valid_in_a_1) begin
          valid_in_a_1    <= 1;
          bram_counter    <= 0;
        end else begin
          valid_in_1      <= 0;
          valid_in_a_1    <= 0;
          bram_counter    <= bram_counter + 1;
        end
        if (valid_in_a_1 && completed_a_1) begin     //(valid_in_a_1 && completed_a_1)
          enable_b_1      <= 1;
          enable_a_1      <= 0;
          valid_in_a_1     <= 0;
        end
      end else if (enable_b_1 && data_valid) begin
        if (bram_counter == 2 && !valid_in_b_1) begin
          valid_in_b_1     <= 1;
          bram_counter     <= 0;
        end else begin
          valid_in_b_1     <= 0;
          bram_counter     <= bram_counter + 1;
        end
        if (valid_in_b_1 && completed_b_1 ) begin  // valid_in_b_1 && completed_b_1
          enable_a_1       <= 1;
          enable_b_1       <= 0;
          valid_in_b_1     <= 0;
          valid_in_1       <= 1;
        end
      end
      if (valid_in_1) begin
        completion_counter <= completion_counter + 1;
      end else begin
        completion_counter <= completion_counter;
      end
      if (completion_counter >  3*matrix_size - 2 ) begin
        enable_a_1       <= 0;
        valid_in_1       <= 1;
        enable_b_1       <= 0;
        valid_in_a_1     <= 0;
        sys_enable       <= 1;
        residual_counter <= residual_counter + 1; 
      end 
      
      if (residual_counter > 3*matrix_size) begin
        sys_enable       <= 0;
        completed        <= 1;
        
      end
      
//      if (mul_done_1) begin
//        completed         <= 1;
//        valid_in_1        <= 0;
//      end else begin
//        completed         <= 0;
//      end
    end
  end
  
  always @ (*) begin
    if (!rst_n | rst_flush) begin
      fifo_addr   = 12'd0;
    end else begin
      if (~completed_a_1 && enable_a_1) begin             //enable_a_1
        fifo_addr = fifo_addr_a_1;
      end else if (~completed_b_1 && enable_b_1) begin    //enable_b_1
        fifo_addr = fifo_addr_b_1;
      end else begin
        fifo_addr = fifo_addr_a_1;
      end
    end
  end

endmodule
