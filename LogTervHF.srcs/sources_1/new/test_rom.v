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


module test_rom #(
   parameter FILE = ""
)(
    input               clk,
    input       [9:0]   addr,
    output  reg [23:0]  dout
    );

(* ram_style = "block" *) reg [23:0] memory [0:1023];
initial
begin
    $readmemb(FILE, memory);
end

always @ (posedge clk)
    dout <= memory[addr];

endmodule