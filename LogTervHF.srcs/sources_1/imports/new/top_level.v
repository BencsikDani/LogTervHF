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


module top_level(
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
    output            vol_ud
);


assign vol_clk = bt3;
assign vol_ud  = sw0;


wire [ 1:0] aud_dout_vld;
wire [23:0] aud_dout;
reg  [23:0] aud_din0;
reg  [23:0] aud_din1;
codec_if uut
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
   .aud_din0      (aud_din0),
   .aud_din1      (aud_din1)
);

always @ (posedge clk)
if (aud_dout_vld[0]==1)
   aud_din0 <= aud_dout;

always @ (posedge clk)
if (aud_dout_vld[1]==1)
   aud_din1 <= aud_dout;
    
endmodule
