// o_clk - 37 - PIO8 - pin10
// o_ddr - 36 - PIO5 - pin 7
// reset 77


/*

100 MHz works ok

*/

module blinky(input i_clk, input i_resetn, output [7:0] o_led, output o_clk,
              output o_lvds_clk,
             output [6:0] o_q
);

wire [11:0] x;
wire [11:0] y;
wire [23:0] color;

reg [23:0] r_color = 24'hFFFFFF;
reg [23:0] r_color_even = 24'hFFFFFF;

wire clk_sys;
wire clk_3_5;

Gowin_rPLL inst_pll(
    .clkout(clk_sys), //output clkout
    .clkin(i_clk) //input clkin
);

Gowin_CLKDIV inst_div3_5(
    .clkout(clk_3_5), //output clkout
    .hclkin(clk_sys), //input hclkin
    .resetn(i_resetn) //input resetn
);

lvds my_lvds (
	.i_clk_fast(clk_sys),
	.i_clk_div_3_5(clk_3_5),
    .i_resetn(i_resetn),
	.x(x),
	.y(y),
	.color(r_color),
	.color_even(r_color_even),
    .o_q(o_q)
);

reg [35:0] x_counter = 0;

wire [6:0] char = x[9:3];

wire [127:0] rom_dout;

    Gowin_pROM rom_instance(
        .dout(rom_dout), //output [127:0] dout
        .clk(clk_3_5), //input clk
        .oce(1'b1), //input oce
        .ce(1'b1), //input ce
        .reset(1'b0), //input reset
        .ad(char) //input [6:0] ad
    );

// swap X direction by subtraction
wire [6:0] bitpos = {y[4:1], (3'd8 - x[2:0])};

always @(posedge clk_3_5)
begin
/*
    r_color <= {x[7:0], y[7:0], 8'b00000000};
    r_color_even <= {x[7:0], y[7:0], 8'b00000000};
*/

 

    if(rom_dout[bitpos+:1])
    begin
        r_color <= 24'hFFFFFF;
        r_color_even <= 24'hFFFFFF;
    end
    else
    begin
        r_color <= 24'h000000;
        r_color_even <= 24'h000000;
    end


/*


    x_counter <= x_counter + 1;
  
    if(x == 0)
    begin
        r_color <= 24'hFFFFFF;
        r_color_even <= 24'h00FF00;
    end
    else if(x == x_counter[35:24])
    begin
        r_color <= 24'hFFFFFF;
        r_color_even <= 24'hFFFFFF;
    end
    else if(x == 959)
    begin
        r_color <= 24'h00FF00;
        r_color_even <= 24'hFFFFFF;
    end
    else if(y == 0)
    begin
        r_color <= 24'hFF0000;
        r_color_even <= 24'hFF0000;
    end
    else if(y == x_counter[35:24])
    begin
        r_color <= 24'hFF0000;
        r_color_even <= 24'hFF0000;
    end
    else if(y == 1199)
    begin
        r_color <= 24'hFF0000;
        r_color_even <= 24'hFF0000;
    end
    else
    begin
        r_color <= 24'h00FF00;
        r_color_even <= 24'h00FF00;
    end
*/
end

assign o_clk = clk_3_5;
assign o_lvds_clk = clk_3_5;


reg	[31:0]	counter;
always @(posedge clk_sys)
begin
  counter <= counter + 1'b1;
end

assign o_led[7:0] = counter[31:25];

endmodule
