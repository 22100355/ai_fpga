// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Version: 2021.2
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module lenet5_Convolution2d_float_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        out_data_address0,
        out_data_ce0,
        out_data_we0,
        out_data_d0,
        out_data_q0,
        p1_out_data_address0,
        p1_out_data_ce0,
        p1_out_data_q0,
        p1_out_data_address1,
        p1_out_data_ce1,
        p1_out_data_q1,
        p1_out_data_address2,
        p1_out_data_ce2,
        p1_out_data_q2,
        p1_out_data_address3,
        p1_out_data_ce3,
        p1_out_data_q3,
        p1_out_data_address4,
        p1_out_data_ce4,
        p1_out_data_q4,
        p1_out_data_address5,
        p1_out_data_ce5,
        p1_out_data_q5,
        p1_out_data_address6,
        p1_out_data_ce6,
        p1_out_data_q6,
        p1_out_data_address7,
        p1_out_data_ce7,
        p1_out_data_q7,
        p1_out_data_address8,
        p1_out_data_ce8,
        p1_out_data_q8,
        p1_out_data_address9,
        p1_out_data_ce9,
        p1_out_data_q9,
        p1_out_data_address10,
        p1_out_data_ce10,
        p1_out_data_q10,
        p1_out_data_address11,
        p1_out_data_ce11,
        p1_out_data_q11,
        p1_out_data_address12,
        p1_out_data_ce12,
        p1_out_data_q12,
        grp_fu_236_p_din0,
        grp_fu_236_p_din1,
        grp_fu_236_p_opcode,
        grp_fu_236_p_dout0,
        grp_fu_236_p_ce,
        grp_fu_240_p_din0,
        grp_fu_240_p_din1,
        grp_fu_240_p_opcode,
        grp_fu_240_p_dout0,
        grp_fu_240_p_ce,
        grp_fu_244_p_din0,
        grp_fu_244_p_din1,
        grp_fu_244_p_dout0,
        grp_fu_244_p_ce
);

parameter    ap_ST_fsm_state1 = 6'd1;
parameter    ap_ST_fsm_state2 = 6'd2;
parameter    ap_ST_fsm_state3 = 6'd4;
parameter    ap_ST_fsm_state4 = 6'd8;
parameter    ap_ST_fsm_state5 = 6'd16;
parameter    ap_ST_fsm_state6 = 6'd32;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [10:0] out_data_address0;
output   out_data_ce0;
output   out_data_we0;
output  [31:0] out_data_d0;
input  [31:0] out_data_q0;
output  [10:0] p1_out_data_address0;
output   p1_out_data_ce0;
input  [31:0] p1_out_data_q0;
output  [10:0] p1_out_data_address1;
output   p1_out_data_ce1;
input  [31:0] p1_out_data_q1;
output  [10:0] p1_out_data_address2;
output   p1_out_data_ce2;
input  [31:0] p1_out_data_q2;
output  [10:0] p1_out_data_address3;
output   p1_out_data_ce3;
input  [31:0] p1_out_data_q3;
output  [10:0] p1_out_data_address4;
output   p1_out_data_ce4;
input  [31:0] p1_out_data_q4;
output  [10:0] p1_out_data_address5;
output   p1_out_data_ce5;
input  [31:0] p1_out_data_q5;
output  [10:0] p1_out_data_address6;
output   p1_out_data_ce6;
input  [31:0] p1_out_data_q6;
output  [10:0] p1_out_data_address7;
output   p1_out_data_ce7;
input  [31:0] p1_out_data_q7;
output  [10:0] p1_out_data_address8;
output   p1_out_data_ce8;
input  [31:0] p1_out_data_q8;
output  [10:0] p1_out_data_address9;
output   p1_out_data_ce9;
input  [31:0] p1_out_data_q9;
output  [10:0] p1_out_data_address10;
output   p1_out_data_ce10;
input  [31:0] p1_out_data_q10;
output  [10:0] p1_out_data_address11;
output   p1_out_data_ce11;
input  [31:0] p1_out_data_q11;
output  [10:0] p1_out_data_address12;
output   p1_out_data_ce12;
input  [31:0] p1_out_data_q12;
output  [31:0] grp_fu_236_p_din0;
output  [31:0] grp_fu_236_p_din1;
output  [1:0] grp_fu_236_p_opcode;
input  [31:0] grp_fu_236_p_dout0;
output   grp_fu_236_p_ce;
output  [31:0] grp_fu_240_p_din0;
output  [31:0] grp_fu_240_p_din1;
output  [1:0] grp_fu_240_p_opcode;
input  [31:0] grp_fu_240_p_dout0;
output   grp_fu_240_p_ce;
output  [31:0] grp_fu_244_p_din0;
output  [31:0] grp_fu_244_p_din1;
input  [31:0] grp_fu_244_p_dout0;
output   grp_fu_244_p_ce;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[10:0] out_data_address0;
reg out_data_ce0;
reg out_data_we0;
reg[31:0] out_data_d0;

(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [3:0] conv2_bias_address0;
reg    conv2_bias_ce0;
wire   [31:0] conv2_bias_q0;
reg   [11:0] phi_mul_load_reg_155;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln94_fu_100_p2;
wire   [10:0] mul_ln96_fu_125_p2;
reg   [10:0] mul_ln96_reg_168;
reg   [31:0] B_reg_174;
wire    ap_CS_fsm_state3;
wire    grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3_fu_57_ap_start;
wire    grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3_fu_57_ap_done;
wire    grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3_fu_57_ap_idle;
wire    grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3_fu_57_ap_ready;
wire   [10:0] grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3_fu_57_out_data_address0;
wire    grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3_fu_57_out_data_ce0;
wire    grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3_fu_57_out_data_we0;
wire   [31:0] grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3_fu_57_out_data_d0;
wire    grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_ap_start;
wire    grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_ap_done;
wire    grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_ap_idle;
wire    grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_ap_ready;
wire   [10:0] grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address0;
wire    grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce0;
wire   [10:0] grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address1;
wire    grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce1;
wire   [10:0] grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address2;
wire    grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce2;
wire   [10:0] grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address3;
wire    grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce3;
wire   [10:0] grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address4;
wire    grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce4;
wire   [10:0] grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address5;
wire    grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce5;
wire   [10:0] grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address6;
wire    grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce6;
wire   [10:0] grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address7;
wire    grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce7;
wire   [10:0] grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address8;
wire    grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce8;
wire   [10:0] grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address9;
wire    grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce9;
wire   [10:0] grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address10;
wire    grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce10;
wire   [10:0] grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address11;
wire    grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce11;
wire   [10:0] grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address12;
wire    grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce12;
wire   [10:0] grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_out_data_address0;
wire    grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_out_data_ce0;
wire    grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_out_data_we0;
wire   [31:0] grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_out_data_d0;
wire   [31:0] grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_grp_fu_179_p_din0;
wire   [31:0] grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_grp_fu_179_p_din1;
wire   [1:0] grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_grp_fu_179_p_opcode;
wire    grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_grp_fu_179_p_ce;
wire   [31:0] grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_grp_fu_183_p_din0;
wire   [31:0] grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_grp_fu_183_p_din1;
wire   [1:0] grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_grp_fu_183_p_opcode;
wire    grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_grp_fu_183_p_ce;
wire   [31:0] grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_grp_fu_187_p_din0;
wire   [31:0] grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_grp_fu_187_p_din1;
wire    grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_grp_fu_187_p_ce;
reg    grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3_fu_57_ap_start_reg;
wire    ap_CS_fsm_state4;
reg    grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_ap_start_reg;
wire    ap_CS_fsm_state5;
wire    ap_CS_fsm_state6;
wire   [31:0] zext_ln95_fu_116_p1;
reg   [11:0] phi_mul_fu_36;
wire   [11:0] add_ln94_1_fu_94_p2;
reg   [4:0] f_fu_40;
wire   [4:0] add_ln94_fu_106_p2;
wire   [3:0] trunc_ln95_fu_112_p1;
wire   [3:0] mul_ln96_fu_125_p0;
wire   [7:0] mul_ln96_fu_125_p1;
reg    grp_fu_179_ce;
reg    grp_fu_183_ce;
reg    grp_fu_187_ce;
reg   [5:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
reg    ap_ST_fsm_state6_blk;
wire   [10:0] mul_ln96_fu_125_p00;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 6'd1;
#0 grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3_fu_57_ap_start_reg = 1'b0;
#0 grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_ap_start_reg = 1'b0;
end

lenet5_Convolution2d_float_1_conv2_bias_ROM_AUTO_1R #(
    .DataWidth( 32 ),
    .AddressRange( 16 ),
    .AddressWidth( 4 ))
conv2_bias_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(conv2_bias_address0),
    .ce0(conv2_bias_ce0),
    .q0(conv2_bias_q0)
);

lenet5_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3 grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3_fu_57(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3_fu_57_ap_start),
    .ap_done(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3_fu_57_ap_done),
    .ap_idle(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3_fu_57_ap_idle),
    .ap_ready(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3_fu_57_ap_ready),
    .mul_ln96(mul_ln96_reg_168),
    .out_data_address0(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3_fu_57_out_data_address0),
    .out_data_ce0(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3_fu_57_out_data_ce0),
    .out_data_we0(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3_fu_57_out_data_we0),
    .out_data_d0(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3_fu_57_out_data_d0),
    .B(B_reg_174)
);

lenet5_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6 grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_ap_start),
    .ap_done(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_ap_done),
    .ap_idle(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_ap_idle),
    .ap_ready(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_ap_ready),
    .phi_mul(phi_mul_load_reg_155),
    .p1_out_data_address0(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address0),
    .p1_out_data_ce0(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce0),
    .p1_out_data_q0(p1_out_data_q0),
    .p1_out_data_address1(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address1),
    .p1_out_data_ce1(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce1),
    .p1_out_data_q1(p1_out_data_q1),
    .p1_out_data_address2(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address2),
    .p1_out_data_ce2(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce2),
    .p1_out_data_q2(p1_out_data_q2),
    .p1_out_data_address3(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address3),
    .p1_out_data_ce3(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce3),
    .p1_out_data_q3(p1_out_data_q3),
    .p1_out_data_address4(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address4),
    .p1_out_data_ce4(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce4),
    .p1_out_data_q4(p1_out_data_q4),
    .p1_out_data_address5(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address5),
    .p1_out_data_ce5(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce5),
    .p1_out_data_q5(p1_out_data_q5),
    .p1_out_data_address6(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address6),
    .p1_out_data_ce6(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce6),
    .p1_out_data_q6(p1_out_data_q6),
    .p1_out_data_address7(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address7),
    .p1_out_data_ce7(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce7),
    .p1_out_data_q7(p1_out_data_q7),
    .p1_out_data_address8(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address8),
    .p1_out_data_ce8(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce8),
    .p1_out_data_q8(p1_out_data_q8),
    .p1_out_data_address9(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address9),
    .p1_out_data_ce9(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce9),
    .p1_out_data_q9(p1_out_data_q9),
    .p1_out_data_address10(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address10),
    .p1_out_data_ce10(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce10),
    .p1_out_data_q10(p1_out_data_q10),
    .p1_out_data_address11(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address11),
    .p1_out_data_ce11(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce11),
    .p1_out_data_q11(p1_out_data_q11),
    .p1_out_data_address12(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address12),
    .p1_out_data_ce12(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce12),
    .p1_out_data_q12(p1_out_data_q12),
    .mul_ln96(mul_ln96_reg_168),
    .out_data_address0(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_out_data_address0),
    .out_data_ce0(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_out_data_ce0),
    .out_data_we0(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_out_data_we0),
    .out_data_d0(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_out_data_d0),
    .out_data_q0(out_data_q0),
    .grp_fu_179_p_din0(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_grp_fu_179_p_din0),
    .grp_fu_179_p_din1(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_grp_fu_179_p_din1),
    .grp_fu_179_p_opcode(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_grp_fu_179_p_opcode),
    .grp_fu_179_p_dout0(grp_fu_236_p_dout0),
    .grp_fu_179_p_ce(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_grp_fu_179_p_ce),
    .grp_fu_183_p_din0(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_grp_fu_183_p_din0),
    .grp_fu_183_p_din1(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_grp_fu_183_p_din1),
    .grp_fu_183_p_opcode(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_grp_fu_183_p_opcode),
    .grp_fu_183_p_dout0(grp_fu_240_p_dout0),
    .grp_fu_183_p_ce(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_grp_fu_183_p_ce),
    .grp_fu_187_p_din0(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_grp_fu_187_p_din0),
    .grp_fu_187_p_din1(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_grp_fu_187_p_din1),
    .grp_fu_187_p_dout0(grp_fu_244_p_dout0),
    .grp_fu_187_p_ce(grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_grp_fu_187_p_ce)
);

lenet5_mul_4ns_8ns_11_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 4 ),
    .din1_WIDTH( 8 ),
    .dout_WIDTH( 11 ))
mul_4ns_8ns_11_1_1_U91(
    .din0(mul_ln96_fu_125_p0),
    .din1(mul_ln96_fu_125_p1),
    .dout(mul_ln96_fu_125_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_ap_start_reg <= 1'b1;
        end else if ((grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_ap_ready == 1'b1)) begin
            grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3_fu_57_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3_fu_57_ap_start_reg <= 1'b1;
        end else if ((grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3_fu_57_ap_ready == 1'b1)) begin
            grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3_fu_57_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        f_fu_40 <= 5'd0;
    end else if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln94_fu_100_p2 == 1'd0))) begin
        f_fu_40 <= add_ln94_fu_106_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        phi_mul_fu_36 <= 12'd0;
    end else if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln94_fu_100_p2 == 1'd0))) begin
        phi_mul_fu_36 <= add_ln94_1_fu_94_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        B_reg_174 <= conv2_bias_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln94_fu_100_p2 == 1'd0))) begin
        mul_ln96_reg_168 <= mul_ln96_fu_125_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        phi_mul_load_reg_155 <= phi_mul_fu_36;
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3_fu_57_ap_done == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

assign ap_ST_fsm_state5_blk = 1'b0;

always @ (*) begin
    if ((grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_ap_done == 1'b0)) begin
        ap_ST_fsm_state6_blk = 1'b1;
    end else begin
        ap_ST_fsm_state6_blk = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0)) | ((1'b1 == ap_CS_fsm_state2) & (icmp_ln94_fu_100_p2 == 1'd1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln94_fu_100_p2 == 1'd1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        conv2_bias_ce0 = 1'b1;
    end else begin
        conv2_bias_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        grp_fu_179_ce = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_grp_fu_179_p_ce;
    end else begin
        grp_fu_179_ce = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        grp_fu_183_ce = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_grp_fu_183_p_ce;
    end else begin
        grp_fu_183_ce = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        grp_fu_187_ce = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_grp_fu_187_p_ce;
    end else begin
        grp_fu_187_ce = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        out_data_address0 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_out_data_address0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        out_data_address0 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3_fu_57_out_data_address0;
    end else begin
        out_data_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        out_data_ce0 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_out_data_ce0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        out_data_ce0 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3_fu_57_out_data_ce0;
    end else begin
        out_data_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        out_data_d0 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_out_data_d0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        out_data_d0 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3_fu_57_out_data_d0;
    end else begin
        out_data_d0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        out_data_we0 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_out_data_we0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        out_data_we0 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3_fu_57_out_data_we0;
    end else begin
        out_data_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln94_fu_100_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((1'b1 == ap_CS_fsm_state4) & (grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3_fu_57_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            if (((1'b1 == ap_CS_fsm_state6) & (grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln94_1_fu_94_p2 = (phi_mul_fu_36 + 12'd150);

assign add_ln94_fu_106_p2 = (f_fu_40 + 5'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign conv2_bias_address0 = zext_ln95_fu_116_p1;

assign grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_ap_start = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_ap_start_reg;

assign grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3_fu_57_ap_start = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3_fu_57_ap_start_reg;

assign grp_fu_236_p_ce = grp_fu_179_ce;

assign grp_fu_236_p_din0 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_grp_fu_179_p_din0;

assign grp_fu_236_p_din1 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_grp_fu_179_p_din1;

assign grp_fu_236_p_opcode = 2'd0;

assign grp_fu_240_p_ce = grp_fu_183_ce;

assign grp_fu_240_p_din0 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_grp_fu_183_p_din0;

assign grp_fu_240_p_din1 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_grp_fu_183_p_din1;

assign grp_fu_240_p_opcode = 2'd0;

assign grp_fu_244_p_ce = grp_fu_187_ce;

assign grp_fu_244_p_din0 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_grp_fu_187_p_din0;

assign grp_fu_244_p_din1 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_grp_fu_187_p_din1;

assign icmp_ln94_fu_100_p2 = ((f_fu_40 == 5'd16) ? 1'b1 : 1'b0);

assign mul_ln96_fu_125_p0 = mul_ln96_fu_125_p00;

assign mul_ln96_fu_125_p00 = trunc_ln95_fu_112_p1;

assign mul_ln96_fu_125_p1 = 11'd100;

assign p1_out_data_address0 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address0;

assign p1_out_data_address1 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address1;

assign p1_out_data_address10 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address10;

assign p1_out_data_address11 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address11;

assign p1_out_data_address12 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address12;

assign p1_out_data_address2 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address2;

assign p1_out_data_address3 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address3;

assign p1_out_data_address4 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address4;

assign p1_out_data_address5 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address5;

assign p1_out_data_address6 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address6;

assign p1_out_data_address7 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address7;

assign p1_out_data_address8 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address8;

assign p1_out_data_address9 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_address9;

assign p1_out_data_ce0 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce0;

assign p1_out_data_ce1 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce1;

assign p1_out_data_ce10 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce10;

assign p1_out_data_ce11 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce11;

assign p1_out_data_ce12 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce12;

assign p1_out_data_ce2 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce2;

assign p1_out_data_ce3 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce3;

assign p1_out_data_ce4 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce4;

assign p1_out_data_ce5 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce5;

assign p1_out_data_ce6 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce6;

assign p1_out_data_ce7 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce7;

assign p1_out_data_ce8 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce8;

assign p1_out_data_ce9 = grp_Convolution2d_float_1_Pipeline_VITIS_LOOP_110_4_VITIS_LOOP_111_5_VITIS_LOOP_112_6_fu_66_p1_out_data_ce9;

assign trunc_ln95_fu_112_p1 = f_fu_40[3:0];

assign zext_ln95_fu_116_p1 = trunc_ln95_fu_112_p1;

endmodule //lenet5_Convolution2d_float_1