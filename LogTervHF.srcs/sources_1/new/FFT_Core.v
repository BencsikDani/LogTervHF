`timescale 1ns / 1ps

(* keep_hierarchy = "yes" *) module FFT_Core(
    input           clk,            // Rendszerórajel (100 MHz)
    input           rst,            // Reset
    
    input           frame_start,    // 1 órajel hosszú impulzus, amikor kezdõdik egy frame
    output          fft_done,
    
    input   [23:0]  cb_dout,        // A cirkuláris buffer adat kimenete
    output  [9:0]   cb_addr_out,    // Címkimenet a cirkuláris buffer olvasásához
    
    input   [9:0]   fft_real_addr,  // Címbemenet az FFT végeredményének valós részeit tartalmazó memóriához
    input   [9:0]   fft_imag_addr,  // Címbemenet az FFT végeredményének képzetes részeit tartalmazó memóriához
    output  [23:0]  fft_real_out,   // Az FFT valós részteit tartalmazó memóriának adatkimenete
    output  [23:0]  fft_imag_out,    // Az FFT képzetes részteit tartalmazó memóriának adatkimenete
    
    // Debug
    output [23:0]  ram_2_real_dout_a,
    
    output         loading_samples,
    output         fft_in_progress,
    output  [3:0]  stage_cntr,
    output         new_stage
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
// Számláló ahhoz, hogy új stage-be váltáskor 10+12 órajelig várjunk a segédváltozók kiszámítására.
reg [4:0] calc_sidevar_cntr;
// Az adott stage-ben hány group van.
reg [9:0] groups;
// Számláló az adott stage-ben a group-okon való végigiteráláshoz
reg [9:0] g;
// Az adott stage-ben hány elemet tartalmaz 1 db group.
reg [10:0] element_per_group;
// Az adott stage-ben hány elem van egy group egyik felében.
reg [9:0] half;
// Számláló az adott group-on belül a "half" végigiterálásához
reg [9:0] h;
//
reg [1:0] read_cntr;
// Annak a jelzése, hogy egy olvasási ciklus (read_cntr állandó értéke) befejezõdött
reg read_cycle_done;
// Jelzés a Butterfly modulnak, hogy a bemenetei készen állnak, tehát megkezdheti a mûveleteket.
reg begin_butterfly;
// A Butterfly modul ezzel jelez, ha kész van.
wire butterfly_done;
//
reg [1:0] write_cntr;
// Annak a jelzése, hogy a kiszámolt adatok bekerültek a célmemóriába
wire writing_done;
// Annak a jelzése, hogy kész a teljes FFT
reg fft_done_reg;



// frame_start impulzusra bemásoljuk a cirkuláris buffer tartalmát az 1-es RAMba
// Ehhez szükséges címszámláló
reg [9:0] cb_addr_cntr;
// A megfelelõ sorrendû mintabetöltéshez a címszámláló ellentétes bitsorrendû változata
wire [9:0] cb_addr_reverse;

// A megfelelõ idõzítéshez szükség van a cím késleltetésére.
reg [9:0] cb_addr_cntr_delay;
always @ (posedge clk)
cb_addr_cntr_delay <= cb_addr_cntr;



// frame_start esetén elkezdjük iterálni a címeket
// A számláló csak addig fut, amíg loading_samples van.
// Ha végig ért, akkor tûnik csak el a loading_samples, tehát
// minimálisan késve nullázódik, majd a loading_done-ra. 
always @ (posedge clk)
if (rst | frame_start | loading_done)
    cb_addr_cntr <= 0;
else if (loading_samples)
    cb_addr_cntr = cb_addr_cntr + 1;


// A külsõ cirkuláris buffer a sorrendhelyes címeket kapja meg, viszont a belsõ 1-es RAM fordított bitsorrendben.
// Így lesz helyes a Butterfly mûveletek végén az FFT együtthatók sorrendje.
assign cb_addr_out = cb_addr_cntr;
assign cb_addr_reverse = {cb_addr_cntr_delay[0], cb_addr_cntr_delay[1], cb_addr_cntr_delay[2], cb_addr_cntr_delay[3], cb_addr_cntr_delay[4], cb_addr_cntr_delay[5], cb_addr_cntr_delay[6], cb_addr_cntr_delay[7], cb_addr_cntr_delay[8], cb_addr_cntr_delay[9]};



// Az adatok betöltése a frame_start-ra kezdõdik.
// Ha viszont a számláló a végéhez ért tehát, akkor már nem töltünk be adatot.
always @ (posedge clk)
if (rst | cb_addr_cntr == 10'b1111111111)
    loading_samples <= 0;
else if (frame_start)
    loading_samples <= 1;



// Ha már nem töltünk be mintákat, de a számláló éppen csak most ért a végéhez,
// akkor most kell jeleznünk a loading_done-t.
// Az jel csak egyetlen órajelperiódusig tart.
always @ (posedge clk)
if (rst | frame_start | loading_done)
    loading_done <= 0;
else if (loading_samples == 1 & cb_addr_cntr == 10'b1111111111)
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



// Hogyha már nem FFT-zünk, ÉS a 10. stage végén járunk, akkor készen vagyunk.
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
else if (loading_done)
    new_stage <= 1;
else if (stage_cntr != 4'd10 & g == groups-1 & h == half-1 & writing_done)
    new_stage <= 1;



// Ha reset volt, vagy éppen nem FFT-zünk, akkor a stage_cntr értéke 0
// Ha viszont megy az FFT és új stage-be érünk, akkor az értéke nõ egyel
always @ (posedge clk)
if (rst | ~fft_in_progress)
    stage_cntr <= 0;
else if (fft_in_progress & new_stage)
    stage_cntr <= stage_cntr + 1;



// A segédváltozók (groups, elements_per_group, half) kiszámítására várakozó állapot számlálójának kezelése:
// Reset vagy új frame esetén nullázódik.
// Ha új stage-be értünk FFT közben, akkor elkezd számolni és megy egészen addig, amíg el nem éri a 22-es értéket. Itt viszont megáll.
always @ (posedge clk)
if (rst | frame_start)
    calc_sidevar_cntr <= 0;
else if (fft_in_progress & new_stage)
    calc_sidevar_cntr <= 1;
else if (calc_sidevar_cntr == 5'd22)
    calc_sidevar_cntr <= 5'd22;
else if (calc_sidevar_cntr != 0 & calc_sidevar_cntr != 5'd22)
    calc_sidevar_cntr = calc_sidevar_cntr + 1;



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
    // Azért van szükség arra, hogy a stage_cntr-höz adjunk 1-et,
    // mert nekünk már az új értéke kéne, de õ is csak ebben az órajelben fog nõni.
    // Ennek hatására még a régi értékét látnánk.
    
    // groups = N / (2^stage) = (512, 256, 128, 64, 32, 16, 8, 4, 2, 1)
    groups <= 10'd512 >> ( (stage_cntr+1) -1);
    // element_per_group = N / groups = (2, 4, 8, 16, 32, 64, 128, 256, 512, 1024)
    element_per_group <= 11'b1 << stage_cntr+1;
    // half = element_per_group / 2 =  (1, 2, 4, 8, 16, 32, 64, 128, 256, 512)
    half <= 10'b1 << (stage_cntr+1-1);
end
// A végleges értékek elnyeréséhez akár 10 órajel is szükséges lehet



// A csoportokon és a csoportok elemeinek felén iteráló számlálók kezelése:
// Ez tulajdonképpen 2 egymásba ágyazott "szekvenciális nyelvekben megszokott" for ciklusnak felel meg.
always @ (posedge clk)
// Ha Reset van, ha új frame (vagy új stage) kezdõdik, akkor nullázzuk õket
if (rst | frame_start | (fft_in_progress & new_stage))
begin
    g <= 0;
    h <= 0;
end
// writing_done-ra folyamatosan nõ a "h" értéke, DE ennél egy erõsebb feltétel a "g" léptetése:
// Ha az 1. stage-ben vagyunk, akkor tulajodnképpen a "h" iterátor értéke állandó 0, tehát olyan, mintha a "g"-vel iterálnánk.
// Ha viszont nem az 1. stage-ben vagyunk, akkor "g" értéke csak akkor nõ, ha "h" elérte a maximumát.
else if ( writing_done & (stage_cntr == 4'd1 | (stage_cntr != 4'd1 & h == half-1)) )
begin
    h <= 0;
    g <= g + 1;
end
else if (half != 1 & writing_done)
    h <= h + 1;
// Hogyha a "h" és a "g" is elérték a maximumukat, akkor a 2 dolog történhet:
// - stage_cntr még nem jár a 10-nél:   new_stage beállítódik, tehát a nullázás ekkor már meg van oldva,
// - stage_cntr már 10-nél jár:         fft_in_progress 0-ba állítódik és ezzel az FFT befejezõdik.
// (Ezek a kód megfelelõ részénél meg vannak oldva.)

// Megjegyzés: a konkrét címek kiszámolása ezen változók alapján a kód alján található, ahol a címvezetékeket bekötjük.



// mem_dest: Annak az irányát jelzi, hogy éppen melyik memóriákat használjuk bemenetnek és melyikeket kimenetnek.
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

wire [9:0] ram_1_real_addr_b;
wire [9:0] ram_1_imag_addr_b;
wire [9:0] ram_2_real_addr_a;
wire [9:0] ram_2_imag_addr_a;

wire [9:0] ram_3_real_addr_a;
wire [9:0] ram_3_imag_addr_a;

wire [23:0] ram_1_real_din_b;
wire [23:0] ram_1_imag_din_b;
wire [23:0] ram_2_real_din_a;
wire [23:0] ram_2_imag_din_a;

wire [23:0] ram_3_real_din_a;
wire [23:0] ram_3_imag_din_a;

wire [23:0] ram_1_real_dout_b;
wire [23:0] ram_1_imag_dout_b;
wire [23:0] ram_2_real_dout_a;
wire [23:0] ram_2_imag_dout_a;



// RAM-ok példányosítása és bekötése

// Write Enable jelek a RAM-okhoz
wire we_01 = mem_dest == 2'b01 & (write_cntr == 2'b01 | write_cntr == 2'b10);
wire we_10 = mem_dest == 2'b10 & (write_cntr == 2'b01 | write_cntr == 2'b10);
wire we_11 = mem_dest == 2'b11 & (write_cntr == 2'b01 | write_cntr == 2'b10);
wire [5:0] we_a_i;
wire [5:0] we_b_i;
assign we_a_i = {loading_samples, 1'b0, we_01, we_01, we_11, we_11};
assign we_b_i = {we_10, we_10, 1'b0, 1'b0, 1'b0, 1'b0};
// Címbemenetek a RAM-okhoz
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

// 6 db RAM példányosítása
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



// Vezetékek deklarálása a ROM-ok huzalozásához:
wire [9:0]  rom_real_addr;
wire [9:0]  rom_imag_addr;
wire [17:0] rom_real_dout;
wire [17:0] rom_imag_dout;

// Állandó együtthatók ROM-jainak példányosítása és bekötése
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



// Buffer regiszterek a be- és kimeneti adatok összegyûjtéséhez
reg [23:0] x1_real_buff;
reg [23:0] x1_imag_buff;
reg [23:0] x2_real_buff;
reg [23:0] x2_imag_buff;
reg [17:0] w1_real_buff;
reg [17:0] w1_imag_buff;
reg [17:0] w2_real_buff;
reg [17:0] w2_imag_buff;
wire [23:0] y1_real;
wire [23:0] y1_imag;
wire [23:0] y2_real;
wire [23:0] y2_imag;

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
    
    .w2_real(w2_real_buff),
    .w2_imag(w2_imag_buff),
    
    .y1_real(y1_real),
    .y1_imag(y1_imag),
    
    .y2_real(y2_real),
    .y2_imag(y2_imag)
    );



// Mivel minden stage elején meg kell várni míg a 3 segédváltozó (groups, elements_per_group és half)
// kiértékelõdnek, ezért szükség van egy flagre, ami jelez, ha ezek a változók biztosan rendelkezése állnak.
// Ez 22 órajel után biztosan elmondható.
reg sidevars_done;
always @ (posedge clk)
if (rst | frame_start | sidevars_done == 1)
    sidevars_done <= 0;
else if (calc_sidevar_cntr == 5'd21)
    sidevars_done <= 1;



// Miután az elõzõekben említett segédváltozók minden stage elején kiértékelõdek,
// Minden egyes butterfly elõtt ezek alapján újra kiértékelõdnek az iteráló változók ("h" és "g") alapján
// azok a változók, amik megmondják, hogy adott butterfly mûvelethez hanyas indexû adatokat, illetve együtthatókat vegyünk.
// (Ezek sorra: "index_1", "index_2", "w_N_power_1", "w_N_power_2".)
// Természetesen ezeket az értékeket minden butterfly mûvelet elõtt meg kell várni.
// Erre szolgál a calc_index_cntr.
reg [3:0] calc_index_cntr;
always @ (posedge clk)
// Nullázzuk, ha reset, új frame, vagy új stage van.
// Szintén nullázzuk, ha a végig ért, vagy ha végig értünk az összes olvasási cikluson (read_cntr == 2'b11).
if (rst | frame_start | calc_index_cntr == 4'd13 | read_cntr == 2'b11 | new_stage)
    calc_index_cntr <= 0;
// Elkezdi a számlálást, ha vannak érvényes segédváltozók és valamelyik igaz a következõk közül:
// - Éppen most számoltuk ki a segédváltozókat, tehát a stage elsõ butterfly-ára készülünk,
// - Egy elõzõ butterfly mûvelet után a végeredményeket sikeresen kiírtuk a célmemóriába,
// - Vége egy olvasási ciklusnak, tehát újra indexeket kell számolni.
else if (calc_sidevar_cntr == 5'd22 & (sidevars_done | writing_done | read_cycle_done))
    calc_index_cntr <= 1;
// Egyébként, ha elindítottuk, akkor már megy tovább, egészen a végéig.
else if (calc_index_cntr != 0 & calc_index_cntr != 4'd13)
    calc_index_cntr = calc_index_cntr + 1;



// Számláló, ami számon tartja a butterfly mûvelet forrásmemóriájából történõ olvasási folyamatot.
// 00: nincs olvasás
// 01: x1 és w1 olvasása
// 10: x2 és w2 olvasása
// 11: olvasás vége

// Segédváltozó ahhoz, hogy a read_cntr-t plusz egy órajelig a 2-es értéken tudjuk tartani:
reg read_cntr_2_daly;
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
// Ha calc_index_cntr 12-re (4'b1100-ra) vált, tehát az indexek megvannak és lehet olvasni,
// akkor read_cntr egyel nõ.
else if (calc_index_cntr == 4'd12)
    read_cntr <= read_cntr + 1;



// Maga a butterfly mûvelet akkor kezdõdhet, ha minden bemeneti adat fixen rendelkezésre áll, tehát a read_cntr már felvette a 2'b11 értéket.
always @ (posedge clk)
if (rst | frame_start | begin_butterfly)    
    begin_butterfly <= 0;
else if (read_cntr == 2'b11)
    begin_butterfly <= 1;
    
    

// A bemeneti bufferek komplex huzalozásának megvalósítása multiplexerekkel

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

// Megjegyzés: Mivel a ROM-ok huzalozása állandó, így itt nincs szükség multiplexerekre



// Mivel a read_cntr nem egy hagyományos számláló (mert nem minden órajelre számol),
// viszont a szükség van arra az információra, hogy bármelyik írási ciklus pontosan
// Mikor kezdõdik, ezért erre létrehoztam egy változót. Ez egy impulzussal jelti,
// ha történt felfutó él a read_cntr-ben.
reg  read_cntr_0_delay;
reg  read_cntr_1_delay;
wire read_cntr_0_posedge;
wire read_cntr_1_posedge;

always @ (posedge clk)
begin
    read_cntr_0_delay <= read_cntr[0];
    read_cntr_1_delay <= read_cntr[1];
end

assign read_cntr_0_posedge = read_cntr[0] & ~read_cntr_0_delay;
assign read_cntr_1_posedge = read_cntr[1] & ~read_cntr_1_delay;

// Ezen kívül ennek az impulzusnak az egy órajellel késleltetett változata is kelleni fog.
reg read_cntr_0_posedge_delay;
reg read_cntr_1_posedge_delay;

always @ (posedge clk)
begin
    read_cntr_0_posedge_delay <= read_cntr_0_posedge;
    read_cntr_1_posedge_delay <= read_cntr_1_posedge;
end



// Bemeneti memóriák tartalmának beolvasása a bufferekbe a megfelelõ ütemben a multiplexereken keresztül
// (vagy a ROM-ok esetén közvetlenül a kimenetükrõl).
// Az olvasás pontos kezdete a read_cntr felfutó éleire történik.
always @ (posedge clk)
if (read_cycle_done)
    read_cycle_done <= 0;
else if (( read_cntr_0_posedge_delay | read_cntr_1_posedge_delay ) & read_cntr == 2'd1)
begin
    x1_real_buff <= x1_real_reg;
    x1_imag_buff <= x1_imag_reg;
    w1_real_buff <= rom_real_dout;
    w1_imag_buff <= rom_imag_dout;
    read_cycle_done <= 1;
end
else if (( read_cntr_0_posedge_delay | read_cntr_1_posedge_delay ) & read_cntr == 2'd2)
begin
    x2_real_buff <= x2_real_reg;
    x2_imag_buff <= x2_imag_reg;
    w2_real_buff <= rom_real_dout;
    w2_imag_buff <= rom_imag_dout;
    read_cycle_done <= 1;
end



// Számláló, ami számon tartja a butterfly mûvelet célmemóriájába történõ írási folyamatot.
// 00: nincs írás
// 01: y1 írása
// 10: y2 írása
// 11: írás kész
// butterfly_done-ra elkezdi a számlálást és ha már elkezdte, folyatatja is.
// 2'b11 érték után újra nullázza magát.

always @ (posedge clk)
if (rst | frame_start | write_cntr == 2'b11)
    write_cntr <= 0;
else if (butterfly_done)
    write_cntr <= 1;
else if (write_cntr != 0)
    write_cntr <= write_cntr + 1;

// Ha kész van minden írás egy butterfly után, akkor jelzünk.
assign writing_done = (write_cntr == 2'b11);



// A write_cntr már hagyományosan számol, viszont szintén szükség van az élváltásaira.
// A következõ változó egy impulzussal jelti, ha történt felfutó él a write_cntr-ben.
reg  write_cntr_0_delay;
wire write_cntr_0_posedge;

always @ (posedge clk)
    write_cntr_0_delay <= write_cntr[0];

assign write_cntr_0_posedge = write_cntr[0] & ~write_cntr_0_delay;

// Ezen kívül ennek az impulzusnak az egy órajellel késleltetett változata is kelleni fog.
reg write_cntr_0_posedge_delay;

always @ (posedge clk)
    write_cntr_0_posedge_delay <= write_cntr_0_posedge;



// A kimeneti bufferek komplex huzalozásának megvalósítása demultiplexerekkel

assign ram_2_real_din_a = (mem_dest == 2'b01) ? ( (write_cntr_0_posedge) ? (y1_real) : ( (write_cntr_0_posedge_delay) ? (y2_real) : (24'b0) )  ) : 24'b0; 
assign ram_1_real_din_b = (mem_dest == 2'b10) ? ( (write_cntr_0_posedge) ? (y1_real) : ( (write_cntr_0_posedge_delay) ? (y2_real) : (24'b0) )  ) : 24'b0; 
assign ram_3_real_din_a = (mem_dest == 2'b11) ? ( (write_cntr_0_posedge) ? (y1_real) : ( (write_cntr_0_posedge_delay) ? (y2_real) : (24'b0) )  ) : 24'b0; 

assign ram_2_imag_din_a = (mem_dest == 2'b01) ? ( (write_cntr_0_posedge) ? (y1_imag) : ( (write_cntr_0_posedge_delay) ? (y2_imag) : (24'b0) )  ) : 24'b0; 
assign ram_1_imag_din_b = (mem_dest == 2'b10) ? ( (write_cntr_0_posedge) ? (y1_imag) : ( (write_cntr_0_posedge_delay) ? (y2_imag) : (24'b0) )  ) : 24'b0; 
assign ram_3_imag_din_a = (mem_dest == 2'b11) ? ( (write_cntr_0_posedge) ? (y1_imag) : ( (write_cntr_0_posedge_delay) ? (y2_imag) : (24'b0) )  ) : 24'b0; 



// A megfelelõ ütemekben a memóriák címeinek kiküldése:

// Címek/indexek deklarálása:
// (Ezek sosem lesznek 1023-nál nagyobb értékek, tehát elférnek 10 biten)
wire [9:0] index_1;
wire [9:0] index_2;
wire [9:0] w_10_power_1;
wire [9:0] w_10_power_2;

// A címek kiszámítása DSP blokkok segítségével:

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
// 3 órajel alatt számítódnak ki
assign index_2 = index_1 + half;        // index_2 = g * element_per_group + h + half
// 3 órajel alatt számítódnak ki


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
assign w_10_power_1 = dsp2_out[9:0];    // w_10_power_1 = h * (2 ^ (max_stage - stage_cntr)) = h * (1'b1 << (4'd10 - stage_cntr))
// 3-12 órajel alatt számítódnak ki (attól függ, mennyit kell shiftelni).


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
// 3-12 órajel alatt számítódnak ki (attól függ, mennyit kell shiftelni



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

// Az címek kiadása a megfelelõ ütemben a megfelelõ vezetéken
always @ (mem_dest or read_cntr or write_cntr or index_1 or index_2 or w_10_power_1 or w_10_power_2)
if (mem_dest == 2'b01)
begin
    if (read_cntr == 2'b01)
    begin
        ram_1_real_addr_b_reg <= index_1[9:0];
        ram_1_imag_addr_b_reg <= index_1[9:0];
		ram_2_real_addr_a_reg <= 10'b0;
		ram_2_imag_addr_a_reg <= 10'b0;
		ram_3_real_addr_a_reg <= 10'b0;
		ram_3_imag_addr_a_reg <= 10'b0;
        rom_real_addr_reg <= w_10_power_1[9:0];
        rom_imag_addr_reg <= w_10_power_1[9:0];
    end
    else if (read_cntr == 2'b10)
    begin
        ram_1_real_addr_b_reg <= index_2[9:0];
        ram_1_imag_addr_b_reg <= index_2[9:0];
		ram_2_real_addr_a_reg <= 10'b0;
		ram_2_imag_addr_a_reg <= 10'b0;
		ram_3_real_addr_a_reg <= 10'b0;
		ram_3_imag_addr_a_reg <= 10'b0;
        rom_real_addr_reg <= w_10_power_2[9:0];
        rom_imag_addr_reg <= w_10_power_2[9:0];
    end
    else if (write_cntr == 2'b01)
    begin
		ram_1_real_addr_b_reg <= 10'b0;
		ram_1_imag_addr_b_reg <= 10'b0;
        ram_2_real_addr_a_reg <= index_1[9:0];
        ram_2_imag_addr_a_reg <= index_1[9:0];
		ram_3_real_addr_a_reg <= 10'b0;
		ram_3_imag_addr_a_reg <= 10'b0;
		rom_real_addr_reg <= 10'b0;
        rom_imag_addr_reg <= 10'b0;
    end
    else if (write_cntr == 2'b10)
    begin
		ram_1_real_addr_b_reg <= 10'b0;
		ram_1_imag_addr_b_reg <= 10'b0;
        ram_2_real_addr_a_reg <= index_2[9:0];
        ram_2_imag_addr_a_reg <= index_2[9:0];
		ram_3_real_addr_a_reg <= 10'b0;
		ram_3_imag_addr_a_reg <= 10'b0;
		rom_real_addr_reg <= 10'b0;
        rom_imag_addr_reg <= 10'b0;
    end
end
else if (mem_dest == 2'b10)
begin
    if (read_cntr == 2'b01)
    begin
		ram_1_real_addr_b_reg <= 10'b0;
		ram_1_imag_addr_b_reg <= 10'b0;
        ram_2_real_addr_a_reg <= index_1[9:0];
        ram_2_imag_addr_a_reg <= index_1[9:0];
		ram_3_real_addr_a_reg <= 10'b0;
		ram_3_imag_addr_a_reg <= 10'b0;
        rom_real_addr_reg <= w_10_power_1[9:0];
        rom_imag_addr_reg <= w_10_power_1[9:0];
    end
    else if (read_cntr == 2'b10)
    begin
		ram_1_real_addr_b_reg <= 10'b0;
		ram_1_imag_addr_b_reg <= 10'b0;
        ram_2_real_addr_a_reg <= index_2[9:0];
        ram_2_imag_addr_a_reg <= index_2[9:0];
		ram_3_real_addr_a_reg <= 10'b0;
		ram_3_imag_addr_a_reg <= 10'b0;
        rom_real_addr_reg <= w_10_power_2[9:0];
        rom_imag_addr_reg <= w_10_power_2[9:0];
    end
    else if (write_cntr == 2'b01)
    begin
        ram_1_real_addr_b_reg <= index_1[9:0];
        ram_1_imag_addr_b_reg <= index_1[9:0];
		ram_2_real_addr_a_reg <= 10'b0;
        ram_2_imag_addr_a_reg <= 10'b0;
		ram_3_real_addr_a_reg <= 10'b0;
		ram_3_imag_addr_a_reg <= 10'b0;
		rom_real_addr_reg <= 10'b0;
        rom_imag_addr_reg <= 10'b0;
		
    end
    else if (write_cntr == 2'b10)
    begin
        ram_1_real_addr_b_reg <= index_2[9:0];
        ram_1_imag_addr_b_reg <= index_2[9:0];
		ram_2_real_addr_a_reg <= 10'b0;
        ram_2_imag_addr_a_reg <= 10'b0;
		ram_3_real_addr_a_reg <= 10'b0;
		ram_3_imag_addr_a_reg <= 10'b0;
		rom_real_addr_reg <= 10'b0;
        rom_imag_addr_reg <= 10'b0;
    end
end
else if (mem_dest == 2'b11)
begin
    if (read_cntr == 2'b01)
    begin
		ram_1_real_addr_b_reg <= 10'b0;
		ram_1_imag_addr_b_reg <= 10'b0;
        ram_2_real_addr_a_reg <= index_1[9:0];
        ram_2_imag_addr_a_reg <= index_1[9:0];
		ram_3_real_addr_a_reg <= 10'b0;
		ram_3_imag_addr_a_reg <= 10'b0;
        rom_real_addr_reg <= w_10_power_1[9:0];
        rom_imag_addr_reg <= w_10_power_1[9:0];
    end
    else if (read_cntr == 2'b10)
    begin
		ram_1_real_addr_b_reg <= 10'b0;
		ram_1_imag_addr_b_reg <= 10'b0;
        ram_2_real_addr_a_reg <= index_2[9:0];
        ram_2_imag_addr_a_reg <= index_2[9:0];
		ram_3_real_addr_a_reg <= 10'b0;
		ram_3_imag_addr_a_reg <= 10'b0;
        rom_real_addr_reg <= w_10_power_2[9:0];
        rom_imag_addr_reg <= w_10_power_2[9:0];
    end
    else if (write_cntr == 2'b01)
    begin
		ram_1_real_addr_b_reg <= 10'b0;
		ram_1_imag_addr_b_reg <= 10'b0;
        ram_2_real_addr_a_reg <= 10'b0;
        ram_2_imag_addr_a_reg <= 10'b0;
        ram_3_real_addr_a_reg <= index_1[9:0];
        ram_3_imag_addr_a_reg <= index_1[9:0];
		rom_real_addr_reg <= 10'b0;
        rom_imag_addr_reg <= 10'b0;
    end
    else if (write_cntr == 2'b10)
    begin
		ram_1_real_addr_b_reg <= 10'b0;
		ram_1_imag_addr_b_reg <= 10'b0;
        ram_2_real_addr_a_reg <= 10'b0;
        ram_2_imag_addr_a_reg <= 10'b0;
        ram_3_real_addr_a_reg <= index_2[9:0];
        ram_3_imag_addr_a_reg <= index_2[9:0];
		rom_real_addr_reg <= 10'b0;
        rom_imag_addr_reg <= 10'b0;
    end
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
