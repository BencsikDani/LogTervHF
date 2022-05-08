`timescale 1ns / 1ps

module butterfly(
    input  [23:0] x1_real,
    input  [23:0] x1_imag,
    
    input  [23:0] x2_real,
    input  [23:0] x2_imag,

    input  [17:0] w1_real,
    input  [17:0] w1_imag,

    input  [17:0] w2_real,
    input  [17:0] w2_imag,

    output [23:0] y1_real,
    output [23:0] y1_imag,

    output [23:0] y2_real,
    output [23:0] y2_imag
    );

assign y1_real = x1_real + x2_real*w1_real - x2_imag*w1_imag;
assign y1_imag = x1_imag + x2_imag*w1_real + x2_real*w1_imag;

assign y2_real = x1_real + x2_real*w2_real - x2_imag*w2_imag;
assign y2_imag = x1_imag + x2_imag*w2_real + x2_real*w2_imag; 

endmodule
