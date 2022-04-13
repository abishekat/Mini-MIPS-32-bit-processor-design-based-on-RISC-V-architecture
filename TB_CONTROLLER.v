module TB_CONTROLLER();

reg[31:0] if_id_inst, id_ex_inst, ex_dm_inst;
reg [4:0] id_ex_wb_adr, ex_dm_wb_adr; 
wire r_enable,w_enable,alu_control,bobule_mux_control,if_id_reg_control,pcw_control,rd_adr_control,rd_enable_control,r_i_sel_control,rd_control,
wd_control,wb_mux_control,fwd_dm_control,beq_and_in2;
wire [1:0] fwd_control_a,fwd_control_b;

controller1 C1(if_id_inst, id_ex_inst, ex_dm_inst,id_ex_wb_adr, ex_dm_wb_adr,r_enable,w_enable,alu_control,bobule_mux_control,if_id_reg_control,pcw_control,
rd_adr_control,rd_enable_control,r_i_sel_control,rd_control,wd_control,wb_mux_control,fwd_dm_control,beq_and_in2,fwd_control_a,fwd_control_b);

initial
begin


#100
if_id_inst = 32'b001001_01010_01011_00000_00000_000101; // beq R10 R11 5; if(R11==R10) than adr= pc+4+5;
id_ex_inst = 32'b000110_01010_01010_00000_00000_000101; // andi R10 R10 5; R3 <- R10 & 5;
ex_dm_inst = 32'b000000_01001_01000_01011_00000_000011; // and R9 R8 R11; R4 <- R9&R8;
id_ex_wb_adr = 5'b01010;
ex_dm_wb_adr = 5'b01011;
end
endmodule

