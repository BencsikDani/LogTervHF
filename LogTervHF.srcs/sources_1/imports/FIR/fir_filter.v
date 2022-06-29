`timescale 1ns / 1ps

module fir_filter(
      input clk,
      input rst,
      
      input [1:0] din_valid,
      input [23:0] din,
      
      output [1:0] dout_valid,
      output [23:0] dout
);

// vezérlõ állapot:
//  0: nincs szûrés
//  1: aktív szûrés
(* mark_debug = "true" *) reg state;
// együttható címszámláló
//  255...0 között számol, konvolúció kezdetekor 255-re állítjuk
(* mark_debug = "true" *) reg [7:0] coeff_addr_reg;
always @ (posedge clk)
if (rst)
   state <= 0;
else if (din_valid!=0)
   state <= 1;
else if (coeff_addr_reg==0)
   state <= 0;

always @ (posedge clk)
if (din_valid!=0)
   coeff_addr_reg <= 255;
else
   coeff_addr_reg <= coeff_addr_reg - 1;


// feldolgozás alatt álló csatorna
// konvolúció kezdetekor elmentjük, hogy melyik bemenet volt érvényes
(* mark_debug = "true" *) reg ch_act;
always @ (posedge clk)
if (din_valid!=0)
   ch_act <= din_valid[1];


// aktív szûrés (state) késleltetése
(* mark_debug = "true" *) reg [7:0] state_1_dl;
always @ (posedge clk)
   state_1_dl  <= {state_1_dl[6:0], state};

// együttható ROM cím:
//   {aktív csatorna, együttható címszámláló}
wire [8:0] coeff_addr;
assign coeff_addr = {ch_act, coeff_addr_reg};

// minta írási címszámláló
//   din_valid[1]-re inkrementál
reg [7:0] smpl_wr_addr_reg;
always @ (posedge clk)
if (rst)
   smpl_wr_addr_reg <= 0;
else if (din_valid[1])
   smpl_wr_addr_reg <= smpl_wr_addr_reg + 1;

// minta írási cím
//   {input valid, címszámláló}
wire [8:0] smpl_wr_addr;
assign smpl_wr_addr = {din_valid[1], smpl_wr_addr_reg};

// olvasási címszámláló
// smpl_wr_addr_reg_rõl indul új minta érkezésekor, dekrementálódik
(* mark_debug = "true" *) reg [7:0] smpl_rd_addr_reg;
always @ (posedge clk)
if (din_valid!=0)
   smpl_rd_addr_reg <= smpl_wr_addr_reg;
else
   smpl_rd_addr_reg <= smpl_rd_addr_reg - 1;

// olvasási cím: {aktív csatorna, címszámláló}
wire [8:0] smpl_rd_addr;
assign smpl_rd_addr = {ch_act, smpl_rd_addr_reg};

// Mintatár (24 bit széles)
// bementi minták: s.23
(* mark_debug = "true" *) wire [23:0] smpl_ram_dout;
smpl_ram #(
   .DATA_W(24),
   .ADDR_W(9)
)
fir_ram(
   .clk_a  (clk),
   .we_a   ((din_valid!=0)),
   .addr_a (smpl_wr_addr),
   .din_a  (din),
   .dout_a (),
   .clk_b  (clk),
   .we_b   (1'b0),
   .addr_b (smpl_rd_addr),
   .din_b  (36'b0),
   .dout_b (smpl_ram_dout)
);

// Együttható ROM
// együtthatók: s.3.31
(* mark_debug = "true" *) wire [34:0] coeff_rom_dout;
rom_512x35 coeff_rom(
   .clk  (clk),
   .addr (coeff_addr),
   .dout (coeff_rom_dout)
);

// részszorzat érdekes része:
// minta: 24 bit
// coeff: 35 bit
//    azaz:  59 bit
//  s.23*s.3.31 = s.4.54
(* mark_debug = "true" *) wire signed [58:0] mul_res;
mul_24x35 mul_fir(
      .clk  (clk),
      .a    (smpl_ram_dout),
      .b    (coeff_rom_dout),
      .m    (mul_res)
);

// Accu reset: az els? érvényes bemenet alatt
// Engedélyezés: amikor érvényes a bemenete (state_1 késleltetve pipeline latency-vel)
(* mark_debug = "true" *) wire accu_rst;
(* mark_debug = "true" *) wire accu_en;
assign accu_rst = (state_1_dl[5:4]==2'b01);
assign accu_en  = state_1_dl[4];

// Reset: az érbényes bemenetet írjuk be akkumulálás nélkül
// 256 db s.4.54 összege --> s.12.54 --> 67 bit
(* mark_debug = "true" *) reg signed [66:0] accu;
always @ (posedge clk)
if (accu_rst)
   accu <= mul_res;
else if (accu_en)
   accu <= accu + mul_res;

// kimeneti formátum: s.23,
//  accu eredmény-bõl levágjuk az alsó 31 bitet, az ezt követõ 24 bit az érvényes kimenet
//  kivéve ha túlcsordulás van, ekkor szaturáció:
//    - pozitív: +0.999999 --> h7fffff
//    - negatív: -1        --> h800000

//  Kimenet érvényes: csatorna + accu_en lefutó él
(* mark_debug = "true" *) reg [23:0] dout_reg;
(* mark_debug = "true" *) reg  [1:0] dout_valid_reg;
always @ (posedge clk)
begin
if (state_1_dl[5:4]==2'b10)
   if (accu[66]==0 & accu[65:54]!=0)
      dout_reg <= 24'h7fffff;
   else if (accu[66]==1 & accu[65:54]!=12'b111111111111)
      dout_reg <= 24'h800000;
   else
      dout_reg <= accu[54:31];

   dout_valid_reg[0] <= (state_1_dl[5:4]==2'b10 & ch_act==0);
   dout_valid_reg[1] <= (state_1_dl[5:4]==2'b10 & ch_act==1);
end

assign dout = dout_reg;
assign dout_valid = dout_valid_reg;

   
endmodule
