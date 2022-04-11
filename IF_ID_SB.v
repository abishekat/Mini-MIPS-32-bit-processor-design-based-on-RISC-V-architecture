module IF_ID_SB(
  pc_4_in,
  ins_in,
  if_id_reg_ctrl,
  clk,
  if_id_ins_out,
  if_id_pc_4_out
  );
  
  input [31:0] pc_4_in, ins_in;
  input if_id_reg_ctrl, clk;
  output reg [31:0] if_id_ins_out;
  output reg [31:0] if_id_pc_4_out;
  
  always@(posedge clk)
    begin
      if(if_id_reg_ctrl)
        begin
          if_id_ins_out = ins_in;
          if_id_pc_4_out = pc_4_in;
        end
    end
  
endmodule
