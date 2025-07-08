module systolic_array_8x8(inp_west0, inp_west8, inp_west16, inp_west24, inp_west_32,inp_west_40, inp_west_48, inp_west_56,
		      inp_north0, inp_north1, inp_north2, inp_north3,inp_north_4, inp_north_5, inp_north_6, inp_north_7,
		      clk, rst_n,rst_flush,valid, complete_matmul,
		      bram_portb_0_we, result_w_comp,bram_portb_0_din,bram_portb_0_addr );
	
	input [31:0] inp_west0, inp_west8, inp_west16, inp_west24, inp_west_32,inp_west_40, inp_west_48, inp_west_56,
		      inp_north0, inp_north1, inp_north2, inp_north3,inp_north_4, inp_north_5, inp_north_6, inp_north_7;
	input clk, rst_n,rst_flush,valid, complete_matmul;
	reg [8:0] count;
	output reg bram_portb_0_we,result_w_comp;
	output reg [63:0] bram_portb_0_din ;
	output reg [10:0] bram_portb_0_addr;	
	
	wire [31:0] inp_north0, inp_north1, inp_north2, inp_north3,inp_north_4, inp_north_5, inp_north_6, inp_north_7;
	wire [31:0] inp_west0, inp_west8, inp_west16, inp_west24, inp_west_32,inp_west_40, inp_west_48, inp_west_56;
	wire [31:0] outp_south0, outp_south1, outp_south2, outp_south3, outp_south4, outp_south5, outp_south6, outp_south7, outp_south8, outp_south9, outp_south10, outp_south11, outp_south12, outp_south13, outp_south14, outp_south15,outp_south16,outp_south17,outp_south18,outp_south19,outp_south20,outp_south21,outp_south22,outp_south23,outp_south24,outp_south25,outp_south26,outp_south27,outp_south28,outp_south29,outp_south30,outp_south31,outp_south32,outp_south33,outp_south34,outp_south35,outp_south36,outp_south37,outp_south38,outp_south39,outp_south40,outp_south41,outp_south42,outp_south43,outp_south44,outp_south45,outp_south46,outp_south47,outp_south48,outp_south49,outp_south50,outp_south51,outp_south52,outp_south53,outp_south54,outp_south55,outp_south56,outp_south57,outp_south58,outp_south59,outp_south60,outp_south61,outp_south62,outp_south63;
	wire [31:0] outp_east0, outp_east1, outp_east2, outp_east3, outp_east4, outp_east5, outp_east6, outp_east7, outp_east8, outp_east9, outp_east10, outp_east11, outp_east12, outp_east13, outp_east14, outp_east15,outp_east16,outp_east17,outp_east18,outp_east19,outp_east20,outp_east21,outp_east22,outp_east23,outp_east24,outp_east25,outp_east26,outp_east27,outp_east28,outp_east29,outp_east30,outp_east31,outp_east32,outp_east33,outp_east34,outp_east35,outp_east36,outp_east37,outp_east38,outp_east39,outp_east40,outp_east41,outp_east42,outp_east43,outp_east44,outp_east45,outp_east46,outp_east47,outp_east48,outp_east49,outp_east50,outp_east51,outp_east52,outp_east53,outp_east54,outp_east55,outp_east56,outp_east57,outp_east58,outp_east59,outp_east60,outp_east61,outp_east62,outp_east63;
	//wire [63:0] result0, result1, result2, result3, result4, result5, result6, result7, result8, result9, result10, result11, result12, result13, result14, result15;
	
	wire [63:0] results [0:63];
	reg [9:0] size = 10'd64;
	reg [9:0] counter_size = 10'd0;
	
	//from north and west
	block P0 (inp_north0, inp_west0, clk, rst_n, rst_flush,valid, outp_south0, outp_east0, results[0]);
	//from north
	block P1 (inp_north1, outp_east0, clk, rst_n, rst_flush,valid, outp_south1, outp_east1, results[1]);
	block P2 (inp_north2, outp_east1, clk, rst_n, rst_flush,valid, outp_south2, outp_east2, results[2]);
	block P3 (inp_north3, outp_east2, clk, rst_n, rst_flush,valid, outp_south3, outp_east3, results[3]);
	block P4 (inp_north_4, outp_east3, clk, rst_n, rst_flush,valid, outp_south4, outp_east4, results[4]);
	block P5 (inp_north_5, outp_east4, clk, rst_n, rst_flush,valid, outp_south5, outp_east5, results[5]);
	block P6 (inp_north_6, outp_east5, clk, rst_n, rst_flush,valid, outp_south6, outp_east6, results[6]);
	block P7 (inp_north_7, outp_east6, clk, rst_n, rst_flush,valid, outp_south7, outp_east7, results[7]);
	
	//from west
	block P8 (outp_south0, inp_west8, clk, rst_n, rst_flush,valid, outp_south8, outp_east8, results[8]);
	block P16 (outp_south8, inp_west16, clk, rst_n, rst_flush,valid, outp_south16, outp_east16, results[16]);
	block P24 (outp_south16, inp_west24, clk, rst_n, rst_flush,valid, outp_south24, outp_east24, results[24]);
	block P32 (outp_south24, inp_west_32, clk, rst_n, rst_flush,valid, outp_south32, outp_east32, results[32]);
	block P40 (outp_south32, inp_west_40, clk, rst_n, rst_flush,valid, outp_south40, outp_east40, results[40]);
	block P48 (outp_south40, inp_west_48, clk, rst_n, rst_flush,valid, outp_south48, outp_east48, results[48]);
	block P56 (outp_south48, inp_west_56, clk, rst_n, rst_flush,valid, outp_south56, outp_east56, results[56]);
	
	//no direct inputs
	//second row
	block P9  (outp_south1, outp_east8, clk, rst_n, rst_flush,valid, outp_south9, outp_east9, results[9]);
	block P10 (outp_south2, outp_east9, clk, rst_n, rst_flush,valid, outp_south10, outp_east10, results[10]);
	block P11 (outp_south3, outp_east10, clk, rst_n, rst_flush,valid, outp_south11, outp_east11, results[11]);
	block P12 (outp_south4, outp_east11, clk, rst_n, rst_flush,valid, outp_south12, outp_east12, results[12]);
	block P13 (outp_south5, outp_east12, clk, rst_n, rst_flush,valid, outp_south13, outp_east13, results[13]);
	block P14 (outp_south6, outp_east13, clk, rst_n, rst_flush,valid, outp_south14, outp_east14, results[14]);
	block P15 (outp_south7, outp_east14, clk, rst_n, rst_flush,valid, outp_south15, outp_east15, results[15]);
	
	//third row
	block P17 (outp_south9, outp_east16, clk, rst_n, rst_flush,valid, outp_south17, outp_east17, results[17]);
    block P18 (outp_south10, outp_east17, clk, rst_n, rst_flush,valid, outp_south18, outp_east18, results[18]);
    block P19 (outp_south11, outp_east18, clk, rst_n, rst_flush,valid, outp_south19, outp_east19, results[19]);
    block P20 (outp_south12, outp_east19, clk, rst_n, rst_flush,valid, outp_south20, outp_east20, results[20]);
    block P21 (outp_south13, outp_east20, clk, rst_n, rst_flush,valid, outp_south21, outp_east21, results[21]);
    block P22 (outp_south14, outp_east21, clk, rst_n, rst_flush,valid, outp_south22, outp_east22, results[22]);
    block P23 (outp_south15, outp_east22, clk, rst_n, rst_flush,valid, outp_south23, outp_east23, results[23]);
    
    //fourth row
    block P25 (outp_south17, outp_east24, clk, rst_n, rst_flush,valid, outp_south25, outp_east25, results[25]);
    block P26 (outp_south18, outp_east25, clk, rst_n, rst_flush,valid, outp_south26, outp_east26, results[26]);
    block P27 (outp_south19, outp_east26, clk, rst_n, rst_flush,valid, outp_south27, outp_east27, results[27]);
    block P28 (outp_south20, outp_east27, clk, rst_n, rst_flush,valid, outp_south28, outp_east28, results[28]);
    block P29 (outp_south21, outp_east28, clk, rst_n, rst_flush,valid, outp_south29, outp_east29, results[29]);
    block P30 (outp_south22, outp_east29, clk, rst_n, rst_flush,valid, outp_south30, outp_east30, results[30]);
    block P31 (outp_south23, outp_east30, clk, rst_n, rst_flush,valid, outp_south31, outp_east31, results[31]);
    
    //fifth_row
    block P33 (outp_south25, outp_east32, clk, rst_n, rst_flush,valid, outp_south33, outp_east33, results[33]);
    block P34 (outp_south26, outp_east33, clk, rst_n, rst_flush,valid, outp_south34, outp_east34, results[34]);
    block P35 (outp_south27, outp_east34, clk, rst_n, rst_flush,valid, outp_south35, outp_east35, results[35]);
    block P36 (outp_south28, outp_east35, clk, rst_n, rst_flush,valid, outp_south36, outp_east36, results[36]);
    block P37 (outp_south29, outp_east36, clk, rst_n, rst_flush,valid, outp_south37, outp_east37, results[37]);
    block P38 (outp_south30, outp_east37, clk, rst_n, rst_flush,valid, outp_south38, outp_east38, results[38]);
    block P39 (outp_south31, outp_east38, clk, rst_n, rst_flush,valid, outp_south39, outp_east39, results[39]);
    
    //sixth_row
    block P41 (outp_south33, outp_east40, clk, rst_n, rst_flush,valid, outp_south41, outp_east41, results[41]);
    block P42 (outp_south34, outp_east41, clk, rst_n, rst_flush,valid, outp_south42, outp_east42, results[42]);
    block P43 (outp_south35, outp_east42, clk, rst_n, rst_flush,valid, outp_south43, outp_east43, results[43]);
    block P44 (outp_south36, outp_east43, clk, rst_n, rst_flush,valid, outp_south44, outp_east44, results[44]);
    block P45 (outp_south37, outp_east44, clk, rst_n, rst_flush,valid, outp_south45, outp_east45, results[45]);
    block P46 (outp_south38, outp_east45, clk, rst_n, rst_flush,valid, outp_south46, outp_east46, results[46]);
    block P47 (outp_south39, outp_east46, clk, rst_n, rst_flush,valid, outp_south47, outp_east47, results[47]);
    
    //seventh_row
    block P49 (outp_south41, outp_east48, clk, rst_n, rst_flush,valid, outp_south49, outp_east49, results[49]);
    block P50 (outp_south42, outp_east49, clk, rst_n, rst_flush,valid, outp_south50, outp_east50, results[50]);
    block P51 (outp_south43, outp_east50, clk, rst_n, rst_flush,valid, outp_south51, outp_east51, results[51]);
    block P52 (outp_south44, outp_east51, clk, rst_n, rst_flush,valid, outp_south52, outp_east52, results[52]);
    block P53 (outp_south45, outp_east52, clk, rst_n, rst_flush,valid, outp_south53, outp_east53, results[53]);
    block P54 (outp_south46, outp_east53, clk, rst_n, rst_flush,valid, outp_south54, outp_east54, results[54]);
    block P55 (outp_south47, outp_east54, clk, rst_n, rst_flush,valid, outp_south55, outp_east55, results[55]);
    
    //eighth_row
    block P57 (outp_south49, outp_east56, clk, rst_n, rst_flush,valid, outp_south57, outp_east57, results[57]);
    block P58 (outp_south50, outp_east57, clk, rst_n, rst_flush,valid, outp_south58, outp_east58, results[58]);
    block P59 (outp_south51, outp_east58, clk, rst_n, rst_flush,valid, outp_south59, outp_east59, results[59]);
    block P60 (outp_south52, outp_east59, clk, rst_n, rst_flush,valid, outp_south60, outp_east60, results[60]);
    block P61 (outp_south53, outp_east60, clk, rst_n, rst_flush,valid, outp_south61, outp_east61, results[61]);
    block P62 (outp_south54, outp_east61, clk, rst_n, rst_flush,valid, outp_south62, outp_east62, results[62]);
    block P63 (outp_south55, outp_east62, clk, rst_n, rst_flush,valid, outp_south63, outp_east63, results[63]);
        
	
    always @(posedge clk ) begin
        if(!rst_n | rst_flush) begin
            counter_size <=0;
            result_w_comp <= 1'b0;
            bram_portb_0_addr <= 32'b1;
        end
        else begin
        if (complete_matmul== 1)begin
            if (counter_size == size)begin
                bram_portb_0_we <= 1'b1;
                bram_portb_0_addr <= 32'b0;
                result_w_comp <= 1'b1;
                bram_portb_0_din <= 64'b1111; //signature to show the data transfer is completed
            end
            else begin
                bram_portb_0_addr <= bram_portb_0_addr +1;
                bram_portb_0_din <= results[counter_size]; 
                bram_portb_0_we <= 1'b1;
                counter_size <= counter_size +1;
            end
        end
    else begin
       bram_portb_0_we <= 1'b0;
            end
            
        end	
    end
	
		      
endmodule