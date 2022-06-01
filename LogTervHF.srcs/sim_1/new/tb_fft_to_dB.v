`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.06.2022 01:32:41
// Design Name: 
// Module Name: tb_fft_to_dB
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


module tb_fft_to_dB(

    );

reg clk;
reg rst;
reg fft_rdy;

initial
begin
    clk = 1;
    rst = 1;
    #100 rst = 0;
    #10 fft_rdy = 1;
    #100 fft_rdy = 0;
    #30 fft_rdy = 1;
end

always #5 clk <= ~clk;


fft_to_dB convert(
	.clk(clk),
	.rst(rst),
	.fft_rdy(fft_rdy),

	.fft_result_addr(),
	.fft_result_re(),
	.fft_result_im(),

	.dB_result_addr(),
	.dB_result_dout(),
	.dB_result_done(),
	.all_dB_calculated()
);

endmodule
