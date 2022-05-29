`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2022 16:28:36
// Design Name: 
// Module Name: tb
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


module tb;

reg clk;
reg rst;

wire [9:0] rom_addr;
wire [23:0] rom_data;
wire [9:0] fft_real_addr;
wire [9:0] fft_imag_addr;
wire [23:0] fft_real_out;
wire [23:0] fft_imag_out;


//Frame start impulse generator
reg frame_start_reg;
reg [20:0] frame_start_cntr;
wire frame_start;
always @ (posedge clk)
if (rst | frame_start_cntr == 21'd1666666)
    frame_start_cntr <= 0;
else 
frame_start_cntr <= frame_start_cntr + 1;


//Valid sample impulse generator
reg [10:0] aud_vld_cntr;
reg aud_dout_vld_reg;
always @ (posedge clk)
if(rst)
aud_vld_cntr[10:0] <= 11'b0;
else if (aud_vld_cntr[10:0] != 11'b11111111111)
begin
    aud_vld_cntr <=  aud_vld_cntr + 1;
    aud_dout_vld_reg <= 0;
end
else if(aud_vld_cntr[10:0] == 11'b11111111111)
begin
    aud_dout_vld_reg <= 1;
    aud_vld_cntr[10:0] <= 11'b0;
end


//Address of valid sample generator
reg [9:0] smpl_addr_cntr;
always @ (posedge clk)
if(rst | smpl_addr_cntr == 10'b1111111111)
    smpl_addr_cntr <= 0;
else if(aud_dout_vld_reg)
    smpl_addr_cntr <= smpl_addr_cntr + 1;

   
always @ (posedge clk)
if  (frame_start_cntr == 0)
    frame_start_reg <= 1;
else
    frame_start_reg <= 0;

assign frame_start = frame_start_reg;

wire [23:0]smpl_data;
test_rom #(
    .FILE("test_input.txt")
)
test_input_rom (
    .clk(clk),
    .addr(smpl_addr_cntr),
    .dout(smpl_data)
);

reg frm_dout_vld_check_reg;
wire frm_dout_vld_check;
reg [23:0] frm_data_check_reg;
wire[23:0] frm_data_check;
FFT_Controller core(
    .clk(clk),
    .rst(rst),
    .frame_start(frame_start_reg),
    
    .aud_dout_vld(aud_dout_vld_reg),
    .aud_dout(smpl_data),
    
    .frm_addr(smpl_addr_cntr), 
    .frm_dout_vld(frm_dout_vld_check),
    .frm_dout(frm_data_check)
    );

initial
begin
    clk = 1;
    rst = 1;
    #100 rst = 0;
end

always #5 clk <= ~clk;



endmodule
