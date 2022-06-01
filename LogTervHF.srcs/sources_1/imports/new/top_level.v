`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2018 09:38:16 AM
// Design Name: 
// Module Name: top_level
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


module spec_anal_top_level(
    input             clk,
    input             rst,
    
    output            codec_m0,
    output            codec_m1,
    output            codec_i2s,
    output            codec_mdiv1,
    output            codec_mdiv2,
    
    output            codec_rstn,
    output            codec_mclk,
    output            codec_lrclk,
    output            codec_sclk,
    output            codec_sdin,
    input             codec_sdout,
    
    input             bt3,
    input             sw0,
    output            vol_clk,
    output            vol_ud,
    
    // Debug
    output [1:0]      aud_dout_vld,
    input             frame_start,
    input             frm_clk,
    input  [9:0]      frm_addr,
    output            frm_dout_vld,
    output [23:0]     frm_dout,
    
    output            rst_ff,
    output            init_done_ff,
    output [4:0]      bit_cntr,
    output [21:0]     div_cntr,
    output            sck_rise,
    output            sck_fall,

    output [23:0] cb_dout,
    
    output [23:0]  ram_2_real_dout_a,
    
    output         loading_samples,
    output         fft_in_progress,
    output  [3:0]  stage_cntr,
    output         new_stage
);


assign vol_clk = bt3;
assign vol_ud  = sw0;



// reg [20:0] frame_start_cntr;
// reg frame_start_reg;
// 
// always @ (posedge clk)
// if (rst | frame_start_cntr == 21'd1666666)
//     frame_start_cntr <= 0;
// else frame_start_cntr <= frame_start_cntr + 1;
//     
// always @ (posedge clk)
// if  (frame_start_cntr == 0)
//     frame_start_reg <= 1;
// else
//     frame_start_reg <= 0;
// 
// assign frame_start = frame_start_reg;





wire [23:0] aud_dout;

codec_if codec_if_inst
(
   .clk           (clk),
   .rst           (rst),
   
   .codec_m0      (codec_m0),
   .codec_m1      (codec_m1),
   .codec_i2s     (codec_i2s),
   .codec_mdiv1   (codec_mdiv1),
   .codec_mdiv2   (codec_mdiv2),
   .codec_rstn    (codec_rstn),
   .codec_mclk    (codec_mclk),
   .codec_lrclk   (codec_lrclk),
   .codec_sclk    (codec_sclk),
   .codec_sdin    (codec_sdin),
   .codec_sdout   (codec_sdout),
   
   .aud_dout_vld  (aud_dout_vld),
   .aud_dout      (aud_dout),
   
   .aud_din_vld   (2'b11),
   .aud_din_ack   (),
   .aud_din0      (),
   .aud_din1      (),
   
   .rst_ff(rst_ff),
   .init_done_ff(init_done_ff),
   .bit_cntr(bit_cntr),
   .div_cntr(div_cntr),
   .sclk_rise_out(sck_rise),
   .sclk_fall_out(sck_fall)
);


FFT_Controller controller(
    .clk          (clk),
    .rst          (rst),
    .frame_start  (frame_start),
    
    .aud_dout_vld  (aud_dout_vld),
    .aud_dout      (aud_dout),
    
    .frm_clk       (frm_clk),
    .frm_addr      (frm_addr),
    .frm_dout_vld  (frm_dout_vld),
    .frm_dout      (frm_dout),
    
    // Debug:
    .cb_dout(cb_dout),
    .ram_2_real_dout_a(ram_2_real_dout_a),
    
    .loading_samples(loading_samples),
    .fft_in_progress(fft_in_progress),
    .stage_cntr(stage_cntr),
    .new_stage(new_stage)
);
    
endmodule
