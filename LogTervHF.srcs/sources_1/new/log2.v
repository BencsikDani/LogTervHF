`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.05.2022 13:06:19
// Design Name: 
// Module Name: log2
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


module log2(
    input clk,
    input rst,
    input log2_start,
    input [48:0] sum,
    input [17:0] mant_dout,
    output log2_done,
    output [23:0] dB,
    output [9:0] mant_addr
    );
reg [22:0] log_2;
reg finished;

always @ (posedge clk)
if(log2_start)
    

always @ (posedge clk)
if(log2_start)
begin
finished <= 1'b0;

for

finished <= 1'b1;     
end

assign log2_done = finished;    
assign dB = {1'b0, log_2} + {log_2, 1'b0};

endmodule
