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
wire [9:0] dB_addr;
wire log2_done; // the dB value of one element is calculated, can be written in RAM
wire dB_vld; // Wire to dB_vld_reg
wire all_dB_vld;
reg frame_dout_rdy; //signal for HDMI if data can be read from output


// Impulzussal való jelzése annak, hogy kész az FFT eredménye
reg fft_rdy_posedge;
always @ (posedge fft_rdy)
fft_rdy_posedge <= 1;

always @ (posedge clk)
if (fft_rdy_posedge)
    fft_rdy_posedge <= 0;


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

FFT_Core core(
    .clk(clk),
    .rst(rst),
    
    .frame_start(6),
    .fft_done(fft_rdy),
    
    .cb_dout(cb_dout),
    .cb_addr_out(cb_addr_out),
    
    .fft_real_addr(fft_addr_in),
    .fft_imag_addr(fft_addr_in),
    .fft_real_out(fft_dout_re),
    .fft_imag_out(fft_dout_im)

);

fft_to_dB convert(
	.clk(clk),
	.rst(rst),
	.fft_rdy(fft_rdy),

	.fft_result_addr(fft_addr_in),
	.fft_result_re(fft_dout_re),
	.fft_result_im(fft_dout_im),

	.dB_result_addr(dB_addr),
	.dB_result_dout(dB),
	.dB_result_done(dB_vld),
	.all_dB_calculated(all_dB_vld)
);




smpl_ram dB_results(
    .clk_a(clk),
    .we_a(dB_vld),
    .addr_a(dB_addr),
    .din_a(dB),
    
    .clk_b(clk),
    .we_b(),
    .addr_b(frm_addr),
    .dout_b(frm_dout)   
);



// frame_start hatására megkezdõdik az FFT a minták alapján.
// Amíg az FFT tart, addig még az elõzõ dB értékek vannak a kimeneten. 
// Ha az FFT kész és kezdõdik a dB értékek kiszámítása, akkor a HDMI nem olvashat a dB kimenetekrõl.
// Ha a dB értékek is kiszámolódtek, akkor az új értékeket olvashatja is már a HDMI.
//
// Ezek után megy tovább a körforgás


always @ (posedge clk)
if (rst | fft_rdy_posedge)
    frame_dout_rdy = 1'b0;
else if (all_dB_vld)
    frame_dout_rdy = 1'b1;

assign frm_dout_vld = frame_dout_rdy;


endmodule
