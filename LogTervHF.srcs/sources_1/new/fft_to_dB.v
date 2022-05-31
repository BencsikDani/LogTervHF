`timescale 1ns / 1ps

//Converting FFT values to dB
//20log10(sqrt(re^2+im^2)) = (10/log2(10))log2(re^2+im^2) ~ 3log2(re^2+im^2)

module fft_to_dB(
    input clk,
    input rst,
    input fft_rdy,          // Bemeneti, ami jelzi, hogy az FFT kész, tehát kezdhetjük a dB értékek kiszámítását
    
    output [9:0] fft_result_addr,       // Annak a memóriának a címzésére szolgáló kimenet, amibe a Core írta az eredményeket
    input [23:0] fft_result_re,        // A valós értékek adatvezetéke
    input [23:0] fft_result_im,        // A képzetes értékek adatvezetéke
    
    output  [9:0] dB_result_addr,       // Annak a memóriának a címzésére szolgáló kimenet, amibe írjuk majd a dB értékeket 
    output [23:0] dB_result_dout,       // dB értékek adatvezetéke (egyszere csak 1 dB értéket írunk)
    output        dB_result_done,       // Jelezzük, hogy valid érték van a kimeneten, hogy az írás megtörténhessen
    
    output        all_dB_calculated     // Jelezzük, ha kiszámoltuk az összes frekvenciához tartozó dB értéket
    );

reg [2:0] calc_dl;      // Késleltetés a szorzások és összeadás elvégzésének bevárására
reg [9:0] fft_cntr;     // FFT együtthatók számlálója
wire[47:0] re_sq;       // Vezeték valós rész négyzetének
wire[47:0] im_sq;       // Vezeték képzetes rész négyzetének
reg [24:0] sum;         // Valós és képzetes rész négyzetösszege

reg dB_result_done_reg;     // 1 frekvencia dB érték számításának végét jelzõ regiszter
reg all_dB_calculated_reg;  // Jelzi, ha kész a dB számítás az összes frekvencián



// Impulzussal való jelzése annak, hogy kész az FFT eredménye
reg fft_rdy_posedge;
always @ (posedge fft_rdy)
fft_rdy_posedge <= 1;

always @ (posedge clk)
if (fft_rdy_posedge)
    fft_rdy_posedge <= 0;



// A dB értékek kiszámításához szükséges idõt számontartó számláló
// Ha megjött az elsõ kiszámolandó érték, vagy ha egy elõzõ már ki lett számolva (ami nem az utolsó volt), akkor kezdi elõlrõl a számoilást.
always @ (posedge clk)
if (rst | fft_rdy_posedge | (dB_result_done_reg & fft_cntr != 10'd1023))
    calc_dl <= 3'b0;
else if (fft_rdy)
    calc_dl <= calc_dl + 1;



// Az FFT együtthatókat számláló számláló
// Ha reset van, vagy ha kész az FFT, akkor nullázódik
// Ha egy együtthatónak kiszámoltuk a dB értékét (ami nem az utolsó), akkor ugrik tovább
always @ (posedge clk)
if (rst | fft_rdy_posedge)
    fft_cntr <= 10'b0;
else if (dB_result_done_reg & fft_cntr != 10'd1023)
    fft_cntr <= fft_cntr + 1;

assign fft_result_addr = fft_cntr;
assign dB_result_addr = fft_cntr;



// valós rész négyzetre emelése
mul_24x24 re_square(
    .clk(clk),
    .a(fft_result_re),
    .b(fft_result_re),
    .m(re_sq)
);

//képzetes rész négyzetre emelésee    
mul_24x24 im_square(
    .clk(clk),
    .a(fft_result_im),
    .b(fft_result_im),
    .m(im_sq)
);
// Megjegyzés: 1 ilyen négyzetre emeléshez 4 órajel szükséges

// Négyzetek összeadása
always @ (posedge clk)
sum <= re_sq[36:13] + im_sq[36:13];     // 11.13 + 11.13 = 12.13
// Megjegyzés: a négyzetre emelt számok összeadásával együtt
// 5 órajel kell egy teljes "sum" részeredmény kiszámlásához



// A dB érték kiszámítása
wire [9:0] dB_values_rom_addr = sum[22:13];
wire [23:0] dB_values_rom_dout;

// A dB értékek tárolva vannak elõre az összes lehetséges bemenethez
dB_value_rom #(
    .FILE("dB_values.txt")
)
dB_values(
    .clk(clk),
    .addr(dB_values_rom_addr),
    .dout(dB_values_rom_dout)
);

assign dB_result_dout = dB_values_rom_dout;



// 1 frekvencia dB értéke 6 órajel alatt érvényes
always @ (posedge clk)
if (rst | dB_result_done_reg)
    dB_result_done_reg <= 0;
else if (calc_dl <= 3'd6)
    dB_result_done_reg <= 0;

assign dB_result_done = dB_result_done_reg;



// Jelzés, ha végig értünk a mintákon és minden dB érték valid
always @ (posedge clk)
if (rst | all_dB_calculated_reg)
    all_dB_calculated_reg <= 1'b0;
else if (fft_cntr == 10'd1023 & dB_result_done_reg)
    all_dB_calculated_reg <= 1'b1;

assign all_dB_calculated = all_dB_calculated_reg;



endmodule