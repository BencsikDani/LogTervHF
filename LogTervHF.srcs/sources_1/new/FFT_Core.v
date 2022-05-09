`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.05.2022 21:15:03
// Design Name: 
// Module Name: FFT_Core
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


module FFT_Core(
    input clk,
    input rst,
    input frame_start,
    input [23:0] cb_dout,
    output [9:0] cb_addr_out,
    

    );
    
reg [9:0]cb_addr_cntr;

always @ (posedge clk)
if (rst | frame_start)
    cb_addr_cntr <= 0;
else if(cb_addr_cntr != 10'b1111111111)
    cb_addr_cntr = cb_addr_cntr + 1;

assign cb_addr_out = cb_addr_cntr;
endmodule
