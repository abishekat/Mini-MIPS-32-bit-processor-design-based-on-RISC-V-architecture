module ID_EX_SB(input o_w_enable, o_alu_ctrl, o_r_i_sel_ctrl, o_rd_ctrl, o_wd_ctrl, o_wb_mux_ctrl, o_fwd_dm_ctrl, clk, o_beq_and_in2, 
    input [1:0] o_fwd_ctrl_a, o_fwd_ctrl_b, 
    input [4:0] rd_out_addr, 
    input [15:0] sign_ext_in, 
    input [31:0] if_id_pc_4_in, if_id_inst_out, 
    input [31:0] rs_data, rt_data, 
    output reg id_ex_w_enable, id_ex_alu_ctrl, id_ex_r_i_sel_ctrl, id_ex_rd_ctrl, id_ex_wd_ctrl, id_ex_wb_mux_ctrl, id_ex_fwd_dm_ctrl, beq_and_in, 
    output reg [1:0] id_ex_fwd_ctrl_a, id_ex_fwd_ctrl_b, 
    output reg [4:0] id_ex_rd_out_addr, 
    output reg [15:0] id_ex_sign_ext_in, 
    output reg [31:0] id_ex_pc_4_out, id_ex_inst_out, 
    output reg [31:0] id_ex_rs_data, id_ex_rt_data);

always@(posedge clk)
    begin
        id_ex_w_enable = o_w_enable;
        id_ex_alu_ctrl = o_alu_ctrl;
        id_ex_r_i_sel_ctrl = o_r_i_sel_ctrl;
        id_ex_rd_ctrl = o_rd_ctrl;
        id_ex_wd_ctrl = o_wd_ctrl;
        id_ex_wb_mux_ctrl = o_wb_mux_ctrl;
        id_ex_fwd_dm_ctrl = o_fwd_dm_ctrl;
        id_ex_fwd_ctrl_a = o_fwd_ctrl_a;
        id_ex_fwd_ctrl_b = o_fwd_ctrl_b;
        id_ex_rd_out_addr = rd_out_addr;
        id_ex_sign_ext_in = sign_ext_in;
        id_ex_pc_4_out = if_id_pc_4_in;
        id_ex_rs_data = rs_data;
        id_ex_rt_data = rt_data;
        id_ex_inst_out = if_id_inst_out;
        beq_and_in = o_beq_and_in2;
    end

endmodule