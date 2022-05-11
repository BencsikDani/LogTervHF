`timescale 1ns / 1ps

module FFT_Core(
    input           clk,            // Rendszerórajel (100 MHz)
    input           rst,            // Reset
    
    input           frame_start,    // 1 órajel hosszú impulzus, amikor kezdõdik egy frame
    
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

// frame_start impulzusra bemásolom a cirkuláris buffer tartalmát az 1-es RAMba
// Ehhez szükséges címszámláló
reg [9:0]cb_addr_cntr;
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
    cb_addr_cntr <= 0;
    loading_samples <= 1;
end
else if (cb_addr_cntr == 10'b1111111111)
    loading_samples <= 0;
else if (loading_samples)
    cb_addr_cntr = cb_addr_cntr + 1;

assign cb_addr_out = cb_addr_cntr;
assign cb_addr_reverse = cb_addr_cntr[0:9];


// Annak jelzése, hogy a cirkukláris bufferbõl sikeresen betöltöttük a mintákat.
// Ha már nem töltünk be mintákat és a cb_addr_cntr végig ért, akkor jelzünk.
// Az jel csak egyetlen órajelperiódusig tart.
reg loading_done;
always @ (posedge clk)
if (rst | loading_done)
    loading_done <= 0;
else if (loading_samples == 0 & cb_addr_cntr == 10'b1111111111)
    loading_done <= 1;



// Az FFT futásának állapotát jelzõ regiszter
reg fft_in_progress;
// Annak a jelzése, hogy éppen új stage-be léptünk az FFT-n belül
reg new_stage;
// A loading_done impulzusra elkezdjük az FFT-t
// Emellett kezeljük a new_stage változót is és meggyõzõdünk róla, hogy csak 1 órajelig tartson
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
// TODO: Mikor szûnik meg az fft_in_progress?


// Számontartjuk, hogy melyik stage-et számítjuk éppen (1-10)
reg [3:0] stage_cntr;

// Ha reset volt, vagy éppen nem FFT-zünk, akkor a stage_cntr értéke 0
// Ha viszont megy az FFT és új stage-be érünk, akkor az értéke nõ egyel
always @ (posedge clk)
if (rst | ~fft_in_progress)
    stage_cntr <= 0;
else if (new_stage & fft_in_progress)
    stage_cntr <= stage_cntr + 1;



// Az adott stage-ben hány group van (512, 256, 128, 64, 32, 16, 8, 4, 2, 1)
reg [9:0] groups;
// Az adott stage-ben hány elemet tartalmaz 1 db group (2, 4, 8, 16, 32, 64, 128, 256, 512, 1024)
reg [10:0] element_per_group;
// Az adott stage-ben hány elem van egy group egyik felében (1, 2, 4, 8, 16, 32, 64, 128, 256, 512)
reg [9:0] half;

// Stage-enként a segédváltozók inicializálása
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











// Annak a jelzése, hogy kész az FFT
reg fft_done_reg;
always @ (posedge clk)
if (rst)
    fft_done_reg <= 0;








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







// A komplex huzalozás megvalósítása

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



// Számláló, ami számon tartja a butterfly mûvelet forrásmemóriájából történõ olvasási folyamatot.
// read_cntr =
// 00: nincs olvasás
// 01: x1 és w1 olvasása
// 10: x2 és w2 olvasása
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

    

// Bufferek írása a megfelelõ ütemben
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




// Számláló, ami számon tartja a butterfly mûvelet célmemóriájába történõ írási folyamatot.
// write_cntr =
// 00: nincs írás
// 01: y1 írása
// 10: y2 írása
// 11: 
reg [1:0] write_cntr;
always @ (posedge clk)
if (rst)
    write_cntr <= 0;
else if (butterfly_done)
    write_cntr <= write_cntr + 1;


// Bufferek olvasása a megfelelõ ütemben
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
