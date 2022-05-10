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
    
    
    output frm_dout_vld
    
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

reg fft_rdy_reg;

FFT_Core calc (
    .clk(clk),
    .rst(rst),
    .frame_start(frame_start),
    .cb_dout(cb_dout),
    .cb_addr_out(cb_addr_out),
    .fft_rdy(fft_rdy_reg),
    .fft_dout_re(),
    .fft_dout_im(),
    .fft_addr_in_re(),
    .fft_addr_in_im()
);

reg state_logic;
reg frame_dout_rdy;

always @ (posedge clk)
if (rst)
    state_logic <= 1'b0;
else if (frame_start)
    state_logic <= 1'b1;
    
always @ (posedge clk)
if (state_logic & fft_rdy_reg)
    state_logic <= 1'b0;

always @ (posedge clk)
if(!state_logic)
begin
frame_dout_rdy <= 1'b0;



end

assign frm_dout_vld = frame_dout_rdy;

endmodule
