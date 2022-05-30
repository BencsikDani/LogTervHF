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

reg [2:0] calc_dl;      // Késleltetés a szorzások és összeadás elvégzésének bevárására
reg [9:0] smpl_cntr;    // Minták számlálója
reg [47:0] powre_reg;   // Valós rész négyzetének regisztere
wire[47:0] powre;       // Vezeték valós rész négyzetének
reg [47:0] powim_reg;   // Képzetes rész négyzetének regisztere
wire[47:0] powim;       // Vezeték képzetes rész négyzetének
reg [48:0] sum;         // Valós és képzetes rész négyzetösszege
reg [23:0] dB_reg;      // Regiszter és vezeték a kistámított dB értékek memóriába írásához
wire[23:0] dB;          
wire [9:0] mant_addr;   // Cím és adatvezetékek a log2 törtrészeket tartalmazó memóriához.
wire[17:0] mant_data_out;
reg log2_start;         // A log2 számítás kezdetét jelzõ regiszter
reg log2_done_reg;      // A log2 számítás végét jelzõ regiszter és vezeték
wire log2_done;
reg dB_calculated;      // Flag a dB számítások befejeztérõl

assign powre = powre_reg;
assign powim = powim_reg;
assign dB = dB_reg;
assign fft_addr_in = smpl_cntr;
assign log2_done = log2_done_reg;

// A log2 törtrészek tárólójának példányosíta
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

// valós rész négyzetre emelése
mul_24x24 re(
    .clk(clk),
    .a(dre),
    .b(dre),
    .m(powre)
);

//képzetes rész négyzetre emelésee    
mul_24x24 im(
    .clk(clk),
    .a(dim),
    .b(dim),
    .m(powim)
);

// négyzetek összeadása
always @ (posedge clk)
sum <= powre + powim;

// decibelérték kiszámításának meghívása
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

// Log2 számítás kezdetét jelzõ flag
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



// Állapotlogika a dB értékek kiszámításához
always @ (posedge clk)
if(smpl_cntr < 10'b1111111111)
    dB_calculated <= 1'b0;
else if (smpl_cntr == 10'b1111111111 & log2_done)
    dB_calculated <= 1'b1;

assign log2_vld = log2_done;
assign dout = dB_reg;
assign dB_vld = dB_calculated;

endmodule
