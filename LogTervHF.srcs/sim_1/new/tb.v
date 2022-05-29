`timescale 1ns / 1ps

module tb;

reg clk;
reg rst;
reg frame_start;
wire [9:0] rom_addr;
wire [23:0] rom_data;
wire [9:0] fft_real_addr;
wire [9:0] fft_imag_addr;
wire [23:0] fft_real_out;
wire [23:0] fft_imag_out;

wire codec_mclk;
wire codec_sclk;
wire codec_lrclk;
wire codec_sdout;

//Codec_If begin
reg [31:0] sim_data;
reg  [ 4:0] sim_cntr;
wire [1:0] aud_dout_vld;
wire [23:0] aud_dout;

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
   
   .aud_dout_vld  (aud_dout_vld),
   .aud_dout      (aud_dout),
   
   .aud_din_vld   (2'b11),
   .aud_din_ack   (),
   .aud_din0      (24'h543210),
   .aud_din1      (24'hba9876)
);

always @ (negedge codec_lrclk)
begin  
   sim_cntr <= 5'b11111;
   sim_data <= {sim_data[30:0], sim_data[31]};
end
always @ (posedge codec_lrclk) 
begin  
   sim_cntr <= 5'b11111;
   sim_data <= {sim_data[30:0], sim_data[31]};
end
always @ (negedge codec_sclk)
   sim_cntr <= sim_cntr - 1;
   


assign codec_sdout = sim_data[sim_cntr];
//Codec_If end

//Controller begin

reg [23:0] dB_out_reg;
wire [23:0]dB_out;
reg [9:0] dB_addr_cntr;
wire [9:0] dB_addr;
reg dB_vld_reg;
wire dB_vld;
always @ (posedge clk)
if(rst)
dB_addr_cntr <= 0;
else
dB_addr_cntr <= dB_addr_cntr + 1;

assign dB_out = dB_out_reg;
assign dB_addr = dB_addr_cntr;
assign dB_vld = dB_vld_reg;

FFT_Controller Controller(
    .clk(clk),
    .rst(rst),    
    .frame_start(frame_start),
    
    .aud_dout_vld(aud_dout_vld[0]),
    .aud_dout(aud_dout), 

    .frm_addr(dB_addr),
    .frm_dout_vld(dB_vld),
    .frm_dout(dB_out)
    );

test_rom #(
    .FILE("test_input.txt")
)
test_input_rom (
    .clk(clk),
    .addr(rom_addr),
    .dout(rom_data)
    );

initial
begin
    clk = 1;
    rst = 1;
    sim_data = 32'h65432100;
    #100 rst = 0;
    #10 frame_start = 1;
    #10 frame_start = 0;
    #16666666 frame_start = 1;
    #10 frame_start = 0;
end

always #5 clk <= ~clk;



endmodule
