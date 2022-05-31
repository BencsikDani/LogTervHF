`timescale 1ns / 1ps

module codec_if
(
   input             clk,           // Rendszer�rajel
   input             rst,           // Glob�lis reset, akt�v magas
   
   // CODED m�d be�ll�t� pinek
   output            codec_m0,
   output            codec_m1,

   output            codec_i2s,     // ???
   // MCLK/LRCK be�ll�t� pinek
   output            codec_mdiv1,
   output            codec_mdiv2,
   
   output            codec_rstn,    // CODEC akt�v alacsony reset jele
   output            codec_mclk,    // CODEC master clock
   output            codec_lrclk,   // CODEC  Jobb/bal csatorna kiv�laszt� jele. Frekvenci�ja megegyezik a mintav�teli frekvenci�val.
   output            codec_sclk,    // Bit clock
   output            codec_sdin,    // DAC soros adatbemenete
   input             codec_sdout,   // ADC soros adatkimenete
   
   
   output reg [ 1:0] aud_dout_vld,  // 2 bites kimenet; a CODEC-t�l fogadott p�rhuzamos adat �rv�nyes (mindk�t csatorn�ra 1-1 bit), 1 rendszer�rajel hossz�s�g� impulzus
   output     [23:0] aud_dout,      // 24 bites kimenet; a CODEC-t�l fogadott p�rhuzamos adat. �rt�ke akkor �rv�nyes, ha valamelyik aud_dout_vld jel 1 �rt�k�
   
   input      [ 1:0] aud_din_vld,   //  2 bites bemenet; DAC bemeneti adat (aud_din0, illetve aud_din1) �rv�nyes.
   output reg [ 1:0] aud_din_ack,   // 2 bites kimenet; azt jelzi, hogy az I2S interf�sz a megfelel� (0. vagy 1. csatorna) adatot beolvasta
   input      [23:0] aud_din0,      // 24 bites bemenet; a DAC 0. csatorna p�rhuzamos adata
   input      [23:0] aud_din1       // 24 bites bemenet; a DAC 1. csatorna p�rhuzamos adata
);


begin

// M�d �s MCLK/LRCLK oszt�s be�ll�t�sa
assign codec_m0      = 1'b0;
assign codec_m1      = 1'b0;
assign codec_i2s     = 1'b0;
assign codec_mdiv1   = 1'b1;
assign codec_mdiv2   = 1'b1;



// Rendszer�rajel oszt�s�ra hivatott sz�ml�l� (50 MHz)
reg [21:0] div_cntr;
always @ (posedge clk)
if (rst==1)
  div_cntr <= 0;
else
  div_cntr <= div_cntr + 1;

// �rajelek gener�l�sa
assign codec_lrclk  = div_cntr[10];     // div_cntr / 1024 = 48.828125 kHz
assign codec_sclk   = div_cntr[4];      // div_cntr / 16 = 3.125 MHz
assign codec_mclk   = div_cntr[0];      // div_cntr / 1 = 50 MHz



wire sclk_fall;     // SCLK lefut� �l�nek jelz�se   
wire sclk_rise;     // SCLK felfut� �l�nek jelz�se   
assign sclk_fall    = (div_cntr[5:0]==5'b11111);
assign sclk_rise    = (div_cntr[5:0]==5'b01111);



// SCLK-kat sz�ml�l� bitsz�ml�l�
wire [4:0] bit_cntr;
assign bit_cntr = div_cntr[9:5];



// Alacsony akt�v reset gener�l�s a CODEC-nek
// System reset ut�n m�g ~8 mintav�teli ideig tart
reg rst_ff;             
always @ (posedge clk)
if (rst==1)
   rst_ff <= 1'b0;
else if (div_cntr[20:10]==7)
   rst_ff <= 1'b1;
   
assign codec_rstn = rst_ff;



// Inicializ�ci� k�sz
// CODEC reset ut�n v�runk m�g min. 1045 mintav�teli id�t, �s jelz�nk
reg init_done_ff;
always @ (posedge clk)
if (rst==1)
   init_done_ff <= 1'b0;
else if (div_cntr[21:11]==12)
   init_done_ff <= 1'b1;



// Bemeneti shift regiszter (codec_sdout-n�l)
reg  [23:0] shr_rx;
// SCLK felfut� �l�re beh�zzuk a shift regiszterbe a minta k�vetkez� bitj�t
always @ (posedge clk)
if (sclk_rise==1)
   shr_rx <= {shr_rx[22:0], codec_sdout};



// 0-�s csatorna validit�s jelz�se, ha kigy�lt a 24 bit,
// SCLK felfut� �le van �s inicializ�lva vagyunk
// K�l�nben nem valid
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

// CODEC-b�l j�v� p�rhuzamos�tott adat kik�t�se az aud_dout kimenetre, az FPGA fel�
assign aud_dout = shr_rx;



// Kimeneti shift regiszter (codec_sdin-n�l)
reg  [23:0] shr_tx;
// Ha nem vagyunk inicialit�lva, akkor a tartalma 0
// A megfelel� csatorna p�rhuzamos adat�nak bet�lt�s a kimeneti shift regiszterbe
// SCLK lefut� �leire fokozatosan l�ptetj�k ki az adatot a shift regiszterb�l
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

// Az FPGA-b�l j�v� soros�tott adat kik�t�se a codec_sdin kimenetre, a CODEC fel�
assign codec_sdin = shr_tx[23];



// ACK k�ld�se az adott csatorn�n �rkez� p�rhuzamos adat FPGA-t�l val� fogad�s�hoz
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