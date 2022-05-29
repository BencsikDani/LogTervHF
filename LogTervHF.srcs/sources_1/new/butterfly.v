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

// Jel�l�sek: "val�s �rt�k (t�rolt v�ltozat)"
// DSP1 :   s.3.20 (2s.3.20) * s.1.16 + s.3.20 (9s.3.36) =   s.5.36 (7s.5.36) + s.3.20 (9s.3.36) = s.6.36 (7s.6.36 -> 6s.6.36)
// DSP2 : - s.3.20 (2s.3.20) * s.1.16 + s.6.36 (6s.6.36) = - s.5.36 (7s.5.36) + s.6.36 (6s.6.36) = s.7.36 (6s.7.36 -> 5s.7.36)
// y (12+36 bit) --> y (4+20 bit)
// y[47:40], y[39:36], y[35:16], y[15:0]
//    8   +   4      +    20   +   16

// Regiszterek sz�ma az egyes DSP-kn�l
// parameter [63:0] REGNUM = {"1", "2", "1", "2", "1", "2", "1", "2"};
parameter [15:0] REGNUM = {2'd1, 2'd2, 2'd1, 2'd2, 2'd1, 2'd2, 2'd1, 2'd2};
// DSP I/O az iter�lt p�ld�nyos�t�shoz
wire signed [199:0] a_array;        // 8 * 25 bit = 200 bit
wire signed [143:0] b_array;        // 8 * 18 bit = 144 bit 
wire signed [383:0] pci_array;      // 8 * 48 biz = 384 bit
wire signed [383:0] p_array;        // 8 * 48 biz = 384 bit
// Huzaloz�s a DSP-k �sszek�t�s�hez
wire signed [191:0] p_wire;     // 4 * 48 bit = 192 bit

wire signed [47:0] out1;
wire signed [47:0] out2;
wire signed [47:0] out3;
wire signed [47:0] out4;

assign a_array =    {{x2_real[23], x2_real},              ((~{x2_imag[23], x2_imag})+25'b1), {x2_imag[23], x2_imag},              {x2_real[23], x2_real}, {x2_real[23], x2_real},              (~{x2_imag[23], x2_imag})+25'b1, {x2_imag[23], x2_imag},              {x2_real[23], x2_real}};
assign b_array =    {w1_real,                             w1_imag,                           w1_real,                             w1_imag,                 w2_real,                             w2_imag,                        w2_real,                             w2_imag};
assign pci_array =  {{{8{x1_real[23]}}, x1_real, 16'b0}, p_wire[191:144],                   {{8{x1_imag[23]}}, x1_imag, 16'b0}, p_wire[143:96],          {{8{x1_real[23]}}, x1_real, 16'b0}, p_wire[95:48],                  {{8{x1_imag[23]}}, x1_imag, 16'b0}, p_wire[47:0]};
assign p_wire[191:144] = p_array[383:336];
assign out1            = p_array[335:288];
assign p_wire[143:96]  = p_array[287:240];
assign out2            = p_array[239:192];
assign p_wire[95:48]   = p_array[191:144];
assign out3            = p_array[143:96];
assign p_wire[47:0]    = p_array[95:48];
assign out4            = p_array[47:0];

// Teljes butterfly k�sleltet�s: 4 �rajel

// Indexek az egyes t�mb�kh�z:
// parameter [63:0] i_by_25 = {8'd199, 8'd174, 8'd149, 8'd124, 8'd99, 8'd74, 8'd49, 8'd24};
// parameter [63:0] i_by_18 = {8'd143, 8'd125, 8'd107, 8'd89, 8'd71, 8'd53, 8'd35, 8'd17};
// parameter [63:0] i_by_48 = {9'd383, 9'd335, 9'd287, 9'd239, 9'd191, 9'd143, 9'd95, 9'd47};

genvar i;
generate
for (i = 1; i < 9; i=i+1)
    begin: inst
       dsp_25x18 #(
           .A_REG(REGNUM[(2*i-1):(2*i-2)]),
           .B_REG(REGNUM[(2*i-1):(2*i-2)])
        )
        DSP
        (
           .clk(clk),
           .a( a_array[ (i*25-1) : (i*25-25) ] ),
           .b( b_array[ (i*18-1) : (i*18-18) ] ),
           .pci( pci_array[ (i*48-1) : (i*48-48) ] ), 
           .p( p_array[ (i*48-1) : (i*48-48) ] )
        );
    end
endgenerate

assign y1_real = out1[39:16];
assign y1_imag = out2[39:16];
assign y2_real = out3[39:16];
assign y2_imag = out4[39:16];
//assign y1_real = {out1[47], out1[34:12]};
//assign y1_imag = {out2[47], out2[34:12]};
//assign y2_real = {out3[47], out3[34:12]};
//assign y2_imag = {out4[47], out4[34:12]};

// V�runk minimum 4 �rajelet, mert addigra lesz k�sz a k�t v�geredm�ny
reg [2:0] progress_cntr;
always @ (posedge clk)
if (rst | progress_cntr == 3'd5)
    progress_cntr <= 0;
else if (begin_butterfly | progress_cntr != 0)
    progress_cntr = progress_cntr + 1;

reg butterfly_done_reg;
always @ (posedge clk)
if (rst | begin_butterfly | butterfly_done_reg)
    butterfly_done_reg <= 0;
else if (progress_cntr == 3'd5)
    butterfly_done_reg <= 1;

assign butterfly_done = butterfly_done_reg;


endmodule
