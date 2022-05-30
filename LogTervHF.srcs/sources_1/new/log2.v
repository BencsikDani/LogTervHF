`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.05.2022 13:06:19
// Design Name: 
// Module Name: log2
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


module log_2(
    input clk,
    input rst,
    input log2_start,
    input [48:0] sum,
    input [17:0] mant_dout,
    output log2_done,
    output [23:0] dB,
    output [9:0] mant_addr
    );
    
reg [22:0] log_2;
reg process;        // A kezdõ jel érkezésétõl a számolás befejezéséig aktív jel
reg finished_exp;   // Az egészrész kiszámításának befejezését jelzõ regiszter
reg finished_man;   // A törtrész kiszámítását jelzõ regiszter
reg log2_done_reg;  // A teljes számolás befejezlését jelzõ regiszter
reg [5:0] digit_cntr;   //Egészrészt számító számláló
reg [48:0] digit_pos;   //Helyiértékkeresõ shiftregiszter
reg [9:0] mant_addr_reg;
reg [48:0] sum_reg;
reg [48:0] sum_shift;
reg [23:0] dB_value_reg;


assign mant_addr = (finished_man) ?  10'b0000000000 :   mant_addr_reg;

// Kezdõértékek beállítása és reset jelre adott válasz
always @ (posedge clk)
if((log2_start & ~process) | rst)
begin 
    finished_exp <= 1'b0;
    finished_man <= 1'b0;
    log2_done_reg <= 1'b0;
    digit_cntr <= 6'b110000;
    digit_pos <= 49'b1000000000000000000000000000000000000000000000000;
    sum_shift <= 49'b0111111111100000000000000000000000000000000000000;    
    sum_reg <= sum;
    if(log2_start)
        process <= 1;    
end
    
// Az egészrészt megtaláló blokk
always @ (posedge clk)
if(~finished_exp)
begin
if(sum_reg == 49'b0)
begin
log_2 <= 23'b0;
finished_exp <= 1'b1;
finished_man <= 1'b1;
end    
else if (sum_reg >= digit_pos)
begin
log_2[22:17] <= digit_cntr;
finished_exp <= 1'b1;
end
else 
begin
digit_cntr <= digit_cntr - 1;
digit_pos <= digit_pos >> 1;
sum_shift <= sum_shift >> 1;     
end
end

//Az egészrész után a törtészt megtaláló blokk
always @ (posedge clk)
if(finished_exp & ~finished_man)
begin
if (digit_cntr > 6'b001001)
    mant_addr_reg <= sum_reg & sum_shift;
else
begin
    sum_reg = sum_reg <<< (6'b001010 - digit_cntr);
    mant_addr_reg <= sum_reg[9:0];
end
finished_man <= 1'b1;
end

assign mant_dout[16:0] = log_2[16:0];

//A kiszámított log2 után a 3-mal szorzás is elvégzésre kerül,
//Ezután a számítás befejeztét jelzõ bit is egyre vált
always @ (posedge clk)
if(finished_man)
begin
    log2_done_reg <= 1'b1;
    process <= 0;
    dB_value_reg <= {1'b0, log_2} + {log_2, 1'b0};
end

assign dB = (log2_done_reg) ? dB_value_reg : 24'b0;
assign log2_done = log2_done_reg;

endmodule
