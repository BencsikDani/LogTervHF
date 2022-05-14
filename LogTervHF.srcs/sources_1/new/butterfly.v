`timescale 1ns / 1ps

module butterfly(
    input         clk,
    input         rst,
    
    input         begin_butterfly,
    output        butterfly_done,
    
    input signed [23:0] x1_real,
    input signed [23:0] x1_imag,
    
    input signed [23:0] x2_real,
    input signed [23:0] x2_imag,

    input signed [17:0] w1_real,
    input signed [17:0] w1_imag,

    input signed [17:0] w2_real,
    input signed [17:0] w2_imag,

    output signed [23:0] y1_real,
    output signed [23:0] y1_imag,

    output signed [23:0] y2_real,
    output signed [23:0] y2_imag
    );

// y1_real = x1_real + x2_real*w1_real - x2_imag*w1_imag;
// y1_imag = x1_imag + x2_imag*w1_real + x2_real*w1_imag;

// y2_real = x1_real + x2_real*w2_real - x2_imag*w2_imag;
// y2_imag = x1_imag + x2_imag*w2_real + x2_real*w2_imag; 

// DSP1 : 2s.23 * s.1.16 + 9s.39 = s.3.39 + 9s.39 = s.8.39
// DSP2 : 2s.23 * s.1.16 + s.8.39 = s.3.39 + s.8.39 = s.8.39
// y (9+39 bit) --> y (1+23 bit)
// y[47:40], y[39], y[38:16], y[15:0]
//    8    +   1  +    23   +   16

// Regiszterek száma az egyes DSP-knél
parameter [7:0] REGNUM = {"1", "2", "1", "2", "1", "2", "1", "2"};
// DSP I/O az iterált példányosításhoz
wire signed [199:0] a_i;        // 8 * 25 bit = 200 bit
wire signed [143:0] b_i;        // 8 * 18 bit = 144 bit 
wire signed [383:0] pci_i;      // 8 * 48 biz = 384 bit
wire signed [383:0] p_i;        // 8 * 48 biz = 384 bit
// Huzalozás a DSP-k összekötéséhez
wire signed [191:0] p_wire;     // 4 * 48 bit = 192 bit

wire signed [47:0] out1;
wire signed [47:0] out2;
wire signed [47:0] out3;
wire signed [47:0] out4;

assign a_i =    {{x2_real[23], x2_real},             (~{x2_imag[23], x2_imag})+1, {x2_imag[23], x2_imag},             {x2_real[23], x2_real}, {x2_real[23], x2_real},            (~{x2_imag[23], x2_imag})+1, {x2_imag[23], x2_imag},              {x2_real[23], x2_real}};
assign b_i =    {w1_real,                            w1_imag,                     w1_real,                            w1_imag,                w2_real,                            w2_imag,                     w2_real,                            w2_imag};
assign pci_i =  {{{8{x1_real[23]}}, x1_real, 16'b0}, p_wire[191:144],             {{8{x1_imag[23]}}, x1_imag, 16'b0}, p_wire[143:96],         {{8{x1_real[23]}}, x1_real, 16'b0}, p_wire[95:48],               {{8{x1_imag[23]}}, x1_imag, 16'b0}, p_wire[47:0]};
assign p_i =    {p_wire[191:144],                    out1,                        p_wire[143:96],                     out2,                   p_wire[95:48],                      out3,                        p_wire[47:0],                       out4};

// Teljes butterfly késleltetés: 4 órajel

genvar i;
generate
for (i = 0; i < 8; i=i+1)
    begin: inst
       dsp_25x18 #(
           .A_REG(REGNUM[i]),
           .B_REG(REGNUM[i])
        )
        DSP
        (
           .clk(clk),
           .a(a_i[i]),
           .b(b_i[i]),
           .pci(pci_i[i]), 
           .p(p_i[i])
        );
    end
endgenerate

assign y1_real = out1[39:16];
assign y1_imag = out2[39:16];
assign y2_real = out3[39:16];
assign y2_imag = out4[39:16];

// Várunk minimum 4 órajelet, mert addigra lesz kész a két végeredmény
reg [2:0] progress_cntr;
always @ (posedge clk)
if (rst | progress_cntr == 3'd5)
    progress_cntr <= 0;
else if (begin_butterfly | progress_cntr != 0)
    progress_cntr = progress_cntr + 1;

assign butterfly_done = (progress_cntr == 3'd5);

endmodule
