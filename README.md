
# LogTervHF

## Gyak példa:
- 192 kHz mintavételi frekvencia → Quad mode.
- MCLK/LRCK=256.
- SCLK = 64 * FS.
- Stand-alone mód: konfiguráció lábak segítségével.
- Slave mód, azaz minden órajelet az FPGA szolgáltat.
- Left-Justified audió interfész.
<br/></br>
- CLK = 100 MHz
- MCLK = CLK/2 = 50 MHz
- LRCK = MCLK/256 = 195.3125 kHz
- SCLK = LRCK * 64 = 12.5 MHz
##### Generálás div_cntr-ből:
- LRCK = CLK / 512 → bit[8]
- SCLK = CLK / 8 → bit[2]
- MCLK = CLK / 2 → bit[0]
## Mi példánk:
- 48 kHz mintavételi frekvencia → Single mode.
- MCLK/LRCK=1024
- SCLK = 64*FS.
- Stand-alone mód: konfiguráció lábak segítségével.
- Slave mód, azaz minden órajelet az FPGA szolgáltat.
- Left-Justified audió interfész.
<br/></br>
- CLK = 100 MHz
- MCLK = 256 * FS = 256 * LRCK = CLK/8 = 12.5 MHz
- LRCK = MCLK/256 = 48.828125 kHz
- SCLK = LRCK * 64 = 3.125 MHz
##### Generálás div_cntr-ből:
- LRCK = CLK / 2048 → bit[10]
- SCLK = CLK / 32 → bit[4]
- MCLK = CLK / 2 → bit[0]
#### FFT:
- N = 1024
- Műveletek = N * log2(N) = 10240
- Butterfly = Műveletek / 2 = 5120
<br/></br>
- Eredmény frekvencia:			60 Hz
- Mintavételi frekvencia:		48828.125 Hz
- Mintavétel / megjelenítés:	813.8