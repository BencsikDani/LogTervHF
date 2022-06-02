`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2019 04:56:58 PM
// Design Name: 
// Module Name: hdmi_top
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


module hdmi_top(
   input  wire       clk100M,
   input  wire       rstbt,
   output wire [7:0] led_r,
   input  wire [7:0] sw,
   inout  wire [3:0] bt,
   
// input  wire       hdmi_rx_d0_p,
// input  wire       hdmi_rx_d0_n,
// input  wire       hdmi_rx_d1_p,
// input  wire       hdmi_rx_d1_n,
// input  wire       hdmi_rx_d2_p,
// input  wire       hdmi_rx_d2_n,
// input  wire       hdmi_rx_clk_p,
// input  wire       hdmi_rx_clk_n,
// input  wire       hdmi_rx_cec,
// output wire       hdmi_rx_hpd,
// input  wire       hdmi_rx_scl,
// inout  wire       hdmi_rx_sda,
   
   output wire       hdmi_tx_d0_p,
   output wire       hdmi_tx_d0_n,
   output wire       hdmi_tx_d1_p,
   output wire       hdmi_tx_d1_n,
   output wire       hdmi_tx_d2_p,
   output wire       hdmi_tx_d2_n,
   output wire       hdmi_tx_clk_p,
   output wire       hdmi_tx_clk_n,
   input  wire       hdmi_tx_cec,
   input  wire       hdmi_tx_hpdn,
   input  wire       hdmi_tx_scl,
   input  wire       hdmi_tx_sda,
   
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
   
   output            vol_clk,
   output            vol_ud
);

//******************************************************************************
//* Generating the 200 MHz reference clock for the IDELAYCTRL.                 *
//******************************************************************************
wire clk200M;
wire clk40M;
wire pll_clkfb;
wire pll_locked;

PLLE2_BASE #(
   .BANDWIDTH("OPTIMIZED"),         // OPTIMIZED, HIGH, LOW
   .CLKFBOUT_MULT(10),              // Multiply value for all CLKOUT, (2-64)
   .CLKFBOUT_PHASE(0.0),            // Phase offset in degrees of CLKFB, (-360.000-360.000).
   .CLKIN1_PERIOD(1000.0 / 100.0),  // Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
   .CLKOUT0_DIVIDE(5),              // CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for each CLKOUT (1-128)
   .CLKOUT1_DIVIDE(25),
   .CLKOUT2_DIVIDE(1),
   .CLKOUT3_DIVIDE(1),
   .CLKOUT4_DIVIDE(1),
   .CLKOUT5_DIVIDE(1),
   .CLKOUT0_DUTY_CYCLE(0.5),        // CLKOUT0_DUTY_CYCLE - CLKOUT5_DUTY_CYCLE: Duty cycle for each CLKOUT (0.001-0.999).
   .CLKOUT1_DUTY_CYCLE(0.5),
   .CLKOUT2_DUTY_CYCLE(0.5),
   .CLKOUT3_DUTY_CYCLE(0.5),
   .CLKOUT4_DUTY_CYCLE(0.5),
   .CLKOUT5_DUTY_CYCLE(0.5),
   .CLKOUT0_PHASE(0.0),             // CLKOUT0_PHASE - CLKOUT5_PHASE: Phase offset for each CLKOUT (-360.000-360.000).
   .CLKOUT1_PHASE(0.0),
   .CLKOUT2_PHASE(0.0),
   .CLKOUT3_PHASE(0.0),
   .CLKOUT4_PHASE(0.0),
   .CLKOUT5_PHASE(0.0),
   .DIVCLK_DIVIDE(1),               // Master division value, (1-56)
   .REF_JITTER1(0.0),               // Reference input jitter in UI, (0.000-0.999).
   .STARTUP_WAIT("FALSE")           // Delay DONE until PLL Locks, ("TRUE"/"FALSE")
) clk_generator1 (
   .CLKOUT0(clk200M),               // 1-bit output: CLKOUT0
   .CLKOUT1(clk40M),                // 1-bit output: CLKOUT1
   .CLKOUT2(),                      // 1-bit output: CLKOUT2
   .CLKOUT3(),                      // 1-bit output: CLKOUT3
   .CLKOUT4(),                      // 1-bit output: CLKOUT4
   .CLKOUT5(),                      // 1-bit output: CLKOUT5
   .CLKFBOUT(pll_clkfb),            // 1-bit output: Feedback clock
   .LOCKED(pll_locked),             // 1-bit output: LOCK
   .CLKIN1(clk100M),                // 1-bit input: Input clock
   .PWRDWN(1'b0),                   // 1-bit input: Power-down
   .RST(rstbt),                     // 1-bit input: Reset
   .CLKFBIN(pll_clkfb)              // 1-bit input: Feedback clock
);

wire rst;
assign rst = ~pll_locked;

wire clk_200M;
BUFG BUFG_200M (
   .O(clk_200M),
   .I(clk200M)
);



// wire rx_clk, rx_clk_5x;
// wire [7:0] rx_red, rx_green, rx_blue;
// wire rx_dv, rx_hs, rx_vs;
// wire [5:0] rx_status;
// hdmi_rx hdmi_rx_0(
//    .clk_200M(clk_200M),
//    .rst(rst),
//    .hdmi_rx_cec(hdmi_rx_cec),
//    .hdmi_rx_hpd(hdmi_rx_hpd),
//    .hdmi_rx_scl(hdmi_rx_scl),
//    .hdmi_rx_sda(hdmi_rx_sda),
//    .hdmi_rx_clk_p(hdmi_rx_clk_p),
//    .hdmi_rx_clk_n(hdmi_rx_clk_n),
//    .hdmi_rx_d0_p(hdmi_rx_d0_p),
//    .hdmi_rx_d0_n(hdmi_rx_d0_n),
//    .hdmi_rx_d1_p(hdmi_rx_d1_p),
//    .hdmi_rx_d1_n(hdmi_rx_d1_n),
//    .hdmi_rx_d2_p(hdmi_rx_d2_p),
//    .hdmi_rx_d2_n(hdmi_rx_d2_n),
//    .rx_clk(rx_clk),
//    .rx_clk_5x(rx_clk_5x),
//    .rx_red(rx_red),
//    .rx_green(rx_green),
//    .rx_blue(rx_blue),
//    .rx_dv(rx_dv),
//    .rx_hs(rx_hs),
//    .rx_vs(rx_vs),
//    .rx_status(rx_status)
// );


// Loopback
// Replace with image processing block
wire [7:0] tx_red, tx_green, tx_blue;
wire tx_dv, tx_hs, tx_vs;
// assign tx_dv    = rx_dv;
// assign tx_hs    = rx_hs;
// assign tx_vs    = rx_vs;
// assign tx_red   = rx_red;
// assign tx_green = rx_green;
// assign tx_blue  = rx_blue;

reg [10:0] h_cntr;
reg [9:0]  v_cntr;
reg h_sync, v_sync, vde;
reg fft_start;



hdmi_tx hdmi_tx_0(
   .tx_clk(clk40M),
   .tx_clk_5x(clk200M),
   .rst(rst),
   .tx_red(tx_red),
   .tx_green(tx_green),
   .tx_blue(tx_blue),
   .tx_dv(tx_dv),
   .tx_hs(tx_hs),
   .tx_vs(tx_vs),
   .hdmi_tx_clk_p(hdmi_tx_clk_p),
   .hdmi_tx_clk_n(hdmi_tx_clk_n),
   .hdmi_tx_d0_p(hdmi_tx_d0_p),
   .hdmi_tx_d0_n(hdmi_tx_d0_n),
   .hdmi_tx_d1_p(hdmi_tx_d1_p),
   .hdmi_tx_d1_n(hdmi_tx_d1_n),
   .hdmi_tx_d2_p(hdmi_tx_d2_p),
   .hdmi_tx_d2_n(hdmi_tx_d2_n)
);



// h_cntr
always @ (posedge clk40M)
if (rst | h_cntr == 11'd1055)
    h_cntr <= 0;
else
    h_cntr <= h_cntr + 1;

// v_cntr
always @ (posedge clk40M)
if (rst | (v_cntr == 10'd627 & h_cntr == 11'd1055) )
    v_cntr <= 0;
else if (h_cntr == 11'd1055)
    v_cntr <= v_cntr + 1;

assign frm_addr = v_cntr;

    
// h_sync
always @ (posedge clk40M)
if (rst)
    h_sync <= 0;
else if (11'd839 < h_cntr & h_cntr <= 11'd967)
    h_sync <= 1;
else
    h_sync <= 0;

// v_sync
always @ (posedge clk40M)
if (rst)
    v_sync <= 0;
else if (10'd600 < v_cntr & v_cntr <= 10'd604)
    v_sync <= 1;
else
    v_sync <= 0;

always @ (posedge clk40M)
if (rst)
    vde <= 0;
else if (h_cntr < 11'd800 & v_cntr < 10'd600)
    vde <= 1;
else
    vde <= 0;


assign tx_hs = h_sync;
assign tx_vs = v_sync;
assign tx_dv = vde;



// Vezetékek és regiszterek a spektrum analizátor dB_ram-ja és a display_ram közötti másoláshoz 
reg  [9:0]  display_ram_write_addr;   // Címszámláló
wire        frm_dout_vld;
wire [23:0] frm_dout;

wire [1:0]  aud_dout_vld;
wire rst_ff;
wire init_done_ff;
wire [4:0] bit_cntr;
wire [21:0] div_cntr;
wire sck_rise;
wire sck_fall;
// Debug
wire [23:0] cb_dout;
wire [23:0] ram_2_real_dout_a;

wire loading_samples;
wire fft_in_progress;
wire [3:0] stage_cntr;
wire new_stage;


// Spektrum analizátor példányosítása:
spec_anal_top_level spec_anal(
    .clk(clk100M),
    .rst(rstbt),

    .codec_m0(codec_m0),
    .codec_m1(codec_m1),
    .codec_i2s(codec_i2s),
    .codec_mdiv1(codec_mdiv1),
    .codec_mdiv2(codec_mdiv2),

    .codec_rstn(codec_rstn),
    .codec_mclk(codec_mclk),
    .codec_lrclk(codec_lrclk),
    .codec_sclk(codec_sclk),
    .codec_sdin(codec_sdin),
    .codec_sdout(codec_sdout),
    
    .aud_dout_vld(aud_dout_vld),

    .bt3(bt[3]),
    .sw0(sw[0]),
    .vol_clk(vol_clk),
    .vol_ud(vol_ud),

    .frame_start(fft_start),
    .frm_clk(clk40M),
    .frm_addr(display_ram_write_addr),
    .frm_dout_vld(frm_dout_vld),
    .frm_dout(frm_dout),
    
     .rst_ff(rst_ff),
     .init_done_ff(init_done_ff),
     .bit_cntr(bit_cntr),
     .div_cntr(div_cntr),
     .sck_rise(sck_rise),
     .sck_fall(sck_fall),
     
     // Debug:
    .cb_dout(cb_dout),
    
    .ram_2_real_dout_a(ram_2_real_dout_a),
    
    .loading_samples(loading_samples),
    .fft_in_progress(fft_in_progress),
    .stage_cntr(stage_cntr),
    .new_stage(new_stage)
);

assign led_r = {1'b0, loading_samples, fft_in_progress, stage_cntr[3:0], new_stage};



// fft_start
// Ahogy elkezdõdött 1 frame-nek a kiadása, már kezdhetjük is számolni a következõ FFT-t
// A jel a 100 MHz-es órajelrõl jár, hogy szinkronban legyen a spektrum analizátorral mûködésével.
reg v_cntr_started;
reg fft_start_ff;

always @ (posedge clk100M)
if (rst | fft_start)
    fft_start <= 0;
else if (fft_start_ff)
    fft_start <= 1;
 
always @ (posedge clk100M)
if (rst | fft_start_ff)
    fft_start_ff <= 0;
else if (v_cntr_started)
    fft_start_ff <= 1;
 
always @ (posedge clk40M)
if (rst | v_cntr_started)
    v_cntr_started <= 0;
else if (v_cntr == 10'd0)
    v_cntr_started <= 1;


// Valid dB értékek elvétele a spektrum analizátortól

reg display_ram_we;     // Engedélyezõ jel az írásra
// Hogyha vannak valid értékek a spektrum analizátor dB ram-jában és
// már nem a látható tartományban vagyunk, akkor írhatjuk a display_ram tartalmát. 
always @ (posedge clk40M)
if (rst | v_cntr == 10'b0 | display_ram_write_addr == 10'd1023)
    display_ram_we <= 0;
else if (frm_dout_vld & (10'd600 < v_cntr))
    display_ram_we <= 1;


// Ha elkezdõdik a display_ram írása, akkor a címszámláló elindul és a végénél megáll
always @ (posedge clk40M)
if (rst | v_cntr == 10'b0)
    display_ram_write_addr <= 0;
else if (display_ram_we & display_ram_write_addr != 10'd1023)
    display_ram_write_addr <= display_ram_write_addr + 1;



wire [23:0] display_ram_dout;

// Memória a valid értékek tárolására
smpl_ram display_ram(
    .clk_a(clk40M),
    .we_a(display_ram_we),
    .addr_a(display_ram_write_addr),
    .din_a(frm_dout),
    .dout_a(),
    
    .clk_b(clk40M),
    .we_b(1'b0),
    .addr_b(v_cntr),
    .din_b(),
    .dout_b(display_ram_dout)
);



// Spektrum kirajzolása

reg [7:0] red, green, blue;

always @ (posedge clk40M)
if (vde)
begin
    if ( h_cntr[9:0] <= {1'b0, display_ram_dout[23:15]} )
    begin
        red   <= 8'd30;  
        green <= 8'd144;
        blue  <= 8'd255;
    end
    else
    begin
        red   <= 8'b0;
        green <= 8'b0;
        blue  <= 8'b0;
    end
end
else
begin
    red   <= 8'b0;
    green <= 8'b0;
    blue  <= 8'b0;
end


assign tx_red = red;
assign tx_green = green;
assign tx_blue = blue;




endmodule
