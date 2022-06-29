`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.05.2022 11:40:13
// Design Name: 
// Module Name: tb_square
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_square(
    );

reg clk;
reg rst;
wire [23:0] d_test;
reg [47:0] quare_reg;
wire [47:0] quare;

initial
begin
    clk = 1;
    rst = 1;
    #100 rst = 0;
end

always #5 clk <= ~clk;

// s.10.13
// 4.25 = 00000000100.0100000000000
// -4.25 = 11111111011.1100000000000
assign d_test = 24'b111111110111100000000000;

// (4.25)^2 = 18.0625
// 18.0625 =     00000010010.0001000000000
//	  0000000000000000010010.00010000000000000000000000
// quare[36:13]

// Négyzetre emelés
mul_24x24 square(
    .clk(clk),
    .a(d_test),
    .b(d_test),
    .m(quare)
);

always @ (posedge clk)
quare_reg = quare;

endmodule
