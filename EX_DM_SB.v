module EX_DM_SB(input [31:0] alu_out, id_ex_rt_data, id_ex_inst_out, 
input [4:0] id_ex_rd_out_addr,  
input id_ex_fwd_dm_ctrl, id_ex_wb_mux_ctrl, id_ex_wd_ctrl, id_ex_rd_ctrl, id_ex_w_enable, clk, 
output reg [31:0] ex_dm_alu_out, ex_dm_rt_data, ex_wb_inst_out, 
output reg [4:0] ex_dm_rd_out_addr,  
output reg ex_dm_fwd_dm_ctrl, ex_dm_wb_mux_ctrl, ex_dm_wd_ctrl, ex_dm_rd_ctrl, ex_dm_w_enable);

always@(posedge clk)
begin
    ex_dm_alu_out = alu_out;
    ex_dm_rt_data = id_ex_rt_data;
    ex_dm_rd_out_addr = id_ex_rd_out_addr;
    ex_dm_fwd_dm_ctrl = id_ex_fwd_dm_ctrl;
    ex_dm_wb_mux_ctrl = id_ex_wb_mux_ctrl;
    ex_dm_wd_ctrl = id_ex_wd_ctrl;
    ex_dm_rd_ctrl = id_ex_rd_ctrl;
    ex_dm_w_enable = id_ex_w_enable; 
    ex_wb_inst_out = id_ex_inst_out;
end
endmodule
