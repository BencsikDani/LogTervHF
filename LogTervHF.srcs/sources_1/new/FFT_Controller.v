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
    
    input [9:0] frm_addr,
    output frm_dout_vld,
    output [23:0] frm_dout
    );
    
reg [9:0] smpl_addr_cntr;
wire [23:0] cb_dout;
wire [9:0] cb_addr_out;
wire fft_rdy; //signal for FFT finished, 1 clk period long
wire [23:0] fft_dout_re; //data of real parts of calcualted frequency components
wire [23:0] fft_dout_im; //data of imaginary parts of calcualted frequency components
wire [9:0] fft_addr_in; //address of real and imaginary parts of calcualted frequency components
wire [23:0] dB; // data of calculated dB value
wire log2_done; // the dB value of one element is calculated, can be written in RAM
wire dB_vld; // Wire to dB_vld_reg
reg dB_vld_reg; // dB values calculated, ready for HDMI
reg frame_dout_rdy; //signal for HDMI if data can be read from output

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

//reg fft_rdy_reg;

FFT_Core calc (
    .clk(clk),
    .rst(rst),
    
    .frame_start(frame_start),
    .fft_done(fft_rdy),
    
    .cb_dout(cb_dout),
    .cb_addr_out(cb_addr_out),
    
    .fft_real_addr(fft_addr_in),
    .fft_imag_addr(fft_addr_in),
    .fft_real_out(fft_dout_re),
    .fft_imag_out(fft_dout_im)

);

smpl_ram dB_values(
    .clk_a(clk),
    .we_a(log2_done),
    .addr_a(fft_addr_in),
    .din_a(dB),
    
    .clk_b(clk),
    .we_b(frm_dout_vld),
    .addr_b(frm_addr),
    .dout_b(frm_dout)   
);

assign dB_vld = dB_vld_reg;

fft_to_dB convert (
    .clk(clk),
    .rst(rst),
    .fft_rdy(fft_rdy),
    .dre(fft_dout_re),
    .dim(fft_dout_im),
    .fft_addr_in(fft_addr_in),
    .dout(dB),
    .log2_vld(log2_done),
    .dB_vld(dB_vld)
);

//if a frame starts, data of the samples are copied for FFT
//for the time of FFT calculation, on the output the previous dB values are avaiable
//when the dB calculation starts, the dB output for HDMI is not avaiable
//after the dB calculation is done, the new values become avaiable for HDMI, and the circle starts again
//State logic:


always @ (posedge clk)
if (rst)
begin
    frame_dout_rdy <= 1'b0;
    dB_vld_reg <= 1'b0;
end

always @ (posedge clk)
if (fft_rdy)
    dB_vld_reg <= 1'b0;

always @ (posedge clk)
if (dB_vld_reg)
    frame_dout_rdy = 1'b1;
else
    frame_dout_rdy = 1'b0;     

assign frm_dout_vld = frame_dout_rdy;

endmodule
