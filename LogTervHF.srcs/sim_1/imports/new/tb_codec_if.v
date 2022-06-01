`timescale 1ns / 1ps

module tb_codec_if();

reg clk = 1;
reg rst = 1;
wire codec_mclk;
wire codec_sclk;
wire codec_lrclk;
wire codec_sdout;

wire [31:0] sim_data;
reg  [ 4:0] sim_cntr;


codec_if uut
(
   .clk           (clk),
   .rst           (rst),
   
   .codec_m0      (),
   .codec_m1      (),
   .codec_i2s     (),
   .codec_mdiv1   (),
   .codec_mdiv2   (),
   .codec_rstn    (),
   .codec_mclk    (codec_mclk),
   .codec_lrclk   (codec_lrclk),
   .codec_sclk    (codec_sclk),
   .codec_sdin    (),
   .codec_sdout   (codec_sdout),
   
   .aud_dout_vld  (),
   .aud_dout      (),
   
   .aud_din_vld   (2'b11),
   .aud_din_ack   (),
   .aud_din0      (24'h543210),
   .aud_din1      (24'hba9876)
);


always #5
   clk <= ~clk;

initial
begin
   rst <= 1;
   #102 
   rst <= 0;
end

always @ (negedge codec_lrclk)
   sim_cntr <= 5'b11111;
   
always @ (posedge codec_lrclk)   
   sim_cntr <= 5'b11111;

always @ (negedge codec_sclk)
   sim_cntr <= sim_cntr - 1;

assign sim_data = 32'h65432100;
assign codec_sdout = sim_data[sim_cntr];

endmodule
