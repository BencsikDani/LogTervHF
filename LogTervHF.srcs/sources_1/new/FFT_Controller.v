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


module FFT_Controller(
    input clk,
    input rst,
    input frame_start,
    
    input aud_dout_vld,
    input [23:0] aud_dout,
    
    
    output fft_vld,
    
    );
    
reg [9:0] smpl_addr_cntr;
wire [23:0] cb_dout;
wire [9:0] cb_addr_out;

always @ (posedge clk)
if (rst)
    smpl_addr_cntr <= 0;
else if (aud_dout_vld)
    smpl_addr_cntr <= smpl_addr_cntr + 1;

smpl_ram circ_buff (
    .clk_a(clk),
    .we_a(aud_dout_vld),
    .addr_a(smpl_addr_cntr),
    .din_a(aud_dout),
    .dout_a(),
    
    .clk_b(clk),
    .we_b(1'b0),
    .addr_b(cb_addr_out),
    .din_b(),
    .dout_b(cb_dout)
);

endmodule
