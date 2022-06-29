`timescale 1ns / 1ps

module dB_value_rom #(
   parameter FILE = ""
)(
    input               clk,
    input       [9:0]   addr,
    output  reg [23:0]  dout
    );

(* ram_style = "block" *) reg [23:0] memory[0:1023];
initial $readmemb(FILE, memory);


always @ (posedge clk)
    dout <= memory[addr];

endmodule