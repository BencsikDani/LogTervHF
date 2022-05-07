# LogTervHF

## Gyak példa:
- CLK = 100 MHz
- MCLK = CLK/2 = 50 MHz
- LRCK = MCLK/256 = 195.3125 kHz
- SCLK = LRCK * 64 = 12.5 MHz

## Mi példánk:
- CLK = 100 MHz
- MCLK = CLK/2 = 50 MHz
- LRCK = MCLK/1024 = 48.828125 kHz
- SCLK = LRCK * 64 = 3.125 MHz
  
- N =	1024
- Műveletek = N * log2(N) = 10240
- Butterfly = Műveletek / 2 = 5120
  
- Eredmény frekvencia:		60 Hz
- Mintavételi frekvencia:		48828.125 Hz
- Mintavétel / megjelenítés:	813.8
