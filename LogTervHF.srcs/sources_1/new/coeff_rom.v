`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: BME
// Engineer: 
// 
// Create Date: 08.05.2022 21:11:25
// Design Name: 
// Module Name: coeff_rom
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


module coeff_rom(
    input           clk,
    input   [9:0]   addr,
    output  [17:0]  dout
    );

(* ram_style = "block" *) reg [17:0] memory[1023:0];
initial $readmemh("coeff_half.txt", memory);

reg [17:0] dout_reg;
always @ (posedge clk)
    dout_reg <= memory[addr];

assign dout = dout_reg;

//dbg_array??

endmodule