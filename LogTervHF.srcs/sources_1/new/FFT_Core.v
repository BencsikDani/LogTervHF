`timescale 1ns / 1ps

module FFT_Core(
    input           clk,            // Rendszerórajel (100 MHz)
    input           rst,            // Reset
    
    input           frame_start,    // 1 órajel hosszú impulzus, amikor kezdõdik egy frame
    output          fft_done,
    
    input   [23:0]  cb_dout,        // A cirkuláris buffer adat kimenete
    output  [9:0]   cb_addr_out,    // Címkimenet a cirkuláris buffer olvasásához
    
    input   [9:0]   fft_real_addr,  // Címbemenet az FFT végeredményének valós részeit tartalmazó memóriához
    input   [9:0]   fft_imag_addr,  // Címbemenet az FFT végeredményének képzetes részeit tartalmazó memóriához
    output  [23:0]  fft_real_out,   // Az FFT valós részteit tartalmazó memóriának adatkimenete
    output  [23:0]  fft_imag_out    // Az FFT képzetes részteit tartalmazó memóriának adatkimenete

    );

// Mûködés állapotát jelzõ változók:

// Annak a jelzése, hogy éppen olvassuk be a mintákat a cirkuláris bufferbõl
reg loading_samples;
// Annak jelzése, hogy a cirkukláris bufferbõl sikeresen betöltöttük a mintákat.
reg loading_done;
// Az FFT futásának állapotát jelzõ regiszter
reg fft_in_progress;
// Annak a jelzése, hogy éppen új stage-be léptünk az FFT-n belül
reg new_stage;
// Számontartjuk, hogy melyik stage-et számítjuk éppen (1-10)
reg [3:0] stage_cntr;
// Az adott stage-ben hány group van (512, 256, 128, 64, 32, 16, 8, 4, 2, 1)
reg [9:0] groups;
// Számláló az adott stage-ben a group-okon való végigiteráláshoz
reg [9:0] g;
// Az adott stage-ben hány elemet tartalmaz 1 db group (2, 4, 8, 16, 32, 64, 128, 256, 512, 1024)
reg [10:0] element_per_group;
// Az adott stage-ben hány elem van egy group egyik felében (1, 2, 4, 8, 16, 32, 64, 128, 256, 512)
reg [9:0] half;
// Számláló az adott group-on belül a "half" végigiterálásához
reg [9:0] h;
// Jelzés a Butterfly modulnak, hogy a bemenetei készen állnak, tehát megkezdheti a mûveleteket.
reg begin_butterfly;
// A Butterfly modul ezzel jelez, ha kész van.
reg butterfly_done;
// Annak a jelzése, hogy a kiszámolt adatok bekerültek a célmemóriába
reg writing_done;
// Annak a jelzése, hogy kész a teljes FFT
reg fft_done_reg;



// frame_start impulzusra bemásoljuk a cirkuláris buffer tartalmát az 1-es RAMba
// Ehhez szükséges címszámláló
reg [9:0] cb_addr_cntr;
// A megfelelõ sorrendû mintabetöltéshez a címszámláló ellentétes bitsorrendû változata
wire [9:0] cb_addr_reverse;
// frame_start esetén elkezdjük iterálni a címeket
// A számláló ne csorduljon túl
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
assign cb_addr_reverse = cb_addr_cntr[0:9];



// Ha már nem töltünk be mintákat és a cb_addr_cntr végig ért, akkor jelzünk.
// Az jel csak egyetlen órajelperiódusig tart.
always @ (posedge clk)
if (rst | frame_start | loading_done)
    loading_done <= 0;
else if (loading_samples == 0 & cb_addr_cntr == 10'b1111111111)
    loading_done <= 1;



// A loading_done impulzusra elkezdjük az FFT-t
// Viszont ha már a 10. stage legvégén jártunk, akkor az FFT-nek vége.
always @ (posedge clk)
if (rst | frame_start)
    fft_in_progress <= 0;
else if (loading_done)
    fft_in_progress <= 1;
else if (g == groups-1 & h == half-1 & stage_cntr == 4'd10)
    fft_in_progress <= 0;



// Hogyha már nem FFT-zünk, de a 10. stage végén járunk, akkor készen vagyunk.
always @ (posedge clk)
if (rst | frame_start)
    fft_done_reg <= 0;
else if (fft_in_progress == 0 & stage_cntr == 4'd10)
    fft_done_reg <= 1;

assign fft_done = fft_done_reg;



// Ha kész a cirkuláris bufferbõl való betöltés, vagy pedig elérkeztünk egy stage végfére (ami nem a 10.), akkor új stage számításának kezdetét jelezzük.
// Ez a jelzés csak 1 órajel hosszú.
always @ (posedge clk)
if (rst | new_stage)
    new_stage <= 0;
else if (loading_done | (g == groups-1 & h == half-1 & stage_cntr != 4'd10))
    new_stage <= 1;



// Ha reset volt, vagy éppen nem FFT-zünk, akkor a stage_cntr értéke 0
// Ha viszont megy az FFT és új stage-be érünk, akkor az értéke nõ egyel
always @ (posedge clk)
if (rst | ~fft_in_progress)
    stage_cntr <= 0;
else if (fft_in_progress & new_stage)
    stage_cntr <= stage_cntr + 1;



// Stage-enként a segédváltozók inicializálása
always @ (posedge clk)
if (rst | frame_start)
begin
    groups <= 0;
    element_per_group <= 0;
    half <= 0;
end
else if (fft_in_progress & new_stage)
begin
    groups <= 10'd512 >> (stage_cntr-1);
    element_per_group <= 11'b1 << stage_cntr;
    half <= 10'b1 << (stage_cntr-1);
end



// A csoportokon és a csoportok elemeinek felén iteráló számlálók kezelése:
// Ha Reset van, ha új frame kezdõdik, vagy ha új stage kezdõdik, akkor nullázzuk õket
// writing_done-ra folyamatosan nõ a "h" értéke, de ennél egy erõsebb feltétel, hogy ha elérte a maximumát, akkor nullázódik és a "g" nõ 1-gyel
// Hogyha a "h" és a "g" is elérték a maximumukat, akkor a 2 dolog történhet:
// - stage_cntr még nem jár a 10-nél:   new_stage beállítódik, tehát a nullázás ekkor már meg van oldva,
// - stage_cntr már 10-nél jár:         fft_in_progress 0-ba állítódik és ezzel az FFT befejezõdik.
always @ (posedge clk)
if (rst | frame_start | (fft_in_progress & new_stage))
begin
    g <= 0;
    h <= 0;
end
else if (h == half-1)
begin
    h <= 0;
    g <= g + 1;
end
else if (writing_done)
    h <= h + 1;

// Megjegyzés: a konkrét címek kiszámolása ezen változók alapján a kód alján található, ahol a címvezetékeket bekötjük.


// Annak az irányát jelzi, hogy éppen melyik memóriákat használjuk bemenetnek és melyikeket kimenetnek.
// 00: Nincs írás
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



// Vezetékek deklarálása a RAM-ok huzalozásához:

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


// RAM-ok példányosítása és bekötése

// Write Enable jelek a RAM-okhoz
wire [5:0] we_a_i;
wire [5:0] wr_b_i;
assign we_a_i = {loading_samples, loading_samples, (mem_dest == 2'b01), (mem_dest == 2'b01), (mem_dest == 2'b11), (mem_dest == 2'b11)};
assign we_b_i = {(mem_dest == 2'b10), (mem_dest == 2'b10), 1'b0, 1'b0, 1'b0, 1'b0};
// Címbemenetek a RAM-okhoz
wire [59:0] addr_a_i;
wire [59:0] addr_b_i;
assign addr_a_i = {cb_addr_reverse, cb_addr_reverse, ram_2_real_addr_a, ram_2_imag_addr_a, ram_3_real_addr_a, ram_3_imag_addr_a};
assign addr_b_i =  {ram_1_real_addr_b, ram_1_imag_addr_b, 24'b0, 24'b0, fft_real_addr, fft_imag_addr};
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

// 6 db RAM példányosítása
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



// Vezetékek deklarálása a ROM-ok huzalozásához:
wire [9:0]  rom_real_addr;
wire [9:0]  rom_imag_addr;
wire [17:0] rom_real_dout;
wire [17:0] rom_imag_dout;

// Állandó együtthatók ROM-jainak példányosítása és bekötése
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



// Buffer regiszterek a be- és kimeneti adatok összegyûjtéséhez
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

// A "pillangó" mûveletet elvégzõ modul példányosítása és bekötése
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



// Számláló, ami számon tartja a butterfly mûvelet forrásmemóriájából történõ olvasási folyamatot.
// 00: nincs olvasás
// 01: x1 és w1 olvasása
// 10: x2 és w2 olvasása
// 11: érvénytelen
// Ha FFT közben vagyunk, akkor new_stage-re elkezdi a számlálást és ha má elkezdte, akkor folytatja is.
// 2'b10 érték után újra nullázza magát.
reg [1:0] read_cntr;
always @ (posedge clk)
if (rst | frame_start | read_cntr == 2'b10)
    read_cntr <= 0;
else if (fft_in_progress & new_stage)
    read_cntr <= read_cntr + 1;
else if (read_cntr != 0)
    read_cntr <= read_cntr + 1;



// Maga a butterfly mûvelet akkor kezdõdhet, ha minden bemeneti adat fixen rendelkezésre áll, tehát a read_cntr már felvette a 2'b10 értéket.
always @ (posedge clk)
if (rst | frame_start | begin_butterfly)    
    begin_butterfly <= 0;
else if (read_cntr == 2'b10)
    begin_butterfly <= 1;
    
    

// A bemeneti bufferek komplex huzalozásának megvalósítása multiplexerekkel

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

// Megjegyzés: Mivel a ROM-ok huzalozása állandó, így itt nincs szükség multiplexerekre



// Bufferek írása a megfelelõ ütemben a multiplexerekrõl, vagy a ROM-ok esetén közvetlenül a kimenetükrõl.
always @ (posedge clk)
if (read_cntr == 2'd1)
begin
    x1_real_buff <= x1_real_reg;
    x1_imag_buff <= x1_imag_reg;
    w1_real_buff <= rom_real_dout;
    w1_imag_buff <= rom_imag_dout;
end
else if (read_cntr == 2'd2)
begin
    x2_real_buff <= x2_real_reg;
    x2_imag_buff <= x2_imag_reg;
    w2_real_buff <= rom_real_dout;
    w2_imag_buff <= rom_imag_dout;
end



// Számláló, ami számon tartja a butterfly mûvelet célmemóriájába történõ írási folyamatot.
// write_cntr =
// 00: nincs írás
// 01: y1 írása
// 10: y2 írása
// 11: érvénytelen
// butterfly_done-ra elkezdi a számlálást és ha már elkezdte, folyatatja is.
// 2'b10 érték után újra nullázza magát.
reg [1:0] write_cntr;
always @ (posedge clk)
if (rst | frame_start | write_cntr == 2'b10)
    write_cntr <= 0;
else if (butterfly_done)
    write_cntr <= write_cntr + 1;
else if (write_cntr != 0)
    write_cntr <= write_cntr + 1;



// A kimeneti bufferek komplex huzalozásának megvalósítása demultiplexerekkel

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



// Bufferek olvasása a megfelelõ ütemben és tartalmuk küldése a demultiplexerek felé
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



// A megfelelõ ütemekben a memóriák címeinek kiküldése

// A címek kiszámítása:
wire index_1 = g * element_per_group + h;
wire index_2 = g * element_per_group + h + half;
wire w_10_power_1 = h * (1'b1 << (4'd10 - stage_cntr));
wire w_10_power_2 = (h + half) * (1'b1 << (4'd10 - stage_cntr));

// Regiszterek létrehozása az adatvezetékekbe való íráshoz
// Mivel ezeket nem élérzékeny always blokkban használom, így a valóságban nem jön létre hozzájuk fizikai regiszter.
reg [9:0] ram_1_real_addr_b_reg;
reg [9:0] ram_1_imag_addr_b_reg;
reg [9:0] ram_2_real_addr_a_reg;
reg [9:0] ram_2_imag_addr_a_reg;
reg [9:0] ram_3_real_addr_a_reg;
reg [9:0] ram_3_imag_addr_a_reg;
reg [9:0] rom_real_addr_reg;
reg [9:0] rom_imag_addr_reg;

// Az címek kiafása a megfelelõ ütemben a megfelelõ vezetéken
always @ (mem_dest or read_cntr or write_cntr)
if (mem_dest == 2'b01)
    if (read_cntr == 2'b01)
    begin
        ram_1_real_addr_b_reg <= index_1;
        ram_1_imag_addr_b_reg <= index_1;
        rom_real_addr_reg <= w_10_power_1;
        rom_imag_addr_reg <= w_10_power_1;
    end
    else if (read_cntr == 2'b10)
    begin
        ram_1_real_addr_b_reg <= index_2;
        ram_1_imag_addr_b_reg <= index_2;
        rom_real_addr_reg <= w_10_power_2;
        rom_imag_addr_reg <= w_10_power_2;
    end
    else if (write_cntr == 2'b01)
    begin
        ram_2_real_addr_a_reg <= index_1;
        ram_2_imag_addr_a_reg <= index_1;
    end
    else if (write_cntr == 2'b10)
    begin
        ram_2_real_addr_a_reg <= index_2;
        ram_2_imag_addr_a_reg <= index_2;
    end
else if (mem_dest == 2'b10)
    if (read_cntr == 2'b01)
    begin
        ram_2_real_addr_a_reg <= index_1;
        ram_2_imag_addr_a_reg <= index_1;
        rom_real_addr_reg <= w_10_power_1;
        rom_imag_addr_reg <= w_10_power_1;
    end
    else if (read_cntr == 2'b10)
    begin
        ram_2_real_addr_a_reg <= index_2;
        ram_2_imag_addr_a_reg <= index_2;
        rom_real_addr_reg <= w_10_power_2;
        rom_imag_addr_reg <= w_10_power_2;
    end
    else if (write_cntr == 2'b01)
    begin
        ram_1_real_addr_b_reg <= index_1;
        ram_1_imag_addr_b_reg <= index_1;
    end
    else if (write_cntr == 2'b10)
    begin
        ram_1_real_addr_b_reg <= index_2;
        ram_1_imag_addr_b_reg <= index_2;
    end
else if (mem_dest == 2'b11)
    if (read_cntr == 2'b01)
    begin
        ram_2_real_addr_a_reg <= index_1;
        ram_2_imag_addr_a_reg <= index_1;
        rom_real_addr_reg <= w_10_power_1;
        rom_imag_addr_reg <= w_10_power_1;
    end
    else if (read_cntr == 2'b10)
    begin
        ram_2_real_addr_a_reg <= index_2;
        ram_2_imag_addr_a_reg <= index_2;
        rom_real_addr_reg <= w_10_power_2;
        rom_imag_addr_reg <= w_10_power_2;
    end
    else if (write_cntr == 2'b01)
    begin
        ram_3_real_addr_a_reg <= index_1;
        ram_3_imag_addr_a_reg <= index_1;
    end
    else if (write_cntr == 2'b10)
    begin
        ram_3_real_addr_a_reg <= index_2;
        ram_3_imag_addr_a_reg <= index_2;
    end

// A segédregiszterek konkrét vezetékekhez való társítása
assign ram_1_real_addr_b = ram_1_real_addr_b_reg;
assign ram_1_imag_addr_b = ram_1_imag_addr_b_reg;
assign ram_2_real_addr_a = ram_2_real_addr_a_reg;
assign ram_2_imag_addr_a = ram_2_imag_addr_a_reg;
assign ram_3_real_addr_a = ram_3_real_addr_a_reg;
assign ram_3_imag_addr_a = ram_3_imag_addr_a_reg;
assign rom_real_addr = rom_real_addr_reg;
assign rom_imag_addr = rom_imag_addr_reg;


endmodule
