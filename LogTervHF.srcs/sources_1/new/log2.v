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
reg finished_exp;   //finished finding exponent (Integer part)
reg finished_man;   //finished finding mantissa (Fraction part)
reg [5:0] digit_cntr;
reg [48:0] digit_pos;

always @ (posedge clk)
if(log2_start)
begin
    finished_exp <= 1'b0;
    finished_man <= 1'b0;
    digit_cntr <= 6'b110000;
    digit_pos <= 49'b1000000000000000000000000000000000000000000000000;
end
    

always @ (posedge clk)
if(~finished_exp)
begin
if (sum >= digit_pos)
begin
log2[22:17] <= digit_cntr;
sum = sum - digit_pos;
finished_exp <= 1'b1;
end
else digit_cntr <= digit_cntr - 1;     
end

always @ (posedge clk)
if(finished_exp)
begin

finished_man <= 1'b1;
end

assign log2_done = finished_man;    
assign dB = {1'b0, log_2} + {log_2, 1'b0};

endmodule
