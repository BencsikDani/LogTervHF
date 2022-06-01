`timescale 1ns / 1ps

//Converting FFT values to dB
//20log10(sqrt(re^2+im^2)) = (10/log2(10))log2(re^2+im^2) ~ 3log2(re^2+im^2)

module fft_to_dB(
    input clk,
    input rst,
    input fft_rdy,          // Bemeneti, ami jelzi, hogy az FFT k�sz, teh�t kezdhetj�k a dB �rt�kek kisz�m�t�s�t
    
    output [9:0] fft_result_addr,       // Annak a mem�ri�nak a c�mz�s�re szolg�l� kimenet, amibe a Core �rta az eredm�nyeket
    input [23:0] fft_result_re,        // A val�s �rt�kek adatvezet�ke
    input [23:0] fft_result_im,        // A k�pzetes �rt�kek adatvezet�ke
    
    output  [9:0] dB_result_addr,       // Annak a mem�ri�nak a c�mz�s�re szolg�l� kimenet, amibe �rjuk majd a dB �rt�keket 
    output [23:0] dB_result_dout,       // dB �rt�kek adatvezet�ke (egyszere csak 1 dB �rt�ket �runk)
    output        dB_result_done,       // Jelezz�k, hogy valid �rt�k van a kimeneten, hogy az �r�s megt�rt�nhessen
    
    output        all_dB_calculated     // Jelezz�k, ha kisz�moltuk az �sszes frekvenci�hoz tartoz� dB �rt�ket
    );

reg [2:0] calc_dl;      // K�sleltet�s a szorz�sok �s �sszead�s elv�gz�s�nek bev�r�s�ra
reg [9:0] fft_cntr;     // FFT egy�tthat�k sz�ml�l�ja
wire[47:0] re_sq;       // Vezet�k val�s r�sz n�gyzet�nek
wire[47:0] im_sq;       // Vezet�k k�pzetes r�sz n�gyzet�nek
reg [48:0] sum;         // Val�s �s k�pzetes r�sz n�gyzet�sszege

reg dB_result_done_reg;     // 1 frekvencia dB �rt�k sz�m�t�s�nak v�g�t jelz� regiszter
reg all_dB_calculated_reg;  // Jelzi, ha k�sz a dB sz�m�t�s az �sszes frekvenci�n



// Impulzussal val� jelz�se annak, hogy k�sz az FFT eredm�nye
reg fft_rdy_delay;
wire fft_rdy_posedge;

always @ (posedge clk)
fft_rdy_delay <= fft_rdy;

assign fft_rdy_posedge = fft_rdy & ~fft_rdy_delay;




// A dB �rt�kek kisz�m�t�s�hoz sz�ks�ges id�t sz�montart� sz�ml�l�
// Ha megj�tt az els� kisz�moland� �rt�k, vagy ha egy el�z� m�r ki lett sz�molva (ami nem az utols� volt), akkor kezdi el�lr�l a sz�moil�st.
// Ha v�gig �rt, akkor ott meg�ll.
always @ (posedge clk)
if (rst | fft_rdy_posedge | (dB_result_done_reg & (fft_cntr != 10'd1023)))
    calc_dl <= 3'b0;
else if (fft_rdy & (calc_dl != 3'd7))
    calc_dl <= calc_dl + 1;



// Az FFT egy�tthat�kat sz�ml�l� sz�ml�l�
// Ha reset van, vagy ha k�sz az FFT, akkor null�z�dik
// Ha egy egy�tthat�nak kisz�moltuk a dB �rt�k�t (ami nem az utols�), akkor ugrik tov�bb
// Ha v�gig �rt, akkor ott meg�ll.
always @ (posedge clk)
if (rst | fft_rdy_posedge)
    fft_cntr <= 10'b0;
else if (dB_result_done_reg & (fft_cntr != 10'd1023))
    fft_cntr <= fft_cntr + 1;

assign fft_result_addr = fft_cntr;
assign dB_result_addr = fft_cntr;



// val�s r�sz n�gyzetre emel�se
mul_24x24 re_square(
    .clk(clk),
    .a(fft_result_re),
    .b(fft_result_re),
    .m(re_sq)
);

//k�pzetes r�sz n�gyzetre emel�see    
mul_24x24 im_square(
    .clk(clk),
    .a(fft_result_im),
    .b(fft_result_im),
    .m(im_sq)
);
// Megjegyz�s: 1 ilyen n�gyzetre emel�shez 4 �rajel sz�ks�ges

// N�gyzetek �sszead�sa
always @ (posedge clk)
sum <= re_sq + im_sq;     // 22.26 + 22.26 = 23.26
// Megjegyz�s: a n�gyzetre emelt sz�mok �sszead�s�val egy�tt
// 5 �rajel kell egy teljes "sum" r�szeredm�ny kisz�ml�s�hoz



// A dB �rt�k kisz�m�t�sa

// Erre Lookup Table megold�st alkalmazunk.
// Mivel a HDMI kimenet�nk (b�rmelyik ir�ny�) felbont�sa nem fogja meghaladni az 1024 pixelt,
// Ez�rt ennyi f�le dB �rt�k fog tudni maxim�lisan l�tsz�dni a kimeneten.
// Ebb�l ad�d�an teh�t el�g ennyi �rt�ket elt�rolnunk.

// A ROM-unk teh�t 10 bites c�mmel fog rendelkezni.
// A k�rd�s az, hogy a kisz�molt 49 bites n�gyzet�sszegb�l melyik az a hasznosan felhaszn�land� 10 bit.
// Ez az�rt fontos, mert ezzel �sszhangban kell lennie az el�re elt�rolt dB �rt�keknek.
// sum eg�sz r�sze      sum t�rt r�sze
//    sum[48:26]           sum[25:0]
// T.f.h. a legnagyobb �rt�k, amit kij9het, elf�r 10 bit eg�sz r�szen.
wire [9:0] dB_values_rom_addr;
assign dB_values_rom_addr = sum[48:39];
wire [23:0] dB_values_rom_dout;

// A dB �rt�kek t�rolva vannak el�re az �sszes lehets�ges bemenethez
dB_value_rom #(
    .FILE("dB_values.txt")
)
dB_values(
    .clk(clk),
    .addr(dB_values_rom_addr),
    .dout(dB_values_rom_dout)
);

assign dB_result_dout = dB_values_rom_dout;



// 1 frekvencia dB �rt�ke 6 �rajel alatt �rv�nyes
always @ (posedge clk)
if (rst | dB_result_done_reg)
    dB_result_done_reg <= 0;
else if (fft_rdy & calc_dl == 3'd6)
    dB_result_done_reg <= 1;

assign dB_result_done = dB_result_done_reg;



// Jelz�s, ha v�gig �rt�nk a mint�kon �s minden dB �rt�k valid
always @ (posedge clk)
if (rst | all_dB_calculated_reg)
    all_dB_calculated_reg <= 1'b0;
else if (fft_cntr == 10'd1023 & dB_result_done_reg)
    all_dB_calculated_reg <= 1'b1;

assign all_dB_calculated = all_dB_calculated_reg;



endmodule