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
//20log2(sqrt(re^2+im^2)) = (10/log2(10))log2(re^2+im^2) ~ 3log2(re^2+im^2)

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

reg [2:0] calc_dl;      // Delay for DSPs and adding
reg [9:0] smpl_cntr;    // Counter for samples
reg [47:0] powre_reg;   // Register for self-multiplied real value
wire[47:0] powre;       // Wire for self-multiplied real value
reg [47:0] powim_reg;   // Register for self-multiplied imaginary value
wire[47:0] powim;       // Wire for self-multiplied imaginary value
reg [48:0] sum;         // = powre + powim
reg [23:0] dB_reg;      
wire[23:0] dB;
wire [9:0] mant_addr; 
wire[17:0] mant_data_out;
reg log2_start;
reg log2_done_reg;
wire log2_done;
reg dB_calculated;

assign powre = powre_reg;
assign powim = powim_reg;
assign dB = dB_reg;
assign fft_addr_in = smpl_cntr;
assign log2_done = log2_done_reg;

log2_rom mantissa(
    .clk(clk),
    .addr(mant_addr),
    .dout(mant_data_out)
);

mul_24x24 re(
    .clk(clk),
    .a(dre),
    .b(dre),
    .m(powre)
);
    
mul_24x24 im(
    .clk(clk),
    .a(dim),
    .b(dim),
    .m(powim)
);

always @ (posedge clk)
sum <= powre + powim;

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

always @ (posedge clk)
if (rst)
begin
    calc_dl <= 3'b000;
//    fft_rdy_reg <= 1'b0;
    smpl_cntr <= 10'b0000000000;
end

always @ (posedge fft_rdy)
smpl_cntr <= 10'b0000000000;

always @ (posedge clk)
if(fft_rdy)
    calc_dl <= calc_dl + 1;

always @ (posedge clk)
if (fft_rdy & calc_dl == 3'b111 & smpl_cntr < 10'b1111111111)
begin
//fft_rdy_reg <= 1'b0;        
log2_start <= 1'b1;    
end

always @ (posedge clk)
if(log2_start)
begin
    log2_start = 1'b0;
    if(log2_done)
        begin
        if(smpl_cntr == 10'b1111111111)
            begin
            log2_start <= 1'b0;
            log2_done_reg <= 1'b0;
            end
        else
            begin
            log2_done_reg <= 1'b0;
            smpl_cntr <= smpl_cntr + 1;
            log2_start <= 1'b1;
            end
        end    
end

always @ (posedge clk)
if(smpl_cntr < 10'b1111111111)
    dB_calculated <= 1'b0;
else if (smpl_cntr == 10'b1111111111 & log2_done)
    dB_calculated <= 1'b1;


assign log2_vld = log2_done;
assign dout = dB;
assign dB_vld = dB_calculated;

endmodule
