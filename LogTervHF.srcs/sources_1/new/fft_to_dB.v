`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2022 09:28:19
// Design Name: 
// Module Name: fft_to_dB
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

//Converting FFT values to dB
//20log10(sqrt(re^2+im^2)) = (10/log2(10))log2(re^2+im^2) ~ 3log2(re^2+im^2)

module fft_to_dB(
    input clk,
    input rst,
    input fft_rdy,
    input [23:0] dre,
    input [23:0] dim,
    output [9:0] fft_addr_in,
    output [23:0] dout,
    output log2_vld,
    output dB_vld
    );

reg [2:0] calc_dl;      // K�sleltet�s a szorz�sok �s �sszead�s elv�gz�s�nek bev�r�s�ra
reg [9:0] smpl_cntr;    // Mint�k sz�ml�l�ja
reg [47:0] powre_reg;   // Val�s r�sz n�gyzet�nek regisztere
wire[47:0] powre;       // Vezet�k val�s r�sz n�gyzet�nek
reg [47:0] powim_reg;   // K�pzetes r�sz n�gyzet�nek regisztere
wire[47:0] powim;       // Vezet�k k�pzetes r�sz n�gyzet�nek
reg [48:0] sum;         // Val�s �s k�pzetes r�sz n�gyzet�sszege
reg [23:0] dB_reg;      // Regiszter �s vezet�k a kist�m�tott dB �rt�kek mem�ri�ba �r�s�hoz
wire[23:0] dB;          
wire [9:0] mant_addr;   // C�m �s adatvezet�kek a log2 t�rtr�szeket tartalmaz� mem�ri�hoz.
wire[17:0] mant_data_out;
reg log2_start;         // A log2 sz�m�t�s kezdet�t jelz� regiszter
reg log2_done_reg;      // A log2 sz�m�t�s v�g�t jelz� regiszter �s vezet�k
wire log2_done;
reg dB_calculated;      // Flag a dB sz�m�t�sok befejezt�r�l

assign powre = powre_reg;
assign powim = powim_reg;
assign dB = dB_reg;
assign fft_addr_in = smpl_cntr;
assign log2_done = log2_done_reg;

// A log2 t�rtr�szek t�r�l�j�nak p�ld�nyos�ta
log2_rom mantissa(
    .clk(clk),
    .addr(mant_addr),
    .dout(mant_data_out)
);

// rst logika
always @ (posedge clk)
if (rst)
begin
    calc_dl <= 3'b000;
    smpl_cntr <= 10'b0000000000;
end

// fft_rdy jel logika
always @ (posedge fft_rdy)
smpl_cntr <= 10'b0000000000;

always @ (posedge clk)
if(fft_rdy)
    calc_dl <= calc_dl + 1;

// val�s r�sz n�gyzetre emel�se
mul_24x24 re(
    .clk(clk),
    .a(dre),
    .b(dre),
    .m(powre)
);

//k�pzetes r�sz n�gyzetre emel�see    
mul_24x24 im(
    .clk(clk),
    .a(dim),
    .b(dim),
    .m(powim)
);

// n�gyzetek �sszead�sa
always @ (posedge clk)
sum <= powre + powim;

// decibel�rt�k kisz�m�t�s�nak megh�v�sa
log_2 sumToDB (
    .clk(clk),
    .rst(rst),
    .log2_start(log2_start),
    .sum(sum),
    .mant_dout(mant_data_out),
    .log2_done(log2_done),
    .dB(dB),
    .mant_addr(mant_addr)
);

// Log2 sz�m�t�s kezdet�t jelz� flag
always @ (posedge fft_rdy)
log2_start <= 1;


always @ (posedge clk)
if(log2_start)
    log2_start = 1'b0;

always @ (posedge clk)
if (fft_rdy & smpl_cntr < 10'b1111111111)
begin
if(smpl_cntr != 10'b0 & log2_done_reg)
log2_start <= 1'b1;
end   

always @ (posedge clk)
if(smpl_cntr == 10'b1111111111)
    log2_start <= 1'b0;
else if(log2_done_reg)
    smpl_cntr <= smpl_cntr + 1;



// �llapotlogika a dB �rt�kek kisz�m�t�s�hoz
always @ (posedge clk)
if(smpl_cntr < 10'b1111111111)
    dB_calculated <= 1'b0;
else if (smpl_cntr == 10'b1111111111 & log2_done)
    dB_calculated <= 1'b1;

assign log2_vld = log2_done;
assign dout = dB_reg;
assign dB_vld = dB_calculated;

endmodule
