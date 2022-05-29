`timescale 1ns / 1ps

module FFT_Core(
    input           clk,            // Rendszer�rajel (100 MHz)
    input           rst,            // Reset
    
    input           frame_start,    // 1 �rajel hossz� impulzus, amikor kezd�dik egy frame
    output          fft_done,
    
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
// Annak jelz�se, hogy a cirkukl�ris bufferb�l sikeresen bet�lt�tt�k a mint�kat.
reg loading_done;
// Az FFT fut�s�nak �llapot�t jelz� regiszter
reg fft_in_progress;
// Annak a jelz�se, hogy �ppen �j stage-be l�pt�nk az FFT-n bel�l
reg new_stage;
// Sz�montartjuk, hogy melyik stage-et sz�m�tjuk �ppen (1-10)
reg [3:0] stage_cntr;
// Sz�ml�l� ahhoz, hogy �j stage-be v�lt�skor 10+12 �rajelig v�rjunk a seg�dv�ltoz�k kisz�m�t�s�ra.
reg [4:0] calc_sidevar_cntr;
// Az adott stage-ben h�ny group van (512, 256, 128, 64, 32, 16, 8, 4, 2, 1)
reg [9:0] groups;
// Sz�ml�l� az adott stage-ben a group-okon val� v�gigiter�l�shoz
reg [9:0] g;
// Az adott stage-ben h�ny elemet tartalmaz 1 db group (2, 4, 8, 16, 32, 64, 128, 256, 512, 1024)
reg [10:0] element_per_group;
// Az adott stage-ben h�ny elem van egy group egyik fel�ben (1, 2, 4, 8, 16, 32, 64, 128, 256, 512)
reg [9:0] half;
// Sz�ml�l� az adott group-on bel�l a "half" v�gigiter�l�s�hoz
reg [9:0] h;
// TODO
reg read_cycle_done;
// Jelz�s a Butterfly modulnak, hogy a bemenetei k�szen �llnak, teh�t megkezdheti a m�veleteket.
reg begin_butterfly;
// A Butterfly modul ezzel jelez, ha k�sz van.
wire butterfly_done;
// Annak a jelz�se, hogy a kisz�molt adatok beker�ltek a c�lmem�ri�ba
wire writing_done;
// Annak a jelz�se, hogy k�sz a teljes FFT
reg fft_done_reg;



// frame_start impulzusra bem�soljuk a cirkul�ris buffer tartalm�t az 1-es RAMba
// Ehhez sz�ks�ges c�msz�ml�l�
reg [9:0] cb_addr_cntr;
// A megfelel� sorrend� mintabet�lt�shez a c�msz�ml�l� ellent�tes bitsorrend� v�ltozata
wire [9:0] cb_addr_reverse;

// TODO
reg [9:0] cb_addr_cntr_delay;
always @ (posedge clk)
cb_addr_cntr_delay <= cb_addr_cntr;

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
    loading_samples <= 1;
    cb_addr_cntr <= 0;
end
else if (cb_addr_cntr == 10'b1111111111)
    loading_samples <= 0;
else if (loading_samples)
    cb_addr_cntr = cb_addr_cntr + 1;

assign cb_addr_out = cb_addr_cntr;
assign cb_addr_reverse = {cb_addr_cntr_delay[0], cb_addr_cntr_delay[1], cb_addr_cntr_delay[2], cb_addr_cntr_delay[3], cb_addr_cntr_delay[4], cb_addr_cntr_delay[5], cb_addr_cntr_delay[6], cb_addr_cntr_delay[7], cb_addr_cntr_delay[8], cb_addr_cntr_delay[9]};


// Ha m�r nem t�lt�nk be mint�kat �s a cb_addr_cntr v�gig �rt, akkor jelz�nk.
// Az jel csak egyetlen �rajelperi�dusig tart.
always @ (posedge clk)
if (rst | frame_start | loading_done)
    loading_done <= 0;
else if (loading_samples == 0 & cb_addr_cntr == 10'b1111111111)
begin
    loading_done <= 1;
    cb_addr_cntr = 0;
end


// A loading_done impulzusra elkezdj�k az FFT-t
// Viszont ha m�r a 10. stage legv�g�n j�rtunk, akkor az FFT-nek v�ge.
always @ (posedge clk)
if (rst | frame_start)
    fft_in_progress <= 0;
else if (loading_done)
    fft_in_progress <= 1;
else if (g == groups-1 & h == half-1 & stage_cntr == 4'd10)
    fft_in_progress <= 0;



// Hogyha m�r nem FFT-z�nk, de a 10. stage v�g�n j�runk, akkor k�szen vagyunk.
always @ (posedge clk)
if (rst | frame_start)
    fft_done_reg <= 0;
else if (fft_in_progress == 0 & stage_cntr == 4'd10)
    fft_done_reg <= 1;

assign fft_done = fft_done_reg;



// Ha k�sz a cirkul�ris bufferb�l val� bet�lt�s, vagy pedig el�rkezt�nk egy stage v�gf�re (ami nem a 10.), akkor �j stage sz�m�t�s�nak kezdet�t jelezz�k.
// Ez a jelz�s csak 1 �rajel hossz�.
always @ (posedge clk)
if (rst | new_stage) 
    new_stage <= 0;
else if (loading_done)
    new_stage <= 1;
else if (stage_cntr != 4'd10 & g == groups-1 & h == half-1 & writing_done)
    new_stage <= 1;


// Ha reset volt, vagy �ppen nem FFT-z�nk, akkor a stage_cntr �rt�ke 0
// Ha viszont megy az FFT �s �j stage-be �r�nk, akkor az �rt�ke n� egyel
always @ (posedge clk)
if (rst | ~fft_in_progress)
    stage_cntr <= 0;
else if (fft_in_progress & new_stage)
    stage_cntr <= stage_cntr + 1;



// A seg�dv�ltoz�k kisz�m�t�s�ra v�rakoz� �llapot sz�ml�l�j�nak kezel�se:
// Reset vagy �j frame eset�n null�z�dik.
// Ha �j stage-be �rt�nk FFT k�zben, akkor elkezd sz�molni �s megy eg�szen addig, am�g el nem �ri a 22-es �rt�ket. Itt viszont meg�ll.
always @ (posedge clk)
if (rst | frame_start)
    calc_sidevar_cntr <= 0;
else if (fft_in_progress & new_stage)
    calc_sidevar_cntr <= 1;
else if (calc_sidevar_cntr == 5'd22)
    calc_sidevar_cntr <= 5'd22;
else if (calc_sidevar_cntr != 0 & calc_sidevar_cntr != 5'd22)
    calc_sidevar_cntr = calc_sidevar_cntr + 1;



// Stage-enk�nt a seg�dv�ltoz�k inicializ�l�sa
always @ (posedge clk)
if (rst | frame_start)
begin
    groups <= 0;
    element_per_group <= 0;
    half <= 0;
end
else if (fft_in_progress & new_stage)
begin
    // Az�rt van sz�ks�g arra, hogy a stage_cntr-h�z adjunk 1-et,
    // mert nek�nk m�r az �j �rt�ke k�ne, de � is csak ebben az �rajelben fog n�ni
    groups <= 10'd512 >> (stage_cntr+1-1);
    element_per_group <= 11'b1 << stage_cntr+1;
    half <= 10'b1 << (stage_cntr+1-1);
end
// A v�gleges �rt�kek elnyer�s�hez ak�r 10 �rajel is sz�ks�ges lehet



// A csoportokon �s a csoportok elemeinek fel�n iter�l� sz�ml�l�k kezel�se:
// Ha Reset van, ha �j frame kezd�dik, vagy ha �j stage kezd�dik, akkor null�zzuk �ket
// writing_done-ra folyamatosan n� a "h" �rt�ke, de enn�l egy er�sebb felt�tel, hogy ha el�rte a maximum�t, akkor null�z�dik �s a "g" n� 1-gyel
// Hogyha a "h" �s a "g" is el�rt�k a maximumukat, akkor a 2 dolog t�rt�nhet:
// - stage_cntr m�g nem j�r a 10-n�l:   new_stage be�ll�t�dik, teh�t a null�z�s ekkor m�r meg van oldva,
// - stage_cntr m�r 10-n�l j�r:         fft_in_progress 0-ba �ll�t�dik �s ezzel az FFT befejez�dik.
always @ (posedge clk)
if (rst | frame_start | (fft_in_progress & new_stage))
begin
    g <= 0;
    h <= 0;
end
else if ( writing_done & (stage_cntr == 4'd1 | (stage_cntr != 4'd1 & h == half-1)) )
begin
    h <= 0;
    g <= g + 1;
end
else if (half != 1 & writing_done)
    h <= h + 1;

// Megjegyz�s: a konkr�t c�mek kisz�mol�sa ezen v�ltoz�k alapj�n a k�d alj�n tal�lhat�, ahol a c�mvezet�keket bek�tj�k.


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
//wire [9:0] ram_2_real_addr_b;
//wire [9:0] ram_2_imag_addr_b;
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
wire we_01 = mem_dest == 2'b01 & (write_cntr == 2'b01 | write_cntr == 2'b10);
wire we_10 = mem_dest == 2'b10 & (write_cntr == 2'b01 | write_cntr == 2'b10);
wire we_11 = mem_dest == 2'b11 & (write_cntr == 2'b01 | write_cntr == 2'b10);
wire [5:0] we_a_i;
wire [5:0] we_b_i;
assign we_a_i = {loading_samples, 1'b0, we_01, we_01, we_11, we_11};
assign we_b_i = {we_10, we_10, 1'b0, 1'b0, 1'b0, 1'b0};
// C�mbemenetek a RAM-okhoz
wire [59:0] addr_a_i;
wire [59:0] addr_b_i;
assign addr_a_i = {cb_addr_reverse, 10'b0, ram_2_real_addr_a, ram_2_imag_addr_a, ram_3_real_addr_a, ram_3_imag_addr_a};
assign addr_b_i =  {ram_1_real_addr_b, ram_1_imag_addr_b, 10'b0, 10'b0, fft_real_addr, fft_imag_addr};
// Adatbemenetek a ROM-okhoz
wire [143:0] din_a_i;
wire [143:0] din_b_i;
assign din_a_i = { {10{1'b0}}, cb_dout[23:10], 24'b0, ram_2_real_din_a, ram_2_imag_din_a, ram_3_real_din_a, ram_3_imag_din_a};
assign din_b_i = {ram_1_real_din_b, ram_1_imag_din_b, 24'b0, 24'b0, 24'b0, 24'b0};
// Adatkimenetek a RAM-okhoz
wire [143:0] dout_a_i;
wire [143:0] dout_b_i;
assign ram_2_real_dout_a = dout_a_i[95:72];
assign ram_2_imag_dout_a = dout_a_i[71:48];
assign ram_1_real_dout_b = dout_b_i[143:120];
assign ram_1_imag_dout_b = dout_b_i[119:96];
assign fft_real_out = dout_b_i[47:24];
assign fft_imag_out = dout_b_i[23:0];

// 6 db RAM p�ld�nyos�t�sa
// TODO
genvar i;
generate
for (i = 5; i > -1; i=i-1)
    begin: inst
        smpl_ram #(
            .DATA_W(24),
            .ADDR_W(10)
        )
        smpl_ram_inst(
            .clk_a(clk),
            .we_a(we_a_i[i]),
            .addr_a(addr_a_i[ (10*(i+1)-1) : (10*(i+1)-10) ]),
            .din_a(din_a_i[ (24*(i+1)-1) : (24*(i+1)-24) ]),
            .dout_a(dout_a_i[ (24*(i+1)-1) : (24*(i+1)-24) ]),
            
            .clk_b(clk),
            .we_b(we_b_i[i]),
            .addr_b(addr_b_i[ (10*(i+1)-1) : (10*(i+1)-10) ]),
            .din_b(din_b_i[ (24*(i+1)-1) : (24*(i+1)-24) ]),
            .dout_b(dout_b_i[ (24*(i+1)-1) : (24*(i+1)-24) ])
        );
    end
endgenerate 



// Vezet�kek deklar�l�sa a ROM-ok huzaloz�s�hoz:
wire [9:0]  rom_real_addr;
wire [9:0]  rom_imag_addr;
wire [17:0] rom_real_dout;
wire [17:0] rom_imag_dout;

// �lland� egy�tthat�k ROM-jainak p�ld�nyos�t�sa �s bek�t�se
coeff_rom #(
    .FILE("coeff_real.txt")
)
coeff_rom_real(
    .clk(clk),
    .addr(rom_real_addr),
    .dout(rom_real_dout)
    );
coeff_rom #(
    .FILE("coeff_imag.txt")
)
coeff_rom_imag(
    .clk(clk),
    .addr(rom_imag_addr),
    .dout(rom_imag_dout)
    );



// Buffer regiszterek a be- �s kimeneti adatok �sszegy�jt�s�hez
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
wire [23:0] y1_real;
wire [23:0] y1_imag;
wire [23:0] y2_real;
wire [23:0] y2_imag;

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
    
    .w2_real(w2_real_buff),
    .w2_imag(w2_imag_buff),
    
    .y1_real(y1_real),
    .y1_imag(y1_imag),
    
    .y2_real(y2_real),
    .y2_imag(y2_imag)
    );

// TODO
reg sidevars_done;
always @ (posedge clk)
if (rst | frame_start | sidevars_done == 1)
    sidevars_done <= 0;
else if (calc_sidevar_cntr == 5'd21)
    sidevars_done <= 1;

// TODO
reg [3:0] calc_index_cntr;
always @ (posedge clk)
if (rst | frame_start | calc_index_cntr == 4'd12 | read_cntr == 2'b11 | new_stage)
    calc_index_cntr <= 0;
else if (calc_sidevar_cntr == 5'd22 & (sidevars_done | writing_done | read_cycle_done))
    calc_index_cntr <= 1;
else if (calc_index_cntr != 0 & calc_index_cntr != 4'd12)
    calc_index_cntr = calc_index_cntr + 1;


reg read_cntr_2_daly;
// Sz�ml�l�, ami sz�mon tartja a butterfly m�velet forr�smem�ri�j�b�l t�rt�n� olvas�si folyamatot.
// 00: nincs olvas�s
// 01: x1 �s w1 olvas�sa
// 10: x2 �s w2 olvas�sa
// 11: olvas�s v�ge
// Ha a seg�dv�ltoz�k rendelkez�sre �llnak, elkezdi a sz�ml�l�st �s ha m� elkezdte, akkor folytatja is.
// 2'b10 �rt�k ut�n �jra null�zza mag�t.
// TODO
reg [1:0] read_cntr;
always @ (posedge clk)
if (rst | frame_start | read_cntr == 2'b11)
    read_cntr <= 0;
else if (read_cntr == 2'b10 & read_cntr_2_daly == 0)
    read_cntr_2_daly <= 1;
else if (read_cntr == 2'b10 & read_cntr_2_daly == 1)
begin
    read_cntr <= 2'b11;
    read_cntr_2_daly <= 0;
end
//else if (calc_index_cntr[3] & calc_index_cntr[2])
//    read_cntr <= read_cntr + 1;

// Ha calc_index_cntr 12-re v�lt, akkor read_cntr++
always @ (posedge calc_index_cntr[2])
if (calc_index_cntr[3])
    read_cntr <= read_cntr + 1;


// Maga a butterfly m�velet akkor kezd�dhet, ha minden bemeneti adat fixen rendelkez�sre �ll, teh�t a read_cntr m�r felvette a 2'b10 �rt�ket.
always @ (posedge clk)
if (rst | frame_start | begin_butterfly)    
    begin_butterfly <= 0;
else if (read_cntr == 2'b11)
    begin_butterfly <= 1;
    
    

// A bemeneti bufferek komplex huzaloz�s�nak megval�s�t�sa multiplexerekkel

reg [23:0] x1_real_reg;
always @ (ram_1_real_dout_b or ram_2_real_dout_a or mem_dest)
begin
    case (mem_dest)
        2'b00 : x1_real_reg <= 24'b0;
        2'b01 : x1_real_reg <= ram_1_real_dout_b;
        2'b10 : x1_real_reg <= ram_2_real_dout_a;
        2'b11 : x1_real_reg <= ram_2_real_dout_a;
    endcase
end

reg [23:0] x1_imag_reg;
always @ (ram_1_imag_dout_b or ram_2_imag_dout_a or mem_dest)
begin
    case (mem_dest)
        2'b00 : x1_imag_reg <= 24'b0;
        2'b01 : x1_imag_reg <= ram_1_imag_dout_b;
        2'b10 : x1_imag_reg <= ram_2_imag_dout_a;
        2'b11 : x1_imag_reg <= ram_2_imag_dout_a;
    endcase
end

reg [23:0] x2_real_reg;
always @ (ram_1_real_dout_b or ram_2_real_dout_a or mem_dest)
begin
    case (mem_dest)
        2'b00 : x2_real_reg <= 24'b0;
        2'b01 : x2_real_reg <= ram_1_real_dout_b;
        2'b10 : x2_real_reg <= ram_2_real_dout_a;
        2'b11 : x2_real_reg <= ram_2_real_dout_a;
    endcase
end

reg [23:0] x2_imag_reg;
always @ (ram_1_imag_dout_b or ram_2_imag_dout_a or mem_dest)
begin
    case (mem_dest)
        2'b00 : x2_imag_reg <= 24'b0;
        2'b01 : x2_imag_reg <= ram_1_imag_dout_b;
        2'b10 : x2_imag_reg <= ram_2_imag_dout_a;
        2'b11 : x2_imag_reg <= ram_2_imag_dout_a;
    endcase
end

// Megjegyz�s: Mivel a ROM-ok huzaloz�sa �lland�, �gy itt nincs sz�ks�g multiplexerekre

// TODO
reg [1:0] read_cntr_posedge;
always @ (posedge read_cntr[0] or posedge read_cntr[1])
read_cntr_posedge[0] <= 1;

always @ (posedge clk)
if (read_cntr_posedge[0])
begin
    read_cntr_posedge[0] <= 0;
    read_cntr_posedge[1] <= 1;
end
else if (read_cntr_posedge[1])
    read_cntr_posedge[1] <= 0;

// Bufferek �r�sa a megfelel� �temben a multiplexerekr�l, vagy a ROM-ok eset�n k�zvetlen�l a kimenet�kr�l.
// TODO
always @ (posedge clk)
if (read_cycle_done)
    read_cycle_done <= 0;
else if (read_cntr_posedge[1] & read_cntr == 2'd1)
begin
    x1_real_buff <= x1_real_reg;
    x1_imag_buff <= x1_imag_reg;
    w1_real_buff <= rom_real_dout;
    w1_imag_buff <= rom_imag_dout;
    read_cycle_done <= 1;
end
else if (read_cntr_posedge[1] & read_cntr == 2'd2)
begin
    x2_real_buff <= x2_real_reg;
    x2_imag_buff <= x2_imag_reg;
    w2_real_buff <= rom_real_dout;
    w2_imag_buff <= rom_imag_dout;
    read_cycle_done <= 1;
end


// TODO
reg [1:0] write_cntr_posedge;
always @ (posedge write_cntr[0])
if (write_cntr[1] == 0)
    write_cntr_posedge[0] <= 1;

always @ (posedge clk)
if (write_cntr_posedge[0])
begin
    write_cntr_posedge[0] <= 0;
    write_cntr_posedge[1] <= 1;
end
else if (write_cntr_posedge[1])
    write_cntr_posedge[1] <= 0;


// Sz�ml�l�, ami sz�mon tartja a butterfly m�velet c�lmem�ri�j�ba t�rt�n� �r�si folyamatot.
// write_cntr =
// 00: nincs �r�s
// 01: y1 �r�sa
// 10: y2 �r�sa
// 11: �r�s k�sz
// butterfly_done-ra elkezdi a sz�ml�l�st �s ha m�r elkezdte, folyatatja is.
// 2'b10 �rt�k ut�n �jra null�zza mag�t.
reg [1:0] write_cntr;
always @ (posedge clk)
if (rst | frame_start | write_cntr == 2'b11)
    write_cntr <= 0;
else if (butterfly_done)
    write_cntr <= 1;
else if (write_cntr != 0)
    write_cntr <= write_cntr + 1;

assign writing_done = (write_cntr == 2'b11);

// A kimeneti bufferek komplex huzaloz�s�nak megval�s�t�sa demultiplexerekkel

assign ram_2_real_din_a = (mem_dest == 2'b01) ? ( (write_cntr_posedge[0]) ? (y1_real) : ( (write_cntr_posedge[1]) ? (y2_real) : (24'b0) )  ) : 24'b0; 
assign ram_1_real_din_b = (mem_dest == 2'b10) ? ( (write_cntr_posedge[0]) ? (y1_real) : ( (write_cntr_posedge[1]) ? (y2_real) : (24'b0) )  ) : 24'b0; 
assign ram_3_real_din_a = (mem_dest == 2'b11) ? ( (write_cntr_posedge[0]) ? (y1_real) : ( (write_cntr_posedge[1]) ? (y2_real) : (24'b0) )  ) : 24'b0; 

assign ram_2_imag_din_a = (mem_dest == 2'b01) ? ( (write_cntr_posedge[0]) ? (y1_imag) : ( (write_cntr_posedge[1]) ? (y2_imag) : (24'b0) )  ) : 24'b0; 
assign ram_1_imag_din_b = (mem_dest == 2'b10) ? ( (write_cntr_posedge[0]) ? (y1_imag) : ( (write_cntr_posedge[1]) ? (y2_imag) : (24'b0) )  ) : 24'b0; 
assign ram_3_imag_din_a = (mem_dest == 2'b11) ? ( (write_cntr_posedge[0]) ? (y1_imag) : ( (write_cntr_posedge[1]) ? (y2_imag) : (24'b0) )  ) : 24'b0; 



// Bufferek olvas�sa a megfelel� �temben �s tartalmuk k�ld�se a demultiplexerek fel�
always @ (posedge clk)
if (write_cntr == 2'd0 & butterfly_done)
begin
    y1_real_buff <= y1_real;
    y1_imag_buff <= y1_imag;
end
else if (write_cntr == 2'd1)
begin
    y2_real_buff <= y2_real;
    y2_imag_buff <= y2_imag;
end



// A megfelel� �temekben a mem�ri�k c�meinek kik�ld�se:

// C�mek deklar�l�sa:
// (A c�mek sosem lesznek 1023-n�l nagyobb �rt�kek, teh�t elf�rnek 10 biten)
wire [9:0] index_1;
wire [9:0] index_2;
wire [9:0] w_10_power_1;
wire [9:0] w_10_power_2;

// A c�mek kisz�m�t�sa DSP blokkok seg�ts�g�vel:

wire [47:0] dsp1_out;
dsp_25x18 #(
   .A_REG(1),
   .B_REG(1)
)
DSP1 (
   .clk(clk),
   .a( {15'b0, g} ),
   .b( {7'b0, element_per_group} ),
   .pci( {38'b0, h} ), 
   .p(dsp1_out)                      
);
assign index_1 = dsp1_out[9:0];         // index_1 = g * element_per_group + h
// 3 �rajel alatt sz�m�t�dnak ki
assign index_2 = index_1 + half;        // index_2 = g * element_per_group + h + half
// 3 �rajel alatt sz�m�t�dnak ki


wire [47:0] dsp2_out;
dsp_25x18 #(
   .A_REG(1),
   .B_REG(1)
)
DSP2 (
   .clk(clk),
   .a( {15'b0, h} ),
   .b( 18'b1 << (4'd10 - stage_cntr) ),
   .pci( 48'b0 ), 
   .p(dsp2_out)                      
);
assign w_10_power_1 = dsp2_out[9:0];    // w_10_power_1 = h * (2 ** (max_stage - stage_cntr)) = h * (1'b1 << (4'd10 - stage_cntr))
// 3-12 �rajel alatt sz�m�t�dnak ki (att�l f�gg, mennyit kell shiftelni


wire [47:0] dsp3_out;
dsp_25x18 #(
   .A_REG(1),
   .B_REG(1)
)
DSP3 (
   .clk(clk),
   .a( {15'b0, h + half} ),
   .b( 18'b1 << (4'd10 - stage_cntr) ),
   .pci( 48'b0 ), 
   .p(dsp3_out)                      
);
assign w_10_power_2 = dsp3_out[9:0];    // w_10_power_2 = (h + half) * (2 ** (max_stage - stage)) = (h + half) * (1'b1 << (4'd10 - stage_cntr))
// 3-12 �rajel alatt sz�m�t�dnak ki (att�l f�gg, mennyit kell shiftelni



// Regiszterek l�trehoz�sa az adatvezet�kekbe val� �r�shoz
// Mivel ezeket nem �l�rz�keny always blokkban haszn�lom, �gy a val�s�gban nem j�n l�tre hozz�juk fizikai regiszter.
reg [9:0] ram_1_real_addr_b_reg;
reg [9:0] ram_1_imag_addr_b_reg;
reg [9:0] ram_2_real_addr_a_reg;
reg [9:0] ram_2_imag_addr_a_reg;
reg [9:0] ram_3_real_addr_a_reg;
reg [9:0] ram_3_imag_addr_a_reg;
reg [9:0] rom_real_addr_reg;
reg [9:0] rom_imag_addr_reg;

// Az c�mek kiad�sa a megfelel� �temben a megfelel� vezet�ken
always @ (mem_dest or read_cntr or write_cntr)
if (mem_dest == 2'b01)
begin
    if (read_cntr == 2'b01)
    begin
        ram_1_real_addr_b_reg <= index_1[9:0];
        ram_1_imag_addr_b_reg <= index_1[9:0];
        rom_real_addr_reg <= w_10_power_1[9:0];
        rom_imag_addr_reg <= w_10_power_1[9:0];
    end
    else if (read_cntr == 2'b10)
    begin
        ram_1_real_addr_b_reg <= index_2[9:0];
        ram_1_imag_addr_b_reg <= index_2[9:0];
        rom_real_addr_reg <= w_10_power_2[9:0];
        rom_imag_addr_reg <= w_10_power_2[9:0];
    end
    else if (write_cntr == 2'b01)
    begin
        ram_2_real_addr_a_reg <= index_1[9:0];
        ram_2_imag_addr_a_reg <= index_1[9:0];
    end
    else if (write_cntr == 2'b10)
    begin
        ram_2_real_addr_a_reg <= index_2[9:0];
        ram_2_imag_addr_a_reg <= index_2[9:0];
    end
end
else if (mem_dest == 2'b10)
begin
    if (read_cntr == 2'b01)
    begin
        ram_2_real_addr_a_reg <= index_1[9:0];
        ram_2_imag_addr_a_reg <= index_1[9:0];
        rom_real_addr_reg <= w_10_power_1[9:0];
        rom_imag_addr_reg <= w_10_power_1[9:0];
    end
    else if (read_cntr == 2'b10)
    begin
        ram_2_real_addr_a_reg <= index_2[9:0];
        ram_2_imag_addr_a_reg <= index_2[9:0];
        rom_real_addr_reg <= w_10_power_2[9:0];
        rom_imag_addr_reg <= w_10_power_2[9:0];
    end
    else if (write_cntr == 2'b01)
    begin
        ram_1_real_addr_b_reg <= index_1[9:0];
        ram_1_imag_addr_b_reg <= index_1[9:0];
    end
    else if (write_cntr == 2'b10)
    begin
        ram_1_real_addr_b_reg <= index_2[9:0];
        ram_1_imag_addr_b_reg <= index_2[9:0];
    end
end
else if (mem_dest == 2'b11)
begin
    if (read_cntr == 2'b01)
    begin
        ram_2_real_addr_a_reg <= index_1[9:0];
        ram_2_imag_addr_a_reg <= index_1[9:0];
        rom_real_addr_reg <= w_10_power_1[9:0];
        rom_imag_addr_reg <= w_10_power_1[9:0];
    end
    else if (read_cntr == 2'b10)
    begin
        ram_2_real_addr_a_reg <= index_2[9:0];
        ram_2_imag_addr_a_reg <= index_2[9:0];
        rom_real_addr_reg <= w_10_power_2[9:0];
        rom_imag_addr_reg <= w_10_power_2[9:0];
    end
    else if (write_cntr == 2'b01)
    begin
        ram_3_real_addr_a_reg <= index_1[9:0];
        ram_3_imag_addr_a_reg <= index_1[9:0];
    end
    else if (write_cntr == 2'b10)
    begin
        ram_3_real_addr_a_reg <= index_2[9:0];
        ram_3_imag_addr_a_reg <= index_2[9:0];
    end
end

// A seg�dregiszterek konkr�t vezet�kekhez val� t�rs�t�sa
assign ram_1_real_addr_b = ram_1_real_addr_b_reg;
assign ram_1_imag_addr_b = ram_1_imag_addr_b_reg;
assign ram_2_real_addr_a = ram_2_real_addr_a_reg;
assign ram_2_imag_addr_a = ram_2_imag_addr_a_reg;
assign ram_3_real_addr_a = ram_3_real_addr_a_reg;
assign ram_3_imag_addr_a = ram_3_imag_addr_a_reg;
assign rom_real_addr = rom_real_addr_reg;
assign rom_imag_addr = rom_imag_addr_reg;


endmodule
