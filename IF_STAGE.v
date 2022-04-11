module IF_STAGE(
  instruction,
  pc_4,
  beq_address,
  pc_ctrl,
  pc_mux_ctrl,
  clk
  );
  
  input [31:0] beq_address;
  input pc_ctrl, pc_mux_ctrl, clk;
  output [31:0] instruction, pc_4; 
  
  wire [31:0] w1_mux_pc, w2_pc_mem, w3_mux_pc4;
  
  PROGRAM_COUNTER PC(w2_pc_mem, w1_mux_pc, pc_mux_ctrl, clk);
  
  PC_ADDER_BEQ_MUX PC_MUX(w1_mux_pc, beq_address, w3_mux_pc4, pc_mux_ctrl);
  
  PC_ADDER_4 PC_ADD_4(w3_mux_pc4, w2_pc_mem);
  
  INSTRUCTION_MEMORY IM(instruction, w2_pc_mem);
  
  assign pc_4 = w3_mux_pc4;
  
endmodule
