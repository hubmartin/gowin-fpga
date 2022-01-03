//
//Written by GowinSynthesis
//Product Version "GowinSynthesis V1.9.8"
//Mon Jan  3 22:05:15 2022

//Source file index table:
//file0 "\/home/martin/dev/fpga/gowin/Gowin_V1.9.8_linux/IDE/ipcore/DDR/data/ddr.v"
`timescale 100 ps/100 ps
module Gowin_DDR (
  din,
  fclk,
  pclk,
  reset,
  q,
  o_debug
)
;
input [41:0] din;
input fclk;
input pclk;
input reset;
output [5:0] q;
output [5:0] o_debug;
wire [5:0] ddr_inst_o;
wire VCC;
wire GND;

assign o_debug = ddr_inst_o;

  OBUF \obuf_gen[0].obuf_inst  (
    .O(q[0]),
    .I(ddr_inst_o[0]) 
);
  OBUF \obuf_gen[1].obuf_inst  (
    .O(q[1]),
    .I(ddr_inst_o[1]) 
);
  OBUF \obuf_gen[2].obuf_inst  (
    .O(q[2]),
    .I(ddr_inst_o[2]) 
);
  OBUF \obuf_gen[3].obuf_inst  (
    .O(q[3]),
    .I(ddr_inst_o[3]) 
);
  OBUF \obuf_gen[4].obuf_inst  (
    .O(q[4]),
    .I(ddr_inst_o[4]) 
);
  OBUF \obuf_gen[5].obuf_inst  (
    .O(q[5]),
    .I(ddr_inst_o[5]) 
);
  OVIDEO \ovideo_gen[0].ovideo_inst  (
    .Q(ddr_inst_o[0]),
    .D6(din[36]),
    .D5(din[30]),
    .D4(din[24]),
    .D3(din[18]),
    .D2(din[12]),
    .D1(din[6]),
    .D0(din[0]),
    .PCLK(pclk),
    .FCLK(fclk),
    .RESET(reset) 
);
  OVIDEO \ovideo_gen[1].ovideo_inst  (
    .Q(ddr_inst_o[1]),
    .D6(din[37]),
    .D5(din[31]),
    .D4(din[25]),
    .D3(din[19]),
    .D2(din[13]),
    .D1(din[7]),
    .D0(din[1]),
    .PCLK(pclk),
    .FCLK(fclk),
    .RESET(reset) 
);
  OVIDEO \ovideo_gen[2].ovideo_inst  (
    .Q(ddr_inst_o[2]),
    .D6(din[38]),
    .D5(din[32]),
    .D4(din[26]),
    .D3(din[20]),
    .D2(din[14]),
    .D1(din[8]),
    .D0(din[2]),
    .PCLK(pclk),
    .FCLK(fclk),
    .RESET(reset) 
);
  OVIDEO \ovideo_gen[3].ovideo_inst  (
    .Q(ddr_inst_o[3]),
    .D6(din[39]),
    .D5(din[33]),
    .D4(din[27]),
    .D3(din[21]),
    .D2(din[15]),
    .D1(din[9]),
    .D0(din[3]),
    .PCLK(pclk),
    .FCLK(fclk),
    .RESET(reset) 
);
  OVIDEO \ovideo_gen[4].ovideo_inst  (
    .Q(ddr_inst_o[4]),
    .D6(din[40]),
    .D5(din[34]),
    .D4(din[28]),
    .D3(din[22]),
    .D2(din[16]),
    .D1(din[10]),
    .D0(din[4]),
    .PCLK(pclk),
    .FCLK(fclk),
    .RESET(reset) 
);
  OVIDEO \ovideo_gen[5].ovideo_inst  (
    .Q(ddr_inst_o[5]),
    .D6(din[41]),
    .D5(din[35]),
    .D4(din[29]),
    .D3(din[23]),
    .D2(din[17]),
    .D1(din[11]),
    .D0(din[5]),
    .PCLK(pclk),
    .FCLK(fclk),
    .RESET(reset) 
);
  VCC VCC_cZ (
    .V(VCC)
);
  GND GND_cZ (
    .G(GND)
);
  GSR GSR (
    .GSRI(VCC) 
);
endmodule /* Gowin_DDR */
