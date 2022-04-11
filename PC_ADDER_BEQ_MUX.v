module PC_ADDER_BEQ_MUX (
  pc_in,
  beq_address,
  pc_4,
  mux_sel_ctrl
  );
  
  input [31:0] beq_address;
  input [31:0] pc_4;
  input mux_sel_ctrl;
  output reg [31:0] pc_in;
  
  always @(*)
  
  begin
    if(mux_sel_ctrl)
      pc_in = beq_address;
    else
      pc_in = pc_4;
  end
  
endmodule
