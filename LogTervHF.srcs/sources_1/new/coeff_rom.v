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


module coeff_rom #(
   parameter FILE = ""
)(
    input               clk,
    input       [9:0]   addr,
    output  reg [17:0]  dout
    );

(* ram_style = "block" *) reg [17:0] memory[0:1023];
initial $readmemb(FILE, memory);


always @ (posedge clk)
    dout <= memory[addr];

endmodule