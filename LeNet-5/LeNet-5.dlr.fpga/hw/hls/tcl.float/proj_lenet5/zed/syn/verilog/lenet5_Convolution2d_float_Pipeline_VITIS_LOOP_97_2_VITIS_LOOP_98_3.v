// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Version: 2021.2
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module lenet5_Convolution2d_float_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        phi_mul186,
        out_data_address0,
        out_data_ce0,
        out_data_we0,
        out_data_d0,
        B
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [11:0] phi_mul186;
output  [12:0] out_data_address0;
output   out_data_ce0;
output   out_data_we0;
output  [31:0] out_data_d0;
input  [31:0] B;

reg ap_idle;
reg out_data_ce0;
reg out_data_we0;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln97_fu_99_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln98_fu_114_p2;
reg   [0:0] icmp_ln98_reg_226;
wire   [4:0] select_ln97_fu_120_p3;
reg   [4:0] select_ln97_reg_231;
wire   [31:0] zext_ln82_1_fu_182_p1;
wire    ap_block_pp0_stage0;
reg   [4:0] c_fu_44;
wire   [4:0] add_ln98_fu_128_p2;
wire    ap_loop_init;
reg   [4:0] ap_sig_allocacmp_c_load;
reg   [9:0] idx2_fu_48;
wire   [9:0] select_ln97_27_fu_153_p3;
reg   [9:0] indvar_flatten_fu_52;
wire   [9:0] add_ln97_fu_105_p2;
reg   [9:0] ap_sig_allocacmp_indvar_flatten_load;
wire   [9:0] add_ln101_fu_147_p2;
wire   [11:0] c_cast_fu_164_p1;
wire   [11:0] add_ln82_fu_167_p2;
wire   [12:0] zext_ln82_fu_172_p1;
wire   [12:0] zext_ln97_3_fu_160_p1;
wire   [12:0] add_ln82_1_fu_176_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
end

lenet5_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln97_fu_99_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            c_fu_44 <= add_ln98_fu_128_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            c_fu_44 <= 5'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            idx2_fu_48 <= 10'd0;
        end else if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
            idx2_fu_48 <= select_ln97_27_fu_153_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln97_fu_99_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            indvar_flatten_fu_52 <= add_ln97_fu_105_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            indvar_flatten_fu_52 <= 10'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln97_fu_99_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln98_reg_226 <= icmp_ln98_fu_114_p2;
        select_ln97_reg_231 <= select_ln97_fu_120_p3;
    end
end

always @ (*) begin
    if (((icmp_ln97_fu_99_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_start_int == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_c_load = 5'd0;
    end else begin
        ap_sig_allocacmp_c_load = c_fu_44;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_indvar_flatten_load = 10'd0;
    end else begin
        ap_sig_allocacmp_indvar_flatten_load = indvar_flatten_fu_52;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        out_data_ce0 = 1'b1;
    end else begin
        out_data_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        out_data_we0 = 1'b1;
    end else begin
        out_data_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln101_fu_147_p2 = (idx2_fu_48 + 10'd28);

assign add_ln82_1_fu_176_p2 = (zext_ln82_fu_172_p1 + zext_ln97_3_fu_160_p1);

assign add_ln82_fu_167_p2 = (phi_mul186 + c_cast_fu_164_p1);

assign add_ln97_fu_105_p2 = (ap_sig_allocacmp_indvar_flatten_load + 10'd1);

assign add_ln98_fu_128_p2 = (select_ln97_fu_120_p3 + 5'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign c_cast_fu_164_p1 = select_ln97_reg_231;

assign icmp_ln97_fu_99_p2 = ((ap_sig_allocacmp_indvar_flatten_load == 10'd784) ? 1'b1 : 1'b0);

assign icmp_ln98_fu_114_p2 = ((ap_sig_allocacmp_c_load == 5'd28) ? 1'b1 : 1'b0);

assign out_data_address0 = zext_ln82_1_fu_182_p1;

assign out_data_d0 = B;

assign select_ln97_27_fu_153_p3 = ((icmp_ln98_reg_226[0:0] == 1'b1) ? add_ln101_fu_147_p2 : idx2_fu_48);

assign select_ln97_fu_120_p3 = ((icmp_ln98_fu_114_p2[0:0] == 1'b1) ? 5'd0 : ap_sig_allocacmp_c_load);

assign zext_ln82_1_fu_182_p1 = add_ln82_1_fu_176_p2;

assign zext_ln82_fu_172_p1 = add_ln82_fu_167_p2;

assign zext_ln97_3_fu_160_p1 = select_ln97_27_fu_153_p3;

endmodule //lenet5_Convolution2d_float_Pipeline_VITIS_LOOP_97_2_VITIS_LOOP_98_3