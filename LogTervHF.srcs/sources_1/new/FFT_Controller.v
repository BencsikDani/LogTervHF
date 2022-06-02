`timescale 1ns / 1ps

module FFT_Controller(
    input clk,
    input rst,
    input frame_start,
    
    input [1:0]  aud_dout_vld,
    input [23:0] aud_dout,
    
    input         frm_clk,
    input  [9:0]  frm_addr,
    output        frm_dout_vld,
    output [23:0] frm_dout,
    
    // Debug:
    output [23:0] cb_dout,
     
    output [23:0]  ram_2_real_dout_a,
    
    output         loading_samples,
    output         fft_in_progress,
    output  [3:0]  stage_cntr,
    output         new_stage
    );
    
reg [9:0] smpl_addr_cntr;
//wire [23:0] cb_dout;
//wire [9:0] cb_addr_out;
wire fft_rdy; //signal for FFT finished, 1 clk period long
wire [23:0] fft_dout_re; //data of real parts of calcualted frequency components
wire [23:0] fft_dout_im; //data of imaginary parts of calcualted frequency components
wire [9:0] fft_addr_in; //address of real and imaginary parts of calcualted frequency components
wire [23:0] dB; // data of calculated dB value
wire [9:0] dB_addr;
wire log2_done; // the dB value of one element is calculated, can be written in RAM
wire dB_vld; // Wire to dB_vld_reg
wire all_dB_vld;
reg frm_dout_vld_reg; //signal for HDMI if data can be read from output


// Impulzussal való jelzése annak, hogy kész az FFT eredménye
reg fft_rdy_delay;
wire fft_rdy_posedge;

always @ (posedge clk)
fft_rdy_delay <= fft_rdy;

assign fft_rdy_posedge = fft_rdy & ~fft_rdy_delay;


always @ (posedge clk)
if (rst)
    smpl_addr_cntr <= 0;
else if (aud_dout_vld[0])
    smpl_addr_cntr <= smpl_addr_cntr + 1;

smpl_ram circ_buff (
    .clk_a(clk),
    .we_a(aud_dout_vld[0]),
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
    
    .frame_start(frame_start),
    .fft_done(fft_rdy),
    
    .cb_dout(cb_dout),
    .cb_addr_out(cb_addr_out),
    
    .fft_real_addr(fft_addr_in),
    .fft_imag_addr(fft_addr_in),
    .fft_real_out(fft_dout_re),
    .fft_imag_out(fft_dout_im),
    
    // Debug
    .ram_2_real_dout_a(ram_2_real_dout_a),
    
    .loading_samples(loading_samples),
    .fft_in_progress(fft_in_progress),
    .stage_cntr(stage_cntr),
    .new_stage(new_stage)

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
    .dout_a(),
    
    .clk_b(frm_clk),
    .we_b(1'b0),
    .addr_b(frm_addr),
    .din_b(),
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
    frm_dout_vld_reg = 1'b0;
else if (all_dB_vld)
    frm_dout_vld_reg = 1'b1;

assign frm_dout_vld = frm_dout_vld_reg;


endmodule
