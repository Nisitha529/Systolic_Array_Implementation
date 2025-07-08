`timescale 1ns/1ps
module data_extractor_mat_B #(       //This is var one
  parameter DATA_WIDTH    = 32,
  parameter DATA_DEPTH    = 256,
  parameter FIF0_DEPTH    = 256,
  parameter MATRIX_HEIGHT = 16,
  parameter MAX_SIZE      = 16,
  parameter SYSTOLIC_SIZE = 16
)(
  input                                        clk,
  input                                        rst_n,
  input                                        rst_flush,

  input      [DATA_WIDTH-1:0]                  data_in,
  input                                        valid_in,
  input                                        enable,
  input      [$clog2(FIF0_DEPTH)-1:0]          base_addr_in,
  input      [$clog2(int'(DATA_DEPTH**0.5)):0] matrix_width_in,

  output reg                                   completed,
  output reg [$clog2(FIF0_DEPTH)-1:0]          fifo_addr,
  output reg                                   fifo_operation,
//  output reg [MATRIX_HEIGHT*DATA_WIDTH-1:0]    north_ports
  output reg [DATA_WIDTH-1:0]                  north_port_array_out_0,
  output reg [DATA_WIDTH-1:0]                  north_port_array_out_1,
  output reg [DATA_WIDTH-1:0]                  north_port_array_out_2,
  output reg [DATA_WIDTH-1:0]                  north_port_array_out_3,
  output reg [DATA_WIDTH-1:0]                  north_port_array_out_4,
  output reg [DATA_WIDTH-1:0]                  north_port_array_out_5,
  output reg [DATA_WIDTH-1:0]                  north_port_array_out_6,
  output reg [DATA_WIDTH-1:0]                  north_port_array_out_7
);

  localparam MATRIX_WIDTH = MATRIX_HEIGHT;

  reg [MATRIX_HEIGHT-1:0] [DATA_WIDTH-1:0] north_port_array;

  reg [$clog2(FIF0_DEPTH)-1:0]    base_addr;
  reg [$clog2(FIF0_DEPTH)-1:0]    requesting_addr;

  reg [$clog2(MATRIX_HEIGHT):0]   counter;
  reg [$clog2(MATRIX_WIDTH):0]    intmd_counter;
  reg [$clog2(MATRIX_WIDTH):0]    down_counter;
  reg [$clog2(MATRIX_WIDTH):0]    up_counter;

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n | rst_flush) begin
      //completed        <= 0;
      counter          <= 5'd0;
      intmd_counter    <= 5'd0;
      down_counter     <= MATRIX_HEIGHT - 1;
      up_counter       <= 5'd1;
      base_addr        <= base_addr_in; //MATRIX_HEIGHT*MATRIX_HEIGHT - MATRIX_WIDTH;
      requesting_addr  <= base_addr_in;
      north_port_array <= 0;
    end else if (valid_in && enable) begin
      if (intmd_counter < MATRIX_WIDTH) begin
        if (counter + down_counter < MATRIX_HEIGHT - 1) begin
          //north_ports[DATA_WIDTH*(counter + 1)-1:DATA_WIDTH*counter]             <= data_in;
          //completed                      <= 0;
          north_port_array[counter]      <= data_in;
          requesting_addr                <= base_addr + (matrix_width_in + 1)*(counter + 1);
          counter                        <= counter + 1;
        end else begin
          //north_ports[(MATRIX_HEIGHT*DATA_WIDTH - 1) -: DATA_WIDTH*down_counter] <= 0;
          //completed                      <= 1;
          north_port_array[counter]      <= data_in;
          counter                        <= 0;
          intmd_counter                  <= intmd_counter + 1;
          down_counter                   <= down_counter - 1;
          if (base_addr > base_addr_in - (SYSTOLIC_SIZE - 1)*matrix_width_in) begin
            base_addr                    <= base_addr - matrix_width_in; 
            requesting_addr              <= base_addr - matrix_width_in;         
          end else begin
            base_addr                    <= base_addr + 1;
            requesting_addr              <= base_addr + 1;
          end
        end
      end else begin
        if (counter + up_counter < MATRIX_HEIGHT - 1) begin
          //north_ports[DATA_WIDTH*(counter + 2)-1:DATA_WIDTH*(counter + 1)]       <= data_in;
          //completed                      <= 0;
          north_port_array[up_counter-1]         <= 32'd0;
          north_port_array[up_counter + counter] <= data_in;
          requesting_addr                        <= base_addr + (matrix_width_in + 1)*(counter + 1);
          counter                                <= counter + 1;
        end else begin
          //north_ports[DATA_WIDTH*(counter + 1)-1:0]                              <= 0;
          //completed                      <= 1;
          north_port_array[up_counter-1]         <= 32'd0;
          north_port_array[counter+up_counter]   <= data_in;
          counter                                <= 0;
          up_counter                             <= up_counter + 1;
          base_addr                              <= base_addr + 1;
          requesting_addr                        <= base_addr + 1;
        end 
      end
    end
  end

  always @(*) begin
    if (!rst_n | rst_flush) begin
      completed   = 0;
    end else if (valid_in && enable) begin
      if (intmd_counter < MATRIX_WIDTH) begin
        if (counter + down_counter < MATRIX_HEIGHT - 1) begin
          completed = 0;
        end else begin
          completed = 1;
        end
      end else begin
        if (counter + up_counter < MATRIX_HEIGHT - 1) begin
          completed = 0;
        end else begin
          completed = 1;
        end
      end
    end else begin
      completed     = 0;
    end
  end

  always @(*) begin
    if (!rst_n | rst_flush) begin
      fifo_addr      = 8'd0;
    end else begin
      if (requesting_addr < FIF0_DEPTH) begin
        fifo_addr    = requesting_addr;
      end else if (base_addr > -1) begin
        fifo_addr    = base_addr;
      end else begin
        fifo_addr    = base_addr + 0 + matrix_width_in;
      end
      //north_ports = {north_port_array[15],north_port_array[14],north_port_array[13],north_port_array[12],north_port_array[11],north_port_array[10],north_port_array[9],north_port_array[8],north_port_array[7],north_port_array[6],north_port_array[5],north_port_array[4],north_port_array[3],north_port_array[2],north_port_array[1],north_port_array[0]};
      north_port_array_out_0  = north_port_array[0];
      north_port_array_out_1  = north_port_array[1];
      north_port_array_out_2  = north_port_array[2];
      north_port_array_out_3  = north_port_array[3];
      north_port_array_out_4  = north_port_array[4];
      north_port_array_out_5  = north_port_array[5];
      north_port_array_out_6  = north_port_array[6];
      north_port_array_out_7  = north_port_array[7];
      fifo_operation = 0;
    end
  end
  
  //assign north_ports = {north_port_array[15],north_port_array[14],north_port_array[13],north_port_array[12],north_port_array[11],north_port_array[10],north_port_array[9],north_port_array[8],north_port_array[7],north_port_array[6],north_port_array[5],north_port_array[4],north_port_array[3],north_port_array[2],north_port_array[1],north_port_array[0]};
  //assign north_ports = {north_port_array[3], north_port_array[2], north_port_array[1], north_port_array[0]};
endmodule
//`timescale 1ns/1ps
//module data_extractor_mat_B #(
//  parameter DATA_WIDTH    = 32,
//  parameter FIF0_DEPTH    = 256,
//  parameter MATRIX_HEIGHT = 16
//)(
//  input                                     clk,
//  input                                     rst_n,
//  input                                     rst_flush,

//  input      [DATA_WIDTH-1:0]               data_in,
//  input                                     valid_in,
//  input                                     enable,

//  output reg                                completed,
//  output reg [$clog2(FIF0_DEPTH)-1:0]       fifo_addr,
//  output reg                                fifo_operation,
//  output reg [MATRIX_HEIGHT*DATA_WIDTH-1:0] north_ports
//);

//  localparam MATRIX_WIDTH = MATRIX_HEIGHT;

//  reg [DATA_WIDTH-1:0] [MATRIX_HEIGHT-1:0] north_port_array;

//  reg [$clog2(FIF0_DEPTH)-1:0]    base_addr;
//  reg [$clog2(FIF0_DEPTH)-1:0]    requesting_addr;

//  reg [$clog2(MATRIX_HEIGHT):0]   counter;
//  reg [$clog2(MATRIX_WIDTH):0]    intmd_counter;
//  reg [$clog2(MATRIX_WIDTH):0]    down_counter;
//  reg [$clog2(MATRIX_WIDTH):0]    up_counter;

//  always @(posedge clk) begin
//    if (!rst_n | rst_flush) begin
//      counter          <= 4'd0;
//      intmd_counter    <= 4'd0;
//      down_counter     <= MATRIX_HEIGHT - 1;
//      up_counter       <= 4'd1;
//      base_addr        <= MATRIX_HEIGHT*MATRIX_HEIGHT - MATRIX_WIDTH;
//      requesting_addr  <= base_addr;
//      north_port_array <= 0;
//    end else if (valid_in && enable) begin
//      if (intmd_counter < MATRIX_WIDTH) begin
//        if (counter + down_counter < MATRIX_HEIGHT - 1) begin
//          //north_ports[DATA_WIDTH*(counter + 1)-1:DATA_WIDTH*counter]             <= data_in;
//          completed                      <= 0;
//          north_port_array[counter]      <= data_in;
//          requesting_addr                <= base_addr + (MATRIX_HEIGHT + 1)*(counter + 1);
//          counter                        <= counter + 1;
//        end else begin
//          //north_ports[(MATRIX_HEIGHT*DATA_WIDTH - 1) -: DATA_WIDTH*down_counter] <= 0;
//          completed                      <= 1;
//          counter                        <= 0;
//          intmd_counter                  <= intmd_counter + 1;
//          down_counter                   <= down_counter - 1;
//          if (base_addr > 0) begin
//            base_addr                    <= base_addr - MATRIX_HEIGHT; 
//            requesting_addr              <= base_addr - MATRIX_HEIGHT;         
//          end else begin
//            base_addr                    <= base_addr + 1;
//            requesting_addr              <= base_addr + 1;
//          end
//        end
//      end else begin
//        if (counter + up_counter < MATRIX_HEIGHT - 1) begin
//          //north_ports[DATA_WIDTH*(counter + 2)-1:DATA_WIDTH*(counter + 1)]       <= data_in;
//          completed                      <= 0;
//          north_port_array[counter+1]    <= data_in;
//          requesting_addr                <= base_addr + (MATRIX_WIDTH + 1)*(counter + 1);
//          counter                        <= counter + 1;
//        end else begin
//          //north_ports[DATA_WIDTH*(counter + 1)-1:0]                              <= 0;
//          completed                      <= 1;
//          counter                        <= 0;
//          up_counter                     <= up_counter + 1;
//          base_addr                      <= base_addr + 1;
//          requesting_addr                <= base_addr + 1;
//        end
//      end
//    end
//  end

////  always @(posedge clk) begin
////    if (intmd_counter == MATRIX_HEIGHT) begin
////      base_addr <= base_addr + 1;
////    end
////  end

//  always @(*) begin
//    if (!rst_n | rst_flush) begin
//      fifo_addr      = 12'd0;
//    end else begin
//      if (requesting_addr < FIF0_DEPTH) begin
//        fifo_addr    = requesting_addr;
//      end else if (base_addr > -1) begin
//        fifo_addr    = base_addr;
//      end else begin
//        fifo_addr    = base_addr + 0 + MATRIX_WIDTH;
//      end
//      fifo_operation = 0;
//    end
//  end
  
//  //assign north_ports = {north_port_array[15],north_port_array[14],north_port_array[13],north_port_array[12],north_port_array[11],north_port_array[10],north_port_array[9],north_port_array[8],north_port_array[7],north_port_array[6],north_port_array[5],north_port_array[4],north_port_array[3],north_port_array[2],north_port_array[1],north_port_array[0]};
//  assign north_ports = {north_port_array[3], north_port_array[2], north_port_array[1], north_port_array[0]};
//endmodule