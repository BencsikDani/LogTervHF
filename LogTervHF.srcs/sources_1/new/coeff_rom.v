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
    input           we,
    input           en,
    input   [10:0]  addr,
    input   [17:0]  din,
    output  [17:0]  dout
    );

(* ram_style = "block" *) reg [17:0] memory[2047:0];

initial $readmemh("INSERT.txt", memory);
//Need to be INSERTED!!

reg [17:0] dout_reg;
always @ (posedge clk)
if (en)
    dout_reg <= memory[addr];
    
assign dout = dout_reg;

//dbg_array??

endmodule