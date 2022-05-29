`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.05.2022 06:07:52
// Design Name: 
// Module Name: log2_rom
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


module log2_rom(
    input           clk,
    input   [9:0]  addr,
    output  [17:0]  dout
    );

(* ram_style = "block" *) reg [17:0] memory[1023:0];
initial $readmemb("log_const_mem.txt", memory);

reg [17:0] dout_reg;
always @ (posedge clk)
    dout_reg <= memory[addr];

assign dout = dout_reg;

endmodule