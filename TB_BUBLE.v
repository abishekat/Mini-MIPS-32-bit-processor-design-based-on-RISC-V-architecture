module TB_BUBLE();
reg w_enable,alu_ctrl,buble_mux_ctrl,r_i_sel_ctrl,rd_ctrl,wd_ctrl,wb_mux_ctrl,fwd_dm_ctrl,beq_and_in2;
reg [1:0] fwd_ctrl_a,fwd_ctrl_b;
wire o_w_enable,o_alu_ctrl,o_r_i_sel_ctrl,o_rd_ctrl,o_wd_ctrl,o_wb_mux_ctrl,o_fwd_dm_ctrl,o_beq_and_in2;
wire [1:0] o_fwd_ctrl_a,o_fwd_ctrl_b;

 BUBLE BUB(w_enable,alu_ctrl,buble_mux_ctrl,r_i_sel_ctrl,rd_ctrl,wd_ctrl,wb_mux_ctrl,fwd_dm_ctrl,beq_and_in2, 
fwd_ctrl_a,fwd_ctrl_b,o_w_enable,o_alu_ctrl,o_r_i_sel_ctrl,o_rd_ctrl,o_wd_ctrl,o_wb_mux_ctrl,
o_fwd_dm_ctrl,o_beq_and_in2,o_fwd_ctrl_a,o_fwd_ctrl_b);

initial
begin
#100
buble_mux_ctrl = 1'b1;
w_enable = 1'b1;
alu_ctrl = 1'b1;
r_i_sel_ctrl = 1'b1;
rd_ctrl = 1'b1;
wd_ctrl = 1'b1;
wb_mux_ctrl = 1'b1;
fwd_dm_ctrl = 1'b1;
beq_and_in2 = 1'b1;
fwd_ctrl_a = 2'b10;
fwd_ctrl_b = 2'b10;


#100
buble_mux_ctrl = 1'b0;
w_enable = 1'b1;
alu_ctrl = 1'b1;
r_i_sel_ctrl = 1'b1;
rd_ctrl = 1'b1;
wd_ctrl = 1'b1;
wb_mux_ctrl = 1'b1;
fwd_dm_ctrl = 1'b1;
beq_and_in2 = 1'b1;
fwd_ctrl_a = 2'b10;
fwd_ctrl_b = 2'b10;

#100
buble_mux_ctrl = 1'bX;
w_enable = 1'b1;
alu_ctrl = 1'b1;
r_i_sel_ctrl = 1'b1;
rd_ctrl = 1'b1;
wd_ctrl = 1'b1;
wb_mux_ctrl = 1'b1;
fwd_dm_ctrl = 1'b1;
beq_and_in2 = 1'b1;
fwd_ctrl_a = 2'b10;
fwd_ctrl_b = 2'b10;

#100
buble_mux_ctrl = 1'b1;
w_enable = 1'bX;
alu_ctrl = 1'b1;
r_i_sel_ctrl = 1'bX;
rd_ctrl = 1'bX;
wd_ctrl = 1'b1;
wb_mux_ctrl = 1'b1;
fwd_dm_ctrl = 1'bX;
beq_and_in2 = 1'b1;
fwd_ctrl_a = 2'bXX;
fwd_ctrl_b = 2'b10;

#100
buble_mux_ctrl = 1'b0;
w_enable = 1'bX;
alu_ctrl = 1'b1;
r_i_sel_ctrl = 1'bX;
rd_ctrl = 1'bX;
wd_ctrl = 1'b1;
wb_mux_ctrl = 1'b1;
fwd_dm_ctrl = 1'bX;
beq_and_in2 = 1'b1;
fwd_ctrl_a = 2'bXX;
fwd_ctrl_b = 2'b10;
end
endmodule
