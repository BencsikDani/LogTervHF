
?
Command: %s
1870*	planAhead2?
?read_checkpoint -auto_incremental -incremental C:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/utils_1/imports/synth_1/hdmi_top.dcp2default:defaultZ12-2866h px? 
?
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2n
ZC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/utils_1/imports/synth_1/hdmi_top.dcp2default:defaultZ12-5825h px? 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px? 
u
Command: %s
53*	vivadotcl2D
0synth_design -top hdmi_top -part xc7k70tfbg676-12default:defaultZ4-113h px? 
:
Starting synth_design
149*	vivadotclZ4-321h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7k70t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7k70t2default:defaultZ17-349h px? 
V
Loading part %s157*device2#
xc7k70tfbg676-12default:defaultZ21-403h px? 
?
[Reference run did not run incremental synthesis because %s; reverting to default synthesis
2138*designutils2+
the design is too small2default:defaultZ20-4072hpx? 
?
?Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px? 
?
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px? 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px? 
`
#Helper process launched with PID %s4824*oasys2
275402default:defaultZ8-7075h px? 
?
,redeclaration of ansi port %s is not allowed2611*oasys2#
loading_samples2default:default2d
NC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/FFT_Core.v2default:default2
302default:default8@Z8-2611h px? 
?
,redeclaration of ansi port %s is not allowed2611*oasys2#
fft_in_progress2default:default2d
NC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/FFT_Core.v2default:default2
342default:default8@Z8-2611h px? 
?
,redeclaration of ansi port %s is not allowed2611*oasys2
	new_stage2default:default2d
NC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/FFT_Core.v2default:default2
362default:default8@Z8-2611h px? 
?
,redeclaration of ansi port %s is not allowed2611*oasys2

stage_cntr2default:default2d
NC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/FFT_Core.v2default:default2
382default:default8@Z8-2611h px? 
?
,redeclaration of ansi port %s is not allowed2611*oasys2%
ram_2_real_dout_a2default:default2d
NC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/FFT_Core.v2default:default2
2712default:default8@Z8-2611h px? 
?
,redeclaration of ansi port %s is not allowed2611*oasys2
div_cntr2default:default2m
WC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/new/top_level.v2default:default2
1002default:default8@Z8-2611h px? 
?
%s*synth2?
wStarting RTL Elaboration : Time (s): cpu = 00:00:06 ; elapsed = 00:00:07 . Memory (MB): peak = 1245.496 ; gain = 0.000
2default:defaulth px? 
?
synthesizing module '%s'%s4497*oasys2
hdmi_top2default:default2
 2default:default2l
VC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/new/hdmi_top.v2default:default2
232default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys2

PLLE2_BASE2default:default2
 2default:default2K
5E:/Xilinx/Vivado/2021.2/scripts/rt/data/unisim_comp.v2default:default2
894762default:default8@Z8-6157h px? 
e
%s
*synth2M
9	Parameter BANDWIDTH bound to: OPTIMIZED - type: string 
2default:defaulth p
x
? 
c
%s
*synth2K
7	Parameter CLKFBOUT_MULT bound to: 10 - type: integer 
2default:defaulth p
x
? 
i
%s
*synth2Q
=	Parameter CLKFBOUT_PHASE bound to: 0.000000 - type: double 
2default:defaulth p
x
? 
i
%s
*synth2Q
=	Parameter CLKIN1_PERIOD bound to: 10.000000 - type: double 
2default:defaulth p
x
? 
c
%s
*synth2K
7	Parameter CLKOUT0_DIVIDE bound to: 5 - type: integer 
2default:defaulth p
x
? 
m
%s
*synth2U
A	Parameter CLKOUT0_DUTY_CYCLE bound to: 0.500000 - type: double 
2default:defaulth p
x
? 
h
%s
*synth2P
<	Parameter CLKOUT0_PHASE bound to: 0.000000 - type: double 
2default:defaulth p
x
? 
d
%s
*synth2L
8	Parameter CLKOUT1_DIVIDE bound to: 25 - type: integer 
2default:defaulth p
x
? 
m
%s
*synth2U
A	Parameter CLKOUT1_DUTY_CYCLE bound to: 0.500000 - type: double 
2default:defaulth p
x
? 
h
%s
*synth2P
<	Parameter CLKOUT1_PHASE bound to: 0.000000 - type: double 
2default:defaulth p
x
? 
c
%s
*synth2K
7	Parameter CLKOUT2_DIVIDE bound to: 1 - type: integer 
2default:defaulth p
x
? 
m
%s
*synth2U
A	Parameter CLKOUT2_DUTY_CYCLE bound to: 0.500000 - type: double 
2default:defaulth p
x
? 
h
%s
*synth2P
<	Parameter CLKOUT2_PHASE bound to: 0.000000 - type: double 
2default:defaulth p
x
? 
c
%s
*synth2K
7	Parameter CLKOUT3_DIVIDE bound to: 1 - type: integer 
2default:defaulth p
x
? 
m
%s
*synth2U
A	Parameter CLKOUT3_DUTY_CYCLE bound to: 0.500000 - type: double 
2default:defaulth p
x
? 
h
%s
*synth2P
<	Parameter CLKOUT3_PHASE bound to: 0.000000 - type: double 
2default:defaulth p
x
? 
c
%s
*synth2K
7	Parameter CLKOUT4_DIVIDE bound to: 1 - type: integer 
2default:defaulth p
x
? 
m
%s
*synth2U
A	Parameter CLKOUT4_DUTY_CYCLE bound to: 0.500000 - type: double 
2default:defaulth p
x
? 
h
%s
*synth2P
<	Parameter CLKOUT4_PHASE bound to: 0.000000 - type: double 
2default:defaulth p
x
? 
c
%s
*synth2K
7	Parameter CLKOUT5_DIVIDE bound to: 1 - type: integer 
2default:defaulth p
x
? 
m
%s
*synth2U
A	Parameter CLKOUT5_DUTY_CYCLE bound to: 0.500000 - type: double 
2default:defaulth p
x
? 
h
%s
*synth2P
<	Parameter CLKOUT5_PHASE bound to: 0.000000 - type: double 
2default:defaulth p
x
? 
b
%s
*synth2J
6	Parameter DIVCLK_DIVIDE bound to: 1 - type: integer 
2default:defaulth p
x
? 
f
%s
*synth2N
:	Parameter REF_JITTER1 bound to: 0.000000 - type: double 
2default:defaulth p
x
? 
d
%s
*synth2L
8	Parameter STARTUP_WAIT bound to: FALSE - type: string 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

PLLE2_BASE2default:default2
 2default:default2
12default:default2
12default:default2K
5E:/Xilinx/Vivado/2021.2/scripts/rt/data/unisim_comp.v2default:default2
894762default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
BUFG2default:default2
 2default:default2K
5E:/Xilinx/Vivado/2021.2/scripts/rt/data/unisim_comp.v2default:default2
10832default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
BUFG2default:default2
 2default:default2
22default:default2
12default:default2K
5E:/Xilinx/Vivado/2021.2/scripts/rt/data/unisim_comp.v2default:default2
10832default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
hdmi_tx2default:default2
 2default:default2k
UC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/new/hdmi_tx.v2default:default2
12default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
hdmi_tx2default:default2
 2default:default2
32default:default2
12default:default2k
UC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/new/hdmi_tx.v2default:default2
12default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2'
spec_anal_top_level2default:default2
 2default:default2m
WC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/new/top_level.v2default:default2
232default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys2
codec_if2default:default2
 2default:default2l
VC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/new/codec_if.v2default:default2
32default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
codec_if2default:default2
 2default:default2
42default:default2
12default:default2l
VC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/new/codec_if.v2default:default2
32default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2

fir_filter2default:default2
 2default:default2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/fir_filter.v2default:default2
32default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys2
smpl_ram2default:default2
 2default:default2d
NC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/smpl_ram.v2default:default2
232default:default8@Z8-6157h px? 
\
%s
*synth2D
0	Parameter DATA_W bound to: 24 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter ADDR_W bound to: 9 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
smpl_ram2default:default2
 2default:default2
52default:default2
12default:default2d
NC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/smpl_ram.v2default:default2
232default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2

rom_512x352default:default2
 2default:default2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
212default:default8@Z8-6157h px? 
?
,$readmem data file '%s' is read successfully3426*oasys2!
coeffs_1k.txt2default:default2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
282default:default8@Z8-3876h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
1ignoring non-constant assignment in initial block311*oasys2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
462default:default8@Z8-311h px? 
?
?Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Synth 8-3112default:default2
1002default:defaultZ17-14h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

rom_512x352default:default2
 2default:default2
62default:default2
12default:default2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/rom_512x35.v2default:default2
212default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
	mul_24x352default:default2
 2default:default2m
WC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/mul_24x35.v2default:default2
212default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys2
	dsp_25x182default:default2
 2default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/dsp_25x18.v2default:default2
232default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter A_REG bound to: 1 - type: integer 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	Parameter B_REG bound to: 1 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	dsp_25x182default:default2
 2default:default2
72default:default2
12default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/dsp_25x18.v2default:default2
232default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2-
dsp_25x18__parameterized02default:default2
 2default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/dsp_25x18.v2default:default2
232default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter A_REG bound to: 2 - type: integer 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	Parameter B_REG bound to: 2 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2-
dsp_25x18__parameterized02default:default2
 2default:default2
72default:default2
12default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/dsp_25x18.v2default:default2
232default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	mul_24x352default:default2
 2default:default2
82default:default2
12default:default2m
WC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/mul_24x35.v2default:default2
212default:default8@Z8-6155h px? 
?
fMark debug on the nets applies keep_hierarchy on instance '%s'. This will prevent further optimization4399*oasys2
	coeff_rom2default:default2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/fir_filter.v2default:default2
1042default:default8@Z8-6071h px? 
?
fMark debug on the nets applies keep_hierarchy on instance '%s'. This will prevent further optimization4399*oasys2
mul_fir2default:default2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/fir_filter.v2default:default2
1162default:default8@Z8-6071h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

fir_filter2default:default2
 2default:default2
92default:default2
12default:default2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/fir_filter.v2default:default2
32default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2"
FFT_Controller2default:default2
 2default:default2j
TC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/FFT_Controller.v2default:default2
32default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys2,
smpl_ram__parameterized02default:default2
 2default:default2d
NC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/smpl_ram.v2default:default2
232default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2,
smpl_ram__parameterized02default:default2
 2default:default2
92default:default2
12default:default2d
NC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/smpl_ram.v2default:default2
232default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
FFT_Core2default:default2
 2default:default2d
NC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/FFT_Core.v2default:default2
32default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys2,
smpl_ram__parameterized12default:default2
 2default:default2d
NC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/smpl_ram.v2default:default2
232default:default8@Z8-6157h px? 
\
%s
*synth2D
0	Parameter DATA_W bound to: 24 - type: integer 
2default:defaulth p
x
? 
\
%s
*synth2D
0	Parameter ADDR_W bound to: 10 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2,
smpl_ram__parameterized12default:default2
 2default:default2
92default:default2
12default:default2d
NC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/smpl_ram.v2default:default2
232default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
	coeff_rom2default:default2
 2default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/coeff_rom.v2default:default2
232default:default8@Z8-6157h px? 
e
%s
*synth2M
9	Parameter FILE bound to: coeff_real.txt - type: string 
2default:defaulth p
x
? 
?
,$readmem data file '%s' is read successfully3426*oasys2"
coeff_real.txt2default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/coeff_rom.v2default:default2
322default:default8@Z8-3876h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	coeff_rom2default:default2
 2default:default2
102default:default2
12default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/coeff_rom.v2default:default2
232default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2-
coeff_rom__parameterized02default:default2
 2default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/coeff_rom.v2default:default2
232default:default8@Z8-6157h px? 
e
%s
*synth2M
9	Parameter FILE bound to: coeff_imag.txt - type: string 
2default:defaulth p
x
? 
?
,$readmem data file '%s' is read successfully3426*oasys2"
coeff_imag.txt2default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/coeff_rom.v2default:default2
322default:default8@Z8-3876h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2-
coeff_rom__parameterized02default:default2
 2default:default2
102default:default2
12default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/coeff_rom.v2default:default2
232default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
	butterfly2default:default2
 2default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/butterfly.v2default:default2
32default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys2-
dsp_25x18__parameterized12default:default2
 2default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/dsp_25x18.v2default:default2
232default:default8@Z8-6157h px? 
N
%s
*synth26
"	Parameter A_REG bound to: 2'b10 
2default:defaulth p
x
? 
N
%s
*synth26
"	Parameter B_REG bound to: 2'b10 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2-
dsp_25x18__parameterized12default:default2
 2default:default2
102default:default2
12default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/dsp_25x18.v2default:default2
232default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2-
dsp_25x18__parameterized22default:default2
 2default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/dsp_25x18.v2default:default2
232default:default8@Z8-6157h px? 
N
%s
*synth26
"	Parameter A_REG bound to: 2'b01 
2default:defaulth p
x
? 
N
%s
*synth26
"	Parameter B_REG bound to: 2'b01 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2-
dsp_25x18__parameterized22default:default2
 2default:default2
102default:default2
12default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/dsp_25x18.v2default:default2
232default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	butterfly2default:default2
 2default:default2
112default:default2
12default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/butterfly.v2default:default2
32default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
FFT_Core2default:default2
 2default:default2
122default:default2
12default:default2d
NC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/FFT_Core.v2default:default2
32default:default8@Z8-6155h px? 
?
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
12default:default2
cb_addr_out2default:default2
102default:default2
FFT_Core2default:default2j
TC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/FFT_Controller.v2default:default2
1222default:default8@Z8-689h px? 
?
synthesizing module '%s'%s4497*oasys2
	fft_to_dB2default:default2
 2default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/fft_to_dB.v2default:default2
62default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys2
	mul_24x242default:default2
 2default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/mul_24x24.v2default:default2
232default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	mul_24x242default:default2
 2default:default2
132default:default2
12default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/mul_24x24.v2default:default2
232default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2 
dB_value_rom2default:default2
 2default:default2h
RC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/dB_value_rom.v2default:default2
32default:default8@Z8-6157h px? 
d
%s
*synth2L
8	Parameter FILE bound to: dB_values.txt - type: string 
2default:defaulth p
x
? 
?
,$readmem data file '%s' is read successfully3426*oasys2!
dB_values.txt2default:default2h
RC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/dB_value_rom.v2default:default2
122default:default8@Z8-3876h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2 
dB_value_rom2default:default2
 2default:default2
142default:default2
12default:default2h
RC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/dB_value_rom.v2default:default2
32default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	fft_to_dB2default:default2
 2default:default2
152default:default2
12default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/fft_to_dB.v2default:default2
62default:default8@Z8-6155h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2&
smpl_addr_cntr_reg2default:default2j
TC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/FFT_Controller.v2default:default2
692default:default8@Z8-6014h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2"
FFT_Controller2default:default2
 2default:default2
162default:default2
12default:default2j
TC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/FFT_Controller.v2default:default2
32default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2'
spec_anal_top_level2default:default2
 2default:default2
172default:default2
12default:default2m
WC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/new/top_level.v2default:default2
232default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
hdmi_top2default:default2
 2default:default2
182default:default2
12default:default2l
VC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/new/hdmi_top.v2default:default2
232default:default8@Z8-6155h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2

cb_dout[9]2default:default2
FFT_Core2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2

cb_dout[8]2default:default2
FFT_Core2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2

cb_dout[7]2default:default2
FFT_Core2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2

cb_dout[6]2default:default2
FFT_Core2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2

cb_dout[5]2default:default2
FFT_Core2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2

cb_dout[4]2default:default2
FFT_Core2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2

cb_dout[3]2default:default2
FFT_Core2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2

cb_dout[2]2default:default2
FFT_Core2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2

cb_dout[1]2default:default2
FFT_Core2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2

cb_dout[0]2default:default2
FFT_Core2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2 
aud_dout[23]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2 
aud_dout[22]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2 
aud_dout[21]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2 
aud_dout[20]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2 
aud_dout[19]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2 
aud_dout[18]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2 
aud_dout[17]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2 
aud_dout[16]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2 
aud_dout[15]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2 
aud_dout[14]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2 
aud_dout[13]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2 
aud_dout[12]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2 
aud_dout[11]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2 
aud_dout[10]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
aud_dout[9]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
aud_dout[8]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
aud_dout[7]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
aud_dout[6]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
aud_dout[5]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
aud_dout[4]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
aud_dout[3]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
aud_dout[2]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
aud_dout[1]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
aud_dout[0]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2 
div_cntr[21]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2 
div_cntr[20]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2 
div_cntr[19]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2 
div_cntr[18]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2 
div_cntr[16]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2 
div_cntr[15]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2 
div_cntr[14]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2 
div_cntr[13]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2 
div_cntr[12]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2 
div_cntr[11]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
div_cntr[9]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
div_cntr[8]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
div_cntr[7]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
div_cntr[6]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
div_cntr[5]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
div_cntr[4]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
div_cntr[3]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
div_cntr[2]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
div_cntr[1]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
div_cntr[0]2default:default2"
FFT_Controller2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2"
aud_din_vld[1]2default:default2
codec_if2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2"
aud_din_vld[0]2default:default2
codec_if2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
bt[2]2default:default2
hdmi_top2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
bt[1]2default:default2
hdmi_top2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
bt[0]2default:default2
hdmi_top2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[5]2default:default2
hdmi_top2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[4]2default:default2
hdmi_top2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[3]2default:default2
hdmi_top2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[2]2default:default2
hdmi_top2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[1]2default:default2
hdmi_top2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
hdmi_tx_cec2default:default2
hdmi_top2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2 
hdmi_tx_hpdn2default:default2
hdmi_top2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
hdmi_tx_scl2default:default2
hdmi_top2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
hdmi_tx_sda2default:default2
hdmi_top2default:defaultZ8-7129h px? 
?
%s*synth2?
wFinished RTL Elaboration : Time (s): cpu = 00:00:08 ; elapsed = 00:00:09 . Memory (MB): peak = 1245.496 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:09 ; elapsed = 00:00:10 . Memory (MB): peak = 1245.496 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:09 ; elapsed = 00:00:10 . Memory (MB): peak = 1245.496 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.1212default:default2
1245.4962default:default2
0.0002default:defaultZ17-268h px? 
e
-Analyzing %s Unisim elements for replacement
17*netlist2
12default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
>

Processing XDC Constraints
244*projectZ1-262h px? 
=
Initializing timing engine
348*projectZ1-569h px? 
?
Parsing XDC File [%s]
179*designutils2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/constrs_1/imports/new/hdmi_top.xdc2default:default8Z20-179h px? 
?
Finished Parsing XDC File [%s]
178*designutils2n
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/constrs_1/imports/new/hdmi_top.xdc2default:default8Z20-178h px? 
?
?Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2l
XC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/constrs_1/imports/new/hdmi_top.xdc2default:default2.
.Xil/hdmi_top_propImpl.xdc2default:defaultZ1-236h px? 
8
Deriving generated clocks
2*timingZ38-2h px? 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0012default:default2
1262.4222default:default2
0.0002default:defaultZ17-268h px? 
?
!Unisim Transformation Summary:
%s111*project2f
R  A total of 1 instances were transformed.
  PLLE2_BASE => PLLE2_ADV: 1 instance 
2default:defaultZ1-111h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0262default:default2
1262.4222default:default2
0.0002default:defaultZ17-268h px? 
?
[Reference run did not run incremental synthesis because %s; reverting to default synthesis
2138*designutils2+
the design is too small2default:defaultZ20-4072hpx? 
?
?Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
~Finished Constraint Validation : Time (s): cpu = 00:00:19 ; elapsed = 00:00:19 . Memory (MB): peak = 1262.422 ; gain = 16.926
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Loading part: xc7k70tfbg676-1
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Loading Part and Timing Information : Time (s): cpu = 00:00:19 ; elapsed = 00:00:19 . Memory (MB): peak = 1262.422 ; gain = 16.926
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:19 ; elapsed = 00:00:19 . Memory (MB): peak = 1262.422 ; gain = 16.926
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2
po_0_dl_reg2default:default2
482default:default2
172default:default2m
WC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/FIR/mul_24x35.v2default:default2
492default:default8@Z8-3936h px? 
?
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2
po_0_dl_reg2default:default2
482default:default2
172default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/mul_24x24.v2default:default2
582default:default8@Z8-3936h px? 
?
?The signal %s was recognized as a true dual port RAM template.
3473*oasys2-
"smpl_ram:/ram_array_reg"2default:defaultZ8-3971h px? 
?
?The signal %s was recognized as a true dual port RAM template.
3473*oasys2=
)"smpl_ram__parameterized0:/ram_array_reg"2default:defaultZ8-3971h px? 
?
?The signal %s was recognized as a true dual port RAM template.
3473*oasys2=
)"smpl_ram__parameterized1:/ram_array_reg"2default:defaultZ8-3971h px? 
?
!inferring latch for variable '%s'327*oasys2-
ram_3_real_addr_a_reg_reg2default:default2d
NC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/FFT_Core.v2default:default2
7122default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2-
ram_2_real_addr_a_reg_reg2default:default2d
NC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/FFT_Core.v2default:default2
7102default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2-
ram_1_real_addr_b_reg_reg2default:default2d
NC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/FFT_Core.v2default:default2
7082default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2)
rom_real_addr_reg_reg2default:default2d
NC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/FFT_Core.v2default:default2
7142default:default8@Z8-327h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:20 ; elapsed = 00:00:21 . Memory (MB): peak = 1262.422 ; gain = 16.926
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   49 Bit       Adders := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   32 Bit       Adders := 3     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   11 Bit       Adders := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   10 Bit       Adders := 9     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    8 Bit       Adders := 3     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    5 Bit       Adders := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    4 Bit       Adders := 3     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    3 Bit       Adders := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    2 Bit       Adders := 2     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               67 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               49 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               31 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               24 Bit    Registers := 27    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               23 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               18 Bit    Registers := 22    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               17 Bit    Registers := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               11 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               10 Bit    Registers := 10    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                8 Bit    Registers := 6     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                5 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                4 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                3 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                2 Bit    Registers := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 39    
2default:defaulth p
x
? 
8
%s
*synth2 
+---RAMs : 
2default:defaulth p
x
? 
k
%s
*synth2S
?	              24K Bit	(1024 X 24 bit)          RAMs := 9     
2default:defaulth p
x
? 
j
%s
*synth2R
>	              12K Bit	(512 X 24 bit)          RAMs := 1     
2default:defaulth p
x
? 
8
%s
*synth2 
+---ROMs : 
2default:defaulth p
x
? 
P
%s
*synth28
$	                    ROMs := 4     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   24 Bit        Muxes := 12    
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input   24 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   10 Bit        Muxes := 3     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input   10 Bit        Muxes := 5     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    8 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input    8 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input    5 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    5 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input    4 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input    2 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input    2 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 26    
2default:defaulth p
x
? 
X
%s
*synth2@
,	   5 Input    1 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input    1 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input    1 Bit        Muxes := 1     
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2k
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px? 
?
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2$
DSP_MS/p_reg_reg2default:default2
482default:default2
422default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/dsp_25x18.v2default:default2
522default:default8@Z8-3936h px? 
?
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2$
DSP_MS/m_reg_reg2default:default2
432default:default2
422default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/dsp_25x18.v2default:default2
512default:default8@Z8-3936h px? 
v
%s
*synth2^
JDSP Report: Generating DSP DSP_LS/p_reg_reg, operation Mode is: (A2*B2)'.
2default:defaulth p
x
? 
y
%s
*synth2a
MDSP Report: register DSP_LS/p_reg_reg is absorbed into DSP DSP_LS/p_reg_reg.
2default:defaulth p
x
? 
|
%s
*synth2d
PDSP Report: register DSP_LS/a_reg_reg[0] is absorbed into DSP DSP_LS/p_reg_reg.
2default:defaulth p
x
? 
y
%s
*synth2a
MDSP Report: register DSP_LS/p_reg_reg is absorbed into DSP DSP_LS/p_reg_reg.
2default:defaulth p
x
? 
y
%s
*synth2a
MDSP Report: register DSP_LS/m_reg_reg is absorbed into DSP DSP_LS/p_reg_reg.
2default:defaulth p
x
? 
v
%s
*synth2^
JDSP Report: operator DSP_LS/p_reg0 is absorbed into DSP DSP_LS/p_reg_reg.
2default:defaulth p
x
? 
v
%s
*synth2^
JDSP Report: operator DSP_LS/m_reg0 is absorbed into DSP DSP_LS/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2k
WDSP Report: Generating DSP DSP_MS/p_reg_reg, operation Mode is: (PCIN>>17)+(A''*B'')'.
2default:defaulth p
x
? 
|
%s
*synth2d
PDSP Report: register DSP_MS/b_reg_reg[0] is absorbed into DSP DSP_MS/p_reg_reg.
2default:defaulth p
x
? 
|
%s
*synth2d
PDSP Report: register DSP_MS/b_reg_reg[1] is absorbed into DSP DSP_MS/p_reg_reg.
2default:defaulth p
x
? 
|
%s
*synth2d
PDSP Report: register DSP_LS/a_reg_reg[0] is absorbed into DSP DSP_MS/p_reg_reg.
2default:defaulth p
x
? 
|
%s
*synth2d
PDSP Report: register DSP_MS/a_reg_reg[1] is absorbed into DSP DSP_MS/p_reg_reg.
2default:defaulth p
x
? 
y
%s
*synth2a
MDSP Report: register DSP_MS/p_reg_reg is absorbed into DSP DSP_MS/p_reg_reg.
2default:defaulth p
x
? 
y
%s
*synth2a
MDSP Report: register DSP_MS/m_reg_reg is absorbed into DSP DSP_MS/p_reg_reg.
2default:defaulth p
x
? 
v
%s
*synth2^
JDSP Report: operator DSP_MS/p_reg0 is absorbed into DSP DSP_MS/p_reg_reg.
2default:defaulth p
x
? 
v
%s
*synth2^
JDSP Report: operator DSP_MS/m_reg0 is absorbed into DSP DSP_MS/p_reg_reg.
2default:defaulth p
x
? 
?
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2"
DSP3/p_reg_reg2default:default2
482default:default2
102default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/dsp_25x18.v2default:default2
522default:default8@Z8-3936h px? 
?
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2"
DSP3/m_reg_reg2default:default2
432default:default2
102default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/dsp_25x18.v2default:default2
512default:default8@Z8-3936h px? 
?
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2"
DSP2/p_reg_reg2default:default2
482default:default2
102default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/dsp_25x18.v2default:default2
522default:default8@Z8-3936h px? 
?
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2"
DSP2/m_reg_reg2default:default2
432default:default2
102default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/dsp_25x18.v2default:default2
512default:default8@Z8-3936h px? 
?
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2%
DSP2/b_reg_reg[0]2default:default2
182default:default2
102default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/dsp_25x18.v2default:default2
472default:default8@Z8-3936h px? 
?
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2"
DSP1/p_reg_reg2default:default2
482default:default2
102default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/dsp_25x18.v2default:default2
522default:default8@Z8-3936h px? 
?
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2"
DSP1/m_reg_reg2default:default2
432default:default2
102default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/dsp_25x18.v2default:default2
512default:default8@Z8-3936h px? 
?
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2%
DSP1/b_reg_reg[0]2default:default2
182default:default2
102default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/dsp_25x18.v2default:default2
472default:default8@Z8-3936h px? 
?
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2%
DSP3/a_reg_reg[0]2default:default2
252default:default2
102default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/dsp_25x18.v2default:default2
432default:default8@Z8-3936h px? 
?
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2%
DSP1/a_reg_reg[0]2default:default2
252default:default2
102default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/dsp_25x18.v2default:default2
432default:default8@Z8-3936h px? 
?
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2%
DSP2/a_reg_reg[0]2default:default2
252default:default2
102default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/dsp_25x18.v2default:default2
432default:default8@Z8-3936h px? 
?
%s
*synth2o
[DSP Report: Generating DSP btf/inst[2].DSP/p_reg_reg, operation Mode is: (C'+(A''*B'')')'.
2default:defaulth p
x
? 
?
%s
*synth2j
VDSP Report: register w2_real_buff_reg is absorbed into DSP btf/inst[2].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2v
bDSP Report: register btf/inst[2].DSP/b_reg_reg[0] is absorbed into DSP btf/inst[2].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[2].DSP/p_reg_reg is absorbed into DSP btf/inst[2].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[2].DSP/p_reg_reg is absorbed into DSP btf/inst[2].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[2].DSP/p_reg_reg is absorbed into DSP btf/inst[2].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[2].DSP/p_reg_reg is absorbed into DSP btf/inst[2].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[2].DSP/m_reg_reg is absorbed into DSP btf/inst[2].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2p
\DSP Report: operator btf/inst[2].DSP/p_reg0 is absorbed into DSP btf/inst[2].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2p
\DSP Report: operator btf/inst[2].DSP/m_reg0 is absorbed into DSP btf/inst[2].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2q
]DSP Report: Generating DSP btf/inst[1].DSP/p_reg_reg, operation Mode is: (PCIN+(A''*B'')')'.
2default:defaulth p
x
? 
?
%s
*synth2v
bDSP Report: register btf/inst[1].DSP/b_reg_reg[0] is absorbed into DSP btf/inst[1].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2v
bDSP Report: register btf/inst[1].DSP/b_reg_reg[1] is absorbed into DSP btf/inst[1].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[1].DSP/p_reg_reg is absorbed into DSP btf/inst[1].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[1].DSP/p_reg_reg is absorbed into DSP btf/inst[1].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[1].DSP/p_reg_reg is absorbed into DSP btf/inst[1].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[1].DSP/m_reg_reg is absorbed into DSP btf/inst[1].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2p
\DSP Report: operator btf/inst[1].DSP/p_reg0 is absorbed into DSP btf/inst[1].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2p
\DSP Report: operator btf/inst[1].DSP/m_reg0 is absorbed into DSP btf/inst[1].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2o
[DSP Report: Generating DSP btf/inst[6].DSP/p_reg_reg, operation Mode is: (C'+(A''*B'')')'.
2default:defaulth p
x
? 
?
%s
*synth2j
VDSP Report: register w1_real_buff_reg is absorbed into DSP btf/inst[6].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2v
bDSP Report: register btf/inst[6].DSP/b_reg_reg[0] is absorbed into DSP btf/inst[6].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[6].DSP/p_reg_reg is absorbed into DSP btf/inst[6].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[6].DSP/p_reg_reg is absorbed into DSP btf/inst[6].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[6].DSP/p_reg_reg is absorbed into DSP btf/inst[6].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[6].DSP/p_reg_reg is absorbed into DSP btf/inst[6].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[6].DSP/m_reg_reg is absorbed into DSP btf/inst[6].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2p
\DSP Report: operator btf/inst[6].DSP/p_reg0 is absorbed into DSP btf/inst[6].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2p
\DSP Report: operator btf/inst[6].DSP/m_reg0 is absorbed into DSP btf/inst[6].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2q
]DSP Report: Generating DSP btf/inst[5].DSP/p_reg_reg, operation Mode is: (PCIN+(A''*B'')')'.
2default:defaulth p
x
? 
?
%s
*synth2v
bDSP Report: register btf/inst[5].DSP/b_reg_reg[0] is absorbed into DSP btf/inst[5].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2v
bDSP Report: register btf/inst[5].DSP/b_reg_reg[1] is absorbed into DSP btf/inst[5].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[5].DSP/p_reg_reg is absorbed into DSP btf/inst[5].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[5].DSP/p_reg_reg is absorbed into DSP btf/inst[5].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[5].DSP/p_reg_reg is absorbed into DSP btf/inst[5].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[5].DSP/m_reg_reg is absorbed into DSP btf/inst[5].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2p
\DSP Report: operator btf/inst[5].DSP/p_reg0 is absorbed into DSP btf/inst[5].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2p
\DSP Report: operator btf/inst[5].DSP/m_reg0 is absorbed into DSP btf/inst[5].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2o
[DSP Report: Generating DSP btf/inst[4].DSP/p_reg_reg, operation Mode is: (C'+(A''*B'')')'.
2default:defaulth p
x
? 
?
%s
*synth2j
VDSP Report: register w2_real_buff_reg is absorbed into DSP btf/inst[4].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[4].DSP/p_reg_reg is absorbed into DSP btf/inst[4].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[4].DSP/p_reg_reg is absorbed into DSP btf/inst[4].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[4].DSP/p_reg_reg is absorbed into DSP btf/inst[4].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2v
bDSP Report: register btf/inst[2].DSP/b_reg_reg[0] is absorbed into DSP btf/inst[4].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[4].DSP/p_reg_reg is absorbed into DSP btf/inst[4].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[4].DSP/m_reg_reg is absorbed into DSP btf/inst[4].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2p
\DSP Report: operator btf/inst[4].DSP/p_reg0 is absorbed into DSP btf/inst[4].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2p
\DSP Report: operator btf/inst[4].DSP/m_reg0 is absorbed into DSP btf/inst[4].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2t
`DSP Report: Generating DSP btf/inst[3].DSP/p_reg_reg, operation Mode is: (PCIN+((-A'')*B'')')'.
2default:defaulth p
x
? 
?
%s
*synth2v
bDSP Report: register btf/inst[1].DSP/b_reg_reg[0] is absorbed into DSP btf/inst[3].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[3].DSP/p_reg_reg is absorbed into DSP btf/inst[3].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2v
bDSP Report: register btf/inst[1].DSP/b_reg_reg[1] is absorbed into DSP btf/inst[3].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[3].DSP/p_reg_reg is absorbed into DSP btf/inst[3].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[3].DSP/m_reg_reg is absorbed into DSP btf/inst[3].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2v
bDSP Report: register btf/inst[3].DSP/a_reg_reg[1] is absorbed into DSP btf/inst[3].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2v
bDSP Report: register btf/inst[3].DSP/a_reg_reg[0] is absorbed into DSP btf/inst[3].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2p
\DSP Report: operator btf/inst[3].DSP/p_reg0 is absorbed into DSP btf/inst[3].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2p
\DSP Report: operator btf/inst[3].DSP/m_reg0 is absorbed into DSP btf/inst[3].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2o
[DSP Report: Generating DSP btf/inst[8].DSP/p_reg_reg, operation Mode is: (C'+(A''*B'')')'.
2default:defaulth p
x
? 
?
%s
*synth2j
VDSP Report: register w1_real_buff_reg is absorbed into DSP btf/inst[8].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[8].DSP/p_reg_reg is absorbed into DSP btf/inst[8].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[8].DSP/p_reg_reg is absorbed into DSP btf/inst[8].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[8].DSP/p_reg_reg is absorbed into DSP btf/inst[8].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2v
bDSP Report: register btf/inst[6].DSP/b_reg_reg[0] is absorbed into DSP btf/inst[8].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[8].DSP/p_reg_reg is absorbed into DSP btf/inst[8].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[8].DSP/m_reg_reg is absorbed into DSP btf/inst[8].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2p
\DSP Report: operator btf/inst[8].DSP/p_reg0 is absorbed into DSP btf/inst[8].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2p
\DSP Report: operator btf/inst[8].DSP/m_reg0 is absorbed into DSP btf/inst[8].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2t
`DSP Report: Generating DSP btf/inst[7].DSP/p_reg_reg, operation Mode is: (PCIN+((-A'')*B'')')'.
2default:defaulth p
x
? 
?
%s
*synth2v
bDSP Report: register btf/inst[5].DSP/b_reg_reg[0] is absorbed into DSP btf/inst[7].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[7].DSP/p_reg_reg is absorbed into DSP btf/inst[7].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2v
bDSP Report: register btf/inst[5].DSP/b_reg_reg[1] is absorbed into DSP btf/inst[7].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[7].DSP/p_reg_reg is absorbed into DSP btf/inst[7].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2s
_DSP Report: register btf/inst[7].DSP/m_reg_reg is absorbed into DSP btf/inst[7].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2v
bDSP Report: register btf/inst[3].DSP/a_reg_reg[1] is absorbed into DSP btf/inst[7].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2v
bDSP Report: register btf/inst[3].DSP/a_reg_reg[0] is absorbed into DSP btf/inst[7].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2p
\DSP Report: operator btf/inst[7].DSP/p_reg0 is absorbed into DSP btf/inst[7].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2p
\DSP Report: operator btf/inst[7].DSP/m_reg0 is absorbed into DSP btf/inst[7].DSP/p_reg_reg.
2default:defaulth p
x
? 
?
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2K
7spec_anal/controller/convert/re_square/DSP_MS/p_reg_reg2default:default2
482default:default2
312default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/dsp_25x18.v2default:default2
522default:default8@Z8-3936h px? 
?
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2K
7spec_anal/controller/convert/re_square/DSP_MS/m_reg_reg2default:default2
432default:default2
312default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/dsp_25x18.v2default:default2
512default:default8@Z8-3936h px? 
?
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2K
7spec_anal/controller/convert/im_square/DSP_MS/p_reg_reg2default:default2
482default:default2
312default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/dsp_25x18.v2default:default2
522default:default8@Z8-3936h px? 
?
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2K
7spec_anal/controller/convert/im_square/DSP_MS/m_reg_reg2default:default2
432default:default2
312default:default2e
OC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/new/dsp_25x18.v2default:default2
512default:default8@Z8-3936h px? 
?
%s
*synth2?
qDSP Report: Generating DSP spec_anal/controller/convert/im_square/DSP_LS/p_reg_reg, operation Mode is: (A2*B2)'.
2default:defaulth p
x
? 
?
%s
*synth2?
?DSP Report: register spec_anal/controller/convert/im_square/DSP_LS/p_reg_reg is absorbed into DSP spec_anal/controller/convert/im_square/DSP_LS/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2?
?DSP Report: register spec_anal/controller/convert/im_square/DSP_LS/a_reg_reg[0] is absorbed into DSP spec_anal/controller/convert/im_square/DSP_LS/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2?
?DSP Report: register spec_anal/controller/convert/im_square/DSP_LS/p_reg_reg is absorbed into DSP spec_anal/controller/convert/im_square/DSP_LS/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2?
?DSP Report: register spec_anal/controller/convert/im_square/DSP_LS/m_reg_reg is absorbed into DSP spec_anal/controller/convert/im_square/DSP_LS/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2?
?DSP Report: operator spec_anal/controller/convert/im_square/DSP_LS/p_reg0 is absorbed into DSP spec_anal/controller/convert/im_square/DSP_LS/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2?
?DSP Report: operator spec_anal/controller/convert/im_square/DSP_LS/m_reg0 is absorbed into DSP spec_anal/controller/convert/im_square/DSP_LS/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2?
~DSP Report: Generating DSP spec_anal/controller/convert/im_square/DSP_MS/p_reg_reg, operation Mode is: (PCIN>>17)+(A''*B'')'.
2default:defaulth p
x
? 
?
%s
*synth2?
?DSP Report: register spec_anal/controller/convert/im_square/DSP_MS/b_reg_reg[0] is absorbed into DSP spec_anal/controller/convert/im_square/DSP_MS/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2?
?DSP Report: register spec_anal/controller/convert/im_square/DSP_MS/b_reg_reg[1] is absorbed into DSP spec_anal/controller/convert/im_square/DSP_MS/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2?
?DSP Report: register spec_anal/controller/convert/im_square/DSP_LS/a_reg_reg[0] is absorbed into DSP spec_anal/controller/convert/im_square/DSP_MS/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2?
?DSP Report: register spec_anal/controller/convert/im_square/DSP_MS/a_reg_reg[1] is absorbed into DSP spec_anal/controller/convert/im_square/DSP_MS/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2?
?DSP Report: register spec_anal/controller/convert/im_square/DSP_MS/p_reg_reg is absorbed into DSP spec_anal/controller/convert/im_square/DSP_MS/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2?
?DSP Report: register spec_anal/controller/convert/im_square/DSP_MS/m_reg_reg is absorbed into DSP spec_anal/controller/convert/im_square/DSP_MS/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2?
?DSP Report: operator spec_anal/controller/convert/im_square/DSP_MS/p_reg0 is absorbed into DSP spec_anal/controller/convert/im_square/DSP_MS/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2?
?DSP Report: operator spec_anal/controller/convert/im_square/DSP_MS/m_reg0 is absorbed into DSP spec_anal/controller/convert/im_square/DSP_MS/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2?
qDSP Report: Generating DSP spec_anal/controller/convert/re_square/DSP_LS/p_reg_reg, operation Mode is: (A2*B2)'.
2default:defaulth p
x
? 
?
%s
*synth2?
?DSP Report: register spec_anal/controller/convert/re_square/DSP_LS/p_reg_reg is absorbed into DSP spec_anal/controller/convert/re_square/DSP_LS/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2?
?DSP Report: register spec_anal/controller/convert/re_square/DSP_LS/a_reg_reg[0] is absorbed into DSP spec_anal/controller/convert/re_square/DSP_LS/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2?
?DSP Report: register spec_anal/controller/convert/re_square/DSP_LS/p_reg_reg is absorbed into DSP spec_anal/controller/convert/re_square/DSP_LS/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2?
?DSP Report: register spec_anal/controller/convert/re_square/DSP_LS/m_reg_reg is absorbed into DSP spec_anal/controller/convert/re_square/DSP_LS/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2?
?DSP Report: operator spec_anal/controller/convert/re_square/DSP_LS/p_reg0 is absorbed into DSP spec_anal/controller/convert/re_square/DSP_LS/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2?
?DSP Report: operator spec_anal/controller/convert/re_square/DSP_LS/m_reg0 is absorbed into DSP spec_anal/controller/convert/re_square/DSP_LS/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2?
~DSP Report: Generating DSP spec_anal/controller/convert/re_square/DSP_MS/p_reg_reg, operation Mode is: (PCIN>>17)+(A''*B'')'.
2default:defaulth p
x
? 
?
%s
*synth2?
?DSP Report: register spec_anal/controller/convert/re_square/DSP_MS/b_reg_reg[0] is absorbed into DSP spec_anal/controller/convert/re_square/DSP_MS/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2?
?DSP Report: register spec_anal/controller/convert/re_square/DSP_MS/b_reg_reg[1] is absorbed into DSP spec_anal/controller/convert/re_square/DSP_MS/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2?
?DSP Report: register spec_anal/controller/convert/re_square/DSP_LS/a_reg_reg[0] is absorbed into DSP spec_anal/controller/convert/re_square/DSP_MS/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2?
?DSP Report: register spec_anal/controller/convert/re_square/DSP_MS/a_reg_reg[1] is absorbed into DSP spec_anal/controller/convert/re_square/DSP_MS/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2?
?DSP Report: register spec_anal/controller/convert/re_square/DSP_MS/p_reg_reg is absorbed into DSP spec_anal/controller/convert/re_square/DSP_MS/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2?
?DSP Report: register spec_anal/controller/convert/re_square/DSP_MS/m_reg_reg is absorbed into DSP spec_anal/controller/convert/re_square/DSP_MS/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2?
?DSP Report: operator spec_anal/controller/convert/re_square/DSP_MS/p_reg0 is absorbed into DSP spec_anal/controller/convert/re_square/DSP_MS/p_reg_reg.
2default:defaulth p
x
? 
?
%s
*synth2?
?DSP Report: operator spec_anal/controller/convert/re_square/DSP_MS/m_reg0 is absorbed into DSP spec_anal/controller/convert/re_square/DSP_MS/p_reg_reg.
2default:defaulth p
x
? 
?
+design %s has port %s driven by constant %s3447*oasys2
hdmi_top2default:default2
codec_m02default:default2
02default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2
hdmi_top2default:default2
codec_m12default:default2
02default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2
hdmi_top2default:default2
	codec_i2s2default:default2
02default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2
hdmi_top2default:default2
codec_mdiv12default:default2
02default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2
hdmi_top2default:default2
codec_mdiv22default:default2
02default:defaultZ8-3917h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2

cb_dout[9]2default:default2
FFT_Core2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2

cb_dout[8]2default:default2
FFT_Core2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2

cb_dout[7]2default:default2
FFT_Core2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2

cb_dout[6]2default:default2
FFT_Core2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2

cb_dout[5]2default:default2
FFT_Core2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2

cb_dout[4]2default:default2
FFT_Core2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2

cb_dout[3]2default:default2
FFT_Core2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2

cb_dout[2]2default:default2
FFT_Core2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2

cb_dout[1]2default:default2
FFT_Core2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2

cb_dout[0]2default:default2
FFT_Core2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
bt[2]2default:default2
hdmi_top2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
bt[1]2default:default2
hdmi_top2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
bt[0]2default:default2
hdmi_top2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[5]2default:default2
hdmi_top2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[4]2default:default2
hdmi_top2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[3]2default:default2
hdmi_top2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[2]2default:default2
hdmi_top2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[1]2default:default2
hdmi_top2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
hdmi_tx_cec2default:default2
hdmi_top2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2 
hdmi_tx_hpdn2default:default2
hdmi_top2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
hdmi_tx_scl2default:default2
hdmi_top2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
hdmi_tx_sda2default:default2
hdmi_top2default:defaultZ8-7129h px? 
p
+Unused sequential element %s was removed. 
4326*oasys2!
ram_array_reg2default:defaultZ8-6014h px? 
?
?The signal %s was recognized as a true dual port RAM template.
3473*oasys2=
)"smpl_ram__parameterized0:/ram_array_reg"2default:defaultZ8-3971h px? 
?
?The signal %s was recognized as a true dual port RAM template.
3473*oasys2=
)"smpl_ram__parameterized1:/ram_array_reg"2default:defaultZ8-3971h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:27 ; elapsed = 00:00:28 . Memory (MB): peak = 1262.422 ; gain = 16.926
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth px? 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px? 
d
%s*synth2L
8
Block RAM: Preliminary Mapping Report (see note below)
2default:defaulth px? 
?
%s*synth2?
?+--------------------------+---------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+
2default:defaulth px? 
?
%s*synth2?
?|Module Name               | RTL Object    | PORT A (Depth x Width) | W | R | PORT B (Depth x Width) | W | R | Ports driving FF | RAMB18 | RAMB36 | 
2default:defaulth px? 
?
%s*synth2?
?+--------------------------+---------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+
2default:defaulth px? 
?
%s*synth2?
?|\spec_anal/fir /fir_ram   | ram_array_reg | 512 x 24(READ_FIRST)   | W | R | 512 x 24(WRITE_FIRST)  |   | R | Port A and B     | 0      | 1      | 
2default:defaulth px? 
?
%s*synth2?
?|smpl_ram__parameterized0: | ram_array_reg | 1 K x 24(READ_FIRST)   | W | R | 1 K x 24(READ_FIRST)   | W | R | Port A and B     | 0      | 1      | 
2default:defaulth px? 
?
%s*synth2?
?|smpl_ram__parameterized1: | ram_array_reg | 1 K x 24(READ_FIRST)   | W | R | 1 K x 24(READ_FIRST)   | W | R | Port A and B     | 0      | 1      | 
2default:defaulth px? 
?
%s*synth2?
?|smpl_ram__parameterized1: | ram_array_reg | 1 K x 24(READ_FIRST)   | W | R | 1 K x 24(READ_FIRST)   | W | R | Port A and B     | 0      | 1      | 
2default:defaulth px? 
?
%s*synth2?
?|smpl_ram__parameterized1: | ram_array_reg | 1 K x 24(READ_FIRST)   | W | R | 1 K x 24(READ_FIRST)   | W | R | Port A and B     | 0      | 1      | 
2default:defaulth px? 
?
%s*synth2?
?|smpl_ram__parameterized1: | ram_array_reg | 1 K x 24(READ_FIRST)   | W | R | 1 K x 24(READ_FIRST)   | W | R | Port A and B     | 0      | 1      | 
2default:defaulth px? 
?
%s*synth2?
?|smpl_ram__parameterized1: | ram_array_reg | 1 K x 24(READ_FIRST)   | W | R | 1 K x 24(READ_FIRST)   | W | R | Port A and B     | 0      | 1      | 
2default:defaulth px? 
?
%s*synth2?
?|smpl_ram__parameterized1: | ram_array_reg | 1 K x 24(READ_FIRST)   | W | R | 1 K x 24(READ_FIRST)   | W | R | Port A and B     | 0      | 1      | 
2default:defaulth px? 
?
%s*synth2?
?|smpl_ram__parameterized0: | ram_array_reg | 1 K x 24(READ_FIRST)   | W | R | 1 K x 24(READ_FIRST)   | W | R | Port A and B     | 0      | 1      | 
2default:defaulth px? 
?
%s*synth2?
?|smpl_ram__parameterized0: | ram_array_reg | 1 K x 24(READ_FIRST)   | W | R | 1 K x 24(READ_FIRST)   | W | R | Port A and B     | 0      | 1      | 
2default:defaulth px? 
?
%s*synth2?
?+--------------------------+---------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+

2default:defaulth px? 
?
%s*synth2?
?Note: The table above is a preliminary report that shows the Block RAMs at the current stage of the synthesis flow. Some Block RAMs may be reimplemented as non Block RAM primitives later in the synthesis flow. Multiple instantiated Block RAMs are reported only once. 
2default:defaulth px? 
?
%s*synth2p
\
DSP: Preliminary Mapping Report (see note below. The ' indicates corresponding REG is set)
2default:defaulth px? 
?
%s*synth2?
?+------------+-----------------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
2default:defaulth px? 
?
%s*synth2?
?|Module Name | DSP Mapping           | A Size | B Size | C Size | D Size | P Size | AREG | BREG | CREG | DREG | ADREG | MREG | PREG | 
2default:defaulth px? 
?
%s*synth2?
?+------------+-----------------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
2default:defaulth px? 
?
%s*synth2?
?|mul_24x35   | (A2*B2)'              | 25     | 18     | -      | -      | 48     | 1    | 1    | -    | -    | -     | 1    | 1    | 
2default:defaulth px? 
?
%s*synth2?
?|dsp_25x18   | (PCIN>>17)+(A''*B'')' | 25     | 18     | -      | -      | 42     | 2    | 2    | -    | -    | -     | 1    | 1    | 
2default:defaulth px? 
?
%s*synth2?
?|FFT_Core    | (C'+(A''*B'')')'      | 25     | 18     | 40     | -      | 48     | 2    | 2    | 1    | -    | -     | 1    | 1    | 
2default:defaulth px? 
?
%s*synth2?
?|dsp_25x18   | (PCIN+(A''*B'')')'    | 25     | 18     | -      | -      | 48     | 2    | 2    | -    | -    | -     | 1    | 1    | 
2default:defaulth px? 
?
%s*synth2?
?|FFT_Core    | (C'+(A''*B'')')'      | 25     | 18     | 40     | -      | 48     | 2    | 2    | 1    | -    | -     | 1    | 1    | 
2default:defaulth px? 
?
%s*synth2?
?|dsp_25x18   | (PCIN+(A''*B'')')'    | 25     | 18     | -      | -      | 48     | 2    | 2    | -    | -    | -     | 1    | 1    | 
2default:defaulth px? 
?
%s*synth2?
?|FFT_Core    | (C'+(A''*B'')')'      | 25     | 18     | 40     | -      | 48     | 2    | 2    | 1    | -    | -     | 1    | 1    | 
2default:defaulth px? 
?
%s*synth2?
?|dsp_25x18   | (PCIN+((-A'')*B'')')' | 25     | 18     | -      | -      | 48     | 2    | 2    | -    | -    | -     | 1    | 1    | 
2default:defaulth px? 
?
%s*synth2?
?|FFT_Core    | (C'+(A''*B'')')'      | 25     | 18     | 40     | -      | 48     | 2    | 2    | 1    | -    | -     | 1    | 1    | 
2default:defaulth px? 
?
%s*synth2?
?|dsp_25x18   | (PCIN+((-A'')*B'')')' | 25     | 18     | -      | -      | 48     | 2    | 2    | -    | -    | -     | 1    | 1    | 
2default:defaulth px? 
?
%s*synth2?
?|hdmi_top    | (A2*B2)'              | 25     | 18     | -      | -      | 48     | 1    | 1    | -    | -    | -     | 1    | 1    | 
2default:defaulth px? 
?
%s*synth2?
?|dsp_25x18   | (PCIN>>17)+(A''*B'')' | 25     | 18     | -      | -      | 31     | 2    | 2    | -    | -    | -     | 1    | 1    | 
2default:defaulth px? 
?
%s*synth2?
?|hdmi_top    | (A2*B2)'              | 25     | 18     | -      | -      | 48     | 1    | 1    | -    | -    | -     | 1    | 1    | 
2default:defaulth px? 
?
%s*synth2?
?|dsp_25x18   | (PCIN>>17)+(A''*B'')' | 25     | 18     | -      | -      | 31     | 2    | 2    | -    | -    | -     | 1    | 1    | 
2default:defaulth px? 
?
%s*synth2?
?+------------+-----------------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+

2default:defaulth px? 
?
%s*synth2?
?Note: The table above is a preliminary report that shows the DSPs inferred at the current stage of the synthesis flow. Some DSP may be reimplemented as non DSP primitives later in the synthesis flow. Multiple instantiated DSPs are reported only once.
2default:defaulth px? 
?
%s*synth2?
?---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth px? 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:39 ; elapsed = 00:00:40 . Memory (MB): peak = 1262.422 ; gain = 16.926
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
|Finished Timing Optimization : Time (s): cpu = 00:00:40 ; elapsed = 00:00:41 . Memory (MB): peak = 1268.109 ; gain = 22.613
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2?
?---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!
Block RAM: Final Mapping Report
2default:defaulth p
x
? 
?
%s
*synth2?
?+--------------------------+---------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+
2default:defaulth p
x
? 
?
%s
*synth2?
?|Module Name               | RTL Object    | PORT A (Depth x Width) | W | R | PORT B (Depth x Width) | W | R | Ports driving FF | RAMB18 | RAMB36 | 
2default:defaulth p
x
? 
?
%s
*synth2?
?+--------------------------+---------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+
2default:defaulth p
x
? 
?
%s
*synth2?
?|\spec_anal/fir /fir_ram   | ram_array_reg | 512 x 24(READ_FIRST)   | W | R | 512 x 24(WRITE_FIRST)  |   | R | Port A and B     | 0      | 1      | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|smpl_ram__parameterized0: | ram_array_reg | 1 K x 24(READ_FIRST)   | W | R | 1 K x 24(READ_FIRST)   | W | R | Port A and B     | 0      | 1      | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|smpl_ram__parameterized1: | ram_array_reg | 1 K x 24(READ_FIRST)   | W | R | 1 K x 24(READ_FIRST)   | W | R | Port A and B     | 0      | 1      | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|smpl_ram__parameterized1: | ram_array_reg | 1 K x 24(READ_FIRST)   | W | R | 1 K x 24(READ_FIRST)   | W | R | Port A and B     | 0      | 1      | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|smpl_ram__parameterized1: | ram_array_reg | 1 K x 24(READ_FIRST)   | W | R | 1 K x 24(READ_FIRST)   | W | R | Port A and B     | 0      | 1      | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|smpl_ram__parameterized1: | ram_array_reg | 1 K x 24(READ_FIRST)   | W | R | 1 K x 24(READ_FIRST)   | W | R | Port A and B     | 0      | 1      | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|smpl_ram__parameterized1: | ram_array_reg | 1 K x 24(READ_FIRST)   | W | R | 1 K x 24(READ_FIRST)   | W | R | Port A and B     | 0      | 1      | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|smpl_ram__parameterized1: | ram_array_reg | 1 K x 24(READ_FIRST)   | W | R | 1 K x 24(READ_FIRST)   | W | R | Port A and B     | 0      | 1      | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|smpl_ram__parameterized0: | ram_array_reg | 1 K x 24(READ_FIRST)   | W | R | 1 K x 24(READ_FIRST)   | W | R | Port A and B     | 0      | 1      | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|smpl_ram__parameterized0: | ram_array_reg | 1 K x 24(READ_FIRST)   | W | R | 1 K x 24(READ_FIRST)   | W | R | Port A and B     | 0      | 1      | 
2default:defaulth p
x
? 
?
%s
*synth2?
?+--------------------------+---------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+

2default:defaulth p
x
? 
?
%s
*synth2?
?---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
?The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys27
#spec_anal/fir/fir_ram/ram_array_reg2default:default2
Block2default:defaultZ8-7052h px? 
?
?The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys27
#spec_anal/fir/fir_ram/ram_array_reg2default:default2
Block2default:defaultZ8-7052h px? 
?
?The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys28
$spec_anal/fir/coeff_rom/dout_reg_reg2default:default2
Block2default:defaultZ8-7052h px? 
?
?The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys28
$spec_anal/fir/coeff_rom/dout_reg_reg2default:default2
Block2default:defaultZ8-7052h px? 
?
?The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2@
,spec_anal/controller/circ_buff/ram_array_reg2default:default2
Block2default:defaultZ8-7052h px? 
?
?The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2@
,spec_anal/controller/circ_buff/ram_array_reg2default:default2
Block2default:defaultZ8-7052h px? 
?
?The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2Q
=spec_anal/controller/core/inst[5].smpl_ram_inst/ram_array_reg2default:default2
Block2default:defaultZ8-7052h px? 
?
?The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2Q
=spec_anal/controller/core/inst[5].smpl_ram_inst/ram_array_reg2default:default2
Block2default:defaultZ8-7052h px? 
?
?The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2Q
=spec_anal/controller/core/inst[4].smpl_ram_inst/ram_array_reg2default:default2
Block2default:defaultZ8-7052h px? 
?
?The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2Q
=spec_anal/controller/core/inst[4].smpl_ram_inst/ram_array_reg2default:default2
Block2default:defaultZ8-7052h px? 
?
?The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2Q
=spec_anal/controller/core/inst[3].smpl_ram_inst/ram_array_reg2default:default2
Block2default:defaultZ8-7052h px? 
?
?The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2Q
=spec_anal/controller/core/inst[3].smpl_ram_inst/ram_array_reg2default:default2
Block2default:defaultZ8-7052h px? 
?
?The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2Q
=spec_anal/controller/core/inst[2].smpl_ram_inst/ram_array_reg2default:default2
Block2default:defaultZ8-7052h px? 
?
?The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2Q
=spec_anal/controller/core/inst[2].smpl_ram_inst/ram_array_reg2default:default2
Block2default:defaultZ8-7052h px? 
?
?The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2Q
=spec_anal/controller/core/inst[1].smpl_ram_inst/ram_array_reg2default:default2
Block2default:defaultZ8-7052h px? 
?
?The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2Q
=spec_anal/controller/core/inst[1].smpl_ram_inst/ram_array_reg2default:default2
Block2default:defaultZ8-7052h px? 
?
?The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2Q
=spec_anal/controller/core/inst[0].smpl_ram_inst/ram_array_reg2default:default2
Block2default:defaultZ8-7052h px? 
?
?The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2Q
=spec_anal/controller/core/inst[0].smpl_ram_inst/ram_array_reg2default:default2
Block2default:defaultZ8-7052h px? 
?
?The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2E
1spec_anal/controller/core/coeff_rom_real/dout_reg2default:default2
Block2default:defaultZ8-7052h px? 
?
?The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2E
1spec_anal/controller/core/coeff_rom_imag/dout_reg2default:default2
Block2default:defaultZ8-7052h px? 
?
?The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2A
-spec_anal/controller/dB_results/ram_array_reg2default:default2
Block2default:defaultZ8-7052h px? 
?
?The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2A
-spec_anal/controller/dB_results/ram_array_reg2default:default2
Block2default:defaultZ8-7052h px? 
?
?The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2-
display_ram/ram_array_reg2default:default2
Block2default:defaultZ8-7052h px? 
?
?The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2-
display_ram/ram_array_reg2default:default2
Block2default:defaultZ8-7052h px? 
?
?The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2C
/spec_anal/controller/convert/dB_values/dout_reg2default:default2
Block2default:defaultZ8-7052h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
{Finished Technology Mapping : Time (s): cpu = 00:00:41 ; elapsed = 00:00:42 . Memory (MB): peak = 1278.234 ; gain = 32.738
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys22
spec_anal/controller/circ_buff2default:default2
	din_b[23]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys22
spec_anal/controller/circ_buff2default:default2
	din_b[22]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys22
spec_anal/controller/circ_buff2default:default2
	din_b[21]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys22
spec_anal/controller/circ_buff2default:default2
	din_b[20]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys22
spec_anal/controller/circ_buff2default:default2
	din_b[19]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys22
spec_anal/controller/circ_buff2default:default2
	din_b[18]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys22
spec_anal/controller/circ_buff2default:default2
	din_b[17]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys22
spec_anal/controller/circ_buff2default:default2
	din_b[16]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys22
spec_anal/controller/circ_buff2default:default2
	din_b[15]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys22
spec_anal/controller/circ_buff2default:default2
	din_b[14]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys22
spec_anal/controller/circ_buff2default:default2
	din_b[13]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys22
spec_anal/controller/circ_buff2default:default2
	din_b[12]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys22
spec_anal/controller/circ_buff2default:default2
	din_b[11]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys22
spec_anal/controller/circ_buff2default:default2
	din_b[10]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys22
spec_anal/controller/circ_buff2default:default2
din_b[9]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys22
spec_anal/controller/circ_buff2default:default2
din_b[8]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys22
spec_anal/controller/circ_buff2default:default2
din_b[7]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys22
spec_anal/controller/circ_buff2default:default2
din_b[6]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys22
spec_anal/controller/circ_buff2default:default2
din_b[5]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys22
spec_anal/controller/circ_buff2default:default2
din_b[4]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys22
spec_anal/controller/circ_buff2default:default2
din_b[3]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys22
spec_anal/controller/circ_buff2default:default2
din_b[2]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys22
spec_anal/controller/circ_buff2default:default2
din_b[1]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys22
spec_anal/controller/circ_buff2default:default2
din_b[0]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys23
spec_anal/controller/dB_results2default:default2
	din_b[23]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys23
spec_anal/controller/dB_results2default:default2
	din_b[22]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys23
spec_anal/controller/dB_results2default:default2
	din_b[21]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys23
spec_anal/controller/dB_results2default:default2
	din_b[20]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys23
spec_anal/controller/dB_results2default:default2
	din_b[19]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys23
spec_anal/controller/dB_results2default:default2
	din_b[18]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys23
spec_anal/controller/dB_results2default:default2
	din_b[17]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys23
spec_anal/controller/dB_results2default:default2
	din_b[16]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys23
spec_anal/controller/dB_results2default:default2
	din_b[15]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys23
spec_anal/controller/dB_results2default:default2
	din_b[14]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys23
spec_anal/controller/dB_results2default:default2
	din_b[13]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys23
spec_anal/controller/dB_results2default:default2
	din_b[12]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys23
spec_anal/controller/dB_results2default:default2
	din_b[11]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys23
spec_anal/controller/dB_results2default:default2
	din_b[10]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys23
spec_anal/controller/dB_results2default:default2
din_b[9]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys23
spec_anal/controller/dB_results2default:default2
din_b[8]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys23
spec_anal/controller/dB_results2default:default2
din_b[7]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys23
spec_anal/controller/dB_results2default:default2
din_b[6]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys23
spec_anal/controller/dB_results2default:default2
din_b[5]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys23
spec_anal/controller/dB_results2default:default2
din_b[4]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys23
spec_anal/controller/dB_results2default:default2
din_b[3]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys23
spec_anal/controller/dB_results2default:default2
din_b[2]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys23
spec_anal/controller/dB_results2default:default2
din_b[1]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys23
spec_anal/controller/dB_results2default:default2
din_b[0]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys2
display_ram2default:default2
	din_b[23]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys2
display_ram2default:default2
	din_b[22]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys2
display_ram2default:default2
	din_b[21]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys2
display_ram2default:default2
	din_b[20]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys2
display_ram2default:default2
	din_b[19]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys2
display_ram2default:default2
	din_b[18]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys2
display_ram2default:default2
	din_b[17]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys2
display_ram2default:default2
	din_b[16]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys2
display_ram2default:default2
	din_b[15]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys2
display_ram2default:default2
	din_b[14]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys2
display_ram2default:default2
	din_b[13]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys2
display_ram2default:default2
	din_b[12]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys2
display_ram2default:default2
	din_b[11]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys2
display_ram2default:default2
	din_b[10]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys2
display_ram2default:default2
din_b[9]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys2
display_ram2default:default2
din_b[8]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys2
display_ram2default:default2
din_b[7]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys2
display_ram2default:default2
din_b[6]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys2
display_ram2default:default2
din_b[5]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys2
display_ram2default:default2
din_b[4]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys2
display_ram2default:default2
din_b[3]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys2
display_ram2default:default2
din_b[2]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys2
display_ram2default:default2
din_b[1]2default:defaultZ8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys2
display_ram2default:default2
din_b[0]2default:defaultZ8-3295h px? 
?
?Inout pin '%s' is read and/or written without using tristate logic. Proper direction of connection may be wrongly inferred. Please use specific direction to avoid any incorrect logic issue4342*oasys2
bt[3]2default:default2l
VC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/new/hdmi_top.v2default:default2
232default:default8@Z8-6030h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
uFinished IO Insertion : Time (s): cpu = 00:00:47 ; elapsed = 00:00:48 . Memory (MB): peak = 1282.984 ; gain = 37.488
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Instances : Time (s): cpu = 00:00:47 ; elapsed = 00:00:48 . Memory (MB): peak = 1282.984 ; gain = 37.488
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:47 ; elapsed = 00:00:48 . Memory (MB): peak = 1282.984 ; gain = 37.488
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Ports : Time (s): cpu = 00:00:47 ; elapsed = 00:00:48 . Memory (MB): peak = 1282.984 ; gain = 37.488
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:47 ; elapsed = 00:00:48 . Memory (MB): peak = 1282.984 ; gain = 37.488
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Nets : Time (s): cpu = 00:00:47 ; elapsed = 00:00:48 . Memory (MB): peak = 1282.984 ; gain = 37.488
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
? 
O
%s
*synth27
#+------+--------------+----------+
2default:defaulth p
x
? 
O
%s
*synth27
#|      |BlackBox name |Instances |
2default:defaulth p
x
? 
O
%s
*synth27
#+------+--------------+----------+
2default:defaulth p
x
? 
O
%s
*synth27
#|1     |hdmi_tx       |         1|
2default:defaulth p
x
? 
O
%s
*synth27
#+------+--------------+----------+
2default:defaulth p
x
? 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px? 
H
%s*synth20
+------+-----------+------+
2default:defaulth px? 
H
%s*synth20
|      |Cell       |Count |
2default:defaulth px? 
H
%s*synth20
+------+-----------+------+
2default:defaulth px? 
H
%s*synth20
|1     |hdmi_tx    |     1|
2default:defaulth px? 
H
%s*synth20
|2     |BUFG       |     3|
2default:defaulth px? 
H
%s*synth20
|3     |CARRY4     |    77|
2default:defaulth px? 
H
%s*synth20
|4     |DSP48E1    |    14|
2default:defaulth px? 
H
%s*synth20
|7     |LUT1       |    13|
2default:defaulth px? 
H
%s*synth20
|8     |LUT2       |   250|
2default:defaulth px? 
H
%s*synth20
|9     |LUT3       |   122|
2default:defaulth px? 
H
%s*synth20
|10    |LUT4       |   286|
2default:defaulth px? 
H
%s*synth20
|11    |LUT5       |   105|
2default:defaulth px? 
H
%s*synth20
|12    |LUT6       |   226|
2default:defaulth px? 
H
%s*synth20
|13    |PLLE2_BASE |     1|
2default:defaulth px? 
H
%s*synth20
|14    |RAMB18E1   |     3|
2default:defaulth px? 
H
%s*synth20
|17    |RAMB36E1   |    11|
2default:defaulth px? 
H
%s*synth20
|20    |FDRE       |   545|
2default:defaulth px? 
H
%s*synth20
|21    |FDSE       |    31|
2default:defaulth px? 
H
%s*synth20
|22    |LD         |    30|
2default:defaulth px? 
H
%s*synth20
|23    |LDC        |    10|
2default:defaulth px? 
H
%s*synth20
|24    |IBUF       |     7|
2default:defaulth px? 
H
%s*synth20
|25    |OBUF       |    28|
2default:defaulth px? 
H
%s*synth20
+------+-----------+------+
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Writing Synthesis Report : Time (s): cpu = 00:00:47 ; elapsed = 00:00:48 . Memory (MB): peak = 1282.984 ; gain = 37.488
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
t
%s
*synth2\
HSynthesis finished with 0 errors, 1 critical warnings and 124 warnings.
2default:defaulth p
x
? 
?
%s
*synth2?
~Synthesis Optimization Runtime : Time (s): cpu = 00:00:34 ; elapsed = 00:00:45 . Memory (MB): peak = 1282.984 ; gain = 20.562
2default:defaulth p
x
? 
?
%s
*synth2?
Synthesis Optimization Complete : Time (s): cpu = 00:00:47 ; elapsed = 00:00:48 . Memory (MB): peak = 1282.984 ; gain = 37.488
2default:defaulth p
x
? 
B
 Translating synthesized netlist
350*projectZ1-571h px? 
?
Parsing EDIF File [%s]
106*designutils2k
WC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/new/hdmi_tx.edn2default:defaultZ20-106h px? 
?
 Finished Parsing EDIF File [%s]
97*designutils2k
WC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.srcs/sources_1/imports/new/hdmi_tx.edn2default:defaultZ20-97h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0682default:default2
1300.5002default:default2
0.0002default:defaultZ17-268h px? 
g
-Analyzing %s Unisim elements for replacement
17*netlist2
1512default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
x
Netlist was created with %s %s291*project2
Vivado2default:default2
2018.22default:defaultZ1-479h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1313.1452default:default2
0.0002default:defaultZ17-268h px? 
?
!Unisim Transformation Summary:
%s111*project2?
?  A total of 41 instances were transformed.
  LD => LDCE: 30 instances
  LDC => LDCE: 10 instances
  PLLE2_BASE => PLLE2_ADV: 1 instance 
2default:defaultZ1-111h px? 
g
$Synth Design complete, checksum: %s
562*	vivadotcl2
65fe93f02default:defaultZ4-1430h px? 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1082default:default2
3002default:default2
12default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:532default:default2
00:00:542default:default2
1313.1452default:default2
67.6482default:defaultZ17-268h px? 
u
%s6*runtcl2Y
ESynthesis results are not added to the cache due to CRITICAL_WARNING
2default:defaulth px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2^
JC:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.runs/synth_1/hdmi_top.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2z
fExecuting : report_utilization -file hdmi_top_utilization_synth.rpt -pb hdmi_top_utilization_synth.pb
2default:defaulth px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Thu Jun  2 12:33:49 20222default:defaultZ17-206h px? 


End Record