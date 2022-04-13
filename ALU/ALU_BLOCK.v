module ALU_BLOCK(
output signed [31:0] alu_out,
output [31:0] beq_addr,
output mux_sel_ctrl,
input signed [31:0] rs_in, ex_dm_alu_out,dm_wb_mux_out,
input signed [31:0] rt_in,
input [1:0] fwd_ctrl_a, fwd_ctrl_b, 
input r_i_sel_ctrl, alu_ctrl, beq_in_1,
input [31:0] id_ex_inst, id_ex_pc_4_out,
input [15:0] sign_ext_in 
);

wire [31:0] rt_sign_ext_out, alu_ip_1, alu_ip_2, sign_ext_addr;
wire [3:0] alu_op_ctrl;
wire beq_in, beq_inst;

SIGNED_EXT SE(sign_ext_in,sign_ext_addr);
R_IN_MUX_SEL RIMUXSEL(rt_sign_ext_out, rt_in, sign_ext_addr, r_i_sel_ctrl);

ALU_A_FWD ALUFWDA(alu_ip_1,rs_in, ex_dm_alu_out,dm_wb_mux_out,fwd_ctrl_a);
ALU_B_FWD ALUFEDB(alu_ip_2,rs_in, rt_sign_ext_out, dm_wb_mux_out, fwd_ctrl_b);

ALU ALU1(alu_out, beq_in, alu_ip_1, alu_ip_2, alu_op_ctrl, alu_ctrl, beq_inst);
ALU_CONTROLLER ALUCTLR(id_ex_inst, alu_op_ctrl, beq_inst);

BEQ_ALU BEQALUU(id_ex_pc_4_out, sign_ext_addr, beq_addr);
BEQ_MODULE BEQMOD(beq_in_1, beq_in, mux_sel_ctrl);


endmodule