module DM_WB_SB(input [31:0] dm_out, ex_dm_alu_out,  
input  [4:0] ex_dm_rd_out_addr, 
input ex_dm_w_enable, ex_dm_mux_ctrl, clk, 
output reg [31:0] wb_dm_out, wb_dm_alu_out, 
output reg [4:0] wb_dm_rd_out_addr, 
output reg wb_dm_w_enable, wb_dm_wb_mux_ctrl);

always@(posedge clk)
    begin
        wb_dm_out = dm_out;
        wb_dm_alu_out = ex_dm_alu_out;
        wb_dm_rd_out_addr = ex_dm_rd_out_addr;
        wb_dm_w_enable = ex_dm_w_enable;
        wb_dm_wb_mux_ctrl = ex_dm_mux_ctrl;
    end
endmodule
