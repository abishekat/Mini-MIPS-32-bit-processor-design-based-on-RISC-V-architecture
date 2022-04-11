module PC_ADDER_4(
  pc_out_4,
  pc_out);
  
  input [31:0] pc_out;
  output [31:0] pc_out_4;
  
  assign pc_out_4 = pc_out + 4;
  
endmodule
