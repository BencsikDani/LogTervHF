`timescale 1ns / 1ps

module codec_if
(
   input             clk,           // Rendszerórajel
   input             rst,           // Globális reset, aktív magas
   
   // CODED mód beállító pinek
   output            codec_m0,
   output            codec_m1,

   output            codec_i2s,     // ???
   // MCLK/LRCK beállító pinek
   output            codec_mdiv1,
   output            codec_mdiv2,
   
   output            codec_rstn,    // CODEC aktív alacsony reset jele
   output            codec_mclk,    // CODEC master clock
   output            codec_lrclk,   // CODEC  Jobb/bal csatorna kiválasztó jele. Frekvenciája megegyezik a mintavételi frekvenciával.
   output            codec_sclk,    // Bit clock
   output            codec_sdin,    // DAC soros adatbemenete
   input             codec_sdout,   // ADC soros adatkimenete
   
   
   output reg [ 1:0] aud_dout_vld,  // 2 bites kimenet; a CODEC-tõl fogadott párhuzamos adat érvényes (mindkét csatornára 1-1 bit), 1 rendszerórajel hosszúságú impulzus
   output     [23:0] aud_dout,      // 24 bites kimenet; a CODEC-tõl fogadott párhuzamos adat. Értéke akkor érvényes, ha valamelyik aud_dout_vld jel 1 értékû
   
   input      [ 1:0] aud_din_vld,   //  2 bites bemenet; DAC bemeneti adat (aud_din0, illetve aud_din1) érvényes.
   output reg [ 1:0] aud_din_ack,   // 2 bites kimenet; azt jelzi, hogy az I2S interfész a megfelelõ (0. vagy 1. csatorna) adatot beolvasta
   input      [23:0] aud_din0,      // 24 bites bemenet; a DAC 0. csatorna párhuzamos adata
   input      [23:0] aud_din1       // 24 bites bemenet; a DAC 1. csatorna párhuzamos adata
);


begin

// Mód és MCLK/LRCLK osztás beállítása
assign codec_m0      = 1'b0;
assign codec_m1      = 1'b0;
assign codec_i2s     = 1'b0;
assign codec_mdiv1   = 1'b1;
assign codec_mdiv2   = 1'b1;



// Rendszerórajel osztására hivatott számláló (50 MHz)
reg [22:0] div_cntr;
always @ (posedge clk)
if (rst==1)
  div_cntr <= 0;
else
  div_cntr <= div_cntr + 1;

// Órajelek generálása
assign codec_lrclk  = div_cntr[11];     // div_cntr / 1024 = 48.828125 kHz
assign codec_sclk   = div_cntr[5];      // div_cntr / 16 = 3.125 MHz
assign codec_mclk   = div_cntr[1];      // div_cntr / 1 = 50 MHz



wire sclk_fall;     // SCLK lefutó élének jelzése   
wire sclk_rise;     // SCLK felfutó élének jelzése   
assign sclk_fall    = (div_cntr[5:0]==6'b111111);
assign sclk_rise    = (div_cntr[5:0]==6'b011111);



// SCLK-kat számláló bitszámláló
wire [ 4:0] bit_cntr;
assign bit_cntr = div_cntr[10:6];



// Alacsony aktív reset generálás a CODEC-nek
// System reset után még ~8 mintavételi ideig tart
reg rst_ff;             
always @ (posedge clk)
if (rst==1)
   rst_ff <= 1'b0;
else if (div_cntr[21:11]==7)
   rst_ff <= 1'b1;
   
assign codec_rstn = rst_ff;



// Inicializáció kész
// CODEC reset után várunk még min. 1045 mintavételi idõt, és jelzünk
reg init_done_ff;
always @ (posedge clk)
if (rst==1)
   init_done_ff <= 1'b0;
else if (div_cntr[22:12]==12)
   init_done_ff <= 1'b1;



// Bemeneti shift regiszter (codec_sdout-nál)
reg  [23:0] shr_rx;
// SCLK felfutó élére behúzzuk a shift regiszterbe a minta következõ bitjét
always @ (posedge clk)
if (sclk_rise==1)
   shr_rx <= {shr_rx[22:0], codec_sdout};



// 0-ás csatorna validitás jelzése, ha kigyûlt a 24 bit,
// SCLK felfutó éle van és inicializálva vagyunk
// Különben nem valid
always @ (posedge clk)
if (codec_lrclk==0 & bit_cntr==23 & sclk_rise==1 & init_done_ff==1)
   aud_dout_vld[0] <= 1'b1;
else
   aud_dout_vld[0] <= 1'b0;

//always @ (posedge clk)
//   if (div_cntr[10]==1 & bit_cntr==23 & sclk_rise==1 & init_done_ff==1)
//      aud_dout_vld[1] <= 1'b1;
//   else
//      aud_dout_vld[1] <= 1'b0;

// CODEC-bõl jövõ párhuzamosított adat kikötése az aud_dout kimenetre, az FPGA felé
assign aud_dout = shr_rx;



// Kimeneti shift regiszter (codec_sdin-nél)
reg  [23:0] shr_tx;
// Ha nem vagyunk inicialitálva, akkor a tartalma 0
// A megfelelõ csatorna párhuzamos adatának betöltés a kimeneti shift regiszterbe
// SCLK lefutó éleire fokozatosan léptetjük ki az adatot a shift regiszterbõl
always @ (posedge clk)
if (init_done_ff==0)
   shr_tx <= 0;
else if (codec_lrclk==0 & bit_cntr==31 & sclk_fall==1)
   if (aud_din_vld[0])
      shr_tx <= aud_din0;
   else
      shr_tx <= 24'b0;
//else if (div_cntr[10]==1 & bit_cntr==31 & sclk_fall==1)
//   if (aud_din_vld[1])
//      shr_tx <= aud_din1;
//   else
//      shr_tx <= 24'b0;
else if (sclk_fall==1)
   shr_tx <= {shr_tx[22:0], 1'b0};

// Az FPGA-ból jövõ sorosított adat kikötése a codec_sdin kimenetre, a CODEC felé
assign codec_sdin = shr_tx[23];



// ACK küldése az adott csatornán érkezõ párhuzamos adat FPGA-tól való fogadásához
always @ (posedge clk)
if (codec_lrclk==0 & bit_cntr==31 & sclk_fall==1 & aud_din_vld[1]==1'b1)
   aud_din_ack[0] <= 1'b1;
else
   aud_din_ack[0] <= 1'b0;
   
//always @ (posedge clk)
//if (div_cntr[10]==1 & bit_cntr==31 & sclk_fall==1 & aud_din_vld[0]==1'b1)
//   aud_din_ack[1] <= 1'b1;
//else
//   aud_din_ack[1] <= 1'b0;

end

endmodule