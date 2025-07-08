// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sun Dec 17 09:53:46 2023
// Host        : MaleeshaLaptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {d:/Aca folders/Sem7/Advance Digital Systems/adding control/adding
//               control.gen/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.v}
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    enb,
    web,
    addrb,
    dinb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [0:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [10:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [31:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;

  wire [10:0]addra;
  wire [10:0]addrb;
  wire clka;
  wire clkb;
  wire [31:0]dina;
  wire [31:0]dinb;
  wire [31:0]douta;
  wire [31:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire [0:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     10.698 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_gen_0.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2000" *) 
  (* C_READ_DEPTH_B = "2000" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "2000" *) 
  (* C_WRITE_DEPTH_B = "2000" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_0_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
jLV29U0rrfMIZhYJzdoUrPoqB9eHQ5NXmWyCdqnN3Wgm+GU4C3zthrN1m4QGiaj0thPCIynZbX+0
7yjtkv+T5ByJ6NhiofAwWseGLvPXlYu6ERAPvi4SAYpF2VUqQHtPAbPmnPubGdDRgIEpeobF7hsz
rEcpEru1pyiScUriyuo=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
vsoizVrOONWw/DhjRLEYrtRmtji+Ok63CbpSg/l9VnoKAi8tAzqRbQ57atGB2N6IGGbKHkbK2Uzh
EHgWvYZeyt4hE+bpQX91vc9PNxfjQMGzPoFD3jCWk30EmEk+AND39eWx+DhJ8xhFuucoOQ2GwyAk
B+Mjs15naPE7DvlHel8hnD4dfSdYhGKp96oozu8JeBto8aHG6poOuYkxSwaut7NCI+mabCkMxtMp
RrydgmRuTvhRTbJMyx5CxFSZTRDrS5aU1vaRlnMiqKCI7g2KY9pemYaJsFeVodBuo6IyKGynyEhs
wr+VtUhQDtaVhMkwB95WwmMoDk9F2L5Au1I+TQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
W081dPMCWhKs5YlQD7n3zvf7+PTcnb8eFWxoVs8+zHLkxDMA1klITbsfztGYvJFce8Yao5XQLLqZ
oUE5Pq2arq+zwICFUcLjdMsmP1WmL82znHOPHm83zNwrxWMloHkySAqzFbgJeHa973uZqj0M8ydc
sYmzCYVlGVjt0QX0xqA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Zpc3MmdLWaVOv+S4z2POuoyslYoAbWc+Npxq2UyQRtDwf566IId3uwAetolMAgfLo/G3ezuSOXMn
8NznS37h9XvmVrxA50SAux68P87WgkLtiUYqM3CMBKkxNlZ/TR8WzTuQyFdvzkOE9lp8HC7LXnk5
RDsnOM+su46FW7ysY01COslo9Xc7rhs6WFqx29+Xcqk8+ZMLSzaJfuwZdNmJFS3Q1vhlq3ZeYqMl
wMieB731KsPxjxp7VKNHpTbgFryC2isqc4ohBDOt52M/Bz4B/rIpFeHfZ7X3jWSiKtSuBsDN2NXf
EMjfAT248dlK7NxJ+NBNPhS5sLxTiGyQhta57A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rPMYqnkKhJKV1wltOfDrKos9ZbucaoX3WGTuqsdLkGpcKObzslHBwlGrKtWV7bZYmS2SM+QuEMfa
CE+tCUdsSiprp+n5BuSQlJa6BJ8mlqccjoo/JLw2QEmUhyMXQ3TLGomGGoZdeTmMPXhUBAOyLPea
Ddc8mgtTN8Kpy117GOTXDKP+IKJqW01fLrPJpgEhFiJCbyElLgtCRWmI94gX+y4XNVS0Cd1YwNw6
4nHgnEdC7fXARDKcYO3VsWC/pdzPQgursXloNLrVYa6i2xr+8E1V0+nSWwNYQZP7XUIVqXKMU8Ea
bT4acXrRCF/5tJJ5B9JparYI0zxXSbaakn1dIw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mfroTgL8g2pyIXQ/mGO9YHm19cd5mOlJ++qpusOYeVxGmkIhvF4aKx+AyIUz2yGGAeCtOzIasHty
pyqKgZhibSqxcpHgR0m6GOxXXOXJiHaK8NzxUzXeRJovcBI/WjtDhXeb1LRMI1J97jVBtJPJQH0Y
fGOD7jWvkvQwxnrZdyLp6kPWgSIcavHHDbO7iJv4gnyGp6W3/FCDo2RKWNLoW+SNjSdLZ6YRP8a+
ldaGU8TYvJ03KWlmik7repuN6AwxCjg2KeQ+x1sBAEXzROXomuSbvX3ZAo8UiIKAQY1SJumHLG3L
QI/S4Wbl1Hz6LDTsttMwP480gq6+tb6s1E4oWw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QJIabgm8dx/gVHbOQFwt8maOKVHFgkpZTPR6dzD8fqoGo9M9oGPTqBqchtPZWgv2UYFF2KEUSlV4
L3SDXBKrLs+NsAVTcICaEMiEi6j82zj/C1LsPkQfS8RLrg0ab8lbDMb5YqJ7lkHs3iM65x2iN1Mf
66cTgCbkAdl3rDpab75btpTQt5ZKiq5CSY3RZfyIW0uWbTGTELm6liuRKM9+K8BQwTU7A+FFFQBA
/9eJwQYzNNA/iwoYJ2WTPd6pBlzXriNLu9M+/2bYicNBSuH1PBR9v2ESrTB6k7EiV1zvBXV9NuG/
sFt4MumWMuSNwP2W38bQATxxW/l0IrmaXGOC/w==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
lhKf/Vgj6pHpme1ji4HVe36BU8pMkam/2I9lFeyOiBnIbzgdEGfLJBcEvkL33A7s0hxa6LFbHnkT
upgMpPjmIghBz3xUQ13vpiY152thFec6qvlcdg1r+GTmnBOSFl6g/OfZ3eFUhfsve6ZjQHpXnKFo
a55hN2+eP1EG9+VxGeM7XkHaeFhEIry52qtnmg072KEFIwRiGs2d/TJ4AqupuIdIiP1kTN9k+oqa
2ta1vdtqPY0dDHqrf+5YSd0CejkhQeCqg/bauLP3755SwdOPRgooG5ANT8hUpTiFMFXtU+GC9NSp
evJtMHUy1NbgMmhFHO+w3URLEdjSaBxZPD7YLdWkF65jY526tJzoek+BzEKoBaGfCaY7O1nHKXm+
89k3rPUy0Xo4/0nHpno+N/Db09heJPbnGsCwN/l+KnR6Lz8kvWziBjZe0ijOkKI+T12y3T1VeOtY
H/aqtNlQt1mhFwrbw6ezaAiDPVbCQXnly6b4tbb8+nFsxWOGIGAfLozB

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PNsQ8uEcQYrl+GaDuBaq1tQ5br5aAdaqHnyrc0NVu/JnQUk53jaiLx8Oz5fNACvWelUUk2/C+P5I
b2rbU1bb/dC6TqC5J1N0yoMYRYw58u4Lrl8Kgqgt9Rlph5Qgzzfxp+oblXF/pO4mRyAXpZhpNkFT
0Ar9BUtPOTOtJ9/g53SRnZ6GjxzfeD+25J4fcXBNo2gCTgUkwiLSsJRwTB/cJmn+dZPwPdIOHEP9
TkfDK+OrbLYO3T+DFBTCMRNH2NB1J9sc5s+nPU8iYnjgPTo6HoGW+LIlCz6yNJMZzJzoeW708utc
0fJXkT7vLDVh7olvy3V9AAY8Do0YR1kiZlhVhQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zAz8RnGHFebkJFAS+gjC+mXHW7m7We+JgSmIz15mS01u/4+9Ng0sJfkeXOClmVPTQ2Mp2Yuv6/6f
ehzUTcANilWsqLM6Q1FToCPNX/NTqodlcHirGM7b5R9yevouNT/aqH12nmbunBQmBHmehNutdCjG
r6Z7kZgeZ2ZE7MMOF0rTy1XHEPkqgMNTRoS8R/pPWPTW4/j+bn3aJj0Q/fTz4Gi3mbSUKWs2fREQ
UKiuolNJkN6DiDvhlVYHUyytXNJG44ikmBXehoQQRLapkYaxnQmMRT1ok9uY6pKoy71CtvJ3Mt2x
EQv1GU2i4qQyAOwa0mkEohWXduicU6tDz3zQwQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TK3eE9V+v1z2P1KjG4GrjhA1n3qDOpNzLGXdtjnjhF0QBFPSuhC+nmNqTPOb3p2a9r5KD0miY3Cd
+KpjH6Ao09E2/LD2Go4aLQh6vP+9BldlSKEwCGfx2NjBQrXWVH21lQR7IRjOvyTOclpd7SgtUJLw
dvebETyLiKr9C6RfnIBeptuCA3iJlXfwkh6I0JfzD5WBizQkotioZmmrXv5105pCXQ4Ta1WThFsA
2ll9dZeSjEDHUxxhfyfjryv9m4VL89ZDU/rGITsdptwB1BC1jLqmPDymY05lyECnjA6NIR5GGfI4
K2y2f4GfikKoN5r9IOvFzw963Wm82ZZPtXOKGg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 48416)
`pragma protect data_block
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
lc6ITH5CkLRzxSb+Isq5k60lnBUL9WM=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
