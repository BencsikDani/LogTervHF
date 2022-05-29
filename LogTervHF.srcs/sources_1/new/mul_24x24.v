`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2022 10:36:39
// Design Name: 
// Module Name: mul_24x24
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


module mul_24x24(
   input                clk,
   input  signed [23:0] a,
   input  signed [23:0] b,
   output signed [47:0] m
);

wire signed [17:0] bi[1:0];
wire signed [47:0] po[1:0];
wire signed [47:0] pi;

reg signed [47:0] po_0_dl;

assign bi[0] = {1'b0, b[16:0]}; 
dsp_25x18
#(
   .A_REG(1),
   .B_REG(1)
)
DSP_LS
(
   .clk(clk),
   .a({a[23], a}),
   .b(bi[0]),
   .pci(48'b0), 
   .p(po[0])
);
always @ (posedge clk)
   po_0_dl <= po[0];

assign bi[1] = {{11{b[23]}}, b[23:17]};
assign pi = {{17{po[0][47]}}, po[0][47:17]};
dsp_25x18
#(
   .A_REG(2),
   .B_REG(2)
)
DSP_MS
(
   .clk(clk),
   .a({a[23], a}),
   .b(bi[1]),
   .pci(pi), 
   .p(po[1])
);

assign m = {po[1][30:0], po_0_dl[16:0]};

endmodule