`timescale 1ns / 1ps

module tb_FFT_Core;

reg clk;
reg rst;
reg frame_start;
wire fft_done;
wire [9:0] rom_addr;
wire [23:0] rom_data;
wire [9:0] fft_real_addr;
wire [9:0] fft_imag_addr;
wire [23:0] fft_real_out;
wire [23:0] fft_imag_out;

FFT_Core core(
    .clk(clk),
    .rst(rst),
    
    .frame_start(frame_start),
    .fft_done(fft_done),

    .cb_dout(rom_data),
    .cb_addr_out(rom_addr), 

    .fft_real_addr(fft_real_addr),
    .fft_imag_addr(fft_imag_addr),
    .fft_real_out(fft_real_out),
    .fft_imag_out(fft_imag_out)
    );


test_rom #(
    .FILE("test_input.txt")
)
test_input_rom (
    .clk(clk),
    .addr(rom_addr),
    .dout(rom_data)
    );

initial
begin
    clk = 1;
    rst = 1;
    #100 rst = 0;
    #10 frame_start = 1;
    #10 frame_start = 0;
end

always #5 clk <= ~clk;



endmodule