
h
Command: %s
53*	vivadotcl27
#write_bitstream -force hdmi_top.bit2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7k70t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7k70t2default:defaultZ17-349h px? 
x
,Running DRC as a precondition to command %s
1349*	planAhead2#
write_bitstream2default:defaultZ12-1349h px? 
>
IP Catalog is up to date.1232*coregenZ19-1839h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
?
?OSERDES_DataRateTqTriWidth: Unexpected programming for %s with TRISTATE_WIDTH. DATA_RATE_TQ set DDR expects TRISTATE_WIDTH to be set 4%s*DRC2?
 "|
2hdmi_tx_0/tmds_transmitter/oserdes0/master_oserdes	2hdmi_tx_0/tmds_transmitter/oserdes0/master_oserdes2default:default2default:default2N
 6DRC|Netlist|Instance|Invalid attribute value|OSERDESE22default:default8ZAVAL-70h px? 
?
?OSERDES_DataRateTqTriWidth: Unexpected programming for %s with TRISTATE_WIDTH. DATA_RATE_TQ set DDR expects TRISTATE_WIDTH to be set 4%s*DRC2?
 "z
1hdmi_tx_0/tmds_transmitter/oserdes0/slave_oserdes	1hdmi_tx_0/tmds_transmitter/oserdes0/slave_oserdes2default:default2default:default2N
 6DRC|Netlist|Instance|Invalid attribute value|OSERDESE22default:default8ZAVAL-70h px? 
?
?OSERDES_DataRateTqTriWidth: Unexpected programming for %s with TRISTATE_WIDTH. DATA_RATE_TQ set DDR expects TRISTATE_WIDTH to be set 4%s*DRC2?
 "|
2hdmi_tx_0/tmds_transmitter/oserdes1/master_oserdes	2hdmi_tx_0/tmds_transmitter/oserdes1/master_oserdes2default:default2default:default2N
 6DRC|Netlist|Instance|Invalid attribute value|OSERDESE22default:default8ZAVAL-70h px? 
?
?OSERDES_DataRateTqTriWidth: Unexpected programming for %s with TRISTATE_WIDTH. DATA_RATE_TQ set DDR expects TRISTATE_WIDTH to be set 4%s*DRC2?
 "z
1hdmi_tx_0/tmds_transmitter/oserdes1/slave_oserdes	1hdmi_tx_0/tmds_transmitter/oserdes1/slave_oserdes2default:default2default:default2N
 6DRC|Netlist|Instance|Invalid attribute value|OSERDESE22default:default8ZAVAL-70h px? 
?
?OSERDES_DataRateTqTriWidth: Unexpected programming for %s with TRISTATE_WIDTH. DATA_RATE_TQ set DDR expects TRISTATE_WIDTH to be set 4%s*DRC2?
 "|
2hdmi_tx_0/tmds_transmitter/oserdes2/master_oserdes	2hdmi_tx_0/tmds_transmitter/oserdes2/master_oserdes2default:default2default:default2N
 6DRC|Netlist|Instance|Invalid attribute value|OSERDESE22default:default8ZAVAL-70h px? 
?
?OSERDES_DataRateTqTriWidth: Unexpected programming for %s with TRISTATE_WIDTH. DATA_RATE_TQ set DDR expects TRISTATE_WIDTH to be set 4%s*DRC2?
 "z
1hdmi_tx_0/tmds_transmitter/oserdes2/slave_oserdes	1hdmi_tx_0/tmds_transmitter/oserdes2/slave_oserdes2default:default2default:default2N
 6DRC|Netlist|Instance|Invalid attribute value|OSERDESE22default:default8ZAVAL-70h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2?
 "?
>spec_anal/controller/core/ram_2_real_addr_a_reg_reg[9]_i_2_n_0>spec_anal/controller/core/ram_2_real_addr_a_reg_reg[9]_i_2_n_02default:default2default:default2?
 "?
<spec_anal/controller/core/ram_2_real_addr_a_reg_reg[9]_i_2/O<spec_anal/controller/core/ram_2_real_addr_a_reg_reg[9]_i_2/O2default:default2default:default2?
 "?
:spec_anal/controller/core/ram_2_real_addr_a_reg_reg[9]_i_2	:spec_anal/controller/core/ram_2_real_addr_a_reg_reg[9]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
_No routable loads: 3 net(s) have no routable loads. The problem bus(es) and/or net(s) are %s.%s*DRC2?
 "U
!spec_anal/fir/dout_valid_reg[1:0]spec_anal/fir/dout_valid_reg2default:default"N
spec_anal/fir/state_1_dl[7]spec_anal/fir/state_1_dl[7]2default:default2default:default2=
 %DRC|Implementation|Routing|Chip Level2default:default8Z	RTSTAT-10h px? 
f
DRC finished with %s
1905*	planAhead2(
0 Errors, 8 Warnings2default:defaultZ12-3199h px? 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px? 
i
)Running write_bitstream with %s threads.
1750*designutils2
22default:defaultZ20-2272h px? 
?
Loading data files...
1271*designutilsZ12-1165h px? 
>
Loading site data...
1273*designutilsZ12-1167h px? 
?
Loading route data...
1272*designutilsZ12-1166h px? 
?
Processing options...
1362*designutilsZ12-1514h px? 
?
?The BITSTREAM.CONFIG.EXTMASTERCCLK_EN property value "%s" will cause the BITSTREAM.CONFIG.CONFIGRATE property value "%s" to be ignored.
1669*designutils2
DIV-12default:default2
502default:defaultZ20-2079h px? 
<
Creating bitmap...
1249*designutilsZ12-1141h px? 
7
Creating bitstream...
7*	bitstreamZ40-7h px? 
_
Writing bitstream %s...
11*	bitstream2"
./hdmi_top.bit2default:defaultZ40-11h px? 
F
Bitgen Completed Successfully.
1606*	planAheadZ12-1842h px? 
?
?WebTalk data collection is mandatory when using a ULT device. To see the specific WebTalk data collected for your design, open the usage_statistics_webtalk.html or usage_statistics_webtalk.xml file in the implementation directory.698*projectZ1-1876h px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
122default:default2
92default:default2
02default:default2
02default:defaultZ4-41h px? 
a
%s completed successfully
29*	vivadotcl2#
write_bitstream2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
write_bitstream: 2default:default2
00:00:172default:default2
00:00:152default:default2
2395.7382default:default2
442.4182default:defaultZ17-268h px? 


End Record