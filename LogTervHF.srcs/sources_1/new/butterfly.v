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


// Regiszterek száma az egyes DSP-knél
parameter [7:0] REGNUM = {"1", "2", "1", "2", "1", "2", "1", "2"};
// DSP I/O az iterált példányosításhoz
wire signed [199:0] a_i;
wire signed [135:0] b_i;
wire signed [383:0] pci_i;
wire signed [383:0] p_i;
// Huzalozás a DSP-k összekötéséhez
wire signed [191:0] p_wire;

assign a_i =    {x2_real,         (~x2_imag)+1,    x2_imag,        x2_real,        x2_real,       (~x2_imag)+1,  x2_imag,      x2_real};
assign b_i =    {w1_real,         w1_imag,         w1_real,        w1_imag,        w2_real,       w2_imag,       w2_real,      w2_imag};
assign pci_i =  {x1_real,         p_wire[191:144], x1_imag,        p_wire[143:96], x1_real,       p_wire[95:48], x1_imag,      p_wire[47:0]};
assign p_i =    {p_wire[191:144], y1_real,         p_wire[143:96], y1_imag,        p_wire[95:48], y2_real,       p_wire[47:0], y2_imag};

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

// Várunk minimum 4 órajelet, mert addigra lesz kész a két végeredmény
reg [2:0] progress_cntr;
always @ (posedge clk)
if (rst | progress_cntr == 3'd5)
    progress_cntr <= 0;
else if (begin_butterfly | progress_cntr != 0)
    progress_cntr = progress_cntr + 1;

assign butterfly_done = (progress_cntr == 3'd5);

endmodule
