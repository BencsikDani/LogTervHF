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

// Jelölések: "valós érték (tárolt változat)"
// DSP1 :   s.10.13 (2s.10.13) * s.1.16 + s.10.13 (9s.10.29) =  s.12.29 (7s.12.29) + s.10.13 (9s.10.29) = s.13.29 (6s.13.29)
// DSP2 : - s.10.13 (2s.10.13) * s.1.16 + s.13.29 (6s.13.29) = - s.12.29 (7s.12.29) + s.13.29 (6s.13.29) = s.14.29 (5s.14.29)
// y (19+29 bit) --> y (11+13 bit)
// y[47], y[46:39], y[38:29], y[28:16], y[15:0]
//    1   +   8   +  10   +    13   +   16

// Regiszterek száma az egyes DSP-knél
parameter [15:0] REGNUM = {2'd1, 2'd2, 2'd1, 2'd2, 2'd1, 2'd2, 2'd1, 2'd2};
// DSP I/O az iterált példányosításhoz
wire signed [199:0] a_array;        // 8 * 25 bit = 200 bit
wire signed [143:0] b_array;        // 8 * 18 bit = 144 bit 
wire signed [383:0] pci_array;      // 8 * 48 biz = 384 bit
wire signed [383:0] p_array;        // 8 * 48 biz = 384 bit
// Huzalozás a DSP-k összekötéséhez
wire signed [191:0] p_wire;     // 4 * 48 bit = 192 bit
// Kimeneti huzalok
wire signed [47:0] out1;
wire signed [47:0] out2;
wire signed [47:0] out3;
wire signed [47:0] out4;

// Tömbök létrehozása a DSP-k bekötéséhez
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

// Teljes butterfly késleltetés: 4 órajel


// 8 db DSP példányosítása és bekötése
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

// Kimenetek kikötése
assign y1_real = {out1[47], out1[38:16]};
assign y1_imag = {out2[47], out2[38:16]};
assign y2_real = {out3[47], out3[38:16]};
assign y2_imag = {out4[47], out4[38:16]};



// Várunk minimum 4 órajelet, mert addigra lesz kész a két végeredmény
reg [2:0] progress_cntr;
always @ (posedge clk)
if (rst | progress_cntr == 3'd5)
    progress_cntr <= 0;
else if (begin_butterfly | progress_cntr != 0)
    progress_cntr = progress_cntr + 1;


// Hogyha progress_cntr elérte a várakozáshoz szükséges értéket,
// Akkor a DSP-k kimeneteén biztosan a megfelelõ adat található, így jelzünk.
reg butterfly_done_reg;
always @ (posedge clk)
if (rst | begin_butterfly | butterfly_done_reg)
    butterfly_done_reg <= 0;
else if (progress_cntr == 3'd5)
    butterfly_done_reg <= 1;

assign butterfly_done = butterfly_done_reg;


endmodule
