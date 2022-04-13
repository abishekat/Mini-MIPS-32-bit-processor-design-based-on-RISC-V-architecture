module BUBLE(
  input w_enable, alu_ctrl, buble_mux_ctrl, r_i_sel_ctrl, rd_ctrl, wd_ctrl, wb_mux_ctrl, fwd_dm_ctrl, beq_and_in,
  input [1:0] fwd_ctrl_a, fwd_ctrl_b,
  output reg b_w_enable, b_alu_ctrl, b_r_i_sel_ctrl, b_rd_ctrl, b_wd_ctrl, b_wb_mux_ctrl, b_fwd_dm_ctrl, b_beq_and_in,
  output reg [1:0] b_fwd_ctrl_a, b_fwd_ctrl_b);
  
  always @ (*)
    begin
      if(buble_mux_ctrl)
        begin
          b_w_enable = w_enable;
          b_alu_ctrl = alu_ctrl;
          b_r_i_sel_ctrl = r_i_sel_ctrl;
          b_rd_ctrl = rd_ctrl;
          b_wd_ctrl = wd_ctrl;
          b_wb_mux_ctrl = wb_mux_ctrl;
          b_fwd_dm_ctrl = fwd_dm_ctrl;
          b_fwd_ctrl_a = fwd_ctrl_a;
          b_fwd_ctrl_b = fwd_ctrl_b;
          b_beq_and_in = beq_and_in;
          
        end
        
      else
        begin
          b_w_enable = 1'bX;
          b_alu_ctrl = 1'bX;
          b_r_i_sel_ctrl = 1'bX;
          b_rd_ctrl = 1'bX;
          b_wd_ctrl = 1'bX;
          b_wb_mux_ctrl = 1'bX;
          b_fwd_dm_ctrl = 1'bX;
          b_fwd_ctrl_a = 2'bX;
          b_fwd_ctrl_b = 2'bX;
          b_beq_and_in = 1'bX;
        end
    end
  
  
endmodule
