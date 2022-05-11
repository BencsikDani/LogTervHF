`timescale 1ns / 1ps

module FFT_Core(
    input           clk,            // Rendszer�rajel (100 MHz)
    input           rst,            // Reset
    
    input           frame_start,    // 1 �rajel hossz� impulzus, amikor kezd�dik egy frame
    
    input   [23:0]  cb_dout,        // A cirkul�ris buffer adat kimenete
    output  [9:0]   cb_addr_out,    // C�mkimenet a cirkul�ris buffer olvas�s�hoz
    
    input   [9:0]   fft_real_addr,  // C�mbemenet az FFT v�geredm�ny�nek val�s r�szeit tartalmaz� mem�ri�hoz
    input   [9:0]   fft_imag_addr,  // C�mbemenet az FFT v�geredm�ny�nek k�pzetes r�szeit tartalmaz� mem�ri�hoz
    output  [23:0]  fft_real_out,   // Az FFT val�s r�szteit tartalmaz� mem�ri�nak adatkimenete
    output  [23:0]  fft_imag_out    // Az FFT k�pzetes r�szteit tartalmaz� mem�ri�nak adatkimenete

    );

// M�k�d�s �llapot�t jelz� v�ltoz�k:


// Annak a jelz�se, hogy �ppen olvassuk be a mint�kat a cirkul�ris bufferb�l
reg loading_samples;

// frame_start impulzusra bem�solom a cirkul�ris buffer tartalm�t az 1-es RAMba
// Ehhez sz�ks�ges c�msz�ml�l�
reg [9:0]cb_addr_cntr;
// A megfelel� sorrend� mintabet�lt�shez a c�msz�ml�l� ellent�tes bitsorrend� v�ltozata
wire [9:0] cb_addr_reverse;

// frame_start eset�n elkezdj�k iter�lni a c�meket
// A sz�ml�l� ne csorduljon t�l
always @ (posedge clk)
if (rst)
begin
    cb_addr_cntr <= 0;
    loading_samples <= 0;
end
else if (frame_start)
begin
    cb_addr_cntr <= 0;
    loading_samples <= 1;
end
else if (cb_addr_cntr == 10'b1111111111)
    loading_samples <= 0;
else if (loading_samples)
    cb_addr_cntr = cb_addr_cntr + 1;

assign cb_addr_out = cb_addr_cntr;
assign cb_addr_reverse = cb_addr_cntr[0:9];


// Annak jelz�se, hogy a cirkukl�ris bufferb�l sikeresen bet�lt�tt�k a mint�kat.
// Ha m�r nem t�lt�nk be mint�kat �s a cb_addr_cntr v�gig �rt, akkor jelz�nk.
// Az jel csak egyetlen �rajelperi�dusig tart.
reg loading_done;
always @ (posedge clk)
if (rst | loading_done)
    loading_done <= 0;
else if (loading_samples == 0 & cb_addr_cntr == 10'b1111111111)
    loading_done <= 1;



// Az FFT fut�s�nak �llapot�t jelz� regiszter
reg fft_in_progress;
// Annak a jelz�se, hogy �ppen �j stage-be l�pt�nk az FFT-n bel�l
reg new_stage;
// A loading_done impulzusra elkezdj�k az FFT-t
// Emellett kezelj�k a new_stage v�ltoz�t is �s meggy�z�d�nk r�la, hogy csak 1 �rajelig tartson
always @ (posedge clk)
if (rst)
begin
    fft_in_progress <= 0;
    new_stage <= 0;
end
else if (loading_done)
begin
    fft_in_progress <= 1;
    new_stage <= 1;
end
else if (new_stage)
    new_stage <= 0;
// TODO: Mikor sz�nik meg az fft_in_progress?


// Sz�montartjuk, hogy melyik stage-et sz�m�tjuk �ppen (1-10)
reg [3:0] stage_cntr;

// Ha reset volt, vagy �ppen nem FFT-z�nk, akkor a stage_cntr �rt�ke 0
// Ha viszont megy az FFT �s �j stage-be �r�nk, akkor az �rt�ke n� egyel
always @ (posedge clk)
if (rst | ~fft_in_progress)
    stage_cntr <= 0;
else if (new_stage & fft_in_progress)
    stage_cntr <= stage_cntr + 1;



// Az adott stage-ben h�ny group van (512, 256, 128, 64, 32, 16, 8, 4, 2, 1)
reg [9:0] groups;
// Az adott stage-ben h�ny elemet tartalmaz 1 db group (2, 4, 8, 16, 32, 64, 128, 256, 512, 1024)
reg [10:0] element_per_group;
// Az adott stage-ben h�ny elem van egy group egyik fel�ben (1, 2, 4, 8, 16, 32, 64, 128, 256, 512)
reg [9:0] half;

// Stage-enk�nt a seg�dv�ltoz�k inicializ�l�sa
always @ (posedge clk)
if (rst)
begin
    groups <= 0;
    element_per_group <= 0;
    half <= 0;
end
else if (fft_in_progress)
begin
    groups <= 10'd512 >> (stage_cntr-1);
    element_per_group <= 11'b1 << stage_cntr;
    half <= 10'b1 << (stage_cntr-1);
end











// Annak a jelz�se, hogy k�sz az FFT
reg fft_done_reg;
always @ (posedge clk)
if (rst)
    fft_done_reg <= 0;








// Annak az ir�ny�t jelzi, hogy �ppen melyik mem�ri�kat haszn�ljuk bemenetnek �s melyikeket kimenetnek.
// 00: Nincs �r�s
// 01: 1 --> 2
// 10: 1 <-- 2
// 11: 2 --> 3
reg [1:0] mem_dest;
always @ (posedge clk)
if (rst)
    mem_dest <= 2'b00;
else if (stage_cntr == 4'd1 | stage_cntr == 4'd3 | stage_cntr == 4'd5 | stage_cntr == 4'd7 | stage_cntr == 4'd9)
    mem_dest <= 2'b01;
else if (stage_cntr == 4'd2 | stage_cntr == 4'd4 | stage_cntr == 4'd6 | stage_cntr == 4'd8)
    mem_dest <= 2'b10;
else if (stage_cntr == 4'd10)
    mem_dest <= 2'b11;






// Vezet�kek deklar�l�sa a RAM-ok huzaloz�s�hoz:

//wire [9:0] ram_1_real_addr_a;
//wire [9:0] ram_1_imag_addr_a;
wire [9:0] ram_1_real_addr_b;
wire [9:0] ram_1_imag_addr_b;
wire [9:0] ram_2_real_addr_a;
wire [9:0] ram_2_imag_addr_a;
wire [9:0] ram_2_real_addr_b;
wire [9:0] ram_2_imag_addr_b;
wire [9:0] ram_3_real_addr_a;
wire [9:0] ram_3_imag_addr_a;
//wire [9:0] ram_3_real_addr_b;
//wire [9:0] ram_3_imag_addr_b;

//wire [23:0] ram_1_real_din_a;
//wire [23:0] ram_1_imag_din_a;
wire [23:0] ram_1_real_din_b;
wire [23:0] ram_1_imag_din_b;
wire [23:0] ram_2_real_din_a;
wire [23:0] ram_2_imag_din_a;
//wire [23:0] ram_2_real_din_b;
//wire [23:0] ram_2_imag_din_b;
wire [23:0] ram_3_real_din_a;
wire [23:0] ram_3_imag_din_a;
//wire [23:0] ram_3_real_din_b;
//wire [23:0] ram_3_imag_din_b;

//wire [23:0] ram_1_real_dout_a;
//wire [23:0] ram_1_imag_dout_a;
wire [23:0] ram_1_real_dout_b;
wire [23:0] ram_1_imag_dout_b;
wire [23:0] ram_2_real_dout_a;
wire [23:0] ram_2_imag_dout_a;
//wire [23:0] ram_2_real_dout_b;
//wire [23:0] ram_2_imag_dout_b;
//wire [23:0] ram_3_real_dout_a;
//wire [23:0] ram_3_imag_dout_a;
//wire [23:0] ram_3_real_dout_b;
//wire [23:0] ram_3_imag_dout_b;


// RAM-ok p�ld�nyos�t�sa �s bek�t�se

// Write Enable jelek a RAM-okhoz
wire [5:0] we_a_i;
wire [5:0] wr_b_i;
assign we_a_i = {loading_samples, loading_samples, (mem_dest == 2'b01), (mem_dest == 2'b01), (mem_dest == 2'b11), (mem_dest == 2'b11)};
assign we_b_i = {(mem_dest == 2'b10), (mem_dest == 2'b10), 1'b0, 1'b0, 1'b0, 1'b0};
// C�mbemenetek a RAM-okhoz
wire [59:0] addr_a_i;
wire [59:0] addr_b_i;
assign addr_a_i = {cb_addr_reverse, cb_addr_reverse, ram_2_real_addr_a, ram_2_imag_addr_a, ram_3_real_addr_a, ram_3_imag_addr_a};
assign addr_b_i =  {ram_1_real_addr_b, ram_1_imag_addr_b, ram_2_real_addr_b, ram_2_imag_addr_b, fft_real_addr, fft_imag_addr};
// Adatbemenetek a ROM-okhoz
wire [143:0] din_a_i;
wire [143:0] din_b_i;
assign din_a_i = {cb_dout, 24'b0, ram_2_real_din_a, ram_2_imag_din_a, ram_3_real_din_a, ram_3_imag_din_a};
assign din_b_i = {ram_1_real_din_b, ram_1_imag_din_b, 24'b0, 24'b0, 24'b0, 24'b0};
// Adatkimenetek a RAM-okhoz
wire [143:0] dout_a_i;
wire [143:0] dout_b_i;
assign dout_a_i = {24'bz, 24'bz, ram_2_real_dout_a, ram_2_imag_dout_a, 24'b0, 24'b0};
assign dout_b_i = {ram_1_real_dout_b, ram_1_imag_dout_b, 24'b0, 24'b0, fft_real_out, fft_imag_out};

// 6 db RAM p�ld�nyos�t�sa
genvar i;
generate
for (i = 0; i < 6; i=i+1)
    begin: inst
        smpl_ram #(
            .DATA_W("24"),
            .ADDR_W("10")
        )
        smpl_ram_inst(
            .clk_a(clk),
            .we_a(we_a_i[i]),
            .addr_a(addr_a_i[i]),
            .din_a(din_a_i[i]),
            .dout_a(dout_a_i[i]),
            
            .clk_b(clk),
            .we_b(we_b_i[i]),
            .addr_b(addr_b_i[i]),
            .din_b(din_b_i[i]),
            .dout_b(dout_b_i[i])
        );
    end
endgenerate 



// Vezet�kek deklar�l�sa a ROM-ok huzaloz�s�hoz:
wire [9:0]  rom_real_addr;
wire [9:0]  rom_imag_addr;
wire [17:0] rom_real_dout;
wire [17:0] rom_imag_dout;

// �lland� egy�tthat�k ROM-jainak p�ld�nyos�t�sa �s bek�t�se
coeff_rom coeff_rom_real(
    .clk(clk),
    .addr(rom_real_addr),
    .dout(rom_real_dout)
    );
coeff_rom coeff_rom_imag(
    .clk(clk),
    .addr(rom_imag_addr),
    .dout(rom_imag_dout)
    );



// Buffer regiszterek a be- �s kimeneti adatok �sszegy�jt�s�hez

reg begin_butterfly;
reg butterfly_done;
reg [23:0] x1_real_buff;
reg [23:0] x1_imag_buff;
reg [23:0] x2_real_buff;
reg [23:0] x2_imag_buff;
reg [17:0] w1_real_buff;
reg [17:0] w1_imag_buff;
reg [17:0] w2_real_buff;
reg [17:0] w2_imag_buff;
reg [23:0] y1_real_buff;
reg [23:0] y1_imag_buff;
reg [23:0] y2_real_buff;
reg [23:0] y2_imag_buff;

// A "pillang�" m�veletet elv�gz� modul p�ld�nyos�t�sa �s bek�t�se
butterfly btf(
    .clk(clk),
    .rst(rst),
    
    .begin_butterfly(begin_butterfly),
    .butterfly_done(butterfly_done),
    
    .x1_real(x1_real_buff),
    .x1_imag(x1_imag_buff),
    
    .x2_real(x2_real_buff),
    .x2_imag(x2_imag_buff),
    
    .w1_real(w1_real_buff),
    .w1_imag(w1_imag_buff),
    
    .w2_real(w2_real_buff2_real),
    .w2_imag(w2_imag_buff),
    
    .y1_real(y1_real_buff),
    .y1_imag(y1_imag_buff),
    
    .y2_real(y2_real_buff),
    .y2_imag(y2_imag_buff)
    );







// A komplex huzaloz�s megval�s�t�sa

reg x1_real_reg;
always @ (ram_1_real_dout_b or ram_2_real_dout_a or mem_dest)
begin
    case (mem_dest)
        2'b00 : x1_real_reg <= 24'b0;
        2'b01 : x1_real_reg <= ram_1_real_dout_b;
        2'b10 : x1_real_reg <= ram_2_real_dout_a;
        2'b11 : x1_real_reg <= ram_2_real_dout_a;
    endcase
end

reg x1_imag_reg;
always @ (ram_1_imag_dout_b or ram_2_imag_dout_a or mem_dest)
begin
    case (mem_dest)
        2'b00 : x1_imag_reg <= 24'b0;
        2'b01 : x1_imag_reg <= ram_1_imag_dout_b;
        2'b10 : x1_imag_reg <= ram_2_imag_dout_a;
        2'b11 : x1_imag_reg <= ram_2_imag_dout_a;
    endcase
end

reg x2_real_reg;
always @ (ram_1_real_dout_b or ram_2_real_dout_a or mem_dest)
begin
    case (mem_dest)
        2'b00 : x2_real_reg <= 24'b0;
        2'b01 : x2_real_reg <= ram_1_real_dout_b;
        2'b10 : x2_real_reg <= ram_2_real_dout_a;
        2'b11 : x2_real_reg <= ram_2_real_dout_a;
    endcase
end

reg x2_imag_reg;
always @ (ram_1_imag_dout_b or ram_2_imag_dout_a or mem_dest)
begin
    case (mem_dest)
        2'b00 : x2_imag_reg <= 24'b0;
        2'b01 : x2_imag_reg <= ram_1_imag_dout_b;
        2'b10 : x2_imag_reg <= ram_2_imag_dout_a;
        2'b11 : x2_imag_reg <= ram_2_imag_dout_a;
    endcase
end

reg w1_real_reg;
always @ (rom_real_dout or mem_dest)
begin
    case (mem_dest)
        2'b00   : w1_real_reg <= 18'b0;
        default : w1_real_reg <= rom_real_dout;
    endcase
end

reg w1_imag_reg;
always @ (rom_imag_dout or mem_dest)
begin
    case (mem_dest)
        2'b00   : w1_imag_reg <= 18'b0;
        default : w1_imag_reg <= rom_imag_dout;
    endcase
end

reg w2_real_reg;
always @ (rom_real_dout or mem_dest)
begin
    case (mem_dest)
        2'b00   : w2_real_reg <= 18'b0;
        default : w2_real_reg <= rom_real_dout;
    endcase
end

reg w2_imag_reg;
always @ (rom_imag_dout or mem_dest)
begin
    case (mem_dest)
        2'b00   : w2_imag_reg <= 18'b0;
        default : w2_imag_reg <= rom_imag_dout;
    endcase
end



// Sz�ml�l�, ami sz�mon tartja a butterfly m�velet forr�smem�ri�j�b�l t�rt�n� olvas�si folyamatot.
// read_cntr =
// 00: nincs olvas�s
// 01: x1 �s w1 olvas�sa
// 10: x2 �s w2 olvas�sa
// 11: 
reg [1:0] read_cntr;
always @ (posedge clk)
if (rst)
begin
    read_cntr <= 0;
    begin_butterfly <= 0;
end
else if ()
    read_cntr <= read_cntr + 1;
else if (read_cntr == 2'd2)
    begin_butterfly <= 1;
else if (begin_butterfly)
    begin_butterfly <= 0;

    

// Bufferek �r�sa a megfelel� �temben
always @ (posedge clk)
if (read_cntr == 2'd1)
begin
    x1_real_buff <= x1_real_reg;
    x1_imag_buff <= x1_imag_reg;
    w1_real_buff <= w1_real_reg;
    w1_imag_buff <= w1_imag_reg;
end
else if (read_cntr == 2'd2)
begin
    x2_real_buff <= x2_real_reg;
    x2_imag_buff <= x2_imag_reg;
    w2_real_buff <= w2_real_reg;
    w2_imag_buff <= w2_imag_reg;
end





reg y1_real_reg;
assign ram_2_real_din_a = (mem_dest == 2'b01) ? y1_real_reg : 24'b0;
assign ram_1_real_din_b = (mem_dest == 2'b10) ? y1_real_reg : 24'b0;
assign ram_3_real_din_a = (mem_dest == 2'b11) ? y1_real_reg : 24'b0;

reg y1_imag_reg;
assign ram_2_imag_din_a = (mem_dest == 2'b01) ? y1_imag_reg : 24'b0;
assign ram_1_imag_din_b = (mem_dest == 2'b10) ? y1_imag_reg : 24'b0;
assign ram_3_imag_din_a = (mem_dest == 2'b11) ? y1_imag_reg : 24'b0;

reg y2_real_reg;
assign ram_2_real_din_a = (mem_dest == 2'b01) ? y2_real_reg : 24'b0;
assign ram_1_real_din_b = (mem_dest == 2'b10) ? y2_real_reg : 24'b0;
assign ram_3_real_din_a = (mem_dest == 2'b11) ? y2_real_reg : 24'b0;

reg y2_imag_reg;
assign ram_2_imag_din_a = (mem_dest == 2'b01) ? y2_imag_reg : 24'b0;
assign ram_1_imag_din_b = (mem_dest == 2'b10) ? y2_imag_reg : 24'b0;
assign ram_3_imag_din_a = (mem_dest == 2'b11) ? y2_imag_reg : 24'b0;




// Sz�ml�l�, ami sz�mon tartja a butterfly m�velet c�lmem�ri�j�ba t�rt�n� �r�si folyamatot.
// write_cntr =
// 00: nincs �r�s
// 01: y1 �r�sa
// 10: y2 �r�sa
// 11: 
reg [1:0] write_cntr;
always @ (posedge clk)
if (rst)
    write_cntr <= 0;
else if (butterfly_done)
    write_cntr <= write_cntr + 1;


// Bufferek olvas�sa a megfelel� �temben
always @ (posedge clk)
if (write_cntr == 2'd1)
begin
    y1_real_reg <= y1_real_buff;
    y1_imag_reg <= y1_imag_buff;
end
else if (write_cntr == 2'd2)
begin
    y2_real_reg <= y2_real_buff;
    y2_imag_reg <= y2_imag_buff;
end













endmodule
