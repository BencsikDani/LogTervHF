`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2022 09:28:19
// Design Name: 
// Module Name: fft_to_dB
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


module fft_to_dB(
    input clk,
    input rst,
    input [23:0] dre,
    input [23:0] dim,
    output [23:0] dout
    );

reg [47:0] powre;
reg [47:0] powim;
reg [48:0] sum;
    
mul_24x24 re(
    .clk(clk),
    .a(dre),
    .b(dre),
    .m(powre)
);
    
mul_24x24 im(
    .clk(clk),
    .a(dim),
    .b(dim),
    .m(powim)
);

always @ (posedge clk)
sum <= powre + powim;


endmodule
