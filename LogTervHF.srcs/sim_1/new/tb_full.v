`timescale 1ns / 1ps

module tb_full;

reg clk;
reg rst;

wire codec_lrclk;
wire codec_sclk;

reg [31:0] sim_data;
reg  [4:0] sim_cntr;

// Initial
initial
begin
    clk = 1;
    rst = 1;
    sim_data = 32'b11001100110011001100110011001100;
    #100 rst = 0;
end

always #5 clk <= ~clk;



always @ (negedge codec_lrclk)
begin
   sim_cntr <= 5'd31;
   sim_data <= {sim_data[30:0], sim_data[31]};
end

always @ (posedge codec_lrclk) 
begin
   sim_cntr <= 5'd31;
   sim_data <= {sim_data[30:0], sim_data[31]};
end

always @ (negedge codec_sclk)
   sim_cntr <= sim_cntr - 1;


assign codec_sdout = sim_data[sim_cntr];




hdmi_top hdmi_top_inst(
    .clk100M(clk),
    .rstbt(rst),
    .led_r(),
    .sw(sw),
    .bt(bt),
    
    .hdmi_tx_d0_p(),
    .hdmi_tx_d0_n(),
    .hdmi_tx_d1_p(),
    .hdmi_tx_d1_n(),
    .hdmi_tx_d2_p(),
    .hdmi_tx_d2_n(),
    .hdmi_tx_clk_p(),
    .hdmi_tx_clk_n(),
    .hdmi_tx_cec(),
    .hdmi_tx_hpdn(),
    .hdmi_tx_scl(),
    .hdmi_tx_sda(),

    .codec_m0(),
    .codec_m1(),
    .codec_i2s(),
    .codec_mdiv1(),
    .codec_mdiv2(),

    .codec_rstn(),
    .codec_mclk(),
    .codec_lrclk(codec_lrclk),
    .codec_sclk(codec_sclk),
    .codec_sdin(),
    .codec_sdout(codec_sdout),

    .vol_clk(),
    .vol_ud()
);


endmodule
