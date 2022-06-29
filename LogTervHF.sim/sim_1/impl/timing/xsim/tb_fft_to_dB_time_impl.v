// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Wed Jun  1 09:02:21 2022
// Host        : DANINITRO-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/Dani/XilinxProjects/LogTervHF/LogTervHF.sim/sim_1/impl/timing/xsim/tb_fft_to_dB_time_impl.v
// Design      : hdmi_top
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7k70tfbg676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module FFT_Controller
   (\smpl_addr_cntr_reg[0]_0 ,
    DOBDO,
    frm_dout_vld_reg_reg_0,
    clk100M_IBUF_BUFG,
    aud_dout_vld,
    Q,
    CLK,
    ram_array_reg,
    rstbt_IBUF,
    \smpl_addr_cntr_reg[0]_1 ,
    \write_cntr_reg[1] ,
    SR,
    display_ram_we_reg,
    display_ram_we,
    display_ram_we_reg_0);
  output [0:0]\smpl_addr_cntr_reg[0]_0 ;
  output [23:0]DOBDO;
  output frm_dout_vld_reg_reg_0;
  input clk100M_IBUF_BUFG;
  input aud_dout_vld;
  input [23:0]Q;
  input CLK;
  input [9:0]ram_array_reg;
  input rstbt_IBUF;
  input \smpl_addr_cntr_reg[0]_1 ;
  input \write_cntr_reg[1] ;
  input [0:0]SR;
  input display_ram_we_reg;
  input display_ram_we;
  input display_ram_we_reg_0;

  wire CLK;
  wire [23:0]DOBDO;
  wire [23:0]Q;
  wire [0:0]SR;
  wire aud_dout_vld;
  wire [9:0]cb_addr_out;
  wire [23:10]cb_dout;
  wire clk100M_IBUF_BUFG;
  wire convert_n_24;
  wire [22:0]dB;
  wire [9:0]dB_addr;
  wire dB_vld;
  wire display_ram_we;
  wire display_ram_we_reg;
  wire display_ram_we_reg_0;
  wire [23:0]fft_dout_im;
  wire [23:0]fft_dout_re;
  wire fft_rdy;
  wire frm_dout_vld;
  wire frm_dout_vld_reg_reg_0;
  wire pwropt;
  wire pwropt_1;
  wire [9:0]ram_array_reg;
  wire rstbt_IBUF;
  wire \smpl_addr_cntr[1]_i_1_n_0 ;
  wire \smpl_addr_cntr[2]_i_1_n_0 ;
  wire \smpl_addr_cntr[3]_i_1_n_0 ;
  wire \smpl_addr_cntr[4]_i_1_n_0 ;
  wire \smpl_addr_cntr[5]_i_1_n_0 ;
  wire \smpl_addr_cntr[6]_i_1_n_0 ;
  wire \smpl_addr_cntr[6]_i_2_n_0 ;
  wire \smpl_addr_cntr[7]_i_1_n_0 ;
  wire \smpl_addr_cntr[8]_i_1_n_0 ;
  wire \smpl_addr_cntr[9]_i_1_n_0 ;
  wire \smpl_addr_cntr[9]_i_2_n_0 ;
  wire [9:1]smpl_addr_cntr_reg;
  wire [0:0]\smpl_addr_cntr_reg[0]_0 ;
  wire \smpl_addr_cntr_reg[0]_1 ;
  wire \write_cntr_reg[1] ;

  smpl_ram_0 circ_buff
       (.ADDRARDADDR({smpl_addr_cntr_reg,\smpl_addr_cntr_reg[0]_0 }),
        .ADDRBWRADDR(cb_addr_out),
        .DOBDO(cb_dout),
        .Q(Q),
        .aud_dout_vld(aud_dout_vld),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG));
  fft_to_dB convert
       (.DOADO(dB),
        .DOBDO(fft_dout_im),
        .Q(dB_addr),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG),
        .dB_vld(dB_vld),
        .fft_rdy(fft_rdy),
        .frm_dout_vld(frm_dout_vld),
        .frm_dout_vld_reg_reg(convert_n_24),
        .p_reg_reg(fft_dout_re),
        .pwropt(pwropt),
        .pwropt_1(pwropt_1),
        .rstbt_IBUF(rstbt_IBUF));
  FFT_Core core
       (.ADDRBWRADDR(cb_addr_out),
        .DOBDO(cb_dout),
        .Q(dB_addr),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG),
        .fft_rdy(fft_rdy),
        .pwropt(pwropt),
        .pwropt_1(pwropt_1),
        .ram_array_reg(fft_dout_re),
        .ram_array_reg_0(fft_dout_im),
        .rstbt_IBUF(rstbt_IBUF),
        .\write_cntr_reg[1]_0 (\write_cntr_reg[1] ));
  smpl_ram_1 dB_results
       (.CLK(CLK),
        .DOADO(dB),
        .DOBDO(DOBDO),
        .Q(dB_addr),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG),
        .dB_vld(dB_vld),
        .ram_array_reg_0(ram_array_reg));
  (* \PinAttr:I2:HOLD_DETOUR  = "2540" *) 
  LUT5 #(
    .INIT(32'h00005540)) 
    display_ram_we_i_1
       (.I0(SR),
        .I1(display_ram_we_reg),
        .I2(frm_dout_vld),
        .I3(display_ram_we),
        .I4(display_ram_we_reg_0),
        .O(frm_dout_vld_reg_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    frm_dout_vld_reg_reg
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(convert_n_24),
        .Q(frm_dout_vld),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0078)) 
    \smpl_addr_cntr[1]_i_1 
       (.I0(\smpl_addr_cntr_reg[0]_0 ),
        .I1(aud_dout_vld),
        .I2(smpl_addr_cntr_reg[1]),
        .I3(rstbt_IBUF),
        .O(\smpl_addr_cntr[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \smpl_addr_cntr[2]_i_1 
       (.I0(smpl_addr_cntr_reg[2]),
        .I1(smpl_addr_cntr_reg[1]),
        .I2(aud_dout_vld),
        .I3(\smpl_addr_cntr_reg[0]_0 ),
        .O(\smpl_addr_cntr[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \smpl_addr_cntr[3]_i_1 
       (.I0(smpl_addr_cntr_reg[3]),
        .I1(smpl_addr_cntr_reg[2]),
        .I2(\smpl_addr_cntr_reg[0]_0 ),
        .I3(aud_dout_vld),
        .I4(smpl_addr_cntr_reg[1]),
        .O(\smpl_addr_cntr[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \smpl_addr_cntr[4]_i_1 
       (.I0(smpl_addr_cntr_reg[4]),
        .I1(smpl_addr_cntr_reg[3]),
        .I2(smpl_addr_cntr_reg[1]),
        .I3(aud_dout_vld),
        .I4(\smpl_addr_cntr_reg[0]_0 ),
        .I5(smpl_addr_cntr_reg[2]),
        .O(\smpl_addr_cntr[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAA6AAAAA)) 
    \smpl_addr_cntr[5]_i_1 
       (.I0(smpl_addr_cntr_reg[5]),
        .I1(smpl_addr_cntr_reg[4]),
        .I2(smpl_addr_cntr_reg[2]),
        .I3(\smpl_addr_cntr[6]_i_2_n_0 ),
        .I4(smpl_addr_cntr_reg[3]),
        .O(\smpl_addr_cntr[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAA6AAAAAAAAAAAAA)) 
    \smpl_addr_cntr[6]_i_1 
       (.I0(smpl_addr_cntr_reg[6]),
        .I1(smpl_addr_cntr_reg[5]),
        .I2(smpl_addr_cntr_reg[3]),
        .I3(\smpl_addr_cntr[6]_i_2_n_0 ),
        .I4(smpl_addr_cntr_reg[2]),
        .I5(smpl_addr_cntr_reg[4]),
        .O(\smpl_addr_cntr[6]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h7F)) 
    \smpl_addr_cntr[6]_i_2 
       (.I0(\smpl_addr_cntr_reg[0]_0 ),
        .I1(aud_dout_vld),
        .I2(smpl_addr_cntr_reg[1]),
        .O(\smpl_addr_cntr[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT4 #(
    .INIT(16'hA6AA)) 
    \smpl_addr_cntr[7]_i_1 
       (.I0(smpl_addr_cntr_reg[7]),
        .I1(smpl_addr_cntr_reg[6]),
        .I2(\smpl_addr_cntr[9]_i_2_n_0 ),
        .I3(smpl_addr_cntr_reg[5]),
        .O(\smpl_addr_cntr[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT5 #(
    .INIT(32'hA6AAAAAA)) 
    \smpl_addr_cntr[8]_i_1 
       (.I0(smpl_addr_cntr_reg[8]),
        .I1(smpl_addr_cntr_reg[5]),
        .I2(\smpl_addr_cntr[9]_i_2_n_0 ),
        .I3(smpl_addr_cntr_reg[6]),
        .I4(smpl_addr_cntr_reg[7]),
        .O(\smpl_addr_cntr[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA6AAAAAAAAAAA)) 
    \smpl_addr_cntr[9]_i_1 
       (.I0(smpl_addr_cntr_reg[9]),
        .I1(smpl_addr_cntr_reg[8]),
        .I2(smpl_addr_cntr_reg[7]),
        .I3(smpl_addr_cntr_reg[6]),
        .I4(\smpl_addr_cntr[9]_i_2_n_0 ),
        .I5(smpl_addr_cntr_reg[5]),
        .O(\smpl_addr_cntr[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \smpl_addr_cntr[9]_i_2 
       (.I0(smpl_addr_cntr_reg[3]),
        .I1(smpl_addr_cntr_reg[1]),
        .I2(aud_dout_vld),
        .I3(\smpl_addr_cntr_reg[0]_0 ),
        .I4(smpl_addr_cntr_reg[2]),
        .I5(smpl_addr_cntr_reg[4]),
        .O(\smpl_addr_cntr[9]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \smpl_addr_cntr_reg[0] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\smpl_addr_cntr_reg[0]_1 ),
        .Q(\smpl_addr_cntr_reg[0]_0 ),
        .R(rstbt_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \smpl_addr_cntr_reg[1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\smpl_addr_cntr[1]_i_1_n_0 ),
        .Q(smpl_addr_cntr_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \smpl_addr_cntr_reg[2] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\smpl_addr_cntr[2]_i_1_n_0 ),
        .Q(smpl_addr_cntr_reg[2]),
        .R(rstbt_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \smpl_addr_cntr_reg[3] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\smpl_addr_cntr[3]_i_1_n_0 ),
        .Q(smpl_addr_cntr_reg[3]),
        .R(rstbt_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \smpl_addr_cntr_reg[4] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\smpl_addr_cntr[4]_i_1_n_0 ),
        .Q(smpl_addr_cntr_reg[4]),
        .R(rstbt_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \smpl_addr_cntr_reg[5] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\smpl_addr_cntr[5]_i_1_n_0 ),
        .Q(smpl_addr_cntr_reg[5]),
        .R(rstbt_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \smpl_addr_cntr_reg[6] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\smpl_addr_cntr[6]_i_1_n_0 ),
        .Q(smpl_addr_cntr_reg[6]),
        .R(rstbt_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \smpl_addr_cntr_reg[7] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\smpl_addr_cntr[7]_i_1_n_0 ),
        .Q(smpl_addr_cntr_reg[7]),
        .R(rstbt_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \smpl_addr_cntr_reg[8] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\smpl_addr_cntr[8]_i_1_n_0 ),
        .Q(smpl_addr_cntr_reg[8]),
        .R(rstbt_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \smpl_addr_cntr_reg[9] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\smpl_addr_cntr[9]_i_1_n_0 ),
        .Q(smpl_addr_cntr_reg[9]),
        .R(rstbt_IBUF));
endmodule

module FFT_Core
   (ram_array_reg,
    ram_array_reg_0,
    ADDRBWRADDR,
    fft_rdy,
    clk100M_IBUF_BUFG,
    DOBDO,
    Q,
    rstbt_IBUF,
    \write_cntr_reg[1]_0 ,
    pwropt,
    pwropt_1);
  output [23:0]ram_array_reg;
  output [23:0]ram_array_reg_0;
  output [9:0]ADDRBWRADDR;
  output fft_rdy;
  input clk100M_IBUF_BUFG;
  input [13:0]DOBDO;
  input [9:0]Q;
  input rstbt_IBUF;
  input \write_cntr_reg[1]_0 ;
  input pwropt;
  input pwropt_1;

  wire [9:0]ADDRBWRADDR;
  wire [13:0]DOBDO;
  wire DSP1_n_10;
  wire DSP1_n_11;
  wire DSP1_n_22;
  wire DSP1_n_23;
  wire DSP1_n_24;
  wire DSP1_n_25;
  wire DSP1_n_26;
  wire DSP1_n_27;
  wire DSP1_n_28;
  wire DSP1_n_29;
  wire DSP1_n_30;
  wire DSP1_n_31;
  wire DSP1_n_42;
  wire DSP1_n_43;
  wire DSP1_n_44;
  wire DSP1_n_45;
  wire DSP1_n_46;
  wire DSP1_n_47;
  wire DSP1_n_48;
  wire DSP1_n_49;
  wire DSP1_n_50;
  wire DSP1_n_51;
  wire DSP1_n_9;
  wire DSP2_n_0;
  wire DSP2_n_1;
  wire DSP2_n_10;
  wire DSP2_n_11;
  wire DSP2_n_12;
  wire DSP2_n_13;
  wire DSP2_n_14;
  wire DSP2_n_15;
  wire DSP2_n_16;
  wire DSP2_n_17;
  wire DSP2_n_18;
  wire DSP2_n_19;
  wire DSP2_n_2;
  wire DSP2_n_20;
  wire DSP2_n_21;
  wire DSP2_n_22;
  wire DSP2_n_23;
  wire DSP2_n_24;
  wire DSP2_n_25;
  wire DSP2_n_26;
  wire DSP2_n_27;
  wire DSP2_n_3;
  wire DSP2_n_38;
  wire DSP2_n_39;
  wire DSP2_n_4;
  wire DSP2_n_40;
  wire DSP2_n_41;
  wire DSP2_n_42;
  wire DSP2_n_43;
  wire DSP2_n_44;
  wire DSP2_n_45;
  wire DSP2_n_46;
  wire DSP2_n_5;
  wire DSP2_n_6;
  wire DSP2_n_7;
  wire DSP2_n_8;
  wire DSP2_n_9;
  wire DSP3_n_0;
  wire DSP3_n_1;
  wire DSP3_n_10;
  wire DSP3_n_11;
  wire DSP3_n_12;
  wire DSP3_n_13;
  wire DSP3_n_14;
  wire DSP3_n_15;
  wire DSP3_n_16;
  wire DSP3_n_17;
  wire DSP3_n_18;
  wire DSP3_n_19;
  wire DSP3_n_2;
  wire DSP3_n_20;
  wire DSP3_n_21;
  wire DSP3_n_3;
  wire DSP3_n_4;
  wire DSP3_n_5;
  wire DSP3_n_6;
  wire DSP3_n_7;
  wire DSP3_n_8;
  wire DSP3_n_9;
  wire [8:0]P;
  wire [9:0]Q;
  wire a0_carry__0_i_1_n_0;
  wire a0_carry__0_i_2_n_0;
  wire a0_carry__0_i_3_n_0;
  wire a0_carry__0_i_4_n_0;
  wire a0_carry__0_n_0;
  wire a0_carry__0_n_4;
  wire a0_carry__0_n_5;
  wire a0_carry__0_n_6;
  wire a0_carry__0_n_7;
  wire a0_carry__1_n_6;
  wire a0_carry__1_n_7;
  wire a0_carry_i_1_n_0;
  wire a0_carry_i_2_n_0;
  wire a0_carry_i_3_n_0;
  wire a0_carry_i_4_n_0;
  wire a0_carry_n_0;
  wire a0_carry_n_4;
  wire a0_carry_n_5;
  wire a0_carry_n_6;
  wire a0_carry_n_7;
  wire begin_butterfly;
  wire begin_butterfly_i_1_n_0;
  wire btf_n_2;
  wire btf_n_3;
  wire \calc_index_cntr[0]_i_1_n_0 ;
  wire \calc_index_cntr[0]_i_2_n_0 ;
  wire \calc_index_cntr[0]_i_3_n_0 ;
  wire \calc_index_cntr[1]_i_1_n_0 ;
  wire \calc_index_cntr[2]_i_1_n_0 ;
  wire \calc_index_cntr[3]_i_1_n_0 ;
  wire \calc_index_cntr[3]_i_2_n_0 ;
  wire \calc_index_cntr_reg_n_0_[0] ;
  wire \calc_index_cntr_reg_n_0_[1] ;
  wire \calc_index_cntr_reg_n_0_[2] ;
  wire \calc_index_cntr_reg_n_0_[3] ;
  wire [1:1]calc_sidevar_cntr;
  wire \calc_sidevar_cntr[0]_i_1_n_0 ;
  wire \calc_sidevar_cntr[0]_i_2_n_0 ;
  wire \calc_sidevar_cntr[1]_i_1_n_0 ;
  wire \calc_sidevar_cntr[2]_i_1_n_0 ;
  wire \calc_sidevar_cntr[3]_i_1_n_0 ;
  wire \calc_sidevar_cntr[4]_i_2_n_0 ;
  wire \calc_sidevar_cntr[4]_i_3_n_0 ;
  wire \calc_sidevar_cntr_reg_n_0_[0] ;
  wire \calc_sidevar_cntr_reg_n_0_[1] ;
  wire \calc_sidevar_cntr_reg_n_0_[2] ;
  wire \calc_sidevar_cntr_reg_n_0_[3] ;
  wire \calc_sidevar_cntr_reg_n_0_[4] ;
  wire \cb_addr_cntr[0]_i_1_n_0 ;
  wire \cb_addr_cntr[1]_i_1_n_0 ;
  wire \cb_addr_cntr[2]_i_1_n_0 ;
  wire \cb_addr_cntr[3]_i_1_n_0 ;
  wire \cb_addr_cntr[4]_i_1_n_0 ;
  wire \cb_addr_cntr[4]_i_2_n_0 ;
  wire \cb_addr_cntr[5]_i_1_n_0 ;
  wire \cb_addr_cntr[6]_i_1_n_0 ;
  wire \cb_addr_cntr[7]_i_1_n_0 ;
  wire \cb_addr_cntr[8]_i_1_n_0 ;
  wire \cb_addr_cntr[8]_i_2_n_0 ;
  wire \cb_addr_cntr[8]_i_3_n_0 ;
  wire \cb_addr_cntr[9]_i_2_n_0 ;
  wire [9:0]cb_addr_cntr_delay;
  wire clear;
  wire clk100M_IBUF_BUFG;
  wire [95:0]din_a_i;
  wire [143:96]din_b_i;
  wire [23:0]dout_b_i_120;
  wire [23:0]dout_b_i_96;
  wire [16:0]dout_reg__0;
  wire [17:0]dout_reg__0_0;
  wire fft_done_reg_i_1_n_0;
  wire fft_in_progress;
  wire fft_in_progress2;
  wire fft_in_progress21_out;
  wire fft_in_progress2_carry__0_i_1_n_0;
  wire fft_in_progress2_carry__0_i_2_n_0;
  wire fft_in_progress2_carry__0_i_3_n_0;
  wire fft_in_progress2_carry__0_i_4_n_0;
  wire fft_in_progress2_carry__0_n_0;
  wire fft_in_progress2_carry__1_i_1_n_0;
  wire fft_in_progress2_carry__1_i_2_n_0;
  wire fft_in_progress2_carry__1_i_3_n_0;
  wire fft_in_progress2_carry_i_1_n_0;
  wire fft_in_progress2_carry_i_2_n_0;
  wire fft_in_progress2_carry_i_3_n_0;
  wire fft_in_progress2_carry_i_4_n_0;
  wire fft_in_progress2_carry_i_5_n_0;
  wire fft_in_progress2_carry_i_6_n_0;
  wire fft_in_progress2_carry_i_7_n_0;
  wire fft_in_progress2_carry_i_8_n_0;
  wire fft_in_progress2_carry_n_0;
  wire \fft_in_progress2_inferred__0/i__carry__0_n_0 ;
  wire \fft_in_progress2_inferred__0/i__carry_n_0 ;
  wire fft_in_progress_i_1_n_0;
  wire fft_rdy;
  wire \g[3]_i_1_n_0 ;
  wire \g[4]_i_1_n_0 ;
  wire \g[6]_i_1_n_0 ;
  wire \g[7]_i_1_n_0 ;
  wire \g[9]_i_1_n_0 ;
  wire \g[9]_i_3_n_0 ;
  wire \g[9]_i_4_n_0 ;
  wire [8:0]g_reg;
  wire \g_reg_n_0_[9] ;
  wire [8:2]groups;
  wire \h[3]_i_1_n_0 ;
  wire \h[4]_i_1_n_0 ;
  wire \h[7]_i_1_n_0 ;
  wire \h[9]_i_1_n_0 ;
  wire \h[9]_i_2_n_0 ;
  wire \h[9]_i_4_n_0 ;
  wire \h[9]_i_5_n_0 ;
  wire \h[9]_i_6_n_0 ;
  wire \h[9]_i_7_n_0 ;
  wire [9:1]h_reg;
  wire [9:0]half;
  wire \half[0]_i_1_n_0 ;
  wire \half[8]_i_2_n_0 ;
  wire i__carry__0_i_1_n_0;
  wire i__carry__0_i_2_n_0;
  wire i__carry__0_i_3_n_0;
  wire i__carry__0_i_4_n_0;
  wire i__carry__1_i_1_n_0;
  wire i__carry__1_i_2_n_0;
  wire i__carry__1_i_3_n_0;
  wire i__carry_i_1_n_0;
  wire i__carry_i_2_n_0;
  wire i__carry_i_3_n_0;
  wire i__carry_i_4_n_0;
  wire i__carry_i_5_n_0;
  wire i__carry_i_6_n_0;
  wire i__carry_i_7_n_0;
  wire i__carry_i_8_n_0;
  wire index_2_carry__0_n_0;
  wire index_2_carry__0_n_4;
  wire index_2_carry__0_n_5;
  wire index_2_carry__0_n_6;
  wire index_2_carry__0_n_7;
  wire index_2_carry__1_n_6;
  wire index_2_carry__1_n_7;
  wire index_2_carry_n_0;
  wire index_2_carry_n_4;
  wire index_2_carry_n_5;
  wire index_2_carry_n_6;
  wire index_2_carry_n_7;
  wire loading_done;
  wire loading_done_i_1_n_0;
  wire loading_done_i_2_n_0;
  wire loading_done_i_3_n_0;
  wire loading_samples;
  wire loading_samples_i_1_n_0;
  wire \mem_dest[0]_i_1_n_0 ;
  wire \mem_dest[0]_rep_i_1_n_0 ;
  wire \mem_dest[1]_i_1_n_0 ;
  wire \mem_dest[1]_rep_i_1_n_0 ;
  wire \mem_dest_reg[0]_rep_n_0 ;
  wire \mem_dest_reg[1]_rep_n_0 ;
  wire \mem_dest_reg_n_0_[0] ;
  wire \mem_dest_reg_n_0_[1] ;
  wire new_stage;
  wire new_stage_i_1_n_0;
  wire p_0_in13_in;
  wire [3:0]p_0_in__1;
  wire [9:0]p_0_in__2;
  wire [9:0]p_0_in__3;
  wire p_17_in;
  wire [0:0]p_reg0;
  wire pwropt;
  wire pwropt_1;
  wire pwropt_2;
  wire pwropt_3;
  wire pwropt_4;
  wire [9:0]ram_1_imag_addr_b_reg;
  wire [9:0]ram_1_imag_addr_b_reg__0;
  wire ram_1_real_addr_b_reg;
  wire [9:0]ram_2_imag_addr_a_reg;
  wire \ram_2_real_addr_a_reg_reg[9]_i_2_n_0 ;
  wire \ram_2_real_addr_a_reg_reg[9]_i_3_n_0 ;
  wire \ram_2_real_addr_a_reg_reg[9]_i_4_n_0 ;
  wire [9:0]ram_3_imag_addr_a_reg;
  wire [9:0]ram_3_imag_addr_a_reg__0;
  wire \ram_3_real_addr_a_reg_reg[9]_i_2_n_0 ;
  wire [23:0]ram_array_reg;
  wire [23:0]ram_array_reg_0;
  wire read_cntr0;
  wire \read_cntr[0]_i_1_n_0 ;
  wire \read_cntr[1]_i_1_n_0 ;
  wire \read_cntr[1]_i_2_n_0 ;
  wire \read_cntr[1]_i_3_n_0 ;
  wire read_cntr_0_delay;
  wire read_cntr_0_posedge;
  wire read_cntr_0_posedge_delay;
  wire read_cntr_1_delay;
  wire read_cntr_1_posedge;
  wire read_cntr_1_posedge_delay;
  wire read_cntr_2_daly_i_1_n_0;
  wire read_cntr_2_daly_reg_n_0;
  wire \read_cntr_reg_n_0_[0] ;
  wire read_cycle_done_i_1_n_0;
  wire read_cycle_done_reg_n_0;
  wire [9:0]rom_imag_addr_reg;
  wire [9:0]rom_imag_addr_reg__0;
  wire \rom_real_addr_reg_reg[9]_i_2_n_0 ;
  wire rstbt_IBUF;
  wire sidevars_done;
  wire sidevars_done_i_1_n_0;
  wire sidevars_done_i_2_n_0;
  wire \stage_cntr[3]_i_1_n_0 ;
  wire [3:0]stage_cntr_reg;
  wire [17:0]w1_imag_buff;
  wire [17:0]w2_imag_buff;
  wire we_01;
  wire we_10;
  wire we_11;
  wire write_cntr_0_delay;
  wire write_cntr_0_posedge;
  wire write_cntr_0_posedge_delay;
  wire \write_cntr_reg[1]_0 ;
  wire \write_cntr_reg_n_0_[0] ;
  wire \write_cntr_reg_n_0_[1] ;
  wire [23:0]x1_imag_reg;
  wire x1_real_buff;
  wire [23:0]x1_real_reg;
  wire [23:0]x2_real_buff;
  wire x2_real_buff_0;
  wire [2:0]NLW_a0_carry_CO_UNCONNECTED;
  wire [2:0]NLW_a0_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_a0_carry__1_CO_UNCONNECTED;
  wire [3:2]NLW_a0_carry__1_O_UNCONNECTED;
  wire [2:0]NLW_fft_in_progress2_carry_CO_UNCONNECTED;
  wire [3:0]NLW_fft_in_progress2_carry_O_UNCONNECTED;
  wire [2:0]NLW_fft_in_progress2_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_fft_in_progress2_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_fft_in_progress2_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_fft_in_progress2_carry__1_O_UNCONNECTED;
  wire [2:0]\NLW_fft_in_progress2_inferred__0/i__carry_CO_UNCONNECTED ;
  wire [3:0]\NLW_fft_in_progress2_inferred__0/i__carry_O_UNCONNECTED ;
  wire [2:0]\NLW_fft_in_progress2_inferred__0/i__carry__0_CO_UNCONNECTED ;
  wire [3:0]\NLW_fft_in_progress2_inferred__0/i__carry__0_O_UNCONNECTED ;
  wire [3:0]\NLW_fft_in_progress2_inferred__0/i__carry__1_CO_UNCONNECTED ;
  wire [3:0]\NLW_fft_in_progress2_inferred__0/i__carry__1_O_UNCONNECTED ;
  wire [2:0]NLW_index_2_carry_CO_UNCONNECTED;
  wire [2:0]NLW_index_2_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_index_2_carry__1_CO_UNCONNECTED;
  wire [3:2]NLW_index_2_carry__1_O_UNCONNECTED;

  dsp_25x18__parameterized1 DSP1
       (.D(ram_1_imag_addr_b_reg__0),
        .O({index_2_carry_n_4,index_2_carry_n_5,index_2_carry_n_6,index_2_carry_n_7}),
        .Q({h_reg,p_reg0}),
        .S(DSP1_n_9),
        .\a_reg_reg[0][8]_0 (g_reg),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG),
        .groups({groups[8],groups[2]}),
        .half({half[9:8],half[6:2],half[0]}),
        .\half_reg[9] ({DSP1_n_50,DSP1_n_51}),
        .m_reg0__47_carry({DSP2_n_3,DSP2_n_6,DSP2_n_9}),
        .\p_reg_reg[0]_0 (DSP1_n_10),
        .\p_reg_reg[0]_1 (DSP1_n_11),
        .\p_reg_reg[3]_0 ({DSP1_n_42,DSP1_n_43,DSP1_n_44,DSP1_n_45}),
        .\p_reg_reg[7]_0 ({DSP1_n_46,DSP1_n_47,DSP1_n_48,DSP1_n_49}),
        .\p_reg_reg[8]_0 (P),
        .ram_array_reg(\ram_2_real_addr_a_reg_reg[9]_i_4_n_0 ),
        .ram_array_reg_0(\ram_2_real_addr_a_reg_reg[9]_i_3_n_0 ),
        .ram_array_reg_1(\write_cntr_reg_n_0_[1] ),
        .ram_array_reg_2(\write_cntr_reg_n_0_[0] ),
        .ram_array_reg_3({index_2_carry__0_n_4,index_2_carry__0_n_5,index_2_carry__0_n_6,index_2_carry__0_n_7}),
        .ram_array_reg_4({index_2_carry__1_n_6,index_2_carry__1_n_7}),
        .\write_cntr_reg[1] ({DSP1_n_22,DSP1_n_23,DSP1_n_24,DSP1_n_25,DSP1_n_26,DSP1_n_27,DSP1_n_28,DSP1_n_29,DSP1_n_30,DSP1_n_31}),
        .\write_cntr_reg[1]_0 (ram_3_imag_addr_a_reg__0));
  dsp_25x18__parameterized1_2 DSP2
       (.D({DSP2_n_18,DSP2_n_19,DSP2_n_20,DSP2_n_21,DSP2_n_22,DSP2_n_23,DSP2_n_24,DSP2_n_25,DSP2_n_26,DSP2_n_27}),
        .DI(DSP2_n_16),
        .Q({DSP2_n_0,DSP2_n_1,DSP2_n_2,DSP2_n_3,DSP2_n_4,DSP2_n_5,DSP2_n_6,DSP2_n_7,DSP2_n_8,DSP2_n_9}),
        .S(DSP1_n_9),
        .\a_reg_reg[0][9]_0 (h_reg),
        .\b_reg_reg[0][0]_0 (DSP2_n_10),
        .\b_reg_reg[0][0]_1 (DSP2_n_11),
        .\b_reg_reg[0][0]_2 (DSP2_n_12),
        .\b_reg_reg[0][0]_3 (DSP2_n_13),
        .\b_reg_reg[0][0]_4 (DSP2_n_14),
        .\b_reg_reg[0][0]_5 ({DSP2_n_38,DSP2_n_39}),
        .\b_reg_reg[0][2]_0 ({DSP2_n_40,DSP2_n_41}),
        .\b_reg_reg[0][3]_0 (DSP2_n_43),
        .\b_reg_reg[0][4]_0 (DSP2_n_42),
        .\b_reg_reg[0][5]_0 (DSP2_n_15),
        .\b_reg_reg[0][5]_1 (DSP2_n_44),
        .\b_reg_reg[0][5]_2 (stage_cntr_reg),
        .\b_reg_reg[0][6]_0 (DSP2_n_46),
        .\b_reg_reg[0][7]_0 (DSP2_n_45),
        .\b_reg_reg[0][8]_0 (DSP2_n_17),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG),
        .dout_reg(\read_cntr_reg_n_0_[0] ),
        .dout_reg_0({DSP3_n_12,DSP3_n_13,DSP3_n_14,DSP3_n_15,DSP3_n_16,DSP3_n_17,DSP3_n_18,DSP3_n_19,DSP3_n_20,DSP3_n_21}),
        .m_reg0__0_carry__1_i_3({DSP3_n_0,DSP3_n_1,DSP3_n_2,DSP3_n_3,DSP3_n_4,DSP3_n_5,DSP3_n_6,DSP3_n_7,DSP3_n_8}),
        .m_reg0__28_carry__0_0(DSP3_n_9),
        .m_reg0__56_carry_i_6__0_0(DSP1_n_11),
        .\m_reg_reg[2]_0 (P[0]),
        .\m_reg_reg[3]_0 (DSP1_n_10),
        .p_0_in13_in(p_0_in13_in),
        .\p_reg_reg[9]_0 (rom_imag_addr_reg__0));
  dsp_25x18__parameterized1_3 DSP3
       (.D({a0_carry__1_n_6,a0_carry__1_n_7,a0_carry__0_n_4,a0_carry__0_n_5,a0_carry__0_n_6,a0_carry__0_n_7,a0_carry_n_4,a0_carry_n_5,a0_carry_n_6,a0_carry_n_7}),
        .DI(DSP2_n_16),
        .Q({DSP3_n_0,DSP3_n_1,DSP3_n_2,DSP3_n_3,DSP3_n_4,DSP3_n_5,DSP3_n_6,DSP3_n_7,DSP3_n_8}),
        .S({DSP3_n_10,DSP3_n_11}),
        .\a_reg_reg[0][4]_0 (DSP3_n_9),
        .\a_reg_reg[0][9]_0 (h_reg[9:8]),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG),
        .half(half[9:8]),
        .m_reg0__0_carry__0_0(DSP2_n_14),
        .m_reg0__0_carry__0_1(DSP2_n_13),
        .m_reg0__0_carry__0_2(DSP2_n_12),
        .m_reg0__0_carry__0_3(DSP2_n_11),
        .m_reg0__0_carry__1_0(DSP2_n_10),
        .m_reg0__28_carry_0(DSP2_n_15),
        .m_reg0__47_carry_0(DSP2_n_17),
        .m_reg0__56_carry__0_i_2_0({DSP2_n_0,DSP2_n_1,DSP2_n_2,DSP2_n_3,DSP2_n_4,DSP2_n_5,DSP2_n_6,DSP2_n_7,DSP2_n_8,DSP2_n_9}),
        .m_reg0__56_carry_i_5_0(DSP2_n_44),
        .m_reg0__56_carry_i_6_0(DSP2_n_45),
        .m_reg0__56_carry_i_6_1(DSP2_n_46),
        .\m_reg_reg[2]_0 ({DSP2_n_38,DSP2_n_39}),
        .\m_reg_reg[2]_1 ({DSP2_n_40,DSP2_n_41}),
        .\m_reg_reg[3]_0 (DSP2_n_42),
        .\m_reg_reg[3]_1 (DSP2_n_43),
        .\p_reg_reg[9]_0 ({DSP3_n_12,DSP3_n_13,DSP3_n_14,DSP3_n_15,DSP3_n_16,DSP3_n_17,DSP3_n_18,DSP3_n_19,DSP3_n_20,DSP3_n_21}));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 a0_carry
       (.CI(1'b0),
        .CO({a0_carry_n_0,NLW_a0_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({h_reg[3:1],p_reg0}),
        .O({a0_carry_n_4,a0_carry_n_5,a0_carry_n_6,a0_carry_n_7}),
        .S({a0_carry_i_1_n_0,a0_carry_i_2_n_0,a0_carry_i_3_n_0,a0_carry_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 a0_carry__0
       (.CI(a0_carry_n_0),
        .CO({a0_carry__0_n_0,NLW_a0_carry__0_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI(h_reg[7:4]),
        .O({a0_carry__0_n_4,a0_carry__0_n_5,a0_carry__0_n_6,a0_carry__0_n_7}),
        .S({a0_carry__0_i_1_n_0,a0_carry__0_i_2_n_0,a0_carry__0_i_3_n_0,a0_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    a0_carry__0_i_1
       (.I0(h_reg[7]),
        .I1(groups[2]),
        .O(a0_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    a0_carry__0_i_2
       (.I0(h_reg[6]),
        .I1(half[6]),
        .O(a0_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    a0_carry__0_i_3
       (.I0(h_reg[5]),
        .I1(half[5]),
        .O(a0_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    a0_carry__0_i_4
       (.I0(h_reg[4]),
        .I1(half[4]),
        .O(a0_carry__0_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 a0_carry__1
       (.CI(a0_carry__0_n_0),
        .CO(NLW_a0_carry__1_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,h_reg[8]}),
        .O({NLW_a0_carry__1_O_UNCONNECTED[3:2],a0_carry__1_n_6,a0_carry__1_n_7}),
        .S({1'b0,1'b0,DSP3_n_10,DSP3_n_11}));
  LUT2 #(
    .INIT(4'h6)) 
    a0_carry_i_1
       (.I0(h_reg[3]),
        .I1(half[3]),
        .O(a0_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    a0_carry_i_2
       (.I0(h_reg[2]),
        .I1(half[2]),
        .O(a0_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    a0_carry_i_3
       (.I0(h_reg[1]),
        .I1(groups[8]),
        .O(a0_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    a0_carry_i_4
       (.I0(p_reg0),
        .I1(half[0]),
        .O(a0_carry_i_4_n_0));
  LUT5 #(
    .INIT(32'h00000040)) 
    begin_butterfly_i_1
       (.I0(begin_butterfly),
        .I1(p_0_in13_in),
        .I2(\read_cntr_reg_n_0_[0] ),
        .I3(\write_cntr_reg[1]_0 ),
        .I4(rstbt_IBUF),
        .O(begin_butterfly_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    begin_butterfly_reg
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(begin_butterfly_i_1_n_0),
        .Q(begin_butterfly),
        .R(1'b0));
  butterfly btf
       (.A(x1_imag_reg),
        .B(dout_reg__0_0),
        .Q({w2_imag_buff[17],w2_imag_buff[15:0]}),
        .begin_butterfly(begin_butterfly),
        .butterfly_done_reg_reg_0(btf_n_2),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG),
        .din_a_i(din_a_i),
        .din_b_i(din_b_i),
        .fft_start_reg(btf_n_3),
        .p_0_in13_in(p_0_in13_in),
        .p_reg_reg(x2_real_buff),
        .p_reg_reg_0({w1_imag_buff[17],w1_imag_buff[15:0]}),
        .p_reg_reg_1(x1_real_reg),
        .p_reg_reg_2(\read_cntr_reg_n_0_[0] ),
        .p_reg_reg_3(read_cycle_done_reg_n_0),
        .ram_array_reg(\mem_dest_reg_n_0_[0] ),
        .ram_array_reg_0(\mem_dest_reg_n_0_[1] ),
        .ram_array_reg_1(\mem_dest_reg[1]_rep_n_0 ),
        .ram_array_reg_2(\mem_dest_reg[0]_rep_n_0 ),
        .read_cntr_0_posedge_delay(read_cntr_0_posedge_delay),
        .read_cntr_1_posedge_delay(read_cntr_1_posedge_delay),
        .rstbt_IBUF(rstbt_IBUF),
        .write_cntr_0_posedge(write_cntr_0_posedge),
        .write_cntr_0_posedge_delay(write_cntr_0_posedge_delay),
        .\write_cntr_reg[0] (\write_cntr_reg_n_0_[1] ),
        .\write_cntr_reg[0]_0 (\write_cntr_reg_n_0_[0] ),
        .\write_cntr_reg[1] (\write_cntr_reg[1]_0 ),
        .x1_real_buff(x1_real_buff),
        .x2_real_buff_0(x2_real_buff_0));
  LUT6 #(
    .INIT(64'h00000000AAFFAAFE)) 
    \calc_index_cntr[0]_i_1 
       (.I0(\calc_index_cntr[0]_i_2_n_0 ),
        .I1(\calc_index_cntr_reg_n_0_[3] ),
        .I2(\calc_index_cntr_reg_n_0_[2] ),
        .I3(\calc_index_cntr_reg_n_0_[0] ),
        .I4(\calc_index_cntr_reg_n_0_[1] ),
        .I5(\calc_index_cntr[0]_i_3_n_0 ),
        .O(\calc_index_cntr[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAA80)) 
    \calc_index_cntr[0]_i_2 
       (.I0(\calc_sidevar_cntr[0]_i_2_n_0 ),
        .I1(\write_cntr_reg_n_0_[1] ),
        .I2(\write_cntr_reg_n_0_[0] ),
        .I3(read_cycle_done_reg_n_0),
        .I4(sidevars_done),
        .O(\calc_index_cntr[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFBAAAAAAA)) 
    \calc_index_cntr[0]_i_3 
       (.I0(read_cntr0),
        .I1(\calc_index_cntr_reg_n_0_[1] ),
        .I2(\calc_index_cntr_reg_n_0_[0] ),
        .I3(\calc_index_cntr_reg_n_0_[2] ),
        .I4(\calc_index_cntr_reg_n_0_[3] ),
        .I5(new_stage),
        .O(\calc_index_cntr[0]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFEEE)) 
    \calc_index_cntr[0]_i_4 
       (.I0(\write_cntr_reg[1]_0 ),
        .I1(rstbt_IBUF),
        .I2(p_0_in13_in),
        .I3(\read_cntr_reg_n_0_[0] ),
        .O(read_cntr0));
  LUT3 #(
    .INIT(8'h60)) 
    \calc_index_cntr[1]_i_1 
       (.I0(\calc_index_cntr_reg_n_0_[1] ),
        .I1(\calc_index_cntr_reg_n_0_[0] ),
        .I2(\calc_index_cntr[3]_i_2_n_0 ),
        .O(\calc_index_cntr[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h7800)) 
    \calc_index_cntr[2]_i_1 
       (.I0(\calc_index_cntr_reg_n_0_[1] ),
        .I1(\calc_index_cntr_reg_n_0_[0] ),
        .I2(\calc_index_cntr_reg_n_0_[2] ),
        .I3(\calc_index_cntr[3]_i_2_n_0 ),
        .O(\calc_index_cntr[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'h7F800000)) 
    \calc_index_cntr[3]_i_1 
       (.I0(\calc_index_cntr_reg_n_0_[1] ),
        .I1(\calc_index_cntr_reg_n_0_[0] ),
        .I2(\calc_index_cntr_reg_n_0_[2] ),
        .I3(\calc_index_cntr_reg_n_0_[3] ),
        .I4(\calc_index_cntr[3]_i_2_n_0 ),
        .O(\calc_index_cntr[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000000111FFFF)) 
    \calc_index_cntr[3]_i_2 
       (.I0(sidevars_done),
        .I1(read_cycle_done_reg_n_0),
        .I2(\write_cntr_reg_n_0_[0] ),
        .I3(\write_cntr_reg_n_0_[1] ),
        .I4(\calc_sidevar_cntr[0]_i_2_n_0 ),
        .I5(\calc_index_cntr[0]_i_3_n_0 ),
        .O(\calc_index_cntr[3]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \calc_index_cntr_reg[0] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\calc_index_cntr[0]_i_1_n_0 ),
        .Q(\calc_index_cntr_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \calc_index_cntr_reg[1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\calc_index_cntr[1]_i_1_n_0 ),
        .Q(\calc_index_cntr_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \calc_index_cntr_reg[2] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\calc_index_cntr[2]_i_1_n_0 ),
        .Q(\calc_index_cntr_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \calc_index_cntr_reg[3] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\calc_index_cntr[3]_i_1_n_0 ),
        .Q(\calc_index_cntr_reg_n_0_[3] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h00000000C0EAD5EA)) 
    \calc_sidevar_cntr[0]_i_1 
       (.I0(\calc_sidevar_cntr_reg_n_0_[0] ),
        .I1(fft_in_progress),
        .I2(new_stage),
        .I3(\calc_sidevar_cntr[4]_i_2_n_0 ),
        .I4(\calc_sidevar_cntr[0]_i_2_n_0 ),
        .I5(p_17_in),
        .O(\calc_sidevar_cntr[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00004000)) 
    \calc_sidevar_cntr[0]_i_2 
       (.I0(\calc_sidevar_cntr_reg_n_0_[0] ),
        .I1(\calc_sidevar_cntr_reg_n_0_[1] ),
        .I2(\calc_sidevar_cntr_reg_n_0_[2] ),
        .I3(\calc_sidevar_cntr_reg_n_0_[4] ),
        .I4(\calc_sidevar_cntr_reg_n_0_[3] ),
        .O(\calc_sidevar_cntr[0]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \calc_sidevar_cntr[1]_i_1 
       (.I0(\calc_sidevar_cntr_reg_n_0_[1] ),
        .I1(\calc_sidevar_cntr_reg_n_0_[0] ),
        .O(\calc_sidevar_cntr[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \calc_sidevar_cntr[2]_i_1 
       (.I0(\calc_sidevar_cntr_reg_n_0_[2] ),
        .I1(\calc_sidevar_cntr_reg_n_0_[0] ),
        .I2(\calc_sidevar_cntr_reg_n_0_[1] ),
        .O(\calc_sidevar_cntr[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \calc_sidevar_cntr[3]_i_1 
       (.I0(\calc_sidevar_cntr_reg_n_0_[3] ),
        .I1(\calc_sidevar_cntr_reg_n_0_[1] ),
        .I2(\calc_sidevar_cntr_reg_n_0_[0] ),
        .I3(\calc_sidevar_cntr_reg_n_0_[2] ),
        .O(\calc_sidevar_cntr[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFF8)) 
    \calc_sidevar_cntr[4]_i_1 
       (.I0(new_stage),
        .I1(fft_in_progress),
        .I2(\write_cntr_reg[1]_0 ),
        .I3(rstbt_IBUF),
        .O(calc_sidevar_cntr));
  LUT6 #(
    .INIT(64'h04000000FFFFFFFE)) 
    \calc_sidevar_cntr[4]_i_2 
       (.I0(\calc_sidevar_cntr_reg_n_0_[3] ),
        .I1(\calc_sidevar_cntr_reg_n_0_[1] ),
        .I2(\calc_sidevar_cntr_reg_n_0_[0] ),
        .I3(\calc_sidevar_cntr_reg_n_0_[4] ),
        .I4(\calc_sidevar_cntr_reg_n_0_[2] ),
        .I5(calc_sidevar_cntr),
        .O(\calc_sidevar_cntr[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \calc_sidevar_cntr[4]_i_3 
       (.I0(\calc_sidevar_cntr_reg_n_0_[4] ),
        .I1(\calc_sidevar_cntr_reg_n_0_[2] ),
        .I2(\calc_sidevar_cntr_reg_n_0_[0] ),
        .I3(\calc_sidevar_cntr_reg_n_0_[1] ),
        .I4(\calc_sidevar_cntr_reg_n_0_[3] ),
        .O(\calc_sidevar_cntr[4]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \calc_sidevar_cntr_reg[0] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\calc_sidevar_cntr[0]_i_1_n_0 ),
        .Q(\calc_sidevar_cntr_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \calc_sidevar_cntr_reg[1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\calc_sidevar_cntr[4]_i_2_n_0 ),
        .D(\calc_sidevar_cntr[1]_i_1_n_0 ),
        .Q(\calc_sidevar_cntr_reg_n_0_[1] ),
        .R(calc_sidevar_cntr));
  FDRE #(
    .INIT(1'b0)) 
    \calc_sidevar_cntr_reg[2] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\calc_sidevar_cntr[4]_i_2_n_0 ),
        .D(\calc_sidevar_cntr[2]_i_1_n_0 ),
        .Q(\calc_sidevar_cntr_reg_n_0_[2] ),
        .R(calc_sidevar_cntr));
  FDRE #(
    .INIT(1'b0)) 
    \calc_sidevar_cntr_reg[3] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\calc_sidevar_cntr[4]_i_2_n_0 ),
        .D(\calc_sidevar_cntr[3]_i_1_n_0 ),
        .Q(\calc_sidevar_cntr_reg_n_0_[3] ),
        .R(calc_sidevar_cntr));
  FDRE #(
    .INIT(1'b0)) 
    \calc_sidevar_cntr_reg[4] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\calc_sidevar_cntr[4]_i_2_n_0 ),
        .D(\calc_sidevar_cntr[4]_i_3_n_0 ),
        .Q(\calc_sidevar_cntr_reg_n_0_[4] ),
        .R(calc_sidevar_cntr));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \cb_addr_cntr[0]_i_1 
       (.I0(ADDRBWRADDR[0]),
        .I1(loading_samples),
        .O(\cb_addr_cntr[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \cb_addr_cntr[1]_i_1 
       (.I0(ADDRBWRADDR[1]),
        .I1(ADDRBWRADDR[0]),
        .I2(loading_samples),
        .O(\cb_addr_cntr[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT5 #(
    .INIT(32'hAA6AAAAA)) 
    \cb_addr_cntr[2]_i_1 
       (.I0(ADDRBWRADDR[2]),
        .I1(ADDRBWRADDR[1]),
        .I2(loading_samples),
        .I3(p_17_in),
        .I4(ADDRBWRADDR[0]),
        .O(\cb_addr_cntr[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000007F80FF00)) 
    \cb_addr_cntr[3]_i_1 
       (.I0(ADDRBWRADDR[2]),
        .I1(ADDRBWRADDR[1]),
        .I2(ADDRBWRADDR[0]),
        .I3(ADDRBWRADDR[3]),
        .I4(loading_samples),
        .I5(clear),
        .O(\cb_addr_cntr[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000B00000004)) 
    \cb_addr_cntr[4]_i_1 
       (.I0(\cb_addr_cntr[4]_i_2_n_0 ),
        .I1(loading_samples),
        .I2(loading_done),
        .I3(\write_cntr_reg[1]_0 ),
        .I4(rstbt_IBUF),
        .I5(ADDRBWRADDR[4]),
        .O(\cb_addr_cntr[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \cb_addr_cntr[4]_i_2 
       (.I0(ADDRBWRADDR[3]),
        .I1(ADDRBWRADDR[0]),
        .I2(ADDRBWRADDR[1]),
        .I3(ADDRBWRADDR[2]),
        .O(\cb_addr_cntr[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \cb_addr_cntr[5]_i_1 
       (.I0(ADDRBWRADDR[5]),
        .I1(\cb_addr_cntr[8]_i_2_n_0 ),
        .O(\cb_addr_cntr[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hA6)) 
    \cb_addr_cntr[6]_i_1 
       (.I0(ADDRBWRADDR[6]),
        .I1(ADDRBWRADDR[5]),
        .I2(\cb_addr_cntr[8]_i_2_n_0 ),
        .O(\cb_addr_cntr[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'h9AAA)) 
    \cb_addr_cntr[7]_i_1 
       (.I0(ADDRBWRADDR[7]),
        .I1(\cb_addr_cntr[8]_i_2_n_0 ),
        .I2(ADDRBWRADDR[5]),
        .I3(ADDRBWRADDR[6]),
        .O(\cb_addr_cntr[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000BFFF4000)) 
    \cb_addr_cntr[8]_i_1 
       (.I0(\cb_addr_cntr[8]_i_2_n_0 ),
        .I1(ADDRBWRADDR[5]),
        .I2(ADDRBWRADDR[6]),
        .I3(ADDRBWRADDR[7]),
        .I4(ADDRBWRADDR[8]),
        .I5(clear),
        .O(\cb_addr_cntr[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hDFFFFFFFFFFFFFFF)) 
    \cb_addr_cntr[8]_i_2 
       (.I0(ADDRBWRADDR[4]),
        .I1(\cb_addr_cntr[8]_i_3_n_0 ),
        .I2(ADDRBWRADDR[3]),
        .I3(ADDRBWRADDR[0]),
        .I4(ADDRBWRADDR[1]),
        .I5(ADDRBWRADDR[2]),
        .O(\cb_addr_cntr[8]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFEFF)) 
    \cb_addr_cntr[8]_i_3 
       (.I0(rstbt_IBUF),
        .I1(\write_cntr_reg[1]_0 ),
        .I2(loading_done),
        .I3(loading_samples),
        .O(\cb_addr_cntr[8]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \cb_addr_cntr[9]_i_1 
       (.I0(loading_done),
        .I1(\write_cntr_reg[1]_0 ),
        .I2(rstbt_IBUF),
        .O(clear));
  LUT6 #(
    .INIT(64'h9AAAAAAAAAAAAAAA)) 
    \cb_addr_cntr[9]_i_2 
       (.I0(ADDRBWRADDR[9]),
        .I1(\cb_addr_cntr[8]_i_2_n_0 ),
        .I2(ADDRBWRADDR[5]),
        .I3(ADDRBWRADDR[6]),
        .I4(ADDRBWRADDR[7]),
        .I5(ADDRBWRADDR[8]),
        .O(\cb_addr_cntr[9]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cb_addr_cntr_delay_reg[0] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(ADDRBWRADDR[0]),
        .Q(cb_addr_cntr_delay[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cb_addr_cntr_delay_reg[1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(ADDRBWRADDR[1]),
        .Q(cb_addr_cntr_delay[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cb_addr_cntr_delay_reg[2] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(ADDRBWRADDR[2]),
        .Q(cb_addr_cntr_delay[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cb_addr_cntr_delay_reg[3] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(ADDRBWRADDR[3]),
        .Q(cb_addr_cntr_delay[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cb_addr_cntr_delay_reg[4] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(ADDRBWRADDR[4]),
        .Q(cb_addr_cntr_delay[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cb_addr_cntr_delay_reg[5] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(ADDRBWRADDR[5]),
        .Q(cb_addr_cntr_delay[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cb_addr_cntr_delay_reg[6] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(ADDRBWRADDR[6]),
        .Q(cb_addr_cntr_delay[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cb_addr_cntr_delay_reg[7] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(ADDRBWRADDR[7]),
        .Q(cb_addr_cntr_delay[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cb_addr_cntr_delay_reg[8] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(ADDRBWRADDR[8]),
        .Q(cb_addr_cntr_delay[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cb_addr_cntr_delay_reg[9] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(ADDRBWRADDR[9]),
        .Q(cb_addr_cntr_delay[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cb_addr_cntr_reg[0] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\cb_addr_cntr[0]_i_1_n_0 ),
        .Q(ADDRBWRADDR[0]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \cb_addr_cntr_reg[1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\cb_addr_cntr[1]_i_1_n_0 ),
        .Q(ADDRBWRADDR[1]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \cb_addr_cntr_reg[2] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\cb_addr_cntr[2]_i_1_n_0 ),
        .Q(ADDRBWRADDR[2]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \cb_addr_cntr_reg[3] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\cb_addr_cntr[3]_i_1_n_0 ),
        .Q(ADDRBWRADDR[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cb_addr_cntr_reg[4] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\cb_addr_cntr[4]_i_1_n_0 ),
        .Q(ADDRBWRADDR[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cb_addr_cntr_reg[5] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\cb_addr_cntr[5]_i_1_n_0 ),
        .Q(ADDRBWRADDR[5]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \cb_addr_cntr_reg[6] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\cb_addr_cntr[6]_i_1_n_0 ),
        .Q(ADDRBWRADDR[6]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \cb_addr_cntr_reg[7] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\cb_addr_cntr[7]_i_1_n_0 ),
        .Q(ADDRBWRADDR[7]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \cb_addr_cntr_reg[8] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\cb_addr_cntr[8]_i_1_n_0 ),
        .Q(ADDRBWRADDR[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cb_addr_cntr_reg[9] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\cb_addr_cntr[9]_i_2_n_0 ),
        .Q(ADDRBWRADDR[9]),
        .R(clear));
  coeff_rom__parameterized0 coeff_rom_imag
       (.D(dout_reg__0),
        .Q(rom_imag_addr_reg),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG),
        .pwropt(read_cycle_done_reg_n_0),
        .pwropt_1(read_cntr_0_posedge_delay),
        .pwropt_2(read_cntr_1_posedge_delay),
        .pwropt_3(\read_cntr_reg_n_0_[0] ),
        .pwropt_4(p_0_in13_in));
  coeff_rom coeff_rom_real
       (.B(dout_reg__0_0),
        .Q(rom_imag_addr_reg),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG));
  LUT5 #(
    .INIT(32'h000000AE)) 
    fft_done_reg_i_1
       (.I0(fft_rdy),
        .I1(DSP2_n_27),
        .I2(fft_in_progress),
        .I3(\write_cntr_reg[1]_0 ),
        .I4(rstbt_IBUF),
        .O(fft_done_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    fft_done_reg_reg
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(fft_done_reg_i_1_n_0),
        .Q(fft_rdy),
        .R(1'b0));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 fft_in_progress2_carry
       (.CI(1'b0),
        .CO({fft_in_progress2_carry_n_0,NLW_fft_in_progress2_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_fft_in_progress2_carry_O_UNCONNECTED[3:0]),
        .S({fft_in_progress2_carry_i_1_n_0,fft_in_progress2_carry_i_2_n_0,fft_in_progress2_carry_i_3_n_0,fft_in_progress2_carry_i_4_n_0}));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 fft_in_progress2_carry__0
       (.CI(fft_in_progress2_carry_n_0),
        .CO({fft_in_progress2_carry__0_n_0,NLW_fft_in_progress2_carry__0_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_fft_in_progress2_carry__0_O_UNCONNECTED[3:0]),
        .S({fft_in_progress2_carry__0_i_1_n_0,fft_in_progress2_carry__0_i_2_n_0,fft_in_progress2_carry__0_i_3_n_0,fft_in_progress2_carry__0_i_4_n_0}));
  LUT5 #(
    .INIT(32'hFFFFFEFF)) 
    fft_in_progress2_carry__0_i_1
       (.I0(half[0]),
        .I1(half[2]),
        .I2(half[3]),
        .I3(fft_in_progress2_carry_i_5_n_0),
        .I4(groups[8]),
        .O(fft_in_progress2_carry__0_i_1_n_0));
  LUT5 #(
    .INIT(32'hFFFFFEFF)) 
    fft_in_progress2_carry__0_i_2
       (.I0(half[0]),
        .I1(half[2]),
        .I2(half[3]),
        .I3(fft_in_progress2_carry_i_5_n_0),
        .I4(groups[8]),
        .O(fft_in_progress2_carry__0_i_2_n_0));
  LUT5 #(
    .INIT(32'hFFFFFEFF)) 
    fft_in_progress2_carry__0_i_3
       (.I0(half[0]),
        .I1(half[2]),
        .I2(half[3]),
        .I3(fft_in_progress2_carry_i_5_n_0),
        .I4(groups[8]),
        .O(fft_in_progress2_carry__0_i_3_n_0));
  LUT5 #(
    .INIT(32'hFFFFFEFF)) 
    fft_in_progress2_carry__0_i_4
       (.I0(half[0]),
        .I1(half[2]),
        .I2(half[3]),
        .I3(fft_in_progress2_carry_i_5_n_0),
        .I4(groups[8]),
        .O(fft_in_progress2_carry__0_i_4_n_0));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 fft_in_progress2_carry__1
       (.CI(fft_in_progress2_carry__0_n_0),
        .CO({NLW_fft_in_progress2_carry__1_CO_UNCONNECTED[3],fft_in_progress21_out,NLW_fft_in_progress2_carry__1_CO_UNCONNECTED[1:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_fft_in_progress2_carry__1_O_UNCONNECTED[3:0]),
        .S({1'b0,fft_in_progress2_carry__1_i_1_n_0,fft_in_progress2_carry__1_i_2_n_0,fft_in_progress2_carry__1_i_3_n_0}));
  LUT5 #(
    .INIT(32'hFFFFFEFF)) 
    fft_in_progress2_carry__1_i_1
       (.I0(half[0]),
        .I1(half[2]),
        .I2(half[3]),
        .I3(fft_in_progress2_carry_i_5_n_0),
        .I4(groups[8]),
        .O(fft_in_progress2_carry__1_i_1_n_0));
  LUT5 #(
    .INIT(32'hFFFFFEFF)) 
    fft_in_progress2_carry__1_i_2
       (.I0(half[0]),
        .I1(half[2]),
        .I2(half[3]),
        .I3(fft_in_progress2_carry_i_5_n_0),
        .I4(groups[8]),
        .O(fft_in_progress2_carry__1_i_2_n_0));
  LUT5 #(
    .INIT(32'hFFFFFEFF)) 
    fft_in_progress2_carry__1_i_3
       (.I0(half[0]),
        .I1(half[2]),
        .I2(half[3]),
        .I3(fft_in_progress2_carry_i_5_n_0),
        .I4(groups[8]),
        .O(fft_in_progress2_carry__1_i_3_n_0));
  LUT6 #(
    .INIT(64'hAAAAA8AA55555655)) 
    fft_in_progress2_carry_i_1
       (.I0(half[0]),
        .I1(half[2]),
        .I2(half[3]),
        .I3(fft_in_progress2_carry_i_5_n_0),
        .I4(groups[8]),
        .I5(\g_reg_n_0_[9] ),
        .O(fft_in_progress2_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h00000000AAA65559)) 
    fft_in_progress2_carry_i_2
       (.I0(groups[8]),
        .I1(fft_in_progress2_carry_i_5_n_0),
        .I2(half[3]),
        .I3(half[2]),
        .I4(g_reg[8]),
        .I5(fft_in_progress2_carry_i_6_n_0),
        .O(fft_in_progress2_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000000009906009)) 
    fft_in_progress2_carry_i_3
       (.I0(half[4]),
        .I1(g_reg[5]),
        .I2(g_reg[4]),
        .I3(fft_in_progress2_carry_i_7_n_0),
        .I4(half[5]),
        .I5(fft_in_progress2_carry_i_8_n_0),
        .O(fft_in_progress2_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h4120000800084120)) 
    fft_in_progress2_carry_i_4
       (.I0(g_reg[0]),
        .I1(g_reg[1]),
        .I2(half[8]),
        .I3(half[9]),
        .I4(g_reg[2]),
        .I5(groups[2]),
        .O(fft_in_progress2_carry_i_4_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    fft_in_progress2_carry_i_5
       (.I0(half[5]),
        .I1(half[6]),
        .I2(half[9]),
        .I3(half[8]),
        .I4(groups[2]),
        .I5(half[4]),
        .O(fft_in_progress2_carry_i_5_n_0));
  LUT5 #(
    .INIT(32'hB7DBED7E)) 
    fft_in_progress2_carry_i_6
       (.I0(g_reg[6]),
        .I1(half[2]),
        .I2(fft_in_progress2_carry_i_5_n_0),
        .I3(half[3]),
        .I4(g_reg[7]),
        .O(fft_in_progress2_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h0001)) 
    fft_in_progress2_carry_i_7
       (.I0(half[6]),
        .I1(half[9]),
        .I2(half[8]),
        .I3(groups[2]),
        .O(fft_in_progress2_carry_i_7_n_0));
  LUT5 #(
    .INIT(32'h5556AAA9)) 
    fft_in_progress2_carry_i_8
       (.I0(g_reg[3]),
        .I1(groups[2]),
        .I2(half[8]),
        .I3(half[9]),
        .I4(half[6]),
        .O(fft_in_progress2_carry_i_8_n_0));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \fft_in_progress2_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\fft_in_progress2_inferred__0/i__carry_n_0 ,\NLW_fft_in_progress2_inferred__0/i__carry_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_fft_in_progress2_inferred__0/i__carry_O_UNCONNECTED [3:0]),
        .S({i__carry_i_1_n_0,i__carry_i_2_n_0,i__carry_i_3_n_0,i__carry_i_4_n_0}));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \fft_in_progress2_inferred__0/i__carry__0 
       (.CI(\fft_in_progress2_inferred__0/i__carry_n_0 ),
        .CO({\fft_in_progress2_inferred__0/i__carry__0_n_0 ,\NLW_fft_in_progress2_inferred__0/i__carry__0_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_fft_in_progress2_inferred__0/i__carry__0_O_UNCONNECTED [3:0]),
        .S({i__carry__0_i_1_n_0,i__carry__0_i_2_n_0,i__carry__0_i_3_n_0,i__carry__0_i_4_n_0}));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \fft_in_progress2_inferred__0/i__carry__1 
       (.CI(\fft_in_progress2_inferred__0/i__carry__0_n_0 ),
        .CO({\NLW_fft_in_progress2_inferred__0/i__carry__1_CO_UNCONNECTED [3],fft_in_progress2,\NLW_fft_in_progress2_inferred__0/i__carry__1_CO_UNCONNECTED [1:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_fft_in_progress2_inferred__0/i__carry__1_O_UNCONNECTED [3:0]),
        .S({1'b0,i__carry__1_i_1_n_0,i__carry__1_i_2_n_0,i__carry__1_i_3_n_0}));
  LUT6 #(
    .INIT(64'h00000000FFFF2AAA)) 
    fft_in_progress_i_1
       (.I0(fft_in_progress),
        .I1(DSP2_n_27),
        .I2(fft_in_progress21_out),
        .I3(fft_in_progress2),
        .I4(loading_done),
        .I5(p_17_in),
        .O(fft_in_progress_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    fft_in_progress_reg
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(fft_in_progress_i_1_n_0),
        .Q(fft_in_progress),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \g[0]_i_1 
       (.I0(g_reg[0]),
        .O(p_0_in__2[0]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \g[1]_i_1 
       (.I0(g_reg[1]),
        .I1(g_reg[0]),
        .O(p_0_in__2[1]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \g[2]_i_1 
       (.I0(g_reg[2]),
        .I1(g_reg[1]),
        .I2(g_reg[0]),
        .O(p_0_in__2[2]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \g[3]_i_1 
       (.I0(g_reg[3]),
        .I1(g_reg[2]),
        .I2(g_reg[1]),
        .I3(g_reg[0]),
        .O(\g[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \g[4]_i_1 
       (.I0(g_reg[4]),
        .I1(g_reg[3]),
        .I2(g_reg[0]),
        .I3(g_reg[1]),
        .I4(g_reg[2]),
        .O(\g[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \g[5]_i_1 
       (.I0(g_reg[5]),
        .I1(g_reg[3]),
        .I2(g_reg[0]),
        .I3(g_reg[1]),
        .I4(g_reg[2]),
        .I5(g_reg[4]),
        .O(p_0_in__2[5]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \g[6]_i_1 
       (.I0(g_reg[6]),
        .I1(\g[9]_i_4_n_0 ),
        .O(\g[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hA6)) 
    \g[7]_i_1 
       (.I0(g_reg[7]),
        .I1(g_reg[6]),
        .I2(\g[9]_i_4_n_0 ),
        .O(\g[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'h9AAA)) 
    \g[8]_i_1 
       (.I0(g_reg[8]),
        .I1(\g[9]_i_4_n_0 ),
        .I2(g_reg[6]),
        .I3(g_reg[7]),
        .O(p_0_in__2[8]));
  LUT6 #(
    .INIT(64'hAAAAAAAA00020000)) 
    \g[9]_i_1 
       (.I0(\g[9]_i_3_n_0 ),
        .I1(stage_cntr_reg[3]),
        .I2(stage_cntr_reg[2]),
        .I3(stage_cntr_reg[1]),
        .I4(stage_cntr_reg[0]),
        .I5(fft_in_progress2),
        .O(\g[9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'hAA6AAAAA)) 
    \g[9]_i_2 
       (.I0(\g_reg_n_0_[9] ),
        .I1(g_reg[7]),
        .I2(g_reg[6]),
        .I3(\g[9]_i_4_n_0 ),
        .I4(g_reg[8]),
        .O(p_0_in__2[9]));
  LUT2 #(
    .INIT(4'h8)) 
    \g[9]_i_3 
       (.I0(\write_cntr_reg_n_0_[1] ),
        .I1(\write_cntr_reg_n_0_[0] ),
        .O(\g[9]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \g[9]_i_4 
       (.I0(g_reg[4]),
        .I1(g_reg[2]),
        .I2(g_reg[1]),
        .I3(g_reg[0]),
        .I4(g_reg[3]),
        .I5(g_reg[5]),
        .O(\g[9]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \g_reg[0] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\g[9]_i_1_n_0 ),
        .D(p_0_in__2[0]),
        .Q(g_reg[0]),
        .R(calc_sidevar_cntr));
  FDRE #(
    .INIT(1'b0)) 
    \g_reg[1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\g[9]_i_1_n_0 ),
        .D(p_0_in__2[1]),
        .Q(g_reg[1]),
        .R(calc_sidevar_cntr));
  FDRE #(
    .INIT(1'b0)) 
    \g_reg[2] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\g[9]_i_1_n_0 ),
        .D(p_0_in__2[2]),
        .Q(g_reg[2]),
        .R(calc_sidevar_cntr));
  FDRE #(
    .INIT(1'b0)) 
    \g_reg[3] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\g[9]_i_1_n_0 ),
        .D(\g[3]_i_1_n_0 ),
        .Q(g_reg[3]),
        .R(calc_sidevar_cntr));
  FDRE #(
    .INIT(1'b0)) 
    \g_reg[4] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\g[9]_i_1_n_0 ),
        .D(\g[4]_i_1_n_0 ),
        .Q(g_reg[4]),
        .R(calc_sidevar_cntr));
  FDRE #(
    .INIT(1'b0)) 
    \g_reg[5] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\g[9]_i_1_n_0 ),
        .D(p_0_in__2[5]),
        .Q(g_reg[5]),
        .R(calc_sidevar_cntr));
  FDRE #(
    .INIT(1'b0)) 
    \g_reg[6] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\g[9]_i_1_n_0 ),
        .D(\g[6]_i_1_n_0 ),
        .Q(g_reg[6]),
        .R(calc_sidevar_cntr));
  FDRE #(
    .INIT(1'b0)) 
    \g_reg[7] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\g[9]_i_1_n_0 ),
        .D(\g[7]_i_1_n_0 ),
        .Q(g_reg[7]),
        .R(calc_sidevar_cntr));
  FDRE #(
    .INIT(1'b0)) 
    \g_reg[8] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\g[9]_i_1_n_0 ),
        .D(p_0_in__2[8]),
        .Q(g_reg[8]),
        .R(calc_sidevar_cntr));
  FDRE #(
    .INIT(1'b0)) 
    \g_reg[9] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\g[9]_i_1_n_0 ),
        .D(p_0_in__2[9]),
        .Q(\g_reg_n_0_[9] ),
        .R(calc_sidevar_cntr));
  FDRE #(
    .INIT(1'b0)) 
    \groups_reg[2] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\half[8]_i_2_n_0 ),
        .D(DSP2_n_24),
        .Q(groups[2]),
        .R(p_17_in));
  FDRE #(
    .INIT(1'b0)) 
    \groups_reg[8] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\half[8]_i_2_n_0 ),
        .D(DSP2_n_18),
        .Q(groups[8]),
        .R(p_17_in));
  LUT1 #(
    .INIT(2'h1)) 
    \h[0]_i_1 
       (.I0(p_reg0),
        .O(p_0_in__3[0]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \h[1]_i_1 
       (.I0(h_reg[1]),
        .I1(p_reg0),
        .O(p_0_in__3[1]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \h[2]_i_1 
       (.I0(h_reg[2]),
        .I1(h_reg[1]),
        .I2(p_reg0),
        .O(p_0_in__3[2]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \h[3]_i_1 
       (.I0(h_reg[3]),
        .I1(h_reg[2]),
        .I2(h_reg[1]),
        .I3(p_reg0),
        .O(\h[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \h[4]_i_1 
       (.I0(h_reg[4]),
        .I1(h_reg[3]),
        .I2(p_reg0),
        .I3(h_reg[1]),
        .I4(h_reg[2]),
        .O(\h[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \h[5]_i_1 
       (.I0(h_reg[5]),
        .I1(h_reg[3]),
        .I2(p_reg0),
        .I3(h_reg[1]),
        .I4(h_reg[2]),
        .I5(h_reg[4]),
        .O(p_0_in__3[5]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \h[6]_i_1 
       (.I0(h_reg[6]),
        .I1(\h[9]_i_5_n_0 ),
        .O(p_0_in__3[6]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hA6)) 
    \h[7]_i_1 
       (.I0(h_reg[7]),
        .I1(h_reg[6]),
        .I2(\h[9]_i_5_n_0 ),
        .O(\h[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'h9AAA)) 
    \h[8]_i_1 
       (.I0(h_reg[8]),
        .I1(\h[9]_i_5_n_0 ),
        .I2(h_reg[6]),
        .I3(h_reg[7]),
        .O(p_0_in__3[8]));
  LUT5 #(
    .INIT(32'hFFFFFEEE)) 
    \h[9]_i_1 
       (.I0(rstbt_IBUF),
        .I1(\write_cntr_reg[1]_0 ),
        .I2(fft_in_progress),
        .I3(new_stage),
        .I4(\g[9]_i_1_n_0 ),
        .O(\h[9]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h88808888)) 
    \h[9]_i_2 
       (.I0(\write_cntr_reg_n_0_[0] ),
        .I1(\write_cntr_reg_n_0_[1] ),
        .I2(half[9]),
        .I3(half[8]),
        .I4(\h[9]_i_4_n_0 ),
        .O(\h[9]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT5 #(
    .INIT(32'hAA6AAAAA)) 
    \h[9]_i_3 
       (.I0(h_reg[9]),
        .I1(h_reg[7]),
        .I2(h_reg[6]),
        .I3(\h[9]_i_5_n_0 ),
        .I4(h_reg[8]),
        .O(p_0_in__3[9]));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \h[9]_i_4 
       (.I0(\h[9]_i_6_n_0 ),
        .I1(half[5]),
        .I2(half[4]),
        .I3(groups[8]),
        .I4(half[0]),
        .I5(\h[9]_i_7_n_0 ),
        .O(\h[9]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \h[9]_i_5 
       (.I0(h_reg[4]),
        .I1(h_reg[2]),
        .I2(h_reg[1]),
        .I3(p_reg0),
        .I4(h_reg[3]),
        .I5(h_reg[5]),
        .O(\h[9]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \h[9]_i_6 
       (.I0(half[6]),
        .I1(groups[2]),
        .O(\h[9]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \h[9]_i_7 
       (.I0(half[3]),
        .I1(half[2]),
        .O(\h[9]_i_7_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_reg[0] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\h[9]_i_2_n_0 ),
        .D(p_0_in__3[0]),
        .Q(p_reg0),
        .R(\h[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_reg[1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\h[9]_i_2_n_0 ),
        .D(p_0_in__3[1]),
        .Q(h_reg[1]),
        .R(\h[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_reg[2] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\h[9]_i_2_n_0 ),
        .D(p_0_in__3[2]),
        .Q(h_reg[2]),
        .R(\h[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_reg[3] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\h[9]_i_2_n_0 ),
        .D(\h[3]_i_1_n_0 ),
        .Q(h_reg[3]),
        .R(\h[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_reg[4] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\h[9]_i_2_n_0 ),
        .D(\h[4]_i_1_n_0 ),
        .Q(h_reg[4]),
        .R(\h[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_reg[5] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\h[9]_i_2_n_0 ),
        .D(p_0_in__3[5]),
        .Q(h_reg[5]),
        .R(\h[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_reg[6] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\h[9]_i_2_n_0 ),
        .D(p_0_in__3[6]),
        .Q(h_reg[6]),
        .R(\h[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_reg[7] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\h[9]_i_2_n_0 ),
        .D(\h[7]_i_1_n_0 ),
        .Q(h_reg[7]),
        .R(\h[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_reg[8] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\h[9]_i_2_n_0 ),
        .D(p_0_in__3[8]),
        .Q(h_reg[8]),
        .R(\h[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_reg[9] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\h[9]_i_2_n_0 ),
        .D(p_0_in__3[9]),
        .Q(h_reg[9]),
        .R(\h[9]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \half[0]_i_1 
       (.I0(stage_cntr_reg[3]),
        .I1(stage_cntr_reg[2]),
        .I2(stage_cntr_reg[1]),
        .I3(stage_cntr_reg[0]),
        .O(\half[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \half[8]_i_1 
       (.I0(rstbt_IBUF),
        .I1(\write_cntr_reg[1]_0 ),
        .O(p_17_in));
  LUT2 #(
    .INIT(4'h8)) 
    \half[8]_i_2 
       (.I0(fft_in_progress),
        .I1(new_stage),
        .O(\half[8]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \half_reg[0] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\half[8]_i_2_n_0 ),
        .D(\half[0]_i_1_n_0 ),
        .Q(half[0]),
        .R(p_17_in));
  FDRE #(
    .INIT(1'b0)) 
    \half_reg[2] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\half[8]_i_2_n_0 ),
        .D(DSP2_n_19),
        .Q(half[2]),
        .R(p_17_in));
  FDRE #(
    .INIT(1'b0)) 
    \half_reg[3] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\half[8]_i_2_n_0 ),
        .D(DSP2_n_20),
        .Q(half[3]),
        .R(p_17_in));
  FDRE #(
    .INIT(1'b0)) 
    \half_reg[4] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\half[8]_i_2_n_0 ),
        .D(DSP2_n_21),
        .Q(half[4]),
        .R(p_17_in));
  FDRE #(
    .INIT(1'b0)) 
    \half_reg[5] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\half[8]_i_2_n_0 ),
        .D(DSP2_n_22),
        .Q(half[5]),
        .R(p_17_in));
  FDRE #(
    .INIT(1'b0)) 
    \half_reg[6] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\half[8]_i_2_n_0 ),
        .D(DSP2_n_23),
        .Q(half[6]),
        .R(p_17_in));
  FDRE #(
    .INIT(1'b0)) 
    \half_reg[8] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\half[8]_i_2_n_0 ),
        .D(DSP2_n_25),
        .Q(half[8]),
        .R(p_17_in));
  FDRE #(
    .INIT(1'b0)) 
    \half_reg[9] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\half[8]_i_2_n_0 ),
        .D(DSP2_n_26),
        .Q(half[9]),
        .R(p_17_in));
  LUT5 #(
    .INIT(32'hFFFFFFEF)) 
    i__carry__0_i_1
       (.I0(half[9]),
        .I1(half[8]),
        .I2(i__carry_i_5_n_0),
        .I3(groups[2]),
        .I4(half[6]),
        .O(i__carry__0_i_1_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFEF)) 
    i__carry__0_i_2
       (.I0(half[9]),
        .I1(half[8]),
        .I2(i__carry_i_5_n_0),
        .I3(groups[2]),
        .I4(half[6]),
        .O(i__carry__0_i_2_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFEF)) 
    i__carry__0_i_3
       (.I0(half[9]),
        .I1(half[8]),
        .I2(i__carry_i_5_n_0),
        .I3(groups[2]),
        .I4(half[6]),
        .O(i__carry__0_i_3_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFEF)) 
    i__carry__0_i_4
       (.I0(half[9]),
        .I1(half[8]),
        .I2(i__carry_i_5_n_0),
        .I3(groups[2]),
        .I4(half[6]),
        .O(i__carry__0_i_4_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFEF)) 
    i__carry__1_i_1
       (.I0(half[9]),
        .I1(half[8]),
        .I2(i__carry_i_5_n_0),
        .I3(groups[2]),
        .I4(half[6]),
        .O(i__carry__1_i_1_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFEF)) 
    i__carry__1_i_2
       (.I0(half[9]),
        .I1(half[8]),
        .I2(i__carry_i_5_n_0),
        .I3(groups[2]),
        .I4(half[6]),
        .O(i__carry__1_i_2_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFEF)) 
    i__carry__1_i_3
       (.I0(half[9]),
        .I1(half[8]),
        .I2(i__carry_i_5_n_0),
        .I3(groups[2]),
        .I4(half[6]),
        .O(i__carry__1_i_3_n_0));
  LUT6 #(
    .INIT(64'h9999999999929999)) 
    i__carry_i_1
       (.I0(half[9]),
        .I1(h_reg[9]),
        .I2(half[6]),
        .I3(groups[2]),
        .I4(i__carry_i_5_n_0),
        .I5(half[8]),
        .O(i__carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h0069)) 
    i__carry_i_2
       (.I0(half[6]),
        .I1(i__carry_i_5_n_0),
        .I2(h_reg[6]),
        .I3(i__carry_i_6_n_0),
        .O(i__carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h0900000900090600)) 
    i__carry_i_3
       (.I0(half[5]),
        .I1(h_reg[5]),
        .I2(i__carry_i_7_n_0),
        .I3(h_reg[4]),
        .I4(i__carry_i_8_n_0),
        .I5(half[4]),
        .O(i__carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000096090090000)) 
    i__carry_i_4
       (.I0(half[2]),
        .I1(h_reg[2]),
        .I2(h_reg[1]),
        .I3(groups[8]),
        .I4(half[0]),
        .I5(p_reg0),
        .O(i__carry_i_4_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    i__carry_i_5
       (.I0(half[0]),
        .I1(groups[8]),
        .I2(half[3]),
        .I3(half[2]),
        .I4(half[4]),
        .I5(half[5]),
        .O(i__carry_i_5_n_0));
  LUT6 #(
    .INIT(64'h6F6FF96FF6F66FF6)) 
    i__carry_i_6
       (.I0(half[8]),
        .I1(h_reg[8]),
        .I2(groups[2]),
        .I3(i__carry_i_5_n_0),
        .I4(half[6]),
        .I5(h_reg[7]),
        .O(i__carry_i_6_n_0));
  LUT5 #(
    .INIT(32'h5556AAA9)) 
    i__carry_i_7
       (.I0(h_reg[3]),
        .I1(half[2]),
        .I2(groups[8]),
        .I3(half[0]),
        .I4(half[3]),
        .O(i__carry_i_7_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    i__carry_i_8
       (.I0(half[2]),
        .I1(half[3]),
        .I2(groups[8]),
        .I3(half[0]),
        .O(i__carry_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 index_2_carry
       (.CI(1'b0),
        .CO({index_2_carry_n_0,NLW_index_2_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI(P[3:0]),
        .O({index_2_carry_n_4,index_2_carry_n_5,index_2_carry_n_6,index_2_carry_n_7}),
        .S({DSP1_n_42,DSP1_n_43,DSP1_n_44,DSP1_n_45}));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 index_2_carry__0
       (.CI(index_2_carry_n_0),
        .CO({index_2_carry__0_n_0,NLW_index_2_carry__0_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI(P[7:4]),
        .O({index_2_carry__0_n_4,index_2_carry__0_n_5,index_2_carry__0_n_6,index_2_carry__0_n_7}),
        .S({DSP1_n_46,DSP1_n_47,DSP1_n_48,DSP1_n_49}));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 index_2_carry__1
       (.CI(index_2_carry__0_n_0),
        .CO(NLW_index_2_carry__1_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,P[8]}),
        .O({NLW_index_2_carry__1_O_UNCONNECTED[3:2],index_2_carry__1_n_6,index_2_carry__1_n_7}),
        .S({1'b0,1'b0,DSP1_n_50,DSP1_n_51}));
  smpl_ram__parameterized0 \inst[0].smpl_ram_inst 
       (.Q(ram_3_imag_addr_a_reg),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG),
        .din_a_i(din_a_i[23:0]),
        .pwropt(pwropt),
        .pwropt_1(pwropt_1),
        .pwropt_2(pwropt_2),
        .pwropt_3(pwropt_3),
        .pwropt_4(pwropt_4),
        .ram_array_reg_0(ram_array_reg_0),
        .ram_array_reg_1(Q),
        .ram_array_reg_2(\write_cntr_reg_n_0_[0] ),
        .ram_array_reg_3(\write_cntr_reg_n_0_[1] ),
        .ram_array_reg_4(\mem_dest_reg[1]_rep_n_0 ),
        .ram_array_reg_5(\mem_dest_reg[0]_rep_n_0 ),
        .we_11(we_11));
  smpl_ram__parameterized0_4 \inst[1].smpl_ram_inst 
       (.Q(ram_3_imag_addr_a_reg),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG),
        .din_a_i(din_a_i[47:24]),
        .pwropt(pwropt_2),
        .pwropt_1(pwropt_3),
        .pwropt_2(pwropt_4),
        .ram_array_reg_0(ram_array_reg),
        .ram_array_reg_1(Q),
        .we_11(we_11));
  smpl_ram__parameterized0_5 \inst[2].smpl_ram_inst 
       (.A(x1_imag_reg),
        .DOADO(dout_b_i_96),
        .Q(ram_2_imag_addr_a_reg),
        .WEA(we_01),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG),
        .din_a_i(din_a_i[71:48]),
        .ram_array_reg_0(\write_cntr_reg_n_0_[1] ),
        .ram_array_reg_1(\mem_dest_reg_n_0_[1] ),
        .ram_array_reg_2(\mem_dest_reg_n_0_[0] ),
        .write_cntr_0_delay(write_cntr_0_delay),
        .write_cntr_0_posedge(write_cntr_0_posedge),
        .write_cntr_0_posedge_delay_reg(\write_cntr_reg_n_0_[0] ));
  smpl_ram__parameterized0_6 \inst[3].smpl_ram_inst 
       (.D(x1_real_reg),
        .DOADO(dout_b_i_120),
        .Q(ram_2_imag_addr_a_reg),
        .WEA(we_01),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG),
        .din_a_i(din_a_i[95:72]),
        .p_reg_reg(\mem_dest_reg_n_0_[1] ),
        .p_reg_reg_0(\mem_dest_reg_n_0_[0] ));
  smpl_ram__parameterized0_7 \inst[4].smpl_ram_inst 
       (.DOADO(dout_b_i_96),
        .Q(ram_1_imag_addr_b_reg),
        .WEA(we_10),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG),
        .din_b_i(din_b_i[119:96]),
        .ram_array_reg_0(\write_cntr_reg_n_0_[0] ),
        .ram_array_reg_1(\write_cntr_reg_n_0_[1] ),
        .ram_array_reg_2(\mem_dest_reg_n_0_[0] ),
        .ram_array_reg_3(\mem_dest_reg_n_0_[1] ));
  smpl_ram__parameterized0_8 \inst[5].smpl_ram_inst 
       (.DOADO(dout_b_i_120),
        .DOBDO(DOBDO),
        .Q(ram_1_imag_addr_b_reg),
        .WEA(we_10),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG),
        .din_b_i(din_b_i[143:120]),
        .loading_samples(loading_samples),
        .ram_array_reg_0(cb_addr_cntr_delay));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT2 #(
    .INIT(4'h1)) 
    loading_done_i_1
       (.I0(loading_done_i_2_n_0),
        .I1(loading_samples),
        .O(loading_done_i_1_n_0));
  LUT5 #(
    .INIT(32'hFFFF7FFF)) 
    loading_done_i_2
       (.I0(ADDRBWRADDR[2]),
        .I1(ADDRBWRADDR[1]),
        .I2(ADDRBWRADDR[0]),
        .I3(ADDRBWRADDR[3]),
        .I4(loading_done_i_3_n_0),
        .O(loading_done_i_2_n_0));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    loading_done_i_3
       (.I0(ADDRBWRADDR[6]),
        .I1(ADDRBWRADDR[5]),
        .I2(ADDRBWRADDR[4]),
        .I3(ADDRBWRADDR[9]),
        .I4(ADDRBWRADDR[7]),
        .I5(ADDRBWRADDR[8]),
        .O(loading_done_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    loading_done_reg
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(loading_done_i_1_n_0),
        .Q(loading_done),
        .R(clear));
  LUT4 #(
    .INIT(16'h00A8)) 
    loading_samples_i_1
       (.I0(loading_done_i_2_n_0),
        .I1(\write_cntr_reg[1]_0 ),
        .I2(loading_samples),
        .I3(rstbt_IBUF),
        .O(loading_samples_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    loading_samples_reg
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(loading_samples_i_1_n_0),
        .Q(loading_samples),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h5554444501044444)) 
    \mem_dest[0]_i_1 
       (.I0(rstbt_IBUF),
        .I1(stage_cntr_reg[0]),
        .I2(stage_cntr_reg[2]),
        .I3(stage_cntr_reg[1]),
        .I4(stage_cntr_reg[3]),
        .I5(\mem_dest_reg[0]_rep_n_0 ),
        .O(\mem_dest[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5554444501044444)) 
    \mem_dest[0]_rep_i_1 
       (.I0(rstbt_IBUF),
        .I1(stage_cntr_reg[0]),
        .I2(stage_cntr_reg[2]),
        .I3(stage_cntr_reg[1]),
        .I4(stage_cntr_reg[3]),
        .I5(\mem_dest_reg[0]_rep_n_0 ),
        .O(\mem_dest[0]_rep_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5551111101011110)) 
    \mem_dest[1]_i_1 
       (.I0(rstbt_IBUF),
        .I1(stage_cntr_reg[0]),
        .I2(stage_cntr_reg[2]),
        .I3(stage_cntr_reg[1]),
        .I4(stage_cntr_reg[3]),
        .I5(\mem_dest_reg[1]_rep_n_0 ),
        .O(\mem_dest[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5551111101011110)) 
    \mem_dest[1]_rep_i_1 
       (.I0(rstbt_IBUF),
        .I1(stage_cntr_reg[0]),
        .I2(stage_cntr_reg[2]),
        .I3(stage_cntr_reg[1]),
        .I4(stage_cntr_reg[3]),
        .I5(\mem_dest_reg[1]_rep_n_0 ),
        .O(\mem_dest[1]_rep_i_1_n_0 ));
  (* ORIG_CELL_NAME = "mem_dest_reg[0]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_dest_reg[0] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\mem_dest[0]_i_1_n_0 ),
        .Q(\mem_dest_reg_n_0_[0] ),
        .R(1'b0));
  (* ORIG_CELL_NAME = "mem_dest_reg[0]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_dest_reg[0]_rep 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\mem_dest[0]_rep_i_1_n_0 ),
        .Q(\mem_dest_reg[0]_rep_n_0 ),
        .R(1'b0));
  (* ORIG_CELL_NAME = "mem_dest_reg[1]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_dest_reg[1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\mem_dest[1]_i_1_n_0 ),
        .Q(\mem_dest_reg_n_0_[1] ),
        .R(1'b0));
  (* ORIG_CELL_NAME = "mem_dest_reg[1]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_dest_reg[1]_rep 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\mem_dest[1]_rep_i_1_n_0 ),
        .Q(\mem_dest_reg[1]_rep_n_0 ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h00000000BAAAAAAA)) 
    new_stage_i_1
       (.I0(loading_done),
        .I1(DSP2_n_27),
        .I2(\g[9]_i_3_n_0 ),
        .I3(fft_in_progress21_out),
        .I4(fft_in_progress2),
        .I5(new_stage),
        .O(new_stage_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    new_stage_reg
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(new_stage_i_1_n_0),
        .Q(new_stage),
        .R(rstbt_IBUF));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ram_1_real_addr_b_reg_reg[0] 
       (.CLR(1'b0),
        .D(ram_1_imag_addr_b_reg__0[0]),
        .G(ram_1_real_addr_b_reg),
        .GE(1'b1),
        .Q(ram_1_imag_addr_b_reg[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ram_1_real_addr_b_reg_reg[1] 
       (.CLR(1'b0),
        .D(ram_1_imag_addr_b_reg__0[1]),
        .G(ram_1_real_addr_b_reg),
        .GE(1'b1),
        .Q(ram_1_imag_addr_b_reg[1]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ram_1_real_addr_b_reg_reg[2] 
       (.CLR(1'b0),
        .D(ram_1_imag_addr_b_reg__0[2]),
        .G(ram_1_real_addr_b_reg),
        .GE(1'b1),
        .Q(ram_1_imag_addr_b_reg[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ram_1_real_addr_b_reg_reg[3] 
       (.CLR(1'b0),
        .D(ram_1_imag_addr_b_reg__0[3]),
        .G(ram_1_real_addr_b_reg),
        .GE(1'b1),
        .Q(ram_1_imag_addr_b_reg[3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ram_1_real_addr_b_reg_reg[4] 
       (.CLR(1'b0),
        .D(ram_1_imag_addr_b_reg__0[4]),
        .G(ram_1_real_addr_b_reg),
        .GE(1'b1),
        .Q(ram_1_imag_addr_b_reg[4]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ram_1_real_addr_b_reg_reg[5] 
       (.CLR(1'b0),
        .D(ram_1_imag_addr_b_reg__0[5]),
        .G(ram_1_real_addr_b_reg),
        .GE(1'b1),
        .Q(ram_1_imag_addr_b_reg[5]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ram_1_real_addr_b_reg_reg[6] 
       (.CLR(1'b0),
        .D(ram_1_imag_addr_b_reg__0[6]),
        .G(ram_1_real_addr_b_reg),
        .GE(1'b1),
        .Q(ram_1_imag_addr_b_reg[6]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ram_1_real_addr_b_reg_reg[7] 
       (.CLR(1'b0),
        .D(ram_1_imag_addr_b_reg__0[7]),
        .G(ram_1_real_addr_b_reg),
        .GE(1'b1),
        .Q(ram_1_imag_addr_b_reg[7]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ram_1_real_addr_b_reg_reg[8] 
       (.CLR(1'b0),
        .D(ram_1_imag_addr_b_reg__0[8]),
        .G(ram_1_real_addr_b_reg),
        .GE(1'b1),
        .Q(ram_1_imag_addr_b_reg[8]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ram_1_real_addr_b_reg_reg[9] 
       (.CLR(1'b0),
        .D(ram_1_imag_addr_b_reg__0[9]),
        .G(ram_1_real_addr_b_reg),
        .GE(1'b1),
        .Q(ram_1_imag_addr_b_reg[9]));
  LUT6 #(
    .INIT(64'h0000099066660000)) 
    \ram_1_real_addr_b_reg_reg[9]_i_2 
       (.I0(\read_cntr_reg_n_0_[0] ),
        .I1(p_0_in13_in),
        .I2(\write_cntr_reg_n_0_[0] ),
        .I3(\write_cntr_reg_n_0_[1] ),
        .I4(\mem_dest_reg_n_0_[0] ),
        .I5(\mem_dest_reg_n_0_[1] ),
        .O(ram_1_real_addr_b_reg));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ram_2_real_addr_a_reg_reg[0] 
       (.CLR(1'b0),
        .D(DSP1_n_31),
        .G(\ram_2_real_addr_a_reg_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(ram_2_imag_addr_a_reg[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ram_2_real_addr_a_reg_reg[1] 
       (.CLR(1'b0),
        .D(DSP1_n_30),
        .G(\ram_2_real_addr_a_reg_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(ram_2_imag_addr_a_reg[1]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ram_2_real_addr_a_reg_reg[2] 
       (.CLR(1'b0),
        .D(DSP1_n_29),
        .G(\ram_2_real_addr_a_reg_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(ram_2_imag_addr_a_reg[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ram_2_real_addr_a_reg_reg[3] 
       (.CLR(1'b0),
        .D(DSP1_n_28),
        .G(\ram_2_real_addr_a_reg_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(ram_2_imag_addr_a_reg[3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ram_2_real_addr_a_reg_reg[4] 
       (.CLR(1'b0),
        .D(DSP1_n_27),
        .G(\ram_2_real_addr_a_reg_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(ram_2_imag_addr_a_reg[4]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ram_2_real_addr_a_reg_reg[5] 
       (.CLR(1'b0),
        .D(DSP1_n_26),
        .G(\ram_2_real_addr_a_reg_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(ram_2_imag_addr_a_reg[5]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ram_2_real_addr_a_reg_reg[6] 
       (.CLR(1'b0),
        .D(DSP1_n_25),
        .G(\ram_2_real_addr_a_reg_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(ram_2_imag_addr_a_reg[6]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ram_2_real_addr_a_reg_reg[7] 
       (.CLR(1'b0),
        .D(DSP1_n_24),
        .G(\ram_2_real_addr_a_reg_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(ram_2_imag_addr_a_reg[7]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ram_2_real_addr_a_reg_reg[8] 
       (.CLR(1'b0),
        .D(DSP1_n_23),
        .G(\ram_2_real_addr_a_reg_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(ram_2_imag_addr_a_reg[8]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ram_2_real_addr_a_reg_reg[9] 
       (.CLR(1'b0),
        .D(DSP1_n_22),
        .G(\ram_2_real_addr_a_reg_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(ram_2_imag_addr_a_reg[9]));
  LUT6 #(
    .INIT(64'h6666099066660000)) 
    \ram_2_real_addr_a_reg_reg[9]_i_2 
       (.I0(\read_cntr_reg_n_0_[0] ),
        .I1(p_0_in13_in),
        .I2(\write_cntr_reg_n_0_[0] ),
        .I3(\write_cntr_reg_n_0_[1] ),
        .I4(\mem_dest_reg_n_0_[1] ),
        .I5(\mem_dest_reg_n_0_[0] ),
        .O(\ram_2_real_addr_a_reg_reg[9]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ram_2_real_addr_a_reg_reg[9]_i_3 
       (.I0(\mem_dest_reg_n_0_[0] ),
        .I1(\mem_dest_reg_n_0_[1] ),
        .O(\ram_2_real_addr_a_reg_reg[9]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ram_2_real_addr_a_reg_reg[9]_i_4 
       (.I0(\read_cntr_reg_n_0_[0] ),
        .I1(p_0_in13_in),
        .O(\ram_2_real_addr_a_reg_reg[9]_i_4_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ram_3_real_addr_a_reg_reg[0] 
       (.CLR(1'b0),
        .D(ram_3_imag_addr_a_reg__0[0]),
        .G(\ram_3_real_addr_a_reg_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(ram_3_imag_addr_a_reg[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ram_3_real_addr_a_reg_reg[1] 
       (.CLR(1'b0),
        .D(ram_3_imag_addr_a_reg__0[1]),
        .G(\ram_3_real_addr_a_reg_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(ram_3_imag_addr_a_reg[1]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ram_3_real_addr_a_reg_reg[2] 
       (.CLR(1'b0),
        .D(ram_3_imag_addr_a_reg__0[2]),
        .G(\ram_3_real_addr_a_reg_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(ram_3_imag_addr_a_reg[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ram_3_real_addr_a_reg_reg[3] 
       (.CLR(1'b0),
        .D(ram_3_imag_addr_a_reg__0[3]),
        .G(\ram_3_real_addr_a_reg_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(ram_3_imag_addr_a_reg[3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ram_3_real_addr_a_reg_reg[4] 
       (.CLR(1'b0),
        .D(ram_3_imag_addr_a_reg__0[4]),
        .G(\ram_3_real_addr_a_reg_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(ram_3_imag_addr_a_reg[4]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ram_3_real_addr_a_reg_reg[5] 
       (.CLR(1'b0),
        .D(ram_3_imag_addr_a_reg__0[5]),
        .G(\ram_3_real_addr_a_reg_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(ram_3_imag_addr_a_reg[5]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ram_3_real_addr_a_reg_reg[6] 
       (.CLR(1'b0),
        .D(ram_3_imag_addr_a_reg__0[6]),
        .G(\ram_3_real_addr_a_reg_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(ram_3_imag_addr_a_reg[6]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ram_3_real_addr_a_reg_reg[7] 
       (.CLR(1'b0),
        .D(ram_3_imag_addr_a_reg__0[7]),
        .G(\ram_3_real_addr_a_reg_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(ram_3_imag_addr_a_reg[7]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ram_3_real_addr_a_reg_reg[8] 
       (.CLR(1'b0),
        .D(ram_3_imag_addr_a_reg__0[8]),
        .G(\ram_3_real_addr_a_reg_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(ram_3_imag_addr_a_reg[8]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ram_3_real_addr_a_reg_reg[9] 
       (.CLR(1'b0),
        .D(ram_3_imag_addr_a_reg__0[9]),
        .G(\ram_3_real_addr_a_reg_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(ram_3_imag_addr_a_reg[9]));
  LUT6 #(
    .INIT(64'h0880000000000880)) 
    \ram_3_real_addr_a_reg_reg[9]_i_2 
       (.I0(\mem_dest_reg[0]_rep_n_0 ),
        .I1(\mem_dest_reg[1]_rep_n_0 ),
        .I2(\write_cntr_reg_n_0_[1] ),
        .I3(\write_cntr_reg_n_0_[0] ),
        .I4(p_0_in13_in),
        .I5(\read_cntr_reg_n_0_[0] ),
        .O(\ram_3_real_addr_a_reg_reg[9]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT5 #(
    .INIT(32'h00000026)) 
    \read_cntr[0]_i_1 
       (.I0(\read_cntr[1]_i_2_n_0 ),
        .I1(\read_cntr_reg_n_0_[0] ),
        .I2(p_0_in13_in),
        .I3(rstbt_IBUF),
        .I4(\write_cntr_reg[1]_0 ),
        .O(\read_cntr[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT5 #(
    .INIT(32'h00000038)) 
    \read_cntr[1]_i_1 
       (.I0(\read_cntr[1]_i_2_n_0 ),
        .I1(\read_cntr_reg_n_0_[0] ),
        .I2(p_0_in13_in),
        .I3(rstbt_IBUF),
        .I4(\write_cntr_reg[1]_0 ),
        .O(\read_cntr[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF000800000008)) 
    \read_cntr[1]_i_2 
       (.I0(\calc_index_cntr_reg_n_0_[2] ),
        .I1(\calc_index_cntr_reg_n_0_[3] ),
        .I2(\calc_index_cntr_reg_n_0_[1] ),
        .I3(\calc_index_cntr_reg_n_0_[0] ),
        .I4(\read_cntr[1]_i_3_n_0 ),
        .I5(read_cntr_2_daly_reg_n_0),
        .O(\read_cntr[1]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \read_cntr[1]_i_3 
       (.I0(p_0_in13_in),
        .I1(\read_cntr_reg_n_0_[0] ),
        .O(\read_cntr[1]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    read_cntr_0_delay_reg
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\read_cntr_reg_n_0_[0] ),
        .Q(read_cntr_0_delay),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    read_cntr_0_posedge_delay_i_1
       (.I0(\read_cntr_reg_n_0_[0] ),
        .I1(read_cntr_0_delay),
        .O(read_cntr_0_posedge));
  FDRE #(
    .INIT(1'b0)) 
    read_cntr_0_posedge_delay_reg
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(read_cntr_0_posedge),
        .Q(read_cntr_0_posedge_delay),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    read_cntr_1_delay_reg
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(p_0_in13_in),
        .Q(read_cntr_1_delay),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    read_cntr_1_posedge_delay_i_1
       (.I0(p_0_in13_in),
        .I1(read_cntr_1_delay),
        .O(read_cntr_1_posedge));
  FDRE #(
    .INIT(1'b0)) 
    read_cntr_1_posedge_delay_reg
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(read_cntr_1_posedge),
        .Q(read_cntr_1_posedge_delay),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hAAAAAA9A)) 
    read_cntr_2_daly_i_1
       (.I0(read_cntr_2_daly_reg_n_0),
        .I1(\read_cntr_reg_n_0_[0] ),
        .I2(p_0_in13_in),
        .I3(rstbt_IBUF),
        .I4(\write_cntr_reg[1]_0 ),
        .O(read_cntr_2_daly_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    read_cntr_2_daly_reg
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(read_cntr_2_daly_i_1_n_0),
        .Q(read_cntr_2_daly_reg_n_0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \read_cntr_reg[0] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\read_cntr[0]_i_1_n_0 ),
        .Q(\read_cntr_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \read_cntr_reg[1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\read_cntr[1]_i_1_n_0 ),
        .Q(p_0_in13_in),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00545400)) 
    read_cycle_done_i_1
       (.I0(read_cycle_done_reg_n_0),
        .I1(read_cntr_0_posedge_delay),
        .I2(read_cntr_1_posedge_delay),
        .I3(\read_cntr_reg_n_0_[0] ),
        .I4(p_0_in13_in),
        .O(read_cycle_done_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    read_cycle_done_reg
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(read_cycle_done_i_1_n_0),
        .Q(read_cycle_done_reg_n_0),
        .R(1'b0));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \rom_real_addr_reg_reg[0] 
       (.CLR(1'b0),
        .D(rom_imag_addr_reg__0[0]),
        .G(\rom_real_addr_reg_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(rom_imag_addr_reg[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \rom_real_addr_reg_reg[1] 
       (.CLR(1'b0),
        .D(rom_imag_addr_reg__0[1]),
        .G(\rom_real_addr_reg_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(rom_imag_addr_reg[1]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \rom_real_addr_reg_reg[2] 
       (.CLR(1'b0),
        .D(rom_imag_addr_reg__0[2]),
        .G(\rom_real_addr_reg_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(rom_imag_addr_reg[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \rom_real_addr_reg_reg[3] 
       (.CLR(1'b0),
        .D(rom_imag_addr_reg__0[3]),
        .G(\rom_real_addr_reg_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(rom_imag_addr_reg[3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \rom_real_addr_reg_reg[4] 
       (.CLR(1'b0),
        .D(rom_imag_addr_reg__0[4]),
        .G(\rom_real_addr_reg_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(rom_imag_addr_reg[4]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \rom_real_addr_reg_reg[5] 
       (.CLR(1'b0),
        .D(rom_imag_addr_reg__0[5]),
        .G(\rom_real_addr_reg_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(rom_imag_addr_reg[5]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \rom_real_addr_reg_reg[6] 
       (.CLR(1'b0),
        .D(rom_imag_addr_reg__0[6]),
        .G(\rom_real_addr_reg_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(rom_imag_addr_reg[6]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \rom_real_addr_reg_reg[7] 
       (.CLR(1'b0),
        .D(rom_imag_addr_reg__0[7]),
        .G(\rom_real_addr_reg_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(rom_imag_addr_reg[7]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \rom_real_addr_reg_reg[8] 
       (.CLR(1'b0),
        .D(rom_imag_addr_reg__0[8]),
        .G(\rom_real_addr_reg_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(rom_imag_addr_reg[8]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \rom_real_addr_reg_reg[9] 
       (.CLR(1'b0),
        .D(rom_imag_addr_reg__0[9]),
        .G(\rom_real_addr_reg_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(rom_imag_addr_reg[9]));
  LUT4 #(
    .INIT(16'h0EE0)) 
    \rom_real_addr_reg_reg[9]_i_2 
       (.I0(\mem_dest_reg_n_0_[0] ),
        .I1(\mem_dest_reg_n_0_[1] ),
        .I2(\read_cntr_reg_n_0_[0] ),
        .I3(p_0_in13_in),
        .O(\rom_real_addr_reg_reg[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    sidevars_done_i_1
       (.I0(sidevars_done),
        .I1(\calc_sidevar_cntr_reg_n_0_[1] ),
        .I2(\calc_sidevar_cntr_reg_n_0_[0] ),
        .I3(sidevars_done_i_2_n_0),
        .I4(\write_cntr_reg[1]_0 ),
        .I5(rstbt_IBUF),
        .O(sidevars_done_i_1_n_0));
  LUT3 #(
    .INIT(8'hBF)) 
    sidevars_done_i_2
       (.I0(\calc_sidevar_cntr_reg_n_0_[3] ),
        .I1(\calc_sidevar_cntr_reg_n_0_[4] ),
        .I2(\calc_sidevar_cntr_reg_n_0_[2] ),
        .O(sidevars_done_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sidevars_done_reg
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(sidevars_done_i_1_n_0),
        .Q(sidevars_done),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \stage_cntr[0]_i_1 
       (.I0(stage_cntr_reg[0]),
        .O(p_0_in__1[0]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \stage_cntr[1]_i_1 
       (.I0(stage_cntr_reg[1]),
        .I1(stage_cntr_reg[0]),
        .O(p_0_in__1[1]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \stage_cntr[2]_i_1 
       (.I0(stage_cntr_reg[2]),
        .I1(stage_cntr_reg[0]),
        .I2(stage_cntr_reg[1]),
        .O(p_0_in__1[2]));
  LUT2 #(
    .INIT(4'hB)) 
    \stage_cntr[3]_i_1 
       (.I0(rstbt_IBUF),
        .I1(fft_in_progress),
        .O(\stage_cntr[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \stage_cntr[3]_i_2 
       (.I0(stage_cntr_reg[2]),
        .I1(stage_cntr_reg[0]),
        .I2(stage_cntr_reg[1]),
        .I3(stage_cntr_reg[3]),
        .O(p_0_in__1[3]));
  FDRE #(
    .INIT(1'b0)) 
    \stage_cntr_reg[0] 
       (.C(clk100M_IBUF_BUFG),
        .CE(new_stage),
        .D(p_0_in__1[0]),
        .Q(stage_cntr_reg[0]),
        .R(\stage_cntr[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \stage_cntr_reg[1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(new_stage),
        .D(p_0_in__1[1]),
        .Q(stage_cntr_reg[1]),
        .R(\stage_cntr[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \stage_cntr_reg[2] 
       (.C(clk100M_IBUF_BUFG),
        .CE(new_stage),
        .D(p_0_in__1[2]),
        .Q(stage_cntr_reg[2]),
        .R(\stage_cntr[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \stage_cntr_reg[3] 
       (.C(clk100M_IBUF_BUFG),
        .CE(new_stage),
        .D(p_0_in__1[3]),
        .Q(stage_cntr_reg[3]),
        .R(\stage_cntr[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w1_imag_buff_reg[0] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x1_real_buff),
        .D(dout_reg__0[0]),
        .Q(w1_imag_buff[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w1_imag_buff_reg[10] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x1_real_buff),
        .D(dout_reg__0[10]),
        .Q(w1_imag_buff[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w1_imag_buff_reg[11] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x1_real_buff),
        .D(dout_reg__0[11]),
        .Q(w1_imag_buff[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w1_imag_buff_reg[12] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x1_real_buff),
        .D(dout_reg__0[12]),
        .Q(w1_imag_buff[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w1_imag_buff_reg[13] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x1_real_buff),
        .D(dout_reg__0[13]),
        .Q(w1_imag_buff[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w1_imag_buff_reg[14] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x1_real_buff),
        .D(dout_reg__0[14]),
        .Q(w1_imag_buff[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w1_imag_buff_reg[15] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x1_real_buff),
        .D(dout_reg__0[15]),
        .Q(w1_imag_buff[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w1_imag_buff_reg[17] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x1_real_buff),
        .D(dout_reg__0[16]),
        .Q(w1_imag_buff[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w1_imag_buff_reg[1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x1_real_buff),
        .D(dout_reg__0[1]),
        .Q(w1_imag_buff[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w1_imag_buff_reg[2] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x1_real_buff),
        .D(dout_reg__0[2]),
        .Q(w1_imag_buff[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w1_imag_buff_reg[3] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x1_real_buff),
        .D(dout_reg__0[3]),
        .Q(w1_imag_buff[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w1_imag_buff_reg[4] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x1_real_buff),
        .D(dout_reg__0[4]),
        .Q(w1_imag_buff[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w1_imag_buff_reg[5] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x1_real_buff),
        .D(dout_reg__0[5]),
        .Q(w1_imag_buff[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w1_imag_buff_reg[6] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x1_real_buff),
        .D(dout_reg__0[6]),
        .Q(w1_imag_buff[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w1_imag_buff_reg[7] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x1_real_buff),
        .D(dout_reg__0[7]),
        .Q(w1_imag_buff[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w1_imag_buff_reg[8] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x1_real_buff),
        .D(dout_reg__0[8]),
        .Q(w1_imag_buff[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w1_imag_buff_reg[9] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x1_real_buff),
        .D(dout_reg__0[9]),
        .Q(w1_imag_buff[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w2_imag_buff_reg[0] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(dout_reg__0[0]),
        .Q(w2_imag_buff[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w2_imag_buff_reg[10] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(dout_reg__0[10]),
        .Q(w2_imag_buff[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w2_imag_buff_reg[11] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(dout_reg__0[11]),
        .Q(w2_imag_buff[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w2_imag_buff_reg[12] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(dout_reg__0[12]),
        .Q(w2_imag_buff[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w2_imag_buff_reg[13] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(dout_reg__0[13]),
        .Q(w2_imag_buff[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w2_imag_buff_reg[14] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(dout_reg__0[14]),
        .Q(w2_imag_buff[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w2_imag_buff_reg[15] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(dout_reg__0[15]),
        .Q(w2_imag_buff[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w2_imag_buff_reg[17] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(dout_reg__0[16]),
        .Q(w2_imag_buff[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w2_imag_buff_reg[1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(dout_reg__0[1]),
        .Q(w2_imag_buff[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w2_imag_buff_reg[2] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(dout_reg__0[2]),
        .Q(w2_imag_buff[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w2_imag_buff_reg[3] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(dout_reg__0[3]),
        .Q(w2_imag_buff[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w2_imag_buff_reg[4] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(dout_reg__0[4]),
        .Q(w2_imag_buff[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w2_imag_buff_reg[5] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(dout_reg__0[5]),
        .Q(w2_imag_buff[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w2_imag_buff_reg[6] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(dout_reg__0[6]),
        .Q(w2_imag_buff[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w2_imag_buff_reg[7] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(dout_reg__0[7]),
        .Q(w2_imag_buff[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w2_imag_buff_reg[8] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(dout_reg__0[8]),
        .Q(w2_imag_buff[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w2_imag_buff_reg[9] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(dout_reg__0[9]),
        .Q(w2_imag_buff[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    write_cntr_0_delay_reg
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\write_cntr_reg_n_0_[0] ),
        .Q(write_cntr_0_delay),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    write_cntr_0_posedge_delay_reg
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(write_cntr_0_posedge),
        .Q(write_cntr_0_posedge_delay),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \write_cntr_reg[0] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(btf_n_2),
        .Q(\write_cntr_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \write_cntr_reg[1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(btf_n_3),
        .Q(\write_cntr_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x2_real_buff_reg[0] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(x1_real_reg[0]),
        .Q(x2_real_buff[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x2_real_buff_reg[10] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(x1_real_reg[10]),
        .Q(x2_real_buff[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x2_real_buff_reg[11] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(x1_real_reg[11]),
        .Q(x2_real_buff[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x2_real_buff_reg[12] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(x1_real_reg[12]),
        .Q(x2_real_buff[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x2_real_buff_reg[13] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(x1_real_reg[13]),
        .Q(x2_real_buff[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x2_real_buff_reg[14] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(x1_real_reg[14]),
        .Q(x2_real_buff[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x2_real_buff_reg[15] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(x1_real_reg[15]),
        .Q(x2_real_buff[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x2_real_buff_reg[16] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(x1_real_reg[16]),
        .Q(x2_real_buff[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x2_real_buff_reg[17] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(x1_real_reg[17]),
        .Q(x2_real_buff[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x2_real_buff_reg[18] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(x1_real_reg[18]),
        .Q(x2_real_buff[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x2_real_buff_reg[19] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(x1_real_reg[19]),
        .Q(x2_real_buff[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x2_real_buff_reg[1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(x1_real_reg[1]),
        .Q(x2_real_buff[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x2_real_buff_reg[20] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(x1_real_reg[20]),
        .Q(x2_real_buff[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x2_real_buff_reg[21] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(x1_real_reg[21]),
        .Q(x2_real_buff[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x2_real_buff_reg[22] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(x1_real_reg[22]),
        .Q(x2_real_buff[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x2_real_buff_reg[23] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(x1_real_reg[23]),
        .Q(x2_real_buff[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x2_real_buff_reg[2] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(x1_real_reg[2]),
        .Q(x2_real_buff[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x2_real_buff_reg[3] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(x1_real_reg[3]),
        .Q(x2_real_buff[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x2_real_buff_reg[4] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(x1_real_reg[4]),
        .Q(x2_real_buff[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x2_real_buff_reg[5] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(x1_real_reg[5]),
        .Q(x2_real_buff[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x2_real_buff_reg[6] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(x1_real_reg[6]),
        .Q(x2_real_buff[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x2_real_buff_reg[7] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(x1_real_reg[7]),
        .Q(x2_real_buff[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x2_real_buff_reg[8] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(x1_real_reg[8]),
        .Q(x2_real_buff[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x2_real_buff_reg[9] 
       (.C(clk100M_IBUF_BUFG),
        .CE(x2_real_buff_0),
        .D(x1_real_reg[9]),
        .Q(x2_real_buff[9]),
        .R(1'b0));
endmodule

module butterfly
   (x2_real_buff_0,
    x1_real_buff,
    butterfly_done_reg_reg_0,
    fft_start_reg,
    din_b_i,
    din_a_i,
    clk100M_IBUF_BUFG,
    B,
    A,
    Q,
    p_reg_reg,
    p_reg_reg_0,
    p_reg_reg_1,
    \write_cntr_reg[0] ,
    \write_cntr_reg[0]_0 ,
    rstbt_IBUF,
    \write_cntr_reg[1] ,
    begin_butterfly,
    p_reg_reg_2,
    p_0_in13_in,
    read_cntr_0_posedge_delay,
    read_cntr_1_posedge_delay,
    p_reg_reg_3,
    ram_array_reg,
    ram_array_reg_0,
    write_cntr_0_posedge,
    write_cntr_0_posedge_delay,
    ram_array_reg_1,
    ram_array_reg_2);
  output x2_real_buff_0;
  output x1_real_buff;
  output butterfly_done_reg_reg_0;
  output fft_start_reg;
  output [47:0]din_b_i;
  output [95:0]din_a_i;
  input clk100M_IBUF_BUFG;
  input [17:0]B;
  input [23:0]A;
  input [16:0]Q;
  input [23:0]p_reg_reg;
  input [16:0]p_reg_reg_0;
  input [23:0]p_reg_reg_1;
  input \write_cntr_reg[0] ;
  input \write_cntr_reg[0]_0 ;
  input rstbt_IBUF;
  input \write_cntr_reg[1] ;
  input begin_butterfly;
  input p_reg_reg_2;
  input p_0_in13_in;
  input read_cntr_0_posedge_delay;
  input read_cntr_1_posedge_delay;
  input p_reg_reg_3;
  input ram_array_reg;
  input ram_array_reg_0;
  input write_cntr_0_posedge;
  input write_cntr_0_posedge_delay;
  input ram_array_reg_1;
  input ram_array_reg_2;

  wire [23:0]A;
  wire [17:0]B;
  wire [16:0]Q;
  wire begin_butterfly;
  wire butterfly_done;
  wire butterfly_done_reg_i_1_n_0;
  wire butterfly_done_reg_reg_0;
  wire clk100M_IBUF_BUFG;
  wire [95:0]din_a_i;
  wire [47:0]din_b_i;
  wire fft_start_reg;
  wire \inst[2].DSP_n_0 ;
  wire \inst[2].DSP_n_1 ;
  wire \inst[2].DSP_n_10 ;
  wire \inst[2].DSP_n_11 ;
  wire \inst[2].DSP_n_12 ;
  wire \inst[2].DSP_n_13 ;
  wire \inst[2].DSP_n_14 ;
  wire \inst[2].DSP_n_15 ;
  wire \inst[2].DSP_n_16 ;
  wire \inst[2].DSP_n_17 ;
  wire \inst[2].DSP_n_18 ;
  wire \inst[2].DSP_n_19 ;
  wire \inst[2].DSP_n_2 ;
  wire \inst[2].DSP_n_20 ;
  wire \inst[2].DSP_n_21 ;
  wire \inst[2].DSP_n_22 ;
  wire \inst[2].DSP_n_23 ;
  wire \inst[2].DSP_n_24 ;
  wire \inst[2].DSP_n_25 ;
  wire \inst[2].DSP_n_26 ;
  wire \inst[2].DSP_n_27 ;
  wire \inst[2].DSP_n_28 ;
  wire \inst[2].DSP_n_29 ;
  wire \inst[2].DSP_n_3 ;
  wire \inst[2].DSP_n_30 ;
  wire \inst[2].DSP_n_31 ;
  wire \inst[2].DSP_n_32 ;
  wire \inst[2].DSP_n_33 ;
  wire \inst[2].DSP_n_34 ;
  wire \inst[2].DSP_n_35 ;
  wire \inst[2].DSP_n_36 ;
  wire \inst[2].DSP_n_37 ;
  wire \inst[2].DSP_n_38 ;
  wire \inst[2].DSP_n_39 ;
  wire \inst[2].DSP_n_4 ;
  wire \inst[2].DSP_n_40 ;
  wire \inst[2].DSP_n_41 ;
  wire \inst[2].DSP_n_42 ;
  wire \inst[2].DSP_n_43 ;
  wire \inst[2].DSP_n_44 ;
  wire \inst[2].DSP_n_45 ;
  wire \inst[2].DSP_n_46 ;
  wire \inst[2].DSP_n_47 ;
  wire \inst[2].DSP_n_5 ;
  wire \inst[2].DSP_n_6 ;
  wire \inst[2].DSP_n_7 ;
  wire \inst[2].DSP_n_8 ;
  wire \inst[2].DSP_n_9 ;
  wire \inst[4].DSP_n_0 ;
  wire \inst[4].DSP_n_1 ;
  wire \inst[4].DSP_n_10 ;
  wire \inst[4].DSP_n_11 ;
  wire \inst[4].DSP_n_12 ;
  wire \inst[4].DSP_n_13 ;
  wire \inst[4].DSP_n_14 ;
  wire \inst[4].DSP_n_15 ;
  wire \inst[4].DSP_n_16 ;
  wire \inst[4].DSP_n_17 ;
  wire \inst[4].DSP_n_18 ;
  wire \inst[4].DSP_n_19 ;
  wire \inst[4].DSP_n_2 ;
  wire \inst[4].DSP_n_20 ;
  wire \inst[4].DSP_n_21 ;
  wire \inst[4].DSP_n_22 ;
  wire \inst[4].DSP_n_23 ;
  wire \inst[4].DSP_n_24 ;
  wire \inst[4].DSP_n_25 ;
  wire \inst[4].DSP_n_26 ;
  wire \inst[4].DSP_n_27 ;
  wire \inst[4].DSP_n_28 ;
  wire \inst[4].DSP_n_29 ;
  wire \inst[4].DSP_n_3 ;
  wire \inst[4].DSP_n_30 ;
  wire \inst[4].DSP_n_31 ;
  wire \inst[4].DSP_n_32 ;
  wire \inst[4].DSP_n_33 ;
  wire \inst[4].DSP_n_34 ;
  wire \inst[4].DSP_n_35 ;
  wire \inst[4].DSP_n_36 ;
  wire \inst[4].DSP_n_37 ;
  wire \inst[4].DSP_n_38 ;
  wire \inst[4].DSP_n_39 ;
  wire \inst[4].DSP_n_4 ;
  wire \inst[4].DSP_n_40 ;
  wire \inst[4].DSP_n_41 ;
  wire \inst[4].DSP_n_42 ;
  wire \inst[4].DSP_n_43 ;
  wire \inst[4].DSP_n_44 ;
  wire \inst[4].DSP_n_45 ;
  wire \inst[4].DSP_n_46 ;
  wire \inst[4].DSP_n_47 ;
  wire \inst[4].DSP_n_5 ;
  wire \inst[4].DSP_n_6 ;
  wire \inst[4].DSP_n_7 ;
  wire \inst[4].DSP_n_8 ;
  wire \inst[4].DSP_n_9 ;
  wire \inst[5].DSP_n_0 ;
  wire \inst[5].DSP_n_1 ;
  wire \inst[5].DSP_n_10 ;
  wire \inst[5].DSP_n_11 ;
  wire \inst[5].DSP_n_12 ;
  wire \inst[5].DSP_n_13 ;
  wire \inst[5].DSP_n_14 ;
  wire \inst[5].DSP_n_15 ;
  wire \inst[5].DSP_n_16 ;
  wire \inst[5].DSP_n_17 ;
  wire \inst[5].DSP_n_18 ;
  wire \inst[5].DSP_n_19 ;
  wire \inst[5].DSP_n_2 ;
  wire \inst[5].DSP_n_20 ;
  wire \inst[5].DSP_n_21 ;
  wire \inst[5].DSP_n_22 ;
  wire \inst[5].DSP_n_23 ;
  wire \inst[5].DSP_n_3 ;
  wire \inst[5].DSP_n_4 ;
  wire \inst[5].DSP_n_5 ;
  wire \inst[5].DSP_n_6 ;
  wire \inst[5].DSP_n_7 ;
  wire \inst[5].DSP_n_8 ;
  wire \inst[5].DSP_n_9 ;
  wire \inst[6].DSP_n_0 ;
  wire \inst[6].DSP_n_1 ;
  wire \inst[6].DSP_n_10 ;
  wire \inst[6].DSP_n_11 ;
  wire \inst[6].DSP_n_12 ;
  wire \inst[6].DSP_n_13 ;
  wire \inst[6].DSP_n_14 ;
  wire \inst[6].DSP_n_15 ;
  wire \inst[6].DSP_n_16 ;
  wire \inst[6].DSP_n_17 ;
  wire \inst[6].DSP_n_18 ;
  wire \inst[6].DSP_n_19 ;
  wire \inst[6].DSP_n_2 ;
  wire \inst[6].DSP_n_20 ;
  wire \inst[6].DSP_n_21 ;
  wire \inst[6].DSP_n_22 ;
  wire \inst[6].DSP_n_23 ;
  wire \inst[6].DSP_n_24 ;
  wire \inst[6].DSP_n_25 ;
  wire \inst[6].DSP_n_26 ;
  wire \inst[6].DSP_n_27 ;
  wire \inst[6].DSP_n_28 ;
  wire \inst[6].DSP_n_29 ;
  wire \inst[6].DSP_n_3 ;
  wire \inst[6].DSP_n_30 ;
  wire \inst[6].DSP_n_31 ;
  wire \inst[6].DSP_n_32 ;
  wire \inst[6].DSP_n_33 ;
  wire \inst[6].DSP_n_34 ;
  wire \inst[6].DSP_n_35 ;
  wire \inst[6].DSP_n_36 ;
  wire \inst[6].DSP_n_37 ;
  wire \inst[6].DSP_n_38 ;
  wire \inst[6].DSP_n_39 ;
  wire \inst[6].DSP_n_4 ;
  wire \inst[6].DSP_n_40 ;
  wire \inst[6].DSP_n_41 ;
  wire \inst[6].DSP_n_42 ;
  wire \inst[6].DSP_n_43 ;
  wire \inst[6].DSP_n_44 ;
  wire \inst[6].DSP_n_45 ;
  wire \inst[6].DSP_n_46 ;
  wire \inst[6].DSP_n_47 ;
  wire \inst[6].DSP_n_5 ;
  wire \inst[6].DSP_n_6 ;
  wire \inst[6].DSP_n_7 ;
  wire \inst[6].DSP_n_8 ;
  wire \inst[6].DSP_n_9 ;
  wire \inst[7].DSP_n_0 ;
  wire \inst[7].DSP_n_1 ;
  wire \inst[7].DSP_n_10 ;
  wire \inst[7].DSP_n_11 ;
  wire \inst[7].DSP_n_12 ;
  wire \inst[7].DSP_n_13 ;
  wire \inst[7].DSP_n_14 ;
  wire \inst[7].DSP_n_15 ;
  wire \inst[7].DSP_n_16 ;
  wire \inst[7].DSP_n_17 ;
  wire \inst[7].DSP_n_18 ;
  wire \inst[7].DSP_n_19 ;
  wire \inst[7].DSP_n_2 ;
  wire \inst[7].DSP_n_20 ;
  wire \inst[7].DSP_n_21 ;
  wire \inst[7].DSP_n_22 ;
  wire \inst[7].DSP_n_23 ;
  wire \inst[7].DSP_n_3 ;
  wire \inst[7].DSP_n_4 ;
  wire \inst[7].DSP_n_5 ;
  wire \inst[7].DSP_n_6 ;
  wire \inst[7].DSP_n_7 ;
  wire \inst[7].DSP_n_8 ;
  wire \inst[7].DSP_n_9 ;
  wire \inst[8].DSP_n_0 ;
  wire \inst[8].DSP_n_1 ;
  wire \inst[8].DSP_n_10 ;
  wire \inst[8].DSP_n_11 ;
  wire \inst[8].DSP_n_12 ;
  wire \inst[8].DSP_n_13 ;
  wire \inst[8].DSP_n_14 ;
  wire \inst[8].DSP_n_15 ;
  wire \inst[8].DSP_n_16 ;
  wire \inst[8].DSP_n_17 ;
  wire \inst[8].DSP_n_18 ;
  wire \inst[8].DSP_n_19 ;
  wire \inst[8].DSP_n_2 ;
  wire \inst[8].DSP_n_20 ;
  wire \inst[8].DSP_n_21 ;
  wire \inst[8].DSP_n_22 ;
  wire \inst[8].DSP_n_23 ;
  wire \inst[8].DSP_n_24 ;
  wire \inst[8].DSP_n_25 ;
  wire \inst[8].DSP_n_26 ;
  wire \inst[8].DSP_n_27 ;
  wire \inst[8].DSP_n_28 ;
  wire \inst[8].DSP_n_29 ;
  wire \inst[8].DSP_n_3 ;
  wire \inst[8].DSP_n_30 ;
  wire \inst[8].DSP_n_31 ;
  wire \inst[8].DSP_n_32 ;
  wire \inst[8].DSP_n_33 ;
  wire \inst[8].DSP_n_34 ;
  wire \inst[8].DSP_n_35 ;
  wire \inst[8].DSP_n_36 ;
  wire \inst[8].DSP_n_37 ;
  wire \inst[8].DSP_n_38 ;
  wire \inst[8].DSP_n_39 ;
  wire \inst[8].DSP_n_4 ;
  wire \inst[8].DSP_n_40 ;
  wire \inst[8].DSP_n_41 ;
  wire \inst[8].DSP_n_42 ;
  wire \inst[8].DSP_n_43 ;
  wire \inst[8].DSP_n_44 ;
  wire \inst[8].DSP_n_45 ;
  wire \inst[8].DSP_n_46 ;
  wire \inst[8].DSP_n_47 ;
  wire \inst[8].DSP_n_5 ;
  wire \inst[8].DSP_n_6 ;
  wire \inst[8].DSP_n_7 ;
  wire \inst[8].DSP_n_8 ;
  wire \inst[8].DSP_n_9 ;
  wire p_0_in13_in;
  wire [23:0]p_reg_reg;
  wire [16:0]p_reg_reg_0;
  wire [23:0]p_reg_reg_1;
  wire p_reg_reg_2;
  wire p_reg_reg_3;
  wire \progress_cntr[0]_i_1_n_0 ;
  wire \progress_cntr[1]_i_1_n_0 ;
  wire \progress_cntr[2]_i_1_n_0 ;
  wire \progress_cntr_reg_n_0_[0] ;
  wire \progress_cntr_reg_n_0_[1] ;
  wire \progress_cntr_reg_n_0_[2] ;
  wire ram_array_reg;
  wire ram_array_reg_0;
  wire ram_array_reg_1;
  wire ram_array_reg_2;
  wire read_cntr_0_posedge_delay;
  wire read_cntr_1_posedge_delay;
  wire rstbt_IBUF;
  wire write_cntr_0_posedge;
  wire write_cntr_0_posedge_delay;
  wire \write_cntr_reg[0] ;
  wire \write_cntr_reg[0]_0 ;
  wire \write_cntr_reg[1] ;
  wire x1_real_buff;
  wire x2_real_buff_0;

  LUT6 #(
    .INIT(64'h0000000000001000)) 
    butterfly_done_reg_i_1
       (.I0(rstbt_IBUF),
        .I1(\progress_cntr_reg_n_0_[1] ),
        .I2(\progress_cntr_reg_n_0_[0] ),
        .I3(\progress_cntr_reg_n_0_[2] ),
        .I4(begin_butterfly),
        .I5(butterfly_done),
        .O(butterfly_done_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    butterfly_done_reg_reg
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(butterfly_done_reg_i_1_n_0),
        .Q(butterfly_done),
        .R(1'b0));
  dsp_25x18 \inst[1].DSP 
       (.P({\inst[5].DSP_n_0 ,\inst[5].DSP_n_1 ,\inst[5].DSP_n_2 ,\inst[5].DSP_n_3 ,\inst[5].DSP_n_4 ,\inst[5].DSP_n_5 ,\inst[5].DSP_n_6 ,\inst[5].DSP_n_7 ,\inst[5].DSP_n_8 ,\inst[5].DSP_n_9 ,\inst[5].DSP_n_10 ,\inst[5].DSP_n_11 ,\inst[5].DSP_n_12 ,\inst[5].DSP_n_13 ,\inst[5].DSP_n_14 ,\inst[5].DSP_n_15 ,\inst[5].DSP_n_16 ,\inst[5].DSP_n_17 ,\inst[5].DSP_n_18 ,\inst[5].DSP_n_19 ,\inst[5].DSP_n_20 ,\inst[5].DSP_n_21 ,\inst[5].DSP_n_22 ,\inst[5].DSP_n_23 }),
        .PCOUT({\inst[2].DSP_n_0 ,\inst[2].DSP_n_1 ,\inst[2].DSP_n_2 ,\inst[2].DSP_n_3 ,\inst[2].DSP_n_4 ,\inst[2].DSP_n_5 ,\inst[2].DSP_n_6 ,\inst[2].DSP_n_7 ,\inst[2].DSP_n_8 ,\inst[2].DSP_n_9 ,\inst[2].DSP_n_10 ,\inst[2].DSP_n_11 ,\inst[2].DSP_n_12 ,\inst[2].DSP_n_13 ,\inst[2].DSP_n_14 ,\inst[2].DSP_n_15 ,\inst[2].DSP_n_16 ,\inst[2].DSP_n_17 ,\inst[2].DSP_n_18 ,\inst[2].DSP_n_19 ,\inst[2].DSP_n_20 ,\inst[2].DSP_n_21 ,\inst[2].DSP_n_22 ,\inst[2].DSP_n_23 ,\inst[2].DSP_n_24 ,\inst[2].DSP_n_25 ,\inst[2].DSP_n_26 ,\inst[2].DSP_n_27 ,\inst[2].DSP_n_28 ,\inst[2].DSP_n_29 ,\inst[2].DSP_n_30 ,\inst[2].DSP_n_31 ,\inst[2].DSP_n_32 ,\inst[2].DSP_n_33 ,\inst[2].DSP_n_34 ,\inst[2].DSP_n_35 ,\inst[2].DSP_n_36 ,\inst[2].DSP_n_37 ,\inst[2].DSP_n_38 ,\inst[2].DSP_n_39 ,\inst[2].DSP_n_40 ,\inst[2].DSP_n_41 ,\inst[2].DSP_n_42 ,\inst[2].DSP_n_43 ,\inst[2].DSP_n_44 ,\inst[2].DSP_n_45 ,\inst[2].DSP_n_46 ,\inst[2].DSP_n_47 }),
        .Q(Q),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG),
        .din_a_i({din_a_i[71:48],din_a_i[23:0]}),
        .din_b_i(din_b_i[23:0]),
        .p_reg_reg_0(p_reg_reg),
        .ram_array_reg(ram_array_reg),
        .ram_array_reg_0(ram_array_reg_0),
        .ram_array_reg_1(ram_array_reg_1),
        .ram_array_reg_2(ram_array_reg_2),
        .write_cntr_0_posedge(write_cntr_0_posedge),
        .write_cntr_0_posedge_delay(write_cntr_0_posedge_delay));
  dsp_25x18__parameterized0 \inst[2].DSP 
       (.A(A),
        .B(B),
        .PCOUT({\inst[2].DSP_n_0 ,\inst[2].DSP_n_1 ,\inst[2].DSP_n_2 ,\inst[2].DSP_n_3 ,\inst[2].DSP_n_4 ,\inst[2].DSP_n_5 ,\inst[2].DSP_n_6 ,\inst[2].DSP_n_7 ,\inst[2].DSP_n_8 ,\inst[2].DSP_n_9 ,\inst[2].DSP_n_10 ,\inst[2].DSP_n_11 ,\inst[2].DSP_n_12 ,\inst[2].DSP_n_13 ,\inst[2].DSP_n_14 ,\inst[2].DSP_n_15 ,\inst[2].DSP_n_16 ,\inst[2].DSP_n_17 ,\inst[2].DSP_n_18 ,\inst[2].DSP_n_19 ,\inst[2].DSP_n_20 ,\inst[2].DSP_n_21 ,\inst[2].DSP_n_22 ,\inst[2].DSP_n_23 ,\inst[2].DSP_n_24 ,\inst[2].DSP_n_25 ,\inst[2].DSP_n_26 ,\inst[2].DSP_n_27 ,\inst[2].DSP_n_28 ,\inst[2].DSP_n_29 ,\inst[2].DSP_n_30 ,\inst[2].DSP_n_31 ,\inst[2].DSP_n_32 ,\inst[2].DSP_n_33 ,\inst[2].DSP_n_34 ,\inst[2].DSP_n_35 ,\inst[2].DSP_n_36 ,\inst[2].DSP_n_37 ,\inst[2].DSP_n_38 ,\inst[2].DSP_n_39 ,\inst[2].DSP_n_40 ,\inst[2].DSP_n_41 ,\inst[2].DSP_n_42 ,\inst[2].DSP_n_43 ,\inst[2].DSP_n_44 ,\inst[2].DSP_n_45 ,\inst[2].DSP_n_46 ,\inst[2].DSP_n_47 }),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG),
        .p_reg_reg_0(x2_real_buff_0),
        .p_reg_reg_1(x1_real_buff));
  dsp_25x18_9 \inst[3].DSP 
       (.A(A),
        .P({\inst[7].DSP_n_0 ,\inst[7].DSP_n_1 ,\inst[7].DSP_n_2 ,\inst[7].DSP_n_3 ,\inst[7].DSP_n_4 ,\inst[7].DSP_n_5 ,\inst[7].DSP_n_6 ,\inst[7].DSP_n_7 ,\inst[7].DSP_n_8 ,\inst[7].DSP_n_9 ,\inst[7].DSP_n_10 ,\inst[7].DSP_n_11 ,\inst[7].DSP_n_12 ,\inst[7].DSP_n_13 ,\inst[7].DSP_n_14 ,\inst[7].DSP_n_15 ,\inst[7].DSP_n_16 ,\inst[7].DSP_n_17 ,\inst[7].DSP_n_18 ,\inst[7].DSP_n_19 ,\inst[7].DSP_n_20 ,\inst[7].DSP_n_21 ,\inst[7].DSP_n_22 ,\inst[7].DSP_n_23 }),
        .PCOUT({\inst[4].DSP_n_0 ,\inst[4].DSP_n_1 ,\inst[4].DSP_n_2 ,\inst[4].DSP_n_3 ,\inst[4].DSP_n_4 ,\inst[4].DSP_n_5 ,\inst[4].DSP_n_6 ,\inst[4].DSP_n_7 ,\inst[4].DSP_n_8 ,\inst[4].DSP_n_9 ,\inst[4].DSP_n_10 ,\inst[4].DSP_n_11 ,\inst[4].DSP_n_12 ,\inst[4].DSP_n_13 ,\inst[4].DSP_n_14 ,\inst[4].DSP_n_15 ,\inst[4].DSP_n_16 ,\inst[4].DSP_n_17 ,\inst[4].DSP_n_18 ,\inst[4].DSP_n_19 ,\inst[4].DSP_n_20 ,\inst[4].DSP_n_21 ,\inst[4].DSP_n_22 ,\inst[4].DSP_n_23 ,\inst[4].DSP_n_24 ,\inst[4].DSP_n_25 ,\inst[4].DSP_n_26 ,\inst[4].DSP_n_27 ,\inst[4].DSP_n_28 ,\inst[4].DSP_n_29 ,\inst[4].DSP_n_30 ,\inst[4].DSP_n_31 ,\inst[4].DSP_n_32 ,\inst[4].DSP_n_33 ,\inst[4].DSP_n_34 ,\inst[4].DSP_n_35 ,\inst[4].DSP_n_36 ,\inst[4].DSP_n_37 ,\inst[4].DSP_n_38 ,\inst[4].DSP_n_39 ,\inst[4].DSP_n_40 ,\inst[4].DSP_n_41 ,\inst[4].DSP_n_42 ,\inst[4].DSP_n_43 ,\inst[4].DSP_n_44 ,\inst[4].DSP_n_45 ,\inst[4].DSP_n_46 ,\inst[4].DSP_n_47 }),
        .Q(Q),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG),
        .din_a_i({din_a_i[95:72],din_a_i[47:24]}),
        .din_b_i(din_b_i[47:24]),
        .p_reg_reg_0(x2_real_buff_0),
        .ram_array_reg(ram_array_reg),
        .ram_array_reg_0(ram_array_reg_0),
        .ram_array_reg_1(ram_array_reg_1),
        .ram_array_reg_2(ram_array_reg_2),
        .write_cntr_0_posedge(write_cntr_0_posedge),
        .write_cntr_0_posedge_delay(write_cntr_0_posedge_delay));
  dsp_25x18__parameterized0_10 \inst[4].DSP 
       (.B(B),
        .PCOUT({\inst[4].DSP_n_0 ,\inst[4].DSP_n_1 ,\inst[4].DSP_n_2 ,\inst[4].DSP_n_3 ,\inst[4].DSP_n_4 ,\inst[4].DSP_n_5 ,\inst[4].DSP_n_6 ,\inst[4].DSP_n_7 ,\inst[4].DSP_n_8 ,\inst[4].DSP_n_9 ,\inst[4].DSP_n_10 ,\inst[4].DSP_n_11 ,\inst[4].DSP_n_12 ,\inst[4].DSP_n_13 ,\inst[4].DSP_n_14 ,\inst[4].DSP_n_15 ,\inst[4].DSP_n_16 ,\inst[4].DSP_n_17 ,\inst[4].DSP_n_18 ,\inst[4].DSP_n_19 ,\inst[4].DSP_n_20 ,\inst[4].DSP_n_21 ,\inst[4].DSP_n_22 ,\inst[4].DSP_n_23 ,\inst[4].DSP_n_24 ,\inst[4].DSP_n_25 ,\inst[4].DSP_n_26 ,\inst[4].DSP_n_27 ,\inst[4].DSP_n_28 ,\inst[4].DSP_n_29 ,\inst[4].DSP_n_30 ,\inst[4].DSP_n_31 ,\inst[4].DSP_n_32 ,\inst[4].DSP_n_33 ,\inst[4].DSP_n_34 ,\inst[4].DSP_n_35 ,\inst[4].DSP_n_36 ,\inst[4].DSP_n_37 ,\inst[4].DSP_n_38 ,\inst[4].DSP_n_39 ,\inst[4].DSP_n_40 ,\inst[4].DSP_n_41 ,\inst[4].DSP_n_42 ,\inst[4].DSP_n_43 ,\inst[4].DSP_n_44 ,\inst[4].DSP_n_45 ,\inst[4].DSP_n_46 ,\inst[4].DSP_n_47 }),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG),
        .p_0_in13_in(p_0_in13_in),
        .p_reg_reg_0(x1_real_buff),
        .p_reg_reg_1(p_reg_reg_1),
        .p_reg_reg_2(p_reg_reg_2),
        .p_reg_reg_3(p_reg_reg_3),
        .read_cntr_0_posedge_delay(read_cntr_0_posedge_delay),
        .read_cntr_1_posedge_delay(read_cntr_1_posedge_delay),
        .\read_cntr_reg[0] (x2_real_buff_0));
  dsp_25x18_11 \inst[5].DSP 
       (.P({\inst[5].DSP_n_0 ,\inst[5].DSP_n_1 ,\inst[5].DSP_n_2 ,\inst[5].DSP_n_3 ,\inst[5].DSP_n_4 ,\inst[5].DSP_n_5 ,\inst[5].DSP_n_6 ,\inst[5].DSP_n_7 ,\inst[5].DSP_n_8 ,\inst[5].DSP_n_9 ,\inst[5].DSP_n_10 ,\inst[5].DSP_n_11 ,\inst[5].DSP_n_12 ,\inst[5].DSP_n_13 ,\inst[5].DSP_n_14 ,\inst[5].DSP_n_15 ,\inst[5].DSP_n_16 ,\inst[5].DSP_n_17 ,\inst[5].DSP_n_18 ,\inst[5].DSP_n_19 ,\inst[5].DSP_n_20 ,\inst[5].DSP_n_21 ,\inst[5].DSP_n_22 ,\inst[5].DSP_n_23 }),
        .PCOUT({\inst[6].DSP_n_0 ,\inst[6].DSP_n_1 ,\inst[6].DSP_n_2 ,\inst[6].DSP_n_3 ,\inst[6].DSP_n_4 ,\inst[6].DSP_n_5 ,\inst[6].DSP_n_6 ,\inst[6].DSP_n_7 ,\inst[6].DSP_n_8 ,\inst[6].DSP_n_9 ,\inst[6].DSP_n_10 ,\inst[6].DSP_n_11 ,\inst[6].DSP_n_12 ,\inst[6].DSP_n_13 ,\inst[6].DSP_n_14 ,\inst[6].DSP_n_15 ,\inst[6].DSP_n_16 ,\inst[6].DSP_n_17 ,\inst[6].DSP_n_18 ,\inst[6].DSP_n_19 ,\inst[6].DSP_n_20 ,\inst[6].DSP_n_21 ,\inst[6].DSP_n_22 ,\inst[6].DSP_n_23 ,\inst[6].DSP_n_24 ,\inst[6].DSP_n_25 ,\inst[6].DSP_n_26 ,\inst[6].DSP_n_27 ,\inst[6].DSP_n_28 ,\inst[6].DSP_n_29 ,\inst[6].DSP_n_30 ,\inst[6].DSP_n_31 ,\inst[6].DSP_n_32 ,\inst[6].DSP_n_33 ,\inst[6].DSP_n_34 ,\inst[6].DSP_n_35 ,\inst[6].DSP_n_36 ,\inst[6].DSP_n_37 ,\inst[6].DSP_n_38 ,\inst[6].DSP_n_39 ,\inst[6].DSP_n_40 ,\inst[6].DSP_n_41 ,\inst[6].DSP_n_42 ,\inst[6].DSP_n_43 ,\inst[6].DSP_n_44 ,\inst[6].DSP_n_45 ,\inst[6].DSP_n_46 ,\inst[6].DSP_n_47 }),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG),
        .p_reg_reg_0(p_reg_reg_0),
        .p_reg_reg_1(p_reg_reg));
  dsp_25x18__parameterized0_12 \inst[6].DSP 
       (.A(A),
        .B(B),
        .PCOUT({\inst[6].DSP_n_0 ,\inst[6].DSP_n_1 ,\inst[6].DSP_n_2 ,\inst[6].DSP_n_3 ,\inst[6].DSP_n_4 ,\inst[6].DSP_n_5 ,\inst[6].DSP_n_6 ,\inst[6].DSP_n_7 ,\inst[6].DSP_n_8 ,\inst[6].DSP_n_9 ,\inst[6].DSP_n_10 ,\inst[6].DSP_n_11 ,\inst[6].DSP_n_12 ,\inst[6].DSP_n_13 ,\inst[6].DSP_n_14 ,\inst[6].DSP_n_15 ,\inst[6].DSP_n_16 ,\inst[6].DSP_n_17 ,\inst[6].DSP_n_18 ,\inst[6].DSP_n_19 ,\inst[6].DSP_n_20 ,\inst[6].DSP_n_21 ,\inst[6].DSP_n_22 ,\inst[6].DSP_n_23 ,\inst[6].DSP_n_24 ,\inst[6].DSP_n_25 ,\inst[6].DSP_n_26 ,\inst[6].DSP_n_27 ,\inst[6].DSP_n_28 ,\inst[6].DSP_n_29 ,\inst[6].DSP_n_30 ,\inst[6].DSP_n_31 ,\inst[6].DSP_n_32 ,\inst[6].DSP_n_33 ,\inst[6].DSP_n_34 ,\inst[6].DSP_n_35 ,\inst[6].DSP_n_36 ,\inst[6].DSP_n_37 ,\inst[6].DSP_n_38 ,\inst[6].DSP_n_39 ,\inst[6].DSP_n_40 ,\inst[6].DSP_n_41 ,\inst[6].DSP_n_42 ,\inst[6].DSP_n_43 ,\inst[6].DSP_n_44 ,\inst[6].DSP_n_45 ,\inst[6].DSP_n_46 ,\inst[6].DSP_n_47 }),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG),
        .p_reg_reg_0(x2_real_buff_0),
        .p_reg_reg_1(x1_real_buff));
  dsp_25x18_13 \inst[7].DSP 
       (.A(A),
        .P({\inst[7].DSP_n_0 ,\inst[7].DSP_n_1 ,\inst[7].DSP_n_2 ,\inst[7].DSP_n_3 ,\inst[7].DSP_n_4 ,\inst[7].DSP_n_5 ,\inst[7].DSP_n_6 ,\inst[7].DSP_n_7 ,\inst[7].DSP_n_8 ,\inst[7].DSP_n_9 ,\inst[7].DSP_n_10 ,\inst[7].DSP_n_11 ,\inst[7].DSP_n_12 ,\inst[7].DSP_n_13 ,\inst[7].DSP_n_14 ,\inst[7].DSP_n_15 ,\inst[7].DSP_n_16 ,\inst[7].DSP_n_17 ,\inst[7].DSP_n_18 ,\inst[7].DSP_n_19 ,\inst[7].DSP_n_20 ,\inst[7].DSP_n_21 ,\inst[7].DSP_n_22 ,\inst[7].DSP_n_23 }),
        .PCOUT({\inst[8].DSP_n_0 ,\inst[8].DSP_n_1 ,\inst[8].DSP_n_2 ,\inst[8].DSP_n_3 ,\inst[8].DSP_n_4 ,\inst[8].DSP_n_5 ,\inst[8].DSP_n_6 ,\inst[8].DSP_n_7 ,\inst[8].DSP_n_8 ,\inst[8].DSP_n_9 ,\inst[8].DSP_n_10 ,\inst[8].DSP_n_11 ,\inst[8].DSP_n_12 ,\inst[8].DSP_n_13 ,\inst[8].DSP_n_14 ,\inst[8].DSP_n_15 ,\inst[8].DSP_n_16 ,\inst[8].DSP_n_17 ,\inst[8].DSP_n_18 ,\inst[8].DSP_n_19 ,\inst[8].DSP_n_20 ,\inst[8].DSP_n_21 ,\inst[8].DSP_n_22 ,\inst[8].DSP_n_23 ,\inst[8].DSP_n_24 ,\inst[8].DSP_n_25 ,\inst[8].DSP_n_26 ,\inst[8].DSP_n_27 ,\inst[8].DSP_n_28 ,\inst[8].DSP_n_29 ,\inst[8].DSP_n_30 ,\inst[8].DSP_n_31 ,\inst[8].DSP_n_32 ,\inst[8].DSP_n_33 ,\inst[8].DSP_n_34 ,\inst[8].DSP_n_35 ,\inst[8].DSP_n_36 ,\inst[8].DSP_n_37 ,\inst[8].DSP_n_38 ,\inst[8].DSP_n_39 ,\inst[8].DSP_n_40 ,\inst[8].DSP_n_41 ,\inst[8].DSP_n_42 ,\inst[8].DSP_n_43 ,\inst[8].DSP_n_44 ,\inst[8].DSP_n_45 ,\inst[8].DSP_n_46 ,\inst[8].DSP_n_47 }),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG),
        .p_reg_reg_0(x2_real_buff_0),
        .p_reg_reg_1(p_reg_reg_0));
  dsp_25x18__parameterized0_14 \inst[8].DSP 
       (.B(B),
        .PCOUT({\inst[8].DSP_n_0 ,\inst[8].DSP_n_1 ,\inst[8].DSP_n_2 ,\inst[8].DSP_n_3 ,\inst[8].DSP_n_4 ,\inst[8].DSP_n_5 ,\inst[8].DSP_n_6 ,\inst[8].DSP_n_7 ,\inst[8].DSP_n_8 ,\inst[8].DSP_n_9 ,\inst[8].DSP_n_10 ,\inst[8].DSP_n_11 ,\inst[8].DSP_n_12 ,\inst[8].DSP_n_13 ,\inst[8].DSP_n_14 ,\inst[8].DSP_n_15 ,\inst[8].DSP_n_16 ,\inst[8].DSP_n_17 ,\inst[8].DSP_n_18 ,\inst[8].DSP_n_19 ,\inst[8].DSP_n_20 ,\inst[8].DSP_n_21 ,\inst[8].DSP_n_22 ,\inst[8].DSP_n_23 ,\inst[8].DSP_n_24 ,\inst[8].DSP_n_25 ,\inst[8].DSP_n_26 ,\inst[8].DSP_n_27 ,\inst[8].DSP_n_28 ,\inst[8].DSP_n_29 ,\inst[8].DSP_n_30 ,\inst[8].DSP_n_31 ,\inst[8].DSP_n_32 ,\inst[8].DSP_n_33 ,\inst[8].DSP_n_34 ,\inst[8].DSP_n_35 ,\inst[8].DSP_n_36 ,\inst[8].DSP_n_37 ,\inst[8].DSP_n_38 ,\inst[8].DSP_n_39 ,\inst[8].DSP_n_40 ,\inst[8].DSP_n_41 ,\inst[8].DSP_n_42 ,\inst[8].DSP_n_43 ,\inst[8].DSP_n_44 ,\inst[8].DSP_n_45 ,\inst[8].DSP_n_46 ,\inst[8].DSP_n_47 }),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG),
        .p_0_in13_in(p_0_in13_in),
        .p_reg_reg_0(x2_real_buff_0),
        .p_reg_reg_1(p_reg_reg_1),
        .p_reg_reg_2(p_reg_reg_2),
        .p_reg_reg_3(p_reg_reg_3),
        .read_cntr_0_posedge_delay(read_cntr_0_posedge_delay),
        .read_cntr_1_posedge_delay(read_cntr_1_posedge_delay),
        .\read_cntr_reg[1] (x1_real_buff));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h00330032)) 
    \progress_cntr[0]_i_1 
       (.I0(begin_butterfly),
        .I1(rstbt_IBUF),
        .I2(\progress_cntr_reg_n_0_[1] ),
        .I3(\progress_cntr_reg_n_0_[0] ),
        .I4(\progress_cntr_reg_n_0_[2] ),
        .O(\progress_cntr[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h0414)) 
    \progress_cntr[1]_i_1 
       (.I0(rstbt_IBUF),
        .I1(\progress_cntr_reg_n_0_[1] ),
        .I2(\progress_cntr_reg_n_0_[0] ),
        .I3(\progress_cntr_reg_n_0_[2] ),
        .O(\progress_cntr[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0540)) 
    \progress_cntr[2]_i_1 
       (.I0(rstbt_IBUF),
        .I1(\progress_cntr_reg_n_0_[1] ),
        .I2(\progress_cntr_reg_n_0_[0] ),
        .I3(\progress_cntr_reg_n_0_[2] ),
        .O(\progress_cntr[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \progress_cntr_reg[0] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\progress_cntr[0]_i_1_n_0 ),
        .Q(\progress_cntr_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \progress_cntr_reg[1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\progress_cntr[1]_i_1_n_0 ),
        .Q(\progress_cntr_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \progress_cntr_reg[2] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\progress_cntr[2]_i_1_n_0 ),
        .Q(\progress_cntr_reg_n_0_[2] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h0000002E)) 
    \write_cntr[0]_i_1 
       (.I0(butterfly_done),
        .I1(\write_cntr_reg[0] ),
        .I2(\write_cntr_reg[0]_0 ),
        .I3(rstbt_IBUF),
        .I4(\write_cntr_reg[1] ),
        .O(butterfly_done_reg_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h00000110)) 
    \write_cntr[1]_i_1 
       (.I0(rstbt_IBUF),
        .I1(\write_cntr_reg[1] ),
        .I2(\write_cntr_reg[0] ),
        .I3(\write_cntr_reg[0]_0 ),
        .I4(butterfly_done),
        .O(fft_start_reg));
endmodule

module codec_if
   (codec_rstn_OBUF,
    aud_dout_vld,
    codec_mclk_OBUF,
    S,
    \genblk1.div_cntr_reg[10]_0 ,
    \genblk1.aud_dout_vld_reg[0]_0 ,
    Q,
    rstbt_IBUF,
    clk100M_IBUF_BUFG,
    smpl_addr_cntr_reg,
    D);
  output codec_rstn_OBUF;
  output aud_dout_vld;
  output codec_mclk_OBUF;
  output [0:0]S;
  output [0:0]\genblk1.div_cntr_reg[10]_0 ;
  output \genblk1.aud_dout_vld_reg[0]_0 ;
  output [23:0]Q;
  input rstbt_IBUF;
  input clk100M_IBUF_BUFG;
  input [0:0]smpl_addr_cntr_reg;
  input [0:0]D;

  wire [0:0]D;
  wire [23:0]Q;
  wire [0:0]S;
  wire aud_dout_vld;
  wire clk100M_IBUF_BUFG;
  wire codec_mclk_OBUF;
  wire codec_rstn_OBUF;
  wire \genblk1.aud_dout_vld[0]_i_2_n_0 ;
  wire \genblk1.aud_dout_vld_reg0 ;
  wire \genblk1.aud_dout_vld_reg[0]_0 ;
  wire [4:0]\genblk1.bit_cntr ;
  wire \genblk1.div_cntr[0]_i_2_n_0 ;
  wire [21:1]\genblk1.div_cntr_reg ;
  wire \genblk1.div_cntr_reg[0]_i_1_n_0 ;
  wire \genblk1.div_cntr_reg[0]_i_1_n_4 ;
  wire \genblk1.div_cntr_reg[0]_i_1_n_5 ;
  wire \genblk1.div_cntr_reg[0]_i_1_n_6 ;
  wire \genblk1.div_cntr_reg[0]_i_1_n_7 ;
  wire [0:0]\genblk1.div_cntr_reg[10]_0 ;
  wire \genblk1.div_cntr_reg[12]_i_1_n_0 ;
  wire \genblk1.div_cntr_reg[12]_i_1_n_4 ;
  wire \genblk1.div_cntr_reg[12]_i_1_n_5 ;
  wire \genblk1.div_cntr_reg[12]_i_1_n_6 ;
  wire \genblk1.div_cntr_reg[12]_i_1_n_7 ;
  wire \genblk1.div_cntr_reg[16]_i_1_n_0 ;
  wire \genblk1.div_cntr_reg[16]_i_1_n_4 ;
  wire \genblk1.div_cntr_reg[16]_i_1_n_5 ;
  wire \genblk1.div_cntr_reg[16]_i_1_n_6 ;
  wire \genblk1.div_cntr_reg[16]_i_1_n_7 ;
  wire \genblk1.div_cntr_reg[20]_i_1_n_6 ;
  wire \genblk1.div_cntr_reg[20]_i_1_n_7 ;
  wire \genblk1.div_cntr_reg[4]_i_1_n_0 ;
  wire \genblk1.div_cntr_reg[4]_i_1_n_4 ;
  wire \genblk1.div_cntr_reg[4]_i_1_n_5 ;
  wire \genblk1.div_cntr_reg[4]_i_1_n_6 ;
  wire \genblk1.div_cntr_reg[4]_i_1_n_7 ;
  wire \genblk1.div_cntr_reg[8]_i_1_n_0 ;
  wire \genblk1.div_cntr_reg[8]_i_1_n_4 ;
  wire \genblk1.div_cntr_reg[8]_i_1_n_5 ;
  wire \genblk1.div_cntr_reg[8]_i_1_n_6 ;
  wire \genblk1.div_cntr_reg[8]_i_1_n_7 ;
  wire \genblk1.init_done_ff_i_1_n_0 ;
  wire \genblk1.init_done_ff_i_2_n_0 ;
  wire \genblk1.init_done_ff_i_3_n_0 ;
  wire \genblk1.init_done_ff_reg_n_0 ;
  wire \genblk1.rst_ff ;
  wire \genblk1.rst_ff_i_2_n_0 ;
  wire \genblk1.sclk_rise ;
  wire rstbt_IBUF;
  wire [0:0]smpl_addr_cntr_reg;
  wire [2:0]\NLW_genblk1.div_cntr_reg[0]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_genblk1.div_cntr_reg[12]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_genblk1.div_cntr_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_genblk1.div_cntr_reg[20]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_genblk1.div_cntr_reg[20]_i_1_O_UNCONNECTED ;
  wire [2:0]\NLW_genblk1.div_cntr_reg[4]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_genblk1.div_cntr_reg[8]_i_1_CO_UNCONNECTED ;

  LUT5 #(
    .INIT(32'h00200000)) 
    \genblk1.aud_dout_vld[0]_i_1 
       (.I0(\genblk1.sclk_rise ),
        .I1(\genblk1.aud_dout_vld[0]_i_2_n_0 ),
        .I2(\genblk1.bit_cntr [4]),
        .I3(\genblk1.div_cntr_reg[10]_0 ),
        .I4(\genblk1.bit_cntr [2]),
        .O(\genblk1.aud_dout_vld_reg0 ));
  LUT4 #(
    .INIT(16'hDFFF)) 
    \genblk1.aud_dout_vld[0]_i_2 
       (.I0(\genblk1.bit_cntr [1]),
        .I1(\genblk1.bit_cntr [3]),
        .I2(\genblk1.bit_cntr [0]),
        .I3(\genblk1.init_done_ff_reg_n_0 ),
        .O(\genblk1.aud_dout_vld[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.aud_dout_vld_reg[0] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\genblk1.aud_dout_vld_reg0 ),
        .Q(aud_dout_vld),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \genblk1.div_cntr[0]_i_2 
       (.I0(codec_mclk_OBUF),
        .O(\genblk1.div_cntr[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.div_cntr_reg[0] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\genblk1.div_cntr_reg[0]_i_1_n_7 ),
        .Q(codec_mclk_OBUF),
        .R(rstbt_IBUF));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \genblk1.div_cntr_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\genblk1.div_cntr_reg[0]_i_1_n_0 ,\NLW_genblk1.div_cntr_reg[0]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\genblk1.div_cntr_reg[0]_i_1_n_4 ,\genblk1.div_cntr_reg[0]_i_1_n_5 ,\genblk1.div_cntr_reg[0]_i_1_n_6 ,\genblk1.div_cntr_reg[0]_i_1_n_7 }),
        .S({\genblk1.div_cntr_reg [3:1],\genblk1.div_cntr[0]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.div_cntr_reg[10] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\genblk1.div_cntr_reg[8]_i_1_n_5 ),
        .Q(\genblk1.div_cntr_reg[10]_0 ),
        .R(rstbt_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.div_cntr_reg[11] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\genblk1.div_cntr_reg[8]_i_1_n_4 ),
        .Q(\genblk1.div_cntr_reg [11]),
        .R(rstbt_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.div_cntr_reg[12] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\genblk1.div_cntr_reg[12]_i_1_n_7 ),
        .Q(\genblk1.div_cntr_reg [12]),
        .R(rstbt_IBUF));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \genblk1.div_cntr_reg[12]_i_1 
       (.CI(\genblk1.div_cntr_reg[8]_i_1_n_0 ),
        .CO({\genblk1.div_cntr_reg[12]_i_1_n_0 ,\NLW_genblk1.div_cntr_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\genblk1.div_cntr_reg[12]_i_1_n_4 ,\genblk1.div_cntr_reg[12]_i_1_n_5 ,\genblk1.div_cntr_reg[12]_i_1_n_6 ,\genblk1.div_cntr_reg[12]_i_1_n_7 }),
        .S(\genblk1.div_cntr_reg [15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.div_cntr_reg[13] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\genblk1.div_cntr_reg[12]_i_1_n_6 ),
        .Q(\genblk1.div_cntr_reg [13]),
        .R(rstbt_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.div_cntr_reg[14] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\genblk1.div_cntr_reg[12]_i_1_n_5 ),
        .Q(\genblk1.div_cntr_reg [14]),
        .R(rstbt_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.div_cntr_reg[15] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\genblk1.div_cntr_reg[12]_i_1_n_4 ),
        .Q(\genblk1.div_cntr_reg [15]),
        .R(rstbt_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.div_cntr_reg[16] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\genblk1.div_cntr_reg[16]_i_1_n_7 ),
        .Q(\genblk1.div_cntr_reg [16]),
        .R(rstbt_IBUF));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \genblk1.div_cntr_reg[16]_i_1 
       (.CI(\genblk1.div_cntr_reg[12]_i_1_n_0 ),
        .CO({\genblk1.div_cntr_reg[16]_i_1_n_0 ,\NLW_genblk1.div_cntr_reg[16]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\genblk1.div_cntr_reg[16]_i_1_n_4 ,\genblk1.div_cntr_reg[16]_i_1_n_5 ,\genblk1.div_cntr_reg[16]_i_1_n_6 ,\genblk1.div_cntr_reg[16]_i_1_n_7 }),
        .S(\genblk1.div_cntr_reg [19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.div_cntr_reg[17] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\genblk1.div_cntr_reg[16]_i_1_n_6 ),
        .Q(\genblk1.div_cntr_reg [17]),
        .R(rstbt_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.div_cntr_reg[18] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\genblk1.div_cntr_reg[16]_i_1_n_5 ),
        .Q(\genblk1.div_cntr_reg [18]),
        .R(rstbt_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.div_cntr_reg[19] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\genblk1.div_cntr_reg[16]_i_1_n_4 ),
        .Q(\genblk1.div_cntr_reg [19]),
        .R(rstbt_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.div_cntr_reg[1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\genblk1.div_cntr_reg[0]_i_1_n_6 ),
        .Q(\genblk1.div_cntr_reg [1]),
        .R(rstbt_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.div_cntr_reg[20] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\genblk1.div_cntr_reg[20]_i_1_n_7 ),
        .Q(\genblk1.div_cntr_reg [20]),
        .R(rstbt_IBUF));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \genblk1.div_cntr_reg[20]_i_1 
       (.CI(\genblk1.div_cntr_reg[16]_i_1_n_0 ),
        .CO(\NLW_genblk1.div_cntr_reg[20]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_genblk1.div_cntr_reg[20]_i_1_O_UNCONNECTED [3:2],\genblk1.div_cntr_reg[20]_i_1_n_6 ,\genblk1.div_cntr_reg[20]_i_1_n_7 }),
        .S({1'b0,1'b0,\genblk1.div_cntr_reg [21:20]}));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.div_cntr_reg[21] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\genblk1.div_cntr_reg[20]_i_1_n_6 ),
        .Q(\genblk1.div_cntr_reg [21]),
        .R(rstbt_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.div_cntr_reg[2] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\genblk1.div_cntr_reg[0]_i_1_n_5 ),
        .Q(\genblk1.div_cntr_reg [2]),
        .R(rstbt_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.div_cntr_reg[3] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\genblk1.div_cntr_reg[0]_i_1_n_4 ),
        .Q(\genblk1.div_cntr_reg [3]),
        .R(rstbt_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.div_cntr_reg[4] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\genblk1.div_cntr_reg[4]_i_1_n_7 ),
        .Q(S),
        .R(rstbt_IBUF));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \genblk1.div_cntr_reg[4]_i_1 
       (.CI(\genblk1.div_cntr_reg[0]_i_1_n_0 ),
        .CO({\genblk1.div_cntr_reg[4]_i_1_n_0 ,\NLW_genblk1.div_cntr_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\genblk1.div_cntr_reg[4]_i_1_n_4 ,\genblk1.div_cntr_reg[4]_i_1_n_5 ,\genblk1.div_cntr_reg[4]_i_1_n_6 ,\genblk1.div_cntr_reg[4]_i_1_n_7 }),
        .S({\genblk1.bit_cntr [2:0],S}));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.div_cntr_reg[5] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\genblk1.div_cntr_reg[4]_i_1_n_6 ),
        .Q(\genblk1.bit_cntr [0]),
        .R(rstbt_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.div_cntr_reg[6] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\genblk1.div_cntr_reg[4]_i_1_n_5 ),
        .Q(\genblk1.bit_cntr [1]),
        .R(rstbt_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.div_cntr_reg[7] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\genblk1.div_cntr_reg[4]_i_1_n_4 ),
        .Q(\genblk1.bit_cntr [2]),
        .R(rstbt_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.div_cntr_reg[8] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\genblk1.div_cntr_reg[8]_i_1_n_7 ),
        .Q(\genblk1.bit_cntr [3]),
        .R(rstbt_IBUF));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \genblk1.div_cntr_reg[8]_i_1 
       (.CI(\genblk1.div_cntr_reg[4]_i_1_n_0 ),
        .CO({\genblk1.div_cntr_reg[8]_i_1_n_0 ,\NLW_genblk1.div_cntr_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\genblk1.div_cntr_reg[8]_i_1_n_4 ,\genblk1.div_cntr_reg[8]_i_1_n_5 ,\genblk1.div_cntr_reg[8]_i_1_n_6 ,\genblk1.div_cntr_reg[8]_i_1_n_7 }),
        .S({\genblk1.div_cntr_reg [11],\genblk1.div_cntr_reg[10]_0 ,\genblk1.bit_cntr [4:3]}));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.div_cntr_reg[9] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\genblk1.div_cntr_reg[8]_i_1_n_6 ),
        .Q(\genblk1.bit_cntr [4]),
        .R(rstbt_IBUF));
  LUT3 #(
    .INIT(8'hF4)) 
    \genblk1.init_done_ff_i_1 
       (.I0(\genblk1.init_done_ff_i_2_n_0 ),
        .I1(\genblk1.init_done_ff_i_3_n_0 ),
        .I2(\genblk1.init_done_ff_reg_n_0 ),
        .O(\genblk1.init_done_ff_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFFFFFFFFFFFF)) 
    \genblk1.init_done_ff_i_2 
       (.I0(\genblk1.div_cntr_reg [20]),
        .I1(\genblk1.div_cntr_reg [12]),
        .I2(\genblk1.div_cntr_reg [11]),
        .I3(\genblk1.div_cntr_reg [21]),
        .I4(\genblk1.div_cntr_reg [13]),
        .I5(\genblk1.div_cntr_reg [14]),
        .O(\genblk1.init_done_ff_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \genblk1.init_done_ff_i_3 
       (.I0(\genblk1.div_cntr_reg [15]),
        .I1(\genblk1.div_cntr_reg [17]),
        .I2(\genblk1.div_cntr_reg [19]),
        .I3(\genblk1.div_cntr_reg [16]),
        .I4(\genblk1.div_cntr_reg [18]),
        .O(\genblk1.init_done_ff_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.init_done_ff_reg 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\genblk1.init_done_ff_i_1_n_0 ),
        .Q(\genblk1.init_done_ff_reg_n_0 ),
        .R(rstbt_IBUF));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \genblk1.rst_ff_i_1 
       (.I0(\genblk1.div_cntr_reg [18]),
        .I1(\genblk1.div_cntr_reg [16]),
        .I2(\genblk1.div_cntr_reg [19]),
        .I3(\genblk1.div_cntr_reg [17]),
        .I4(\genblk1.div_cntr_reg [15]),
        .I5(\genblk1.rst_ff_i_2_n_0 ),
        .O(\genblk1.rst_ff ));
  LUT6 #(
    .INIT(64'hFFFFFDFFFFFFFFFF)) 
    \genblk1.rst_ff_i_2 
       (.I0(\genblk1.div_cntr_reg [12]),
        .I1(\genblk1.div_cntr_reg [20]),
        .I2(\genblk1.div_cntr_reg [13]),
        .I3(\genblk1.div_cntr_reg [11]),
        .I4(\genblk1.div_cntr_reg [14]),
        .I5(\genblk1.div_cntr_reg[10]_0 ),
        .O(\genblk1.rst_ff_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.rst_ff_reg 
       (.C(clk100M_IBUF_BUFG),
        .CE(\genblk1.rst_ff ),
        .D(\genblk1.rst_ff ),
        .Q(codec_rstn_OBUF),
        .R(rstbt_IBUF));
  LUT5 #(
    .INIT(32'h00000100)) 
    \genblk1.shr_rx[23]_i_1 
       (.I0(\genblk1.div_cntr_reg [3]),
        .I1(\genblk1.div_cntr_reg [2]),
        .I2(codec_mclk_OBUF),
        .I3(S),
        .I4(\genblk1.div_cntr_reg [1]),
        .O(\genblk1.sclk_rise ));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.shr_rx_reg[0] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\genblk1.sclk_rise ),
        .D(D),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.shr_rx_reg[10] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\genblk1.sclk_rise ),
        .D(Q[9]),
        .Q(Q[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.shr_rx_reg[11] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\genblk1.sclk_rise ),
        .D(Q[10]),
        .Q(Q[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.shr_rx_reg[12] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\genblk1.sclk_rise ),
        .D(Q[11]),
        .Q(Q[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.shr_rx_reg[13] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\genblk1.sclk_rise ),
        .D(Q[12]),
        .Q(Q[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.shr_rx_reg[14] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\genblk1.sclk_rise ),
        .D(Q[13]),
        .Q(Q[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.shr_rx_reg[15] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\genblk1.sclk_rise ),
        .D(Q[14]),
        .Q(Q[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.shr_rx_reg[16] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\genblk1.sclk_rise ),
        .D(Q[15]),
        .Q(Q[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.shr_rx_reg[17] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\genblk1.sclk_rise ),
        .D(Q[16]),
        .Q(Q[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.shr_rx_reg[18] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\genblk1.sclk_rise ),
        .D(Q[17]),
        .Q(Q[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.shr_rx_reg[19] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\genblk1.sclk_rise ),
        .D(Q[18]),
        .Q(Q[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.shr_rx_reg[1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\genblk1.sclk_rise ),
        .D(Q[0]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.shr_rx_reg[20] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\genblk1.sclk_rise ),
        .D(Q[19]),
        .Q(Q[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.shr_rx_reg[21] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\genblk1.sclk_rise ),
        .D(Q[20]),
        .Q(Q[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.shr_rx_reg[22] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\genblk1.sclk_rise ),
        .D(Q[21]),
        .Q(Q[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.shr_rx_reg[23] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\genblk1.sclk_rise ),
        .D(Q[22]),
        .Q(Q[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.shr_rx_reg[2] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\genblk1.sclk_rise ),
        .D(Q[1]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.shr_rx_reg[3] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\genblk1.sclk_rise ),
        .D(Q[2]),
        .Q(Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.shr_rx_reg[4] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\genblk1.sclk_rise ),
        .D(Q[3]),
        .Q(Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.shr_rx_reg[5] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\genblk1.sclk_rise ),
        .D(Q[4]),
        .Q(Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.shr_rx_reg[6] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\genblk1.sclk_rise ),
        .D(Q[5]),
        .Q(Q[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.shr_rx_reg[7] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\genblk1.sclk_rise ),
        .D(Q[6]),
        .Q(Q[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.shr_rx_reg[8] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\genblk1.sclk_rise ),
        .D(Q[7]),
        .Q(Q[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \genblk1.shr_rx_reg[9] 
       (.C(clk100M_IBUF_BUFG),
        .CE(\genblk1.sclk_rise ),
        .D(Q[8]),
        .Q(Q[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \smpl_addr_cntr[0]_i_1 
       (.I0(aud_dout_vld),
        .I1(smpl_addr_cntr_reg),
        .O(\genblk1.aud_dout_vld_reg[0]_0 ));
endmodule

module coeff_rom
   (B,
    clk100M_IBUF_BUFG,
    Q);
  output [17:0]B;
  input clk100M_IBUF_BUFG;
  input [9:0]Q;

  wire [17:0]B;
  wire [9:0]Q;
  wire clk100M_IBUF_BUFG;
  wire [15:0]NLW_dout_reg_DOBDO_UNCONNECTED;
  wire [1:0]NLW_dout_reg_DOPBDOP_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "18432" *) 
  (* RTL_RAM_NAME = "coeff_rom_real/dout" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "17" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000001),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC),
    .INITP_03(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INITP_04(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INITP_05(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'hFEEAFF0EFF2FFF4EFF6AFF84FF9CFFB1FFC3FFD3FFE1FFECFFF4FFFBFFFE0000),
    .INIT_01(256'hFB61FBACFBF5FC3BFC7EFCBFFCFEFD3AFD74FDABFDE0FE13FE43FE70FE9BFEC4),
    .INIT_02(256'hF56DF5DEF64DF6BAF724F78BF7F1F853F8B4F912F96EF9C7FA1EFA73FAC5FB14),
    .INIT_03(256'hED1CEDB2EE46EED8EF68EFF5F080F109F18FF213F294F314F391F40BF484F4FA),
    .INIT_04(256'hE282E33CE3F4E4AAE55EE60FE6BEE76BE816E8BFE965EA09EAABEB4BEBE8EC83),
    .INIT_05(256'hD5B9D695D770D848D91ED9F2DAC4DB94DC61DD2DDDF6DEBEDF83E046E106E1C5),
    .INIT_06(256'hC6E2C7DEC8D8C9D1CAC7CBBBCCAECD9FCE8DCF7AD064D14DD233D318D3FAD4DB),
    .INIT_07(256'hB620B73AB852B968BA7CBB8FBCA0BDAEBEBCBFC7C0D0C1D8C2DEC3E2C4E3C5E4),
    .INIT_08(256'hA39DA4D2A605A736A866A994AAC0ABEBAD14AE3BAF61B085B1A8B2C8B3E7B504),
    .INIT_09(256'h8F8790D3921E936894B095F6973C987F99C29B029C429D7F9EBC9FF6A12FA267),
    .INIT_0A(256'h7A0F7B707CD07E2E7F8B80E78242839C84F4864B87A188F58A488B9A8CEA8E39),
    .INIT_0B(256'h636A64DC664D67BD692D6A9B6C086D746EDF704971B17319748075E5774A78AD),
    .INIT_0C(256'h4BD04D504ECF504D51CA534754C3563E57B859315AAA5C225D985F0E608361F7),
    .INIT_0D(256'h337B3505368E3817399F3B263CAD3E333FB9413E42C3444745CA474D48CE4A50),
    .INIT_0E(256'h1AA71C371DC71F5620E5227324022590271D28AA2A372BC42D502EDB306631F1),
    .INIT_0F(256'h0192032404B6064807DA096C0AFE0C8F0E210FB2114412D5146615F617871917),
    .INIT_10(256'hE879EA0AEB9AED2BEEBCF04EF1DFF371F502F694F826F9B8FB4AFCDCFE6E0000),
    .INIT_11(256'hCF9AD125D2B0D43CD5C9D756D8E3DA70DBFEDD8DDF1BE0AAE239E3C9E559E6E9),
    .INIT_12(256'hB732B8B3BA36BBB9BD3DBEC2C047C1CDC353C4DAC661C7E9C972CAFBCC85CE0F),
    .INIT_13(256'h9F7DA0F2A268A3DEA556A6CFA848A9C2AB3DACB9AE36AFB3B131B2B0B430B5B0),
    .INIT_14(256'h88B68A1B8B808CE78E4F8FB79121928C93F8956596D3984399B39B249C969E09),
    .INIT_15(256'h7316746675B8770B785F79B57B0C7C647DBE7F19807581D28330849085F18753),
    .INIT_16(256'h5ED1600A6144628163BE64FE663E678168C46A0A6B506C986DE26F2D707971C7),
    .INIT_17(256'h4C194D384E584F7B509F51C552EC54155540566C579A58CA59FB5B2E5C635D99),
    .INIT_18(256'h3B1D3C1E3D223E283F30403941444252436044714584469847AE48C649E04AFC),
    .INIT_19(256'h2C062CE82DCD2EB32F9C308631733261335234453539362F37283822391E3A1C),
    .INIT_1A(256'h1EFA1FBA207D2142220A22D3239F246C253C260E26E227B82890296B2A472B25),
    .INIT_1B(256'h141814B5155515F7169B174117EA1895194219F11AA21B561C0C1CC41D7E1E3B),
    .INIT_1C(256'h0B7C0BF50C6F0CEC0D6C0DED0E710EF70F80100B1098112811BA124E12E4137D),
    .INIT_1D(256'h053B058D05E20639069206EE074C07AD080F087508DC094609B30A220A930B06),
    .INIT_1E(256'h0165019001BD01ED02200255028C02C603020341038203C5040B0454049F04EC),
    .INIT_1F(256'h00020005000C0014001F002D003D004F0064007C009600B200D100F20116013C),
    .INIT_20(256'h011600F200D100B20096007C0064004F003D002D001F0014000C000500020001),
    .INIT_21(256'h049F0454040B03C503820341030202C6028C0255022001ED01BD01900165013C),
    .INIT_22(256'h0A930A2209B3094608DC0875080F07AD074C06EE0692063905E2058D053B04EC),
    .INIT_23(256'h12E4124E11BA11281098100B0F800EF70E710DED0D6C0CEC0C6F0BF50B7C0B06),
    .INIT_24(256'h1D7E1CC41C0C1B561AA219F11942189517EA1741169B15F7155514B51418137D),
    .INIT_25(256'h2A47296B289027B826E2260E253C246C239F22D3220A2142207D1FBA1EFA1E3B),
    .INIT_26(256'h391E38223728362F3539344533523261317330862F9C2EB32DCD2CE82C062B25),
    .INIT_27(256'h49E048C647AE46984584447143604252414440393F303E283D223C1E3B1D3A1C),
    .INIT_28(256'h5C635B2E59FB58CA579A566C5540541552EC51C5509F4F7B4E584D384C194AFC),
    .INIT_29(256'h70796F2D6DE26C986B506A0A68C46781663E64FE63BE62816144600A5ED15D99),
    .INIT_2A(256'h85F18490833081D280757F197DBE7C647B0C79B5785F770B75B87466731671C7),
    .INIT_2B(256'h9C969B2499B3984396D3956593F8928C91218FB78E4F8CE78B808A1B88B68753),
    .INIT_2C(256'hB430B2B0B131AFB3AE36ACB9AB3DA9C2A848A6CFA556A3DEA268A0F29F7D9E09),
    .INIT_2D(256'hCC85CAFBC972C7E9C661C4DAC353C1CDC047BEC2BD3DBBB9BA36B8B3B732B5B0),
    .INIT_2E(256'hE559E3C9E239E0AADF1BDD8DDBFEDA70D8E3D756D5C9D43CD2B0D125CF9ACE0F),
    .INIT_2F(256'hFE6EFCDCFB4AF9B8F826F694F502F371F1DFF04EEEBCED2BEB9AEA0AE879E6E9),
    .INIT_30(256'h178715F6146612D511440FB20E210C8F0AFE096C07DA064804B6032401920000),
    .INIT_31(256'h30662EDB2D502BC42A3728AA271D25902402227320E51F561DC71C371AA71917),
    .INIT_32(256'h48CE474D45CA444742C3413E3FB93E333CAD3B26399F3817368E3505337B31F1),
    .INIT_33(256'h60835F0E5D985C225AAA593157B8563E54C3534751CA504D4ECF4D504BD04A50),
    .INIT_34(256'h774A75E57480731971B170496EDF6D746C086A9B692D67BD664D64DC636A61F7),
    .INIT_35(256'h8CEA8B9A8A4888F587A1864B84F4839C824280E77F8B7E2E7CD07B707A0F78AD),
    .INIT_36(256'hA12F9FF69EBC9D7F9C429B0299C2987F973C95F694B09368921E90D38F878E39),
    .INIT_37(256'hB3E7B2C8B1A8B085AF61AE3BAD14ABEBAAC0A994A866A736A605A4D2A39DA267),
    .INIT_38(256'hC4E3C3E2C2DEC1D8C0D0BFC7BEBCBDAEBCA0BB8FBA7CB968B852B73AB620B504),
    .INIT_39(256'hD3FAD318D233D14DD064CF7ACE8DCD9FCCAECBBBCAC7C9D1C8D8C7DEC6E2C5E4),
    .INIT_3A(256'hE106E046DF83DEBEDDF6DD2DDC61DB94DAC4D9F2D91ED848D770D695D5B9D4DB),
    .INIT_3B(256'hEBE8EB4BEAABEA09E965E8BFE816E76BE6BEE60FE55EE4AAE3F4E33CE282E1C5),
    .INIT_3C(256'hF484F40BF391F314F294F213F18FF109F080EFF5EF68EED8EE46EDB2ED1CEC83),
    .INIT_3D(256'hFAC5FA73FA1EF9C7F96EF912F8B4F853F7F1F78BF724F6BAF64DF5DEF56DF4FA),
    .INIT_3E(256'hFE9BFE70FE43FE13FDE0FDABFD74FD3AFCFEFCBFFC7EFC3BFBF5FBACFB61FB14),
    .INIT_3F(256'hFFFEFFFBFFF4FFECFFE1FFD3FFC3FFB1FF9CFF84FF6AFF4EFF2FFF0EFEEAFEC4),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(0)) 
    dout_reg
       (.ADDRARDADDR({Q,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(clk100M_IBUF_BUFG),
        .CLKBWRCLK(1'b0),
        .DIADI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b1,1'b1}),
        .DIPBDIP({1'b1,1'b1}),
        .DOADO(B[15:0]),
        .DOBDO(NLW_dout_reg_DOBDO_UNCONNECTED[15:0]),
        .DOPADOP(B[17:16]),
        .DOPBDOP(NLW_dout_reg_DOPBDOP_UNCONNECTED[1:0]),
        .ENARDEN(1'b1),
        .ENBWREN(1'b0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "coeff_rom" *) 
module coeff_rom__parameterized0
   (D,
    clk100M_IBUF_BUFG,
    Q,
    pwropt,
    pwropt_1,
    pwropt_2,
    pwropt_3,
    pwropt_4);
  output [16:0]D;
  input clk100M_IBUF_BUFG;
  input [9:0]Q;
  input pwropt;
  input pwropt_1;
  input pwropt_2;
  input pwropt_3;
  input pwropt_4;

  wire [16:0]D;
  wire [9:0]Q;
  wire clk100M_IBUF_BUFG;
  wire dout_reg_ENARDEN_cooolgate_en_sig_6;
  wire pwropt;
  wire pwropt_1;
  wire pwropt_2;
  wire pwropt_3;
  wire pwropt_4;
  wire [15:0]NLW_dout_reg_DOBDO_UNCONNECTED;
  wire [1:1]NLW_dout_reg_DOPADOP_UNCONNECTED;
  wire [1:0]NLW_dout_reg_DOPBDOP_UNCONNECTED;

  (* IS_CLOCK_GATED *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p1_d16" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* POWER_OPTED_CE = "ENARDEN=NEW" *) 
  (* RTL_RAM_BITS = "17408" *) 
  (* RTL_RAM_NAME = "coeff_rom_imag/dout" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "16" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h5555555555555555555555555555555555555555555555555555555555555554),
    .INITP_01(256'h5555555555555555555555555555555555555555555555555555555555555555),
    .INITP_02(256'h5555555555555555555555555555555555555555555555555555555555555555),
    .INITP_03(256'h5555555555555555555555555555555555555555555555555555555555555555),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'hE879EA0AEB9AED2BEEBCF04EF1DFF371F502F694F826F9B8FB4AFCDCFE6E0000),
    .INIT_01(256'hCF9AD125D2B0D43CD5C9D756D8E3DA70DBFEDD8DDF1BE0AAE239E3C9E559E6E9),
    .INIT_02(256'hB732B8B3BA36BBB9BD3DBEC2C047C1CDC353C4DAC661C7E9C972CAFBCC85CE0F),
    .INIT_03(256'h9F7DA0F2A268A3DEA556A6CFA848A9C2AB3DACB9AE36AFB3B131B2B0B430B5B0),
    .INIT_04(256'h88B68A1B8B808CE78E4F8FB79121928C93F8956596D3984399B39B249C969E09),
    .INIT_05(256'h7316746675B8770B785F79B57B0C7C647DBE7F19807581D28330849085F18753),
    .INIT_06(256'h5ED1600A6144628163BE64FE663E678168C46A0A6B506C986DE26F2D707971C7),
    .INIT_07(256'h4C194D384E584F7B509F51C552EC54155540566C579A58CA59FB5B2E5C635D99),
    .INIT_08(256'h3B1D3C1E3D223E283F30403941444252436044714584469847AE48C649E04AFC),
    .INIT_09(256'h2C062CE82DCD2EB32F9C308631733261335234453539362F37283822391E3A1C),
    .INIT_0A(256'h1EFA1FBA207D2142220A22D3239F246C253C260E26E227B82890296B2A472B25),
    .INIT_0B(256'h141814B5155515F7169B174117EA1895194219F11AA21B561C0C1CC41D7E1E3B),
    .INIT_0C(256'h0B7C0BF50C6F0CEC0D6C0DED0E710EF70F80100B1098112811BA124E12E4137D),
    .INIT_0D(256'h053B058D05E20639069206EE074C07AD080F087508DC094609B30A220A930B06),
    .INIT_0E(256'h0165019001BD01ED02200255028C02C603020341038203C5040B0454049F04EC),
    .INIT_0F(256'h00020005000C0014001F002D003D004F0064007C009600B200D100F20116013C),
    .INIT_10(256'h011600F200D100B20096007C0064004F003D002D001F0014000C000500020001),
    .INIT_11(256'h049F0454040B03C503820341030202C6028C0255022001ED01BD01900165013C),
    .INIT_12(256'h0A930A2209B3094608DC0875080F07AD074C06EE0692063905E2058D053B04EC),
    .INIT_13(256'h12E4124E11BA11281098100B0F800EF70E710DED0D6C0CEC0C6F0BF50B7C0B06),
    .INIT_14(256'h1D7E1CC41C0C1B561AA219F11942189517EA1741169B15F7155514B51418137D),
    .INIT_15(256'h2A47296B289027B826E2260E253C246C239F22D3220A2142207D1FBA1EFA1E3B),
    .INIT_16(256'h391E38223728362F3539344533523261317330862F9C2EB32DCD2CE82C062B25),
    .INIT_17(256'h49E048C647AE46984584447143604252414440393F303E283D223C1E3B1D3A1C),
    .INIT_18(256'h5C635B2E59FB58CA579A566C5540541552EC51C5509F4F7B4E584D384C194AFC),
    .INIT_19(256'h70796F2D6DE26C986B506A0A68C46781663E64FE63BE62816144600A5ED15D99),
    .INIT_1A(256'h85F18490833081D280757F197DBE7C647B0C79B5785F770B75B87466731671C7),
    .INIT_1B(256'h9C969B2499B3984396D3956593F8928C91218FB78E4F8CE78B808A1B88B68753),
    .INIT_1C(256'hB430B2B0B131AFB3AE36ACB9AB3DA9C2A848A6CFA556A3DEA268A0F29F7D9E09),
    .INIT_1D(256'hCC85CAFBC972C7E9C661C4DAC353C1CDC047BEC2BD3DBBB9BA36B8B3B732B5B0),
    .INIT_1E(256'hE559E3C9E239E0AADF1BDD8DDBFEDA70D8E3D756D5C9D43CD2B0D125CF9ACE0F),
    .INIT_1F(256'hFE6EFCDCFB4AF9B8F826F694F502F371F1DFF04EEEBCED2BEB9AEA0AE879E6E9),
    .INIT_20(256'h178715F6146612D511440FB20E210C8F0AFE096C07DA064804B6032401920000),
    .INIT_21(256'h30662EDB2D502BC42A3728AA271D25902402227320E51F561DC71C371AA71917),
    .INIT_22(256'h48CE474D45CA444742C3413E3FB93E333CAD3B26399F3817368E3505337B31F1),
    .INIT_23(256'h60835F0E5D985C225AAA593157B8563E54C3534751CA504D4ECF4D504BD04A50),
    .INIT_24(256'h774A75E57480731971B170496EDF6D746C086A9B692D67BD664D64DC636A61F7),
    .INIT_25(256'h8CEA8B9A8A4888F587A1864B84F4839C824280E77F8B7E2E7CD07B707A0F78AD),
    .INIT_26(256'hA12F9FF69EBC9D7F9C429B0299C2987F973C95F694B09368921E90D38F878E39),
    .INIT_27(256'hB3E7B2C8B1A8B085AF61AE3BAD14ABEBAAC0A994A866A736A605A4D2A39DA267),
    .INIT_28(256'hC4E3C3E2C2DEC1D8C0D0BFC7BEBCBDAEBCA0BB8FBA7CB968B852B73AB620B504),
    .INIT_29(256'hD3FAD318D233D14DD064CF7ACE8DCD9FCCAECBBBCAC7C9D1C8D8C7DEC6E2C5E4),
    .INIT_2A(256'hE106E046DF83DEBEDDF6DD2DDC61DB94DAC4D9F2D91ED848D770D695D5B9D4DB),
    .INIT_2B(256'hEBE8EB4BEAABEA09E965E8BFE816E76BE6BEE60FE55EE4AAE3F4E33CE282E1C5),
    .INIT_2C(256'hF484F40BF391F314F294F213F18FF109F080EFF5EF68EED8EE46EDB2ED1CEC83),
    .INIT_2D(256'hFAC5FA73FA1EF9C7F96EF912F8B4F853F7F1F78BF724F6BAF64DF5DEF56DF4FA),
    .INIT_2E(256'hFE9BFE70FE43FE13FDE0FDABFD74FD3AFCFEFCBFFC7EFC3BFBF5FBACFB61FB14),
    .INIT_2F(256'hFFFEFFFBFFF4FFECFFE1FFD3FFC3FFB1FF9CFF84FF6AFF4EFF2FFF0EFEEAFEC4),
    .INIT_30(256'hFEEAFF0EFF2FFF4EFF6AFF84FF9CFFB1FFC3FFD3FFE1FFECFFF4FFFBFFFEFFFF),
    .INIT_31(256'hFB61FBACFBF5FC3BFC7EFCBFFCFEFD3AFD74FDABFDE0FE13FE43FE70FE9BFEC4),
    .INIT_32(256'hF56DF5DEF64DF6BAF724F78BF7F1F853F8B4F912F96EF9C7FA1EFA73FAC5FB14),
    .INIT_33(256'hED1CEDB2EE46EED8EF68EFF5F080F109F18FF213F294F314F391F40BF484F4FA),
    .INIT_34(256'hE282E33CE3F4E4AAE55EE60FE6BEE76BE816E8BFE965EA09EAABEB4BEBE8EC83),
    .INIT_35(256'hD5B9D695D770D848D91ED9F2DAC4DB94DC61DD2DDDF6DEBEDF83E046E106E1C5),
    .INIT_36(256'hC6E2C7DEC8D8C9D1CAC7CBBBCCAECD9FCE8DCF7AD064D14DD233D318D3FAD4DB),
    .INIT_37(256'hB620B73AB852B968BA7CBB8FBCA0BDAEBEBCBFC7C0D0C1D8C2DEC3E2C4E3C5E4),
    .INIT_38(256'hA39DA4D2A605A736A866A994AAC0ABEBAD14AE3BAF61B085B1A8B2C8B3E7B504),
    .INIT_39(256'h8F8790D3921E936894B095F6973C987F99C29B029C429D7F9EBC9FF6A12FA267),
    .INIT_3A(256'h7A0F7B707CD07E2E7F8B80E78242839C84F4864B87A188F58A488B9A8CEA8E39),
    .INIT_3B(256'h636A64DC664D67BD692D6A9B6C086D746EDF704971B17319748075E5774A78AD),
    .INIT_3C(256'h4BD04D504ECF504D51CA534754C3563E57B859315AAA5C225D985F0E608361F7),
    .INIT_3D(256'h337B3505368E3817399F3B263CAD3E333FB9413E42C3444745CA474D48CE4A50),
    .INIT_3E(256'h1AA71C371DC71F5620E5227324022590271D28AA2A372BC42D502EDB306631F1),
    .INIT_3F(256'h0192032404B6064807DA096C0AFE0C8F0E210FB2114412D5146615F617871917),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(0)) 
    dout_reg
       (.ADDRARDADDR({Q,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(clk100M_IBUF_BUFG),
        .CLKBWRCLK(1'b0),
        .DIADI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b1}),
        .DIPBDIP({1'b1,1'b1}),
        .DOADO(D[15:0]),
        .DOBDO(NLW_dout_reg_DOBDO_UNCONNECTED[15:0]),
        .DOPADOP({NLW_dout_reg_DOPADOP_UNCONNECTED[1],D[16]}),
        .DOPBDOP(NLW_dout_reg_DOPBDOP_UNCONNECTED[1:0]),
        .ENARDEN(dout_reg_ENARDEN_cooolgate_en_sig_6),
        .ENBWREN(1'b0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  LUT5 #(
    .INIT(32'hFFABABFF)) 
    dout_reg_ENARDEN_cooolgate_en_gate_8_LOPT_REMAP
       (.I0(pwropt),
        .I1(pwropt_1),
        .I2(pwropt_2),
        .I3(pwropt_3),
        .I4(pwropt_4),
        .O(dout_reg_ENARDEN_cooolgate_en_sig_6));
endmodule

module dB_value_rom
   (DOADO,
    clk100M_IBUF_BUFG,
    Q);
  output [22:0]DOADO;
  input clk100M_IBUF_BUFG;
  input [9:0]Q;

  wire [22:0]DOADO;
  wire [9:0]Q;
  wire clk100M_IBUF_BUFG;
  wire NLW_dout_reg_CASCADEOUTA_UNCONNECTED;
  wire NLW_dout_reg_CASCADEOUTB_UNCONNECTED;
  wire NLW_dout_reg_DBITERR_UNCONNECTED;
  wire NLW_dout_reg_INJECTDBITERR_UNCONNECTED;
  wire NLW_dout_reg_INJECTSBITERR_UNCONNECTED;
  wire NLW_dout_reg_SBITERR_UNCONNECTED;
  wire [31:23]NLW_dout_reg_DOADO_UNCONNECTED;
  wire [31:0]NLW_dout_reg_DOBDO_UNCONNECTED;
  wire [3:0]NLW_dout_reg_DOPADOP_UNCONNECTED;
  wire [3:0]NLW_dout_reg_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_dout_reg_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_dout_reg_RDADDRECC_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d23" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "23552" *) 
  (* RTL_RAM_NAME = "dout" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "22" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0010E6E6000F9022000DFAB9000C0A8C00098ADC000605460000000000000000),
    .INIT_01(256'h001785960016EC2C00164763001595680014D3EE00140000001315B800120FD2),
    .INIT_02(256'h001B3C0B001AD934001A71C3001A05460019933700191AFE00189BE600181518),
    .INIT_03(256'h001DD3C5001D8ADC001D3F7A001CF172001CA095001C4CA9001BF573001B9AAE),
    .INIT_04(256'h001FD240001F987D001F5D31001F2044001EE1A0001EA12C001E5ECA001E1A5E),
    .INIT_05(256'h0021712400214151002110720020DE7A0020AB5B002077090020417400200A8C),
    .INIT_06(256'h0022CEA80022A5DB00227C4A002251EF002226C20021FAB90021CDCD00219FF4),
    .INIT_07(256'h0023FC9F0023D90B0023B4E30023902200236AC3002344C000231E140022F6B9),
    .INIT_08(256'h002506710024E6E60024C6E80024A67200248580002464100024421D00241FA4),
    .INIT_09(256'h0025F3D90025D7860025BAD500259DC30025805000256277002544360025258A),
    .INIT_0A(256'h0026CA560026B0A10026969F00267C4F002661AE002646BA00262B7100260FD2),
    .INIT_0B(256'h00278DF10027766A00275EA10027469700272E4A002715B80026FCE00026E3C0),
    .INIT_0C(256'h002841BA00282C0800281620002800000027E9A60027D3130027BC450027A53A),
    .INIT_0D(256'h0028E80D0028D3EE0028BF9F0028AB21002896710028819000286C7D00285735),
    .INIT_0E(256'h002982CC0029700900295D1C00294A06002936C50029235A00290FC20028FBFF),
    .INIT_0F(256'h002A1379002A01E50029F02D0029DE510029CC500029BA290029A7DC00299568),
    .INIT_10(256'h002A9B4F002A8AC6002A7A1E002A6956002A586D002A4763002A3638002A24EA),
    .INIT_11(256'h002B1B52002B0BB7002AFC00002AEC2C002ADC3C002ACC2E002ABC02002AABB8),
    .INIT_12(256'h002B945C002B8596002B76B6002B67BD002B58AA002B497C002B3A34002B2AD0),
    .INIT_13(256'h002C0727002BF91F002BEB01002BDCCC002BCE7F002BC01B002BB19E002BA30A),
    .INIT_14(256'h002C744E002C66F4002C5984002C4C00002C3E66002C30B7002C22F2002C1518),
    .INIT_15(256'h002CDC5A002CCF9C002CC2CB002CB5E7002CA8F0002C9BE6002C8EC7002C8195),
    .INIT_16(256'h002D3FBF002D3390002D2750002D1AFE002D0E9B002D0226002CF59F002CE906),
    .INIT_17(256'h002D9EE4002D9337002D877C002D7BB0002D6FD4002D63E8002D57EB002D4BDE),
    .INIT_18(256'h002DFA20002DEEEC002DE3AA002DD859002DCCFA002DC18B002DB60D002DAA80),
    .INIT_19(256'h002E51C4002E4700002E3C2E002E314E002E2661002E1B66002E105D002E0546),
    .INIT_1A(256'h002EA615002E9BB7002E914D002E86D6002E7C53002E71C3002E6726002E5C7B),
    .INIT_1B(256'h002EF752002EED53002EE349002ED934002ECF12002EC4E5002EBAAC002EB067),
    .INIT_1C(256'h002F45B1002F3C0B002F325B002F28A0002F1EDA002F1509002F0B2C002F0145),
    .INIT_1D(256'h002F9165002F8812002F7EB6002F754F002F6BDE002F6262002F58DC002F4F4C),
    .INIT_1E(256'h002FDA9B002FD196002FC887002FBF6F002FB64D002FAD22002FA3ED002F9AAE),
    .INIT_1F(256'h0030217C003018BF00300FFA0030072B002FFE54002FF573002FEC8A002FE397),
    .INIT_20(256'h0030662C00305DB30030553300304CA90030441800303B7E003032DB00302A30),
    .INIT_21(256'h0030A8CD0030A095003098540030900C003087BC00307F640030770400306E9C),
    .INIT_22(256'h0030E97E0030E1820030D97F0030D1740030C9620030C1480030B9270030B0FE),
    .INIT_23(256'h0031285A00312098003118CE003110FD00310925003101460030F9600030F172),
    .INIT_24(256'h0031657D00315DF00031565C00314EC20031472100313F7A003137CC00313016),
    .INIT_25(256'h0031A0FC003199A20031924200318ADC0031836F00317BFC0031748300316D03),
    .INIT_26(256'h0031DAEE0031D3C50031CC960031C5610031BE260031B6E40031AF9D0031A850),
    .INIT_27(256'h0032136800320C6D0032056C0031FE650031F7590031F0470031E92F0031E212),
    .INIT_28(256'h00324A7C003243AC00323CD7003235FD00322F1D003228380032214E00321A5E),
    .INIT_29(256'h0032803A00327994003272EA00326C3A0032658400325ECA0032580B00325146),
    .INIT_2A(256'h0032B4B40032AE360032A7B30032A12C00329A9F0032940D00328D77003286DB),
    .INIT_2B(256'h0032E7F80032E1A00032DB440032D4E20032CE7C0032C8110032C1A20032BB2D),
    .INIT_2C(256'h00331A15003313E100330DA90033076C0033012B0032FAE50032F49B0032EE4C),
    .INIT_2D(256'h00334B170033450500333EF0003338D6003332B800332C960033266F00332044),
    .INIT_2E(256'h00337B0A0033751A00336F260033692E0033633100335D310033572C00335124),
    .INIT_2F(256'h0033A9FA0033A42A00339E550033987D003392A100338CC2003386DE003380F6),
    .INIT_30(256'h0033D7F10033D2400033CC8A0033C6D10033C1140033BB530033B58F0033AFC6),
    .INIT_31(256'h003404FB0033FF660033F9CE0033F4330033EE930033E8F00033E34A0033DD9F),
    .INIT_32(256'h0034311F00342BA70034262B003420AC00341B29003415A30034101900340A8C),
    .INIT_33(256'h00345C680034570A003451AA00344C46003446DE0034417400343C0500343694),
    .INIT_34(256'h003486DC0034819900347C5300347709003471BC00346C6C00346718003461C2),
    .INIT_35(256'h0034B0860034AB5B0034A62E0034A0FD00349BCA003496930034915900348C1C),
    .INIT_36(256'h0034D96B0034D4580034CF430034CA2B0034C5100034BFF20034BAD10034B5AD),
    .INIT_37(256'h003501930034FC980034F79A0034F2990034ED960034E88F0034E3860034DE7A),
    .INIT_38(256'h003529040035242000351F3900351A4F003515620035107200350B800035068B),
    .INIT_39(256'h00354FC600354AF7003546260035415100353C7B003537A1003532C500352DE6),
    .INIT_3A(256'h003575DD0035712400356C67003567A8003562E700355E220035595B00355492),
    .INIT_3B(256'h00359B51003596AB0035920300358D58003588AB003583FC00357F4900357A95),
    .INIT_3C(256'h0035C0250035BB930035B6FF0035B2680035ADCF0035A9330035A49500359FF4),
    .INIT_3D(256'h0035E4600035DFE10035DB600035D6DC0035D2560035CDCD0035C9420035C4B5),
    .INIT_3E(256'h003608070036039A0035FF2B0035FAB90035F6460035F1D00035ED580035E8DD),
    .INIT_3F(256'h00362B1D003626C20036226500361E05003619A400361540003610DA00360C71),
    .INIT_40(256'h00364DA80036495E00364512003640C400363C7300363821003633CD00362F76),
    .INIT_41(256'h00366FAB00366B7200366737003662F900365EBA00365A7900365635003651EF),
    .INIT_42(256'h0036912B00368D02003688D7003684AA0036807B00367C4A00367817003673E2),
    .INIT_43(256'h0036B22C0036AE130036A9F80036A5DB0036A1BC00369D9A0036997700369552),
    .INIT_44(256'h0036D2B20036CEA80036CA9C0036C68E0036C27E0036BE6D0036BA590036B644),
    .INIT_45(256'h0036F2BF0036EEC40036EAC70036E6C80036E2C70036DEC50036DAC00036D6BA),
    .INIT_46(256'h0037125800370E6B00370A7C0037068C0037029A0036FEA60036FAB00036F6B9),
    .INIT_47(256'h0037317F00372DA0003729C0003725DE003721FA00371E1400371A2C00371643),
    .INIT_48(256'h0037503900374C6700374894003744C0003740EA00373D12003739380037355C),
    .INIT_49(256'h00376E8700376AC3003766FD0037633600375F6D00375BA2003757D600375408),
    .INIT_4A(256'h00378C6C003788B5003784FD0037814200377D86003779C90037760A00377249),
    .INIT_4B(256'h0037A9ED0037A6420037A29600379EE800379B3900379788003793D600379022),
    .INIT_4C(256'h0037C70A0037C36C0037BFCC0037BC2A0037B8870037B4E30037B13D0037AD96),
    .INIT_4D(256'h0037E3C70037E0340037DCA10037D90B0037D5740037D1DC0037CE420037CAA7),
    .INIT_4E(256'h003800260037FC9F0037F9170037F58D0037F2020037EE750037EAE70037E758),
    .INIT_4F(256'h00381C2A003818AE00381531003811B300380E3300380AB20038072F003803AB),
    .INIT_50(256'h003837D400383463003830F200382D7E00382A0A003826940038231C00381FA4),
    .INIT_51(256'h0038532700384FC200384C5B003848F2003845880038421D00383EB100383B43),
    .INIT_52(256'h00386E2600386ACA0038676E00386410003860B100385D51003859EF0038568C),
    .INIT_53(256'h003888D1003885800038822E00387EDB00387B8600387830003874D800387180),
    .INIT_54(256'h0038A32C00389FE500389C9D0038995300389609003892BD00388F6F00388C21),
    .INIT_55(256'h0038BD370038B9FA0038B6BC0038B37C0038B03B0038ACF90038A9B60038A672),
    .INIT_56(256'h0038D6F60038D3C20038D08D0038CD570038CA200038C6E80038C3AE0038C073),
    .INIT_57(256'h0038F0690038ED3E0038EA130038E6E60038E3B90038E08A0038DD5A0038DA28),
    .INIT_58(256'h00390992003906710039034F0039002B0038FD070038F9E10038F6BA0038F392),
    .INIT_59(256'h0039227300391F5B00391C42003919270039160C003912EF00390FD100390CB2),
    .INIT_5A(256'h00393B0E003937FE003934EE003931DC00392EC900392BB5003928A00039258A),
    .INIT_5B(256'h003953640039505D00394D5500394A4B00394741003944360039412A00393E1C),
    .INIT_5C(256'h00396B7600396877003965780039627700395F7500395C720039596E0039566A),
    .INIT_5D(256'h003983460039805000397D5800397A60003977660039746C0039717000396E74),
    .INIT_5E(256'h00399AD6003997E8003994F80039920800398F1600398C24003989300039863C),
    .INIT_5F(256'h0039B2260039AF400039AC580039A9700039A6860039A39C0039A0B000399DC3),
    .INIT_60(256'h0039C9390039C65A0039C37A0039C0990039BDB70039BAD50039B7F10039B50C),
    .INIT_61(256'h0039E00F0039DD370039DA5F0039D7860039D4AB0039D1D00039CEF40039CC17),
    .INIT_62(256'h0039F6A90039F3D90039F1080039EE360039EB640039E8900039E5BB0039E2E5),
    .INIT_63(256'h003A0D0A003A0A41003A0777003A04AC003A01E10039FF140039FC470039F979),
    .INIT_64(256'h003A2331003A206F003A1DAC003A1AE9003A1824003A155F003A1299003A0FD2),
    .INIT_65(256'h003A3920003A3665003A33A9003A30ED003A2E2F003A2B71003A28B2003A25F2),
    .INIT_66(256'h003A4ED8003A4C24003A496F003A46BA003A4403003A414C003A3E93003A3BDA),
    .INIT_67(256'h003A645B003A61AE003A5EFF003A5C50003A59A0003A56F0003A543E003A518C),
    .INIT_68(256'h003A79A9003A7702003A745A003A71B2003A6F08003A6C5E003A69B3003A6708),
    .INIT_69(256'h003A8EC3003A8C22003A8981003A86DF003A843C003A8199003A7EF4003A7C4F),
    .INIT_6A(256'h003AA3AA003AA110003A9E75003A9BD9003A993D003A969F003A9401003A9163),
    .INIT_6B(256'h003AB860003AB5CC003AB337003AB0A1003AAE0B003AAB74003AA8DC003AA644),
    .INIT_6C(256'h003ACCE4003ACA56003AC7C8003AC538003AC2A8003AC017003ABD85003ABAF3),
    .INIT_6D(256'h003AE139003ADEB1003ADC28003AD99E003AD714003AD489003AD1FE003ACF71),
    .INIT_6E(256'h003AF55E003AF2DC003AF059003AEDD5003AEB51003AE8CC003AE646003AE3C0),
    .INIT_6F(256'h003B0955003B06D9003B045C003B01DE003AFF5F003AFCE0003AFA60003AF7DF),
    .INIT_70(256'h003B1D1F003B1AA8003B1830003B15B8003B133F003B10C6003B0E4C003B0BD1),
    .INIT_71(256'h003B30BB003B2E4A003B2BD8003B2966003B26F3003B247F003B220A003B1F95),
    .INIT_72(256'h003B442C003B41C1003B3F54003B3CE7003B3A79003B380B003B359C003B332C),
    .INIT_73(256'h003B5772003B550C003B52A5003B503D003B4DD5003B4B6C003B4902003B4697),
    .INIT_74(256'h003B6A8E003B682D003B65CB003B6368003B6105003B5EA1003B5C3D003B59D8),
    .INIT_75(256'h003B7D7F003B7B23003B78C7003B766A003B740C003B71AD003B6F4E003B6CEE),
    .INIT_76(256'h003B9048003B8DF1003B8B9A003B8942003B86E9003B8490003B8235003B7FDB),
    .INIT_77(256'h003BA2E9003BA097003B9E44003B9BF1003B999E003B9749003B94F4003B929F),
    .INIT_78(256'h003BB562003BB315003BB0C7003BAE79003BAC2A003BA9DB003BA78B003BA53A),
    .INIT_79(256'h003BC7B4003BC56B003BC323003BC0D9003BBE8F003BBC45003BB9FA003BB7AE),
    .INIT_7A(256'h003BD9DF003BD79C003BD558003BD313003BD0CE003BCE88003BCC42003BC9FB),
    .INIT_7B(256'h003BEBE5003BE9A6003BE767003BE527003BE2E7003BE0A6003BDE64003BDC22),
    .INIT_7C(256'h003BFDC6003BFB8C003BF951003BF716003BF4DA003BF29E003BF061003BEE23),
    .INIT_7D(256'h003C0F82003C0D4D003C0B17003C08E0003C06A9003C0471003C0238003C0000),
    .INIT_7E(256'h003C211B003C1EEA003C1CB8003C1A86003C1853003C1620003C13EC003C11B7),
    .INIT_7F(256'h003C3290003C3063003C2E36003C2C08003C29DA003C27AB003C257B003C234B),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(0)) 
    dout_reg
       (.ADDRARDADDR({1'b1,Q,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b1),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(NLW_dout_reg_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_dout_reg_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(clk100M_IBUF_BUFG),
        .CLKBWRCLK(1'b0),
        .DBITERR(NLW_dout_reg_DBITERR_UNCONNECTED),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b1,1'b1,1'b1,1'b1}),
        .DOADO({NLW_dout_reg_DOADO_UNCONNECTED[31:23],DOADO}),
        .DOBDO(NLW_dout_reg_DOBDO_UNCONNECTED[31:0]),
        .DOPADOP(NLW_dout_reg_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP(NLW_dout_reg_DOPBDOP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_dout_reg_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(1'b1),
        .ENBWREN(1'b0),
        .INJECTDBITERR(NLW_dout_reg_INJECTDBITERR_UNCONNECTED),
        .INJECTSBITERR(NLW_dout_reg_INJECTSBITERR_UNCONNECTED),
        .RDADDRECC(NLW_dout_reg_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_dout_reg_SBITERR_UNCONNECTED),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

module dsp_25x18
   (din_b_i,
    din_a_i,
    clk100M_IBUF_BUFG,
    Q,
    p_reg_reg_0,
    PCOUT,
    ram_array_reg,
    ram_array_reg_0,
    write_cntr_0_posedge,
    write_cntr_0_posedge_delay,
    P,
    ram_array_reg_1,
    ram_array_reg_2);
  output [23:0]din_b_i;
  output [47:0]din_a_i;
  input clk100M_IBUF_BUFG;
  input [16:0]Q;
  input [23:0]p_reg_reg_0;
  input [47:0]PCOUT;
  input ram_array_reg;
  input ram_array_reg_0;
  input write_cntr_0_posedge;
  input write_cntr_0_posedge_delay;
  input [23:0]P;
  input ram_array_reg_1;
  input ram_array_reg_2;

  wire [23:0]P;
  wire [47:0]PCOUT;
  wire [16:0]Q;
  wire clk100M_IBUF_BUFG;
  wire [47:0]din_a_i;
  wire [23:0]din_b_i;
  wire [23:0]p_reg_reg_0;
  wire p_reg_reg_n_58;
  wire p_reg_reg_n_67;
  wire p_reg_reg_n_68;
  wire p_reg_reg_n_69;
  wire p_reg_reg_n_70;
  wire p_reg_reg_n_71;
  wire p_reg_reg_n_72;
  wire p_reg_reg_n_73;
  wire p_reg_reg_n_74;
  wire p_reg_reg_n_75;
  wire p_reg_reg_n_76;
  wire p_reg_reg_n_77;
  wire p_reg_reg_n_78;
  wire p_reg_reg_n_79;
  wire p_reg_reg_n_80;
  wire p_reg_reg_n_81;
  wire p_reg_reg_n_82;
  wire p_reg_reg_n_83;
  wire p_reg_reg_n_84;
  wire p_reg_reg_n_85;
  wire p_reg_reg_n_86;
  wire p_reg_reg_n_87;
  wire p_reg_reg_n_88;
  wire p_reg_reg_n_89;
  wire ram_array_reg;
  wire ram_array_reg_0;
  wire ram_array_reg_1;
  wire ram_array_reg_2;
  wire write_cntr_0_posedge;
  wire write_cntr_0_posedge_delay;
  wire NLW_p_reg_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_p_reg_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_p_reg_reg_OVERFLOW_UNCONNECTED;
  wire NLW_p_reg_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_p_reg_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_p_reg_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_p_reg_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_p_reg_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_p_reg_reg_CARRYOUT_UNCONNECTED;
  wire [46:0]NLW_p_reg_reg_P_UNCONNECTED;
  wire [47:0]NLW_p_reg_reg_PCOUT_UNCONNECTED;

  (* OPT_MODIFIED = "SWEEP" *) 
  DSP48E1 #(
    .ACASCREG(2),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(2),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(2),
    .BREG(2),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    p_reg_reg
       (.A({p_reg_reg_0[23],p_reg_reg_0[23],p_reg_reg_0[23],p_reg_reg_0[23],p_reg_reg_0[23],p_reg_reg_0[23],p_reg_reg_0}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_p_reg_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({Q[16],Q}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_p_reg_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_p_reg_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_p_reg_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b1),
        .CEA2(1'b1),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b1),
        .CEB2(1'b1),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b1),
        .CEP(1'b1),
        .CLK(clk100M_IBUF_BUFG),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_p_reg_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_p_reg_reg_OVERFLOW_UNCONNECTED),
        .P({p_reg_reg_n_58,NLW_p_reg_reg_P_UNCONNECTED[46:39],p_reg_reg_n_67,p_reg_reg_n_68,p_reg_reg_n_69,p_reg_reg_n_70,p_reg_reg_n_71,p_reg_reg_n_72,p_reg_reg_n_73,p_reg_reg_n_74,p_reg_reg_n_75,p_reg_reg_n_76,p_reg_reg_n_77,p_reg_reg_n_78,p_reg_reg_n_79,p_reg_reg_n_80,p_reg_reg_n_81,p_reg_reg_n_82,p_reg_reg_n_83,p_reg_reg_n_84,p_reg_reg_n_85,p_reg_reg_n_86,p_reg_reg_n_87,p_reg_reg_n_88,p_reg_reg_n_89,NLW_p_reg_reg_P_UNCONNECTED[15:0]}),
        .PATTERNBDETECT(NLW_p_reg_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_p_reg_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN(PCOUT),
        .PCOUT(NLW_p_reg_reg_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_p_reg_reg_UNDERFLOW_UNCONNECTED));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_10__2
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_75),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[14]),
        .O(din_b_i[14]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_10__3
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_75),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[14]),
        .O(din_a_i[14]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_10__4
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_75),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[14]),
        .O(din_a_i[38]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_11__2
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_76),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[13]),
        .O(din_b_i[13]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_11__3
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_76),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[13]),
        .O(din_a_i[13]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_11__4
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_76),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[13]),
        .O(din_a_i[37]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_12__2
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_77),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[12]),
        .O(din_b_i[12]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_12__3
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_77),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[12]),
        .O(din_a_i[12]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_12__4
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_77),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[12]),
        .O(din_a_i[36]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_13__2
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_78),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[11]),
        .O(din_b_i[11]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_13__3
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_78),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[11]),
        .O(din_a_i[11]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_13__4
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_78),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[11]),
        .O(din_a_i[35]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_14__2
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_79),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[10]),
        .O(din_b_i[10]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_14__3
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_79),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[10]),
        .O(din_a_i[10]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_14__4
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_79),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[10]),
        .O(din_a_i[34]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_15__2
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_80),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[9]),
        .O(din_b_i[9]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_15__3
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_80),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[9]),
        .O(din_a_i[9]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_15__4
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_80),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[9]),
        .O(din_a_i[33]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_16__2
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_81),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[8]),
        .O(din_b_i[8]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_16__3
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_81),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[8]),
        .O(din_a_i[8]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_16__4
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_81),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[8]),
        .O(din_a_i[32]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_17__2
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_82),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[7]),
        .O(din_b_i[7]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_17__3
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_82),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[7]),
        .O(din_a_i[7]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_17__4
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_82),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[7]),
        .O(din_a_i[31]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_18__2
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_83),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[6]),
        .O(din_b_i[6]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_18__3
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_83),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[6]),
        .O(din_a_i[6]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_18__4
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_83),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[6]),
        .O(din_a_i[30]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_19__2
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_84),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[5]),
        .O(din_b_i[5]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_19__3
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_84),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[5]),
        .O(din_a_i[5]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_19__4
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_84),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[5]),
        .O(din_a_i[29]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_1__1
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_58),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[23]),
        .O(din_b_i[23]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_1__2
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_58),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[23]),
        .O(din_a_i[23]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_1__3
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_58),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[23]),
        .O(din_a_i[47]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_20__2
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_85),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[4]),
        .O(din_b_i[4]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_20__3
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_85),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[4]),
        .O(din_a_i[4]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_20__4
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_85),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[4]),
        .O(din_a_i[28]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_21__2
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_86),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[3]),
        .O(din_b_i[3]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_21__3
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_86),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[3]),
        .O(din_a_i[3]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_21__4
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_86),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[3]),
        .O(din_a_i[27]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_22__2
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_87),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[2]),
        .O(din_b_i[2]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_22__3
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_87),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[2]),
        .O(din_a_i[2]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_22__4
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_87),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[2]),
        .O(din_a_i[26]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_23__2
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_88),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[1]),
        .O(din_b_i[1]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_23__3
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_88),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[1]),
        .O(din_a_i[1]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_23__4
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_88),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[1]),
        .O(din_a_i[25]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_24__2
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_89),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[0]),
        .O(din_b_i[0]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_24__3
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_89),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[0]),
        .O(din_a_i[0]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_24__4
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_89),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[0]),
        .O(din_a_i[24]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_2__2
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_67),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[22]),
        .O(din_b_i[22]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_2__3
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_67),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[22]),
        .O(din_a_i[22]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_2__4
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_67),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[22]),
        .O(din_a_i[46]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_3__2
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_68),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[21]),
        .O(din_b_i[21]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_3__3
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_68),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[21]),
        .O(din_a_i[21]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_3__4
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_68),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[21]),
        .O(din_a_i[45]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_4__2
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_69),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[20]),
        .O(din_b_i[20]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_4__3
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_69),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[20]),
        .O(din_a_i[20]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_4__4
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_69),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[20]),
        .O(din_a_i[44]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_5__2
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_70),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[19]),
        .O(din_b_i[19]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_5__3
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_70),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[19]),
        .O(din_a_i[19]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_5__4
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_70),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[19]),
        .O(din_a_i[43]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_6__2
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_71),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[18]),
        .O(din_b_i[18]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_6__3
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_71),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[18]),
        .O(din_a_i[18]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_6__4
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_71),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[18]),
        .O(din_a_i[42]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_7__2
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_72),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[17]),
        .O(din_b_i[17]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_7__3
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_72),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[17]),
        .O(din_a_i[17]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_7__4
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_72),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[17]),
        .O(din_a_i[41]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_8__2
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_73),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[16]),
        .O(din_b_i[16]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_8__3
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_73),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[16]),
        .O(din_a_i[16]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_8__4
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_73),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[16]),
        .O(din_a_i[40]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_9__2
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_74),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[15]),
        .O(din_b_i[15]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_9__3
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_74),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[15]),
        .O(din_a_i[15]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_9__4
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_74),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[15]),
        .O(din_a_i[39]));
endmodule

(* ORIG_REF_NAME = "dsp_25x18" *) 
module dsp_25x18_11
   (P,
    clk100M_IBUF_BUFG,
    p_reg_reg_0,
    p_reg_reg_1,
    PCOUT);
  output [23:0]P;
  input clk100M_IBUF_BUFG;
  input [16:0]p_reg_reg_0;
  input [23:0]p_reg_reg_1;
  input [47:0]PCOUT;

  wire [23:0]P;
  wire [47:0]PCOUT;
  wire clk100M_IBUF_BUFG;
  wire [16:0]p_reg_reg_0;
  wire [23:0]p_reg_reg_1;
  wire NLW_p_reg_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_p_reg_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_p_reg_reg_OVERFLOW_UNCONNECTED;
  wire NLW_p_reg_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_p_reg_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_p_reg_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_p_reg_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_p_reg_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_p_reg_reg_CARRYOUT_UNCONNECTED;
  wire [46:0]NLW_p_reg_reg_P_UNCONNECTED;
  wire [47:0]NLW_p_reg_reg_PCOUT_UNCONNECTED;

  (* OPT_MODIFIED = "SWEEP" *) 
  DSP48E1 #(
    .ACASCREG(2),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(2),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(2),
    .BREG(2),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    p_reg_reg
       (.A({p_reg_reg_1[23],p_reg_reg_1[23],p_reg_reg_1[23],p_reg_reg_1[23],p_reg_reg_1[23],p_reg_reg_1[23],p_reg_reg_1}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_p_reg_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({p_reg_reg_0[16],p_reg_reg_0}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_p_reg_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_p_reg_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_p_reg_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b1),
        .CEA2(1'b1),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b1),
        .CEB2(1'b1),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b1),
        .CEP(1'b1),
        .CLK(clk100M_IBUF_BUFG),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_p_reg_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_p_reg_reg_OVERFLOW_UNCONNECTED),
        .P({P[23],NLW_p_reg_reg_P_UNCONNECTED[46:39],P[22:0],NLW_p_reg_reg_P_UNCONNECTED[15:0]}),
        .PATTERNBDETECT(NLW_p_reg_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_p_reg_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN(PCOUT),
        .PCOUT(NLW_p_reg_reg_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_p_reg_reg_UNDERFLOW_UNCONNECTED));
endmodule

(* ORIG_REF_NAME = "dsp_25x18" *) 
module dsp_25x18_13
   (P,
    p_reg_reg_0,
    clk100M_IBUF_BUFG,
    p_reg_reg_1,
    A,
    PCOUT);
  output [23:0]P;
  input p_reg_reg_0;
  input clk100M_IBUF_BUFG;
  input [16:0]p_reg_reg_1;
  input [23:0]A;
  input [47:0]PCOUT;

  wire [23:0]A;
  wire [23:0]P;
  wire [47:0]PCOUT;
  wire clk100M_IBUF_BUFG;
  wire p_reg_reg_0;
  wire [16:0]p_reg_reg_1;
  wire NLW_p_reg_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_p_reg_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_p_reg_reg_OVERFLOW_UNCONNECTED;
  wire NLW_p_reg_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_p_reg_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_p_reg_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_p_reg_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_p_reg_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_p_reg_reg_CARRYOUT_UNCONNECTED;
  wire [46:0]NLW_p_reg_reg_P_UNCONNECTED;
  wire [47:0]NLW_p_reg_reg_PCOUT_UNCONNECTED;

  (* OPT_MODIFIED = "SWEEP" *) 
  DSP48E1 #(
    .ACASCREG(2),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(2),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(2),
    .BREG(2),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(0),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("TRUE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    p_reg_reg
       (.A({A[23],A[23],A[23],A[23],A[23],A[23],A}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_p_reg_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({p_reg_reg_1[16],p_reg_reg_1}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_p_reg_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_p_reg_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_p_reg_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(p_reg_reg_0),
        .CEA2(1'b1),
        .CEAD(1'b1),
        .CEALUMODE(1'b0),
        .CEB1(1'b1),
        .CEB2(1'b1),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b1),
        .CEP(1'b1),
        .CLK(clk100M_IBUF_BUFG),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b1,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_p_reg_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_p_reg_reg_OVERFLOW_UNCONNECTED),
        .P({P[23],NLW_p_reg_reg_P_UNCONNECTED[46:39],P[22:0],NLW_p_reg_reg_P_UNCONNECTED[15:0]}),
        .PATTERNBDETECT(NLW_p_reg_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_p_reg_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN(PCOUT),
        .PCOUT(NLW_p_reg_reg_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_p_reg_reg_UNDERFLOW_UNCONNECTED));
endmodule

(* ORIG_REF_NAME = "dsp_25x18" *) 
module dsp_25x18_9
   (din_b_i,
    din_a_i,
    p_reg_reg_0,
    clk100M_IBUF_BUFG,
    Q,
    A,
    PCOUT,
    ram_array_reg,
    ram_array_reg_0,
    write_cntr_0_posedge,
    write_cntr_0_posedge_delay,
    P,
    ram_array_reg_1,
    ram_array_reg_2);
  output [23:0]din_b_i;
  output [47:0]din_a_i;
  input p_reg_reg_0;
  input clk100M_IBUF_BUFG;
  input [16:0]Q;
  input [23:0]A;
  input [47:0]PCOUT;
  input ram_array_reg;
  input ram_array_reg_0;
  input write_cntr_0_posedge;
  input write_cntr_0_posedge_delay;
  input [23:0]P;
  input ram_array_reg_1;
  input ram_array_reg_2;

  wire [23:0]A;
  wire [23:0]P;
  wire [47:0]PCOUT;
  wire [16:0]Q;
  wire clk100M_IBUF_BUFG;
  wire [47:0]din_a_i;
  wire [23:0]din_b_i;
  wire p_reg_reg_0;
  wire p_reg_reg_n_58;
  wire p_reg_reg_n_67;
  wire p_reg_reg_n_68;
  wire p_reg_reg_n_69;
  wire p_reg_reg_n_70;
  wire p_reg_reg_n_71;
  wire p_reg_reg_n_72;
  wire p_reg_reg_n_73;
  wire p_reg_reg_n_74;
  wire p_reg_reg_n_75;
  wire p_reg_reg_n_76;
  wire p_reg_reg_n_77;
  wire p_reg_reg_n_78;
  wire p_reg_reg_n_79;
  wire p_reg_reg_n_80;
  wire p_reg_reg_n_81;
  wire p_reg_reg_n_82;
  wire p_reg_reg_n_83;
  wire p_reg_reg_n_84;
  wire p_reg_reg_n_85;
  wire p_reg_reg_n_86;
  wire p_reg_reg_n_87;
  wire p_reg_reg_n_88;
  wire p_reg_reg_n_89;
  wire ram_array_reg;
  wire ram_array_reg_0;
  wire ram_array_reg_1;
  wire ram_array_reg_2;
  wire write_cntr_0_posedge;
  wire write_cntr_0_posedge_delay;
  wire NLW_p_reg_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_p_reg_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_p_reg_reg_OVERFLOW_UNCONNECTED;
  wire NLW_p_reg_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_p_reg_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_p_reg_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_p_reg_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_p_reg_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_p_reg_reg_CARRYOUT_UNCONNECTED;
  wire [46:0]NLW_p_reg_reg_P_UNCONNECTED;
  wire [47:0]NLW_p_reg_reg_PCOUT_UNCONNECTED;

  (* OPT_MODIFIED = "SWEEP" *) 
  DSP48E1 #(
    .ACASCREG(2),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(2),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(2),
    .BREG(2),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(0),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("TRUE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    p_reg_reg
       (.A({A[23],A[23],A[23],A[23],A[23],A[23],A}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_p_reg_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({Q[16],Q}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_p_reg_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_p_reg_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_p_reg_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(p_reg_reg_0),
        .CEA2(1'b1),
        .CEAD(1'b1),
        .CEALUMODE(1'b0),
        .CEB1(1'b1),
        .CEB2(1'b1),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b1),
        .CEP(1'b1),
        .CLK(clk100M_IBUF_BUFG),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b1,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_p_reg_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_p_reg_reg_OVERFLOW_UNCONNECTED),
        .P({p_reg_reg_n_58,NLW_p_reg_reg_P_UNCONNECTED[46:39],p_reg_reg_n_67,p_reg_reg_n_68,p_reg_reg_n_69,p_reg_reg_n_70,p_reg_reg_n_71,p_reg_reg_n_72,p_reg_reg_n_73,p_reg_reg_n_74,p_reg_reg_n_75,p_reg_reg_n_76,p_reg_reg_n_77,p_reg_reg_n_78,p_reg_reg_n_79,p_reg_reg_n_80,p_reg_reg_n_81,p_reg_reg_n_82,p_reg_reg_n_83,p_reg_reg_n_84,p_reg_reg_n_85,p_reg_reg_n_86,p_reg_reg_n_87,p_reg_reg_n_88,p_reg_reg_n_89,NLW_p_reg_reg_P_UNCONNECTED[15:0]}),
        .PATTERNBDETECT(NLW_p_reg_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_p_reg_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN(PCOUT),
        .PCOUT(NLW_p_reg_reg_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_p_reg_reg_UNDERFLOW_UNCONNECTED));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_1
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(write_cntr_0_posedge_delay),
        .I4(p_reg_reg_n_58),
        .I5(P[23]),
        .O(din_b_i[23]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_10
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_74),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[15]),
        .O(din_a_i[15]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_10__0
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_75),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[14]),
        .O(din_b_i[14]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_10__1
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_75),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[14]),
        .O(din_a_i[38]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_11
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_75),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[14]),
        .O(din_a_i[14]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_11__0
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_76),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[13]),
        .O(din_b_i[13]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_11__1
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_76),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[13]),
        .O(din_a_i[37]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_12
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_76),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[13]),
        .O(din_a_i[13]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_12__0
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_77),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[12]),
        .O(din_b_i[12]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_12__1
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_77),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[12]),
        .O(din_a_i[36]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_13
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_77),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[12]),
        .O(din_a_i[12]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_13__0
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_78),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[11]),
        .O(din_b_i[11]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_13__1
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_78),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[11]),
        .O(din_a_i[35]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_14
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_78),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[11]),
        .O(din_a_i[11]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_14__0
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_79),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[10]),
        .O(din_b_i[10]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_14__1
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_79),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[10]),
        .O(din_a_i[34]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_15
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_79),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[10]),
        .O(din_a_i[10]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_15__0
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_80),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[9]),
        .O(din_b_i[9]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_15__1
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_80),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[9]),
        .O(din_a_i[33]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_16
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_80),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[9]),
        .O(din_a_i[9]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_16__0
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_81),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[8]),
        .O(din_b_i[8]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_16__1
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_81),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[8]),
        .O(din_a_i[32]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_17
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_81),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[8]),
        .O(din_a_i[8]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_17__0
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_82),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[7]),
        .O(din_b_i[7]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_17__1
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_82),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[7]),
        .O(din_a_i[31]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_18
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_82),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[7]),
        .O(din_a_i[7]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_18__0
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_83),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[6]),
        .O(din_b_i[6]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_18__1
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_83),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[6]),
        .O(din_a_i[30]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_19
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_83),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[6]),
        .O(din_a_i[6]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_19__0
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_84),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[5]),
        .O(din_b_i[5]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_19__1
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_84),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[5]),
        .O(din_a_i[29]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_1__0
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(write_cntr_0_posedge_delay),
        .I4(p_reg_reg_n_58),
        .I5(P[23]),
        .O(din_a_i[47]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_2
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(write_cntr_0_posedge_delay),
        .I4(p_reg_reg_n_58),
        .I5(P[23]),
        .O(din_a_i[23]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_20
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_84),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[5]),
        .O(din_a_i[5]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_20__0
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_85),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[4]),
        .O(din_b_i[4]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_20__1
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_85),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[4]),
        .O(din_a_i[28]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_21
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_85),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[4]),
        .O(din_a_i[4]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_21__0
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_86),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[3]),
        .O(din_b_i[3]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_21__1
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_86),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[3]),
        .O(din_a_i[27]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_22
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_86),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[3]),
        .O(din_a_i[3]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_22__0
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_87),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[2]),
        .O(din_b_i[2]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_22__1
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_87),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[2]),
        .O(din_a_i[26]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_23
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_87),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[2]),
        .O(din_a_i[2]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_23__0
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_88),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[1]),
        .O(din_b_i[1]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_23__1
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_88),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[1]),
        .O(din_a_i[25]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_24
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_88),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[1]),
        .O(din_a_i[1]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_24__0
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_89),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[0]),
        .O(din_b_i[0]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_24__1
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_89),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[0]),
        .O(din_a_i[24]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_25
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_89),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[0]),
        .O(din_a_i[0]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_2__0
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_67),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[22]),
        .O(din_b_i[22]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_2__1
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_67),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[22]),
        .O(din_a_i[46]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_3
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_67),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[22]),
        .O(din_a_i[22]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_3__0
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_68),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[21]),
        .O(din_b_i[21]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_3__1
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_68),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[21]),
        .O(din_a_i[45]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_4
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_68),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[21]),
        .O(din_a_i[21]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_4__0
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_69),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[20]),
        .O(din_b_i[20]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_4__1
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_69),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[20]),
        .O(din_a_i[44]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_5
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_69),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[20]),
        .O(din_a_i[20]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_5__0
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_70),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[19]),
        .O(din_b_i[19]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_5__1
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_70),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[19]),
        .O(din_a_i[43]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_6
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_70),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[19]),
        .O(din_a_i[19]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_6__0
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_71),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[18]),
        .O(din_b_i[18]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_6__1
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_71),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[18]),
        .O(din_a_i[42]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_7
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_71),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[18]),
        .O(din_a_i[18]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_7__0
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_72),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[17]),
        .O(din_b_i[17]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_7__1
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_72),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[17]),
        .O(din_a_i[41]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_8
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_72),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[17]),
        .O(din_a_i[17]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_8__0
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_73),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[16]),
        .O(din_b_i[16]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_8__1
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_73),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[16]),
        .O(din_a_i[40]));
  LUT6 #(
    .INIT(64'h8880808008000000)) 
    ram_array_reg_i_9
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_73),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[16]),
        .O(din_a_i[16]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_9__0
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_74),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[15]),
        .O(din_b_i[15]));
  LUT6 #(
    .INIT(64'h4440404004000000)) 
    ram_array_reg_i_9__1
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg),
        .I2(write_cntr_0_posedge),
        .I3(p_reg_reg_n_74),
        .I4(write_cntr_0_posedge_delay),
        .I5(P[15]),
        .O(din_a_i[39]));
endmodule

(* ORIG_REF_NAME = "dsp_25x18" *) 
module dsp_25x18__parameterized0
   (PCOUT,
    p_reg_reg_0,
    p_reg_reg_1,
    clk100M_IBUF_BUFG,
    B,
    A);
  output [47:0]PCOUT;
  input p_reg_reg_0;
  input p_reg_reg_1;
  input clk100M_IBUF_BUFG;
  input [17:0]B;
  input [23:0]A;

  wire [23:0]A;
  wire [17:0]B;
  wire [47:0]PCOUT;
  wire clk100M_IBUF_BUFG;
  wire p_reg_reg_0;
  wire p_reg_reg_1;
  wire NLW_p_reg_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_p_reg_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_p_reg_reg_OVERFLOW_UNCONNECTED;
  wire NLW_p_reg_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_p_reg_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_p_reg_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_p_reg_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_p_reg_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_p_reg_reg_CARRYOUT_UNCONNECTED;
  wire [47:0]NLW_p_reg_reg_P_UNCONNECTED;

  DSP48E1 #(
    .ACASCREG(2),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(2),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(2),
    .BREG(2),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    p_reg_reg
       (.A({A[23],A[23],A[23],A[23],A[23],A[23],A}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_p_reg_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B(B),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_p_reg_reg_BCOUT_UNCONNECTED[17:0]),
        .C({A[23],A[23],A[23],A[23],A[23],A[23],A[23],A[23],A,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_p_reg_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_p_reg_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(p_reg_reg_0),
        .CEA2(1'b1),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(p_reg_reg_0),
        .CEB2(1'b1),
        .CEC(p_reg_reg_1),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b1),
        .CEP(1'b1),
        .CLK(clk100M_IBUF_BUFG),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_p_reg_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b1,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_p_reg_reg_OVERFLOW_UNCONNECTED),
        .P(NLW_p_reg_reg_P_UNCONNECTED[47:0]),
        .PATTERNBDETECT(NLW_p_reg_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_p_reg_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(PCOUT),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_p_reg_reg_UNDERFLOW_UNCONNECTED));
endmodule

(* ORIG_REF_NAME = "dsp_25x18" *) 
module dsp_25x18__parameterized0_10
   (PCOUT,
    \read_cntr_reg[0] ,
    p_reg_reg_0,
    clk100M_IBUF_BUFG,
    B,
    p_reg_reg_1,
    p_reg_reg_2,
    p_0_in13_in,
    read_cntr_0_posedge_delay,
    read_cntr_1_posedge_delay,
    p_reg_reg_3);
  output [47:0]PCOUT;
  output \read_cntr_reg[0] ;
  input p_reg_reg_0;
  input clk100M_IBUF_BUFG;
  input [17:0]B;
  input [23:0]p_reg_reg_1;
  input p_reg_reg_2;
  input p_0_in13_in;
  input read_cntr_0_posedge_delay;
  input read_cntr_1_posedge_delay;
  input p_reg_reg_3;

  wire [17:0]B;
  wire [47:0]PCOUT;
  wire clk100M_IBUF_BUFG;
  wire p_0_in13_in;
  wire p_reg_reg_0;
  wire [23:0]p_reg_reg_1;
  wire p_reg_reg_2;
  wire p_reg_reg_3;
  wire read_cntr_0_posedge_delay;
  wire read_cntr_1_posedge_delay;
  wire \read_cntr_reg[0] ;
  wire NLW_p_reg_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_p_reg_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_p_reg_reg_OVERFLOW_UNCONNECTED;
  wire NLW_p_reg_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_p_reg_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_p_reg_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_p_reg_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_p_reg_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_p_reg_reg_CARRYOUT_UNCONNECTED;
  wire [47:0]NLW_p_reg_reg_P_UNCONNECTED;

  DSP48E1 #(
    .ACASCREG(2),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(2),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(2),
    .BREG(2),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    p_reg_reg
       (.A({p_reg_reg_1[23],p_reg_reg_1[23],p_reg_reg_1[23],p_reg_reg_1[23],p_reg_reg_1[23],p_reg_reg_1[23],p_reg_reg_1}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_p_reg_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B(B),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_p_reg_reg_BCOUT_UNCONNECTED[17:0]),
        .C({p_reg_reg_1[23],p_reg_reg_1[23],p_reg_reg_1[23],p_reg_reg_1[23],p_reg_reg_1[23],p_reg_reg_1[23],p_reg_reg_1[23],p_reg_reg_1[23],p_reg_reg_1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_p_reg_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_p_reg_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(\read_cntr_reg[0] ),
        .CEA2(1'b1),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(\read_cntr_reg[0] ),
        .CEB2(1'b1),
        .CEC(p_reg_reg_0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b1),
        .CEP(1'b1),
        .CLK(clk100M_IBUF_BUFG),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_p_reg_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b1,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_p_reg_reg_OVERFLOW_UNCONNECTED),
        .P(NLW_p_reg_reg_P_UNCONNECTED[47:0]),
        .PATTERNBDETECT(NLW_p_reg_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_p_reg_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(PCOUT),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_p_reg_reg_UNDERFLOW_UNCONNECTED));
  LUT5 #(
    .INIT(32'h00004440)) 
    p_reg_reg_i_1
       (.I0(p_reg_reg_2),
        .I1(p_0_in13_in),
        .I2(read_cntr_0_posedge_delay),
        .I3(read_cntr_1_posedge_delay),
        .I4(p_reg_reg_3),
        .O(\read_cntr_reg[0] ));
endmodule

(* ORIG_REF_NAME = "dsp_25x18" *) 
module dsp_25x18__parameterized0_12
   (PCOUT,
    p_reg_reg_0,
    p_reg_reg_1,
    clk100M_IBUF_BUFG,
    B,
    A);
  output [47:0]PCOUT;
  input p_reg_reg_0;
  input p_reg_reg_1;
  input clk100M_IBUF_BUFG;
  input [17:0]B;
  input [23:0]A;

  wire [23:0]A;
  wire [17:0]B;
  wire [47:0]PCOUT;
  wire clk100M_IBUF_BUFG;
  wire p_reg_reg_0;
  wire p_reg_reg_1;
  wire NLW_p_reg_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_p_reg_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_p_reg_reg_OVERFLOW_UNCONNECTED;
  wire NLW_p_reg_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_p_reg_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_p_reg_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_p_reg_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_p_reg_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_p_reg_reg_CARRYOUT_UNCONNECTED;
  wire [47:0]NLW_p_reg_reg_P_UNCONNECTED;

  DSP48E1 #(
    .ACASCREG(2),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(2),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(2),
    .BREG(2),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    p_reg_reg
       (.A({A[23],A[23],A[23],A[23],A[23],A[23],A}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_p_reg_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B(B),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_p_reg_reg_BCOUT_UNCONNECTED[17:0]),
        .C({A[23],A[23],A[23],A[23],A[23],A[23],A[23],A[23],A,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_p_reg_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_p_reg_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(p_reg_reg_0),
        .CEA2(1'b1),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(p_reg_reg_1),
        .CEB2(1'b1),
        .CEC(p_reg_reg_1),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b1),
        .CEP(1'b1),
        .CLK(clk100M_IBUF_BUFG),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_p_reg_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b1,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_p_reg_reg_OVERFLOW_UNCONNECTED),
        .P(NLW_p_reg_reg_P_UNCONNECTED[47:0]),
        .PATTERNBDETECT(NLW_p_reg_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_p_reg_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(PCOUT),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_p_reg_reg_UNDERFLOW_UNCONNECTED));
endmodule

(* ORIG_REF_NAME = "dsp_25x18" *) 
module dsp_25x18__parameterized0_14
   (PCOUT,
    \read_cntr_reg[1] ,
    p_reg_reg_0,
    clk100M_IBUF_BUFG,
    B,
    p_reg_reg_1,
    p_0_in13_in,
    p_reg_reg_2,
    read_cntr_0_posedge_delay,
    read_cntr_1_posedge_delay,
    p_reg_reg_3);
  output [47:0]PCOUT;
  output \read_cntr_reg[1] ;
  input p_reg_reg_0;
  input clk100M_IBUF_BUFG;
  input [17:0]B;
  input [23:0]p_reg_reg_1;
  input p_0_in13_in;
  input p_reg_reg_2;
  input read_cntr_0_posedge_delay;
  input read_cntr_1_posedge_delay;
  input p_reg_reg_3;

  wire [17:0]B;
  wire [47:0]PCOUT;
  wire clk100M_IBUF_BUFG;
  wire p_0_in13_in;
  wire p_reg_reg_0;
  wire [23:0]p_reg_reg_1;
  wire p_reg_reg_2;
  wire p_reg_reg_3;
  wire read_cntr_0_posedge_delay;
  wire read_cntr_1_posedge_delay;
  wire \read_cntr_reg[1] ;
  wire NLW_p_reg_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_p_reg_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_p_reg_reg_OVERFLOW_UNCONNECTED;
  wire NLW_p_reg_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_p_reg_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_p_reg_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_p_reg_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_p_reg_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_p_reg_reg_CARRYOUT_UNCONNECTED;
  wire [47:0]NLW_p_reg_reg_P_UNCONNECTED;

  DSP48E1 #(
    .ACASCREG(2),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(2),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(2),
    .BREG(2),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    p_reg_reg
       (.A({p_reg_reg_1[23],p_reg_reg_1[23],p_reg_reg_1[23],p_reg_reg_1[23],p_reg_reg_1[23],p_reg_reg_1[23],p_reg_reg_1}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_p_reg_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B(B),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_p_reg_reg_BCOUT_UNCONNECTED[17:0]),
        .C({p_reg_reg_1[23],p_reg_reg_1[23],p_reg_reg_1[23],p_reg_reg_1[23],p_reg_reg_1[23],p_reg_reg_1[23],p_reg_reg_1[23],p_reg_reg_1[23],p_reg_reg_1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_p_reg_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_p_reg_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(p_reg_reg_0),
        .CEA2(1'b1),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(\read_cntr_reg[1] ),
        .CEB2(1'b1),
        .CEC(\read_cntr_reg[1] ),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b1),
        .CEP(1'b1),
        .CLK(clk100M_IBUF_BUFG),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_p_reg_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b1,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_p_reg_reg_OVERFLOW_UNCONNECTED),
        .P(NLW_p_reg_reg_P_UNCONNECTED[47:0]),
        .PATTERNBDETECT(NLW_p_reg_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_p_reg_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(PCOUT),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_p_reg_reg_UNDERFLOW_UNCONNECTED));
  LUT5 #(
    .INIT(32'h00004440)) 
    p_reg_reg_i_2
       (.I0(p_0_in13_in),
        .I1(p_reg_reg_2),
        .I2(read_cntr_0_posedge_delay),
        .I3(read_cntr_1_posedge_delay),
        .I4(p_reg_reg_3),
        .O(\read_cntr_reg[1] ));
endmodule

(* ORIG_REF_NAME = "dsp_25x18" *) 
module dsp_25x18__parameterized1
   (\p_reg_reg[8]_0 ,
    S,
    \p_reg_reg[0]_0 ,
    \p_reg_reg[0]_1 ,
    D,
    \write_cntr_reg[1] ,
    \write_cntr_reg[1]_0 ,
    \p_reg_reg[3]_0 ,
    \p_reg_reg[7]_0 ,
    \half_reg[9] ,
    Q,
    clk100M_IBUF_BUFG,
    m_reg0__47_carry,
    ram_array_reg,
    ram_array_reg_0,
    O,
    ram_array_reg_1,
    ram_array_reg_2,
    ram_array_reg_3,
    ram_array_reg_4,
    half,
    groups,
    \a_reg_reg[0][8]_0 );
  output [8:0]\p_reg_reg[8]_0 ;
  output [0:0]S;
  output [0:0]\p_reg_reg[0]_0 ;
  output [0:0]\p_reg_reg[0]_1 ;
  output [9:0]D;
  output [9:0]\write_cntr_reg[1] ;
  output [9:0]\write_cntr_reg[1]_0 ;
  output [3:0]\p_reg_reg[3]_0 ;
  output [3:0]\p_reg_reg[7]_0 ;
  output [1:0]\half_reg[9] ;
  input [9:0]Q;
  input clk100M_IBUF_BUFG;
  input [2:0]m_reg0__47_carry;
  input ram_array_reg;
  input ram_array_reg_0;
  input [3:0]O;
  input ram_array_reg_1;
  input ram_array_reg_2;
  input [3:0]ram_array_reg_3;
  input [1:0]ram_array_reg_4;
  input [7:0]half;
  input [1:0]groups;
  input [8:0]\a_reg_reg[0][8]_0 ;

  wire [9:0]D;
  wire [3:0]O;
  wire [9:9]P;
  wire [9:0]Q;
  wire [0:0]S;
  wire [8:0]\a_reg_reg[0][8]_0 ;
  wire \a_reg_reg_n_0_[0][0] ;
  wire \a_reg_reg_n_0_[0][1] ;
  wire \a_reg_reg_n_0_[0][2] ;
  wire \a_reg_reg_n_0_[0][3] ;
  wire \a_reg_reg_n_0_[0][4] ;
  wire \a_reg_reg_n_0_[0][5] ;
  wire \a_reg_reg_n_0_[0][6] ;
  wire \a_reg_reg_n_0_[0][7] ;
  wire \a_reg_reg_n_0_[0][8] ;
  wire \b_reg_reg_n_0_[0][1] ;
  wire \b_reg_reg_n_0_[0][2] ;
  wire \b_reg_reg_n_0_[0][3] ;
  wire \b_reg_reg_n_0_[0][4] ;
  wire \b_reg_reg_n_0_[0][5] ;
  wire \b_reg_reg_n_0_[0][6] ;
  wire \b_reg_reg_n_0_[0][7] ;
  wire \b_reg_reg_n_0_[0][8] ;
  wire \b_reg_reg_n_0_[0][9] ;
  wire clk100M_IBUF_BUFG;
  wire [1:0]groups;
  wire [7:0]half;
  wire [1:0]\half_reg[9] ;
  wire [9:1]m_reg;
  wire [9:1]m_reg0;
  wire [2:0]m_reg0__47_carry;
  wire \m_reg[3]_i_10_n_0 ;
  wire \m_reg[3]_i_11_n_0 ;
  wire \m_reg[3]_i_12_n_0 ;
  wire \m_reg[3]_i_13_n_0 ;
  wire \m_reg[3]_i_14_n_0 ;
  wire \m_reg[3]_i_15_n_0 ;
  wire \m_reg[3]_i_16_n_0 ;
  wire \m_reg[3]_i_17_n_0 ;
  wire \m_reg[3]_i_18_n_0 ;
  wire \m_reg[3]_i_19_n_0 ;
  wire \m_reg[3]_i_4_n_0 ;
  wire \m_reg[3]_i_5_n_0 ;
  wire \m_reg[3]_i_6_n_0 ;
  wire \m_reg[3]_i_7_n_0 ;
  wire \m_reg[3]_i_8_n_0 ;
  wire \m_reg[3]_i_9_n_0 ;
  wire \m_reg[7]_i_2_n_0 ;
  wire \m_reg[7]_i_3_n_0 ;
  wire \m_reg[7]_i_4_n_0 ;
  wire \m_reg[7]_i_5_n_0 ;
  wire \m_reg[7]_i_6_n_0 ;
  wire \m_reg[7]_i_7_n_0 ;
  wire \m_reg[7]_i_8_n_0 ;
  wire \m_reg[7]_i_9_n_0 ;
  wire \m_reg[9]_i_10_n_0 ;
  wire \m_reg[9]_i_11_n_0 ;
  wire \m_reg[9]_i_12_n_0 ;
  wire \m_reg[9]_i_13_n_0 ;
  wire \m_reg[9]_i_14_n_0 ;
  wire \m_reg[9]_i_15_n_0 ;
  wire \m_reg[9]_i_16_n_0 ;
  wire \m_reg[9]_i_17_n_0 ;
  wire \m_reg[9]_i_18_n_0 ;
  wire \m_reg[9]_i_19_n_0 ;
  wire \m_reg[9]_i_20_n_0 ;
  wire \m_reg[9]_i_21_n_0 ;
  wire \m_reg[9]_i_22_n_0 ;
  wire \m_reg[9]_i_23_n_0 ;
  wire \m_reg[9]_i_24_n_0 ;
  wire \m_reg[9]_i_25_n_0 ;
  wire \m_reg[9]_i_26_n_0 ;
  wire \m_reg[9]_i_27_n_0 ;
  wire \m_reg[9]_i_28_n_0 ;
  wire \m_reg[9]_i_2_n_0 ;
  wire \m_reg[9]_i_3_n_0 ;
  wire \m_reg[9]_i_4_n_0 ;
  wire \m_reg[9]_i_8_n_0 ;
  wire \m_reg[9]_i_9_n_0 ;
  wire \m_reg_reg[3]_i_2_n_0 ;
  wire \m_reg_reg[3]_i_2_n_4 ;
  wire \m_reg_reg[3]_i_2_n_5 ;
  wire \m_reg_reg[3]_i_2_n_6 ;
  wire \m_reg_reg[3]_i_2_n_7 ;
  wire \m_reg_reg[3]_i_3_n_0 ;
  wire \m_reg_reg[3]_i_3_n_4 ;
  wire \m_reg_reg[3]_i_3_n_5 ;
  wire \m_reg_reg[3]_i_3_n_6 ;
  wire \m_reg_reg[3]_i_3_n_7 ;
  wire \m_reg_reg[7]_i_1_n_0 ;
  wire \m_reg_reg[9]_i_5_n_5 ;
  wire \m_reg_reg[9]_i_5_n_6 ;
  wire \m_reg_reg[9]_i_5_n_7 ;
  wire \m_reg_reg[9]_i_6_n_5 ;
  wire \m_reg_reg[9]_i_6_n_6 ;
  wire \m_reg_reg[9]_i_6_n_7 ;
  wire \m_reg_reg[9]_i_7_n_4 ;
  wire \m_reg_reg[9]_i_7_n_5 ;
  wire \m_reg_reg[9]_i_7_n_6 ;
  wire \m_reg_reg[9]_i_7_n_7 ;
  wire [9:1]p_reg0;
  wire p_reg0_carry__0_i_1_n_0;
  wire p_reg0_carry__0_i_2_n_0;
  wire p_reg0_carry__0_i_3_n_0;
  wire p_reg0_carry__0_i_4_n_0;
  wire p_reg0_carry__0_n_0;
  wire p_reg0_carry__1_i_1_n_0;
  wire p_reg0_carry_i_1_n_0;
  wire p_reg0_carry_i_2_n_0;
  wire p_reg0_carry_i_3_n_0;
  wire p_reg0_carry_i_4_n_0;
  wire p_reg0_carry_n_0;
  wire [0:0]\p_reg_reg[0]_0 ;
  wire [0:0]\p_reg_reg[0]_1 ;
  wire [3:0]\p_reg_reg[3]_0 ;
  wire [3:0]\p_reg_reg[7]_0 ;
  wire [8:0]\p_reg_reg[8]_0 ;
  wire ram_array_reg;
  wire ram_array_reg_0;
  wire ram_array_reg_1;
  wire ram_array_reg_2;
  wire [3:0]ram_array_reg_3;
  wire [1:0]ram_array_reg_4;
  wire [9:0]\write_cntr_reg[1] ;
  wire [9:0]\write_cntr_reg[1]_0 ;
  wire [2:0]\NLW_m_reg_reg[3]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_m_reg_reg[3]_i_3_CO_UNCONNECTED ;
  wire [2:0]\NLW_m_reg_reg[7]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_m_reg_reg[9]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_m_reg_reg[9]_i_1_O_UNCONNECTED ;
  wire [3:0]\NLW_m_reg_reg[9]_i_5_CO_UNCONNECTED ;
  wire [3:3]\NLW_m_reg_reg[9]_i_5_O_UNCONNECTED ;
  wire [3:0]\NLW_m_reg_reg[9]_i_6_CO_UNCONNECTED ;
  wire [3:3]\NLW_m_reg_reg[9]_i_6_O_UNCONNECTED ;
  wire [3:0]\NLW_m_reg_reg[9]_i_7_CO_UNCONNECTED ;
  wire [2:0]NLW_p_reg0_carry_CO_UNCONNECTED;
  wire [2:0]NLW_p_reg0_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_p_reg0_carry__1_CO_UNCONNECTED;
  wire [3:1]NLW_p_reg0_carry__1_O_UNCONNECTED;

  FDRE #(
    .INIT(1'b0)) 
    \a_reg_reg[0][0] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\a_reg_reg[0][8]_0 [0]),
        .Q(\a_reg_reg_n_0_[0][0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \a_reg_reg[0][1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\a_reg_reg[0][8]_0 [1]),
        .Q(\a_reg_reg_n_0_[0][1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \a_reg_reg[0][2] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\a_reg_reg[0][8]_0 [2]),
        .Q(\a_reg_reg_n_0_[0][2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \a_reg_reg[0][3] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\a_reg_reg[0][8]_0 [3]),
        .Q(\a_reg_reg_n_0_[0][3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \a_reg_reg[0][4] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\a_reg_reg[0][8]_0 [4]),
        .Q(\a_reg_reg_n_0_[0][4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \a_reg_reg[0][5] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\a_reg_reg[0][8]_0 [5]),
        .Q(\a_reg_reg_n_0_[0][5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \a_reg_reg[0][6] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\a_reg_reg[0][8]_0 [6]),
        .Q(\a_reg_reg_n_0_[0][6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \a_reg_reg[0][7] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\a_reg_reg[0][8]_0 [7]),
        .Q(\a_reg_reg_n_0_[0][7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \a_reg_reg[0][8] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\a_reg_reg[0][8]_0 [8]),
        .Q(\a_reg_reg_n_0_[0][8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[0][1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(half[0]),
        .Q(\b_reg_reg_n_0_[0][1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[0][2] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(groups[1]),
        .Q(\b_reg_reg_n_0_[0][2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[0][3] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(half[1]),
        .Q(\b_reg_reg_n_0_[0][3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[0][4] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(half[2]),
        .Q(\b_reg_reg_n_0_[0][4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[0][5] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(half[3]),
        .Q(\b_reg_reg_n_0_[0][5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[0][6] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(half[4]),
        .Q(\b_reg_reg_n_0_[0][6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[0][7] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(half[5]),
        .Q(\b_reg_reg_n_0_[0][7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[0][8] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(groups[0]),
        .Q(\b_reg_reg_n_0_[0][8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[0][9] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(half[6]),
        .Q(\b_reg_reg_n_0_[0][9] ),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    index_2_carry__0_i_1
       (.I0(\p_reg_reg[8]_0 [7]),
        .I1(groups[0]),
        .O(\p_reg_reg[7]_0 [3]));
  LUT2 #(
    .INIT(4'h6)) 
    index_2_carry__0_i_2
       (.I0(\p_reg_reg[8]_0 [6]),
        .I1(half[5]),
        .O(\p_reg_reg[7]_0 [2]));
  LUT2 #(
    .INIT(4'h6)) 
    index_2_carry__0_i_3
       (.I0(\p_reg_reg[8]_0 [5]),
        .I1(half[4]),
        .O(\p_reg_reg[7]_0 [1]));
  LUT2 #(
    .INIT(4'h6)) 
    index_2_carry__0_i_4
       (.I0(\p_reg_reg[8]_0 [4]),
        .I1(half[3]),
        .O(\p_reg_reg[7]_0 [0]));
  LUT2 #(
    .INIT(4'h6)) 
    index_2_carry__1_i_1
       (.I0(half[7]),
        .I1(P),
        .O(\half_reg[9] [1]));
  LUT2 #(
    .INIT(4'h6)) 
    index_2_carry__1_i_2
       (.I0(\p_reg_reg[8]_0 [8]),
        .I1(half[6]),
        .O(\half_reg[9] [0]));
  LUT2 #(
    .INIT(4'h6)) 
    index_2_carry_i_1
       (.I0(\p_reg_reg[8]_0 [3]),
        .I1(half[2]),
        .O(\p_reg_reg[3]_0 [3]));
  LUT2 #(
    .INIT(4'h6)) 
    index_2_carry_i_2
       (.I0(\p_reg_reg[8]_0 [2]),
        .I1(half[1]),
        .O(\p_reg_reg[3]_0 [2]));
  LUT2 #(
    .INIT(4'h6)) 
    index_2_carry_i_3
       (.I0(\p_reg_reg[8]_0 [1]),
        .I1(groups[1]),
        .O(\p_reg_reg[3]_0 [1]));
  LUT2 #(
    .INIT(4'h6)) 
    index_2_carry_i_4
       (.I0(\p_reg_reg[8]_0 [0]),
        .I1(half[0]),
        .O(\p_reg_reg[3]_0 [0]));
  LUT2 #(
    .INIT(4'h8)) 
    m_reg0__0_carry_i_7__0
       (.I0(\p_reg_reg[8]_0 [0]),
        .I1(m_reg0__47_carry[0]),
        .O(S));
  LUT2 #(
    .INIT(4'h8)) 
    m_reg0__28_carry_i_7__0
       (.I0(\p_reg_reg[8]_0 [0]),
        .I1(m_reg0__47_carry[1]),
        .O(\p_reg_reg[0]_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    m_reg0__47_carry_i_6__0
       (.I0(\p_reg_reg[8]_0 [0]),
        .I1(m_reg0__47_carry[2]),
        .O(\p_reg_reg[0]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \m_reg[1]_i_1 
       (.I0(\a_reg_reg_n_0_[0][0] ),
        .I1(\b_reg_reg_n_0_[0][1] ),
        .O(m_reg0[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    \m_reg[2]_i_1 
       (.I0(\b_reg_reg_n_0_[0][1] ),
        .I1(\a_reg_reg_n_0_[0][1] ),
        .I2(\b_reg_reg_n_0_[0][2] ),
        .I3(\a_reg_reg_n_0_[0][0] ),
        .O(m_reg0[2]));
  LUT2 #(
    .INIT(4'h6)) 
    \m_reg[3]_i_1 
       (.I0(\m_reg_reg[3]_i_2_n_7 ),
        .I1(\m_reg_reg[3]_i_3_n_7 ),
        .O(m_reg0[3]));
  LUT2 #(
    .INIT(4'h8)) 
    \m_reg[3]_i_10 
       (.I0(\a_reg_reg_n_0_[0][0] ),
        .I1(\b_reg_reg_n_0_[0][3] ),
        .O(\m_reg[3]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \m_reg[3]_i_11 
       (.I0(\b_reg_reg_n_0_[0][2] ),
        .I1(\a_reg_reg_n_0_[0][4] ),
        .I2(\b_reg_reg_n_0_[0][1] ),
        .I3(\a_reg_reg_n_0_[0][3] ),
        .O(\m_reg[3]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \m_reg[3]_i_12 
       (.I0(\b_reg_reg_n_0_[0][2] ),
        .I1(\a_reg_reg_n_0_[0][2] ),
        .I2(\b_reg_reg_n_0_[0][1] ),
        .I3(\a_reg_reg_n_0_[0][3] ),
        .O(\m_reg[3]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \m_reg[3]_i_13 
       (.I0(\b_reg_reg_n_0_[0][1] ),
        .I1(\a_reg_reg_n_0_[0][2] ),
        .I2(\a_reg_reg_n_0_[0][1] ),
        .I3(\b_reg_reg_n_0_[0][2] ),
        .O(\m_reg[3]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h7888)) 
    \m_reg[3]_i_14 
       (.I0(\b_reg_reg_n_0_[0][1] ),
        .I1(\a_reg_reg_n_0_[0][2] ),
        .I2(\a_reg_reg_n_0_[0][1] ),
        .I3(\b_reg_reg_n_0_[0][2] ),
        .O(\m_reg[3]_i_14_n_0 ));
  LUT5 #(
    .INIT(32'h9FC0C0C0)) 
    \m_reg[3]_i_15 
       (.I0(\a_reg_reg_n_0_[0][3] ),
        .I1(\a_reg_reg_n_0_[0][5] ),
        .I2(\b_reg_reg_n_0_[0][1] ),
        .I3(\a_reg_reg_n_0_[0][4] ),
        .I4(\b_reg_reg_n_0_[0][2] ),
        .O(\m_reg[3]_i_15_n_0 ));
  LUT5 #(
    .INIT(32'h9FC0C0C0)) 
    \m_reg[3]_i_16 
       (.I0(\a_reg_reg_n_0_[0][2] ),
        .I1(\a_reg_reg_n_0_[0][4] ),
        .I2(\b_reg_reg_n_0_[0][1] ),
        .I3(\a_reg_reg_n_0_[0][3] ),
        .I4(\b_reg_reg_n_0_[0][2] ),
        .O(\m_reg[3]_i_16_n_0 ));
  LUT5 #(
    .INIT(32'h9FC0C0C0)) 
    \m_reg[3]_i_17 
       (.I0(\a_reg_reg_n_0_[0][1] ),
        .I1(\a_reg_reg_n_0_[0][3] ),
        .I2(\b_reg_reg_n_0_[0][1] ),
        .I3(\a_reg_reg_n_0_[0][2] ),
        .I4(\b_reg_reg_n_0_[0][2] ),
        .O(\m_reg[3]_i_17_n_0 ));
  LUT5 #(
    .INIT(32'hAA6AC0C0)) 
    \m_reg[3]_i_18 
       (.I0(\a_reg_reg_n_0_[0][2] ),
        .I1(\b_reg_reg_n_0_[0][2] ),
        .I2(\a_reg_reg_n_0_[0][1] ),
        .I3(\a_reg_reg_n_0_[0][0] ),
        .I4(\b_reg_reg_n_0_[0][1] ),
        .O(\m_reg[3]_i_18_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \m_reg[3]_i_19 
       (.I0(\b_reg_reg_n_0_[0][5] ),
        .I1(\a_reg_reg_n_0_[0][1] ),
        .O(\m_reg[3]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    \m_reg[3]_i_4 
       (.I0(\a_reg_reg_n_0_[0][3] ),
        .I1(\b_reg_reg_n_0_[0][3] ),
        .I2(\b_reg_reg_n_0_[0][5] ),
        .I3(\a_reg_reg_n_0_[0][1] ),
        .I4(\a_reg_reg_n_0_[0][2] ),
        .I5(\b_reg_reg_n_0_[0][4] ),
        .O(\m_reg[3]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h7888)) 
    \m_reg[3]_i_5 
       (.I0(\b_reg_reg_n_0_[0][4] ),
        .I1(\a_reg_reg_n_0_[0][1] ),
        .I2(\b_reg_reg_n_0_[0][5] ),
        .I3(\a_reg_reg_n_0_[0][0] ),
        .O(\m_reg[3]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \m_reg[3]_i_6 
       (.I0(\a_reg_reg_n_0_[0][1] ),
        .I1(\b_reg_reg_n_0_[0][3] ),
        .O(\m_reg[3]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h6A6A6A95C03FC03F)) 
    \m_reg[3]_i_7 
       (.I0(\a_reg_reg_n_0_[0][2] ),
        .I1(\b_reg_reg_n_0_[0][3] ),
        .I2(\a_reg_reg_n_0_[0][3] ),
        .I3(\m_reg[3]_i_19_n_0 ),
        .I4(\a_reg_reg_n_0_[0][0] ),
        .I5(\b_reg_reg_n_0_[0][4] ),
        .O(\m_reg[3]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    \m_reg[3]_i_8 
       (.I0(\a_reg_reg_n_0_[0][0] ),
        .I1(\b_reg_reg_n_0_[0][5] ),
        .I2(\a_reg_reg_n_0_[0][1] ),
        .I3(\b_reg_reg_n_0_[0][4] ),
        .I4(\b_reg_reg_n_0_[0][3] ),
        .I5(\a_reg_reg_n_0_[0][2] ),
        .O(\m_reg[3]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h7888)) 
    \m_reg[3]_i_9 
       (.I0(\b_reg_reg_n_0_[0][3] ),
        .I1(\a_reg_reg_n_0_[0][1] ),
        .I2(\b_reg_reg_n_0_[0][4] ),
        .I3(\a_reg_reg_n_0_[0][0] ),
        .O(\m_reg[3]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \m_reg[7]_i_2 
       (.I0(\m_reg_reg[3]_i_2_n_4 ),
        .I1(\m_reg_reg[3]_i_3_n_4 ),
        .I2(\m_reg_reg[9]_i_7_n_7 ),
        .O(\m_reg[7]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \m_reg[7]_i_3 
       (.I0(\m_reg_reg[3]_i_3_n_5 ),
        .I1(\m_reg_reg[3]_i_2_n_5 ),
        .O(\m_reg[7]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \m_reg[7]_i_4 
       (.I0(\m_reg_reg[3]_i_3_n_6 ),
        .I1(\m_reg_reg[3]_i_2_n_6 ),
        .O(\m_reg[7]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \m_reg[7]_i_5 
       (.I0(\m_reg_reg[3]_i_3_n_7 ),
        .I1(\m_reg_reg[3]_i_2_n_7 ),
        .O(\m_reg[7]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \m_reg[7]_i_6 
       (.I0(\m_reg_reg[9]_i_7_n_7 ),
        .I1(\m_reg_reg[3]_i_3_n_4 ),
        .I2(\m_reg_reg[3]_i_2_n_4 ),
        .I3(\m_reg_reg[9]_i_5_n_7 ),
        .I4(\m_reg_reg[9]_i_7_n_6 ),
        .I5(\m_reg_reg[9]_i_6_n_7 ),
        .O(\m_reg[7]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h78878778)) 
    \m_reg[7]_i_7 
       (.I0(\m_reg_reg[3]_i_2_n_5 ),
        .I1(\m_reg_reg[3]_i_3_n_5 ),
        .I2(\m_reg_reg[3]_i_2_n_4 ),
        .I3(\m_reg_reg[9]_i_7_n_7 ),
        .I4(\m_reg_reg[3]_i_3_n_4 ),
        .O(\m_reg[7]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \m_reg[7]_i_8 
       (.I0(\m_reg_reg[3]_i_2_n_6 ),
        .I1(\m_reg_reg[3]_i_3_n_6 ),
        .I2(\m_reg_reg[3]_i_3_n_5 ),
        .I3(\m_reg_reg[3]_i_2_n_5 ),
        .O(\m_reg[7]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \m_reg[7]_i_9 
       (.I0(\m_reg_reg[3]_i_2_n_7 ),
        .I1(\m_reg_reg[3]_i_3_n_7 ),
        .I2(\m_reg_reg[3]_i_3_n_6 ),
        .I3(\m_reg_reg[3]_i_2_n_6 ),
        .O(\m_reg[7]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    \m_reg[9]_i_10 
       (.I0(\a_reg_reg_n_0_[0][2] ),
        .I1(\b_reg_reg_n_0_[0][4] ),
        .I2(\b_reg_reg_n_0_[0][5] ),
        .I3(\a_reg_reg_n_0_[0][1] ),
        .I4(\b_reg_reg_n_0_[0][3] ),
        .I5(\a_reg_reg_n_0_[0][3] ),
        .O(\m_reg[9]_i_10_n_0 ));
  LUT3 #(
    .INIT(8'h87)) 
    \m_reg[9]_i_11 
       (.I0(\a_reg_reg_n_0_[0][6] ),
        .I1(\b_reg_reg_n_0_[0][3] ),
        .I2(\m_reg[9]_i_25_n_0 ),
        .O(\m_reg[9]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    \m_reg[9]_i_12 
       (.I0(\m_reg[9]_i_9_n_0 ),
        .I1(\b_reg_reg_n_0_[0][5] ),
        .I2(\a_reg_reg_n_0_[0][3] ),
        .I3(\m_reg[9]_i_26_n_0 ),
        .I4(\b_reg_reg_n_0_[0][3] ),
        .I5(\a_reg_reg_n_0_[0][5] ),
        .O(\m_reg[9]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    \m_reg[9]_i_13 
       (.I0(\m_reg[9]_i_10_n_0 ),
        .I1(\b_reg_reg_n_0_[0][5] ),
        .I2(\a_reg_reg_n_0_[0][2] ),
        .I3(\m_reg[9]_i_27_n_0 ),
        .I4(\b_reg_reg_n_0_[0][3] ),
        .I5(\a_reg_reg_n_0_[0][4] ),
        .O(\m_reg[9]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \m_reg[9]_i_14 
       (.I0(\b_reg_reg_n_0_[0][2] ),
        .I1(\a_reg_reg_n_0_[0][6] ),
        .I2(\b_reg_reg_n_0_[0][1] ),
        .I3(\a_reg_reg_n_0_[0][5] ),
        .O(\m_reg[9]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \m_reg[9]_i_15 
       (.I0(\b_reg_reg_n_0_[0][2] ),
        .I1(\a_reg_reg_n_0_[0][4] ),
        .I2(\b_reg_reg_n_0_[0][1] ),
        .I3(\a_reg_reg_n_0_[0][5] ),
        .O(\m_reg[9]_i_15_n_0 ));
  LUT5 #(
    .INIT(32'h603F3F3F)) 
    \m_reg[9]_i_16 
       (.I0(\a_reg_reg_n_0_[0][6] ),
        .I1(\a_reg_reg_n_0_[0][8] ),
        .I2(\b_reg_reg_n_0_[0][1] ),
        .I3(\a_reg_reg_n_0_[0][7] ),
        .I4(\b_reg_reg_n_0_[0][2] ),
        .O(\m_reg[9]_i_16_n_0 ));
  LUT5 #(
    .INIT(32'hBF40C0C0)) 
    \m_reg[9]_i_17 
       (.I0(\a_reg_reg_n_0_[0][5] ),
        .I1(\a_reg_reg_n_0_[0][6] ),
        .I2(\b_reg_reg_n_0_[0][2] ),
        .I3(\a_reg_reg_n_0_[0][7] ),
        .I4(\b_reg_reg_n_0_[0][1] ),
        .O(\m_reg[9]_i_17_n_0 ));
  LUT5 #(
    .INIT(32'hBF40C0C0)) 
    \m_reg[9]_i_18 
       (.I0(\a_reg_reg_n_0_[0][4] ),
        .I1(\a_reg_reg_n_0_[0][5] ),
        .I2(\b_reg_reg_n_0_[0][2] ),
        .I3(\a_reg_reg_n_0_[0][6] ),
        .I4(\b_reg_reg_n_0_[0][1] ),
        .O(\m_reg[9]_i_18_n_0 ));
  LUT4 #(
    .INIT(16'h7888)) 
    \m_reg[9]_i_19 
       (.I0(\b_reg_reg_n_0_[0][7] ),
        .I1(\a_reg_reg_n_0_[0][1] ),
        .I2(\b_reg_reg_n_0_[0][8] ),
        .I3(\a_reg_reg_n_0_[0][0] ),
        .O(\m_reg[9]_i_19_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \m_reg[9]_i_2 
       (.I0(\m_reg_reg[9]_i_5_n_7 ),
        .I1(\m_reg_reg[9]_i_6_n_7 ),
        .I2(\m_reg_reg[9]_i_7_n_6 ),
        .O(\m_reg[9]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \m_reg[9]_i_20 
       (.I0(\a_reg_reg_n_0_[0][1] ),
        .I1(\b_reg_reg_n_0_[0][6] ),
        .O(\m_reg[9]_i_20_n_0 ));
  LUT6 #(
    .INIT(64'h3F48C0B7C0B7C0B7)) 
    \m_reg[9]_i_21 
       (.I0(\a_reg_reg_n_0_[0][0] ),
        .I1(\b_reg_reg_n_0_[0][7] ),
        .I2(\a_reg_reg_n_0_[0][2] ),
        .I3(\m_reg[9]_i_28_n_0 ),
        .I4(\b_reg_reg_n_0_[0][6] ),
        .I5(\a_reg_reg_n_0_[0][3] ),
        .O(\m_reg[9]_i_21_n_0 ));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    \m_reg[9]_i_22 
       (.I0(\a_reg_reg_n_0_[0][0] ),
        .I1(\b_reg_reg_n_0_[0][8] ),
        .I2(\a_reg_reg_n_0_[0][1] ),
        .I3(\b_reg_reg_n_0_[0][7] ),
        .I4(\b_reg_reg_n_0_[0][6] ),
        .I5(\a_reg_reg_n_0_[0][2] ),
        .O(\m_reg[9]_i_22_n_0 ));
  LUT4 #(
    .INIT(16'h7888)) 
    \m_reg[9]_i_23 
       (.I0(\b_reg_reg_n_0_[0][6] ),
        .I1(\a_reg_reg_n_0_[0][1] ),
        .I2(\a_reg_reg_n_0_[0][0] ),
        .I3(\b_reg_reg_n_0_[0][7] ),
        .O(\m_reg[9]_i_23_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \m_reg[9]_i_24 
       (.I0(\a_reg_reg_n_0_[0][0] ),
        .I1(\b_reg_reg_n_0_[0][6] ),
        .O(\m_reg[9]_i_24_n_0 ));
  LUT6 #(
    .INIT(64'h18C0AFFF87FF0FFF)) 
    \m_reg[9]_i_25 
       (.I0(\a_reg_reg_n_0_[0][3] ),
        .I1(\b_reg_reg_n_0_[0][3] ),
        .I2(\a_reg_reg_n_0_[0][4] ),
        .I3(\b_reg_reg_n_0_[0][5] ),
        .I4(\a_reg_reg_n_0_[0][5] ),
        .I5(\b_reg_reg_n_0_[0][4] ),
        .O(\m_reg[9]_i_25_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \m_reg[9]_i_26 
       (.I0(\a_reg_reg_n_0_[0][4] ),
        .I1(\b_reg_reg_n_0_[0][4] ),
        .O(\m_reg[9]_i_26_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \m_reg[9]_i_27 
       (.I0(\a_reg_reg_n_0_[0][3] ),
        .I1(\b_reg_reg_n_0_[0][4] ),
        .O(\m_reg[9]_i_27_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \m_reg[9]_i_28 
       (.I0(\b_reg_reg_n_0_[0][8] ),
        .I1(\a_reg_reg_n_0_[0][1] ),
        .O(\m_reg[9]_i_28_n_0 ));
  LUT4 #(
    .INIT(16'h17E8)) 
    \m_reg[9]_i_3 
       (.I0(\m_reg_reg[9]_i_5_n_6 ),
        .I1(\m_reg_reg[9]_i_7_n_5 ),
        .I2(\m_reg_reg[9]_i_6_n_6 ),
        .I3(\m_reg[9]_i_8_n_0 ),
        .O(\m_reg[9]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \m_reg[9]_i_4 
       (.I0(\m_reg_reg[9]_i_7_n_6 ),
        .I1(\m_reg_reg[9]_i_6_n_7 ),
        .I2(\m_reg_reg[9]_i_5_n_7 ),
        .I3(\m_reg_reg[9]_i_5_n_6 ),
        .I4(\m_reg_reg[9]_i_7_n_5 ),
        .I5(\m_reg_reg[9]_i_6_n_6 ),
        .O(\m_reg[9]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h87787887)) 
    \m_reg[9]_i_8 
       (.I0(\a_reg_reg_n_0_[0][0] ),
        .I1(\b_reg_reg_n_0_[0][9] ),
        .I2(\m_reg_reg[9]_i_6_n_5 ),
        .I3(\m_reg_reg[9]_i_7_n_4 ),
        .I4(\m_reg_reg[9]_i_5_n_5 ),
        .O(\m_reg[9]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hF880808088000000)) 
    \m_reg[9]_i_9 
       (.I0(\b_reg_reg_n_0_[0][4] ),
        .I1(\a_reg_reg_n_0_[0][3] ),
        .I2(\a_reg_reg_n_0_[0][4] ),
        .I3(\b_reg_reg_n_0_[0][5] ),
        .I4(\a_reg_reg_n_0_[0][2] ),
        .I5(\b_reg_reg_n_0_[0][3] ),
        .O(\m_reg[9]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_reg_reg[1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(m_reg0[1]),
        .Q(m_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_reg_reg[2] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(m_reg0[2]),
        .Q(m_reg[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_reg_reg[3] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(m_reg0[3]),
        .Q(m_reg[3]),
        .R(1'b0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-9 {cell *THIS*} {string 10x10}}" *) 
  (* OPT_MODIFIED = "PROPCONST SWEEP" *) 
  CARRY4 \m_reg_reg[3]_i_2 
       (.CI(1'b0),
        .CO({\m_reg_reg[3]_i_2_n_0 ,\NLW_m_reg_reg[3]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\m_reg[3]_i_4_n_0 ,\m_reg[3]_i_5_n_0 ,\m_reg[3]_i_6_n_0 ,1'b0}),
        .O({\m_reg_reg[3]_i_2_n_4 ,\m_reg_reg[3]_i_2_n_5 ,\m_reg_reg[3]_i_2_n_6 ,\m_reg_reg[3]_i_2_n_7 }),
        .S({\m_reg[3]_i_7_n_0 ,\m_reg[3]_i_8_n_0 ,\m_reg[3]_i_9_n_0 ,\m_reg[3]_i_10_n_0 }));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-9 {cell *THIS*} {string 10x10}}" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \m_reg_reg[3]_i_3 
       (.CI(1'b0),
        .CO({\m_reg_reg[3]_i_3_n_0 ,\NLW_m_reg_reg[3]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\m_reg[3]_i_11_n_0 ,\m_reg[3]_i_12_n_0 ,\m_reg[3]_i_13_n_0 ,\m_reg[3]_i_14_n_0 }),
        .O({\m_reg_reg[3]_i_3_n_4 ,\m_reg_reg[3]_i_3_n_5 ,\m_reg_reg[3]_i_3_n_6 ,\m_reg_reg[3]_i_3_n_7 }),
        .S({\m_reg[3]_i_15_n_0 ,\m_reg[3]_i_16_n_0 ,\m_reg[3]_i_17_n_0 ,\m_reg[3]_i_18_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \m_reg_reg[4] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(m_reg0[4]),
        .Q(m_reg[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_reg_reg[5] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(m_reg0[5]),
        .Q(m_reg[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_reg_reg[6] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(m_reg0[6]),
        .Q(m_reg[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_reg_reg[7] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(m_reg0[7]),
        .Q(m_reg[7]),
        .R(1'b0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-9 {cell *THIS*} {string 10x10}}" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \m_reg_reg[7]_i_1 
       (.CI(1'b0),
        .CO({\m_reg_reg[7]_i_1_n_0 ,\NLW_m_reg_reg[7]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\m_reg[7]_i_2_n_0 ,\m_reg[7]_i_3_n_0 ,\m_reg[7]_i_4_n_0 ,\m_reg[7]_i_5_n_0 }),
        .O(m_reg0[7:4]),
        .S({\m_reg[7]_i_6_n_0 ,\m_reg[7]_i_7_n_0 ,\m_reg[7]_i_8_n_0 ,\m_reg[7]_i_9_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \m_reg_reg[8] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(m_reg0[8]),
        .Q(m_reg[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_reg_reg[9] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(m_reg0[9]),
        .Q(m_reg[9]),
        .R(1'b0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-9 {cell *THIS*} {string 10x10}}" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \m_reg_reg[9]_i_1 
       (.CI(\m_reg_reg[7]_i_1_n_0 ),
        .CO(\NLW_m_reg_reg[9]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\m_reg[9]_i_2_n_0 }),
        .O({\NLW_m_reg_reg[9]_i_1_O_UNCONNECTED [3:2],m_reg0[9:8]}),
        .S({1'b0,1'b0,\m_reg[9]_i_3_n_0 ,\m_reg[9]_i_4_n_0 }));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-9 {cell *THIS*} {string 10x10}}" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \m_reg_reg[9]_i_5 
       (.CI(\m_reg_reg[3]_i_2_n_0 ),
        .CO(\NLW_m_reg_reg[9]_i_5_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\m_reg[9]_i_9_n_0 ,\m_reg[9]_i_10_n_0 }),
        .O({\NLW_m_reg_reg[9]_i_5_O_UNCONNECTED [3],\m_reg_reg[9]_i_5_n_5 ,\m_reg_reg[9]_i_5_n_6 ,\m_reg_reg[9]_i_5_n_7 }),
        .S({1'b0,\m_reg[9]_i_11_n_0 ,\m_reg[9]_i_12_n_0 ,\m_reg[9]_i_13_n_0 }));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-9 {cell *THIS*} {string 10x10}}" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \m_reg_reg[9]_i_6 
       (.CI(\m_reg_reg[3]_i_3_n_0 ),
        .CO(\NLW_m_reg_reg[9]_i_6_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\m_reg[9]_i_14_n_0 ,\m_reg[9]_i_15_n_0 }),
        .O({\NLW_m_reg_reg[9]_i_6_O_UNCONNECTED [3],\m_reg_reg[9]_i_6_n_5 ,\m_reg_reg[9]_i_6_n_6 ,\m_reg_reg[9]_i_6_n_7 }),
        .S({1'b0,\m_reg[9]_i_16_n_0 ,\m_reg[9]_i_17_n_0 ,\m_reg[9]_i_18_n_0 }));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-9 {cell *THIS*} {string 10x10}}" *) 
  (* OPT_MODIFIED = "PROPCONST SWEEP" *) 
  CARRY4 \m_reg_reg[9]_i_7 
       (.CI(1'b0),
        .CO(\NLW_m_reg_reg[9]_i_7_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,\m_reg[9]_i_19_n_0 ,\m_reg[9]_i_20_n_0 ,1'b0}),
        .O({\m_reg_reg[9]_i_7_n_4 ,\m_reg_reg[9]_i_7_n_5 ,\m_reg_reg[9]_i_7_n_6 ,\m_reg_reg[9]_i_7_n_7 }),
        .S({\m_reg[9]_i_21_n_0 ,\m_reg[9]_i_22_n_0 ,\m_reg[9]_i_23_n_0 ,\m_reg[9]_i_24_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 p_reg0_carry
       (.CI(1'b0),
        .CO({p_reg0_carry_n_0,NLW_p_reg0_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI(m_reg[4:1]),
        .O(p_reg0[4:1]),
        .S({p_reg0_carry_i_1_n_0,p_reg0_carry_i_2_n_0,p_reg0_carry_i_3_n_0,p_reg0_carry_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 p_reg0_carry__0
       (.CI(p_reg0_carry_n_0),
        .CO({p_reg0_carry__0_n_0,NLW_p_reg0_carry__0_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI(m_reg[8:5]),
        .O(p_reg0[8:5]),
        .S({p_reg0_carry__0_i_1_n_0,p_reg0_carry__0_i_2_n_0,p_reg0_carry__0_i_3_n_0,p_reg0_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    p_reg0_carry__0_i_1
       (.I0(m_reg[8]),
        .I1(Q[8]),
        .O(p_reg0_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    p_reg0_carry__0_i_2
       (.I0(m_reg[7]),
        .I1(Q[7]),
        .O(p_reg0_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    p_reg0_carry__0_i_3
       (.I0(m_reg[6]),
        .I1(Q[6]),
        .O(p_reg0_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    p_reg0_carry__0_i_4
       (.I0(m_reg[5]),
        .I1(Q[5]),
        .O(p_reg0_carry__0_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 p_reg0_carry__1
       (.CI(p_reg0_carry__0_n_0),
        .CO(NLW_p_reg0_carry__1_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_p_reg0_carry__1_O_UNCONNECTED[3:1],p_reg0[9]}),
        .S({1'b0,1'b0,1'b0,p_reg0_carry__1_i_1_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    p_reg0_carry__1_i_1
       (.I0(Q[9]),
        .I1(m_reg[9]),
        .O(p_reg0_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    p_reg0_carry_i_1
       (.I0(m_reg[4]),
        .I1(Q[4]),
        .O(p_reg0_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    p_reg0_carry_i_2
       (.I0(m_reg[3]),
        .I1(Q[3]),
        .O(p_reg0_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    p_reg0_carry_i_3
       (.I0(m_reg[2]),
        .I1(Q[2]),
        .O(p_reg0_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    p_reg0_carry_i_4
       (.I0(m_reg[1]),
        .I1(Q[1]),
        .O(p_reg0_carry_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \p_reg_reg[0] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(Q[0]),
        .Q(\p_reg_reg[8]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \p_reg_reg[1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(p_reg0[1]),
        .Q(\p_reg_reg[8]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \p_reg_reg[2] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(p_reg0[2]),
        .Q(\p_reg_reg[8]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \p_reg_reg[3] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(p_reg0[3]),
        .Q(\p_reg_reg[8]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \p_reg_reg[4] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(p_reg0[4]),
        .Q(\p_reg_reg[8]_0 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \p_reg_reg[5] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(p_reg0[5]),
        .Q(\p_reg_reg[8]_0 [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \p_reg_reg[6] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(p_reg0[6]),
        .Q(\p_reg_reg[8]_0 [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \p_reg_reg[7] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(p_reg0[7]),
        .Q(\p_reg_reg[8]_0 [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \p_reg_reg[8] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(p_reg0[8]),
        .Q(\p_reg_reg[8]_0 [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \p_reg_reg[9] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(p_reg0[9]),
        .Q(P),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hF8FBF8F870407070)) 
    \ram_1_real_addr_b_reg_reg[0]_i_1 
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(O[0]),
        .I3(ram_array_reg_1),
        .I4(ram_array_reg_2),
        .I5(\p_reg_reg[8]_0 [0]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hF8FBF8F870407070)) 
    \ram_1_real_addr_b_reg_reg[1]_i_1 
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(O[1]),
        .I3(ram_array_reg_1),
        .I4(ram_array_reg_2),
        .I5(\p_reg_reg[8]_0 [1]),
        .O(D[1]));
  LUT6 #(
    .INIT(64'hF8FBF8F870407070)) 
    \ram_1_real_addr_b_reg_reg[2]_i_1 
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(O[2]),
        .I3(ram_array_reg_1),
        .I4(ram_array_reg_2),
        .I5(\p_reg_reg[8]_0 [2]),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hF8FBF8F870407070)) 
    \ram_1_real_addr_b_reg_reg[3]_i_1 
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(O[3]),
        .I3(ram_array_reg_1),
        .I4(ram_array_reg_2),
        .I5(\p_reg_reg[8]_0 [3]),
        .O(D[3]));
  LUT6 #(
    .INIT(64'hF8FBF8F870407070)) 
    \ram_1_real_addr_b_reg_reg[4]_i_1 
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(ram_array_reg_3[0]),
        .I3(ram_array_reg_1),
        .I4(ram_array_reg_2),
        .I5(\p_reg_reg[8]_0 [4]),
        .O(D[4]));
  LUT6 #(
    .INIT(64'hF8FBF8F870407070)) 
    \ram_1_real_addr_b_reg_reg[5]_i_1 
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(ram_array_reg_3[1]),
        .I3(ram_array_reg_1),
        .I4(ram_array_reg_2),
        .I5(\p_reg_reg[8]_0 [5]),
        .O(D[5]));
  LUT6 #(
    .INIT(64'hF8FBF8F870407070)) 
    \ram_1_real_addr_b_reg_reg[6]_i_1 
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(ram_array_reg_3[2]),
        .I3(ram_array_reg_1),
        .I4(ram_array_reg_2),
        .I5(\p_reg_reg[8]_0 [6]),
        .O(D[6]));
  LUT6 #(
    .INIT(64'hF8FBF8F870407070)) 
    \ram_1_real_addr_b_reg_reg[7]_i_1 
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(ram_array_reg_3[3]),
        .I3(ram_array_reg_1),
        .I4(ram_array_reg_2),
        .I5(\p_reg_reg[8]_0 [7]),
        .O(D[7]));
  LUT6 #(
    .INIT(64'hF8FBF8F870407070)) 
    \ram_1_real_addr_b_reg_reg[8]_i_1 
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(ram_array_reg_4[0]),
        .I3(ram_array_reg_1),
        .I4(ram_array_reg_2),
        .I5(\p_reg_reg[8]_0 [8]),
        .O(D[8]));
  LUT6 #(
    .INIT(64'hF8FBF8F870407070)) 
    \ram_1_real_addr_b_reg_reg[9]_i_1 
       (.I0(ram_array_reg),
        .I1(ram_array_reg_0),
        .I2(ram_array_reg_4[1]),
        .I3(ram_array_reg_1),
        .I4(ram_array_reg_2),
        .I5(P),
        .O(D[9]));
  LUT6 #(
    .INIT(64'hFFB0FFBF4F004000)) 
    \ram_2_real_addr_a_reg_reg[0]_i_1 
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(ram_array_reg_0),
        .I3(\p_reg_reg[8]_0 [0]),
        .I4(ram_array_reg),
        .I5(O[0]),
        .O(\write_cntr_reg[1] [0]));
  LUT6 #(
    .INIT(64'hFFB0FFBF4F004000)) 
    \ram_2_real_addr_a_reg_reg[1]_i_1 
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(ram_array_reg_0),
        .I3(\p_reg_reg[8]_0 [1]),
        .I4(ram_array_reg),
        .I5(O[1]),
        .O(\write_cntr_reg[1] [1]));
  LUT6 #(
    .INIT(64'hFFB0FFBF4F004000)) 
    \ram_2_real_addr_a_reg_reg[2]_i_1 
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(ram_array_reg_0),
        .I3(\p_reg_reg[8]_0 [2]),
        .I4(ram_array_reg),
        .I5(O[2]),
        .O(\write_cntr_reg[1] [2]));
  LUT6 #(
    .INIT(64'hFFB0FFBF4F004000)) 
    \ram_2_real_addr_a_reg_reg[3]_i_1 
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(ram_array_reg_0),
        .I3(\p_reg_reg[8]_0 [3]),
        .I4(ram_array_reg),
        .I5(O[3]),
        .O(\write_cntr_reg[1] [3]));
  LUT6 #(
    .INIT(64'hFFB0FFBF4F004000)) 
    \ram_2_real_addr_a_reg_reg[4]_i_1 
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(ram_array_reg_0),
        .I3(\p_reg_reg[8]_0 [4]),
        .I4(ram_array_reg),
        .I5(ram_array_reg_3[0]),
        .O(\write_cntr_reg[1] [4]));
  LUT6 #(
    .INIT(64'hFFB0FFBF4F004000)) 
    \ram_2_real_addr_a_reg_reg[5]_i_1 
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(ram_array_reg_0),
        .I3(\p_reg_reg[8]_0 [5]),
        .I4(ram_array_reg),
        .I5(ram_array_reg_3[1]),
        .O(\write_cntr_reg[1] [5]));
  LUT6 #(
    .INIT(64'hFFB0FFBF4F004000)) 
    \ram_2_real_addr_a_reg_reg[6]_i_1 
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(ram_array_reg_0),
        .I3(\p_reg_reg[8]_0 [6]),
        .I4(ram_array_reg),
        .I5(ram_array_reg_3[2]),
        .O(\write_cntr_reg[1] [6]));
  LUT6 #(
    .INIT(64'hFFB0FFBF4F004000)) 
    \ram_2_real_addr_a_reg_reg[7]_i_1 
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(ram_array_reg_0),
        .I3(\p_reg_reg[8]_0 [7]),
        .I4(ram_array_reg),
        .I5(ram_array_reg_3[3]),
        .O(\write_cntr_reg[1] [7]));
  LUT6 #(
    .INIT(64'hFFB0FFBF4F004000)) 
    \ram_2_real_addr_a_reg_reg[8]_i_1 
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(ram_array_reg_0),
        .I3(\p_reg_reg[8]_0 [8]),
        .I4(ram_array_reg),
        .I5(ram_array_reg_4[0]),
        .O(\write_cntr_reg[1] [8]));
  LUT6 #(
    .INIT(64'hFFB0FFBF4F004000)) 
    \ram_2_real_addr_a_reg_reg[9]_i_1 
       (.I0(ram_array_reg_1),
        .I1(ram_array_reg_2),
        .I2(ram_array_reg_0),
        .I3(P),
        .I4(ram_array_reg),
        .I5(ram_array_reg_4[1]),
        .O(\write_cntr_reg[1] [9]));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \ram_3_real_addr_a_reg_reg[0]_i_1 
       (.I0(O[0]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(\p_reg_reg[8]_0 [0]),
        .O(\write_cntr_reg[1]_0 [0]));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \ram_3_real_addr_a_reg_reg[1]_i_1 
       (.I0(O[1]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(\p_reg_reg[8]_0 [1]),
        .O(\write_cntr_reg[1]_0 [1]));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \ram_3_real_addr_a_reg_reg[2]_i_1 
       (.I0(O[2]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(\p_reg_reg[8]_0 [2]),
        .O(\write_cntr_reg[1]_0 [2]));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \ram_3_real_addr_a_reg_reg[3]_i_1 
       (.I0(O[3]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(\p_reg_reg[8]_0 [3]),
        .O(\write_cntr_reg[1]_0 [3]));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \ram_3_real_addr_a_reg_reg[4]_i_1 
       (.I0(ram_array_reg_3[0]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(\p_reg_reg[8]_0 [4]),
        .O(\write_cntr_reg[1]_0 [4]));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \ram_3_real_addr_a_reg_reg[5]_i_1 
       (.I0(ram_array_reg_3[1]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(\p_reg_reg[8]_0 [5]),
        .O(\write_cntr_reg[1]_0 [5]));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \ram_3_real_addr_a_reg_reg[6]_i_1 
       (.I0(ram_array_reg_3[2]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(\p_reg_reg[8]_0 [6]),
        .O(\write_cntr_reg[1]_0 [6]));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \ram_3_real_addr_a_reg_reg[7]_i_1 
       (.I0(ram_array_reg_3[3]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(\p_reg_reg[8]_0 [7]),
        .O(\write_cntr_reg[1]_0 [7]));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \ram_3_real_addr_a_reg_reg[8]_i_1 
       (.I0(ram_array_reg_4[0]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(\p_reg_reg[8]_0 [8]),
        .O(\write_cntr_reg[1]_0 [8]));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \ram_3_real_addr_a_reg_reg[9]_i_1 
       (.I0(ram_array_reg_4[1]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(P),
        .O(\write_cntr_reg[1]_0 [9]));
endmodule

(* ORIG_REF_NAME = "dsp_25x18" *) 
module dsp_25x18__parameterized1_16
   (D,
    PCOUT,
    clk100M_IBUF_BUFG,
    p_reg_reg_0);
  output [16:0]D;
  output [47:0]PCOUT;
  input clk100M_IBUF_BUFG;
  input [23:0]p_reg_reg_0;

  wire [16:0]D;
  wire [47:0]PCOUT;
  wire clk100M_IBUF_BUFG;
  wire [23:0]p_reg_reg_0;
  wire NLW_p_reg_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_p_reg_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_p_reg_reg_OVERFLOW_UNCONNECTED;
  wire NLW_p_reg_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_p_reg_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_p_reg_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_p_reg_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_p_reg_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_p_reg_reg_CARRYOUT_UNCONNECTED;
  wire [47:17]NLW_p_reg_reg_P_UNCONNECTED;

  (* OPT_MODIFIED = "SWEEP" *) 
  DSP48E1 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    p_reg_reg
       (.A({p_reg_reg_0[23],p_reg_reg_0[23],p_reg_reg_0[23],p_reg_reg_0[23],p_reg_reg_0[23],p_reg_reg_0[23],p_reg_reg_0}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_p_reg_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,p_reg_reg_0[16:0]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_p_reg_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_p_reg_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_p_reg_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b1),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b1),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b1),
        .CEP(1'b1),
        .CLK(clk100M_IBUF_BUFG),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_p_reg_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_p_reg_reg_OVERFLOW_UNCONNECTED),
        .P({NLW_p_reg_reg_P_UNCONNECTED[47:17],D}),
        .PATTERNBDETECT(NLW_p_reg_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_p_reg_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(PCOUT),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_p_reg_reg_UNDERFLOW_UNCONNECTED));
endmodule

(* ORIG_REF_NAME = "dsp_25x18" *) 
module dsp_25x18__parameterized1_17
   (D,
    PCOUT,
    clk100M_IBUF_BUFG,
    DOBDO);
  output [16:0]D;
  output [47:0]PCOUT;
  input clk100M_IBUF_BUFG;
  input [23:0]DOBDO;

  wire [16:0]D;
  wire [23:0]DOBDO;
  wire [47:0]PCOUT;
  wire clk100M_IBUF_BUFG;
  wire NLW_p_reg_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_p_reg_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_p_reg_reg_OVERFLOW_UNCONNECTED;
  wire NLW_p_reg_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_p_reg_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_p_reg_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_p_reg_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_p_reg_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_p_reg_reg_CARRYOUT_UNCONNECTED;
  wire [47:17]NLW_p_reg_reg_P_UNCONNECTED;

  (* OPT_MODIFIED = "SWEEP" *) 
  DSP48E1 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    p_reg_reg
       (.A({DOBDO[23],DOBDO[23],DOBDO[23],DOBDO[23],DOBDO[23],DOBDO[23],DOBDO}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_p_reg_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,DOBDO[16:0]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_p_reg_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_p_reg_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_p_reg_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b1),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b1),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b1),
        .CEP(1'b1),
        .CLK(clk100M_IBUF_BUFG),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_p_reg_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_p_reg_reg_OVERFLOW_UNCONNECTED),
        .P({NLW_p_reg_reg_P_UNCONNECTED[47:17],D}),
        .PATTERNBDETECT(NLW_p_reg_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_p_reg_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(PCOUT),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_p_reg_reg_UNDERFLOW_UNCONNECTED));
endmodule

(* ORIG_REF_NAME = "dsp_25x18" *) 
module dsp_25x18__parameterized1_2
   (Q,
    \b_reg_reg[0][0]_0 ,
    \b_reg_reg[0][0]_1 ,
    \b_reg_reg[0][0]_2 ,
    \b_reg_reg[0][0]_3 ,
    \b_reg_reg[0][0]_4 ,
    \b_reg_reg[0][5]_0 ,
    DI,
    \b_reg_reg[0][8]_0 ,
    D,
    \p_reg_reg[9]_0 ,
    \b_reg_reg[0][0]_5 ,
    \b_reg_reg[0][2]_0 ,
    \b_reg_reg[0][4]_0 ,
    \b_reg_reg[0][3]_0 ,
    \b_reg_reg[0][5]_1 ,
    \b_reg_reg[0][7]_0 ,
    \b_reg_reg[0][6]_0 ,
    S,
    \m_reg_reg[3]_0 ,
    m_reg0__56_carry_i_6__0_0,
    m_reg0__0_carry__1_i_3,
    \m_reg_reg[2]_0 ,
    \b_reg_reg[0][5]_2 ,
    dout_reg,
    p_0_in13_in,
    dout_reg_0,
    m_reg0__28_carry__0_0,
    clk100M_IBUF_BUFG,
    \a_reg_reg[0][9]_0 );
  output [9:0]Q;
  output \b_reg_reg[0][0]_0 ;
  output \b_reg_reg[0][0]_1 ;
  output \b_reg_reg[0][0]_2 ;
  output \b_reg_reg[0][0]_3 ;
  output \b_reg_reg[0][0]_4 ;
  output \b_reg_reg[0][5]_0 ;
  output [0:0]DI;
  output \b_reg_reg[0][8]_0 ;
  output [9:0]D;
  output [9:0]\p_reg_reg[9]_0 ;
  output [1:0]\b_reg_reg[0][0]_5 ;
  output [1:0]\b_reg_reg[0][2]_0 ;
  output [0:0]\b_reg_reg[0][4]_0 ;
  output [0:0]\b_reg_reg[0][3]_0 ;
  output [0:0]\b_reg_reg[0][5]_1 ;
  output [0:0]\b_reg_reg[0][7]_0 ;
  output [0:0]\b_reg_reg[0][6]_0 ;
  input [0:0]S;
  input [0:0]\m_reg_reg[3]_0 ;
  input [0:0]m_reg0__56_carry_i_6__0_0;
  input [8:0]m_reg0__0_carry__1_i_3;
  input [0:0]\m_reg_reg[2]_0 ;
  input [3:0]\b_reg_reg[0][5]_2 ;
  input dout_reg;
  input p_0_in13_in;
  input [9:0]dout_reg_0;
  input m_reg0__28_carry__0_0;
  input clk100M_IBUF_BUFG;
  input [8:0]\a_reg_reg[0][9]_0 ;

  wire [9:0]D;
  wire [0:0]DI;
  wire [9:0]Q;
  wire [0:0]S;
  wire [8:0]\a_reg_reg[0][9]_0 ;
  wire \a_reg_reg_n_0_[0][1] ;
  wire \a_reg_reg_n_0_[0][2] ;
  wire \a_reg_reg_n_0_[0][3] ;
  wire \a_reg_reg_n_0_[0][4] ;
  wire \a_reg_reg_n_0_[0][5] ;
  wire \a_reg_reg_n_0_[0][6] ;
  wire \a_reg_reg_n_0_[0][7] ;
  wire \a_reg_reg_n_0_[0][8] ;
  wire \a_reg_reg_n_0_[0][9] ;
  wire \b_reg_reg[0][0]_0 ;
  wire \b_reg_reg[0][0]_1 ;
  wire \b_reg_reg[0][0]_2 ;
  wire \b_reg_reg[0][0]_3 ;
  wire \b_reg_reg[0][0]_4 ;
  wire [1:0]\b_reg_reg[0][0]_5 ;
  wire [1:0]\b_reg_reg[0][2]_0 ;
  wire [0:0]\b_reg_reg[0][3]_0 ;
  wire [0:0]\b_reg_reg[0][4]_0 ;
  wire \b_reg_reg[0][5]_0 ;
  wire [0:0]\b_reg_reg[0][5]_1 ;
  wire [3:0]\b_reg_reg[0][5]_2 ;
  wire [0:0]\b_reg_reg[0][6]_0 ;
  wire [0:0]\b_reg_reg[0][7]_0 ;
  wire \b_reg_reg[0][8]_0 ;
  wire clk100M_IBUF_BUFG;
  wire dout_reg;
  wire [9:0]dout_reg_0;
  wire m_reg0__0_carry__0_i_10_n_0;
  wire m_reg0__0_carry__0_i_11_n_0;
  wire m_reg0__0_carry__0_i_12_n_0;
  wire m_reg0__0_carry__0_i_1_n_0;
  wire m_reg0__0_carry__0_i_2_n_0;
  wire m_reg0__0_carry__0_i_3_n_0;
  wire m_reg0__0_carry__0_i_4_n_0;
  wire m_reg0__0_carry__0_i_5__0_n_0;
  wire m_reg0__0_carry__0_i_6__0_n_0;
  wire m_reg0__0_carry__0_i_7__0_n_0;
  wire m_reg0__0_carry__0_i_8__0_n_0;
  wire m_reg0__0_carry__0_i_9_n_0;
  wire m_reg0__0_carry__0_n_0;
  wire m_reg0__0_carry__0_n_4;
  wire m_reg0__0_carry__0_n_5;
  wire m_reg0__0_carry__0_n_6;
  wire m_reg0__0_carry__0_n_7;
  wire m_reg0__0_carry__1_i_1_n_0;
  wire m_reg0__0_carry__1_i_2__0_n_0;
  wire [8:0]m_reg0__0_carry__1_i_3;
  wire m_reg0__0_carry__1_i_3__0_n_0;
  wire m_reg0__0_carry__1_i_4_n_0;
  wire m_reg0__0_carry__1_i_5_n_0;
  wire m_reg0__0_carry__1_n_6;
  wire m_reg0__0_carry__1_n_7;
  wire m_reg0__0_carry_i_1__0_n_0;
  wire m_reg0__0_carry_i_2__0_n_0;
  wire m_reg0__0_carry_i_3__0_n_0;
  wire m_reg0__0_carry_i_4__0_n_0;
  wire m_reg0__0_carry_i_5__0_n_0;
  wire m_reg0__0_carry_i_6__0_n_0;
  wire m_reg0__0_carry_n_0;
  wire m_reg0__0_carry_n_4;
  wire m_reg0__0_carry_n_5;
  wire m_reg0__0_carry_n_6;
  wire m_reg0__0_carry_n_7;
  wire m_reg0__28_carry__0_0;
  wire m_reg0__28_carry__0_i_1__0_n_0;
  wire m_reg0__28_carry__0_i_2__0_n_0;
  wire m_reg0__28_carry__0_i_3__0_n_0;
  wire m_reg0__28_carry__0_i_4__0_n_0;
  wire m_reg0__28_carry__0_i_5__0_n_0;
  wire m_reg0__28_carry__0_i_6__0_n_0;
  wire m_reg0__28_carry__0_i_7__0_n_0;
  wire m_reg0__28_carry__0_i_8__0_n_0;
  wire m_reg0__28_carry__0_n_5;
  wire m_reg0__28_carry__0_n_6;
  wire m_reg0__28_carry__0_n_7;
  wire m_reg0__28_carry_i_1__0_n_0;
  wire m_reg0__28_carry_i_2__0_n_0;
  wire m_reg0__28_carry_i_3__0_n_0;
  wire m_reg0__28_carry_i_4__0_n_0;
  wire m_reg0__28_carry_i_5__0_n_0;
  wire m_reg0__28_carry_i_6__0_n_0;
  wire m_reg0__28_carry_i_8__0_n_0;
  wire m_reg0__28_carry_n_0;
  wire m_reg0__28_carry_n_4;
  wire m_reg0__28_carry_n_5;
  wire m_reg0__28_carry_n_6;
  wire m_reg0__28_carry_n_7;
  wire m_reg0__47_carry_i_1__0_n_0;
  wire m_reg0__47_carry_i_2__0_n_0;
  wire m_reg0__47_carry_i_3__0_n_0;
  wire m_reg0__47_carry_i_4__0_n_0;
  wire m_reg0__47_carry_i_5__0_n_0;
  wire m_reg0__47_carry_i_7__0_n_0;
  wire m_reg0__47_carry_n_4;
  wire m_reg0__47_carry_n_5;
  wire m_reg0__47_carry_n_6;
  wire m_reg0__47_carry_n_7;
  wire m_reg0__56_carry__0_i_1__0_n_0;
  wire m_reg0__56_carry__0_i_2__0_n_0;
  wire m_reg0__56_carry__0_i_3__0_n_0;
  wire m_reg0__56_carry__0_i_4__0_n_0;
  wire m_reg0__56_carry__0_n_6;
  wire m_reg0__56_carry__0_n_7;
  wire m_reg0__56_carry_i_1__0_n_0;
  wire m_reg0__56_carry_i_2__0_n_0;
  wire m_reg0__56_carry_i_3__0_n_0;
  wire m_reg0__56_carry_i_4__0_n_0;
  wire m_reg0__56_carry_i_5__0_n_0;
  wire [0:0]m_reg0__56_carry_i_6__0_0;
  wire m_reg0__56_carry_i_6__0_n_0;
  wire m_reg0__56_carry_i_7__0_n_0;
  wire m_reg0__56_carry_i_8__0_n_0;
  wire m_reg0__56_carry_n_0;
  wire m_reg0__56_carry_n_4;
  wire m_reg0__56_carry_n_5;
  wire m_reg0__56_carry_n_6;
  wire m_reg0__56_carry_n_7;
  wire \m_reg[3]_i_1__1_n_0 ;
  wire [0:0]\m_reg_reg[2]_0 ;
  wire [0:0]\m_reg_reg[3]_0 ;
  wire \m_reg_reg_n_0_[0] ;
  wire \m_reg_reg_n_0_[1] ;
  wire \m_reg_reg_n_0_[2] ;
  wire \m_reg_reg_n_0_[3] ;
  wire \m_reg_reg_n_0_[4] ;
  wire \m_reg_reg_n_0_[5] ;
  wire \m_reg_reg_n_0_[6] ;
  wire \m_reg_reg_n_0_[7] ;
  wire \m_reg_reg_n_0_[8] ;
  wire \m_reg_reg_n_0_[9] ;
  wire p_0_in13_in;
  wire [9:0]\p_reg_reg[9]_0 ;
  wire \p_reg_reg_n_0_[0] ;
  wire \p_reg_reg_n_0_[1] ;
  wire \p_reg_reg_n_0_[2] ;
  wire \p_reg_reg_n_0_[3] ;
  wire \p_reg_reg_n_0_[4] ;
  wire \p_reg_reg_n_0_[5] ;
  wire \p_reg_reg_n_0_[6] ;
  wire \p_reg_reg_n_0_[7] ;
  wire \p_reg_reg_n_0_[8] ;
  wire \p_reg_reg_n_0_[9] ;
  wire [2:0]NLW_m_reg0__0_carry_CO_UNCONNECTED;
  wire [2:0]NLW_m_reg0__0_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_m_reg0__0_carry__1_CO_UNCONNECTED;
  wire [3:2]NLW_m_reg0__0_carry__1_O_UNCONNECTED;
  wire [2:0]NLW_m_reg0__28_carry_CO_UNCONNECTED;
  wire [3:0]NLW_m_reg0__28_carry__0_CO_UNCONNECTED;
  wire [3:3]NLW_m_reg0__28_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_m_reg0__47_carry_CO_UNCONNECTED;
  wire [2:0]NLW_m_reg0__56_carry_CO_UNCONNECTED;
  wire [3:0]NLW_m_reg0__56_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_m_reg0__56_carry__0_O_UNCONNECTED;

  FDRE #(
    .INIT(1'b0)) 
    \a_reg_reg[0][1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\a_reg_reg[0][9]_0 [0]),
        .Q(\a_reg_reg_n_0_[0][1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \a_reg_reg[0][2] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\a_reg_reg[0][9]_0 [1]),
        .Q(\a_reg_reg_n_0_[0][2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \a_reg_reg[0][3] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\a_reg_reg[0][9]_0 [2]),
        .Q(\a_reg_reg_n_0_[0][3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \a_reg_reg[0][4] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\a_reg_reg[0][9]_0 [3]),
        .Q(\a_reg_reg_n_0_[0][4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \a_reg_reg[0][5] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\a_reg_reg[0][9]_0 [4]),
        .Q(\a_reg_reg_n_0_[0][5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \a_reg_reg[0][6] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\a_reg_reg[0][9]_0 [5]),
        .Q(\a_reg_reg_n_0_[0][6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \a_reg_reg[0][7] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\a_reg_reg[0][9]_0 [6]),
        .Q(\a_reg_reg_n_0_[0][7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \a_reg_reg[0][8] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\a_reg_reg[0][9]_0 [7]),
        .Q(\a_reg_reg_n_0_[0][8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \a_reg_reg[0][9] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\a_reg_reg[0][9]_0 [8]),
        .Q(\a_reg_reg_n_0_[0][9] ),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0040)) 
    \b_reg[0][0]_i_1 
       (.I0(\b_reg_reg[0][5]_2 [2]),
        .I1(\b_reg_reg[0][5]_2 [3]),
        .I2(\b_reg_reg[0][5]_2 [1]),
        .I3(\b_reg_reg[0][5]_2 [0]),
        .O(D[0]));
  LUT4 #(
    .INIT(16'h0400)) 
    \b_reg[0][1]_i_1 
       (.I0(\b_reg_reg[0][5]_2 [2]),
        .I1(\b_reg_reg[0][5]_2 [3]),
        .I2(\b_reg_reg[0][5]_2 [1]),
        .I3(\b_reg_reg[0][5]_2 [0]),
        .O(D[1]));
  LUT4 #(
    .INIT(16'h0004)) 
    \b_reg[0][2]_i_1 
       (.I0(\b_reg_reg[0][5]_2 [2]),
        .I1(\b_reg_reg[0][5]_2 [3]),
        .I2(\b_reg_reg[0][5]_2 [0]),
        .I3(\b_reg_reg[0][5]_2 [1]),
        .O(D[2]));
  LUT4 #(
    .INIT(16'h0800)) 
    \b_reg[0][3]_i_1 
       (.I0(\b_reg_reg[0][5]_2 [0]),
        .I1(\b_reg_reg[0][5]_2 [1]),
        .I2(\b_reg_reg[0][5]_2 [3]),
        .I3(\b_reg_reg[0][5]_2 [2]),
        .O(D[3]));
  LUT4 #(
    .INIT(16'h0040)) 
    \b_reg[0][4]_i_1 
       (.I0(\b_reg_reg[0][5]_2 [3]),
        .I1(\b_reg_reg[0][5]_2 [2]),
        .I2(\b_reg_reg[0][5]_2 [1]),
        .I3(\b_reg_reg[0][5]_2 [0]),
        .O(D[4]));
  LUT4 #(
    .INIT(16'h0400)) 
    \b_reg[0][5]_i_1 
       (.I0(\b_reg_reg[0][5]_2 [1]),
        .I1(\b_reg_reg[0][5]_2 [0]),
        .I2(\b_reg_reg[0][5]_2 [3]),
        .I3(\b_reg_reg[0][5]_2 [2]),
        .O(D[5]));
  LUT4 #(
    .INIT(16'h0100)) 
    \b_reg[0][6]_i_1 
       (.I0(\b_reg_reg[0][5]_2 [0]),
        .I1(\b_reg_reg[0][5]_2 [1]),
        .I2(\b_reg_reg[0][5]_2 [3]),
        .I3(\b_reg_reg[0][5]_2 [2]),
        .O(D[6]));
  LUT4 #(
    .INIT(16'h0020)) 
    \b_reg[0][7]_i_1 
       (.I0(\b_reg_reg[0][5]_2 [0]),
        .I1(\b_reg_reg[0][5]_2 [3]),
        .I2(\b_reg_reg[0][5]_2 [1]),
        .I3(\b_reg_reg[0][5]_2 [2]),
        .O(D[7]));
  LUT4 #(
    .INIT(16'h0010)) 
    \b_reg[0][8]_i_1 
       (.I0(\b_reg_reg[0][5]_2 [0]),
        .I1(\b_reg_reg[0][5]_2 [3]),
        .I2(\b_reg_reg[0][5]_2 [1]),
        .I3(\b_reg_reg[0][5]_2 [2]),
        .O(D[8]));
  LUT4 #(
    .INIT(16'h0100)) 
    \b_reg[0][9]_i_1 
       (.I0(\b_reg_reg[0][5]_2 [3]),
        .I1(\b_reg_reg[0][5]_2 [2]),
        .I2(\b_reg_reg[0][5]_2 [1]),
        .I3(\b_reg_reg[0][5]_2 [0]),
        .O(D[9]));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[0][0] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(D[0]),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[0][1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(D[1]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[0][2] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(D[2]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[0][3] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(D[3]),
        .Q(Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[0][4] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(D[4]),
        .Q(Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[0][5] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(D[5]),
        .Q(Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[0][6] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(D[6]),
        .Q(Q[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[0][7] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(D[7]),
        .Q(Q[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[0][8] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(D[8]),
        .Q(Q[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[0][9] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(D[9]),
        .Q(Q[9]),
        .R(1'b0));
  (* OPT_MODIFIED = "PROPCONST SWEEP" *) 
  CARRY4 m_reg0__0_carry
       (.CI(1'b0),
        .CO({m_reg0__0_carry_n_0,NLW_m_reg0__0_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({m_reg0__0_carry_i_1__0_n_0,m_reg0__0_carry_i_2__0_n_0,m_reg0__0_carry_i_3__0_n_0,1'b0}),
        .O({m_reg0__0_carry_n_4,m_reg0__0_carry_n_5,m_reg0__0_carry_n_6,m_reg0__0_carry_n_7}),
        .S({m_reg0__0_carry_i_4__0_n_0,m_reg0__0_carry_i_5__0_n_0,m_reg0__0_carry_i_6__0_n_0,S}));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 m_reg0__0_carry__0
       (.CI(m_reg0__0_carry_n_0),
        .CO({m_reg0__0_carry__0_n_0,NLW_m_reg0__0_carry__0_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({m_reg0__0_carry__0_i_1_n_0,m_reg0__0_carry__0_i_2_n_0,m_reg0__0_carry__0_i_3_n_0,m_reg0__0_carry__0_i_4_n_0}),
        .O({m_reg0__0_carry__0_n_4,m_reg0__0_carry__0_n_5,m_reg0__0_carry__0_n_6,m_reg0__0_carry__0_n_7}),
        .S({m_reg0__0_carry__0_i_5__0_n_0,m_reg0__0_carry__0_i_6__0_n_0,m_reg0__0_carry__0_i_7__0_n_0,m_reg0__0_carry__0_i_8__0_n_0}));
  LUT6 #(
    .INIT(64'hF880808088000000)) 
    m_reg0__0_carry__0_i_1
       (.I0(\a_reg_reg_n_0_[0][5] ),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(\a_reg_reg_n_0_[0][4] ),
        .I5(\a_reg_reg_n_0_[0][6] ),
        .O(m_reg0__0_carry__0_i_1_n_0));
  LUT6 #(
    .INIT(64'h8778787877888888)) 
    m_reg0__0_carry__0_i_10
       (.I0(Q[0]),
        .I1(\a_reg_reg_n_0_[0][6] ),
        .I2(\a_reg_reg_n_0_[0][5] ),
        .I3(\a_reg_reg_n_0_[0][4] ),
        .I4(Q[2]),
        .I5(Q[1]),
        .O(m_reg0__0_carry__0_i_10_n_0));
  LUT6 #(
    .INIT(64'h8778787877888888)) 
    m_reg0__0_carry__0_i_10__0
       (.I0(Q[0]),
        .I1(m_reg0__0_carry__1_i_3[6]),
        .I2(m_reg0__0_carry__1_i_3[5]),
        .I3(m_reg0__0_carry__1_i_3[4]),
        .I4(Q[2]),
        .I5(Q[1]),
        .O(\b_reg_reg[0][0]_2 ));
  LUT6 #(
    .INIT(64'h8778787877888888)) 
    m_reg0__0_carry__0_i_11
       (.I0(Q[0]),
        .I1(\a_reg_reg_n_0_[0][5] ),
        .I2(\a_reg_reg_n_0_[0][4] ),
        .I3(\a_reg_reg_n_0_[0][3] ),
        .I4(Q[2]),
        .I5(Q[1]),
        .O(m_reg0__0_carry__0_i_11_n_0));
  LUT6 #(
    .INIT(64'h8778787877888888)) 
    m_reg0__0_carry__0_i_11__0
       (.I0(Q[0]),
        .I1(m_reg0__0_carry__1_i_3[5]),
        .I2(m_reg0__0_carry__1_i_3[4]),
        .I3(m_reg0__0_carry__1_i_3[3]),
        .I4(Q[2]),
        .I5(Q[1]),
        .O(\b_reg_reg[0][0]_3 ));
  LUT6 #(
    .INIT(64'h8778787877888888)) 
    m_reg0__0_carry__0_i_12
       (.I0(Q[0]),
        .I1(\a_reg_reg_n_0_[0][4] ),
        .I2(\a_reg_reg_n_0_[0][3] ),
        .I3(\a_reg_reg_n_0_[0][2] ),
        .I4(Q[2]),
        .I5(Q[1]),
        .O(m_reg0__0_carry__0_i_12_n_0));
  LUT6 #(
    .INIT(64'h8778787877888888)) 
    m_reg0__0_carry__0_i_12__0
       (.I0(Q[0]),
        .I1(m_reg0__0_carry__1_i_3[4]),
        .I2(m_reg0__0_carry__1_i_3[3]),
        .I3(m_reg0__0_carry__1_i_3[2]),
        .I4(Q[2]),
        .I5(Q[1]),
        .O(\b_reg_reg[0][0]_4 ));
  LUT6 #(
    .INIT(64'hF880808088000000)) 
    m_reg0__0_carry__0_i_2
       (.I0(\a_reg_reg_n_0_[0][4] ),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(\a_reg_reg_n_0_[0][3] ),
        .I5(\a_reg_reg_n_0_[0][5] ),
        .O(m_reg0__0_carry__0_i_2_n_0));
  LUT6 #(
    .INIT(64'hF880808088000000)) 
    m_reg0__0_carry__0_i_3
       (.I0(\a_reg_reg_n_0_[0][3] ),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(\a_reg_reg_n_0_[0][2] ),
        .I5(\a_reg_reg_n_0_[0][4] ),
        .O(m_reg0__0_carry__0_i_3_n_0));
  LUT6 #(
    .INIT(64'hF880808088000000)) 
    m_reg0__0_carry__0_i_4
       (.I0(\a_reg_reg_n_0_[0][2] ),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(\a_reg_reg_n_0_[0][1] ),
        .I5(\a_reg_reg_n_0_[0][3] ),
        .O(m_reg0__0_carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    m_reg0__0_carry__0_i_5__0
       (.I0(m_reg0__0_carry__0_i_1_n_0),
        .I1(m_reg0__0_carry__0_i_9_n_0),
        .O(m_reg0__0_carry__0_i_5__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    m_reg0__0_carry__0_i_6__0
       (.I0(m_reg0__0_carry__0_i_2_n_0),
        .I1(m_reg0__0_carry__0_i_10_n_0),
        .O(m_reg0__0_carry__0_i_6__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    m_reg0__0_carry__0_i_7__0
       (.I0(m_reg0__0_carry__0_i_3_n_0),
        .I1(m_reg0__0_carry__0_i_11_n_0),
        .O(m_reg0__0_carry__0_i_7__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    m_reg0__0_carry__0_i_8__0
       (.I0(m_reg0__0_carry__0_i_4_n_0),
        .I1(m_reg0__0_carry__0_i_12_n_0),
        .O(m_reg0__0_carry__0_i_8__0_n_0));
  LUT6 #(
    .INIT(64'h8778787877888888)) 
    m_reg0__0_carry__0_i_9
       (.I0(Q[0]),
        .I1(\a_reg_reg_n_0_[0][7] ),
        .I2(\a_reg_reg_n_0_[0][6] ),
        .I3(\a_reg_reg_n_0_[0][5] ),
        .I4(Q[2]),
        .I5(Q[1]),
        .O(m_reg0__0_carry__0_i_9_n_0));
  LUT6 #(
    .INIT(64'h8778787877888888)) 
    m_reg0__0_carry__0_i_9__0
       (.I0(Q[0]),
        .I1(m_reg0__0_carry__1_i_3[7]),
        .I2(m_reg0__0_carry__1_i_3[6]),
        .I3(m_reg0__0_carry__1_i_3[5]),
        .I4(Q[2]),
        .I5(Q[1]),
        .O(\b_reg_reg[0][0]_1 ));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 m_reg0__0_carry__1
       (.CI(m_reg0__0_carry__0_n_0),
        .CO(NLW_m_reg0__0_carry__1_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,m_reg0__0_carry__1_i_1_n_0}),
        .O({NLW_m_reg0__0_carry__1_O_UNCONNECTED[3:2],m_reg0__0_carry__1_n_6,m_reg0__0_carry__1_n_7}),
        .S({1'b0,1'b0,m_reg0__0_carry__1_i_2__0_n_0,m_reg0__0_carry__1_i_3__0_n_0}));
  LUT6 #(
    .INIT(64'hF880808088000000)) 
    m_reg0__0_carry__1_i_1
       (.I0(\a_reg_reg_n_0_[0][6] ),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(\a_reg_reg_n_0_[0][5] ),
        .I5(\a_reg_reg_n_0_[0][7] ),
        .O(m_reg0__0_carry__1_i_1_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    m_reg0__0_carry__1_i_2__0
       (.I0(Q[0]),
        .I1(\a_reg_reg_n_0_[0][9] ),
        .I2(m_reg0__0_carry__1_i_4_n_0),
        .O(m_reg0__0_carry__1_i_2__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    m_reg0__0_carry__1_i_3__0
       (.I0(m_reg0__0_carry__1_i_1_n_0),
        .I1(m_reg0__0_carry__1_i_5_n_0),
        .O(m_reg0__0_carry__1_i_3__0_n_0));
  LUT6 #(
    .INIT(64'h1A8FCF0F807FFFFF)) 
    m_reg0__0_carry__1_i_4
       (.I0(\a_reg_reg_n_0_[0][6] ),
        .I1(Q[0]),
        .I2(\a_reg_reg_n_0_[0][8] ),
        .I3(\a_reg_reg_n_0_[0][7] ),
        .I4(Q[2]),
        .I5(Q[1]),
        .O(m_reg0__0_carry__1_i_4_n_0));
  LUT6 #(
    .INIT(64'h8778787877888888)) 
    m_reg0__0_carry__1_i_5
       (.I0(Q[0]),
        .I1(\a_reg_reg_n_0_[0][8] ),
        .I2(\a_reg_reg_n_0_[0][7] ),
        .I3(\a_reg_reg_n_0_[0][6] ),
        .I4(Q[2]),
        .I5(Q[1]),
        .O(m_reg0__0_carry__1_i_5_n_0));
  LUT6 #(
    .INIT(64'h8778787877888888)) 
    m_reg0__0_carry__1_i_5__0
       (.I0(Q[0]),
        .I1(m_reg0__0_carry__1_i_3[8]),
        .I2(m_reg0__0_carry__1_i_3[7]),
        .I3(m_reg0__0_carry__1_i_3[6]),
        .I4(Q[2]),
        .I5(Q[1]),
        .O(\b_reg_reg[0][0]_0 ));
  LUT6 #(
    .INIT(64'h8778787877888888)) 
    m_reg0__0_carry_i_1
       (.I0(Q[0]),
        .I1(m_reg0__0_carry__1_i_3[3]),
        .I2(m_reg0__0_carry__1_i_3[2]),
        .I3(m_reg0__0_carry__1_i_3[1]),
        .I4(Q[2]),
        .I5(Q[1]),
        .O(\b_reg_reg[0][0]_5 [1]));
  LUT6 #(
    .INIT(64'h8778787877888888)) 
    m_reg0__0_carry_i_1__0
       (.I0(Q[0]),
        .I1(\a_reg_reg_n_0_[0][3] ),
        .I2(\a_reg_reg_n_0_[0][2] ),
        .I3(\a_reg_reg_n_0_[0][1] ),
        .I4(Q[2]),
        .I5(Q[1]),
        .O(m_reg0__0_carry_i_1__0_n_0));
  LUT4 #(
    .INIT(16'h7888)) 
    m_reg0__0_carry_i_2
       (.I0(Q[1]),
        .I1(m_reg0__0_carry__1_i_3[1]),
        .I2(Q[2]),
        .I3(m_reg0__0_carry__1_i_3[0]),
        .O(\b_reg_reg[0][0]_5 [0]));
  LUT4 #(
    .INIT(16'h7888)) 
    m_reg0__0_carry_i_2__0
       (.I0(Q[1]),
        .I1(\a_reg_reg_n_0_[0][1] ),
        .I2(Q[2]),
        .I3(\m_reg_reg[2]_0 ),
        .O(m_reg0__0_carry_i_2__0_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    m_reg0__0_carry_i_3__0
       (.I0(\a_reg_reg_n_0_[0][1] ),
        .I1(Q[0]),
        .O(m_reg0__0_carry_i_3__0_n_0));
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    m_reg0__0_carry_i_4
       (.I0(\b_reg_reg[0][0]_5 [1]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(m_reg0__0_carry__1_i_3[0]),
        .I4(m_reg0__0_carry__1_i_3[1]),
        .O(\b_reg_reg[0][2]_0 [1]));
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    m_reg0__0_carry_i_4__0
       (.I0(m_reg0__0_carry_i_1__0_n_0),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(\m_reg_reg[2]_0 ),
        .I4(\a_reg_reg_n_0_[0][1] ),
        .O(m_reg0__0_carry_i_4__0_n_0));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    m_reg0__0_carry_i_5__0
       (.I0(\m_reg_reg[2]_0 ),
        .I1(Q[2]),
        .I2(\a_reg_reg_n_0_[0][1] ),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\a_reg_reg_n_0_[0][2] ),
        .O(m_reg0__0_carry_i_5__0_n_0));
  LUT4 #(
    .INIT(16'h7888)) 
    m_reg0__0_carry_i_6
       (.I0(Q[0]),
        .I1(m_reg0__0_carry__1_i_3[1]),
        .I2(Q[1]),
        .I3(m_reg0__0_carry__1_i_3[0]),
        .O(\b_reg_reg[0][2]_0 [0]));
  LUT4 #(
    .INIT(16'h7888)) 
    m_reg0__0_carry_i_6__0
       (.I0(Q[0]),
        .I1(\a_reg_reg_n_0_[0][1] ),
        .I2(Q[1]),
        .I3(\m_reg_reg[2]_0 ),
        .O(m_reg0__0_carry_i_6__0_n_0));
  (* OPT_MODIFIED = "PROPCONST SWEEP" *) 
  CARRY4 m_reg0__28_carry
       (.CI(1'b0),
        .CO({m_reg0__28_carry_n_0,NLW_m_reg0__28_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({m_reg0__28_carry_i_1__0_n_0,m_reg0__28_carry_i_2__0_n_0,m_reg0__28_carry_i_3__0_n_0,1'b0}),
        .O({m_reg0__28_carry_n_4,m_reg0__28_carry_n_5,m_reg0__28_carry_n_6,m_reg0__28_carry_n_7}),
        .S({m_reg0__28_carry_i_4__0_n_0,m_reg0__28_carry_i_5__0_n_0,m_reg0__28_carry_i_6__0_n_0,\m_reg_reg[3]_0 }));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 m_reg0__28_carry__0
       (.CI(m_reg0__28_carry_n_0),
        .CO(NLW_m_reg0__28_carry__0_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,m_reg0__28_carry__0_i_1__0_n_0,m_reg0__28_carry__0_i_2__0_n_0}),
        .O({NLW_m_reg0__28_carry__0_O_UNCONNECTED[3],m_reg0__28_carry__0_n_5,m_reg0__28_carry__0_n_6,m_reg0__28_carry__0_n_7}),
        .S({1'b0,m_reg0__28_carry__0_i_3__0_n_0,m_reg0__28_carry__0_i_4__0_n_0,m_reg0__28_carry__0_i_5__0_n_0}));
  LUT6 #(
    .INIT(64'hF880808088000000)) 
    m_reg0__28_carry__0_i_1
       (.I0(Q[4]),
        .I1(m_reg0__0_carry__1_i_3[3]),
        .I2(m_reg0__0_carry__1_i_3[4]),
        .I3(Q[5]),
        .I4(m_reg0__0_carry__1_i_3[2]),
        .I5(Q[3]),
        .O(DI));
  LUT6 #(
    .INIT(64'hF880808088000000)) 
    m_reg0__28_carry__0_i_1__0
       (.I0(Q[4]),
        .I1(\a_reg_reg_n_0_[0][3] ),
        .I2(\a_reg_reg_n_0_[0][4] ),
        .I3(Q[5]),
        .I4(\a_reg_reg_n_0_[0][2] ),
        .I5(Q[3]),
        .O(m_reg0__28_carry__0_i_1__0_n_0));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    m_reg0__28_carry__0_i_2__0
       (.I0(\a_reg_reg_n_0_[0][2] ),
        .I1(Q[4]),
        .I2(\a_reg_reg_n_0_[0][1] ),
        .I3(Q[5]),
        .I4(\a_reg_reg_n_0_[0][3] ),
        .I5(Q[3]),
        .O(m_reg0__28_carry__0_i_2__0_n_0));
  LUT3 #(
    .INIT(8'h87)) 
    m_reg0__28_carry__0_i_3__0
       (.I0(Q[3]),
        .I1(\a_reg_reg_n_0_[0][6] ),
        .I2(m_reg0__28_carry__0_i_6__0_n_0),
        .O(m_reg0__28_carry__0_i_3__0_n_0));
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    m_reg0__28_carry__0_i_4
       (.I0(DI),
        .I1(Q[5]),
        .I2(m_reg0__0_carry__1_i_3[3]),
        .I3(m_reg0__28_carry__0_0),
        .I4(Q[3]),
        .I5(m_reg0__0_carry__1_i_3[5]),
        .O(\b_reg_reg[0][5]_1 ));
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    m_reg0__28_carry__0_i_4__0
       (.I0(m_reg0__28_carry__0_i_1__0_n_0),
        .I1(Q[5]),
        .I2(\a_reg_reg_n_0_[0][3] ),
        .I3(m_reg0__28_carry__0_i_7__0_n_0),
        .I4(\a_reg_reg_n_0_[0][5] ),
        .I5(Q[3]),
        .O(m_reg0__28_carry__0_i_4__0_n_0));
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    m_reg0__28_carry__0_i_5__0
       (.I0(m_reg0__28_carry__0_i_2__0_n_0),
        .I1(Q[5]),
        .I2(\a_reg_reg_n_0_[0][2] ),
        .I3(m_reg0__28_carry__0_i_8__0_n_0),
        .I4(\a_reg_reg_n_0_[0][4] ),
        .I5(Q[3]),
        .O(m_reg0__28_carry__0_i_5__0_n_0));
  LUT6 #(
    .INIT(64'h18A0CFFF87FF0FFF)) 
    m_reg0__28_carry__0_i_6__0
       (.I0(Q[3]),
        .I1(\a_reg_reg_n_0_[0][3] ),
        .I2(\a_reg_reg_n_0_[0][4] ),
        .I3(Q[5]),
        .I4(\a_reg_reg_n_0_[0][5] ),
        .I5(Q[4]),
        .O(m_reg0__28_carry__0_i_6__0_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    m_reg0__28_carry__0_i_7__0
       (.I0(\a_reg_reg_n_0_[0][4] ),
        .I1(Q[4]),
        .O(m_reg0__28_carry__0_i_7__0_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    m_reg0__28_carry__0_i_8__0
       (.I0(\a_reg_reg_n_0_[0][3] ),
        .I1(Q[4]),
        .O(m_reg0__28_carry__0_i_8__0_n_0));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    m_reg0__28_carry_i_1__0
       (.I0(Q[3]),
        .I1(\a_reg_reg_n_0_[0][3] ),
        .I2(\a_reg_reg_n_0_[0][1] ),
        .I3(Q[5]),
        .I4(\a_reg_reg_n_0_[0][2] ),
        .I5(Q[4]),
        .O(m_reg0__28_carry_i_1__0_n_0));
  LUT4 #(
    .INIT(16'h7888)) 
    m_reg0__28_carry_i_2
       (.I0(Q[4]),
        .I1(m_reg0__0_carry__1_i_3[1]),
        .I2(Q[5]),
        .I3(m_reg0__0_carry__1_i_3[0]),
        .O(\b_reg_reg[0][4]_0 ));
  LUT4 #(
    .INIT(16'h7888)) 
    m_reg0__28_carry_i_2__0
       (.I0(Q[4]),
        .I1(\a_reg_reg_n_0_[0][1] ),
        .I2(Q[5]),
        .I3(\m_reg_reg[2]_0 ),
        .O(m_reg0__28_carry_i_2__0_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    m_reg0__28_carry_i_3__0
       (.I0(\a_reg_reg_n_0_[0][1] ),
        .I1(Q[3]),
        .O(m_reg0__28_carry_i_3__0_n_0));
  LUT6 #(
    .INIT(64'h6A6A6A95C03FC03F)) 
    m_reg0__28_carry_i_4__0
       (.I0(\a_reg_reg_n_0_[0][2] ),
        .I1(\a_reg_reg_n_0_[0][3] ),
        .I2(Q[3]),
        .I3(m_reg0__28_carry_i_8__0_n_0),
        .I4(\m_reg_reg[2]_0 ),
        .I5(Q[4]),
        .O(m_reg0__28_carry_i_4__0_n_0));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    m_reg0__28_carry_i_5__0
       (.I0(\m_reg_reg[2]_0 ),
        .I1(Q[5]),
        .I2(\a_reg_reg_n_0_[0][1] ),
        .I3(Q[4]),
        .I4(Q[3]),
        .I5(\a_reg_reg_n_0_[0][2] ),
        .O(m_reg0__28_carry_i_5__0_n_0));
  LUT4 #(
    .INIT(16'h7888)) 
    m_reg0__28_carry_i_6
       (.I0(Q[3]),
        .I1(m_reg0__0_carry__1_i_3[1]),
        .I2(Q[4]),
        .I3(m_reg0__0_carry__1_i_3[0]),
        .O(\b_reg_reg[0][3]_0 ));
  LUT4 #(
    .INIT(16'h7888)) 
    m_reg0__28_carry_i_6__0
       (.I0(Q[3]),
        .I1(\a_reg_reg_n_0_[0][1] ),
        .I2(Q[4]),
        .I3(\m_reg_reg[2]_0 ),
        .O(m_reg0__28_carry_i_6__0_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    m_reg0__28_carry_i_8
       (.I0(Q[5]),
        .I1(m_reg0__0_carry__1_i_3[1]),
        .O(\b_reg_reg[0][5]_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    m_reg0__28_carry_i_8__0
       (.I0(\a_reg_reg_n_0_[0][1] ),
        .I1(Q[5]),
        .O(m_reg0__28_carry_i_8__0_n_0));
  (* OPT_MODIFIED = "PROPCONST SWEEP" *) 
  CARRY4 m_reg0__47_carry
       (.CI(1'b0),
        .CO(NLW_m_reg0__47_carry_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,m_reg0__47_carry_i_1__0_n_0,m_reg0__47_carry_i_2__0_n_0,1'b0}),
        .O({m_reg0__47_carry_n_4,m_reg0__47_carry_n_5,m_reg0__47_carry_n_6,m_reg0__47_carry_n_7}),
        .S({m_reg0__47_carry_i_3__0_n_0,m_reg0__47_carry_i_4__0_n_0,m_reg0__47_carry_i_5__0_n_0,m_reg0__56_carry_i_6__0_0}));
  LUT4 #(
    .INIT(16'h7888)) 
    m_reg0__47_carry_i_1
       (.I0(Q[7]),
        .I1(m_reg0__0_carry__1_i_3[1]),
        .I2(Q[8]),
        .I3(m_reg0__0_carry__1_i_3[0]),
        .O(\b_reg_reg[0][7]_0 ));
  LUT4 #(
    .INIT(16'h7888)) 
    m_reg0__47_carry_i_1__0
       (.I0(Q[7]),
        .I1(\a_reg_reg_n_0_[0][1] ),
        .I2(Q[8]),
        .I3(\m_reg_reg[2]_0 ),
        .O(m_reg0__47_carry_i_1__0_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    m_reg0__47_carry_i_2__0
       (.I0(\a_reg_reg_n_0_[0][1] ),
        .I1(Q[6]),
        .O(m_reg0__47_carry_i_2__0_n_0));
  LUT6 #(
    .INIT(64'h3F48C0B7C0B7C0B7)) 
    m_reg0__47_carry_i_3__0
       (.I0(\m_reg_reg[2]_0 ),
        .I1(Q[7]),
        .I2(\a_reg_reg_n_0_[0][2] ),
        .I3(m_reg0__47_carry_i_7__0_n_0),
        .I4(\a_reg_reg_n_0_[0][3] ),
        .I5(Q[6]),
        .O(m_reg0__47_carry_i_3__0_n_0));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    m_reg0__47_carry_i_4__0
       (.I0(\m_reg_reg[2]_0 ),
        .I1(Q[8]),
        .I2(\a_reg_reg_n_0_[0][1] ),
        .I3(Q[7]),
        .I4(Q[6]),
        .I5(\a_reg_reg_n_0_[0][2] ),
        .O(m_reg0__47_carry_i_4__0_n_0));
  LUT4 #(
    .INIT(16'h7888)) 
    m_reg0__47_carry_i_5
       (.I0(Q[6]),
        .I1(m_reg0__0_carry__1_i_3[1]),
        .I2(m_reg0__0_carry__1_i_3[0]),
        .I3(Q[7]),
        .O(\b_reg_reg[0][6]_0 ));
  LUT4 #(
    .INIT(16'h7888)) 
    m_reg0__47_carry_i_5__0
       (.I0(Q[6]),
        .I1(\a_reg_reg_n_0_[0][1] ),
        .I2(Q[7]),
        .I3(\m_reg_reg[2]_0 ),
        .O(m_reg0__47_carry_i_5__0_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    m_reg0__47_carry_i_7
       (.I0(Q[8]),
        .I1(m_reg0__0_carry__1_i_3[1]),
        .O(\b_reg_reg[0][8]_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    m_reg0__47_carry_i_7__0
       (.I0(\a_reg_reg_n_0_[0][1] ),
        .I1(Q[8]),
        .O(m_reg0__47_carry_i_7__0_n_0));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 m_reg0__56_carry
       (.CI(1'b0),
        .CO({m_reg0__56_carry_n_0,NLW_m_reg0__56_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({m_reg0__56_carry_i_1__0_n_0,m_reg0__56_carry_i_2__0_n_0,m_reg0__56_carry_i_3__0_n_0,m_reg0__56_carry_i_4__0_n_0}),
        .O({m_reg0__56_carry_n_4,m_reg0__56_carry_n_5,m_reg0__56_carry_n_6,m_reg0__56_carry_n_7}),
        .S({m_reg0__56_carry_i_5__0_n_0,m_reg0__56_carry_i_6__0_n_0,m_reg0__56_carry_i_7__0_n_0,m_reg0__56_carry_i_8__0_n_0}));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 m_reg0__56_carry__0
       (.CI(m_reg0__56_carry_n_0),
        .CO(NLW_m_reg0__56_carry__0_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,m_reg0__56_carry__0_i_1__0_n_0}),
        .O({NLW_m_reg0__56_carry__0_O_UNCONNECTED[3:2],m_reg0__56_carry__0_n_6,m_reg0__56_carry__0_n_7}),
        .S({1'b0,1'b0,m_reg0__56_carry__0_i_2__0_n_0,m_reg0__56_carry__0_i_3__0_n_0}));
  LUT3 #(
    .INIT(8'hE8)) 
    m_reg0__56_carry__0_i_1__0
       (.I0(m_reg0__28_carry__0_n_7),
        .I1(m_reg0__0_carry__0_n_4),
        .I2(m_reg0__47_carry_n_6),
        .O(m_reg0__56_carry__0_i_1__0_n_0));
  LUT4 #(
    .INIT(16'h17E8)) 
    m_reg0__56_carry__0_i_2__0
       (.I0(m_reg0__28_carry__0_n_6),
        .I1(m_reg0__47_carry_n_5),
        .I2(m_reg0__0_carry__1_n_7),
        .I3(m_reg0__56_carry__0_i_4__0_n_0),
        .O(m_reg0__56_carry__0_i_2__0_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    m_reg0__56_carry__0_i_3__0
       (.I0(m_reg0__47_carry_n_6),
        .I1(m_reg0__0_carry__0_n_4),
        .I2(m_reg0__28_carry__0_n_7),
        .I3(m_reg0__28_carry__0_n_6),
        .I4(m_reg0__47_carry_n_5),
        .I5(m_reg0__0_carry__1_n_7),
        .O(m_reg0__56_carry__0_i_3__0_n_0));
  LUT5 #(
    .INIT(32'h87787887)) 
    m_reg0__56_carry__0_i_4__0
       (.I0(Q[9]),
        .I1(\m_reg_reg[2]_0 ),
        .I2(m_reg0__0_carry__1_n_6),
        .I3(m_reg0__47_carry_n_4),
        .I4(m_reg0__28_carry__0_n_5),
        .O(m_reg0__56_carry__0_i_4__0_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    m_reg0__56_carry_i_1__0
       (.I0(m_reg0__28_carry_n_4),
        .I1(m_reg0__0_carry__0_n_5),
        .I2(m_reg0__47_carry_n_7),
        .O(m_reg0__56_carry_i_1__0_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    m_reg0__56_carry_i_2__0
       (.I0(m_reg0__0_carry__0_n_6),
        .I1(m_reg0__28_carry_n_5),
        .O(m_reg0__56_carry_i_2__0_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    m_reg0__56_carry_i_3__0
       (.I0(m_reg0__0_carry__0_n_7),
        .I1(m_reg0__28_carry_n_6),
        .O(m_reg0__56_carry_i_3__0_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    m_reg0__56_carry_i_4__0
       (.I0(m_reg0__0_carry_n_4),
        .I1(m_reg0__28_carry_n_7),
        .O(m_reg0__56_carry_i_4__0_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    m_reg0__56_carry_i_5__0
       (.I0(m_reg0__47_carry_n_7),
        .I1(m_reg0__0_carry__0_n_5),
        .I2(m_reg0__28_carry_n_4),
        .I3(m_reg0__28_carry__0_n_7),
        .I4(m_reg0__47_carry_n_6),
        .I5(m_reg0__0_carry__0_n_4),
        .O(m_reg0__56_carry_i_5__0_n_0));
  LUT5 #(
    .INIT(32'h78878778)) 
    m_reg0__56_carry_i_6__0
       (.I0(m_reg0__28_carry_n_5),
        .I1(m_reg0__0_carry__0_n_6),
        .I2(m_reg0__28_carry_n_4),
        .I3(m_reg0__47_carry_n_7),
        .I4(m_reg0__0_carry__0_n_5),
        .O(m_reg0__56_carry_i_6__0_n_0));
  LUT4 #(
    .INIT(16'h8778)) 
    m_reg0__56_carry_i_7__0
       (.I0(m_reg0__28_carry_n_6),
        .I1(m_reg0__0_carry__0_n_7),
        .I2(m_reg0__0_carry__0_n_6),
        .I3(m_reg0__28_carry_n_5),
        .O(m_reg0__56_carry_i_7__0_n_0));
  LUT4 #(
    .INIT(16'h8778)) 
    m_reg0__56_carry_i_8__0
       (.I0(m_reg0__28_carry_n_7),
        .I1(m_reg0__0_carry_n_4),
        .I2(m_reg0__0_carry__0_n_7),
        .I3(m_reg0__28_carry_n_6),
        .O(m_reg0__56_carry_i_8__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    \m_reg[3]_i_1__1 
       (.I0(m_reg0__28_carry_n_7),
        .I1(m_reg0__0_carry_n_4),
        .O(\m_reg[3]_i_1__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_reg_reg[0] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(m_reg0__0_carry_n_7),
        .Q(\m_reg_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_reg_reg[1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(m_reg0__0_carry_n_6),
        .Q(\m_reg_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_reg_reg[2] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(m_reg0__0_carry_n_5),
        .Q(\m_reg_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_reg_reg[3] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\m_reg[3]_i_1__1_n_0 ),
        .Q(\m_reg_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_reg_reg[4] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(m_reg0__56_carry_n_7),
        .Q(\m_reg_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_reg_reg[5] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(m_reg0__56_carry_n_6),
        .Q(\m_reg_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_reg_reg[6] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(m_reg0__56_carry_n_5),
        .Q(\m_reg_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_reg_reg[7] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(m_reg0__56_carry_n_4),
        .Q(\m_reg_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_reg_reg[8] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(m_reg0__56_carry__0_n_7),
        .Q(\m_reg_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_reg_reg[9] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(m_reg0__56_carry__0_n_6),
        .Q(\m_reg_reg_n_0_[9] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \p_reg_reg[0] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\m_reg_reg_n_0_[0] ),
        .Q(\p_reg_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \p_reg_reg[1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\m_reg_reg_n_0_[1] ),
        .Q(\p_reg_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \p_reg_reg[2] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\m_reg_reg_n_0_[2] ),
        .Q(\p_reg_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \p_reg_reg[3] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\m_reg_reg_n_0_[3] ),
        .Q(\p_reg_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \p_reg_reg[4] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\m_reg_reg_n_0_[4] ),
        .Q(\p_reg_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \p_reg_reg[5] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\m_reg_reg_n_0_[5] ),
        .Q(\p_reg_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \p_reg_reg[6] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\m_reg_reg_n_0_[6] ),
        .Q(\p_reg_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \p_reg_reg[7] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\m_reg_reg_n_0_[7] ),
        .Q(\p_reg_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \p_reg_reg[8] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\m_reg_reg_n_0_[8] ),
        .Q(\p_reg_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \p_reg_reg[9] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\m_reg_reg_n_0_[9] ),
        .Q(\p_reg_reg_n_0_[9] ),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hFB08)) 
    \rom_real_addr_reg_reg[0]_i_1 
       (.I0(\p_reg_reg_n_0_[0] ),
        .I1(dout_reg),
        .I2(p_0_in13_in),
        .I3(dout_reg_0[0]),
        .O(\p_reg_reg[9]_0 [0]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \rom_real_addr_reg_reg[1]_i_1 
       (.I0(\p_reg_reg_n_0_[1] ),
        .I1(dout_reg),
        .I2(p_0_in13_in),
        .I3(dout_reg_0[1]),
        .O(\p_reg_reg[9]_0 [1]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \rom_real_addr_reg_reg[2]_i_1 
       (.I0(\p_reg_reg_n_0_[2] ),
        .I1(dout_reg),
        .I2(p_0_in13_in),
        .I3(dout_reg_0[2]),
        .O(\p_reg_reg[9]_0 [2]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \rom_real_addr_reg_reg[3]_i_1 
       (.I0(\p_reg_reg_n_0_[3] ),
        .I1(dout_reg),
        .I2(p_0_in13_in),
        .I3(dout_reg_0[3]),
        .O(\p_reg_reg[9]_0 [3]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \rom_real_addr_reg_reg[4]_i_1 
       (.I0(\p_reg_reg_n_0_[4] ),
        .I1(dout_reg),
        .I2(p_0_in13_in),
        .I3(dout_reg_0[4]),
        .O(\p_reg_reg[9]_0 [4]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \rom_real_addr_reg_reg[5]_i_1 
       (.I0(\p_reg_reg_n_0_[5] ),
        .I1(dout_reg),
        .I2(p_0_in13_in),
        .I3(dout_reg_0[5]),
        .O(\p_reg_reg[9]_0 [5]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \rom_real_addr_reg_reg[6]_i_1 
       (.I0(\p_reg_reg_n_0_[6] ),
        .I1(dout_reg),
        .I2(p_0_in13_in),
        .I3(dout_reg_0[6]),
        .O(\p_reg_reg[9]_0 [6]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \rom_real_addr_reg_reg[7]_i_1 
       (.I0(\p_reg_reg_n_0_[7] ),
        .I1(dout_reg),
        .I2(p_0_in13_in),
        .I3(dout_reg_0[7]),
        .O(\p_reg_reg[9]_0 [7]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \rom_real_addr_reg_reg[8]_i_1 
       (.I0(\p_reg_reg_n_0_[8] ),
        .I1(dout_reg),
        .I2(p_0_in13_in),
        .I3(dout_reg_0[8]),
        .O(\p_reg_reg[9]_0 [8]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \rom_real_addr_reg_reg[9]_i_1 
       (.I0(\p_reg_reg_n_0_[9] ),
        .I1(dout_reg),
        .I2(p_0_in13_in),
        .I3(dout_reg_0[9]),
        .O(\p_reg_reg[9]_0 [9]));
endmodule

(* ORIG_REF_NAME = "dsp_25x18" *) 
module dsp_25x18__parameterized1_3
   (Q,
    \a_reg_reg[0][4]_0 ,
    S,
    \p_reg_reg[9]_0 ,
    \m_reg_reg[2]_0 ,
    \m_reg_reg[2]_1 ,
    \m_reg_reg[3]_0 ,
    \m_reg_reg[3]_1 ,
    DI,
    m_reg0__56_carry_i_5_0,
    m_reg0__56_carry_i_6_0,
    m_reg0__56_carry_i_6_1,
    m_reg0__56_carry__0_i_2_0,
    half,
    \a_reg_reg[0][9]_0 ,
    m_reg0__0_carry__0_0,
    m_reg0__0_carry__0_1,
    m_reg0__0_carry__0_2,
    m_reg0__0_carry__0_3,
    m_reg0__0_carry__1_0,
    m_reg0__28_carry_0,
    m_reg0__47_carry_0,
    D,
    clk100M_IBUF_BUFG);
  output [8:0]Q;
  output \a_reg_reg[0][4]_0 ;
  output [1:0]S;
  output [9:0]\p_reg_reg[9]_0 ;
  input [1:0]\m_reg_reg[2]_0 ;
  input [1:0]\m_reg_reg[2]_1 ;
  input [0:0]\m_reg_reg[3]_0 ;
  input [0:0]\m_reg_reg[3]_1 ;
  input [0:0]DI;
  input [0:0]m_reg0__56_carry_i_5_0;
  input [0:0]m_reg0__56_carry_i_6_0;
  input [0:0]m_reg0__56_carry_i_6_1;
  input [9:0]m_reg0__56_carry__0_i_2_0;
  input [1:0]half;
  input [1:0]\a_reg_reg[0][9]_0 ;
  input m_reg0__0_carry__0_0;
  input m_reg0__0_carry__0_1;
  input m_reg0__0_carry__0_2;
  input m_reg0__0_carry__0_3;
  input m_reg0__0_carry__1_0;
  input m_reg0__28_carry_0;
  input m_reg0__47_carry_0;
  input [9:0]D;
  input clk100M_IBUF_BUFG;

  wire [9:0]D;
  wire [0:0]DI;
  wire [8:0]Q;
  wire [1:0]S;
  wire \a_reg_reg[0][4]_0 ;
  wire [1:0]\a_reg_reg[0][9]_0 ;
  wire \a_reg_reg_n_0_[0][9] ;
  wire clk100M_IBUF_BUFG;
  wire [1:0]half;
  wire m_reg0__0_carry__0_0;
  wire m_reg0__0_carry__0_1;
  wire m_reg0__0_carry__0_2;
  wire m_reg0__0_carry__0_3;
  wire m_reg0__0_carry__0_i_1__0_n_0;
  wire m_reg0__0_carry__0_i_2__0_n_0;
  wire m_reg0__0_carry__0_i_3__0_n_0;
  wire m_reg0__0_carry__0_i_4__0_n_0;
  wire m_reg0__0_carry__0_i_5_n_0;
  wire m_reg0__0_carry__0_i_6_n_0;
  wire m_reg0__0_carry__0_i_7_n_0;
  wire m_reg0__0_carry__0_i_8_n_0;
  wire m_reg0__0_carry__0_n_0;
  wire m_reg0__0_carry__0_n_4;
  wire m_reg0__0_carry__0_n_5;
  wire m_reg0__0_carry__0_n_6;
  wire m_reg0__0_carry__0_n_7;
  wire m_reg0__0_carry__1_0;
  wire m_reg0__0_carry__1_i_1__0_n_0;
  wire m_reg0__0_carry__1_i_2_n_0;
  wire m_reg0__0_carry__1_i_3_n_0;
  wire m_reg0__0_carry__1_i_4__0_n_0;
  wire m_reg0__0_carry__1_n_6;
  wire m_reg0__0_carry__1_n_7;
  wire m_reg0__0_carry_i_3_n_0;
  wire m_reg0__0_carry_i_5_n_0;
  wire m_reg0__0_carry_i_7_n_0;
  wire m_reg0__0_carry_n_0;
  wire m_reg0__0_carry_n_4;
  wire m_reg0__0_carry_n_5;
  wire m_reg0__0_carry_n_6;
  wire m_reg0__0_carry_n_7;
  wire m_reg0__28_carry_0;
  wire m_reg0__28_carry__0_i_2_n_0;
  wire m_reg0__28_carry__0_i_3_n_0;
  wire m_reg0__28_carry__0_i_5_n_0;
  wire m_reg0__28_carry__0_i_6_n_0;
  wire m_reg0__28_carry__0_i_8_n_0;
  wire m_reg0__28_carry__0_n_5;
  wire m_reg0__28_carry__0_n_6;
  wire m_reg0__28_carry__0_n_7;
  wire m_reg0__28_carry_i_1_n_0;
  wire m_reg0__28_carry_i_3_n_0;
  wire m_reg0__28_carry_i_4_n_0;
  wire m_reg0__28_carry_i_5_n_0;
  wire m_reg0__28_carry_i_7_n_0;
  wire m_reg0__28_carry_n_0;
  wire m_reg0__28_carry_n_4;
  wire m_reg0__28_carry_n_5;
  wire m_reg0__28_carry_n_6;
  wire m_reg0__28_carry_n_7;
  wire m_reg0__47_carry_0;
  wire m_reg0__47_carry_i_2_n_0;
  wire m_reg0__47_carry_i_3_n_0;
  wire m_reg0__47_carry_i_4_n_0;
  wire m_reg0__47_carry_i_6_n_0;
  wire m_reg0__47_carry_n_4;
  wire m_reg0__47_carry_n_5;
  wire m_reg0__47_carry_n_6;
  wire m_reg0__47_carry_n_7;
  wire m_reg0__56_carry__0_i_1_n_0;
  wire [9:0]m_reg0__56_carry__0_i_2_0;
  wire m_reg0__56_carry__0_i_2_n_0;
  wire m_reg0__56_carry__0_i_3_n_0;
  wire m_reg0__56_carry__0_i_4_n_0;
  wire m_reg0__56_carry__0_n_6;
  wire m_reg0__56_carry__0_n_7;
  wire m_reg0__56_carry_i_1_n_0;
  wire m_reg0__56_carry_i_2_n_0;
  wire m_reg0__56_carry_i_3_n_0;
  wire m_reg0__56_carry_i_4_n_0;
  wire [0:0]m_reg0__56_carry_i_5_0;
  wire m_reg0__56_carry_i_5_n_0;
  wire [0:0]m_reg0__56_carry_i_6_0;
  wire [0:0]m_reg0__56_carry_i_6_1;
  wire m_reg0__56_carry_i_6_n_0;
  wire m_reg0__56_carry_i_7_n_0;
  wire m_reg0__56_carry_i_8_n_0;
  wire m_reg0__56_carry_n_0;
  wire m_reg0__56_carry_n_4;
  wire m_reg0__56_carry_n_5;
  wire m_reg0__56_carry_n_6;
  wire m_reg0__56_carry_n_7;
  wire \m_reg[3]_i_1__0_n_0 ;
  wire [1:0]\m_reg_reg[2]_0 ;
  wire [1:0]\m_reg_reg[2]_1 ;
  wire [0:0]\m_reg_reg[3]_0 ;
  wire [0:0]\m_reg_reg[3]_1 ;
  wire \m_reg_reg_n_0_[0] ;
  wire \m_reg_reg_n_0_[1] ;
  wire \m_reg_reg_n_0_[2] ;
  wire \m_reg_reg_n_0_[3] ;
  wire \m_reg_reg_n_0_[4] ;
  wire \m_reg_reg_n_0_[5] ;
  wire \m_reg_reg_n_0_[6] ;
  wire \m_reg_reg_n_0_[7] ;
  wire \m_reg_reg_n_0_[8] ;
  wire \m_reg_reg_n_0_[9] ;
  wire [9:0]\p_reg_reg[9]_0 ;
  wire [2:0]NLW_m_reg0__0_carry_CO_UNCONNECTED;
  wire [2:0]NLW_m_reg0__0_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_m_reg0__0_carry__1_CO_UNCONNECTED;
  wire [3:2]NLW_m_reg0__0_carry__1_O_UNCONNECTED;
  wire [2:0]NLW_m_reg0__28_carry_CO_UNCONNECTED;
  wire [3:0]NLW_m_reg0__28_carry__0_CO_UNCONNECTED;
  wire [3:3]NLW_m_reg0__28_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_m_reg0__47_carry_CO_UNCONNECTED;
  wire [2:0]NLW_m_reg0__56_carry_CO_UNCONNECTED;
  wire [3:0]NLW_m_reg0__56_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_m_reg0__56_carry__0_O_UNCONNECTED;

  LUT2 #(
    .INIT(4'h6)) 
    a0_carry__1_i_1
       (.I0(half[1]),
        .I1(\a_reg_reg[0][9]_0 [1]),
        .O(S[1]));
  LUT2 #(
    .INIT(4'h6)) 
    a0_carry__1_i_2
       (.I0(\a_reg_reg[0][9]_0 [0]),
        .I1(half[0]),
        .O(S[0]));
  FDRE #(
    .INIT(1'b0)) 
    \a_reg_reg[0][0] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(D[0]),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \a_reg_reg[0][1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(D[1]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \a_reg_reg[0][2] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(D[2]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \a_reg_reg[0][3] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(D[3]),
        .Q(Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \a_reg_reg[0][4] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(D[4]),
        .Q(Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \a_reg_reg[0][5] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(D[5]),
        .Q(Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \a_reg_reg[0][6] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(D[6]),
        .Q(Q[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \a_reg_reg[0][7] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(D[7]),
        .Q(Q[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \a_reg_reg[0][8] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(D[8]),
        .Q(Q[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \a_reg_reg[0][9] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(D[9]),
        .Q(\a_reg_reg_n_0_[0][9] ),
        .R(1'b0));
  (* OPT_MODIFIED = "PROPCONST SWEEP" *) 
  CARRY4 m_reg0__0_carry
       (.CI(1'b0),
        .CO({m_reg0__0_carry_n_0,NLW_m_reg0__0_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({\m_reg_reg[2]_0 ,m_reg0__0_carry_i_3_n_0,1'b0}),
        .O({m_reg0__0_carry_n_4,m_reg0__0_carry_n_5,m_reg0__0_carry_n_6,m_reg0__0_carry_n_7}),
        .S({\m_reg_reg[2]_1 [1],m_reg0__0_carry_i_5_n_0,\m_reg_reg[2]_1 [0],m_reg0__0_carry_i_7_n_0}));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 m_reg0__0_carry__0
       (.CI(m_reg0__0_carry_n_0),
        .CO({m_reg0__0_carry__0_n_0,NLW_m_reg0__0_carry__0_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({m_reg0__0_carry__0_i_1__0_n_0,m_reg0__0_carry__0_i_2__0_n_0,m_reg0__0_carry__0_i_3__0_n_0,m_reg0__0_carry__0_i_4__0_n_0}),
        .O({m_reg0__0_carry__0_n_4,m_reg0__0_carry__0_n_5,m_reg0__0_carry__0_n_6,m_reg0__0_carry__0_n_7}),
        .S({m_reg0__0_carry__0_i_5_n_0,m_reg0__0_carry__0_i_6_n_0,m_reg0__0_carry__0_i_7_n_0,m_reg0__0_carry__0_i_8_n_0}));
  LUT6 #(
    .INIT(64'hF880808088000000)) 
    m_reg0__0_carry__0_i_1__0
       (.I0(Q[5]),
        .I1(m_reg0__56_carry__0_i_2_0[1]),
        .I2(m_reg0__56_carry__0_i_2_0[0]),
        .I3(m_reg0__56_carry__0_i_2_0[2]),
        .I4(Q[4]),
        .I5(Q[6]),
        .O(m_reg0__0_carry__0_i_1__0_n_0));
  LUT6 #(
    .INIT(64'hF880808088000000)) 
    m_reg0__0_carry__0_i_2__0
       (.I0(Q[4]),
        .I1(m_reg0__56_carry__0_i_2_0[1]),
        .I2(m_reg0__56_carry__0_i_2_0[0]),
        .I3(m_reg0__56_carry__0_i_2_0[2]),
        .I4(Q[3]),
        .I5(Q[5]),
        .O(m_reg0__0_carry__0_i_2__0_n_0));
  LUT6 #(
    .INIT(64'hF880808088000000)) 
    m_reg0__0_carry__0_i_3__0
       (.I0(Q[3]),
        .I1(m_reg0__56_carry__0_i_2_0[1]),
        .I2(m_reg0__56_carry__0_i_2_0[0]),
        .I3(m_reg0__56_carry__0_i_2_0[2]),
        .I4(Q[2]),
        .I5(Q[4]),
        .O(m_reg0__0_carry__0_i_3__0_n_0));
  LUT6 #(
    .INIT(64'hF880808088000000)) 
    m_reg0__0_carry__0_i_4__0
       (.I0(Q[2]),
        .I1(m_reg0__56_carry__0_i_2_0[1]),
        .I2(m_reg0__56_carry__0_i_2_0[0]),
        .I3(m_reg0__56_carry__0_i_2_0[2]),
        .I4(Q[1]),
        .I5(Q[3]),
        .O(m_reg0__0_carry__0_i_4__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    m_reg0__0_carry__0_i_5
       (.I0(m_reg0__0_carry__0_i_1__0_n_0),
        .I1(m_reg0__0_carry__0_3),
        .O(m_reg0__0_carry__0_i_5_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    m_reg0__0_carry__0_i_6
       (.I0(m_reg0__0_carry__0_i_2__0_n_0),
        .I1(m_reg0__0_carry__0_2),
        .O(m_reg0__0_carry__0_i_6_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    m_reg0__0_carry__0_i_7
       (.I0(m_reg0__0_carry__0_i_3__0_n_0),
        .I1(m_reg0__0_carry__0_1),
        .O(m_reg0__0_carry__0_i_7_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    m_reg0__0_carry__0_i_8
       (.I0(m_reg0__0_carry__0_i_4__0_n_0),
        .I1(m_reg0__0_carry__0_0),
        .O(m_reg0__0_carry__0_i_8_n_0));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 m_reg0__0_carry__1
       (.CI(m_reg0__0_carry__0_n_0),
        .CO(NLW_m_reg0__0_carry__1_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,m_reg0__0_carry__1_i_1__0_n_0}),
        .O({NLW_m_reg0__0_carry__1_O_UNCONNECTED[3:2],m_reg0__0_carry__1_n_6,m_reg0__0_carry__1_n_7}),
        .S({1'b0,1'b0,m_reg0__0_carry__1_i_2_n_0,m_reg0__0_carry__1_i_3_n_0}));
  LUT6 #(
    .INIT(64'hF880808088000000)) 
    m_reg0__0_carry__1_i_1__0
       (.I0(Q[6]),
        .I1(m_reg0__56_carry__0_i_2_0[1]),
        .I2(m_reg0__56_carry__0_i_2_0[0]),
        .I3(m_reg0__56_carry__0_i_2_0[2]),
        .I4(Q[5]),
        .I5(Q[7]),
        .O(m_reg0__0_carry__1_i_1__0_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    m_reg0__0_carry__1_i_2
       (.I0(m_reg0__56_carry__0_i_2_0[0]),
        .I1(\a_reg_reg_n_0_[0][9] ),
        .I2(m_reg0__0_carry__1_i_4__0_n_0),
        .O(m_reg0__0_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    m_reg0__0_carry__1_i_3
       (.I0(m_reg0__0_carry__1_i_1__0_n_0),
        .I1(m_reg0__0_carry__1_0),
        .O(m_reg0__0_carry__1_i_3_n_0));
  LUT6 #(
    .INIT(64'h1A8FCF0F807FFFFF)) 
    m_reg0__0_carry__1_i_4__0
       (.I0(Q[6]),
        .I1(m_reg0__56_carry__0_i_2_0[0]),
        .I2(Q[8]),
        .I3(Q[7]),
        .I4(m_reg0__56_carry__0_i_2_0[2]),
        .I5(m_reg0__56_carry__0_i_2_0[1]),
        .O(m_reg0__0_carry__1_i_4__0_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    m_reg0__0_carry_i_3
       (.I0(Q[1]),
        .I1(m_reg0__56_carry__0_i_2_0[0]),
        .O(m_reg0__0_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    m_reg0__0_carry_i_5
       (.I0(Q[0]),
        .I1(m_reg0__56_carry__0_i_2_0[2]),
        .I2(Q[1]),
        .I3(m_reg0__56_carry__0_i_2_0[1]),
        .I4(m_reg0__56_carry__0_i_2_0[0]),
        .I5(Q[2]),
        .O(m_reg0__0_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    m_reg0__0_carry_i_7
       (.I0(Q[0]),
        .I1(m_reg0__56_carry__0_i_2_0[0]),
        .O(m_reg0__0_carry_i_7_n_0));
  (* OPT_MODIFIED = "PROPCONST SWEEP" *) 
  CARRY4 m_reg0__28_carry
       (.CI(1'b0),
        .CO({m_reg0__28_carry_n_0,NLW_m_reg0__28_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({m_reg0__28_carry_i_1_n_0,\m_reg_reg[3]_0 ,m_reg0__28_carry_i_3_n_0,1'b0}),
        .O({m_reg0__28_carry_n_4,m_reg0__28_carry_n_5,m_reg0__28_carry_n_6,m_reg0__28_carry_n_7}),
        .S({m_reg0__28_carry_i_4_n_0,m_reg0__28_carry_i_5_n_0,\m_reg_reg[3]_1 ,m_reg0__28_carry_i_7_n_0}));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 m_reg0__28_carry__0
       (.CI(m_reg0__28_carry_n_0),
        .CO(NLW_m_reg0__28_carry__0_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,DI,m_reg0__28_carry__0_i_2_n_0}),
        .O({NLW_m_reg0__28_carry__0_O_UNCONNECTED[3],m_reg0__28_carry__0_n_5,m_reg0__28_carry__0_n_6,m_reg0__28_carry__0_n_7}),
        .S({1'b0,m_reg0__28_carry__0_i_3_n_0,m_reg0__56_carry_i_5_0,m_reg0__28_carry__0_i_5_n_0}));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    m_reg0__28_carry__0_i_2
       (.I0(Q[2]),
        .I1(m_reg0__56_carry__0_i_2_0[4]),
        .I2(m_reg0__56_carry__0_i_2_0[5]),
        .I3(Q[1]),
        .I4(m_reg0__56_carry__0_i_2_0[3]),
        .I5(Q[3]),
        .O(m_reg0__28_carry__0_i_2_n_0));
  LUT3 #(
    .INIT(8'h87)) 
    m_reg0__28_carry__0_i_3
       (.I0(Q[6]),
        .I1(m_reg0__56_carry__0_i_2_0[3]),
        .I2(m_reg0__28_carry__0_i_6_n_0),
        .O(m_reg0__28_carry__0_i_3_n_0));
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    m_reg0__28_carry__0_i_5
       (.I0(m_reg0__28_carry__0_i_2_n_0),
        .I1(m_reg0__56_carry__0_i_2_0[5]),
        .I2(Q[2]),
        .I3(m_reg0__28_carry__0_i_8_n_0),
        .I4(m_reg0__56_carry__0_i_2_0[3]),
        .I5(Q[4]),
        .O(m_reg0__28_carry__0_i_5_n_0));
  LUT6 #(
    .INIT(64'h18C0AFFF87FF0FFF)) 
    m_reg0__28_carry__0_i_6
       (.I0(Q[3]),
        .I1(m_reg0__56_carry__0_i_2_0[3]),
        .I2(Q[4]),
        .I3(m_reg0__56_carry__0_i_2_0[5]),
        .I4(Q[5]),
        .I5(m_reg0__56_carry__0_i_2_0[4]),
        .O(m_reg0__28_carry__0_i_6_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    m_reg0__28_carry__0_i_7
       (.I0(Q[4]),
        .I1(m_reg0__56_carry__0_i_2_0[4]),
        .O(\a_reg_reg[0][4]_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    m_reg0__28_carry__0_i_8
       (.I0(Q[3]),
        .I1(m_reg0__56_carry__0_i_2_0[4]),
        .O(m_reg0__28_carry__0_i_8_n_0));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    m_reg0__28_carry_i_1
       (.I0(Q[3]),
        .I1(m_reg0__56_carry__0_i_2_0[3]),
        .I2(m_reg0__56_carry__0_i_2_0[5]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(m_reg0__56_carry__0_i_2_0[4]),
        .O(m_reg0__28_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    m_reg0__28_carry_i_3
       (.I0(Q[1]),
        .I1(m_reg0__56_carry__0_i_2_0[3]),
        .O(m_reg0__28_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h6A6A6A95C03FC03F)) 
    m_reg0__28_carry_i_4
       (.I0(Q[2]),
        .I1(m_reg0__56_carry__0_i_2_0[3]),
        .I2(Q[3]),
        .I3(m_reg0__28_carry_0),
        .I4(Q[0]),
        .I5(m_reg0__56_carry__0_i_2_0[4]),
        .O(m_reg0__28_carry_i_4_n_0));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    m_reg0__28_carry_i_5
       (.I0(Q[0]),
        .I1(m_reg0__56_carry__0_i_2_0[5]),
        .I2(Q[1]),
        .I3(m_reg0__56_carry__0_i_2_0[4]),
        .I4(m_reg0__56_carry__0_i_2_0[3]),
        .I5(Q[2]),
        .O(m_reg0__28_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    m_reg0__28_carry_i_7
       (.I0(Q[0]),
        .I1(m_reg0__56_carry__0_i_2_0[3]),
        .O(m_reg0__28_carry_i_7_n_0));
  (* OPT_MODIFIED = "PROPCONST SWEEP" *) 
  CARRY4 m_reg0__47_carry
       (.CI(1'b0),
        .CO(NLW_m_reg0__47_carry_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,m_reg0__56_carry_i_6_0,m_reg0__47_carry_i_2_n_0,1'b0}),
        .O({m_reg0__47_carry_n_4,m_reg0__47_carry_n_5,m_reg0__47_carry_n_6,m_reg0__47_carry_n_7}),
        .S({m_reg0__47_carry_i_3_n_0,m_reg0__47_carry_i_4_n_0,m_reg0__56_carry_i_6_1,m_reg0__47_carry_i_6_n_0}));
  LUT2 #(
    .INIT(4'h8)) 
    m_reg0__47_carry_i_2
       (.I0(Q[1]),
        .I1(m_reg0__56_carry__0_i_2_0[6]),
        .O(m_reg0__47_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h3F48C0B7C0B7C0B7)) 
    m_reg0__47_carry_i_3
       (.I0(Q[0]),
        .I1(m_reg0__56_carry__0_i_2_0[7]),
        .I2(Q[2]),
        .I3(m_reg0__47_carry_0),
        .I4(m_reg0__56_carry__0_i_2_0[6]),
        .I5(Q[3]),
        .O(m_reg0__47_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    m_reg0__47_carry_i_4
       (.I0(Q[0]),
        .I1(m_reg0__56_carry__0_i_2_0[8]),
        .I2(Q[1]),
        .I3(m_reg0__56_carry__0_i_2_0[7]),
        .I4(m_reg0__56_carry__0_i_2_0[6]),
        .I5(Q[2]),
        .O(m_reg0__47_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    m_reg0__47_carry_i_6
       (.I0(Q[0]),
        .I1(m_reg0__56_carry__0_i_2_0[6]),
        .O(m_reg0__47_carry_i_6_n_0));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 m_reg0__56_carry
       (.CI(1'b0),
        .CO({m_reg0__56_carry_n_0,NLW_m_reg0__56_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({m_reg0__56_carry_i_1_n_0,m_reg0__56_carry_i_2_n_0,m_reg0__56_carry_i_3_n_0,m_reg0__56_carry_i_4_n_0}),
        .O({m_reg0__56_carry_n_4,m_reg0__56_carry_n_5,m_reg0__56_carry_n_6,m_reg0__56_carry_n_7}),
        .S({m_reg0__56_carry_i_5_n_0,m_reg0__56_carry_i_6_n_0,m_reg0__56_carry_i_7_n_0,m_reg0__56_carry_i_8_n_0}));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 m_reg0__56_carry__0
       (.CI(m_reg0__56_carry_n_0),
        .CO(NLW_m_reg0__56_carry__0_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,m_reg0__56_carry__0_i_1_n_0}),
        .O({NLW_m_reg0__56_carry__0_O_UNCONNECTED[3:2],m_reg0__56_carry__0_n_6,m_reg0__56_carry__0_n_7}),
        .S({1'b0,1'b0,m_reg0__56_carry__0_i_2_n_0,m_reg0__56_carry__0_i_3_n_0}));
  LUT3 #(
    .INIT(8'hE8)) 
    m_reg0__56_carry__0_i_1
       (.I0(m_reg0__28_carry__0_n_7),
        .I1(m_reg0__0_carry__0_n_4),
        .I2(m_reg0__47_carry_n_6),
        .O(m_reg0__56_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h17E8)) 
    m_reg0__56_carry__0_i_2
       (.I0(m_reg0__28_carry__0_n_6),
        .I1(m_reg0__47_carry_n_5),
        .I2(m_reg0__0_carry__1_n_7),
        .I3(m_reg0__56_carry__0_i_4_n_0),
        .O(m_reg0__56_carry__0_i_2_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    m_reg0__56_carry__0_i_3
       (.I0(m_reg0__47_carry_n_6),
        .I1(m_reg0__0_carry__0_n_4),
        .I2(m_reg0__28_carry__0_n_7),
        .I3(m_reg0__28_carry__0_n_6),
        .I4(m_reg0__47_carry_n_5),
        .I5(m_reg0__0_carry__1_n_7),
        .O(m_reg0__56_carry__0_i_3_n_0));
  LUT5 #(
    .INIT(32'h87787887)) 
    m_reg0__56_carry__0_i_4
       (.I0(Q[0]),
        .I1(m_reg0__56_carry__0_i_2_0[9]),
        .I2(m_reg0__0_carry__1_n_6),
        .I3(m_reg0__47_carry_n_4),
        .I4(m_reg0__28_carry__0_n_5),
        .O(m_reg0__56_carry__0_i_4_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    m_reg0__56_carry_i_1
       (.I0(m_reg0__28_carry_n_4),
        .I1(m_reg0__0_carry__0_n_5),
        .I2(m_reg0__47_carry_n_7),
        .O(m_reg0__56_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    m_reg0__56_carry_i_2
       (.I0(m_reg0__0_carry__0_n_6),
        .I1(m_reg0__28_carry_n_5),
        .O(m_reg0__56_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    m_reg0__56_carry_i_3
       (.I0(m_reg0__0_carry__0_n_7),
        .I1(m_reg0__28_carry_n_6),
        .O(m_reg0__56_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    m_reg0__56_carry_i_4
       (.I0(m_reg0__0_carry_n_4),
        .I1(m_reg0__28_carry_n_7),
        .O(m_reg0__56_carry_i_4_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    m_reg0__56_carry_i_5
       (.I0(m_reg0__47_carry_n_7),
        .I1(m_reg0__0_carry__0_n_5),
        .I2(m_reg0__28_carry_n_4),
        .I3(m_reg0__28_carry__0_n_7),
        .I4(m_reg0__47_carry_n_6),
        .I5(m_reg0__0_carry__0_n_4),
        .O(m_reg0__56_carry_i_5_n_0));
  LUT5 #(
    .INIT(32'h78878778)) 
    m_reg0__56_carry_i_6
       (.I0(m_reg0__28_carry_n_5),
        .I1(m_reg0__0_carry__0_n_6),
        .I2(m_reg0__28_carry_n_4),
        .I3(m_reg0__47_carry_n_7),
        .I4(m_reg0__0_carry__0_n_5),
        .O(m_reg0__56_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h8778)) 
    m_reg0__56_carry_i_7
       (.I0(m_reg0__28_carry_n_6),
        .I1(m_reg0__0_carry__0_n_7),
        .I2(m_reg0__0_carry__0_n_6),
        .I3(m_reg0__28_carry_n_5),
        .O(m_reg0__56_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h8778)) 
    m_reg0__56_carry_i_8
       (.I0(m_reg0__28_carry_n_7),
        .I1(m_reg0__0_carry_n_4),
        .I2(m_reg0__0_carry__0_n_7),
        .I3(m_reg0__28_carry_n_6),
        .O(m_reg0__56_carry_i_8_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    \m_reg[3]_i_1__0 
       (.I0(m_reg0__28_carry_n_7),
        .I1(m_reg0__0_carry_n_4),
        .O(\m_reg[3]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_reg_reg[0] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(m_reg0__0_carry_n_7),
        .Q(\m_reg_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_reg_reg[1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(m_reg0__0_carry_n_6),
        .Q(\m_reg_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_reg_reg[2] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(m_reg0__0_carry_n_5),
        .Q(\m_reg_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_reg_reg[3] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\m_reg[3]_i_1__0_n_0 ),
        .Q(\m_reg_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_reg_reg[4] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(m_reg0__56_carry_n_7),
        .Q(\m_reg_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_reg_reg[5] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(m_reg0__56_carry_n_6),
        .Q(\m_reg_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_reg_reg[6] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(m_reg0__56_carry_n_5),
        .Q(\m_reg_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_reg_reg[7] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(m_reg0__56_carry_n_4),
        .Q(\m_reg_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_reg_reg[8] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(m_reg0__56_carry__0_n_7),
        .Q(\m_reg_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_reg_reg[9] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(m_reg0__56_carry__0_n_6),
        .Q(\m_reg_reg_n_0_[9] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \p_reg_reg[0] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\m_reg_reg_n_0_[0] ),
        .Q(\p_reg_reg[9]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \p_reg_reg[1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\m_reg_reg_n_0_[1] ),
        .Q(\p_reg_reg[9]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \p_reg_reg[2] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\m_reg_reg_n_0_[2] ),
        .Q(\p_reg_reg[9]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \p_reg_reg[3] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\m_reg_reg_n_0_[3] ),
        .Q(\p_reg_reg[9]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \p_reg_reg[4] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\m_reg_reg_n_0_[4] ),
        .Q(\p_reg_reg[9]_0 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \p_reg_reg[5] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\m_reg_reg_n_0_[5] ),
        .Q(\p_reg_reg[9]_0 [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \p_reg_reg[6] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\m_reg_reg_n_0_[6] ),
        .Q(\p_reg_reg[9]_0 [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \p_reg_reg[7] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\m_reg_reg_n_0_[7] ),
        .Q(\p_reg_reg[9]_0 [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \p_reg_reg[8] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\m_reg_reg_n_0_[8] ),
        .Q(\p_reg_reg[9]_0 [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \p_reg_reg[9] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\m_reg_reg_n_0_[9] ),
        .Q(\p_reg_reg[9]_0 [9]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "dsp_25x18" *) 
module dsp_25x18__parameterized2
   (re_sq,
    clk100M_IBUF_BUFG,
    p_reg_reg_0,
    PCOUT);
  output [18:0]re_sq;
  input clk100M_IBUF_BUFG;
  input [23:0]p_reg_reg_0;
  input [47:0]PCOUT;

  wire [47:0]PCOUT;
  wire clk100M_IBUF_BUFG;
  wire [23:0]p_reg_reg_0;
  wire [18:0]re_sq;
  wire NLW_p_reg_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_p_reg_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_p_reg_reg_OVERFLOW_UNCONNECTED;
  wire NLW_p_reg_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_p_reg_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_p_reg_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_p_reg_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_p_reg_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_p_reg_reg_CARRYOUT_UNCONNECTED;
  wire [47:19]NLW_p_reg_reg_P_UNCONNECTED;
  wire [47:0]NLW_p_reg_reg_PCOUT_UNCONNECTED;

  DSP48E1 #(
    .ACASCREG(2),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(2),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(2),
    .BREG(2),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    p_reg_reg
       (.A({p_reg_reg_0[18],p_reg_reg_0[18],p_reg_reg_0[18],p_reg_reg_0[18],p_reg_reg_0[18],p_reg_reg_0[18],p_reg_reg_0[18],p_reg_reg_0[18],p_reg_reg_0[18],p_reg_reg_0[18],p_reg_reg_0[18],p_reg_reg_0[18:0]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_p_reg_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({p_reg_reg_0[23],p_reg_reg_0[23],p_reg_reg_0[23],p_reg_reg_0[23],p_reg_reg_0[23],p_reg_reg_0[23],p_reg_reg_0[23],p_reg_reg_0[23],p_reg_reg_0[23],p_reg_reg_0[23],p_reg_reg_0[23],p_reg_reg_0[23:17]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_p_reg_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_p_reg_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_p_reg_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b1),
        .CEA2(1'b1),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b1),
        .CEB2(1'b1),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b1),
        .CEP(1'b1),
        .CLK(clk100M_IBUF_BUFG),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_p_reg_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_p_reg_reg_OVERFLOW_UNCONNECTED),
        .P({NLW_p_reg_reg_P_UNCONNECTED[47:19],re_sq}),
        .PATTERNBDETECT(NLW_p_reg_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_p_reg_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN(PCOUT),
        .PCOUT(NLW_p_reg_reg_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_p_reg_reg_UNDERFLOW_UNCONNECTED));
endmodule

(* ORIG_REF_NAME = "dsp_25x18" *) 
module dsp_25x18__parameterized2_18
   (im_sq,
    clk100M_IBUF_BUFG,
    DOBDO,
    PCOUT);
  output [18:0]im_sq;
  input clk100M_IBUF_BUFG;
  input [23:0]DOBDO;
  input [47:0]PCOUT;

  wire [23:0]DOBDO;
  wire [47:0]PCOUT;
  wire clk100M_IBUF_BUFG;
  wire [18:0]im_sq;
  wire NLW_p_reg_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_p_reg_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_p_reg_reg_OVERFLOW_UNCONNECTED;
  wire NLW_p_reg_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_p_reg_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_p_reg_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_p_reg_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_p_reg_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_p_reg_reg_CARRYOUT_UNCONNECTED;
  wire [47:19]NLW_p_reg_reg_P_UNCONNECTED;
  wire [47:0]NLW_p_reg_reg_PCOUT_UNCONNECTED;

  DSP48E1 #(
    .ACASCREG(2),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(2),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(2),
    .BREG(2),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    p_reg_reg
       (.A({DOBDO[18],DOBDO[18],DOBDO[18],DOBDO[18],DOBDO[18],DOBDO[18],DOBDO[18],DOBDO[18],DOBDO[18],DOBDO[18],DOBDO[18],DOBDO[18:0]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_p_reg_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({DOBDO[23],DOBDO[23],DOBDO[23],DOBDO[23],DOBDO[23],DOBDO[23],DOBDO[23],DOBDO[23],DOBDO[23],DOBDO[23],DOBDO[23],DOBDO[23:17]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_p_reg_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_p_reg_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_p_reg_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b1),
        .CEA2(1'b1),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b1),
        .CEB2(1'b1),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b1),
        .CEP(1'b1),
        .CLK(clk100M_IBUF_BUFG),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_p_reg_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_p_reg_reg_OVERFLOW_UNCONNECTED),
        .P({NLW_p_reg_reg_P_UNCONNECTED[47:19],im_sq}),
        .PATTERNBDETECT(NLW_p_reg_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_p_reg_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN(PCOUT),
        .PCOUT(NLW_p_reg_reg_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_p_reg_reg_UNDERFLOW_UNCONNECTED));
endmodule

module fft_to_dB
   (DOADO,
    dB_vld,
    frm_dout_vld_reg_reg,
    Q,
    clk100M_IBUF_BUFG,
    fft_rdy,
    DOBDO,
    p_reg_reg,
    rstbt_IBUF,
    frm_dout_vld,
    pwropt,
    pwropt_1);
  output [22:0]DOADO;
  output dB_vld;
  output frm_dout_vld_reg_reg;
  output [9:0]Q;
  input clk100M_IBUF_BUFG;
  input fft_rdy;
  input [23:0]DOBDO;
  input [23:0]p_reg_reg;
  input rstbt_IBUF;
  input frm_dout_vld;
  output pwropt;
  output pwropt_1;

  wire [22:0]DOADO;
  wire [23:0]DOBDO;
  wire [9:0]Q;
  wire all_dB_calculated_reg_i_1_n_0;
  wire all_dB_calculated_reg_i_2_n_0;
  wire all_dB_vld;
  wire [2:0]calc_dl;
  wire \calc_dl[0]_i_1_n_0 ;
  wire \calc_dl[1]_i_1_n_0 ;
  wire \calc_dl[2]_i_1_n_0 ;
  wire clk100M_IBUF_BUFG;
  wire dB_result_done_reg_i_1_n_0;
  wire [9:0]dB_values_rom_addr;
  wire dB_vld;
  wire \fft_cntr[9]_i_1_n_0 ;
  wire \fft_cntr[9]_i_4_n_0 ;
  wire fft_rdy;
  wire fft_rdy_delay;
  wire frm_dout_vld;
  wire frm_dout_vld_reg_reg;
  wire [35:0]im_sq;
  wire [9:0]p_0_in__4;
  wire [23:0]p_reg_reg;
  wire [35:0]re_sq;
  wire rstbt_IBUF;
  wire sel;
  wire \sum[27]_i_10_n_0 ;
  wire \sum[27]_i_11_n_0 ;
  wire \sum[27]_i_13_n_0 ;
  wire \sum[27]_i_14_n_0 ;
  wire \sum[27]_i_15_n_0 ;
  wire \sum[27]_i_16_n_0 ;
  wire \sum[27]_i_18_n_0 ;
  wire \sum[27]_i_19_n_0 ;
  wire \sum[27]_i_20_n_0 ;
  wire \sum[27]_i_21_n_0 ;
  wire \sum[27]_i_23_n_0 ;
  wire \sum[27]_i_24_n_0 ;
  wire \sum[27]_i_25_n_0 ;
  wire \sum[27]_i_26_n_0 ;
  wire \sum[27]_i_28_n_0 ;
  wire \sum[27]_i_29_n_0 ;
  wire \sum[27]_i_30_n_0 ;
  wire \sum[27]_i_31_n_0 ;
  wire \sum[27]_i_32_n_0 ;
  wire \sum[27]_i_33_n_0 ;
  wire \sum[27]_i_34_n_0 ;
  wire \sum[27]_i_35_n_0 ;
  wire \sum[27]_i_3_n_0 ;
  wire \sum[27]_i_4_n_0 ;
  wire \sum[27]_i_5_n_0 ;
  wire \sum[27]_i_6_n_0 ;
  wire \sum[27]_i_8_n_0 ;
  wire \sum[27]_i_9_n_0 ;
  wire \sum[31]_i_2_n_0 ;
  wire \sum[31]_i_3_n_0 ;
  wire \sum[31]_i_4_n_0 ;
  wire \sum[31]_i_5_n_0 ;
  wire \sum[35]_i_2_n_0 ;
  wire \sum[35]_i_3_n_0 ;
  wire \sum[35]_i_4_n_0 ;
  wire \sum[35]_i_5_n_0 ;
  wire \sum_reg[27]_i_12_n_0 ;
  wire \sum_reg[27]_i_17_n_0 ;
  wire \sum_reg[27]_i_1_n_0 ;
  wire \sum_reg[27]_i_1_n_4 ;
  wire \sum_reg[27]_i_1_n_5 ;
  wire \sum_reg[27]_i_22_n_0 ;
  wire \sum_reg[27]_i_27_n_0 ;
  wire \sum_reg[27]_i_2_n_0 ;
  wire \sum_reg[27]_i_7_n_0 ;
  wire \sum_reg[31]_i_1_n_0 ;
  wire \sum_reg[31]_i_1_n_4 ;
  wire \sum_reg[31]_i_1_n_5 ;
  wire \sum_reg[31]_i_1_n_6 ;
  wire \sum_reg[31]_i_1_n_7 ;
  wire \sum_reg[35]_i_1_n_4 ;
  wire \sum_reg[35]_i_1_n_5 ;
  wire \sum_reg[35]_i_1_n_6 ;
  wire \sum_reg[35]_i_1_n_7 ;
  wire [2:0]\NLW_sum_reg[27]_i_1_CO_UNCONNECTED ;
  wire [1:0]\NLW_sum_reg[27]_i_1_O_UNCONNECTED ;
  wire [2:0]\NLW_sum_reg[27]_i_12_CO_UNCONNECTED ;
  wire [3:0]\NLW_sum_reg[27]_i_12_O_UNCONNECTED ;
  wire [2:0]\NLW_sum_reg[27]_i_17_CO_UNCONNECTED ;
  wire [3:0]\NLW_sum_reg[27]_i_17_O_UNCONNECTED ;
  wire [2:0]\NLW_sum_reg[27]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_sum_reg[27]_i_2_O_UNCONNECTED ;
  wire [2:0]\NLW_sum_reg[27]_i_22_CO_UNCONNECTED ;
  wire [3:0]\NLW_sum_reg[27]_i_22_O_UNCONNECTED ;
  wire [2:0]\NLW_sum_reg[27]_i_27_CO_UNCONNECTED ;
  wire [3:0]\NLW_sum_reg[27]_i_27_O_UNCONNECTED ;
  wire [2:0]\NLW_sum_reg[27]_i_7_CO_UNCONNECTED ;
  wire [3:0]\NLW_sum_reg[27]_i_7_O_UNCONNECTED ;
  wire [2:0]\NLW_sum_reg[31]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_sum_reg[35]_i_1_CO_UNCONNECTED ;

  assign pwropt = \fft_cntr[9]_i_1_n_0 ;
  assign pwropt_1 = sel;
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    all_dB_calculated_reg_i_1
       (.I0(dB_vld),
        .I1(Q[8]),
        .I2(all_dB_calculated_reg_i_2_n_0),
        .I3(Q[7]),
        .I4(Q[9]),
        .I5(all_dB_vld),
        .O(all_dB_calculated_reg_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    all_dB_calculated_reg_i_2
       (.I0(Q[6]),
        .I1(\fft_cntr[9]_i_4_n_0 ),
        .O(all_dB_calculated_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    all_dB_calculated_reg_reg
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(all_dB_calculated_reg_i_1_n_0),
        .Q(all_dB_vld),
        .R(rstbt_IBUF));
  LUT6 #(
    .INIT(64'h000000000000E666)) 
    \calc_dl[0]_i_1 
       (.I0(calc_dl[0]),
        .I1(fft_rdy),
        .I2(calc_dl[1]),
        .I3(calc_dl[2]),
        .I4(sel),
        .I5(\fft_cntr[9]_i_1_n_0 ),
        .O(\calc_dl[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000000000BCF0)) 
    \calc_dl[1]_i_1 
       (.I0(calc_dl[2]),
        .I1(calc_dl[0]),
        .I2(calc_dl[1]),
        .I3(fft_rdy),
        .I4(sel),
        .I5(\fft_cntr[9]_i_1_n_0 ),
        .O(\calc_dl[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000000000EAAA)) 
    \calc_dl[2]_i_1 
       (.I0(calc_dl[2]),
        .I1(calc_dl[0]),
        .I2(calc_dl[1]),
        .I3(fft_rdy),
        .I4(sel),
        .I5(\fft_cntr[9]_i_1_n_0 ),
        .O(\calc_dl[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \calc_dl_reg[0] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\calc_dl[0]_i_1_n_0 ),
        .Q(calc_dl[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \calc_dl_reg[1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\calc_dl[1]_i_1_n_0 ),
        .Q(calc_dl[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \calc_dl_reg[2] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\calc_dl[2]_i_1_n_0 ),
        .Q(calc_dl[2]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00004000)) 
    dB_result_done_reg_i_1
       (.I0(calc_dl[0]),
        .I1(calc_dl[1]),
        .I2(calc_dl[2]),
        .I3(fft_rdy),
        .I4(dB_vld),
        .O(dB_result_done_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    dB_result_done_reg_reg
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(dB_result_done_reg_i_1_n_0),
        .Q(dB_vld),
        .R(rstbt_IBUF));
  dB_value_rom dB_values
       (.DOADO(DOADO),
        .Q(dB_values_rom_addr),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG));
  LUT1 #(
    .INIT(2'h1)) 
    \fft_cntr[0]_i_1 
       (.I0(Q[0]),
        .O(p_0_in__4[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \fft_cntr[1]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .O(p_0_in__4[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \fft_cntr[2]_i_1 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(p_0_in__4[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \fft_cntr[3]_i_1 
       (.I0(Q[3]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[2]),
        .O(p_0_in__4[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \fft_cntr[4]_i_1 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[3]),
        .O(p_0_in__4[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \fft_cntr[5]_i_1 
       (.I0(Q[5]),
        .I1(Q[3]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[4]),
        .O(p_0_in__4[5]));
  LUT2 #(
    .INIT(4'h9)) 
    \fft_cntr[6]_i_1 
       (.I0(\fft_cntr[9]_i_4_n_0 ),
        .I1(Q[6]),
        .O(p_0_in__4[6]));
  LUT3 #(
    .INIT(8'h9A)) 
    \fft_cntr[7]_i_1 
       (.I0(Q[7]),
        .I1(\fft_cntr[9]_i_4_n_0 ),
        .I2(Q[6]),
        .O(p_0_in__4[7]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hA6AA)) 
    \fft_cntr[8]_i_1 
       (.I0(Q[8]),
        .I1(Q[6]),
        .I2(\fft_cntr[9]_i_4_n_0 ),
        .I3(Q[7]),
        .O(p_0_in__4[8]));
  LUT3 #(
    .INIT(8'hBA)) 
    \fft_cntr[9]_i_1 
       (.I0(rstbt_IBUF),
        .I1(fft_rdy_delay),
        .I2(fft_rdy),
        .O(\fft_cntr[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAA2AAAAAAAAAAAAA)) 
    \fft_cntr[9]_i_2 
       (.I0(dB_vld),
        .I1(Q[8]),
        .I2(Q[6]),
        .I3(\fft_cntr[9]_i_4_n_0 ),
        .I4(Q[7]),
        .I5(Q[9]),
        .O(sel));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hA6AAAAAA)) 
    \fft_cntr[9]_i_3 
       (.I0(Q[9]),
        .I1(Q[7]),
        .I2(\fft_cntr[9]_i_4_n_0 ),
        .I3(Q[6]),
        .I4(Q[8]),
        .O(p_0_in__4[9]));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \fft_cntr[9]_i_4 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[3]),
        .I5(Q[5]),
        .O(\fft_cntr[9]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \fft_cntr_reg[0] 
       (.C(clk100M_IBUF_BUFG),
        .CE(sel),
        .D(p_0_in__4[0]),
        .Q(Q[0]),
        .R(\fft_cntr[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \fft_cntr_reg[1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(sel),
        .D(p_0_in__4[1]),
        .Q(Q[1]),
        .R(\fft_cntr[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \fft_cntr_reg[2] 
       (.C(clk100M_IBUF_BUFG),
        .CE(sel),
        .D(p_0_in__4[2]),
        .Q(Q[2]),
        .R(\fft_cntr[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \fft_cntr_reg[3] 
       (.C(clk100M_IBUF_BUFG),
        .CE(sel),
        .D(p_0_in__4[3]),
        .Q(Q[3]),
        .R(\fft_cntr[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \fft_cntr_reg[4] 
       (.C(clk100M_IBUF_BUFG),
        .CE(sel),
        .D(p_0_in__4[4]),
        .Q(Q[4]),
        .R(\fft_cntr[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \fft_cntr_reg[5] 
       (.C(clk100M_IBUF_BUFG),
        .CE(sel),
        .D(p_0_in__4[5]),
        .Q(Q[5]),
        .R(\fft_cntr[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \fft_cntr_reg[6] 
       (.C(clk100M_IBUF_BUFG),
        .CE(sel),
        .D(p_0_in__4[6]),
        .Q(Q[6]),
        .R(\fft_cntr[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \fft_cntr_reg[7] 
       (.C(clk100M_IBUF_BUFG),
        .CE(sel),
        .D(p_0_in__4[7]),
        .Q(Q[7]),
        .R(\fft_cntr[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \fft_cntr_reg[8] 
       (.C(clk100M_IBUF_BUFG),
        .CE(sel),
        .D(p_0_in__4[8]),
        .Q(Q[8]),
        .R(\fft_cntr[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \fft_cntr_reg[9] 
       (.C(clk100M_IBUF_BUFG),
        .CE(sel),
        .D(p_0_in__4[9]),
        .Q(Q[9]),
        .R(\fft_cntr[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    fft_rdy_delay_reg
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(fft_rdy),
        .Q(fft_rdy_delay),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h0000EE0E)) 
    frm_dout_vld_reg_i_1
       (.I0(frm_dout_vld),
        .I1(all_dB_vld),
        .I2(fft_rdy),
        .I3(fft_rdy_delay),
        .I4(rstbt_IBUF),
        .O(frm_dout_vld_reg_reg));
  mul_24x24 im_square
       (.DOBDO(DOBDO),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG),
        .im_sq(im_sq));
  mul_24x24_15 re_square
       (.clk100M_IBUF_BUFG(clk100M_IBUF_BUFG),
        .p_reg_reg(p_reg_reg),
        .re_sq(re_sq));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[27]_i_10 
       (.I0(re_sq[21]),
        .I1(im_sq[21]),
        .O(\sum[27]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[27]_i_11 
       (.I0(re_sq[20]),
        .I1(im_sq[20]),
        .O(\sum[27]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[27]_i_13 
       (.I0(re_sq[19]),
        .I1(im_sq[19]),
        .O(\sum[27]_i_13_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[27]_i_14 
       (.I0(re_sq[18]),
        .I1(im_sq[18]),
        .O(\sum[27]_i_14_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[27]_i_15 
       (.I0(re_sq[17]),
        .I1(im_sq[17]),
        .O(\sum[27]_i_15_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[27]_i_16 
       (.I0(re_sq[16]),
        .I1(im_sq[16]),
        .O(\sum[27]_i_16_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[27]_i_18 
       (.I0(re_sq[15]),
        .I1(im_sq[15]),
        .O(\sum[27]_i_18_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[27]_i_19 
       (.I0(re_sq[14]),
        .I1(im_sq[14]),
        .O(\sum[27]_i_19_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[27]_i_20 
       (.I0(re_sq[13]),
        .I1(im_sq[13]),
        .O(\sum[27]_i_20_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[27]_i_21 
       (.I0(re_sq[12]),
        .I1(im_sq[12]),
        .O(\sum[27]_i_21_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[27]_i_23 
       (.I0(re_sq[11]),
        .I1(im_sq[11]),
        .O(\sum[27]_i_23_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[27]_i_24 
       (.I0(re_sq[10]),
        .I1(im_sq[10]),
        .O(\sum[27]_i_24_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[27]_i_25 
       (.I0(re_sq[9]),
        .I1(im_sq[9]),
        .O(\sum[27]_i_25_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[27]_i_26 
       (.I0(re_sq[8]),
        .I1(im_sq[8]),
        .O(\sum[27]_i_26_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[27]_i_28 
       (.I0(re_sq[7]),
        .I1(im_sq[7]),
        .O(\sum[27]_i_28_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[27]_i_29 
       (.I0(re_sq[6]),
        .I1(im_sq[6]),
        .O(\sum[27]_i_29_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[27]_i_3 
       (.I0(re_sq[27]),
        .I1(im_sq[27]),
        .O(\sum[27]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[27]_i_30 
       (.I0(re_sq[5]),
        .I1(im_sq[5]),
        .O(\sum[27]_i_30_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[27]_i_31 
       (.I0(re_sq[4]),
        .I1(im_sq[4]),
        .O(\sum[27]_i_31_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[27]_i_32 
       (.I0(re_sq[3]),
        .I1(im_sq[3]),
        .O(\sum[27]_i_32_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[27]_i_33 
       (.I0(re_sq[2]),
        .I1(im_sq[2]),
        .O(\sum[27]_i_33_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[27]_i_34 
       (.I0(re_sq[1]),
        .I1(im_sq[1]),
        .O(\sum[27]_i_34_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[27]_i_35 
       (.I0(re_sq[0]),
        .I1(im_sq[0]),
        .O(\sum[27]_i_35_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[27]_i_4 
       (.I0(re_sq[26]),
        .I1(im_sq[26]),
        .O(\sum[27]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[27]_i_5 
       (.I0(re_sq[25]),
        .I1(im_sq[25]),
        .O(\sum[27]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[27]_i_6 
       (.I0(re_sq[24]),
        .I1(im_sq[24]),
        .O(\sum[27]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[27]_i_8 
       (.I0(re_sq[23]),
        .I1(im_sq[23]),
        .O(\sum[27]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[27]_i_9 
       (.I0(re_sq[22]),
        .I1(im_sq[22]),
        .O(\sum[27]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[31]_i_2 
       (.I0(re_sq[31]),
        .I1(im_sq[31]),
        .O(\sum[31]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[31]_i_3 
       (.I0(re_sq[30]),
        .I1(im_sq[30]),
        .O(\sum[31]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[31]_i_4 
       (.I0(re_sq[29]),
        .I1(im_sq[29]),
        .O(\sum[31]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[31]_i_5 
       (.I0(re_sq[28]),
        .I1(im_sq[28]),
        .O(\sum[31]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[35]_i_2 
       (.I0(re_sq[35]),
        .I1(im_sq[35]),
        .O(\sum[35]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[35]_i_3 
       (.I0(re_sq[34]),
        .I1(im_sq[34]),
        .O(\sum[35]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[35]_i_4 
       (.I0(re_sq[33]),
        .I1(im_sq[33]),
        .O(\sum[35]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sum[35]_i_5 
       (.I0(re_sq[32]),
        .I1(im_sq[32]),
        .O(\sum[35]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sum_reg[26] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\sum_reg[27]_i_1_n_5 ),
        .Q(dB_values_rom_addr[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_reg[27] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\sum_reg[27]_i_1_n_4 ),
        .Q(dB_values_rom_addr[1]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \sum_reg[27]_i_1 
       (.CI(\sum_reg[27]_i_2_n_0 ),
        .CO({\sum_reg[27]_i_1_n_0 ,\NLW_sum_reg[27]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI(re_sq[27:24]),
        .O({\sum_reg[27]_i_1_n_4 ,\sum_reg[27]_i_1_n_5 ,\NLW_sum_reg[27]_i_1_O_UNCONNECTED [1:0]}),
        .S({\sum[27]_i_3_n_0 ,\sum[27]_i_4_n_0 ,\sum[27]_i_5_n_0 ,\sum[27]_i_6_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \sum_reg[27]_i_12 
       (.CI(\sum_reg[27]_i_17_n_0 ),
        .CO({\sum_reg[27]_i_12_n_0 ,\NLW_sum_reg[27]_i_12_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI(re_sq[15:12]),
        .O(\NLW_sum_reg[27]_i_12_O_UNCONNECTED [3:0]),
        .S({\sum[27]_i_18_n_0 ,\sum[27]_i_19_n_0 ,\sum[27]_i_20_n_0 ,\sum[27]_i_21_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \sum_reg[27]_i_17 
       (.CI(\sum_reg[27]_i_22_n_0 ),
        .CO({\sum_reg[27]_i_17_n_0 ,\NLW_sum_reg[27]_i_17_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI(re_sq[11:8]),
        .O(\NLW_sum_reg[27]_i_17_O_UNCONNECTED [3:0]),
        .S({\sum[27]_i_23_n_0 ,\sum[27]_i_24_n_0 ,\sum[27]_i_25_n_0 ,\sum[27]_i_26_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \sum_reg[27]_i_2 
       (.CI(\sum_reg[27]_i_7_n_0 ),
        .CO({\sum_reg[27]_i_2_n_0 ,\NLW_sum_reg[27]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI(re_sq[23:20]),
        .O(\NLW_sum_reg[27]_i_2_O_UNCONNECTED [3:0]),
        .S({\sum[27]_i_8_n_0 ,\sum[27]_i_9_n_0 ,\sum[27]_i_10_n_0 ,\sum[27]_i_11_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \sum_reg[27]_i_22 
       (.CI(\sum_reg[27]_i_27_n_0 ),
        .CO({\sum_reg[27]_i_22_n_0 ,\NLW_sum_reg[27]_i_22_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI(re_sq[7:4]),
        .O(\NLW_sum_reg[27]_i_22_O_UNCONNECTED [3:0]),
        .S({\sum[27]_i_28_n_0 ,\sum[27]_i_29_n_0 ,\sum[27]_i_30_n_0 ,\sum[27]_i_31_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \sum_reg[27]_i_27 
       (.CI(1'b0),
        .CO({\sum_reg[27]_i_27_n_0 ,\NLW_sum_reg[27]_i_27_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI(re_sq[3:0]),
        .O(\NLW_sum_reg[27]_i_27_O_UNCONNECTED [3:0]),
        .S({\sum[27]_i_32_n_0 ,\sum[27]_i_33_n_0 ,\sum[27]_i_34_n_0 ,\sum[27]_i_35_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \sum_reg[27]_i_7 
       (.CI(\sum_reg[27]_i_12_n_0 ),
        .CO({\sum_reg[27]_i_7_n_0 ,\NLW_sum_reg[27]_i_7_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI(re_sq[19:16]),
        .O(\NLW_sum_reg[27]_i_7_O_UNCONNECTED [3:0]),
        .S({\sum[27]_i_13_n_0 ,\sum[27]_i_14_n_0 ,\sum[27]_i_15_n_0 ,\sum[27]_i_16_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \sum_reg[28] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\sum_reg[31]_i_1_n_7 ),
        .Q(dB_values_rom_addr[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_reg[29] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\sum_reg[31]_i_1_n_6 ),
        .Q(dB_values_rom_addr[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_reg[30] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\sum_reg[31]_i_1_n_5 ),
        .Q(dB_values_rom_addr[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_reg[31] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\sum_reg[31]_i_1_n_4 ),
        .Q(dB_values_rom_addr[5]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \sum_reg[31]_i_1 
       (.CI(\sum_reg[27]_i_1_n_0 ),
        .CO({\sum_reg[31]_i_1_n_0 ,\NLW_sum_reg[31]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI(re_sq[31:28]),
        .O({\sum_reg[31]_i_1_n_4 ,\sum_reg[31]_i_1_n_5 ,\sum_reg[31]_i_1_n_6 ,\sum_reg[31]_i_1_n_7 }),
        .S({\sum[31]_i_2_n_0 ,\sum[31]_i_3_n_0 ,\sum[31]_i_4_n_0 ,\sum[31]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \sum_reg[32] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\sum_reg[35]_i_1_n_7 ),
        .Q(dB_values_rom_addr[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_reg[33] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\sum_reg[35]_i_1_n_6 ),
        .Q(dB_values_rom_addr[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_reg[34] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\sum_reg[35]_i_1_n_5 ),
        .Q(dB_values_rom_addr[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_reg[35] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(\sum_reg[35]_i_1_n_4 ),
        .Q(dB_values_rom_addr[9]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \sum_reg[35]_i_1 
       (.CI(\sum_reg[31]_i_1_n_0 ),
        .CO(\NLW_sum_reg[35]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,re_sq[34:32]}),
        .O({\sum_reg[35]_i_1_n_4 ,\sum_reg[35]_i_1_n_5 ,\sum_reg[35]_i_1_n_6 ,\sum_reg[35]_i_1_n_7 }),
        .S({\sum[35]_i_2_n_0 ,\sum[35]_i_3_n_0 ,\sum[35]_i_4_n_0 ,\sum[35]_i_5_n_0 }));
endmodule

(* ECO_CHECKSUM = "33a85f04" *) (* POWER_OPT_BRAM_CDC = "0" *) (* POWER_OPT_BRAM_SR_ADDR = "0" *) 
(* POWER_OPT_LOOPED_NET_PERCENTAGE = "0" *) 
(* NotValidForBitStream *)
module hdmi_top
   (clk100M,
    rstbt,
    led_r,
    sw,
    bt,
    hdmi_tx_d0_p,
    hdmi_tx_d0_n,
    hdmi_tx_d1_p,
    hdmi_tx_d1_n,
    hdmi_tx_d2_p,
    hdmi_tx_d2_n,
    hdmi_tx_clk_p,
    hdmi_tx_clk_n,
    hdmi_tx_cec,
    hdmi_tx_hpdn,
    hdmi_tx_scl,
    hdmi_tx_sda,
    codec_m0,
    codec_m1,
    codec_i2s,
    codec_mdiv1,
    codec_mdiv2,
    codec_rstn,
    codec_mclk,
    codec_lrclk,
    codec_sclk,
    codec_sdin,
    codec_sdout,
    vol_clk,
    vol_ud);
  input clk100M;
  input rstbt;
  output [7:0]led_r;
  input [7:0]sw;
  inout [3:0]bt;
  output hdmi_tx_d0_p;
  output hdmi_tx_d0_n;
  output hdmi_tx_d1_p;
  output hdmi_tx_d1_n;
  output hdmi_tx_d2_p;
  output hdmi_tx_d2_n;
  output hdmi_tx_clk_p;
  output hdmi_tx_clk_n;
  input hdmi_tx_cec;
  input hdmi_tx_hpdn;
  input hdmi_tx_scl;
  input hdmi_tx_sda;
  output codec_m0;
  output codec_m1;
  output codec_i2s;
  output codec_mdiv1;
  output codec_mdiv2;
  output codec_rstn;
  output codec_mclk;
  output codec_lrclk;
  output codec_sclk;
  output codec_sdin;
  input codec_sdout;
  output vol_clk;
  output vol_ud;

  wire [3:0]bt;
  wire clk100M;
  wire clk100M_IBUF;
  wire clk100M_IBUF_BUFG;
  wire clk200M;
  wire clk200M_BUFG;
  wire clk40M;
  wire clk40M_BUFG;
  wire codec_i2s;
  wire codec_lrclk;
  wire codec_lrclk_OBUF;
  wire codec_m0;
  wire codec_m1;
  wire codec_mclk;
  wire codec_mclk_OBUF;
  wire codec_mdiv1;
  wire codec_mdiv2;
  wire codec_rstn;
  wire codec_rstn_OBUF;
  wire codec_sclk;
  wire codec_sclk_OBUF;
  wire codec_sdin;
  wire codec_sdout;
  wire codec_sdout_IBUF;
  wire display_ram_n_0;
  wire display_ram_we;
  wire display_ram_we_i_2_n_0;
  wire display_ram_write_addr0;
  wire \display_ram_write_addr[9]_i_1_n_0 ;
  wire \display_ram_write_addr[9]_i_4_n_0 ;
  wire \display_ram_write_addr[9]_i_5_n_0 ;
  wire \display_ram_write_addr[9]_i_6_n_0 ;
  wire [9:0]display_ram_write_addr_reg;
  wire fft_start_i_1_n_0;
  wire fft_start_i_2_n_0;
  wire fft_start_reg_n_0;
  wire [23:0]frm_dout;
  wire \h_cntr[0]_i_1_n_0 ;
  wire \h_cntr[10]_i_1_n_0 ;
  wire \h_cntr[10]_i_3_n_0 ;
  wire \h_cntr[3]_i_1_n_0 ;
  wire \h_cntr[7]_i_1_n_0 ;
  wire \h_cntr[9]_i_2_n_0 ;
  wire [10:0]h_cntr_reg;
  wire h_sync;
  wire h_sync_i_1_n_0;
  wire h_sync_i_2_n_0;
  (* IOSTANDARD = "TMDS_33" *) (* SLEW = "FAST" *) wire hdmi_tx_clk_n;
  (* IOSTANDARD = "TMDS_33" *) (* SLEW = "FAST" *) wire hdmi_tx_clk_p;
  (* IOSTANDARD = "TMDS_33" *) (* SLEW = "FAST" *) wire hdmi_tx_d0_n;
  (* IOSTANDARD = "TMDS_33" *) (* SLEW = "FAST" *) wire hdmi_tx_d0_p;
  (* IOSTANDARD = "TMDS_33" *) (* SLEW = "FAST" *) wire hdmi_tx_d1_n;
  (* IOSTANDARD = "TMDS_33" *) (* SLEW = "FAST" *) wire hdmi_tx_d1_p;
  (* IOSTANDARD = "TMDS_33" *) (* SLEW = "FAST" *) wire hdmi_tx_d2_n;
  (* IOSTANDARD = "TMDS_33" *) (* SLEW = "FAST" *) wire hdmi_tx_d2_p;
  wire [7:0]led_r;
  wire [7:7]led_r_OBUF;
  wire [10:1]p_0_in;
  wire [9:0]p_0_in__0;
  wire [9:0]p_0_in__5;
  wire pll_clkfb;
  wire red;
  wire \red[0]_i_1_n_0 ;
  wire \red[0]_i_4_n_0 ;
  wire rst;
  wire rstbt;
  wire rstbt_IBUF;
  wire spec_anal_n_28;
  wire [7:0]sw;
  wire v_cntr;
  wire \v_cntr[5]_i_1_n_0 ;
  wire \v_cntr[9]_i_1_n_0 ;
  wire \v_cntr[9]_i_4_n_0 ;
  wire \v_cntr[9]_i_5_n_0 ;
  wire \v_cntr[9]_i_6_n_0 ;
  wire \v_cntr[9]_i_7_n_0 ;
  wire [9:0]v_cntr_reg;
  wire v_sync;
  wire v_sync_i_1_n_0;
  wire v_sync_i_2_n_0;
  wire v_sync_i_3_n_0;
  wire vde;
  wire vde_i_1_n_0;
  wire vde_i_2_n_0;
  wire vol_clk;
  wire vol_clk_OBUF;
  wire vol_ud;
  wire vol_ud_OBUF;
  wire NLW_clk_generator1_CLKOUT2_UNCONNECTED;
  wire NLW_clk_generator1_CLKOUT3_UNCONNECTED;
  wire NLW_clk_generator1_CLKOUT4_UNCONNECTED;
  wire NLW_clk_generator1_CLKOUT5_UNCONNECTED;
  wire NLW_clk_generator1_DRDY_UNCONNECTED;
  wire [15:0]NLW_clk_generator1_DO_UNCONNECTED;

initial begin
 $sdf_annotate("tb_fft_to_dB_time_impl.sdf",,,,"tool_control");
end
  IBUF \bt_IBUF[3]_inst 
       (.I(bt[3]),
        .O(vol_clk_OBUF));
  (* SPLIT_LOADS_ON_BUFG *) 
  BUFG clk100M_IBUF_BUFG_inst
       (.I(clk100M_IBUF),
        .O(clk100M_IBUF_BUFG));
  IBUF clk100M_IBUF_inst
       (.I(clk100M),
        .O(clk100M_IBUF));
  (* LOPT_BUFG_CLOCK *) 
  (* OPT_MODIFIED = "BUFG_OPT" *) 
  BUFG clk200M_BUFG_inst
       (.I(clk200M),
        .O(clk200M_BUFG));
  (* SPLIT_LOADS_ON_BUFG *) 
  BUFG clk40M_BUFG_inst
       (.I(clk40M),
        .O(clk40M_BUFG));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "BUFG_OPT" *) 
  (* XILINX_LEGACY_PRIM = "PLLE2_BASE" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:DWE,DEN,DCLK,DI[15],DI[14],DI[13],DI[12],DI[11],DI[10],DI[9],DI[8],DI[7],DI[6],DI[5],DI[4],DI[3],DI[2],DI[1],DI[0],DADDR[6],DADDR[5],DADDR[4],DADDR[3],DADDR[2],DADDR[1],DADDR[0],CLKIN2 VCC:CLKINSEL" *) 
  PLLE2_ADV #(
    .BANDWIDTH("OPTIMIZED"),
    .CLKFBOUT_MULT(10),
    .CLKFBOUT_PHASE(0.000000),
    .CLKIN1_PERIOD(10.000000),
    .CLKIN2_PERIOD(10.000000),
    .CLKOUT0_DIVIDE(5),
    .CLKOUT0_DUTY_CYCLE(0.500000),
    .CLKOUT0_PHASE(0.000000),
    .CLKOUT1_DIVIDE(25),
    .CLKOUT1_DUTY_CYCLE(0.500000),
    .CLKOUT1_PHASE(0.000000),
    .CLKOUT2_DIVIDE(1),
    .CLKOUT2_DUTY_CYCLE(0.500000),
    .CLKOUT2_PHASE(0.000000),
    .CLKOUT3_DIVIDE(1),
    .CLKOUT3_DUTY_CYCLE(0.500000),
    .CLKOUT3_PHASE(0.000000),
    .CLKOUT4_DIVIDE(1),
    .CLKOUT4_DUTY_CYCLE(0.500000),
    .CLKOUT4_PHASE(0.000000),
    .CLKOUT5_DIVIDE(1),
    .CLKOUT5_DUTY_CYCLE(0.500000),
    .CLKOUT5_PHASE(0.000000),
    .COMPENSATION("INTERNAL"),
    .DIVCLK_DIVIDE(1),
    .REF_JITTER1(0.000000),
    .REF_JITTER2(0.010000),
    .STARTUP_WAIT("FALSE")) 
    clk_generator1
       (.CLKFBIN(pll_clkfb),
        .CLKFBOUT(pll_clkfb),
        .CLKIN1(clk100M_IBUF_BUFG),
        .CLKIN2(1'b0),
        .CLKINSEL(1'b1),
        .CLKOUT0(clk200M),
        .CLKOUT1(clk40M),
        .CLKOUT2(NLW_clk_generator1_CLKOUT2_UNCONNECTED),
        .CLKOUT3(NLW_clk_generator1_CLKOUT3_UNCONNECTED),
        .CLKOUT4(NLW_clk_generator1_CLKOUT4_UNCONNECTED),
        .CLKOUT5(NLW_clk_generator1_CLKOUT5_UNCONNECTED),
        .DADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DCLK(1'b0),
        .DEN(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DO(NLW_clk_generator1_DO_UNCONNECTED[15:0]),
        .DRDY(NLW_clk_generator1_DRDY_UNCONNECTED),
        .DWE(1'b0),
        .LOCKED(led_r_OBUF),
        .PWRDWN(1'b0),
        .RST(rstbt_IBUF));
  OBUF codec_i2s_OBUF_inst
       (.I(1'b0),
        .O(codec_i2s));
  OBUF codec_lrclk_OBUF_inst
       (.I(codec_lrclk_OBUF),
        .O(codec_lrclk));
  OBUF codec_m0_OBUF_inst
       (.I(1'b0),
        .O(codec_m0));
  OBUF codec_m1_OBUF_inst
       (.I(1'b0),
        .O(codec_m1));
  OBUF codec_mclk_OBUF_inst
       (.I(codec_mclk_OBUF),
        .O(codec_mclk));
  OBUF codec_mdiv1_OBUF_inst
       (.I(1'b1),
        .O(codec_mdiv1));
  OBUF codec_mdiv2_OBUF_inst
       (.I(1'b1),
        .O(codec_mdiv2));
  OBUF codec_rstn_OBUF_inst
       (.I(codec_rstn_OBUF),
        .O(codec_rstn));
  OBUF codec_sclk_OBUF_inst
       (.I(codec_sclk_OBUF),
        .O(codec_sclk));
  OBUF codec_sdin_OBUF_inst
       (.I(1'b0),
        .O(codec_sdin));
  IBUF codec_sdout_IBUF_inst
       (.I(codec_sdout),
        .O(codec_sdout_IBUF));
  smpl_ram display_ram
       (.CLK(clk40M_BUFG),
        .CO(display_ram_n_0),
        .DOBDO(frm_dout),
        .Q(display_ram_write_addr_reg),
        .S(\red[0]_i_4_n_0 ),
        .display_ram_we(display_ram_we),
        .pwropt(\v_cntr[9]_i_1_n_0 ),
        .pwropt_1(v_cntr),
        .ram_array_reg_0(v_cntr_reg),
        .\red_reg[0]_i_3_0 (h_cntr_reg[7:0]));
  LUT5 #(
    .INIT(32'h08000000)) 
    display_ram_we_i_2
       (.I0(display_ram_write_addr_reg[9]),
        .I1(display_ram_write_addr_reg[7]),
        .I2(\display_ram_write_addr[9]_i_6_n_0 ),
        .I3(display_ram_write_addr_reg[6]),
        .I4(display_ram_write_addr_reg[8]),
        .O(display_ram_we_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    display_ram_we_reg
       (.C(clk40M_BUFG),
        .CE(1'b1),
        .D(spec_anal_n_28),
        .Q(display_ram_we),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \display_ram_write_addr[0]_i_1 
       (.I0(display_ram_write_addr_reg[0]),
        .O(p_0_in__5[0]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \display_ram_write_addr[1]_i_1 
       (.I0(display_ram_write_addr_reg[1]),
        .I1(display_ram_write_addr_reg[0]),
        .O(p_0_in__5[1]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \display_ram_write_addr[2]_i_1 
       (.I0(display_ram_write_addr_reg[2]),
        .I1(display_ram_write_addr_reg[1]),
        .I2(display_ram_write_addr_reg[0]),
        .O(p_0_in__5[2]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \display_ram_write_addr[3]_i_1 
       (.I0(display_ram_write_addr_reg[3]),
        .I1(display_ram_write_addr_reg[0]),
        .I2(display_ram_write_addr_reg[1]),
        .I3(display_ram_write_addr_reg[2]),
        .O(p_0_in__5[3]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \display_ram_write_addr[4]_i_1 
       (.I0(display_ram_write_addr_reg[4]),
        .I1(display_ram_write_addr_reg[2]),
        .I2(display_ram_write_addr_reg[1]),
        .I3(display_ram_write_addr_reg[0]),
        .I4(display_ram_write_addr_reg[3]),
        .O(p_0_in__5[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \display_ram_write_addr[5]_i_1 
       (.I0(display_ram_write_addr_reg[5]),
        .I1(display_ram_write_addr_reg[3]),
        .I2(display_ram_write_addr_reg[0]),
        .I3(display_ram_write_addr_reg[1]),
        .I4(display_ram_write_addr_reg[2]),
        .I5(display_ram_write_addr_reg[4]),
        .O(p_0_in__5[5]));
  LUT2 #(
    .INIT(4'h9)) 
    \display_ram_write_addr[6]_i_1 
       (.I0(\display_ram_write_addr[9]_i_6_n_0 ),
        .I1(display_ram_write_addr_reg[6]),
        .O(p_0_in__5[6]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'h9A)) 
    \display_ram_write_addr[7]_i_1 
       (.I0(display_ram_write_addr_reg[7]),
        .I1(\display_ram_write_addr[9]_i_6_n_0 ),
        .I2(display_ram_write_addr_reg[6]),
        .O(p_0_in__5[7]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT4 #(
    .INIT(16'hA6AA)) 
    \display_ram_write_addr[8]_i_1 
       (.I0(display_ram_write_addr_reg[8]),
        .I1(display_ram_write_addr_reg[6]),
        .I2(\display_ram_write_addr[9]_i_6_n_0 ),
        .I3(display_ram_write_addr_reg[7]),
        .O(p_0_in__5[8]));
  LUT6 #(
    .INIT(64'h00000001FFFFFFFF)) 
    \display_ram_write_addr[9]_i_1 
       (.I0(\display_ram_write_addr[9]_i_4_n_0 ),
        .I1(v_cntr_reg[1]),
        .I2(v_cntr_reg[0]),
        .I3(\display_ram_write_addr[9]_i_5_n_0 ),
        .I4(v_cntr_reg[5]),
        .I5(led_r_OBUF),
        .O(\display_ram_write_addr[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAA2AAAAAAAAAAAAA)) 
    \display_ram_write_addr[9]_i_2 
       (.I0(display_ram_we),
        .I1(display_ram_write_addr_reg[8]),
        .I2(display_ram_write_addr_reg[6]),
        .I3(\display_ram_write_addr[9]_i_6_n_0 ),
        .I4(display_ram_write_addr_reg[7]),
        .I5(display_ram_write_addr_reg[9]),
        .O(display_ram_write_addr0));
  LUT5 #(
    .INIT(32'hA6AAAAAA)) 
    \display_ram_write_addr[9]_i_3 
       (.I0(display_ram_write_addr_reg[9]),
        .I1(display_ram_write_addr_reg[7]),
        .I2(\display_ram_write_addr[9]_i_6_n_0 ),
        .I3(display_ram_write_addr_reg[6]),
        .I4(display_ram_write_addr_reg[8]),
        .O(p_0_in__5[9]));
  (* PHYS_OPT_MODIFIED = "CRITICAL_CELL_OPT" *) 
  (* PHYS_OPT_SKIPPED = "CRITICAL_CELL_OPT" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \display_ram_write_addr[9]_i_4 
       (.I0(v_cntr_reg[4]),
        .I1(v_cntr_reg[3]),
        .I2(v_cntr_reg[2]),
        .I3(v_cntr_reg[9]),
        .I4(v_cntr_reg[6]),
        .O(\display_ram_write_addr[9]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \display_ram_write_addr[9]_i_5 
       (.I0(v_cntr_reg[8]),
        .I1(v_cntr_reg[7]),
        .O(\display_ram_write_addr[9]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \display_ram_write_addr[9]_i_6 
       (.I0(display_ram_write_addr_reg[4]),
        .I1(display_ram_write_addr_reg[2]),
        .I2(display_ram_write_addr_reg[1]),
        .I3(display_ram_write_addr_reg[0]),
        .I4(display_ram_write_addr_reg[3]),
        .I5(display_ram_write_addr_reg[5]),
        .O(\display_ram_write_addr[9]_i_6_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \display_ram_write_addr_reg[0] 
       (.C(clk40M_BUFG),
        .CE(display_ram_write_addr0),
        .D(p_0_in__5[0]),
        .Q(display_ram_write_addr_reg[0]),
        .R(\display_ram_write_addr[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \display_ram_write_addr_reg[1] 
       (.C(clk40M_BUFG),
        .CE(display_ram_write_addr0),
        .D(p_0_in__5[1]),
        .Q(display_ram_write_addr_reg[1]),
        .R(\display_ram_write_addr[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \display_ram_write_addr_reg[2] 
       (.C(clk40M_BUFG),
        .CE(display_ram_write_addr0),
        .D(p_0_in__5[2]),
        .Q(display_ram_write_addr_reg[2]),
        .R(\display_ram_write_addr[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \display_ram_write_addr_reg[3] 
       (.C(clk40M_BUFG),
        .CE(display_ram_write_addr0),
        .D(p_0_in__5[3]),
        .Q(display_ram_write_addr_reg[3]),
        .R(\display_ram_write_addr[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \display_ram_write_addr_reg[4] 
       (.C(clk40M_BUFG),
        .CE(display_ram_write_addr0),
        .D(p_0_in__5[4]),
        .Q(display_ram_write_addr_reg[4]),
        .R(\display_ram_write_addr[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \display_ram_write_addr_reg[5] 
       (.C(clk40M_BUFG),
        .CE(display_ram_write_addr0),
        .D(p_0_in__5[5]),
        .Q(display_ram_write_addr_reg[5]),
        .R(\display_ram_write_addr[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \display_ram_write_addr_reg[6] 
       (.C(clk40M_BUFG),
        .CE(display_ram_write_addr0),
        .D(p_0_in__5[6]),
        .Q(display_ram_write_addr_reg[6]),
        .R(\display_ram_write_addr[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \display_ram_write_addr_reg[7] 
       (.C(clk40M_BUFG),
        .CE(display_ram_write_addr0),
        .D(p_0_in__5[7]),
        .Q(display_ram_write_addr_reg[7]),
        .R(\display_ram_write_addr[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \display_ram_write_addr_reg[8] 
       (.C(clk40M_BUFG),
        .CE(display_ram_write_addr0),
        .D(p_0_in__5[8]),
        .Q(display_ram_write_addr_reg[8]),
        .R(\display_ram_write_addr[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \display_ram_write_addr_reg[9] 
       (.C(clk40M_BUFG),
        .CE(display_ram_write_addr0),
        .D(p_0_in__5[9]),
        .Q(display_ram_write_addr_reg[9]),
        .R(\display_ram_write_addr[9]_i_1_n_0 ));
  (* PHYS_OPT_MODIFIED = "RESTRUCT_OPT" *) 
  LUT6 #(
    .INIT(64'h0000000000040000)) 
    fft_start_i_1
       (.I0(v_cntr_reg[1]),
        .I1(v_cntr_reg[0]),
        .I2(fft_start_i_2_n_0),
        .I3(\display_ram_write_addr[9]_i_4_n_0 ),
        .I4(led_r_OBUF),
        .I5(fft_start_reg_n_0),
        .O(fft_start_i_1_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    fft_start_i_2
       (.I0(v_cntr_reg[5]),
        .I1(v_cntr_reg[7]),
        .I2(v_cntr_reg[8]),
        .O(fft_start_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    fft_start_reg
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(fft_start_i_1_n_0),
        .Q(fft_start_reg_n_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \h_cntr[0]_i_1 
       (.I0(h_cntr_reg[0]),
        .O(\h_cntr[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \h_cntr[10]_i_1 
       (.I0(v_cntr),
        .I1(led_r_OBUF),
        .O(\h_cntr[10]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \h_cntr[10]_i_2 
       (.I0(h_cntr_reg[10]),
        .I1(\h_cntr[10]_i_3_n_0 ),
        .I2(h_cntr_reg[9]),
        .I3(h_cntr_reg[8]),
        .O(p_0_in[10]));
  LUT4 #(
    .INIT(16'h8000)) 
    \h_cntr[10]_i_3 
       (.I0(h_cntr_reg[7]),
        .I1(h_cntr_reg[6]),
        .I2(h_cntr_reg[5]),
        .I3(\h_cntr[9]_i_2_n_0 ),
        .O(\h_cntr[10]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \h_cntr[1]_i_1 
       (.I0(h_cntr_reg[0]),
        .I1(h_cntr_reg[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \h_cntr[2]_i_1 
       (.I0(h_cntr_reg[2]),
        .I1(h_cntr_reg[0]),
        .I2(h_cntr_reg[1]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \h_cntr[3]_i_1 
       (.I0(h_cntr_reg[3]),
        .I1(h_cntr_reg[2]),
        .I2(h_cntr_reg[0]),
        .I3(h_cntr_reg[1]),
        .O(\h_cntr[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \h_cntr[4]_i_1 
       (.I0(h_cntr_reg[2]),
        .I1(h_cntr_reg[0]),
        .I2(h_cntr_reg[1]),
        .I3(h_cntr_reg[3]),
        .I4(h_cntr_reg[4]),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \h_cntr[5]_i_1 
       (.I0(h_cntr_reg[5]),
        .I1(h_cntr_reg[2]),
        .I2(h_cntr_reg[0]),
        .I3(h_cntr_reg[1]),
        .I4(h_cntr_reg[3]),
        .I5(h_cntr_reg[4]),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \h_cntr[6]_i_1 
       (.I0(h_cntr_reg[6]),
        .I1(h_cntr_reg[5]),
        .I2(\h_cntr[9]_i_2_n_0 ),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \h_cntr[7]_i_1 
       (.I0(h_cntr_reg[7]),
        .I1(h_cntr_reg[6]),
        .I2(h_cntr_reg[5]),
        .I3(\h_cntr[9]_i_2_n_0 ),
        .O(\h_cntr[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \h_cntr[8]_i_1 
       (.I0(h_cntr_reg[8]),
        .I1(\h_cntr[9]_i_2_n_0 ),
        .I2(h_cntr_reg[5]),
        .I3(h_cntr_reg[6]),
        .I4(h_cntr_reg[7]),
        .O(p_0_in[8]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \h_cntr[9]_i_1 
       (.I0(h_cntr_reg[9]),
        .I1(h_cntr_reg[7]),
        .I2(h_cntr_reg[6]),
        .I3(h_cntr_reg[5]),
        .I4(\h_cntr[9]_i_2_n_0 ),
        .I5(h_cntr_reg[8]),
        .O(p_0_in[9]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \h_cntr[9]_i_2 
       (.I0(h_cntr_reg[4]),
        .I1(h_cntr_reg[3]),
        .I2(h_cntr_reg[1]),
        .I3(h_cntr_reg[0]),
        .I4(h_cntr_reg[2]),
        .O(\h_cntr[9]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_cntr_reg[0] 
       (.C(clk40M_BUFG),
        .CE(1'b1),
        .D(\h_cntr[0]_i_1_n_0 ),
        .Q(h_cntr_reg[0]),
        .R(\h_cntr[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_cntr_reg[10] 
       (.C(clk40M_BUFG),
        .CE(1'b1),
        .D(p_0_in[10]),
        .Q(h_cntr_reg[10]),
        .R(\h_cntr[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_cntr_reg[1] 
       (.C(clk40M_BUFG),
        .CE(1'b1),
        .D(p_0_in[1]),
        .Q(h_cntr_reg[1]),
        .R(\h_cntr[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_cntr_reg[2] 
       (.C(clk40M_BUFG),
        .CE(1'b1),
        .D(p_0_in[2]),
        .Q(h_cntr_reg[2]),
        .R(\h_cntr[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_cntr_reg[3] 
       (.C(clk40M_BUFG),
        .CE(1'b1),
        .D(\h_cntr[3]_i_1_n_0 ),
        .Q(h_cntr_reg[3]),
        .R(\h_cntr[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_cntr_reg[4] 
       (.C(clk40M_BUFG),
        .CE(1'b1),
        .D(p_0_in[4]),
        .Q(h_cntr_reg[4]),
        .R(\h_cntr[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_cntr_reg[5] 
       (.C(clk40M_BUFG),
        .CE(1'b1),
        .D(p_0_in[5]),
        .Q(h_cntr_reg[5]),
        .R(\h_cntr[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_cntr_reg[6] 
       (.C(clk40M_BUFG),
        .CE(1'b1),
        .D(p_0_in[6]),
        .Q(h_cntr_reg[6]),
        .R(\h_cntr[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_cntr_reg[7] 
       (.C(clk40M_BUFG),
        .CE(1'b1),
        .D(\h_cntr[7]_i_1_n_0 ),
        .Q(h_cntr_reg[7]),
        .R(\h_cntr[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_cntr_reg[8] 
       (.C(clk40M_BUFG),
        .CE(1'b1),
        .D(p_0_in[8]),
        .Q(h_cntr_reg[8]),
        .R(\h_cntr[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_cntr_reg[9] 
       (.C(clk40M_BUFG),
        .CE(1'b1),
        .D(p_0_in[9]),
        .Q(h_cntr_reg[9]),
        .R(\h_cntr[10]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00400000)) 
    h_sync_i_1
       (.I0(h_sync_i_2_n_0),
        .I1(h_cntr_reg[8]),
        .I2(h_cntr_reg[9]),
        .I3(h_cntr_reg[10]),
        .I4(led_r_OBUF),
        .O(h_sync_i_1_n_0));
  LUT5 #(
    .INIT(32'hAAA95555)) 
    h_sync_i_2
       (.I0(h_cntr_reg[7]),
        .I1(h_cntr_reg[3]),
        .I2(h_cntr_reg[5]),
        .I3(h_cntr_reg[4]),
        .I4(h_cntr_reg[6]),
        .O(h_sync_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    h_sync_reg
       (.C(clk40M_BUFG),
        .CE(1'b1),
        .D(h_sync_i_1_n_0),
        .Q(h_sync),
        .R(1'b0));
  hdmi_tx hdmi_tx_0
       (.hdmi_tx_clk_n(hdmi_tx_clk_n),
        .hdmi_tx_clk_p(hdmi_tx_clk_p),
        .hdmi_tx_d0_n(hdmi_tx_d0_n),
        .hdmi_tx_d0_p(hdmi_tx_d0_p),
        .hdmi_tx_d1_n(hdmi_tx_d1_n),
        .hdmi_tx_d1_p(hdmi_tx_d1_p),
        .hdmi_tx_d2_n(hdmi_tx_d2_n),
        .hdmi_tx_d2_p(hdmi_tx_d2_p),
        .rst(rst),
        .tx_blue({red,red,red,red,red,red,red,red}),
        .tx_clk(clk40M_BUFG),
        .tx_clk_5x(clk200M_BUFG),
        .tx_dv(vde),
        .tx_green({red,red,red,red,red,red,red,red}),
        .tx_hs(h_sync),
        .tx_red({red,red,red,red,red,red,red,red}),
        .tx_vs(v_sync));
  LUT1 #(
    .INIT(2'h1)) 
    hdmi_tx_0_i_1
       (.I0(led_r_OBUF),
        .O(rst));
  OBUF \led_r_OBUF[0]_inst 
       (.I(1'b0),
        .O(led_r[0]));
  OBUF \led_r_OBUF[1]_inst 
       (.I(1'b0),
        .O(led_r[1]));
  OBUF \led_r_OBUF[2]_inst 
       (.I(1'b0),
        .O(led_r[2]));
  OBUF \led_r_OBUF[3]_inst 
       (.I(1'b0),
        .O(led_r[3]));
  OBUF \led_r_OBUF[4]_inst 
       (.I(1'b0),
        .O(led_r[4]));
  OBUF \led_r_OBUF[5]_inst 
       (.I(1'b0),
        .O(led_r[5]));
  OBUF \led_r_OBUF[6]_inst 
       (.I(1'b0),
        .O(led_r[6]));
  OBUF \led_r_OBUF[7]_inst 
       (.I(led_r_OBUF),
        .O(led_r[7]));
  LUT2 #(
    .INIT(4'h2)) 
    \red[0]_i_1 
       (.I0(display_ram_n_0),
        .I1(v_cntr_reg[9]),
        .O(\red[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \red[0]_i_4 
       (.I0(h_cntr_reg[9]),
        .I1(h_cntr_reg[8]),
        .O(\red[0]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \red_reg[0] 
       (.C(clk40M_BUFG),
        .CE(1'b1),
        .D(\red[0]_i_1_n_0 ),
        .Q(red),
        .R(1'b0));
  IBUF rstbt_IBUF_inst
       (.I(rstbt),
        .O(rstbt_IBUF));
  spec_anal_top_level spec_anal
       (.CLK(clk40M_BUFG),
        .D(codec_sdout_IBUF),
        .DOBDO(frm_dout),
        .Q(display_ram_write_addr_reg),
        .S(codec_sclk_OBUF),
        .SR(\display_ram_write_addr[9]_i_1_n_0 ),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG),
        .codec_lrclk_OBUF(codec_lrclk_OBUF),
        .codec_mclk_OBUF(codec_mclk_OBUF),
        .codec_rstn_OBUF(codec_rstn_OBUF),
        .display_ram_we(display_ram_we),
        .display_ram_we_reg(v_sync_i_3_n_0),
        .display_ram_we_reg_0(display_ram_we_i_2_n_0),
        .frm_dout_vld_reg_reg(spec_anal_n_28),
        .rstbt_IBUF(rstbt_IBUF),
        .\write_cntr_reg[1] (fft_start_reg_n_0));
  IBUF \sw_IBUF[0]_inst 
       (.I(sw[0]),
        .O(vol_ud_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \v_cntr[0]_i_1 
       (.I0(v_cntr_reg[0]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \v_cntr[1]_i_1 
       (.I0(v_cntr_reg[0]),
        .I1(v_cntr_reg[1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \v_cntr[2]_i_1 
       (.I0(v_cntr_reg[2]),
        .I1(v_cntr_reg[0]),
        .I2(v_cntr_reg[1]),
        .O(p_0_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \v_cntr[3]_i_1 
       (.I0(v_cntr_reg[3]),
        .I1(v_cntr_reg[1]),
        .I2(v_cntr_reg[0]),
        .I3(v_cntr_reg[2]),
        .O(p_0_in__0[3]));
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \v_cntr[4]_i_1 
       (.I0(v_cntr_reg[4]),
        .I1(v_cntr_reg[2]),
        .I2(v_cntr_reg[0]),
        .I3(v_cntr_reg[1]),
        .I4(v_cntr_reg[3]),
        .O(p_0_in__0[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \v_cntr[5]_i_1 
       (.I0(v_cntr_reg[5]),
        .I1(v_cntr_reg[4]),
        .I2(v_cntr_reg[2]),
        .I3(v_cntr_reg[0]),
        .I4(v_cntr_reg[1]),
        .I5(v_cntr_reg[3]),
        .O(\v_cntr[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hB4)) 
    \v_cntr[6]_i_1 
       (.I0(\v_cntr[9]_i_7_n_0 ),
        .I1(v_cntr_reg[5]),
        .I2(v_cntr_reg[6]),
        .O(p_0_in__0[6]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT4 #(
    .INIT(16'h9AAA)) 
    \v_cntr[7]_i_1 
       (.I0(v_cntr_reg[7]),
        .I1(\v_cntr[9]_i_7_n_0 ),
        .I2(v_cntr_reg[5]),
        .I3(v_cntr_reg[6]),
        .O(p_0_in__0[7]));
  LUT5 #(
    .INIT(32'h9AAAAAAA)) 
    \v_cntr[8]_i_1 
       (.I0(v_cntr_reg[8]),
        .I1(\v_cntr[9]_i_7_n_0 ),
        .I2(v_cntr_reg[6]),
        .I3(v_cntr_reg[5]),
        .I4(v_cntr_reg[7]),
        .O(p_0_in__0[8]));
  LUT6 #(
    .INIT(64'h00010000FFFFFFFF)) 
    \v_cntr[9]_i_1 
       (.I0(v_cntr_reg[2]),
        .I1(v_cntr_reg[3]),
        .I2(\v_cntr[9]_i_4_n_0 ),
        .I3(\v_cntr[9]_i_5_n_0 ),
        .I4(v_cntr),
        .I5(led_r_OBUF),
        .O(\v_cntr[9]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000008)) 
    \v_cntr[9]_i_2 
       (.I0(\h_cntr[9]_i_2_n_0 ),
        .I1(h_cntr_reg[10]),
        .I2(h_cntr_reg[8]),
        .I3(h_cntr_reg[9]),
        .I4(\v_cntr[9]_i_6_n_0 ),
        .O(v_cntr));
  LUT6 #(
    .INIT(64'hAAAA6AAAAAAAAAAA)) 
    \v_cntr[9]_i_3 
       (.I0(v_cntr_reg[9]),
        .I1(v_cntr_reg[7]),
        .I2(v_cntr_reg[5]),
        .I3(v_cntr_reg[6]),
        .I4(\v_cntr[9]_i_7_n_0 ),
        .I5(v_cntr_reg[8]),
        .O(p_0_in__0[9]));
  LUT2 #(
    .INIT(4'h7)) 
    \v_cntr[9]_i_4 
       (.I0(v_cntr_reg[4]),
        .I1(v_cntr_reg[9]),
        .O(\v_cntr[9]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hEFFFFFFFFFFFFFFF)) 
    \v_cntr[9]_i_5 
       (.I0(v_cntr_reg[7]),
        .I1(v_cntr_reg[8]),
        .I2(v_cntr_reg[5]),
        .I3(v_cntr_reg[6]),
        .I4(v_cntr_reg[0]),
        .I5(v_cntr_reg[1]),
        .O(\v_cntr[9]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \v_cntr[9]_i_6 
       (.I0(h_cntr_reg[5]),
        .I1(h_cntr_reg[6]),
        .I2(h_cntr_reg[7]),
        .O(\v_cntr[9]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \v_cntr[9]_i_7 
       (.I0(v_cntr_reg[3]),
        .I1(v_cntr_reg[1]),
        .I2(v_cntr_reg[0]),
        .I3(v_cntr_reg[2]),
        .I4(v_cntr_reg[4]),
        .O(\v_cntr[9]_i_7_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \v_cntr_reg[0] 
       (.C(clk40M_BUFG),
        .CE(v_cntr),
        .D(p_0_in__0[0]),
        .Q(v_cntr_reg[0]),
        .R(\v_cntr[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \v_cntr_reg[1] 
       (.C(clk40M_BUFG),
        .CE(v_cntr),
        .D(p_0_in__0[1]),
        .Q(v_cntr_reg[1]),
        .R(\v_cntr[9]_i_1_n_0 ));
  (* PHYS_OPT_MODIFIED = "PLACEMENT_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \v_cntr_reg[2] 
       (.C(clk40M_BUFG),
        .CE(v_cntr),
        .D(p_0_in__0[2]),
        .Q(v_cntr_reg[2]),
        .R(\v_cntr[9]_i_1_n_0 ));
  (* PHYS_OPT_MODIFIED = "PLACEMENT_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \v_cntr_reg[3] 
       (.C(clk40M_BUFG),
        .CE(v_cntr),
        .D(p_0_in__0[3]),
        .Q(v_cntr_reg[3]),
        .R(\v_cntr[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \v_cntr_reg[4] 
       (.C(clk40M_BUFG),
        .CE(v_cntr),
        .D(p_0_in__0[4]),
        .Q(v_cntr_reg[4]),
        .R(\v_cntr[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \v_cntr_reg[5] 
       (.C(clk40M_BUFG),
        .CE(v_cntr),
        .D(\v_cntr[5]_i_1_n_0 ),
        .Q(v_cntr_reg[5]),
        .R(\v_cntr[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \v_cntr_reg[6] 
       (.C(clk40M_BUFG),
        .CE(v_cntr),
        .D(p_0_in__0[6]),
        .Q(v_cntr_reg[6]),
        .R(\v_cntr[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \v_cntr_reg[7] 
       (.C(clk40M_BUFG),
        .CE(v_cntr),
        .D(p_0_in__0[7]),
        .Q(v_cntr_reg[7]),
        .R(\v_cntr[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \v_cntr_reg[8] 
       (.C(clk40M_BUFG),
        .CE(v_cntr),
        .D(p_0_in__0[8]),
        .Q(v_cntr_reg[8]),
        .R(\v_cntr[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \v_cntr_reg[9] 
       (.C(clk40M_BUFG),
        .CE(v_cntr),
        .D(p_0_in__0[9]),
        .Q(v_cntr_reg[9]),
        .R(\v_cntr[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h222A000000000000)) 
    v_sync_i_1
       (.I0(v_sync_i_2_n_0),
        .I1(v_cntr_reg[2]),
        .I2(v_cntr_reg[0]),
        .I3(v_cntr_reg[1]),
        .I4(v_sync_i_3_n_0),
        .I5(led_r_OBUF),
        .O(v_sync_i_1_n_0));
  LUT4 #(
    .INIT(16'h0111)) 
    v_sync_i_2
       (.I0(v_cntr_reg[7]),
        .I1(v_cntr_reg[8]),
        .I2(v_cntr_reg[6]),
        .I3(v_cntr_reg[5]),
        .O(v_sync_i_2_n_0));
  LUT6 #(
    .INIT(64'h5555555555555554)) 
    v_sync_i_3
       (.I0(vde_i_2_n_0),
        .I1(v_cntr_reg[2]),
        .I2(v_cntr_reg[1]),
        .I3(v_cntr_reg[0]),
        .I4(\display_ram_write_addr[9]_i_5_n_0 ),
        .I5(v_cntr_reg[5]),
        .O(v_sync_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    v_sync_reg
       (.C(clk40M_BUFG),
        .CE(1'b1),
        .D(v_sync_i_1_n_0),
        .Q(v_sync),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h1555000000000000)) 
    vde_i_1
       (.I0(h_cntr_reg[10]),
        .I1(h_cntr_reg[9]),
        .I2(h_cntr_reg[8]),
        .I3(\v_cntr[9]_i_6_n_0 ),
        .I4(vde_i_2_n_0),
        .I5(led_r_OBUF),
        .O(vde_i_1_n_0));
  LUT6 #(
    .INIT(64'h000F070FFFFFFFFF)) 
    vde_i_2
       (.I0(v_cntr_reg[3]),
        .I1(v_cntr_reg[4]),
        .I2(\display_ram_write_addr[9]_i_5_n_0 ),
        .I3(v_cntr_reg[6]),
        .I4(v_cntr_reg[5]),
        .I5(v_cntr_reg[9]),
        .O(vde_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    vde_reg
       (.C(clk40M_BUFG),
        .CE(1'b1),
        .D(vde_i_1_n_0),
        .Q(vde),
        .R(1'b0));
  OBUF vol_clk_OBUF_inst
       (.I(vol_clk_OBUF),
        .O(vol_clk));
  OBUF vol_ud_OBUF_inst
       (.I(vol_ud_OBUF),
        .O(vol_ud));
endmodule

module hdmi_tx
   (hdmi_tx_clk_n,
    hdmi_tx_clk_p,
    hdmi_tx_d0_n,
    hdmi_tx_d0_p,
    hdmi_tx_d1_n,
    hdmi_tx_d1_p,
    hdmi_tx_d2_n,
    hdmi_tx_d2_p,
    rst,
    tx_clk,
    tx_clk_5x,
    tx_dv,
    tx_hs,
    tx_vs,
    tx_blue,
    tx_green,
    tx_red);
  output hdmi_tx_clk_n;
  output hdmi_tx_clk_p;
  output hdmi_tx_d0_n;
  output hdmi_tx_d0_p;
  output hdmi_tx_d1_n;
  output hdmi_tx_d1_p;
  output hdmi_tx_d2_n;
  output hdmi_tx_d2_p;
  input rst;
  input tx_clk;
  input tx_clk_5x;
  input tx_dv;
  input tx_hs;
  input tx_vs;
  input [7:0]tx_blue;
  input [7:0]tx_green;
  input [7:0]tx_red;

  wire hdmi_tx_clk_n;
  wire hdmi_tx_clk_p;
  wire hdmi_tx_d0_n;
  wire hdmi_tx_d0_p;
  wire hdmi_tx_d1_n;
  wire hdmi_tx_d1_p;
  wire hdmi_tx_d2_n;
  wire hdmi_tx_d2_p;
  wire rst;
  wire [7:0]tx_blue;
  wire tx_clk;
  wire tx_clk_5x;
  wire tx_dv;
  wire [7:0]tx_green;
  wire tx_hs;
  wire [7:0]tx_red;
  wire tx_vs;

  tmds_transmitter tmds_transmitter
       (.D({tx_vs,tx_hs}),
        .hdmi_tx_clk_n(hdmi_tx_clk_n),
        .hdmi_tx_clk_p(hdmi_tx_clk_p),
        .hdmi_tx_d0_n(hdmi_tx_d0_n),
        .hdmi_tx_d0_p(hdmi_tx_d0_p),
        .hdmi_tx_d1_n(hdmi_tx_d1_n),
        .hdmi_tx_d1_p(hdmi_tx_d1_p),
        .hdmi_tx_d2_n(hdmi_tx_d2_n),
        .hdmi_tx_d2_p(hdmi_tx_d2_p),
        .rst(rst),
        .tx_blue(tx_blue),
        .tx_clk(tx_clk),
        .tx_clk_5x(tx_clk_5x),
        .tx_dv(tx_dv),
        .tx_green(tx_green),
        .tx_red(tx_red));
endmodule

module mul_24x24
   (im_sq,
    clk100M_IBUF_BUFG,
    DOBDO);
  output [35:0]im_sq;
  input clk100M_IBUF_BUFG;
  input [23:0]DOBDO;

  wire [23:0]DOBDO;
  wire DSP_LS_n_0;
  wire DSP_LS_n_1;
  wire DSP_LS_n_10;
  wire DSP_LS_n_11;
  wire DSP_LS_n_12;
  wire DSP_LS_n_13;
  wire DSP_LS_n_14;
  wire DSP_LS_n_15;
  wire DSP_LS_n_16;
  wire DSP_LS_n_17;
  wire DSP_LS_n_18;
  wire DSP_LS_n_19;
  wire DSP_LS_n_2;
  wire DSP_LS_n_20;
  wire DSP_LS_n_21;
  wire DSP_LS_n_22;
  wire DSP_LS_n_23;
  wire DSP_LS_n_24;
  wire DSP_LS_n_25;
  wire DSP_LS_n_26;
  wire DSP_LS_n_27;
  wire DSP_LS_n_28;
  wire DSP_LS_n_29;
  wire DSP_LS_n_3;
  wire DSP_LS_n_30;
  wire DSP_LS_n_31;
  wire DSP_LS_n_32;
  wire DSP_LS_n_33;
  wire DSP_LS_n_34;
  wire DSP_LS_n_35;
  wire DSP_LS_n_36;
  wire DSP_LS_n_37;
  wire DSP_LS_n_38;
  wire DSP_LS_n_39;
  wire DSP_LS_n_4;
  wire DSP_LS_n_40;
  wire DSP_LS_n_41;
  wire DSP_LS_n_42;
  wire DSP_LS_n_43;
  wire DSP_LS_n_44;
  wire DSP_LS_n_45;
  wire DSP_LS_n_46;
  wire DSP_LS_n_47;
  wire DSP_LS_n_48;
  wire DSP_LS_n_49;
  wire DSP_LS_n_5;
  wire DSP_LS_n_50;
  wire DSP_LS_n_51;
  wire DSP_LS_n_52;
  wire DSP_LS_n_53;
  wire DSP_LS_n_54;
  wire DSP_LS_n_55;
  wire DSP_LS_n_56;
  wire DSP_LS_n_57;
  wire DSP_LS_n_58;
  wire DSP_LS_n_59;
  wire DSP_LS_n_6;
  wire DSP_LS_n_60;
  wire DSP_LS_n_61;
  wire DSP_LS_n_62;
  wire DSP_LS_n_63;
  wire DSP_LS_n_64;
  wire DSP_LS_n_7;
  wire DSP_LS_n_8;
  wire DSP_LS_n_9;
  wire clk100M_IBUF_BUFG;
  wire [35:0]im_sq;

  dsp_25x18__parameterized1_17 DSP_LS
       (.D({DSP_LS_n_0,DSP_LS_n_1,DSP_LS_n_2,DSP_LS_n_3,DSP_LS_n_4,DSP_LS_n_5,DSP_LS_n_6,DSP_LS_n_7,DSP_LS_n_8,DSP_LS_n_9,DSP_LS_n_10,DSP_LS_n_11,DSP_LS_n_12,DSP_LS_n_13,DSP_LS_n_14,DSP_LS_n_15,DSP_LS_n_16}),
        .DOBDO(DOBDO),
        .PCOUT({DSP_LS_n_17,DSP_LS_n_18,DSP_LS_n_19,DSP_LS_n_20,DSP_LS_n_21,DSP_LS_n_22,DSP_LS_n_23,DSP_LS_n_24,DSP_LS_n_25,DSP_LS_n_26,DSP_LS_n_27,DSP_LS_n_28,DSP_LS_n_29,DSP_LS_n_30,DSP_LS_n_31,DSP_LS_n_32,DSP_LS_n_33,DSP_LS_n_34,DSP_LS_n_35,DSP_LS_n_36,DSP_LS_n_37,DSP_LS_n_38,DSP_LS_n_39,DSP_LS_n_40,DSP_LS_n_41,DSP_LS_n_42,DSP_LS_n_43,DSP_LS_n_44,DSP_LS_n_45,DSP_LS_n_46,DSP_LS_n_47,DSP_LS_n_48,DSP_LS_n_49,DSP_LS_n_50,DSP_LS_n_51,DSP_LS_n_52,DSP_LS_n_53,DSP_LS_n_54,DSP_LS_n_55,DSP_LS_n_56,DSP_LS_n_57,DSP_LS_n_58,DSP_LS_n_59,DSP_LS_n_60,DSP_LS_n_61,DSP_LS_n_62,DSP_LS_n_63,DSP_LS_n_64}),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG));
  dsp_25x18__parameterized2_18 DSP_MS
       (.DOBDO(DOBDO),
        .PCOUT({DSP_LS_n_17,DSP_LS_n_18,DSP_LS_n_19,DSP_LS_n_20,DSP_LS_n_21,DSP_LS_n_22,DSP_LS_n_23,DSP_LS_n_24,DSP_LS_n_25,DSP_LS_n_26,DSP_LS_n_27,DSP_LS_n_28,DSP_LS_n_29,DSP_LS_n_30,DSP_LS_n_31,DSP_LS_n_32,DSP_LS_n_33,DSP_LS_n_34,DSP_LS_n_35,DSP_LS_n_36,DSP_LS_n_37,DSP_LS_n_38,DSP_LS_n_39,DSP_LS_n_40,DSP_LS_n_41,DSP_LS_n_42,DSP_LS_n_43,DSP_LS_n_44,DSP_LS_n_45,DSP_LS_n_46,DSP_LS_n_47,DSP_LS_n_48,DSP_LS_n_49,DSP_LS_n_50,DSP_LS_n_51,DSP_LS_n_52,DSP_LS_n_53,DSP_LS_n_54,DSP_LS_n_55,DSP_LS_n_56,DSP_LS_n_57,DSP_LS_n_58,DSP_LS_n_59,DSP_LS_n_60,DSP_LS_n_61,DSP_LS_n_62,DSP_LS_n_63,DSP_LS_n_64}),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG),
        .im_sq(im_sq[35:17]));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[0] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_16),
        .Q(im_sq[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[10] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_6),
        .Q(im_sq[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[11] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_5),
        .Q(im_sq[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[12] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_4),
        .Q(im_sq[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[13] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_3),
        .Q(im_sq[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[14] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_2),
        .Q(im_sq[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[15] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_1),
        .Q(im_sq[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[16] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_0),
        .Q(im_sq[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_15),
        .Q(im_sq[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[2] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_14),
        .Q(im_sq[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[3] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_13),
        .Q(im_sq[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[4] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_12),
        .Q(im_sq[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[5] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_11),
        .Q(im_sq[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[6] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_10),
        .Q(im_sq[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[7] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_9),
        .Q(im_sq[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[8] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_8),
        .Q(im_sq[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[9] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_7),
        .Q(im_sq[9]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "mul_24x24" *) 
module mul_24x24_15
   (re_sq,
    clk100M_IBUF_BUFG,
    p_reg_reg);
  output [35:0]re_sq;
  input clk100M_IBUF_BUFG;
  input [23:0]p_reg_reg;

  wire DSP_LS_n_0;
  wire DSP_LS_n_1;
  wire DSP_LS_n_10;
  wire DSP_LS_n_11;
  wire DSP_LS_n_12;
  wire DSP_LS_n_13;
  wire DSP_LS_n_14;
  wire DSP_LS_n_15;
  wire DSP_LS_n_16;
  wire DSP_LS_n_17;
  wire DSP_LS_n_18;
  wire DSP_LS_n_19;
  wire DSP_LS_n_2;
  wire DSP_LS_n_20;
  wire DSP_LS_n_21;
  wire DSP_LS_n_22;
  wire DSP_LS_n_23;
  wire DSP_LS_n_24;
  wire DSP_LS_n_25;
  wire DSP_LS_n_26;
  wire DSP_LS_n_27;
  wire DSP_LS_n_28;
  wire DSP_LS_n_29;
  wire DSP_LS_n_3;
  wire DSP_LS_n_30;
  wire DSP_LS_n_31;
  wire DSP_LS_n_32;
  wire DSP_LS_n_33;
  wire DSP_LS_n_34;
  wire DSP_LS_n_35;
  wire DSP_LS_n_36;
  wire DSP_LS_n_37;
  wire DSP_LS_n_38;
  wire DSP_LS_n_39;
  wire DSP_LS_n_4;
  wire DSP_LS_n_40;
  wire DSP_LS_n_41;
  wire DSP_LS_n_42;
  wire DSP_LS_n_43;
  wire DSP_LS_n_44;
  wire DSP_LS_n_45;
  wire DSP_LS_n_46;
  wire DSP_LS_n_47;
  wire DSP_LS_n_48;
  wire DSP_LS_n_49;
  wire DSP_LS_n_5;
  wire DSP_LS_n_50;
  wire DSP_LS_n_51;
  wire DSP_LS_n_52;
  wire DSP_LS_n_53;
  wire DSP_LS_n_54;
  wire DSP_LS_n_55;
  wire DSP_LS_n_56;
  wire DSP_LS_n_57;
  wire DSP_LS_n_58;
  wire DSP_LS_n_59;
  wire DSP_LS_n_6;
  wire DSP_LS_n_60;
  wire DSP_LS_n_61;
  wire DSP_LS_n_62;
  wire DSP_LS_n_63;
  wire DSP_LS_n_64;
  wire DSP_LS_n_7;
  wire DSP_LS_n_8;
  wire DSP_LS_n_9;
  wire clk100M_IBUF_BUFG;
  wire [23:0]p_reg_reg;
  wire [35:0]re_sq;

  dsp_25x18__parameterized1_16 DSP_LS
       (.D({DSP_LS_n_0,DSP_LS_n_1,DSP_LS_n_2,DSP_LS_n_3,DSP_LS_n_4,DSP_LS_n_5,DSP_LS_n_6,DSP_LS_n_7,DSP_LS_n_8,DSP_LS_n_9,DSP_LS_n_10,DSP_LS_n_11,DSP_LS_n_12,DSP_LS_n_13,DSP_LS_n_14,DSP_LS_n_15,DSP_LS_n_16}),
        .PCOUT({DSP_LS_n_17,DSP_LS_n_18,DSP_LS_n_19,DSP_LS_n_20,DSP_LS_n_21,DSP_LS_n_22,DSP_LS_n_23,DSP_LS_n_24,DSP_LS_n_25,DSP_LS_n_26,DSP_LS_n_27,DSP_LS_n_28,DSP_LS_n_29,DSP_LS_n_30,DSP_LS_n_31,DSP_LS_n_32,DSP_LS_n_33,DSP_LS_n_34,DSP_LS_n_35,DSP_LS_n_36,DSP_LS_n_37,DSP_LS_n_38,DSP_LS_n_39,DSP_LS_n_40,DSP_LS_n_41,DSP_LS_n_42,DSP_LS_n_43,DSP_LS_n_44,DSP_LS_n_45,DSP_LS_n_46,DSP_LS_n_47,DSP_LS_n_48,DSP_LS_n_49,DSP_LS_n_50,DSP_LS_n_51,DSP_LS_n_52,DSP_LS_n_53,DSP_LS_n_54,DSP_LS_n_55,DSP_LS_n_56,DSP_LS_n_57,DSP_LS_n_58,DSP_LS_n_59,DSP_LS_n_60,DSP_LS_n_61,DSP_LS_n_62,DSP_LS_n_63,DSP_LS_n_64}),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG),
        .p_reg_reg_0(p_reg_reg));
  dsp_25x18__parameterized2 DSP_MS
       (.PCOUT({DSP_LS_n_17,DSP_LS_n_18,DSP_LS_n_19,DSP_LS_n_20,DSP_LS_n_21,DSP_LS_n_22,DSP_LS_n_23,DSP_LS_n_24,DSP_LS_n_25,DSP_LS_n_26,DSP_LS_n_27,DSP_LS_n_28,DSP_LS_n_29,DSP_LS_n_30,DSP_LS_n_31,DSP_LS_n_32,DSP_LS_n_33,DSP_LS_n_34,DSP_LS_n_35,DSP_LS_n_36,DSP_LS_n_37,DSP_LS_n_38,DSP_LS_n_39,DSP_LS_n_40,DSP_LS_n_41,DSP_LS_n_42,DSP_LS_n_43,DSP_LS_n_44,DSP_LS_n_45,DSP_LS_n_46,DSP_LS_n_47,DSP_LS_n_48,DSP_LS_n_49,DSP_LS_n_50,DSP_LS_n_51,DSP_LS_n_52,DSP_LS_n_53,DSP_LS_n_54,DSP_LS_n_55,DSP_LS_n_56,DSP_LS_n_57,DSP_LS_n_58,DSP_LS_n_59,DSP_LS_n_60,DSP_LS_n_61,DSP_LS_n_62,DSP_LS_n_63,DSP_LS_n_64}),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG),
        .p_reg_reg_0(p_reg_reg),
        .re_sq(re_sq[35:17]));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[0] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_16),
        .Q(re_sq[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[10] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_6),
        .Q(re_sq[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[11] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_5),
        .Q(re_sq[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[12] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_4),
        .Q(re_sq[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[13] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_3),
        .Q(re_sq[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[14] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_2),
        .Q(re_sq[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[15] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_1),
        .Q(re_sq[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[16] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_0),
        .Q(re_sq[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[1] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_15),
        .Q(re_sq[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[2] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_14),
        .Q(re_sq[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[3] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_13),
        .Q(re_sq[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[4] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_12),
        .Q(re_sq[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[5] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_11),
        .Q(re_sq[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[6] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_10),
        .Q(re_sq[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[7] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_9),
        .Q(re_sq[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[8] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_8),
        .Q(re_sq[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \po_0_dl_reg[9] 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .D(DSP_LS_n_7),
        .Q(re_sq[9]),
        .R(1'b0));
endmodule

module oserdes_10to1
   (hdmi_tx_d0_n,
    hdmi_tx_d0_p,
    rst,
    tx_clk,
    tx_clk_5x,
    data_in);
  output hdmi_tx_d0_n;
  output hdmi_tx_d0_p;
  input rst;
  input tx_clk;
  input tx_clk_5x;
  input [9:0]data_in;

  wire [9:0]data_in;
  wire data_to_iob;
  wire hdmi_tx_d0_n;
  wire hdmi_tx_d0_p;
  wire master_shiftin1;
  wire master_shiftin2;
  wire rst;
  wire tx_clk;
  wire tx_clk_5x;
  wire NLW_master_oserdes_OFB_UNCONNECTED;
  wire NLW_master_oserdes_SHIFTOUT1_UNCONNECTED;
  wire NLW_master_oserdes_SHIFTOUT2_UNCONNECTED;
  wire NLW_master_oserdes_TBYTEOUT_UNCONNECTED;
  wire NLW_master_oserdes_TFB_UNCONNECTED;
  wire NLW_master_oserdes_TQ_UNCONNECTED;
  wire NLW_slave_oserdes_OFB_UNCONNECTED;
  wire NLW_slave_oserdes_OQ_UNCONNECTED;
  wire NLW_slave_oserdes_TBYTEOUT_UNCONNECTED;
  wire NLW_slave_oserdes_TFB_UNCONNECTED;
  wire NLW_slave_oserdes_TQ_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  OSERDESE2 #(
    .DATA_RATE_OQ("DDR"),
    .DATA_RATE_TQ("DDR"),
    .DATA_WIDTH(10),
    .INIT_OQ(1'b0),
    .INIT_TQ(1'b0),
    .IS_CLKDIV_INVERTED(1'b0),
    .IS_CLK_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .IS_D3_INVERTED(1'b0),
    .IS_D4_INVERTED(1'b0),
    .IS_D5_INVERTED(1'b0),
    .IS_D6_INVERTED(1'b0),
    .IS_D7_INVERTED(1'b0),
    .IS_D8_INVERTED(1'b0),
    .IS_T1_INVERTED(1'b0),
    .IS_T2_INVERTED(1'b0),
    .IS_T3_INVERTED(1'b0),
    .IS_T4_INVERTED(1'b0),
    .SERDES_MODE("MASTER"),
    .SRVAL_OQ(1'b0),
    .SRVAL_TQ(1'b0),
    .TBYTE_CTL("FALSE"),
    .TBYTE_SRC("FALSE"),
    .TRISTATE_WIDTH(1)) 
    master_oserdes
       (.CLK(tx_clk_5x),
        .CLKDIV(tx_clk),
        .D1(data_in[0]),
        .D2(data_in[1]),
        .D3(data_in[2]),
        .D4(data_in[3]),
        .D5(data_in[4]),
        .D6(data_in[5]),
        .D7(data_in[6]),
        .D8(data_in[7]),
        .OCE(1'b1),
        .OFB(NLW_master_oserdes_OFB_UNCONNECTED),
        .OQ(data_to_iob),
        .RST(rst),
        .SHIFTIN1(master_shiftin1),
        .SHIFTIN2(master_shiftin2),
        .SHIFTOUT1(NLW_master_oserdes_SHIFTOUT1_UNCONNECTED),
        .SHIFTOUT2(NLW_master_oserdes_SHIFTOUT2_UNCONNECTED),
        .T1(1'b0),
        .T2(1'b0),
        .T3(1'b0),
        .T4(1'b0),
        .TBYTEIN(1'b0),
        .TBYTEOUT(NLW_master_oserdes_TBYTEOUT_UNCONNECTED),
        .TCE(1'b0),
        .TFB(NLW_master_oserdes_TFB_UNCONNECTED),
        .TQ(NLW_master_oserdes_TQ_UNCONNECTED));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFDS output_buffer
       (.I(data_to_iob),
        .O(hdmi_tx_d0_p),
        .OB(hdmi_tx_d0_n));
  (* BOX_TYPE = "PRIMITIVE" *) 
  OSERDESE2 #(
    .DATA_RATE_OQ("DDR"),
    .DATA_RATE_TQ("DDR"),
    .DATA_WIDTH(10),
    .INIT_OQ(1'b0),
    .INIT_TQ(1'b0),
    .IS_CLKDIV_INVERTED(1'b0),
    .IS_CLK_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .IS_D3_INVERTED(1'b0),
    .IS_D4_INVERTED(1'b0),
    .IS_D5_INVERTED(1'b0),
    .IS_D6_INVERTED(1'b0),
    .IS_D7_INVERTED(1'b0),
    .IS_D8_INVERTED(1'b0),
    .IS_T1_INVERTED(1'b0),
    .IS_T2_INVERTED(1'b0),
    .IS_T3_INVERTED(1'b0),
    .IS_T4_INVERTED(1'b0),
    .SERDES_MODE("SLAVE"),
    .SRVAL_OQ(1'b0),
    .SRVAL_TQ(1'b0),
    .TBYTE_CTL("FALSE"),
    .TBYTE_SRC("FALSE"),
    .TRISTATE_WIDTH(1)) 
    slave_oserdes
       (.CLK(tx_clk_5x),
        .CLKDIV(tx_clk),
        .D1(1'b0),
        .D2(1'b0),
        .D3(data_in[8]),
        .D4(data_in[9]),
        .D5(1'b0),
        .D6(1'b0),
        .D7(1'b0),
        .D8(1'b0),
        .OCE(1'b1),
        .OFB(NLW_slave_oserdes_OFB_UNCONNECTED),
        .OQ(NLW_slave_oserdes_OQ_UNCONNECTED),
        .RST(rst),
        .SHIFTIN1(1'b0),
        .SHIFTIN2(1'b0),
        .SHIFTOUT1(master_shiftin1),
        .SHIFTOUT2(master_shiftin2),
        .T1(1'b0),
        .T2(1'b0),
        .T3(1'b0),
        .T4(1'b0),
        .TBYTEIN(1'b0),
        .TBYTEOUT(NLW_slave_oserdes_TBYTEOUT_UNCONNECTED),
        .TCE(1'b0),
        .TFB(NLW_slave_oserdes_TFB_UNCONNECTED),
        .TQ(NLW_slave_oserdes_TQ_UNCONNECTED));
endmodule

(* ORIG_REF_NAME = "oserdes_10to1" *) 
module oserdes_10to1_2
   (hdmi_tx_d1_n,
    hdmi_tx_d1_p,
    rst,
    tx_clk,
    tx_clk_5x,
    data_in);
  output hdmi_tx_d1_n;
  output hdmi_tx_d1_p;
  input rst;
  input tx_clk;
  input tx_clk_5x;
  input [9:0]data_in;

  wire [9:0]data_in;
  wire data_to_iob;
  wire hdmi_tx_d1_n;
  wire hdmi_tx_d1_p;
  wire master_shiftin1;
  wire master_shiftin2;
  wire rst;
  wire tx_clk;
  wire tx_clk_5x;
  wire NLW_master_oserdes_OFB_UNCONNECTED;
  wire NLW_master_oserdes_SHIFTOUT1_UNCONNECTED;
  wire NLW_master_oserdes_SHIFTOUT2_UNCONNECTED;
  wire NLW_master_oserdes_TBYTEOUT_UNCONNECTED;
  wire NLW_master_oserdes_TFB_UNCONNECTED;
  wire NLW_master_oserdes_TQ_UNCONNECTED;
  wire NLW_slave_oserdes_OFB_UNCONNECTED;
  wire NLW_slave_oserdes_OQ_UNCONNECTED;
  wire NLW_slave_oserdes_TBYTEOUT_UNCONNECTED;
  wire NLW_slave_oserdes_TFB_UNCONNECTED;
  wire NLW_slave_oserdes_TQ_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  OSERDESE2 #(
    .DATA_RATE_OQ("DDR"),
    .DATA_RATE_TQ("DDR"),
    .DATA_WIDTH(10),
    .INIT_OQ(1'b0),
    .INIT_TQ(1'b0),
    .IS_CLKDIV_INVERTED(1'b0),
    .IS_CLK_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .IS_D3_INVERTED(1'b0),
    .IS_D4_INVERTED(1'b0),
    .IS_D5_INVERTED(1'b0),
    .IS_D6_INVERTED(1'b0),
    .IS_D7_INVERTED(1'b0),
    .IS_D8_INVERTED(1'b0),
    .IS_T1_INVERTED(1'b0),
    .IS_T2_INVERTED(1'b0),
    .IS_T3_INVERTED(1'b0),
    .IS_T4_INVERTED(1'b0),
    .SERDES_MODE("MASTER"),
    .SRVAL_OQ(1'b0),
    .SRVAL_TQ(1'b0),
    .TBYTE_CTL("FALSE"),
    .TBYTE_SRC("FALSE"),
    .TRISTATE_WIDTH(1)) 
    master_oserdes
       (.CLK(tx_clk_5x),
        .CLKDIV(tx_clk),
        .D1(data_in[0]),
        .D2(data_in[1]),
        .D3(data_in[2]),
        .D4(data_in[3]),
        .D5(data_in[4]),
        .D6(data_in[5]),
        .D7(data_in[6]),
        .D8(data_in[7]),
        .OCE(1'b1),
        .OFB(NLW_master_oserdes_OFB_UNCONNECTED),
        .OQ(data_to_iob),
        .RST(rst),
        .SHIFTIN1(master_shiftin1),
        .SHIFTIN2(master_shiftin2),
        .SHIFTOUT1(NLW_master_oserdes_SHIFTOUT1_UNCONNECTED),
        .SHIFTOUT2(NLW_master_oserdes_SHIFTOUT2_UNCONNECTED),
        .T1(1'b0),
        .T2(1'b0),
        .T3(1'b0),
        .T4(1'b0),
        .TBYTEIN(1'b0),
        .TBYTEOUT(NLW_master_oserdes_TBYTEOUT_UNCONNECTED),
        .TCE(1'b0),
        .TFB(NLW_master_oserdes_TFB_UNCONNECTED),
        .TQ(NLW_master_oserdes_TQ_UNCONNECTED));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFDS output_buffer
       (.I(data_to_iob),
        .O(hdmi_tx_d1_p),
        .OB(hdmi_tx_d1_n));
  (* BOX_TYPE = "PRIMITIVE" *) 
  OSERDESE2 #(
    .DATA_RATE_OQ("DDR"),
    .DATA_RATE_TQ("DDR"),
    .DATA_WIDTH(10),
    .INIT_OQ(1'b0),
    .INIT_TQ(1'b0),
    .IS_CLKDIV_INVERTED(1'b0),
    .IS_CLK_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .IS_D3_INVERTED(1'b0),
    .IS_D4_INVERTED(1'b0),
    .IS_D5_INVERTED(1'b0),
    .IS_D6_INVERTED(1'b0),
    .IS_D7_INVERTED(1'b0),
    .IS_D8_INVERTED(1'b0),
    .IS_T1_INVERTED(1'b0),
    .IS_T2_INVERTED(1'b0),
    .IS_T3_INVERTED(1'b0),
    .IS_T4_INVERTED(1'b0),
    .SERDES_MODE("SLAVE"),
    .SRVAL_OQ(1'b0),
    .SRVAL_TQ(1'b0),
    .TBYTE_CTL("FALSE"),
    .TBYTE_SRC("FALSE"),
    .TRISTATE_WIDTH(1)) 
    slave_oserdes
       (.CLK(tx_clk_5x),
        .CLKDIV(tx_clk),
        .D1(1'b0),
        .D2(1'b0),
        .D3(data_in[8]),
        .D4(data_in[9]),
        .D5(1'b0),
        .D6(1'b0),
        .D7(1'b0),
        .D8(1'b0),
        .OCE(1'b1),
        .OFB(NLW_slave_oserdes_OFB_UNCONNECTED),
        .OQ(NLW_slave_oserdes_OQ_UNCONNECTED),
        .RST(rst),
        .SHIFTIN1(1'b0),
        .SHIFTIN2(1'b0),
        .SHIFTOUT1(master_shiftin1),
        .SHIFTOUT2(master_shiftin2),
        .T1(1'b0),
        .T2(1'b0),
        .T3(1'b0),
        .T4(1'b0),
        .TBYTEIN(1'b0),
        .TBYTEOUT(NLW_slave_oserdes_TBYTEOUT_UNCONNECTED),
        .TCE(1'b0),
        .TFB(NLW_slave_oserdes_TFB_UNCONNECTED),
        .TQ(NLW_slave_oserdes_TQ_UNCONNECTED));
endmodule

(* ORIG_REF_NAME = "oserdes_10to1" *) 
module oserdes_10to1_3
   (hdmi_tx_d2_n,
    hdmi_tx_d2_p,
    rst,
    tx_clk,
    tx_clk_5x,
    data_in);
  output hdmi_tx_d2_n;
  output hdmi_tx_d2_p;
  input rst;
  input tx_clk;
  input tx_clk_5x;
  input [9:0]data_in;

  wire [9:0]data_in;
  wire data_to_iob;
  wire hdmi_tx_d2_n;
  wire hdmi_tx_d2_p;
  wire master_shiftin1;
  wire master_shiftin2;
  wire rst;
  wire tx_clk;
  wire tx_clk_5x;
  wire NLW_master_oserdes_OFB_UNCONNECTED;
  wire NLW_master_oserdes_SHIFTOUT1_UNCONNECTED;
  wire NLW_master_oserdes_SHIFTOUT2_UNCONNECTED;
  wire NLW_master_oserdes_TBYTEOUT_UNCONNECTED;
  wire NLW_master_oserdes_TFB_UNCONNECTED;
  wire NLW_master_oserdes_TQ_UNCONNECTED;
  wire NLW_slave_oserdes_OFB_UNCONNECTED;
  wire NLW_slave_oserdes_OQ_UNCONNECTED;
  wire NLW_slave_oserdes_TBYTEOUT_UNCONNECTED;
  wire NLW_slave_oserdes_TFB_UNCONNECTED;
  wire NLW_slave_oserdes_TQ_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  OSERDESE2 #(
    .DATA_RATE_OQ("DDR"),
    .DATA_RATE_TQ("DDR"),
    .DATA_WIDTH(10),
    .INIT_OQ(1'b0),
    .INIT_TQ(1'b0),
    .IS_CLKDIV_INVERTED(1'b0),
    .IS_CLK_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .IS_D3_INVERTED(1'b0),
    .IS_D4_INVERTED(1'b0),
    .IS_D5_INVERTED(1'b0),
    .IS_D6_INVERTED(1'b0),
    .IS_D7_INVERTED(1'b0),
    .IS_D8_INVERTED(1'b0),
    .IS_T1_INVERTED(1'b0),
    .IS_T2_INVERTED(1'b0),
    .IS_T3_INVERTED(1'b0),
    .IS_T4_INVERTED(1'b0),
    .SERDES_MODE("MASTER"),
    .SRVAL_OQ(1'b0),
    .SRVAL_TQ(1'b0),
    .TBYTE_CTL("FALSE"),
    .TBYTE_SRC("FALSE"),
    .TRISTATE_WIDTH(1)) 
    master_oserdes
       (.CLK(tx_clk_5x),
        .CLKDIV(tx_clk),
        .D1(data_in[0]),
        .D2(data_in[1]),
        .D3(data_in[2]),
        .D4(data_in[3]),
        .D5(data_in[4]),
        .D6(data_in[5]),
        .D7(data_in[6]),
        .D8(data_in[7]),
        .OCE(1'b1),
        .OFB(NLW_master_oserdes_OFB_UNCONNECTED),
        .OQ(data_to_iob),
        .RST(rst),
        .SHIFTIN1(master_shiftin1),
        .SHIFTIN2(master_shiftin2),
        .SHIFTOUT1(NLW_master_oserdes_SHIFTOUT1_UNCONNECTED),
        .SHIFTOUT2(NLW_master_oserdes_SHIFTOUT2_UNCONNECTED),
        .T1(1'b0),
        .T2(1'b0),
        .T3(1'b0),
        .T4(1'b0),
        .TBYTEIN(1'b0),
        .TBYTEOUT(NLW_master_oserdes_TBYTEOUT_UNCONNECTED),
        .TCE(1'b0),
        .TFB(NLW_master_oserdes_TFB_UNCONNECTED),
        .TQ(NLW_master_oserdes_TQ_UNCONNECTED));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFDS output_buffer
       (.I(data_to_iob),
        .O(hdmi_tx_d2_p),
        .OB(hdmi_tx_d2_n));
  (* BOX_TYPE = "PRIMITIVE" *) 
  OSERDESE2 #(
    .DATA_RATE_OQ("DDR"),
    .DATA_RATE_TQ("DDR"),
    .DATA_WIDTH(10),
    .INIT_OQ(1'b0),
    .INIT_TQ(1'b0),
    .IS_CLKDIV_INVERTED(1'b0),
    .IS_CLK_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .IS_D3_INVERTED(1'b0),
    .IS_D4_INVERTED(1'b0),
    .IS_D5_INVERTED(1'b0),
    .IS_D6_INVERTED(1'b0),
    .IS_D7_INVERTED(1'b0),
    .IS_D8_INVERTED(1'b0),
    .IS_T1_INVERTED(1'b0),
    .IS_T2_INVERTED(1'b0),
    .IS_T3_INVERTED(1'b0),
    .IS_T4_INVERTED(1'b0),
    .SERDES_MODE("SLAVE"),
    .SRVAL_OQ(1'b0),
    .SRVAL_TQ(1'b0),
    .TBYTE_CTL("FALSE"),
    .TBYTE_SRC("FALSE"),
    .TRISTATE_WIDTH(1)) 
    slave_oserdes
       (.CLK(tx_clk_5x),
        .CLKDIV(tx_clk),
        .D1(1'b0),
        .D2(1'b0),
        .D3(data_in[8]),
        .D4(data_in[9]),
        .D5(1'b0),
        .D6(1'b0),
        .D7(1'b0),
        .D8(1'b0),
        .OCE(1'b1),
        .OFB(NLW_slave_oserdes_OFB_UNCONNECTED),
        .OQ(NLW_slave_oserdes_OQ_UNCONNECTED),
        .RST(rst),
        .SHIFTIN1(1'b0),
        .SHIFTIN2(1'b0),
        .SHIFTOUT1(master_shiftin1),
        .SHIFTOUT2(master_shiftin2),
        .T1(1'b0),
        .T2(1'b0),
        .T3(1'b0),
        .T4(1'b0),
        .TBYTEIN(1'b0),
        .TBYTEOUT(NLW_slave_oserdes_TBYTEOUT_UNCONNECTED),
        .TCE(1'b0),
        .TFB(NLW_slave_oserdes_TFB_UNCONNECTED),
        .TQ(NLW_slave_oserdes_TQ_UNCONNECTED));
endmodule

module smpl_ram
   (CO,
    CLK,
    display_ram_we,
    Q,
    ram_array_reg_0,
    DOBDO,
    S,
    \red_reg[0]_i_3_0 ,
    pwropt,
    pwropt_1);
  output [0:0]CO;
  input CLK;
  input display_ram_we;
  input [9:0]Q;
  input [9:0]ram_array_reg_0;
  input [23:0]DOBDO;
  input [0:0]S;
  input [7:0]\red_reg[0]_i_3_0 ;
  input pwropt;
  input pwropt_1;

  wire CLK;
  wire [0:0]CO;
  wire [23:0]DOBDO;
  wire [9:0]Q;
  wire [0:0]S;
  wire \display_ram/ram_array_reg_cooolgate_en_sig_7 ;
  wire \display_ram/ram_array_reg_cooolgate_en_sig_8 ;
  wire \display_ram/ram_array_reg_cooolgate_en_sig_9 ;
  wire [23:17]display_ram_dout;
  wire display_ram_we;
  wire pwropt;
  wire pwropt_1;
  wire [9:0]ram_array_reg_0;
  wire ram_array_reg_ENBWREN_cooolgate_en_sig_10;
  wire \red[0]_i_10_n_0 ;
  wire \red[0]_i_11_n_0 ;
  wire \red[0]_i_12_n_0 ;
  wire \red[0]_i_5_n_0 ;
  wire \red[0]_i_6_n_0 ;
  wire \red[0]_i_7_n_0 ;
  wire \red[0]_i_8_n_0 ;
  wire \red[0]_i_9_n_0 ;
  wire [7:0]\red_reg[0]_i_3_0 ;
  wire \red_reg[0]_i_3_n_0 ;
  wire NLW_ram_array_reg_CASCADEOUTA_UNCONNECTED;
  wire NLW_ram_array_reg_CASCADEOUTB_UNCONNECTED;
  wire NLW_ram_array_reg_DBITERR_UNCONNECTED;
  wire NLW_ram_array_reg_INJECTDBITERR_UNCONNECTED;
  wire NLW_ram_array_reg_INJECTSBITERR_UNCONNECTED;
  wire NLW_ram_array_reg_SBITERR_UNCONNECTED;
  wire [31:0]NLW_ram_array_reg_DOADO_UNCONNECTED;
  wire [31:0]NLW_ram_array_reg_DOBDO_UNCONNECTED;
  wire [3:0]NLW_ram_array_reg_DOPADOP_UNCONNECTED;
  wire [3:0]NLW_ram_array_reg_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_ram_array_reg_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_ram_array_reg_RDADDRECC_UNCONNECTED;
  wire [3:1]\NLW_red_reg[0]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_red_reg[0]_i_2_O_UNCONNECTED ;
  wire [2:0]\NLW_red_reg[0]_i_3_CO_UNCONNECTED ;
  wire [3:0]\NLW_red_reg[0]_i_3_O_UNCONNECTED ;

  FDCE #(
    .INIT(1'b1)) 
    \display_ram/ram_array_reg_cooolgate_en_gate_10_cooolDelFlop 
       (.C(CLK),
        .CE(1'b1),
        .CLR(1'b0),
        .D(display_ram_we),
        .Q(\display_ram/ram_array_reg_cooolgate_en_sig_7 ));
  FDCE #(
    .INIT(1'b1)) 
    \display_ram/ram_array_reg_cooolgate_en_gate_11_cooolDelFlop 
       (.C(CLK),
        .CE(1'b1),
        .CLR(1'b0),
        .D(pwropt),
        .Q(\display_ram/ram_array_reg_cooolgate_en_sig_8 ));
  FDCE #(
    .INIT(1'b1)) 
    \display_ram/ram_array_reg_cooolgate_en_gate_12_cooolDelFlop 
       (.C(CLK),
        .CE(1'b1),
        .CLR(1'b0),
        .D(pwropt_1),
        .Q(\display_ram/ram_array_reg_cooolgate_en_sig_9 ));
  (* IS_CLOCK_GATED *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d24" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d24" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  (* POWER_OPTED_CE = "ENBWREN=NEW" *) 
  (* RTL_RAM_BITS = "24576" *) 
  (* RTL_RAM_NAME = "display_ram/ram_array" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "23" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(36),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(36)) 
    ram_array_reg
       (.ADDRARDADDR({1'b1,Q,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,ram_array_reg_0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b1),
        .CASCADEINB(1'b1),
        .CASCADEOUTA(NLW_ram_array_reg_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_ram_array_reg_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(CLK),
        .CLKBWRCLK(CLK),
        .DBITERR(NLW_ram_array_reg_DBITERR_UNCONNECTED),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,DOBDO}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(NLW_ram_array_reg_DOADO_UNCONNECTED[31:0]),
        .DOBDO({NLW_ram_array_reg_DOBDO_UNCONNECTED[31:24],display_ram_dout,NLW_ram_array_reg_DOBDO_UNCONNECTED[16:0]}),
        .DOPADOP(NLW_ram_array_reg_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP(NLW_ram_array_reg_DOPBDOP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_ram_array_reg_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(display_ram_we),
        .ENBWREN(ram_array_reg_ENBWREN_cooolgate_en_sig_10),
        .INJECTDBITERR(NLW_ram_array_reg_INJECTDBITERR_UNCONNECTED),
        .INJECTSBITERR(NLW_ram_array_reg_INJECTSBITERR_UNCONNECTED),
        .RDADDRECC(NLW_ram_array_reg_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_ram_array_reg_SBITERR_UNCONNECTED),
        .WEA({1'b1,1'b1,1'b1,1'b1}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT4 #(
    .INIT(16'hfffe)) 
    ram_array_reg_ENBWREN_cooolgate_en_gate_13
       (.I0(\display_ram/ram_array_reg_cooolgate_en_sig_9 ),
        .I1(\display_ram/ram_array_reg_cooolgate_en_sig_8 ),
        .I2(display_ram_we),
        .I3(\display_ram/ram_array_reg_cooolgate_en_sig_7 ),
        .O(ram_array_reg_ENBWREN_cooolgate_en_sig_10));
  LUT4 #(
    .INIT(16'h9009)) 
    \red[0]_i_10 
       (.I0(display_ram_dout[22]),
        .I1(\red_reg[0]_i_3_0 [5]),
        .I2(display_ram_dout[21]),
        .I3(\red_reg[0]_i_3_0 [4]),
        .O(\red[0]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \red[0]_i_11 
       (.I0(display_ram_dout[20]),
        .I1(\red_reg[0]_i_3_0 [3]),
        .I2(display_ram_dout[19]),
        .I3(\red_reg[0]_i_3_0 [2]),
        .O(\red[0]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \red[0]_i_12 
       (.I0(display_ram_dout[18]),
        .I1(\red_reg[0]_i_3_0 [1]),
        .I2(display_ram_dout[17]),
        .I3(\red_reg[0]_i_3_0 [0]),
        .O(\red[0]_i_12_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \red[0]_i_5 
       (.I0(display_ram_dout[23]),
        .I1(\red_reg[0]_i_3_0 [6]),
        .I2(\red_reg[0]_i_3_0 [7]),
        .O(\red[0]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h44D4)) 
    \red[0]_i_6 
       (.I0(\red_reg[0]_i_3_0 [5]),
        .I1(display_ram_dout[22]),
        .I2(display_ram_dout[21]),
        .I3(\red_reg[0]_i_3_0 [4]),
        .O(\red[0]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h44D4)) 
    \red[0]_i_7 
       (.I0(\red_reg[0]_i_3_0 [3]),
        .I1(display_ram_dout[20]),
        .I2(display_ram_dout[19]),
        .I3(\red_reg[0]_i_3_0 [2]),
        .O(\red[0]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h44D4)) 
    \red[0]_i_8 
       (.I0(\red_reg[0]_i_3_0 [1]),
        .I1(display_ram_dout[18]),
        .I2(display_ram_dout[17]),
        .I3(\red_reg[0]_i_3_0 [0]),
        .O(\red[0]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h41)) 
    \red[0]_i_9 
       (.I0(\red_reg[0]_i_3_0 [7]),
        .I1(display_ram_dout[23]),
        .I2(\red_reg[0]_i_3_0 [6]),
        .O(\red[0]_i_9_n_0 ));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \red_reg[0]_i_2 
       (.CI(\red_reg[0]_i_3_n_0 ),
        .CO({\NLW_red_reg[0]_i_2_CO_UNCONNECTED [3:1],CO}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_red_reg[0]_i_2_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,S}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \red_reg[0]_i_3 
       (.CI(1'b0),
        .CO({\red_reg[0]_i_3_n_0 ,\NLW_red_reg[0]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\red[0]_i_5_n_0 ,\red[0]_i_6_n_0 ,\red[0]_i_7_n_0 ,\red[0]_i_8_n_0 }),
        .O(\NLW_red_reg[0]_i_3_O_UNCONNECTED [3:0]),
        .S({\red[0]_i_9_n_0 ,\red[0]_i_10_n_0 ,\red[0]_i_11_n_0 ,\red[0]_i_12_n_0 }));
endmodule

(* ORIG_REF_NAME = "smpl_ram" *) 
module smpl_ram_0
   (DOBDO,
    clk100M_IBUF_BUFG,
    aud_dout_vld,
    ADDRARDADDR,
    ADDRBWRADDR,
    Q);
  output [13:0]DOBDO;
  input clk100M_IBUF_BUFG;
  input aud_dout_vld;
  input [9:0]ADDRARDADDR;
  input [9:0]ADDRBWRADDR;
  input [23:0]Q;

  wire [9:0]ADDRARDADDR;
  wire [9:0]ADDRBWRADDR;
  wire [13:0]DOBDO;
  wire [23:0]Q;
  wire aud_dout_vld;
  wire clk100M_IBUF_BUFG;
  wire NLW_ram_array_reg_CASCADEOUTA_UNCONNECTED;
  wire NLW_ram_array_reg_CASCADEOUTB_UNCONNECTED;
  wire NLW_ram_array_reg_DBITERR_UNCONNECTED;
  wire NLW_ram_array_reg_INJECTDBITERR_UNCONNECTED;
  wire NLW_ram_array_reg_INJECTSBITERR_UNCONNECTED;
  wire NLW_ram_array_reg_SBITERR_UNCONNECTED;
  wire [31:0]NLW_ram_array_reg_DOADO_UNCONNECTED;
  wire [31:0]NLW_ram_array_reg_DOBDO_UNCONNECTED;
  wire [3:0]NLW_ram_array_reg_DOPADOP_UNCONNECTED;
  wire [3:0]NLW_ram_array_reg_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_ram_array_reg_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_ram_array_reg_RDADDRECC_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d24" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d24" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  (* RTL_RAM_BITS = "24576" *) 
  (* RTL_RAM_NAME = "spec_anal/controller/circ_buff/ram_array" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "23" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(36),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(36)) 
    ram_array_reg
       (.ADDRARDADDR({1'b1,ADDRARDADDR,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,ADDRBWRADDR,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b1),
        .CASCADEINB(1'b1),
        .CASCADEOUTA(NLW_ram_array_reg_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_ram_array_reg_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(clk100M_IBUF_BUFG),
        .CLKBWRCLK(clk100M_IBUF_BUFG),
        .DBITERR(NLW_ram_array_reg_DBITERR_UNCONNECTED),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,Q}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(NLW_ram_array_reg_DOADO_UNCONNECTED[31:0]),
        .DOBDO({NLW_ram_array_reg_DOBDO_UNCONNECTED[31:24],DOBDO,NLW_ram_array_reg_DOBDO_UNCONNECTED[9:0]}),
        .DOPADOP(NLW_ram_array_reg_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP(NLW_ram_array_reg_DOPBDOP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_ram_array_reg_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(aud_dout_vld),
        .ENBWREN(1'b1),
        .INJECTDBITERR(NLW_ram_array_reg_INJECTDBITERR_UNCONNECTED),
        .INJECTSBITERR(NLW_ram_array_reg_INJECTSBITERR_UNCONNECTED),
        .RDADDRECC(NLW_ram_array_reg_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_ram_array_reg_SBITERR_UNCONNECTED),
        .WEA({1'b1,1'b1,1'b1,1'b1}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "smpl_ram" *) 
module smpl_ram_1
   (DOBDO,
    clk100M_IBUF_BUFG,
    CLK,
    dB_vld,
    Q,
    ram_array_reg_0,
    DOADO);
  output [23:0]DOBDO;
  input clk100M_IBUF_BUFG;
  input CLK;
  input dB_vld;
  input [9:0]Q;
  input [9:0]ram_array_reg_0;
  input [22:0]DOADO;

  wire CLK;
  wire [22:0]DOADO;
  wire [23:0]DOBDO;
  wire [9:0]Q;
  wire clk100M_IBUF_BUFG;
  wire dB_vld;
  wire [9:0]ram_array_reg_0;
  wire NLW_ram_array_reg_CASCADEOUTA_UNCONNECTED;
  wire NLW_ram_array_reg_CASCADEOUTB_UNCONNECTED;
  wire NLW_ram_array_reg_DBITERR_UNCONNECTED;
  wire NLW_ram_array_reg_INJECTDBITERR_UNCONNECTED;
  wire NLW_ram_array_reg_INJECTSBITERR_UNCONNECTED;
  wire NLW_ram_array_reg_SBITERR_UNCONNECTED;
  wire [31:0]NLW_ram_array_reg_DOADO_UNCONNECTED;
  wire [31:24]NLW_ram_array_reg_DOBDO_UNCONNECTED;
  wire [3:0]NLW_ram_array_reg_DOPADOP_UNCONNECTED;
  wire [3:0]NLW_ram_array_reg_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_ram_array_reg_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_ram_array_reg_RDADDRECC_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d24" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d24" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "24576" *) 
  (* RTL_RAM_NAME = "spec_anal/controller/dB_results/ram_array" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "23" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(36),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("NO_CHANGE"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(36)) 
    ram_array_reg
       (.ADDRARDADDR({1'b1,Q,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,ram_array_reg_0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b1),
        .CASCADEINB(1'b1),
        .CASCADEOUTA(NLW_ram_array_reg_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_ram_array_reg_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(clk100M_IBUF_BUFG),
        .CLKBWRCLK(CLK),
        .DBITERR(NLW_ram_array_reg_DBITERR_UNCONNECTED),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,DOADO[22],DOADO}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(NLW_ram_array_reg_DOADO_UNCONNECTED[31:0]),
        .DOBDO({NLW_ram_array_reg_DOBDO_UNCONNECTED[31:24],DOBDO}),
        .DOPADOP(NLW_ram_array_reg_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP(NLW_ram_array_reg_DOPBDOP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_ram_array_reg_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(dB_vld),
        .ENBWREN(1'b1),
        .INJECTDBITERR(NLW_ram_array_reg_INJECTDBITERR_UNCONNECTED),
        .INJECTSBITERR(NLW_ram_array_reg_INJECTSBITERR_UNCONNECTED),
        .RDADDRECC(NLW_ram_array_reg_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_ram_array_reg_SBITERR_UNCONNECTED),
        .WEA({1'b1,1'b1,1'b1,1'b1}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "smpl_ram" *) 
module smpl_ram__parameterized0
   (ram_array_reg_0,
    we_11,
    clk100M_IBUF_BUFG,
    Q,
    ram_array_reg_1,
    din_a_i,
    ram_array_reg_2,
    ram_array_reg_3,
    ram_array_reg_4,
    ram_array_reg_5,
    pwropt,
    pwropt_1,
    pwropt_2,
    pwropt_3,
    pwropt_4);
  output [23:0]ram_array_reg_0;
  output we_11;
  input clk100M_IBUF_BUFG;
  input [9:0]Q;
  input [9:0]ram_array_reg_1;
  input [23:0]din_a_i;
  input ram_array_reg_2;
  input ram_array_reg_3;
  input ram_array_reg_4;
  input ram_array_reg_5;
  input pwropt;
  input pwropt_1;
  output pwropt_2;
  output pwropt_3;
  output pwropt_4;

  wire [9:0]Q;
  wire clk100M_IBUF_BUFG;
  wire [23:0]din_a_i;
  wire pwropt;
  wire pwropt_1;
  wire [23:0]ram_array_reg_0;
  wire [9:0]ram_array_reg_1;
  wire ram_array_reg_2;
  wire ram_array_reg_3;
  wire ram_array_reg_4;
  wire ram_array_reg_5;
  wire ram_array_reg_ENBWREN_cooolgate_en_sig_4;
  wire \spec_anal/controller/core/inst[0].smpl_ram_inst/ram_array_reg_cooolgate_en_sig_1 ;
  wire \spec_anal/controller/core/inst[0].smpl_ram_inst/ram_array_reg_cooolgate_en_sig_2 ;
  wire \spec_anal/controller/core/inst[0].smpl_ram_inst/ram_array_reg_cooolgate_en_sig_3 ;
  wire we_11;
  wire NLW_ram_array_reg_CASCADEOUTA_UNCONNECTED;
  wire NLW_ram_array_reg_CASCADEOUTB_UNCONNECTED;
  wire NLW_ram_array_reg_DBITERR_UNCONNECTED;
  wire NLW_ram_array_reg_INJECTDBITERR_UNCONNECTED;
  wire NLW_ram_array_reg_INJECTSBITERR_UNCONNECTED;
  wire NLW_ram_array_reg_SBITERR_UNCONNECTED;
  wire [31:0]NLW_ram_array_reg_DOADO_UNCONNECTED;
  wire [31:24]NLW_ram_array_reg_DOBDO_UNCONNECTED;
  wire [3:0]NLW_ram_array_reg_DOPADOP_UNCONNECTED;
  wire [3:0]NLW_ram_array_reg_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_ram_array_reg_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_ram_array_reg_RDADDRECC_UNCONNECTED;

  assign pwropt_2 = \spec_anal/controller/core/inst[0].smpl_ram_inst/ram_array_reg_cooolgate_en_sig_1 ;
  assign pwropt_3 = \spec_anal/controller/core/inst[0].smpl_ram_inst/ram_array_reg_cooolgate_en_sig_2 ;
  assign pwropt_4 = \spec_anal/controller/core/inst[0].smpl_ram_inst/ram_array_reg_cooolgate_en_sig_3 ;
  (* IS_CLOCK_GATED *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d24" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d24" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* POWER_OPTED_CE = "ENBWREN=NEW" *) 
  (* RTL_RAM_BITS = "24576" *) 
  (* RTL_RAM_NAME = "spec_anal/controller/core/inst[0].smpl_ram_inst/ram_array" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "23" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(36),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(36)) 
    ram_array_reg
       (.ADDRARDADDR({1'b1,Q,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,ram_array_reg_1,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b1),
        .CASCADEINB(1'b1),
        .CASCADEOUTA(NLW_ram_array_reg_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_ram_array_reg_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(clk100M_IBUF_BUFG),
        .CLKBWRCLK(clk100M_IBUF_BUFG),
        .DBITERR(NLW_ram_array_reg_DBITERR_UNCONNECTED),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din_a_i}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(NLW_ram_array_reg_DOADO_UNCONNECTED[31:0]),
        .DOBDO({NLW_ram_array_reg_DOBDO_UNCONNECTED[31:24],ram_array_reg_0}),
        .DOPADOP(NLW_ram_array_reg_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP(NLW_ram_array_reg_DOPBDOP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_ram_array_reg_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(we_11),
        .ENBWREN(ram_array_reg_ENBWREN_cooolgate_en_sig_4),
        .INJECTDBITERR(NLW_ram_array_reg_INJECTDBITERR_UNCONNECTED),
        .INJECTSBITERR(NLW_ram_array_reg_INJECTSBITERR_UNCONNECTED),
        .RDADDRECC(NLW_ram_array_reg_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_ram_array_reg_SBITERR_UNCONNECTED),
        .WEA({1'b1,1'b1,1'b1,1'b1}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT4 #(
    .INIT(16'hfffe)) 
    ram_array_reg_ENBWREN_cooolgate_en_gate_4
       (.I0(we_11),
        .I1(\spec_anal/controller/core/inst[0].smpl_ram_inst/ram_array_reg_cooolgate_en_sig_3 ),
        .I2(\spec_anal/controller/core/inst[0].smpl_ram_inst/ram_array_reg_cooolgate_en_sig_2 ),
        .I3(\spec_anal/controller/core/inst[0].smpl_ram_inst/ram_array_reg_cooolgate_en_sig_1 ),
        .O(ram_array_reg_ENBWREN_cooolgate_en_sig_4));
  LUT4 #(
    .INIT(16'h6000)) 
    ram_array_reg_i_1__4
       (.I0(ram_array_reg_2),
        .I1(ram_array_reg_3),
        .I2(ram_array_reg_4),
        .I3(ram_array_reg_5),
        .O(we_11));
  FDCE #(
    .INIT(1'b1)) 
    \spec_anal/controller/core/inst[0].smpl_ram_inst/ram_array_reg_cooolgate_en_gate_1_cooolDelFlop 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .CLR(1'b0),
        .D(pwropt),
        .Q(\spec_anal/controller/core/inst[0].smpl_ram_inst/ram_array_reg_cooolgate_en_sig_1 ));
  FDCE #(
    .INIT(1'b1)) 
    \spec_anal/controller/core/inst[0].smpl_ram_inst/ram_array_reg_cooolgate_en_gate_2_cooolDelFlop 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .CLR(1'b0),
        .D(pwropt_1),
        .Q(\spec_anal/controller/core/inst[0].smpl_ram_inst/ram_array_reg_cooolgate_en_sig_2 ));
  FDCE #(
    .INIT(1'b1)) 
    \spec_anal/controller/core/inst[0].smpl_ram_inst/ram_array_reg_cooolgate_en_gate_3_cooolDelFlop 
       (.C(clk100M_IBUF_BUFG),
        .CE(1'b1),
        .CLR(1'b0),
        .D(we_11),
        .Q(\spec_anal/controller/core/inst[0].smpl_ram_inst/ram_array_reg_cooolgate_en_sig_3 ));
endmodule

(* ORIG_REF_NAME = "smpl_ram" *) 
module smpl_ram__parameterized0_4
   (ram_array_reg_0,
    clk100M_IBUF_BUFG,
    we_11,
    Q,
    ram_array_reg_1,
    din_a_i,
    pwropt,
    pwropt_1,
    pwropt_2);
  output [23:0]ram_array_reg_0;
  input clk100M_IBUF_BUFG;
  input we_11;
  input [9:0]Q;
  input [9:0]ram_array_reg_1;
  input [23:0]din_a_i;
  input pwropt;
  input pwropt_1;
  input pwropt_2;

  wire [9:0]Q;
  wire clk100M_IBUF_BUFG;
  wire [23:0]din_a_i;
  wire pwropt;
  wire pwropt_1;
  wire pwropt_2;
  wire [23:0]ram_array_reg_0;
  wire [9:0]ram_array_reg_1;
  wire ram_array_reg_ENBWREN_cooolgate_en_sig_5;
  wire we_11;
  wire NLW_ram_array_reg_CASCADEOUTA_UNCONNECTED;
  wire NLW_ram_array_reg_CASCADEOUTB_UNCONNECTED;
  wire NLW_ram_array_reg_DBITERR_UNCONNECTED;
  wire NLW_ram_array_reg_INJECTDBITERR_UNCONNECTED;
  wire NLW_ram_array_reg_INJECTSBITERR_UNCONNECTED;
  wire NLW_ram_array_reg_SBITERR_UNCONNECTED;
  wire [31:0]NLW_ram_array_reg_DOADO_UNCONNECTED;
  wire [31:24]NLW_ram_array_reg_DOBDO_UNCONNECTED;
  wire [3:0]NLW_ram_array_reg_DOPADOP_UNCONNECTED;
  wire [3:0]NLW_ram_array_reg_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_ram_array_reg_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_ram_array_reg_RDADDRECC_UNCONNECTED;

  (* IS_CLOCK_GATED *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d24" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d24" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* POWER_OPTED_CE = "ENBWREN=NEW" *) 
  (* RTL_RAM_BITS = "24576" *) 
  (* RTL_RAM_NAME = "spec_anal/controller/core/inst[1].smpl_ram_inst/ram_array" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "23" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(36),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(36)) 
    ram_array_reg
       (.ADDRARDADDR({1'b1,Q,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,ram_array_reg_1,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b1),
        .CASCADEINB(1'b1),
        .CASCADEOUTA(NLW_ram_array_reg_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_ram_array_reg_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(clk100M_IBUF_BUFG),
        .CLKBWRCLK(clk100M_IBUF_BUFG),
        .DBITERR(NLW_ram_array_reg_DBITERR_UNCONNECTED),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din_a_i}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(NLW_ram_array_reg_DOADO_UNCONNECTED[31:0]),
        .DOBDO({NLW_ram_array_reg_DOBDO_UNCONNECTED[31:24],ram_array_reg_0}),
        .DOPADOP(NLW_ram_array_reg_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP(NLW_ram_array_reg_DOPBDOP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_ram_array_reg_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(we_11),
        .ENBWREN(ram_array_reg_ENBWREN_cooolgate_en_sig_5),
        .INJECTDBITERR(NLW_ram_array_reg_INJECTDBITERR_UNCONNECTED),
        .INJECTSBITERR(NLW_ram_array_reg_INJECTSBITERR_UNCONNECTED),
        .RDADDRECC(NLW_ram_array_reg_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_ram_array_reg_SBITERR_UNCONNECTED),
        .WEA({1'b1,1'b1,1'b1,1'b1}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT4 #(
    .INIT(16'hfffe)) 
    ram_array_reg_ENBWREN_cooolgate_en_gate_6
       (.I0(we_11),
        .I1(pwropt_2),
        .I2(pwropt_1),
        .I3(pwropt),
        .O(ram_array_reg_ENBWREN_cooolgate_en_sig_5));
endmodule

(* ORIG_REF_NAME = "smpl_ram" *) 
module smpl_ram__parameterized0_5
   (WEA,
    write_cntr_0_posedge,
    A,
    clk100M_IBUF_BUFG,
    Q,
    din_a_i,
    write_cntr_0_posedge_delay_reg,
    write_cntr_0_delay,
    ram_array_reg_0,
    ram_array_reg_1,
    ram_array_reg_2,
    DOADO);
  output [0:0]WEA;
  output write_cntr_0_posedge;
  output [23:0]A;
  input clk100M_IBUF_BUFG;
  input [9:0]Q;
  input [23:0]din_a_i;
  input write_cntr_0_posedge_delay_reg;
  input write_cntr_0_delay;
  input ram_array_reg_0;
  input ram_array_reg_1;
  input ram_array_reg_2;
  input [23:0]DOADO;

  wire [23:0]A;
  wire [23:0]DOADO;
  wire [9:0]Q;
  wire [0:0]WEA;
  wire clk100M_IBUF_BUFG;
  wire [23:0]din_a_i;
  wire [23:0]ram_2_imag_dout_a;
  wire ram_array_reg_0;
  wire ram_array_reg_1;
  wire ram_array_reg_2;
  wire write_cntr_0_delay;
  wire write_cntr_0_posedge;
  wire write_cntr_0_posedge_delay_reg;
  wire NLW_ram_array_reg_CASCADEOUTA_UNCONNECTED;
  wire NLW_ram_array_reg_CASCADEOUTB_UNCONNECTED;
  wire NLW_ram_array_reg_DBITERR_UNCONNECTED;
  wire NLW_ram_array_reg_INJECTDBITERR_UNCONNECTED;
  wire NLW_ram_array_reg_INJECTSBITERR_UNCONNECTED;
  wire NLW_ram_array_reg_SBITERR_UNCONNECTED;
  wire [31:24]NLW_ram_array_reg_DOADO_UNCONNECTED;
  wire [31:0]NLW_ram_array_reg_DOBDO_UNCONNECTED;
  wire [3:0]NLW_ram_array_reg_DOPADOP_UNCONNECTED;
  wire [3:0]NLW_ram_array_reg_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_ram_array_reg_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_ram_array_reg_RDADDRECC_UNCONNECTED;

  LUT4 #(
    .INIT(16'hB888)) 
    p_reg_reg_i_10
       (.I0(ram_2_imag_dout_a[16]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(DOADO[16]),
        .O(A[16]));
  LUT4 #(
    .INIT(16'hB888)) 
    p_reg_reg_i_11
       (.I0(ram_2_imag_dout_a[15]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(DOADO[15]),
        .O(A[15]));
  LUT4 #(
    .INIT(16'hB888)) 
    p_reg_reg_i_12
       (.I0(ram_2_imag_dout_a[14]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(DOADO[14]),
        .O(A[14]));
  LUT4 #(
    .INIT(16'hB888)) 
    p_reg_reg_i_13
       (.I0(ram_2_imag_dout_a[13]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(DOADO[13]),
        .O(A[13]));
  LUT4 #(
    .INIT(16'hB888)) 
    p_reg_reg_i_14
       (.I0(ram_2_imag_dout_a[12]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(DOADO[12]),
        .O(A[12]));
  LUT4 #(
    .INIT(16'hB888)) 
    p_reg_reg_i_15
       (.I0(ram_2_imag_dout_a[11]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(DOADO[11]),
        .O(A[11]));
  LUT4 #(
    .INIT(16'hB888)) 
    p_reg_reg_i_16
       (.I0(ram_2_imag_dout_a[10]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(DOADO[10]),
        .O(A[10]));
  LUT4 #(
    .INIT(16'hB888)) 
    p_reg_reg_i_17
       (.I0(ram_2_imag_dout_a[9]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(DOADO[9]),
        .O(A[9]));
  LUT4 #(
    .INIT(16'hB888)) 
    p_reg_reg_i_18
       (.I0(ram_2_imag_dout_a[8]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(DOADO[8]),
        .O(A[8]));
  LUT4 #(
    .INIT(16'hB888)) 
    p_reg_reg_i_19
       (.I0(ram_2_imag_dout_a[7]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(DOADO[7]),
        .O(A[7]));
  LUT4 #(
    .INIT(16'hB888)) 
    p_reg_reg_i_20
       (.I0(ram_2_imag_dout_a[6]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(DOADO[6]),
        .O(A[6]));
  LUT4 #(
    .INIT(16'hB888)) 
    p_reg_reg_i_21
       (.I0(ram_2_imag_dout_a[5]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(DOADO[5]),
        .O(A[5]));
  LUT4 #(
    .INIT(16'hB888)) 
    p_reg_reg_i_22
       (.I0(ram_2_imag_dout_a[4]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(DOADO[4]),
        .O(A[4]));
  LUT4 #(
    .INIT(16'hB888)) 
    p_reg_reg_i_23
       (.I0(ram_2_imag_dout_a[3]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(DOADO[3]),
        .O(A[3]));
  LUT4 #(
    .INIT(16'hB888)) 
    p_reg_reg_i_24
       (.I0(ram_2_imag_dout_a[2]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(DOADO[2]),
        .O(A[2]));
  LUT4 #(
    .INIT(16'hB888)) 
    p_reg_reg_i_25
       (.I0(ram_2_imag_dout_a[1]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(DOADO[1]),
        .O(A[1]));
  LUT4 #(
    .INIT(16'hB888)) 
    p_reg_reg_i_26
       (.I0(ram_2_imag_dout_a[0]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(DOADO[0]),
        .O(A[0]));
  LUT4 #(
    .INIT(16'hB888)) 
    p_reg_reg_i_3
       (.I0(ram_2_imag_dout_a[23]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(DOADO[23]),
        .O(A[23]));
  LUT4 #(
    .INIT(16'hB888)) 
    p_reg_reg_i_4
       (.I0(ram_2_imag_dout_a[22]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(DOADO[22]),
        .O(A[22]));
  LUT4 #(
    .INIT(16'hB888)) 
    p_reg_reg_i_5
       (.I0(ram_2_imag_dout_a[21]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(DOADO[21]),
        .O(A[21]));
  LUT4 #(
    .INIT(16'hB888)) 
    p_reg_reg_i_6
       (.I0(ram_2_imag_dout_a[20]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(DOADO[20]),
        .O(A[20]));
  LUT4 #(
    .INIT(16'hB888)) 
    p_reg_reg_i_7
       (.I0(ram_2_imag_dout_a[19]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(DOADO[19]),
        .O(A[19]));
  LUT4 #(
    .INIT(16'hB888)) 
    p_reg_reg_i_8
       (.I0(ram_2_imag_dout_a[18]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(DOADO[18]),
        .O(A[18]));
  LUT4 #(
    .INIT(16'hB888)) 
    p_reg_reg_i_9
       (.I0(ram_2_imag_dout_a[17]),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(DOADO[17]),
        .O(A[17]));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d24" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "24576" *) 
  (* RTL_RAM_NAME = "spec_anal/controller/core/inst[2].smpl_ram_inst/ram_array" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "23" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(0)) 
    ram_array_reg
       (.ADDRARDADDR({1'b1,Q,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b1),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(NLW_ram_array_reg_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_ram_array_reg_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(clk100M_IBUF_BUFG),
        .CLKBWRCLK(1'b0),
        .DBITERR(NLW_ram_array_reg_DBITERR_UNCONNECTED),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din_a_i}),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b1,1'b1,1'b1,1'b1}),
        .DOADO({NLW_ram_array_reg_DOADO_UNCONNECTED[31:24],ram_2_imag_dout_a}),
        .DOBDO(NLW_ram_array_reg_DOBDO_UNCONNECTED[31:0]),
        .DOPADOP(NLW_ram_array_reg_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP(NLW_ram_array_reg_DOPBDOP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_ram_array_reg_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(1'b1),
        .ENBWREN(1'b0),
        .INJECTDBITERR(NLW_ram_array_reg_INJECTDBITERR_UNCONNECTED),
        .INJECTSBITERR(NLW_ram_array_reg_INJECTSBITERR_UNCONNECTED),
        .RDADDRECC(NLW_ram_array_reg_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_ram_array_reg_SBITERR_UNCONNECTED),
        .WEA({WEA,WEA,WEA,WEA}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT4 #(
    .INIT(16'h0600)) 
    ram_array_reg_i_25__0
       (.I0(write_cntr_0_posedge_delay_reg),
        .I1(ram_array_reg_0),
        .I2(ram_array_reg_1),
        .I3(ram_array_reg_2),
        .O(WEA));
  LUT2 #(
    .INIT(4'h2)) 
    write_cntr_0_posedge_delay_i_1
       (.I0(write_cntr_0_posedge_delay_reg),
        .I1(write_cntr_0_delay),
        .O(write_cntr_0_posedge));
endmodule

(* ORIG_REF_NAME = "smpl_ram" *) 
module smpl_ram__parameterized0_6
   (D,
    clk100M_IBUF_BUFG,
    Q,
    din_a_i,
    WEA,
    p_reg_reg,
    p_reg_reg_0,
    DOADO);
  output [23:0]D;
  input clk100M_IBUF_BUFG;
  input [9:0]Q;
  input [23:0]din_a_i;
  input [0:0]WEA;
  input p_reg_reg;
  input p_reg_reg_0;
  input [23:0]DOADO;

  wire [23:0]D;
  wire [23:0]DOADO;
  wire [9:0]Q;
  wire [0:0]WEA;
  wire clk100M_IBUF_BUFG;
  wire [23:0]din_a_i;
  wire p_reg_reg;
  wire p_reg_reg_0;
  wire [23:0]ram_2_real_dout_a;
  wire NLW_ram_array_reg_CASCADEOUTA_UNCONNECTED;
  wire NLW_ram_array_reg_CASCADEOUTB_UNCONNECTED;
  wire NLW_ram_array_reg_DBITERR_UNCONNECTED;
  wire NLW_ram_array_reg_INJECTDBITERR_UNCONNECTED;
  wire NLW_ram_array_reg_INJECTSBITERR_UNCONNECTED;
  wire NLW_ram_array_reg_SBITERR_UNCONNECTED;
  wire [31:24]NLW_ram_array_reg_DOADO_UNCONNECTED;
  wire [31:0]NLW_ram_array_reg_DOBDO_UNCONNECTED;
  wire [3:0]NLW_ram_array_reg_DOPADOP_UNCONNECTED;
  wire [3:0]NLW_ram_array_reg_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_ram_array_reg_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_ram_array_reg_RDADDRECC_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d24" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "24576" *) 
  (* RTL_RAM_NAME = "spec_anal/controller/core/inst[3].smpl_ram_inst/ram_array" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "23" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(0)) 
    ram_array_reg
       (.ADDRARDADDR({1'b1,Q,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b1),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(NLW_ram_array_reg_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_ram_array_reg_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(clk100M_IBUF_BUFG),
        .CLKBWRCLK(1'b0),
        .DBITERR(NLW_ram_array_reg_DBITERR_UNCONNECTED),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din_a_i}),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b1,1'b1,1'b1,1'b1}),
        .DOADO({NLW_ram_array_reg_DOADO_UNCONNECTED[31:24],ram_2_real_dout_a}),
        .DOBDO(NLW_ram_array_reg_DOBDO_UNCONNECTED[31:0]),
        .DOPADOP(NLW_ram_array_reg_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP(NLW_ram_array_reg_DOPBDOP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_ram_array_reg_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(1'b1),
        .ENBWREN(1'b0),
        .INJECTDBITERR(NLW_ram_array_reg_INJECTDBITERR_UNCONNECTED),
        .INJECTSBITERR(NLW_ram_array_reg_INJECTSBITERR_UNCONNECTED),
        .RDADDRECC(NLW_ram_array_reg_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_ram_array_reg_SBITERR_UNCONNECTED),
        .WEA({WEA,WEA,WEA,WEA}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT4 #(
    .INIT(16'hB888)) 
    \x2_real_buff[0]_i_1 
       (.I0(ram_2_real_dout_a[0]),
        .I1(p_reg_reg),
        .I2(p_reg_reg_0),
        .I3(DOADO[0]),
        .O(D[0]));
  LUT4 #(
    .INIT(16'hB888)) 
    \x2_real_buff[10]_i_1 
       (.I0(ram_2_real_dout_a[10]),
        .I1(p_reg_reg),
        .I2(p_reg_reg_0),
        .I3(DOADO[10]),
        .O(D[10]));
  LUT4 #(
    .INIT(16'hB888)) 
    \x2_real_buff[11]_i_1 
       (.I0(ram_2_real_dout_a[11]),
        .I1(p_reg_reg),
        .I2(p_reg_reg_0),
        .I3(DOADO[11]),
        .O(D[11]));
  LUT4 #(
    .INIT(16'hB888)) 
    \x2_real_buff[12]_i_1 
       (.I0(ram_2_real_dout_a[12]),
        .I1(p_reg_reg),
        .I2(p_reg_reg_0),
        .I3(DOADO[12]),
        .O(D[12]));
  LUT4 #(
    .INIT(16'hB888)) 
    \x2_real_buff[13]_i_1 
       (.I0(ram_2_real_dout_a[13]),
        .I1(p_reg_reg),
        .I2(p_reg_reg_0),
        .I3(DOADO[13]),
        .O(D[13]));
  LUT4 #(
    .INIT(16'hB888)) 
    \x2_real_buff[14]_i_1 
       (.I0(ram_2_real_dout_a[14]),
        .I1(p_reg_reg),
        .I2(p_reg_reg_0),
        .I3(DOADO[14]),
        .O(D[14]));
  LUT4 #(
    .INIT(16'hB888)) 
    \x2_real_buff[15]_i_1 
       (.I0(ram_2_real_dout_a[15]),
        .I1(p_reg_reg),
        .I2(p_reg_reg_0),
        .I3(DOADO[15]),
        .O(D[15]));
  LUT4 #(
    .INIT(16'hB888)) 
    \x2_real_buff[16]_i_1 
       (.I0(ram_2_real_dout_a[16]),
        .I1(p_reg_reg),
        .I2(p_reg_reg_0),
        .I3(DOADO[16]),
        .O(D[16]));
  LUT4 #(
    .INIT(16'hB888)) 
    \x2_real_buff[17]_i_1 
       (.I0(ram_2_real_dout_a[17]),
        .I1(p_reg_reg),
        .I2(p_reg_reg_0),
        .I3(DOADO[17]),
        .O(D[17]));
  LUT4 #(
    .INIT(16'hB888)) 
    \x2_real_buff[18]_i_1 
       (.I0(ram_2_real_dout_a[18]),
        .I1(p_reg_reg),
        .I2(p_reg_reg_0),
        .I3(DOADO[18]),
        .O(D[18]));
  LUT4 #(
    .INIT(16'hB888)) 
    \x2_real_buff[19]_i_1 
       (.I0(ram_2_real_dout_a[19]),
        .I1(p_reg_reg),
        .I2(p_reg_reg_0),
        .I3(DOADO[19]),
        .O(D[19]));
  LUT4 #(
    .INIT(16'hB888)) 
    \x2_real_buff[1]_i_1 
       (.I0(ram_2_real_dout_a[1]),
        .I1(p_reg_reg),
        .I2(p_reg_reg_0),
        .I3(DOADO[1]),
        .O(D[1]));
  LUT4 #(
    .INIT(16'hB888)) 
    \x2_real_buff[20]_i_1 
       (.I0(ram_2_real_dout_a[20]),
        .I1(p_reg_reg),
        .I2(p_reg_reg_0),
        .I3(DOADO[20]),
        .O(D[20]));
  LUT4 #(
    .INIT(16'hB888)) 
    \x2_real_buff[21]_i_1 
       (.I0(ram_2_real_dout_a[21]),
        .I1(p_reg_reg),
        .I2(p_reg_reg_0),
        .I3(DOADO[21]),
        .O(D[21]));
  LUT4 #(
    .INIT(16'hB888)) 
    \x2_real_buff[22]_i_1 
       (.I0(ram_2_real_dout_a[22]),
        .I1(p_reg_reg),
        .I2(p_reg_reg_0),
        .I3(DOADO[22]),
        .O(D[22]));
  LUT4 #(
    .INIT(16'hB888)) 
    \x2_real_buff[23]_i_1 
       (.I0(ram_2_real_dout_a[23]),
        .I1(p_reg_reg),
        .I2(p_reg_reg_0),
        .I3(DOADO[23]),
        .O(D[23]));
  LUT4 #(
    .INIT(16'hB888)) 
    \x2_real_buff[2]_i_1 
       (.I0(ram_2_real_dout_a[2]),
        .I1(p_reg_reg),
        .I2(p_reg_reg_0),
        .I3(DOADO[2]),
        .O(D[2]));
  LUT4 #(
    .INIT(16'hB888)) 
    \x2_real_buff[3]_i_1 
       (.I0(ram_2_real_dout_a[3]),
        .I1(p_reg_reg),
        .I2(p_reg_reg_0),
        .I3(DOADO[3]),
        .O(D[3]));
  LUT4 #(
    .INIT(16'hB888)) 
    \x2_real_buff[4]_i_1 
       (.I0(ram_2_real_dout_a[4]),
        .I1(p_reg_reg),
        .I2(p_reg_reg_0),
        .I3(DOADO[4]),
        .O(D[4]));
  LUT4 #(
    .INIT(16'hB888)) 
    \x2_real_buff[5]_i_1 
       (.I0(ram_2_real_dout_a[5]),
        .I1(p_reg_reg),
        .I2(p_reg_reg_0),
        .I3(DOADO[5]),
        .O(D[5]));
  LUT4 #(
    .INIT(16'hB888)) 
    \x2_real_buff[6]_i_1 
       (.I0(ram_2_real_dout_a[6]),
        .I1(p_reg_reg),
        .I2(p_reg_reg_0),
        .I3(DOADO[6]),
        .O(D[6]));
  LUT4 #(
    .INIT(16'hB888)) 
    \x2_real_buff[7]_i_1 
       (.I0(ram_2_real_dout_a[7]),
        .I1(p_reg_reg),
        .I2(p_reg_reg_0),
        .I3(DOADO[7]),
        .O(D[7]));
  LUT4 #(
    .INIT(16'hB888)) 
    \x2_real_buff[8]_i_1 
       (.I0(ram_2_real_dout_a[8]),
        .I1(p_reg_reg),
        .I2(p_reg_reg_0),
        .I3(DOADO[8]),
        .O(D[8]));
  LUT4 #(
    .INIT(16'hB888)) 
    \x2_real_buff[9]_i_1 
       (.I0(ram_2_real_dout_a[9]),
        .I1(p_reg_reg),
        .I2(p_reg_reg_0),
        .I3(DOADO[9]),
        .O(D[9]));
endmodule

(* ORIG_REF_NAME = "smpl_ram" *) 
module smpl_ram__parameterized0_7
   (DOADO,
    WEA,
    clk100M_IBUF_BUFG,
    Q,
    din_b_i,
    ram_array_reg_0,
    ram_array_reg_1,
    ram_array_reg_2,
    ram_array_reg_3);
  output [23:0]DOADO;
  output [0:0]WEA;
  input clk100M_IBUF_BUFG;
  input [9:0]Q;
  input [23:0]din_b_i;
  input ram_array_reg_0;
  input ram_array_reg_1;
  input ram_array_reg_2;
  input ram_array_reg_3;

  wire [23:0]DOADO;
  wire [9:0]Q;
  wire [0:0]WEA;
  wire clk100M_IBUF_BUFG;
  wire [23:0]din_b_i;
  wire ram_array_reg_0;
  wire ram_array_reg_1;
  wire ram_array_reg_2;
  wire ram_array_reg_3;
  wire NLW_ram_array_reg_CASCADEOUTA_UNCONNECTED;
  wire NLW_ram_array_reg_CASCADEOUTB_UNCONNECTED;
  wire NLW_ram_array_reg_DBITERR_UNCONNECTED;
  wire NLW_ram_array_reg_INJECTDBITERR_UNCONNECTED;
  wire NLW_ram_array_reg_INJECTSBITERR_UNCONNECTED;
  wire NLW_ram_array_reg_SBITERR_UNCONNECTED;
  wire [31:24]NLW_ram_array_reg_DOADO_UNCONNECTED;
  wire [31:0]NLW_ram_array_reg_DOBDO_UNCONNECTED;
  wire [3:0]NLW_ram_array_reg_DOPADOP_UNCONNECTED;
  wire [3:0]NLW_ram_array_reg_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_ram_array_reg_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_ram_array_reg_RDADDRECC_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d24" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "24576" *) 
  (* RTL_RAM_NAME = "spec_anal/controller/core/inst[4].smpl_ram_inst/ram_array" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "23" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(0)) 
    ram_array_reg
       (.ADDRARDADDR({1'b1,Q,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b1),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(NLW_ram_array_reg_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_ram_array_reg_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(clk100M_IBUF_BUFG),
        .CLKBWRCLK(1'b0),
        .DBITERR(NLW_ram_array_reg_DBITERR_UNCONNECTED),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din_b_i}),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b1,1'b1,1'b1,1'b1}),
        .DOADO({NLW_ram_array_reg_DOADO_UNCONNECTED[31:24],DOADO}),
        .DOBDO(NLW_ram_array_reg_DOBDO_UNCONNECTED[31:0]),
        .DOPADOP(NLW_ram_array_reg_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP(NLW_ram_array_reg_DOPBDOP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_ram_array_reg_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(1'b1),
        .ENBWREN(1'b0),
        .INJECTDBITERR(NLW_ram_array_reg_INJECTDBITERR_UNCONNECTED),
        .INJECTSBITERR(NLW_ram_array_reg_INJECTSBITERR_UNCONNECTED),
        .RDADDRECC(NLW_ram_array_reg_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_ram_array_reg_SBITERR_UNCONNECTED),
        .WEA({WEA,WEA,WEA,WEA}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT4 #(
    .INIT(16'h0600)) 
    ram_array_reg_i_25__1
       (.I0(ram_array_reg_0),
        .I1(ram_array_reg_1),
        .I2(ram_array_reg_2),
        .I3(ram_array_reg_3),
        .O(WEA));
endmodule

(* ORIG_REF_NAME = "smpl_ram" *) 
module smpl_ram__parameterized0_8
   (DOADO,
    clk100M_IBUF_BUFG,
    loading_samples,
    Q,
    ram_array_reg_0,
    din_b_i,
    DOBDO,
    WEA);
  output [23:0]DOADO;
  input clk100M_IBUF_BUFG;
  input loading_samples;
  input [9:0]Q;
  input [9:0]ram_array_reg_0;
  input [23:0]din_b_i;
  input [13:0]DOBDO;
  input [0:0]WEA;

  wire [23:0]DOADO;
  wire [13:0]DOBDO;
  wire [9:0]Q;
  wire [0:0]WEA;
  wire clk100M_IBUF_BUFG;
  wire [23:0]din_b_i;
  wire loading_samples;
  wire [9:0]ram_array_reg_0;
  wire NLW_ram_array_reg_CASCADEOUTA_UNCONNECTED;
  wire NLW_ram_array_reg_CASCADEOUTB_UNCONNECTED;
  wire NLW_ram_array_reg_DBITERR_UNCONNECTED;
  wire NLW_ram_array_reg_INJECTDBITERR_UNCONNECTED;
  wire NLW_ram_array_reg_INJECTSBITERR_UNCONNECTED;
  wire NLW_ram_array_reg_SBITERR_UNCONNECTED;
  wire [31:24]NLW_ram_array_reg_DOADO_UNCONNECTED;
  wire [31:0]NLW_ram_array_reg_DOBDO_UNCONNECTED;
  wire [3:0]NLW_ram_array_reg_DOPADOP_UNCONNECTED;
  wire [3:0]NLW_ram_array_reg_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_ram_array_reg_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_ram_array_reg_RDADDRECC_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d24" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d24" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}} {SYNTH-7 {cell *THIS*}}" *) 
  (* \PinAttr:ADDRBWRADDR[5]:HOLD_DETOUR  = "163" *) 
  (* RTL_RAM_BITS = "24576" *) 
  (* RTL_RAM_NAME = "spec_anal/controller/core/inst[5].smpl_ram_inst/ram_array" *) 
  (* RTL_RAM_TYPE = "RAM_TDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "23" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(36),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("READ_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(36)) 
    ram_array_reg
       (.ADDRARDADDR({1'b1,Q,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,ram_array_reg_0[0],ram_array_reg_0[1],ram_array_reg_0[2],ram_array_reg_0[3],ram_array_reg_0[4],ram_array_reg_0[5],ram_array_reg_0[6],ram_array_reg_0[7],ram_array_reg_0[8],ram_array_reg_0[9],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b1),
        .CASCADEINB(1'b1),
        .CASCADEOUTA(NLW_ram_array_reg_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_ram_array_reg_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(clk100M_IBUF_BUFG),
        .CLKBWRCLK(clk100M_IBUF_BUFG),
        .DBITERR(NLW_ram_array_reg_DBITERR_UNCONNECTED),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din_b_i}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,DOBDO}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({NLW_ram_array_reg_DOADO_UNCONNECTED[31:24],DOADO}),
        .DOBDO(NLW_ram_array_reg_DOBDO_UNCONNECTED[31:0]),
        .DOPADOP(NLW_ram_array_reg_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP(NLW_ram_array_reg_DOPBDOP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_ram_array_reg_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(1'b1),
        .ENBWREN(loading_samples),
        .INJECTDBITERR(NLW_ram_array_reg_INJECTDBITERR_UNCONNECTED),
        .INJECTSBITERR(NLW_ram_array_reg_INJECTSBITERR_UNCONNECTED),
        .RDADDRECC(NLW_ram_array_reg_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_ram_array_reg_SBITERR_UNCONNECTED),
        .WEA({WEA,WEA,WEA,WEA}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1}));
endmodule

module spec_anal_top_level
   (DOBDO,
    codec_rstn_OBUF,
    codec_mclk_OBUF,
    S,
    codec_lrclk_OBUF,
    frm_dout_vld_reg_reg,
    clk100M_IBUF_BUFG,
    CLK,
    Q,
    rstbt_IBUF,
    \write_cntr_reg[1] ,
    SR,
    display_ram_we_reg,
    display_ram_we,
    display_ram_we_reg_0,
    D);
  output [23:0]DOBDO;
  output codec_rstn_OBUF;
  output codec_mclk_OBUF;
  output [0:0]S;
  output codec_lrclk_OBUF;
  output frm_dout_vld_reg_reg;
  input clk100M_IBUF_BUFG;
  input CLK;
  input [9:0]Q;
  input rstbt_IBUF;
  input \write_cntr_reg[1] ;
  input [0:0]SR;
  input display_ram_we_reg;
  input display_ram_we;
  input display_ram_we_reg_0;
  input [0:0]D;

  wire CLK;
  wire [0:0]D;
  wire [23:0]DOBDO;
  wire [9:0]Q;
  wire [0:0]S;
  wire [0:0]SR;
  wire [23:0]aud_dout;
  wire aud_dout_vld;
  wire clk100M_IBUF_BUFG;
  wire codec_if_inst_n_5;
  wire codec_lrclk_OBUF;
  wire codec_mclk_OBUF;
  wire codec_rstn_OBUF;
  wire display_ram_we;
  wire display_ram_we_reg;
  wire display_ram_we_reg_0;
  wire frm_dout_vld_reg_reg;
  wire rstbt_IBUF;
  wire [0:0]smpl_addr_cntr_reg;
  wire \write_cntr_reg[1] ;

  codec_if codec_if_inst
       (.D(D),
        .Q(aud_dout),
        .S(S),
        .aud_dout_vld(aud_dout_vld),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG),
        .codec_mclk_OBUF(codec_mclk_OBUF),
        .codec_rstn_OBUF(codec_rstn_OBUF),
        .\genblk1.aud_dout_vld_reg[0]_0 (codec_if_inst_n_5),
        .\genblk1.div_cntr_reg[10]_0 (codec_lrclk_OBUF),
        .rstbt_IBUF(rstbt_IBUF),
        .smpl_addr_cntr_reg(smpl_addr_cntr_reg));
  FFT_Controller controller
       (.CLK(CLK),
        .DOBDO(DOBDO),
        .Q(aud_dout),
        .SR(SR),
        .aud_dout_vld(aud_dout_vld),
        .clk100M_IBUF_BUFG(clk100M_IBUF_BUFG),
        .display_ram_we(display_ram_we),
        .display_ram_we_reg(display_ram_we_reg),
        .display_ram_we_reg_0(display_ram_we_reg_0),
        .frm_dout_vld_reg_reg_0(frm_dout_vld_reg_reg),
        .ram_array_reg(Q),
        .rstbt_IBUF(rstbt_IBUF),
        .\smpl_addr_cntr_reg[0]_0 (smpl_addr_cntr_reg),
        .\smpl_addr_cntr_reg[0]_1 (codec_if_inst_n_5),
        .\write_cntr_reg[1] (\write_cntr_reg[1] ));
endmodule

module tmds_encoder
   (rst,
    \tmds_out_reg[0]_0 ,
    tx_clk,
    tx_dv,
    D,
    Q,
    tx_blue);
  input rst;
  output \tmds_out_reg[0]_0 ;
  input tx_clk;
  input tx_dv;
  input [1:0]D;
  output [9:0]Q;
  input [7:0]tx_blue;

  wire [1:0]D;
  wire [9:0]Q;
  wire \cnt[1]_i_1__0_n_0 ;
  wire \cnt[2]_i_1__1_n_0 ;
  wire \cnt[2]_i_2__1_n_0 ;
  wire \cnt[2]_i_3__1_n_0 ;
  wire \cnt[3]_i_1__1_n_0 ;
  wire \cnt[3]_i_2__1_n_0 ;
  wire \cnt[3]_i_3__1_n_0 ;
  wire \cnt[3]_i_4__1_n_0 ;
  wire \cnt[4]_i_10__1_n_0 ;
  wire \cnt[4]_i_11__1_n_0 ;
  wire \cnt[4]_i_12__1_n_0 ;
  wire \cnt[4]_i_13__0_n_0 ;
  wire \cnt[4]_i_14__0_n_0 ;
  wire \cnt[4]_i_1__1_n_0 ;
  wire \cnt[4]_i_2__1_n_0 ;
  wire \cnt[4]_i_3__1_n_0 ;
  wire \cnt[4]_i_4__1_n_0 ;
  wire \cnt[4]_i_5__1_n_0 ;
  wire \cnt[4]_i_6__1_n_0 ;
  wire \cnt[4]_i_7__1_n_0 ;
  wire \cnt[4]_i_8__1_n_0 ;
  wire \cnt[4]_i_9__0_n_0 ;
  wire [3:1]cnt_reg_n_0_;
  wire [5:0]ctrl_reg_reg_n_0_;
  wire [1:0]data_en_reg_reg_n_0_;
  wire [7:0]data_in_reg_reg_n_0_;
  wire [3:0]din_num_1s;
  wire p_0_in;
  wire p_2_in;
  wire rst;
  wire [3:0]s1_num_1s;
  wire \s1_num_1s[0]_i_1_n_0 ;
  wire \s1_num_1s[0]_i_2_n_0 ;
  wire \s1_num_1s[1]_i_1_n_0 ;
  wire \s1_num_1s[1]_i_2_n_0 ;
  wire \s1_num_1s[2]_i_1_n_0 ;
  wire \s1_num_1s[2]_i_2_n_0 ;
  wire \s1_num_1s[3]_i_1_n_0 ;
  wire \s1_num_1s[3]_i_2_n_0 ;
  wire \s1_num_1s[3]_i_3_n_0 ;
  wire \s1_num_1s[3]_i_4_n_0 ;
  wire [8:1]stage1;
  wire \stage1_out[7]_i_3__1_n_0 ;
  wire [8:0]stage1_out_reg_n_0_;
  wire [7:0]stage2_in_reg_n_0_;
  wire \tmds_out[0]_i_1__1_n_0 ;
  wire \tmds_out[1]_i_1__1_n_0 ;
  wire \tmds_out[2]_i_1_n_0 ;
  wire \tmds_out[3]_i_1__1_n_0 ;
  wire \tmds_out[4]_i_1_n_0 ;
  wire \tmds_out[5]_i_1__1_n_0 ;
  wire \tmds_out[6]_i_1_n_0 ;
  wire \tmds_out[7]_i_1__1_n_0 ;
  wire \tmds_out[8]_i_1__1_n_0 ;
  wire \tmds_out[9]_i_1_n_0 ;
  wire \tmds_out[9]_i_2_n_0 ;
  wire \tmds_out[9]_i_3_n_0 ;
  wire \tmds_out[9]_i_4_n_0 ;
  wire \tmds_out_reg[0]_0 ;
  wire [7:0]tx_blue;
  wire tx_clk;
  wire tx_dv;

  LUT6 #(
    .INIT(64'h208A8A2002A8A802)) 
    \cnt[1]_i_1__0 
       (.I0(\tmds_out_reg[0]_0 ),
        .I1(\cnt[4]_i_5__1_n_0 ),
        .I2(p_2_in),
        .I3(cnt_reg_n_0_[1]),
        .I4(s1_num_1s[0]),
        .I5(\cnt[4]_i_3__1_n_0 ),
        .O(\cnt[1]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'h02A2)) 
    \cnt[2]_i_1__1 
       (.I0(\tmds_out_reg[0]_0 ),
        .I1(\cnt[2]_i_2__1_n_0 ),
        .I2(\cnt[4]_i_5__1_n_0 ),
        .I3(\cnt[2]_i_3__1_n_0 ),
        .O(\cnt[2]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h9996699969999996)) 
    \cnt[2]_i_2__1 
       (.I0(s1_num_1s[1]),
        .I1(cnt_reg_n_0_[2]),
        .I2(p_2_in),
        .I3(cnt_reg_n_0_[1]),
        .I4(s1_num_1s[0]),
        .I5(\cnt[4]_i_3__1_n_0 ),
        .O(\cnt[2]_i_2__1_n_0 ));
  LUT5 #(
    .INIT(32'h7B84847B)) 
    \cnt[2]_i_3__1 
       (.I0(p_2_in),
        .I1(s1_num_1s[0]),
        .I2(cnt_reg_n_0_[1]),
        .I3(cnt_reg_n_0_[2]),
        .I4(s1_num_1s[1]),
        .O(\cnt[2]_i_3__1_n_0 ));
  LUT4 #(
    .INIT(16'hE200)) 
    \cnt[3]_i_1__1 
       (.I0(\cnt[3]_i_2__1_n_0 ),
        .I1(\cnt[4]_i_5__1_n_0 ),
        .I2(\cnt[3]_i_3__1_n_0 ),
        .I3(\tmds_out_reg[0]_0 ),
        .O(\cnt[3]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h74B874478B478BB8)) 
    \cnt[3]_i_2__1 
       (.I0(\cnt[4]_i_9__0_n_0 ),
        .I1(\cnt[4]_i_3__1_n_0 ),
        .I2(\cnt[4]_i_7__1_n_0 ),
        .I3(s1_num_1s[1]),
        .I4(cnt_reg_n_0_[2]),
        .I5(\cnt[3]_i_4__1_n_0 ),
        .O(\cnt[3]_i_2__1_n_0 ));
  LUT6 #(
    .INIT(64'hBAD58010452A7FEF)) 
    \cnt[3]_i_3__1 
       (.I0(p_2_in),
        .I1(cnt_reg_n_0_[1]),
        .I2(s1_num_1s[0]),
        .I3(cnt_reg_n_0_[2]),
        .I4(s1_num_1s[1]),
        .I5(\cnt[3]_i_4__1_n_0 ),
        .O(\cnt[3]_i_3__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \cnt[3]_i_4__1 
       (.I0(s1_num_1s[2]),
        .I1(cnt_reg_n_0_[3]),
        .O(\cnt[3]_i_4__1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt[4]_i_10__1 
       (.I0(cnt_reg_n_0_[2]),
        .I1(s1_num_1s[1]),
        .O(\cnt[4]_i_10__1_n_0 ));
  LUT4 #(
    .INIT(16'h0010)) 
    \cnt[4]_i_11__1 
       (.I0(s1_num_1s[0]),
        .I1(s1_num_1s[1]),
        .I2(s1_num_1s[2]),
        .I3(s1_num_1s[3]),
        .O(\cnt[4]_i_11__1_n_0 ));
  LUT4 #(
    .INIT(16'h077F)) 
    \cnt[4]_i_12__1 
       (.I0(s1_num_1s[0]),
        .I1(cnt_reg_n_0_[1]),
        .I2(s1_num_1s[1]),
        .I3(cnt_reg_n_0_[2]),
        .O(\cnt[4]_i_12__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \cnt[4]_i_13__0 
       (.I0(s1_num_1s[3]),
        .I1(p_0_in),
        .O(\cnt[4]_i_13__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF2F022F02FFFF)) 
    \cnt[4]_i_14__0 
       (.I0(s1_num_1s[0]),
        .I1(cnt_reg_n_0_[1]),
        .I2(cnt_reg_n_0_[2]),
        .I3(s1_num_1s[1]),
        .I4(cnt_reg_n_0_[3]),
        .I5(s1_num_1s[2]),
        .O(\cnt[4]_i_14__0_n_0 ));
  LUT6 #(
    .INIT(64'h000002A2AAAA02A2)) 
    \cnt[4]_i_1__1 
       (.I0(\tmds_out_reg[0]_0 ),
        .I1(\cnt[4]_i_2__1_n_0 ),
        .I2(\cnt[4]_i_3__1_n_0 ),
        .I3(\cnt[4]_i_4__1_n_0 ),
        .I4(\cnt[4]_i_5__1_n_0 ),
        .I5(\cnt[4]_i_6__1_n_0 ),
        .O(\cnt[4]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h7EE8811781177EE8)) 
    \cnt[4]_i_2__1 
       (.I0(\cnt[4]_i_7__1_n_0 ),
        .I1(\cnt[4]_i_8__1_n_0 ),
        .I2(s1_num_1s[2]),
        .I3(cnt_reg_n_0_[3]),
        .I4(s1_num_1s[3]),
        .I5(p_0_in),
        .O(\cnt[4]_i_2__1_n_0 ));
  LUT5 #(
    .INIT(32'h33326666)) 
    \cnt[4]_i_3__1 
       (.I0(s1_num_1s[3]),
        .I1(p_0_in),
        .I2(s1_num_1s[0]),
        .I3(s1_num_1s[1]),
        .I4(s1_num_1s[2]),
        .O(\cnt[4]_i_3__1_n_0 ));
  LUT6 #(
    .INIT(64'h6999666999966999)) 
    \cnt[4]_i_4__1 
       (.I0(s1_num_1s[3]),
        .I1(p_0_in),
        .I2(\cnt[4]_i_9__0_n_0 ),
        .I3(\cnt[4]_i_10__1_n_0 ),
        .I4(s1_num_1s[2]),
        .I5(cnt_reg_n_0_[3]),
        .O(\cnt[4]_i_4__1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF0001)) 
    \cnt[4]_i_5__1 
       (.I0(cnt_reg_n_0_[2]),
        .I1(cnt_reg_n_0_[1]),
        .I2(p_0_in),
        .I3(cnt_reg_n_0_[3]),
        .I4(\cnt[4]_i_11__1_n_0 ),
        .O(\cnt[4]_i_5__1_n_0 ));
  LUT6 #(
    .INIT(64'h4B0F3C87783C0FB4)) 
    \cnt[4]_i_6__1 
       (.I0(\cnt[4]_i_12__1_n_0 ),
        .I1(p_2_in),
        .I2(\cnt[4]_i_13__0_n_0 ),
        .I3(s1_num_1s[2]),
        .I4(cnt_reg_n_0_[3]),
        .I5(\cnt[4]_i_14__0_n_0 ),
        .O(\cnt[4]_i_6__1_n_0 ));
  LUT5 #(
    .INIT(32'hFE8080FE)) 
    \cnt[4]_i_7__1 
       (.I0(p_2_in),
        .I1(cnt_reg_n_0_[1]),
        .I2(s1_num_1s[0]),
        .I3(cnt_reg_n_0_[2]),
        .I4(s1_num_1s[1]),
        .O(\cnt[4]_i_7__1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \cnt[4]_i_8__1 
       (.I0(s1_num_1s[1]),
        .I1(cnt_reg_n_0_[2]),
        .O(\cnt[4]_i_8__1_n_0 ));
  LUT5 #(
    .INIT(32'hFD4040FD)) 
    \cnt[4]_i_9__0 
       (.I0(s1_num_1s[0]),
        .I1(cnt_reg_n_0_[1]),
        .I2(p_2_in),
        .I3(s1_num_1s[1]),
        .I4(cnt_reg_n_0_[2]),
        .O(\cnt[4]_i_9__0_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[1] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\cnt[1]_i_1__0_n_0 ),
        .Q(cnt_reg_n_0_[1]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[2] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\cnt[2]_i_1__1_n_0 ),
        .Q(cnt_reg_n_0_[2]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[3] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\cnt[3]_i_1__1_n_0 ),
        .Q(cnt_reg_n_0_[3]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[4] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\cnt[4]_i_1__1_n_0 ),
        .Q(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[0] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(D[0]),
        .Q(ctrl_reg_reg_n_0_[0]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[1] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(D[1]),
        .Q(ctrl_reg_reg_n_0_[1]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[2] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(ctrl_reg_reg_n_0_[0]),
        .Q(ctrl_reg_reg_n_0_[2]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[3] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(ctrl_reg_reg_n_0_[1]),
        .Q(ctrl_reg_reg_n_0_[3]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[4] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(ctrl_reg_reg_n_0_[2]),
        .Q(ctrl_reg_reg_n_0_[4]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[5] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(ctrl_reg_reg_n_0_[3]),
        .Q(ctrl_reg_reg_n_0_[5]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \data_en_reg_reg[0] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(tx_dv),
        .Q(data_en_reg_reg_n_0_[0]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \data_en_reg_reg[1] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(data_en_reg_reg_n_0_[0]),
        .Q(data_en_reg_reg_n_0_[1]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \data_en_reg_reg[2] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(data_en_reg_reg_n_0_[1]),
        .Q(\tmds_out_reg[0]_0 ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg_reg[0] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(tx_blue[0]),
        .Q(data_in_reg_reg_n_0_[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg_reg[1] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(tx_blue[1]),
        .Q(data_in_reg_reg_n_0_[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg_reg[2] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(tx_blue[2]),
        .Q(data_in_reg_reg_n_0_[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg_reg[3] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(tx_blue[3]),
        .Q(data_in_reg_reg_n_0_[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg_reg[4] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(tx_blue[4]),
        .Q(data_in_reg_reg_n_0_[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg_reg[5] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(tx_blue[5]),
        .Q(data_in_reg_reg_n_0_[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg_reg[6] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(tx_blue[6]),
        .Q(data_in_reg_reg_n_0_[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg_reg[7] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(tx_blue[7]),
        .Q(data_in_reg_reg_n_0_[7]),
        .R(1'b0));
  (* OPT_MODIFIED = "PROPCONST" *) 
  FDRE #(
    .INIT(1'b0)) 
    \din_num_1s_reg[3] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(tx_blue[5]),
        .Q(din_num_1s[3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \s1_num_1s[0]_i_1 
       (.I0(stage1_out_reg_n_0_[0]),
        .I1(stage1_out_reg_n_0_[4]),
        .I2(\s1_num_1s[0]_i_2_n_0 ),
        .I3(stage1_out_reg_n_0_[5]),
        .I4(stage1_out_reg_n_0_[7]),
        .I5(stage1_out_reg_n_0_[6]),
        .O(\s1_num_1s[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \s1_num_1s[0]_i_2 
       (.I0(stage1_out_reg_n_0_[2]),
        .I1(stage1_out_reg_n_0_[3]),
        .I2(stage1_out_reg_n_0_[1]),
        .O(\s1_num_1s[0]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \s1_num_1s[1]_i_1 
       (.I0(\s1_num_1s[3]_i_2_n_0 ),
        .I1(\s1_num_1s[1]_i_2_n_0 ),
        .I2(\s1_num_1s[3]_i_3_n_0 ),
        .O(\s1_num_1s[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h171717E817E8E8E8)) 
    \s1_num_1s[1]_i_2 
       (.I0(stage1_out_reg_n_0_[6]),
        .I1(stage1_out_reg_n_0_[5]),
        .I2(stage1_out_reg_n_0_[7]),
        .I3(stage1_out_reg_n_0_[2]),
        .I4(stage1_out_reg_n_0_[1]),
        .I5(stage1_out_reg_n_0_[3]),
        .O(\s1_num_1s[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7E7E7EE87EE8E8E8)) 
    \s1_num_1s[2]_i_1 
       (.I0(\s1_num_1s[3]_i_2_n_0 ),
        .I1(\s1_num_1s[3]_i_3_n_0 ),
        .I2(\s1_num_1s[2]_i_2_n_0 ),
        .I3(stage1_out_reg_n_0_[3]),
        .I4(stage1_out_reg_n_0_[1]),
        .I5(stage1_out_reg_n_0_[2]),
        .O(\s1_num_1s[2]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \s1_num_1s[2]_i_2 
       (.I0(stage1_out_reg_n_0_[7]),
        .I1(stage1_out_reg_n_0_[5]),
        .I2(stage1_out_reg_n_0_[6]),
        .O(\s1_num_1s[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8880800000000000)) 
    \s1_num_1s[3]_i_1 
       (.I0(\s1_num_1s[3]_i_2_n_0 ),
        .I1(\s1_num_1s[3]_i_3_n_0 ),
        .I2(stage1_out_reg_n_0_[6]),
        .I3(stage1_out_reg_n_0_[5]),
        .I4(stage1_out_reg_n_0_[7]),
        .I5(\s1_num_1s[3]_i_4_n_0 ),
        .O(\s1_num_1s[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9600009600969600)) 
    \s1_num_1s[3]_i_2 
       (.I0(stage1_out_reg_n_0_[5]),
        .I1(stage1_out_reg_n_0_[7]),
        .I2(stage1_out_reg_n_0_[6]),
        .I3(stage1_out_reg_n_0_[0]),
        .I4(stage1_out_reg_n_0_[4]),
        .I5(\s1_num_1s[0]_i_2_n_0 ),
        .O(\s1_num_1s[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hE88E8EE8)) 
    \s1_num_1s[3]_i_3 
       (.I0(stage1_out_reg_n_0_[4]),
        .I1(stage1_out_reg_n_0_[0]),
        .I2(stage1_out_reg_n_0_[1]),
        .I3(stage1_out_reg_n_0_[3]),
        .I4(stage1_out_reg_n_0_[2]),
        .O(\s1_num_1s[3]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \s1_num_1s[3]_i_4 
       (.I0(stage1_out_reg_n_0_[3]),
        .I1(stage1_out_reg_n_0_[1]),
        .I2(stage1_out_reg_n_0_[2]),
        .O(\s1_num_1s[3]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s1_num_1s_reg[0] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(\s1_num_1s[0]_i_1_n_0 ),
        .Q(s1_num_1s[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1_num_1s_reg[1] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(\s1_num_1s[1]_i_1_n_0 ),
        .Q(s1_num_1s[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1_num_1s_reg[2] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(\s1_num_1s[2]_i_1_n_0 ),
        .Q(s1_num_1s[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1_num_1s_reg[3] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(\s1_num_1s[3]_i_1_n_0 ),
        .Q(s1_num_1s[3]),
        .R(1'b0));
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \stage1_out[1]_i_1__1 
       (.I0(data_in_reg_reg_n_0_[1]),
        .I1(data_in_reg_reg_n_0_[0]),
        .I2(din_num_1s[3]),
        .O(stage1[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \stage1_out[2]_i_1__1 
       (.I0(data_in_reg_reg_n_0_[2]),
        .I1(data_in_reg_reg_n_0_[1]),
        .I2(data_in_reg_reg_n_0_[0]),
        .O(stage1[2]));
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    \stage1_out[3]_i_1__1 
       (.I0(data_in_reg_reg_n_0_[3]),
        .I1(data_in_reg_reg_n_0_[2]),
        .I2(data_in_reg_reg_n_0_[1]),
        .I3(data_in_reg_reg_n_0_[0]),
        .I4(din_num_1s[3]),
        .O(stage1[3]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    \stage1_out[4]_i_1__1 
       (.I0(data_in_reg_reg_n_0_[4]),
        .I1(data_in_reg_reg_n_0_[3]),
        .I2(data_in_reg_reg_n_0_[2]),
        .I3(data_in_reg_reg_n_0_[1]),
        .I4(data_in_reg_reg_n_0_[0]),
        .O(stage1[4]));
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \stage1_out[5]_i_1__1 
       (.I0(\stage1_out[7]_i_3__1_n_0 ),
        .I1(din_num_1s[3]),
        .O(stage1[5]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \stage1_out[6]_i_1__1 
       (.I0(\stage1_out[7]_i_3__1_n_0 ),
        .I1(data_in_reg_reg_n_0_[6]),
        .O(stage1[6]));
  (* OPT_MODIFIED = "PROPCONST" *) 
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \stage1_out[7]_i_1__1 
       (.I0(data_in_reg_reg_n_0_[6]),
        .I1(din_num_1s[3]),
        .I2(data_in_reg_reg_n_0_[7]),
        .I3(\stage1_out[7]_i_3__1_n_0 ),
        .O(stage1[7]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \stage1_out[7]_i_3__1 
       (.I0(data_in_reg_reg_n_0_[3]),
        .I1(data_in_reg_reg_n_0_[2]),
        .I2(data_in_reg_reg_n_0_[1]),
        .I3(data_in_reg_reg_n_0_[0]),
        .I4(data_in_reg_reg_n_0_[4]),
        .I5(data_in_reg_reg_n_0_[5]),
        .O(\stage1_out[7]_i_3__1_n_0 ));
  (* OPT_MODIFIED = "PROPCONST" *) 
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \stage1_out[8]_i_1__1 
       (.I0(din_num_1s[3]),
        .O(stage1[8]));
  FDRE #(
    .INIT(1'b0)) 
    \stage1_out_reg[0] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(data_in_reg_reg_n_0_[0]),
        .Q(stage1_out_reg_n_0_[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage1_out_reg[1] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1[1]),
        .Q(stage1_out_reg_n_0_[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage1_out_reg[2] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1[2]),
        .Q(stage1_out_reg_n_0_[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage1_out_reg[3] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1[3]),
        .Q(stage1_out_reg_n_0_[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage1_out_reg[4] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1[4]),
        .Q(stage1_out_reg_n_0_[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage1_out_reg[5] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1[5]),
        .Q(stage1_out_reg_n_0_[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage1_out_reg[6] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1[6]),
        .Q(stage1_out_reg_n_0_[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage1_out_reg[7] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1[7]),
        .Q(stage1_out_reg_n_0_[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage1_out_reg[8] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1[8]),
        .Q(stage1_out_reg_n_0_[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage2_in_reg[0] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1_out_reg_n_0_[0]),
        .Q(stage2_in_reg_n_0_[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage2_in_reg[1] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1_out_reg_n_0_[1]),
        .Q(stage2_in_reg_n_0_[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage2_in_reg[2] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1_out_reg_n_0_[2]),
        .Q(stage2_in_reg_n_0_[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage2_in_reg[3] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1_out_reg_n_0_[3]),
        .Q(stage2_in_reg_n_0_[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage2_in_reg[4] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1_out_reg_n_0_[4]),
        .Q(stage2_in_reg_n_0_[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage2_in_reg[5] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1_out_reg_n_0_[5]),
        .Q(stage2_in_reg_n_0_[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage2_in_reg[6] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1_out_reg_n_0_[6]),
        .Q(stage2_in_reg_n_0_[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage2_in_reg[7] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1_out_reg_n_0_[7]),
        .Q(stage2_in_reg_n_0_[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage2_in_reg[8] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1_out_reg_n_0_[8]),
        .Q(p_2_in),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h6F60)) 
    \tmds_out[0]_i_1__1 
       (.I0(stage2_in_reg_n_0_[0]),
        .I1(\tmds_out[9]_i_2_n_0 ),
        .I2(\tmds_out_reg[0]_0 ),
        .I3(ctrl_reg_reg_n_0_[4]),
        .O(\tmds_out[0]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h6F60)) 
    \tmds_out[1]_i_1__1 
       (.I0(stage2_in_reg_n_0_[1]),
        .I1(\tmds_out[9]_i_2_n_0 ),
        .I2(\tmds_out_reg[0]_0 ),
        .I3(ctrl_reg_reg_n_0_[4]),
        .O(\tmds_out[1]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h278D)) 
    \tmds_out[2]_i_1 
       (.I0(\tmds_out_reg[0]_0 ),
        .I1(\tmds_out[9]_i_2_n_0 ),
        .I2(ctrl_reg_reg_n_0_[4]),
        .I3(stage2_in_reg_n_0_[2]),
        .O(\tmds_out[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h6F60)) 
    \tmds_out[3]_i_1__1 
       (.I0(stage2_in_reg_n_0_[3]),
        .I1(\tmds_out[9]_i_2_n_0 ),
        .I2(\tmds_out_reg[0]_0 ),
        .I3(ctrl_reg_reg_n_0_[4]),
        .O(\tmds_out[3]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h278D)) 
    \tmds_out[4]_i_1 
       (.I0(\tmds_out_reg[0]_0 ),
        .I1(\tmds_out[9]_i_2_n_0 ),
        .I2(ctrl_reg_reg_n_0_[4]),
        .I3(stage2_in_reg_n_0_[4]),
        .O(\tmds_out[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h6F60)) 
    \tmds_out[5]_i_1__1 
       (.I0(stage2_in_reg_n_0_[5]),
        .I1(\tmds_out[9]_i_2_n_0 ),
        .I2(\tmds_out_reg[0]_0 ),
        .I3(ctrl_reg_reg_n_0_[4]),
        .O(\tmds_out[5]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h278D)) 
    \tmds_out[6]_i_1 
       (.I0(\tmds_out_reg[0]_0 ),
        .I1(\tmds_out[9]_i_2_n_0 ),
        .I2(ctrl_reg_reg_n_0_[4]),
        .I3(stage2_in_reg_n_0_[6]),
        .O(\tmds_out[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h6F60)) 
    \tmds_out[7]_i_1__1 
       (.I0(stage2_in_reg_n_0_[7]),
        .I1(\tmds_out[9]_i_2_n_0 ),
        .I2(\tmds_out_reg[0]_0 ),
        .I3(ctrl_reg_reg_n_0_[4]),
        .O(\tmds_out[7]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hC5)) 
    \tmds_out[8]_i_1__1 
       (.I0(ctrl_reg_reg_n_0_[4]),
        .I1(p_2_in),
        .I2(\tmds_out_reg[0]_0 ),
        .O(\tmds_out[8]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hB88B)) 
    \tmds_out[9]_i_1 
       (.I0(\tmds_out[9]_i_2_n_0 ),
        .I1(\tmds_out_reg[0]_0 ),
        .I2(ctrl_reg_reg_n_0_[4]),
        .I3(ctrl_reg_reg_n_0_[5]),
        .O(\tmds_out[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4547444775747774)) 
    \tmds_out[9]_i_2 
       (.I0(p_2_in),
        .I1(\tmds_out[9]_i_3_n_0 ),
        .I2(s1_num_1s[3]),
        .I3(s1_num_1s[2]),
        .I4(\tmds_out[9]_i_4_n_0 ),
        .I5(p_0_in),
        .O(\tmds_out[9]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \tmds_out[9]_i_3 
       (.I0(cnt_reg_n_0_[3]),
        .I1(p_0_in),
        .I2(cnt_reg_n_0_[1]),
        .I3(cnt_reg_n_0_[2]),
        .O(\tmds_out[9]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \tmds_out[9]_i_4 
       (.I0(s1_num_1s[1]),
        .I1(s1_num_1s[0]),
        .O(\tmds_out[9]_i_4_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \tmds_out_reg[0] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\tmds_out[0]_i_1__1_n_0 ),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \tmds_out_reg[1] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\tmds_out[1]_i_1__1_n_0 ),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \tmds_out_reg[2] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\tmds_out[2]_i_1_n_0 ),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \tmds_out_reg[3] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\tmds_out[3]_i_1__1_n_0 ),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \tmds_out_reg[4] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\tmds_out[4]_i_1_n_0 ),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \tmds_out_reg[5] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\tmds_out[5]_i_1__1_n_0 ),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \tmds_out_reg[6] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\tmds_out[6]_i_1_n_0 ),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \tmds_out_reg[7] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\tmds_out[7]_i_1__1_n_0 ),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \tmds_out_reg[8] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\tmds_out[8]_i_1__1_n_0 ),
        .Q(Q[8]));
  FDCE #(
    .INIT(1'b0)) 
    \tmds_out_reg[9] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\tmds_out[9]_i_1_n_0 ),
        .Q(Q[9]));
endmodule

(* ORIG_REF_NAME = "tmds_encoder" *) 
module tmds_encoder_0
   (data_en_reg_reg,
    rst,
    tx_clk,
    Q,
    tx_green);
  input [2:2]data_en_reg_reg;
  input rst;
  input tx_clk;
  output [9:0]Q;
  input [7:0]tx_green;

  wire [9:0]Q;
  wire \cnt[1]_i_1_n_0 ;
  wire \cnt[2]_i_1__0_n_0 ;
  wire \cnt[2]_i_2__0_n_0 ;
  wire \cnt[2]_i_3__0_n_0 ;
  wire \cnt[3]_i_1__0_n_0 ;
  wire \cnt[3]_i_2__0_n_0 ;
  wire \cnt[3]_i_3__0_n_0 ;
  wire \cnt[3]_i_4__0_n_0 ;
  wire \cnt[4]_i_10__0_n_0 ;
  wire \cnt[4]_i_11__0_n_0 ;
  wire \cnt[4]_i_12__0_n_0 ;
  wire \cnt[4]_i_1__0_n_0 ;
  wire \cnt[4]_i_2__0_n_0 ;
  wire \cnt[4]_i_3__0_n_0 ;
  wire \cnt[4]_i_4__0_n_0 ;
  wire \cnt[4]_i_5__0_n_0 ;
  wire \cnt[4]_i_6__0_n_0 ;
  wire \cnt[4]_i_7__0_n_0 ;
  wire \cnt[4]_i_8__0_n_0 ;
  wire \cnt[4]_i_9_n_0 ;
  wire [3:1]cnt_reg_n_0_;
  wire [2:2]data_en_reg_reg;
  wire [7:0]data_in_reg_reg_n_0_;
  wire [3:0]din_num_1s;
  wire p_0_in;
  wire p_2_in;
  wire rst;
  wire [3:0]s1_num_1s;
  wire \s1_num_1s[0]_i_1_n_0 ;
  wire \s1_num_1s[0]_i_2_n_0 ;
  wire \s1_num_1s[1]_i_1_n_0 ;
  wire \s1_num_1s[1]_i_2_n_0 ;
  wire \s1_num_1s[2]_i_1_n_0 ;
  wire \s1_num_1s[2]_i_2_n_0 ;
  wire \s1_num_1s[3]_i_1_n_0 ;
  wire \s1_num_1s[3]_i_2_n_0 ;
  wire \s1_num_1s[3]_i_3_n_0 ;
  wire \s1_num_1s[3]_i_4_n_0 ;
  wire [8:1]stage1;
  wire \stage1_out[7]_i_3__0_n_0 ;
  wire [8:0]stage1_out_reg_n_0_;
  wire [7:0]stage2_in_reg_n_0_;
  wire \tmds_out[0]_i_1__0_n_0 ;
  wire \tmds_out[1]_i_1__0_n_0 ;
  wire \tmds_out[2]_i_1__1_n_0 ;
  wire \tmds_out[3]_i_1__0_n_0 ;
  wire \tmds_out[4]_i_1__1_n_0 ;
  wire \tmds_out[5]_i_1__0_n_0 ;
  wire \tmds_out[6]_i_1__1_n_0 ;
  wire \tmds_out[7]_i_1__0_n_0 ;
  wire \tmds_out[8]_i_1__0_n_0 ;
  wire \tmds_out[9]_i_1__1_n_0 ;
  wire tx_clk;
  wire [7:0]tx_green;

  LUT6 #(
    .INIT(64'h820028AA28AA8200)) 
    \cnt[1]_i_1 
       (.I0(data_en_reg_reg),
        .I1(\cnt[4]_i_5__0_n_0 ),
        .I2(p_2_in),
        .I3(\cnt[4]_i_3__0_n_0 ),
        .I4(s1_num_1s[0]),
        .I5(cnt_reg_n_0_[1]),
        .O(\cnt[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h02A2)) 
    \cnt[2]_i_1__0 
       (.I0(data_en_reg_reg),
        .I1(\cnt[2]_i_2__0_n_0 ),
        .I2(\cnt[4]_i_3__0_n_0 ),
        .I3(\cnt[2]_i_3__0_n_0 ),
        .O(\cnt[2]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h7B84847B)) 
    \cnt[2]_i_2__0 
       (.I0(p_2_in),
        .I1(s1_num_1s[0]),
        .I2(cnt_reg_n_0_[1]),
        .I3(cnt_reg_n_0_[2]),
        .I4(s1_num_1s[1]),
        .O(\cnt[2]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h96C3C36969C3C396)) 
    \cnt[2]_i_3__0 
       (.I0(\cnt[4]_i_5__0_n_0 ),
        .I1(cnt_reg_n_0_[2]),
        .I2(s1_num_1s[1]),
        .I3(p_2_in),
        .I4(cnt_reg_n_0_[1]),
        .I5(s1_num_1s[0]),
        .O(\cnt[2]_i_3__0_n_0 ));
  LUT4 #(
    .INIT(16'hE200)) 
    \cnt[3]_i_1__0 
       (.I0(\cnt[3]_i_2__0_n_0 ),
        .I1(\cnt[4]_i_3__0_n_0 ),
        .I2(\cnt[3]_i_3__0_n_0 ),
        .I3(data_en_reg_reg),
        .O(\cnt[3]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hBAD58010452A7FEF)) 
    \cnt[3]_i_2__0 
       (.I0(p_2_in),
        .I1(cnt_reg_n_0_[1]),
        .I2(s1_num_1s[0]),
        .I3(cnt_reg_n_0_[2]),
        .I4(s1_num_1s[1]),
        .I5(\cnt[3]_i_4__0_n_0 ),
        .O(\cnt[3]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hA5AA5A55333CCCC3)) 
    \cnt[3]_i_3__0 
       (.I0(\cnt[4]_i_12__0_n_0 ),
        .I1(\cnt[4]_i_11__0_n_0 ),
        .I2(s1_num_1s[1]),
        .I3(cnt_reg_n_0_[2]),
        .I4(\cnt[3]_i_4__0_n_0 ),
        .I5(\cnt[4]_i_5__0_n_0 ),
        .O(\cnt[3]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \cnt[3]_i_4__0 
       (.I0(s1_num_1s[2]),
        .I1(cnt_reg_n_0_[3]),
        .O(\cnt[3]_i_4__0_n_0 ));
  LUT4 #(
    .INIT(16'h0010)) 
    \cnt[4]_i_10__0 
       (.I0(s1_num_1s[0]),
        .I1(s1_num_1s[1]),
        .I2(s1_num_1s[2]),
        .I3(s1_num_1s[3]),
        .O(\cnt[4]_i_10__0_n_0 ));
  LUT5 #(
    .INIT(32'h0666666F)) 
    \cnt[4]_i_11__0 
       (.I0(s1_num_1s[1]),
        .I1(cnt_reg_n_0_[2]),
        .I2(s1_num_1s[0]),
        .I3(cnt_reg_n_0_[1]),
        .I4(p_2_in),
        .O(\cnt[4]_i_11__0_n_0 ));
  LUT5 #(
    .INIT(32'h66066F66)) 
    \cnt[4]_i_12__0 
       (.I0(s1_num_1s[1]),
        .I1(cnt_reg_n_0_[2]),
        .I2(p_2_in),
        .I3(s1_num_1s[0]),
        .I4(cnt_reg_n_0_[1]),
        .O(\cnt[4]_i_12__0_n_0 ));
  LUT6 #(
    .INIT(64'h020202A2A2A202A2)) 
    \cnt[4]_i_1__0 
       (.I0(data_en_reg_reg),
        .I1(\cnt[4]_i_2__0_n_0 ),
        .I2(\cnt[4]_i_3__0_n_0 ),
        .I3(\cnt[4]_i_4__0_n_0 ),
        .I4(\cnt[4]_i_5__0_n_0 ),
        .I5(\cnt[4]_i_6__0_n_0 ),
        .O(\cnt[4]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h4B0F3C87783C0FB4)) 
    \cnt[4]_i_2__0 
       (.I0(\cnt[4]_i_7__0_n_0 ),
        .I1(p_2_in),
        .I2(\cnt[4]_i_8__0_n_0 ),
        .I3(s1_num_1s[2]),
        .I4(cnt_reg_n_0_[3]),
        .I5(\cnt[4]_i_9_n_0 ),
        .O(\cnt[4]_i_2__0_n_0 ));
  LUT5 #(
    .INIT(32'h0000FFFE)) 
    \cnt[4]_i_3__0 
       (.I0(p_0_in),
        .I1(cnt_reg_n_0_[3]),
        .I2(cnt_reg_n_0_[2]),
        .I3(cnt_reg_n_0_[1]),
        .I4(\cnt[4]_i_10__0_n_0 ),
        .O(\cnt[4]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'h0E1010F1F1EFEF0E)) 
    \cnt[4]_i_4__0 
       (.I0(cnt_reg_n_0_[2]),
        .I1(s1_num_1s[1]),
        .I2(\cnt[4]_i_11__0_n_0 ),
        .I3(s1_num_1s[2]),
        .I4(cnt_reg_n_0_[3]),
        .I5(\cnt[4]_i_8__0_n_0 ),
        .O(\cnt[4]_i_4__0_n_0 ));
  LUT5 #(
    .INIT(32'h33326666)) 
    \cnt[4]_i_5__0 
       (.I0(s1_num_1s[3]),
        .I1(p_0_in),
        .I2(s1_num_1s[0]),
        .I3(s1_num_1s[1]),
        .I4(s1_num_1s[2]),
        .O(\cnt[4]_i_5__0_n_0 ));
  LUT6 #(
    .INIT(64'h5559A65559AA5559)) 
    \cnt[4]_i_6__0 
       (.I0(\cnt[4]_i_8__0_n_0 ),
        .I1(cnt_reg_n_0_[2]),
        .I2(s1_num_1s[1]),
        .I3(s1_num_1s[2]),
        .I4(cnt_reg_n_0_[3]),
        .I5(\cnt[4]_i_12__0_n_0 ),
        .O(\cnt[4]_i_6__0_n_0 ));
  LUT4 #(
    .INIT(16'h077F)) 
    \cnt[4]_i_7__0 
       (.I0(s1_num_1s[0]),
        .I1(cnt_reg_n_0_[1]),
        .I2(s1_num_1s[1]),
        .I3(cnt_reg_n_0_[2]),
        .O(\cnt[4]_i_7__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \cnt[4]_i_8__0 
       (.I0(s1_num_1s[3]),
        .I1(p_0_in),
        .O(\cnt[4]_i_8__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF2F022F02FFFF)) 
    \cnt[4]_i_9 
       (.I0(s1_num_1s[0]),
        .I1(cnt_reg_n_0_[1]),
        .I2(cnt_reg_n_0_[2]),
        .I3(s1_num_1s[1]),
        .I4(s1_num_1s[2]),
        .I5(cnt_reg_n_0_[3]),
        .O(\cnt[4]_i_9_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[1] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\cnt[1]_i_1_n_0 ),
        .Q(cnt_reg_n_0_[1]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[2] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\cnt[2]_i_1__0_n_0 ),
        .Q(cnt_reg_n_0_[2]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[3] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\cnt[3]_i_1__0_n_0 ),
        .Q(cnt_reg_n_0_[3]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[4] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\cnt[4]_i_1__0_n_0 ),
        .Q(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg_reg[0] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(tx_green[0]),
        .Q(data_in_reg_reg_n_0_[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg_reg[1] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(tx_green[1]),
        .Q(data_in_reg_reg_n_0_[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg_reg[2] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(tx_green[2]),
        .Q(data_in_reg_reg_n_0_[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg_reg[3] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(tx_green[3]),
        .Q(data_in_reg_reg_n_0_[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg_reg[4] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(tx_green[4]),
        .Q(data_in_reg_reg_n_0_[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg_reg[5] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(tx_green[5]),
        .Q(data_in_reg_reg_n_0_[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg_reg[6] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(tx_green[6]),
        .Q(data_in_reg_reg_n_0_[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg_reg[7] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(tx_green[7]),
        .Q(data_in_reg_reg_n_0_[7]),
        .R(1'b0));
  (* OPT_MODIFIED = "PROPCONST" *) 
  FDRE #(
    .INIT(1'b0)) 
    \din_num_1s_reg[3] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(tx_green[5]),
        .Q(din_num_1s[3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \s1_num_1s[0]_i_1 
       (.I0(stage1_out_reg_n_0_[0]),
        .I1(stage1_out_reg_n_0_[4]),
        .I2(\s1_num_1s[0]_i_2_n_0 ),
        .I3(stage1_out_reg_n_0_[5]),
        .I4(stage1_out_reg_n_0_[7]),
        .I5(stage1_out_reg_n_0_[6]),
        .O(\s1_num_1s[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \s1_num_1s[0]_i_2 
       (.I0(stage1_out_reg_n_0_[2]),
        .I1(stage1_out_reg_n_0_[3]),
        .I2(stage1_out_reg_n_0_[1]),
        .O(\s1_num_1s[0]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \s1_num_1s[1]_i_1 
       (.I0(\s1_num_1s[3]_i_2_n_0 ),
        .I1(\s1_num_1s[1]_i_2_n_0 ),
        .I2(\s1_num_1s[3]_i_3_n_0 ),
        .O(\s1_num_1s[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h171717E817E8E8E8)) 
    \s1_num_1s[1]_i_2 
       (.I0(stage1_out_reg_n_0_[6]),
        .I1(stage1_out_reg_n_0_[5]),
        .I2(stage1_out_reg_n_0_[7]),
        .I3(stage1_out_reg_n_0_[2]),
        .I4(stage1_out_reg_n_0_[1]),
        .I5(stage1_out_reg_n_0_[3]),
        .O(\s1_num_1s[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7E7E7EE87EE8E8E8)) 
    \s1_num_1s[2]_i_1 
       (.I0(\s1_num_1s[3]_i_2_n_0 ),
        .I1(\s1_num_1s[3]_i_3_n_0 ),
        .I2(\s1_num_1s[2]_i_2_n_0 ),
        .I3(stage1_out_reg_n_0_[3]),
        .I4(stage1_out_reg_n_0_[1]),
        .I5(stage1_out_reg_n_0_[2]),
        .O(\s1_num_1s[2]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \s1_num_1s[2]_i_2 
       (.I0(stage1_out_reg_n_0_[7]),
        .I1(stage1_out_reg_n_0_[5]),
        .I2(stage1_out_reg_n_0_[6]),
        .O(\s1_num_1s[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8880800000000000)) 
    \s1_num_1s[3]_i_1 
       (.I0(\s1_num_1s[3]_i_2_n_0 ),
        .I1(\s1_num_1s[3]_i_3_n_0 ),
        .I2(stage1_out_reg_n_0_[6]),
        .I3(stage1_out_reg_n_0_[5]),
        .I4(stage1_out_reg_n_0_[7]),
        .I5(\s1_num_1s[3]_i_4_n_0 ),
        .O(\s1_num_1s[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9600009600969600)) 
    \s1_num_1s[3]_i_2 
       (.I0(stage1_out_reg_n_0_[5]),
        .I1(stage1_out_reg_n_0_[7]),
        .I2(stage1_out_reg_n_0_[6]),
        .I3(stage1_out_reg_n_0_[0]),
        .I4(stage1_out_reg_n_0_[4]),
        .I5(\s1_num_1s[0]_i_2_n_0 ),
        .O(\s1_num_1s[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hE88E8EE8)) 
    \s1_num_1s[3]_i_3 
       (.I0(stage1_out_reg_n_0_[4]),
        .I1(stage1_out_reg_n_0_[0]),
        .I2(stage1_out_reg_n_0_[1]),
        .I3(stage1_out_reg_n_0_[3]),
        .I4(stage1_out_reg_n_0_[2]),
        .O(\s1_num_1s[3]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \s1_num_1s[3]_i_4 
       (.I0(stage1_out_reg_n_0_[3]),
        .I1(stage1_out_reg_n_0_[1]),
        .I2(stage1_out_reg_n_0_[2]),
        .O(\s1_num_1s[3]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s1_num_1s_reg[0] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(\s1_num_1s[0]_i_1_n_0 ),
        .Q(s1_num_1s[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1_num_1s_reg[1] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(\s1_num_1s[1]_i_1_n_0 ),
        .Q(s1_num_1s[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1_num_1s_reg[2] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(\s1_num_1s[2]_i_1_n_0 ),
        .Q(s1_num_1s[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1_num_1s_reg[3] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(\s1_num_1s[3]_i_1_n_0 ),
        .Q(s1_num_1s[3]),
        .R(1'b0));
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \stage1_out[1]_i_1__0 
       (.I0(data_in_reg_reg_n_0_[1]),
        .I1(data_in_reg_reg_n_0_[0]),
        .I2(din_num_1s[3]),
        .O(stage1[1]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \stage1_out[2]_i_1__0 
       (.I0(data_in_reg_reg_n_0_[2]),
        .I1(data_in_reg_reg_n_0_[1]),
        .I2(data_in_reg_reg_n_0_[0]),
        .O(stage1[2]));
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    \stage1_out[3]_i_1__0 
       (.I0(data_in_reg_reg_n_0_[3]),
        .I1(data_in_reg_reg_n_0_[2]),
        .I2(data_in_reg_reg_n_0_[1]),
        .I3(data_in_reg_reg_n_0_[0]),
        .I4(din_num_1s[3]),
        .O(stage1[3]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    \stage1_out[4]_i_1__0 
       (.I0(data_in_reg_reg_n_0_[4]),
        .I1(data_in_reg_reg_n_0_[3]),
        .I2(data_in_reg_reg_n_0_[2]),
        .I3(data_in_reg_reg_n_0_[1]),
        .I4(data_in_reg_reg_n_0_[0]),
        .O(stage1[4]));
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \stage1_out[5]_i_1__0 
       (.I0(\stage1_out[7]_i_3__0_n_0 ),
        .I1(din_num_1s[3]),
        .O(stage1[5]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \stage1_out[6]_i_1__0 
       (.I0(\stage1_out[7]_i_3__0_n_0 ),
        .I1(data_in_reg_reg_n_0_[6]),
        .O(stage1[6]));
  (* OPT_MODIFIED = "PROPCONST" *) 
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \stage1_out[7]_i_1__0 
       (.I0(data_in_reg_reg_n_0_[6]),
        .I1(din_num_1s[3]),
        .I2(data_in_reg_reg_n_0_[7]),
        .I3(\stage1_out[7]_i_3__0_n_0 ),
        .O(stage1[7]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \stage1_out[7]_i_3__0 
       (.I0(data_in_reg_reg_n_0_[3]),
        .I1(data_in_reg_reg_n_0_[2]),
        .I2(data_in_reg_reg_n_0_[1]),
        .I3(data_in_reg_reg_n_0_[0]),
        .I4(data_in_reg_reg_n_0_[4]),
        .I5(data_in_reg_reg_n_0_[5]),
        .O(\stage1_out[7]_i_3__0_n_0 ));
  (* OPT_MODIFIED = "PROPCONST" *) 
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \stage1_out[8]_i_1__0 
       (.I0(din_num_1s[3]),
        .O(stage1[8]));
  FDRE #(
    .INIT(1'b0)) 
    \stage1_out_reg[0] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(data_in_reg_reg_n_0_[0]),
        .Q(stage1_out_reg_n_0_[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage1_out_reg[1] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1[1]),
        .Q(stage1_out_reg_n_0_[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage1_out_reg[2] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1[2]),
        .Q(stage1_out_reg_n_0_[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage1_out_reg[3] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1[3]),
        .Q(stage1_out_reg_n_0_[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage1_out_reg[4] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1[4]),
        .Q(stage1_out_reg_n_0_[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage1_out_reg[5] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1[5]),
        .Q(stage1_out_reg_n_0_[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage1_out_reg[6] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1[6]),
        .Q(stage1_out_reg_n_0_[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage1_out_reg[7] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1[7]),
        .Q(stage1_out_reg_n_0_[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage1_out_reg[8] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1[8]),
        .Q(stage1_out_reg_n_0_[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage2_in_reg[0] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1_out_reg_n_0_[0]),
        .Q(stage2_in_reg_n_0_[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage2_in_reg[1] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1_out_reg_n_0_[1]),
        .Q(stage2_in_reg_n_0_[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage2_in_reg[2] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1_out_reg_n_0_[2]),
        .Q(stage2_in_reg_n_0_[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage2_in_reg[3] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1_out_reg_n_0_[3]),
        .Q(stage2_in_reg_n_0_[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage2_in_reg[4] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1_out_reg_n_0_[4]),
        .Q(stage2_in_reg_n_0_[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage2_in_reg[5] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1_out_reg_n_0_[5]),
        .Q(stage2_in_reg_n_0_[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage2_in_reg[6] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1_out_reg_n_0_[6]),
        .Q(stage2_in_reg_n_0_[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage2_in_reg[7] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1_out_reg_n_0_[7]),
        .Q(stage2_in_reg_n_0_[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage2_in_reg[8] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1_out_reg_n_0_[8]),
        .Q(p_2_in),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h22828882)) 
    \tmds_out[0]_i_1__0 
       (.I0(data_en_reg_reg),
        .I1(stage2_in_reg_n_0_[0]),
        .I2(p_2_in),
        .I3(\cnt[4]_i_3__0_n_0 ),
        .I4(\cnt[4]_i_5__0_n_0 ),
        .O(\tmds_out[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h22828882)) 
    \tmds_out[1]_i_1__0 
       (.I0(data_en_reg_reg),
        .I1(stage2_in_reg_n_0_[1]),
        .I2(p_2_in),
        .I3(\cnt[4]_i_3__0_n_0 ),
        .I4(\cnt[4]_i_5__0_n_0 ),
        .O(\tmds_out[1]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h748BFFFF)) 
    \tmds_out[2]_i_1__1 
       (.I0(\cnt[4]_i_5__0_n_0 ),
        .I1(\cnt[4]_i_3__0_n_0 ),
        .I2(p_2_in),
        .I3(stage2_in_reg_n_0_[2]),
        .I4(data_en_reg_reg),
        .O(\tmds_out[2]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'h22828882)) 
    \tmds_out[3]_i_1__0 
       (.I0(data_en_reg_reg),
        .I1(stage2_in_reg_n_0_[3]),
        .I2(p_2_in),
        .I3(\cnt[4]_i_3__0_n_0 ),
        .I4(\cnt[4]_i_5__0_n_0 ),
        .O(\tmds_out[3]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h748BFFFF)) 
    \tmds_out[4]_i_1__1 
       (.I0(\cnt[4]_i_5__0_n_0 ),
        .I1(\cnt[4]_i_3__0_n_0 ),
        .I2(p_2_in),
        .I3(stage2_in_reg_n_0_[4]),
        .I4(data_en_reg_reg),
        .O(\tmds_out[4]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'h22828882)) 
    \tmds_out[5]_i_1__0 
       (.I0(data_en_reg_reg),
        .I1(stage2_in_reg_n_0_[5]),
        .I2(p_2_in),
        .I3(\cnt[4]_i_3__0_n_0 ),
        .I4(\cnt[4]_i_5__0_n_0 ),
        .O(\tmds_out[5]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h748BFFFF)) 
    \tmds_out[6]_i_1__1 
       (.I0(\cnt[4]_i_5__0_n_0 ),
        .I1(\cnt[4]_i_3__0_n_0 ),
        .I2(p_2_in),
        .I3(stage2_in_reg_n_0_[6]),
        .I4(data_en_reg_reg),
        .O(\tmds_out[6]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'h22828882)) 
    \tmds_out[7]_i_1__0 
       (.I0(data_en_reg_reg),
        .I1(stage2_in_reg_n_0_[7]),
        .I2(p_2_in),
        .I3(\cnt[4]_i_3__0_n_0 ),
        .I4(\cnt[4]_i_5__0_n_0 ),
        .O(\tmds_out[7]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \tmds_out[8]_i_1__0 
       (.I0(p_2_in),
        .I1(data_en_reg_reg),
        .O(\tmds_out[8]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'hD1FF)) 
    \tmds_out[9]_i_1__1 
       (.I0(p_2_in),
        .I1(\cnt[4]_i_3__0_n_0 ),
        .I2(\cnt[4]_i_5__0_n_0 ),
        .I3(data_en_reg_reg),
        .O(\tmds_out[9]_i_1__1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \tmds_out_reg[0] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\tmds_out[0]_i_1__0_n_0 ),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \tmds_out_reg[1] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\tmds_out[1]_i_1__0_n_0 ),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \tmds_out_reg[2] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\tmds_out[2]_i_1__1_n_0 ),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \tmds_out_reg[3] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\tmds_out[3]_i_1__0_n_0 ),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \tmds_out_reg[4] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\tmds_out[4]_i_1__1_n_0 ),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \tmds_out_reg[5] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\tmds_out[5]_i_1__0_n_0 ),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \tmds_out_reg[6] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\tmds_out[6]_i_1__1_n_0 ),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \tmds_out_reg[7] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\tmds_out[7]_i_1__0_n_0 ),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \tmds_out_reg[8] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\tmds_out[8]_i_1__0_n_0 ),
        .Q(Q[8]));
  FDCE #(
    .INIT(1'b0)) 
    \tmds_out_reg[9] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\tmds_out[9]_i_1__1_n_0 ),
        .Q(Q[9]));
endmodule

(* ORIG_REF_NAME = "tmds_encoder" *) 
module tmds_encoder_1
   (data_en_reg_reg,
    rst,
    tx_clk,
    Q,
    tx_red);
  input [2:2]data_en_reg_reg;
  input rst;
  input tx_clk;
  output [9:0]Q;
  input [7:0]tx_red;

  wire [9:0]Q;
  wire \cnt[1]_i_1__1_n_0 ;
  wire \cnt[2]_i_1_n_0 ;
  wire \cnt[2]_i_2_n_0 ;
  wire \cnt[2]_i_3_n_0 ;
  wire \cnt[3]_i_1_n_0 ;
  wire \cnt[3]_i_2_n_0 ;
  wire \cnt[3]_i_3_n_0 ;
  wire \cnt[3]_i_4_n_0 ;
  wire \cnt[4]_i_10_n_0 ;
  wire \cnt[4]_i_11_n_0 ;
  wire \cnt[4]_i_12_n_0 ;
  wire \cnt[4]_i_13_n_0 ;
  wire \cnt[4]_i_14_n_0 ;
  wire \cnt[4]_i_1_n_0 ;
  wire \cnt[4]_i_2_n_0 ;
  wire \cnt[4]_i_3_n_0 ;
  wire \cnt[4]_i_4_n_0 ;
  wire \cnt[4]_i_5_n_0 ;
  wire \cnt[4]_i_6_n_0 ;
  wire \cnt[4]_i_7_n_0 ;
  wire \cnt[4]_i_8_n_0 ;
  wire \cnt[4]_i_9__1_n_0 ;
  wire [3:1]cnt_reg_n_0_;
  wire [2:2]data_en_reg_reg;
  wire [7:0]data_in_reg_reg_n_0_;
  wire [3:0]din_num_1s;
  wire p_0_in;
  wire p_0_in0_in;
  wire p_0_in1_in;
  wire p_0_in2_in;
  wire p_1_in;
  wire p_1_in3_in;
  wire p_1_in4_in;
  wire p_2_in;
  wire rst;
  wire [3:0]s1_num_1s;
  wire [3:0]s1_num_1s0;
  wire \s1_num_1s[0]_i_2_n_0 ;
  wire \s1_num_1s[1]_i_2_n_0 ;
  wire \s1_num_1s[2]_i_2_n_0 ;
  wire \s1_num_1s[3]_i_2_n_0 ;
  wire \s1_num_1s[3]_i_3_n_0 ;
  wire \s1_num_1s[3]_i_4_n_0 ;
  wire [8:1]stage1;
  wire \stage1_out[7]_i_3_n_0 ;
  wire [8:0]stage1_out_reg_n_0_;
  wire [7:0]stage2_in_reg_n_0_;
  wire [8:0]tmds_out;
  wire \tmds_out[2]_i_1__0_n_0 ;
  wire \tmds_out[4]_i_1__0_n_0 ;
  wire \tmds_out[6]_i_1__0_n_0 ;
  wire \tmds_out[9]_i_1__0_n_0 ;
  wire tx_clk;
  wire [7:0]tx_red;

  LUT6 #(
    .INIT(64'h9666669600000000)) 
    \cnt[1]_i_1__1 
       (.I0(cnt_reg_n_0_[1]),
        .I1(s1_num_1s[0]),
        .I2(\cnt[4]_i_3_n_0 ),
        .I3(p_2_in),
        .I4(\cnt[4]_i_5_n_0 ),
        .I5(data_en_reg_reg),
        .O(\cnt[1]_i_1__1_n_0 ));
  LUT4 #(
    .INIT(16'h02A2)) 
    \cnt[2]_i_1 
       (.I0(data_en_reg_reg),
        .I1(\cnt[2]_i_2_n_0 ),
        .I2(\cnt[4]_i_3_n_0 ),
        .I3(\cnt[2]_i_3_n_0 ),
        .O(\cnt[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h7B84847B)) 
    \cnt[2]_i_2 
       (.I0(p_2_in),
        .I1(s1_num_1s[0]),
        .I2(cnt_reg_n_0_[1]),
        .I3(cnt_reg_n_0_[2]),
        .I4(s1_num_1s[1]),
        .O(\cnt[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h9996699969999996)) 
    \cnt[2]_i_3 
       (.I0(s1_num_1s[1]),
        .I1(cnt_reg_n_0_[2]),
        .I2(p_2_in),
        .I3(cnt_reg_n_0_[1]),
        .I4(s1_num_1s[0]),
        .I5(\cnt[4]_i_5_n_0 ),
        .O(\cnt[2]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h880C)) 
    \cnt[3]_i_1 
       (.I0(\cnt[3]_i_2_n_0 ),
        .I1(data_en_reg_reg),
        .I2(\cnt[3]_i_3_n_0 ),
        .I3(\cnt[4]_i_3_n_0 ),
        .O(\cnt[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h478B4774B874B88B)) 
    \cnt[3]_i_2 
       (.I0(\cnt[4]_i_14_n_0 ),
        .I1(\cnt[4]_i_5_n_0 ),
        .I2(\cnt[4]_i_12_n_0 ),
        .I3(s1_num_1s[1]),
        .I4(cnt_reg_n_0_[2]),
        .I5(\cnt[3]_i_4_n_0 ),
        .O(\cnt[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h452A7FEFBAD58010)) 
    \cnt[3]_i_3 
       (.I0(p_2_in),
        .I1(cnt_reg_n_0_[1]),
        .I2(s1_num_1s[0]),
        .I3(cnt_reg_n_0_[2]),
        .I4(s1_num_1s[1]),
        .I5(\cnt[3]_i_4_n_0 ),
        .O(\cnt[3]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \cnt[3]_i_4 
       (.I0(s1_num_1s[2]),
        .I1(cnt_reg_n_0_[3]),
        .O(\cnt[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h020202A2A2A202A2)) 
    \cnt[4]_i_1 
       (.I0(data_en_reg_reg),
        .I1(\cnt[4]_i_2_n_0 ),
        .I2(\cnt[4]_i_3_n_0 ),
        .I3(\cnt[4]_i_4_n_0 ),
        .I4(\cnt[4]_i_5_n_0 ),
        .I5(\cnt[4]_i_6_n_0 ),
        .O(\cnt[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0010)) 
    \cnt[4]_i_10 
       (.I0(s1_num_1s[0]),
        .I1(s1_num_1s[1]),
        .I2(s1_num_1s[2]),
        .I3(s1_num_1s[3]),
        .O(\cnt[4]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \cnt[4]_i_11 
       (.I0(s1_num_1s[1]),
        .I1(cnt_reg_n_0_[2]),
        .O(\cnt[4]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'h017F7F01)) 
    \cnt[4]_i_12 
       (.I0(p_2_in),
        .I1(cnt_reg_n_0_[1]),
        .I2(s1_num_1s[0]),
        .I3(cnt_reg_n_0_[2]),
        .I4(s1_num_1s[1]),
        .O(\cnt[4]_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt[4]_i_13 
       (.I0(cnt_reg_n_0_[2]),
        .I1(s1_num_1s[1]),
        .O(\cnt[4]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'hFD4040FD)) 
    \cnt[4]_i_14 
       (.I0(s1_num_1s[0]),
        .I1(cnt_reg_n_0_[1]),
        .I2(p_2_in),
        .I3(s1_num_1s[1]),
        .I4(cnt_reg_n_0_[2]),
        .O(\cnt[4]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h4038BFC7730B8CF4)) 
    \cnt[4]_i_2 
       (.I0(\cnt[4]_i_7_n_0 ),
        .I1(p_2_in),
        .I2(s1_num_1s[2]),
        .I3(cnt_reg_n_0_[3]),
        .I4(\cnt[4]_i_8_n_0 ),
        .I5(\cnt[4]_i_9__1_n_0 ),
        .O(\cnt[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0000FFFE)) 
    \cnt[4]_i_3 
       (.I0(cnt_reg_n_0_[2]),
        .I1(cnt_reg_n_0_[1]),
        .I2(p_0_in),
        .I3(cnt_reg_n_0_[3]),
        .I4(\cnt[4]_i_10_n_0 ),
        .O(\cnt[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hDBB2244D244DDBB2)) 
    \cnt[4]_i_4 
       (.I0(\cnt[4]_i_11_n_0 ),
        .I1(\cnt[4]_i_12_n_0 ),
        .I2(s1_num_1s[2]),
        .I3(cnt_reg_n_0_[3]),
        .I4(s1_num_1s[3]),
        .I5(p_0_in),
        .O(\cnt[4]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h33326666)) 
    \cnt[4]_i_5 
       (.I0(s1_num_1s[3]),
        .I1(p_0_in),
        .I2(s1_num_1s[0]),
        .I3(s1_num_1s[1]),
        .I4(s1_num_1s[2]),
        .O(\cnt[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h6966996999699699)) 
    \cnt[4]_i_6 
       (.I0(s1_num_1s[3]),
        .I1(p_0_in),
        .I2(\cnt[4]_i_13_n_0 ),
        .I3(s1_num_1s[2]),
        .I4(cnt_reg_n_0_[3]),
        .I5(\cnt[4]_i_14_n_0 ),
        .O(\cnt[4]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h077F)) 
    \cnt[4]_i_7 
       (.I0(s1_num_1s[0]),
        .I1(cnt_reg_n_0_[1]),
        .I2(s1_num_1s[1]),
        .I3(cnt_reg_n_0_[2]),
        .O(\cnt[4]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \cnt[4]_i_8 
       (.I0(s1_num_1s[3]),
        .I1(p_0_in),
        .O(\cnt[4]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44D444D4FFFF)) 
    \cnt[4]_i_9__1 
       (.I0(cnt_reg_n_0_[2]),
        .I1(s1_num_1s[1]),
        .I2(s1_num_1s[0]),
        .I3(cnt_reg_n_0_[1]),
        .I4(cnt_reg_n_0_[3]),
        .I5(s1_num_1s[2]),
        .O(\cnt[4]_i_9__1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[1] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\cnt[1]_i_1__1_n_0 ),
        .Q(cnt_reg_n_0_[1]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[2] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\cnt[2]_i_1_n_0 ),
        .Q(cnt_reg_n_0_[2]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[3] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\cnt[3]_i_1_n_0 ),
        .Q(cnt_reg_n_0_[3]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[4] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\cnt[4]_i_1_n_0 ),
        .Q(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg_reg[0] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(tx_red[0]),
        .Q(data_in_reg_reg_n_0_[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg_reg[1] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(tx_red[1]),
        .Q(data_in_reg_reg_n_0_[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg_reg[2] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(tx_red[2]),
        .Q(data_in_reg_reg_n_0_[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg_reg[3] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(tx_red[3]),
        .Q(data_in_reg_reg_n_0_[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg_reg[4] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(tx_red[4]),
        .Q(data_in_reg_reg_n_0_[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg_reg[5] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(tx_red[5]),
        .Q(data_in_reg_reg_n_0_[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg_reg[6] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(tx_red[6]),
        .Q(data_in_reg_reg_n_0_[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg_reg[7] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(tx_red[7]),
        .Q(data_in_reg_reg_n_0_[7]),
        .R(1'b0));
  (* OPT_MODIFIED = "PROPCONST" *) 
  FDRE #(
    .INIT(1'b0)) 
    \din_num_1s_reg[3] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(tx_red[5]),
        .Q(din_num_1s[3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \s1_num_1s[0]_i_1 
       (.I0(stage1_out_reg_n_0_[0]),
        .I1(p_1_in4_in),
        .I2(\s1_num_1s[0]_i_2_n_0 ),
        .I3(p_0_in0_in),
        .I4(stage1_out_reg_n_0_[7]),
        .I5(p_1_in),
        .O(s1_num_1s0[0]));
  LUT3 #(
    .INIT(8'h96)) 
    \s1_num_1s[0]_i_2 
       (.I0(p_1_in3_in),
        .I1(p_0_in1_in),
        .I2(p_0_in2_in),
        .O(\s1_num_1s[0]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \s1_num_1s[1]_i_1 
       (.I0(\s1_num_1s[3]_i_2_n_0 ),
        .I1(\s1_num_1s[1]_i_2_n_0 ),
        .I2(\s1_num_1s[3]_i_3_n_0 ),
        .O(s1_num_1s0[1]));
  LUT6 #(
    .INIT(64'h171717E817E8E8E8)) 
    \s1_num_1s[1]_i_2 
       (.I0(p_1_in),
        .I1(p_0_in0_in),
        .I2(stage1_out_reg_n_0_[7]),
        .I3(p_1_in3_in),
        .I4(p_0_in2_in),
        .I5(p_0_in1_in),
        .O(\s1_num_1s[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7E7E7EE87EE8E8E8)) 
    \s1_num_1s[2]_i_1 
       (.I0(\s1_num_1s[3]_i_2_n_0 ),
        .I1(\s1_num_1s[3]_i_3_n_0 ),
        .I2(\s1_num_1s[2]_i_2_n_0 ),
        .I3(p_0_in1_in),
        .I4(p_0_in2_in),
        .I5(p_1_in3_in),
        .O(s1_num_1s0[2]));
  LUT3 #(
    .INIT(8'hE8)) 
    \s1_num_1s[2]_i_2 
       (.I0(stage1_out_reg_n_0_[7]),
        .I1(p_0_in0_in),
        .I2(p_1_in),
        .O(\s1_num_1s[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8880800000000000)) 
    \s1_num_1s[3]_i_1 
       (.I0(\s1_num_1s[3]_i_2_n_0 ),
        .I1(\s1_num_1s[3]_i_3_n_0 ),
        .I2(p_1_in),
        .I3(p_0_in0_in),
        .I4(stage1_out_reg_n_0_[7]),
        .I5(\s1_num_1s[3]_i_4_n_0 ),
        .O(s1_num_1s0[3]));
  LUT6 #(
    .INIT(64'h9600009600969600)) 
    \s1_num_1s[3]_i_2 
       (.I0(p_0_in0_in),
        .I1(stage1_out_reg_n_0_[7]),
        .I2(p_1_in),
        .I3(stage1_out_reg_n_0_[0]),
        .I4(p_1_in4_in),
        .I5(\s1_num_1s[0]_i_2_n_0 ),
        .O(\s1_num_1s[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hE88E8EE8)) 
    \s1_num_1s[3]_i_3 
       (.I0(p_1_in4_in),
        .I1(stage1_out_reg_n_0_[0]),
        .I2(p_0_in2_in),
        .I3(p_0_in1_in),
        .I4(p_1_in3_in),
        .O(\s1_num_1s[3]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \s1_num_1s[3]_i_4 
       (.I0(p_0_in1_in),
        .I1(p_0_in2_in),
        .I2(p_1_in3_in),
        .O(\s1_num_1s[3]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s1_num_1s_reg[0] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(s1_num_1s0[0]),
        .Q(s1_num_1s[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1_num_1s_reg[1] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(s1_num_1s0[1]),
        .Q(s1_num_1s[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1_num_1s_reg[2] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(s1_num_1s0[2]),
        .Q(s1_num_1s[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1_num_1s_reg[3] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(s1_num_1s0[3]),
        .Q(s1_num_1s[3]),
        .R(1'b0));
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \stage1_out[1]_i_1 
       (.I0(data_in_reg_reg_n_0_[1]),
        .I1(data_in_reg_reg_n_0_[0]),
        .I2(din_num_1s[3]),
        .O(stage1[1]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \stage1_out[2]_i_1 
       (.I0(data_in_reg_reg_n_0_[2]),
        .I1(data_in_reg_reg_n_0_[1]),
        .I2(data_in_reg_reg_n_0_[0]),
        .O(stage1[2]));
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    \stage1_out[3]_i_1 
       (.I0(data_in_reg_reg_n_0_[3]),
        .I1(data_in_reg_reg_n_0_[2]),
        .I2(data_in_reg_reg_n_0_[1]),
        .I3(data_in_reg_reg_n_0_[0]),
        .I4(din_num_1s[3]),
        .O(stage1[3]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    \stage1_out[4]_i_1 
       (.I0(data_in_reg_reg_n_0_[4]),
        .I1(data_in_reg_reg_n_0_[3]),
        .I2(data_in_reg_reg_n_0_[2]),
        .I3(data_in_reg_reg_n_0_[1]),
        .I4(data_in_reg_reg_n_0_[0]),
        .O(stage1[4]));
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \stage1_out[5]_i_1 
       (.I0(\stage1_out[7]_i_3_n_0 ),
        .I1(din_num_1s[3]),
        .O(stage1[5]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \stage1_out[6]_i_1 
       (.I0(\stage1_out[7]_i_3_n_0 ),
        .I1(data_in_reg_reg_n_0_[6]),
        .O(stage1[6]));
  (* OPT_MODIFIED = "PROPCONST" *) 
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \stage1_out[7]_i_1 
       (.I0(data_in_reg_reg_n_0_[6]),
        .I1(din_num_1s[3]),
        .I2(data_in_reg_reg_n_0_[7]),
        .I3(\stage1_out[7]_i_3_n_0 ),
        .O(stage1[7]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \stage1_out[7]_i_3 
       (.I0(data_in_reg_reg_n_0_[3]),
        .I1(data_in_reg_reg_n_0_[2]),
        .I2(data_in_reg_reg_n_0_[1]),
        .I3(data_in_reg_reg_n_0_[0]),
        .I4(data_in_reg_reg_n_0_[4]),
        .I5(data_in_reg_reg_n_0_[5]),
        .O(\stage1_out[7]_i_3_n_0 ));
  (* OPT_MODIFIED = "PROPCONST" *) 
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \stage1_out[8]_i_1 
       (.I0(din_num_1s[3]),
        .O(stage1[8]));
  FDRE #(
    .INIT(1'b0)) 
    \stage1_out_reg[0] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(data_in_reg_reg_n_0_[0]),
        .Q(stage1_out_reg_n_0_[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage1_out_reg[1] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1[1]),
        .Q(p_0_in2_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage1_out_reg[2] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1[2]),
        .Q(p_1_in3_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage1_out_reg[3] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1[3]),
        .Q(p_0_in1_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage1_out_reg[4] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1[4]),
        .Q(p_1_in4_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage1_out_reg[5] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1[5]),
        .Q(p_0_in0_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage1_out_reg[6] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1[6]),
        .Q(p_1_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage1_out_reg[7] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1[7]),
        .Q(stage1_out_reg_n_0_[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage1_out_reg[8] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1[8]),
        .Q(stage1_out_reg_n_0_[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage2_in_reg[0] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1_out_reg_n_0_[0]),
        .Q(stage2_in_reg_n_0_[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage2_in_reg[1] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(p_0_in2_in),
        .Q(stage2_in_reg_n_0_[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage2_in_reg[2] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(p_1_in3_in),
        .Q(stage2_in_reg_n_0_[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage2_in_reg[3] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(p_0_in1_in),
        .Q(stage2_in_reg_n_0_[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage2_in_reg[4] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(p_1_in4_in),
        .Q(stage2_in_reg_n_0_[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage2_in_reg[5] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(p_0_in0_in),
        .Q(stage2_in_reg_n_0_[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage2_in_reg[6] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(p_1_in),
        .Q(stage2_in_reg_n_0_[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage2_in_reg[7] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1_out_reg_n_0_[7]),
        .Q(stage2_in_reg_n_0_[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stage2_in_reg[8] 
       (.C(tx_clk),
        .CE(1'b1),
        .D(stage1_out_reg_n_0_[8]),
        .Q(p_2_in),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT5 #(
    .INIT(32'h22828882)) 
    \tmds_out[0]_i_1 
       (.I0(data_en_reg_reg),
        .I1(stage2_in_reg_n_0_[0]),
        .I2(p_2_in),
        .I3(\cnt[4]_i_3_n_0 ),
        .I4(\cnt[4]_i_5_n_0 ),
        .O(tmds_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'h22828882)) 
    \tmds_out[1]_i_1 
       (.I0(data_en_reg_reg),
        .I1(stage2_in_reg_n_0_[1]),
        .I2(p_2_in),
        .I3(\cnt[4]_i_3_n_0 ),
        .I4(\cnt[4]_i_5_n_0 ),
        .O(tmds_out[1]));
  LUT5 #(
    .INIT(32'h748BFFFF)) 
    \tmds_out[2]_i_1__0 
       (.I0(\cnt[4]_i_5_n_0 ),
        .I1(\cnt[4]_i_3_n_0 ),
        .I2(p_2_in),
        .I3(stage2_in_reg_n_0_[2]),
        .I4(data_en_reg_reg),
        .O(\tmds_out[2]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h22828882)) 
    \tmds_out[3]_i_1 
       (.I0(data_en_reg_reg),
        .I1(stage2_in_reg_n_0_[3]),
        .I2(p_2_in),
        .I3(\cnt[4]_i_3_n_0 ),
        .I4(\cnt[4]_i_5_n_0 ),
        .O(tmds_out[3]));
  LUT5 #(
    .INIT(32'h748BFFFF)) 
    \tmds_out[4]_i_1__0 
       (.I0(\cnt[4]_i_5_n_0 ),
        .I1(\cnt[4]_i_3_n_0 ),
        .I2(p_2_in),
        .I3(stage2_in_reg_n_0_[4]),
        .I4(data_en_reg_reg),
        .O(\tmds_out[4]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h22828882)) 
    \tmds_out[5]_i_1 
       (.I0(data_en_reg_reg),
        .I1(stage2_in_reg_n_0_[5]),
        .I2(p_2_in),
        .I3(\cnt[4]_i_3_n_0 ),
        .I4(\cnt[4]_i_5_n_0 ),
        .O(tmds_out[5]));
  LUT5 #(
    .INIT(32'h748BFFFF)) 
    \tmds_out[6]_i_1__0 
       (.I0(\cnt[4]_i_5_n_0 ),
        .I1(\cnt[4]_i_3_n_0 ),
        .I2(p_2_in),
        .I3(stage2_in_reg_n_0_[6]),
        .I4(data_en_reg_reg),
        .O(\tmds_out[6]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h22828882)) 
    \tmds_out[7]_i_1 
       (.I0(data_en_reg_reg),
        .I1(stage2_in_reg_n_0_[7]),
        .I2(p_2_in),
        .I3(\cnt[4]_i_3_n_0 ),
        .I4(\cnt[4]_i_5_n_0 ),
        .O(tmds_out[7]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \tmds_out[8]_i_1 
       (.I0(p_2_in),
        .I1(data_en_reg_reg),
        .O(tmds_out[8]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'hD1FF)) 
    \tmds_out[9]_i_1__0 
       (.I0(p_2_in),
        .I1(\cnt[4]_i_3_n_0 ),
        .I2(\cnt[4]_i_5_n_0 ),
        .I3(data_en_reg_reg),
        .O(\tmds_out[9]_i_1__0_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \tmds_out_reg[0] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(tmds_out[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \tmds_out_reg[1] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(tmds_out[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \tmds_out_reg[2] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\tmds_out[2]_i_1__0_n_0 ),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \tmds_out_reg[3] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(tmds_out[3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \tmds_out_reg[4] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\tmds_out[4]_i_1__0_n_0 ),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \tmds_out_reg[5] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(tmds_out[5]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \tmds_out_reg[6] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\tmds_out[6]_i_1__0_n_0 ),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \tmds_out_reg[7] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(tmds_out[7]),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \tmds_out_reg[8] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(tmds_out[8]),
        .Q(Q[8]));
  FDCE #(
    .INIT(1'b0)) 
    \tmds_out_reg[9] 
       (.C(tx_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\tmds_out[9]_i_1__0_n_0 ),
        .Q(Q[9]));
endmodule

module tmds_transmitter
   (hdmi_tx_clk_n,
    hdmi_tx_clk_p,
    hdmi_tx_d0_n,
    hdmi_tx_d0_p,
    hdmi_tx_d1_n,
    hdmi_tx_d1_p,
    hdmi_tx_d2_n,
    hdmi_tx_d2_p,
    rst,
    tx_clk,
    tx_clk_5x,
    tx_dv,
    D,
    tx_blue,
    tx_green,
    tx_red);
  output hdmi_tx_clk_n;
  output hdmi_tx_clk_p;
  output hdmi_tx_d0_n;
  output hdmi_tx_d0_p;
  output hdmi_tx_d1_n;
  output hdmi_tx_d1_p;
  output hdmi_tx_d2_n;
  output hdmi_tx_d2_p;
  input rst;
  input tx_clk;
  input tx_clk_5x;
  input tx_dv;
  input [1:0]D;
  input [7:0]tx_blue;
  input [7:0]tx_green;
  input [7:0]tx_red;

  wire [1:0]D;
  wire clk_out;
  wire encoder_b_n_0;
  wire hdmi_tx_clk_n;
  wire hdmi_tx_clk_p;
  wire hdmi_tx_d0_n;
  wire hdmi_tx_d0_p;
  wire hdmi_tx_d1_n;
  wire hdmi_tx_d1_p;
  wire hdmi_tx_d2_n;
  wire hdmi_tx_d2_p;
  wire rst;
  wire [9:0]tmds_blue;
  wire [9:0]tmds_green;
  wire [9:0]tmds_red;
  wire [7:0]tx_blue;
  wire tx_clk;
  wire tx_clk_5x;
  wire tx_dv;
  wire [7:0]tx_green;
  wire [7:0]tx_red;
  wire NLW_ODDR_clk_S_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFDS OBUFDS_clk
       (.I(clk_out),
        .O(hdmi_tx_clk_p),
        .OB(hdmi_tx_clk_n));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "FALSE" *) 
  ODDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    ODDR_clk
       (.C(tx_clk),
        .CE(1'b1),
        .D1(1'b1),
        .D2(1'b0),
        .Q(clk_out),
        .R(rst),
        .S(NLW_ODDR_clk_S_UNCONNECTED));
  tmds_encoder encoder_b
       (.D(D),
        .Q(tmds_blue),
        .rst(rst),
        .\tmds_out_reg[0]_0 (encoder_b_n_0),
        .tx_blue(tx_blue),
        .tx_clk(tx_clk),
        .tx_dv(tx_dv));
  tmds_encoder_0 encoder_g
       (.Q(tmds_green),
        .data_en_reg_reg(encoder_b_n_0),
        .rst(rst),
        .tx_clk(tx_clk),
        .tx_green(tx_green));
  tmds_encoder_1 encoder_r
       (.Q(tmds_red),
        .data_en_reg_reg(encoder_b_n_0),
        .rst(rst),
        .tx_clk(tx_clk),
        .tx_red(tx_red));
  oserdes_10to1 oserdes0
       (.data_in(tmds_blue),
        .hdmi_tx_d0_n(hdmi_tx_d0_n),
        .hdmi_tx_d0_p(hdmi_tx_d0_p),
        .rst(rst),
        .tx_clk(tx_clk),
        .tx_clk_5x(tx_clk_5x));
  oserdes_10to1_2 oserdes1
       (.data_in(tmds_green),
        .hdmi_tx_d1_n(hdmi_tx_d1_n),
        .hdmi_tx_d1_p(hdmi_tx_d1_p),
        .rst(rst),
        .tx_clk(tx_clk),
        .tx_clk_5x(tx_clk_5x));
  oserdes_10to1_3 oserdes2
       (.data_in(tmds_red),
        .hdmi_tx_d2_n(hdmi_tx_d2_n),
        .hdmi_tx_d2_p(hdmi_tx_d2_p),
        .rst(rst),
        .tx_clk(tx_clk),
        .tx_clk_5x(tx_clk_5x));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
