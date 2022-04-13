module ID_STAGE(input [4:0] rs_addr, rt_addr, wd_addr, 
input [31:0] wd_data, 
input clk, rd_w_enable, 
input [31:0] if_id_inst, id_ex_inst, ex_dm_inst, 
input [4:0] id_ex_wb_addr, ex_dm_wb_addr, 
input [4:0] rd,
output [31:0] rs_data, rt_data, 
output [4:0] rd_out_addr, 
output if_id_reg_ctrl, pcw_ctrl,
output b_w_nable, b_alu_ctrl, b_r_i_sel_ctrl, b_rd_ctrl, b_wd_ctrl, b_wb_mux_ctrl, b_fwd_dm_ctrl, b_beq_and_in,
output [1:0] b_fwd_ctrl_a, b_fwd_Ctrl_b);

  wire r_enable, w_enable, buble_mux_ctrl, alu_ctrl, rd_addr_ctrl, rd_enable__ctrl, r_i_sel_ctrl, rd_ctrl, wd_ctrl, 
  wb_mux_ctrl, fwd_dm_ctrl, beq_and_in;
  
  wire [1:0] fwd_ctrl_a, fwd_ctrl_b;
  
  REGISTER_STAGE2 R_D_1(rs_data, rt_data, rs_addr, rt_addr, wd_addr, wd_data, r_enable, rd_w_enable, clk);
  
  RD_ADDR_MUX R_D_2(rd_out_addr, rt_addr, rd, rd_addr_ctrl, rd_enable_ctrl);
  
  CONTROLLER R_D_3(if_id_inst, id_ex_inst, ex_dm_inst, id_ex_wb_addr, ex_dm_wb_addr, r_enable, w_enable, alu_ctrl,
  buble_mux_ctrl, if_id_reg_ctrl, pcw_ctrl, rd_addr_ctrl, rd_enable_Ctrl, r_i_sel_ctrl, rd_ctrl, wd_ctrl, wb_mux_ctrl, 
  fwd_dm_ctrl, beq_and_in, fwd_ctrl_a, fwd_ctrl_b);
  
  BUBLE R_D_4(w_enable, alu_ctrl, buble_mux_ctrl, r_i_sel_ctrl, rd_ctrl, wd_ctrl, wb_mux_ctrl, fwd_dm_ctrl, beq_and_in, 
  fwd_ctrl_a, fwd_ctrl_b, b_w_enable, b_alu_ctrl, b_r_i_sel_ctrl, b_rd_ctrl, b_wb_mux_ctrl, b_fwd_dm_ctrl, b_beq_and_in, 
  b_fwd_ctrl_a, b_fwd_ctrl_b);
  

endmodule
