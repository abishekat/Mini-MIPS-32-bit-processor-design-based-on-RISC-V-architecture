module ALU_CONTROLLER(
  input [31:0] id_ex_inst,
  output reg [1:0] alu_op_ctrl,
  output reg beq_inst
  );
  
  always@(*)
  begin
    if(id_ex_inst[31:26]==6'b000000)
      begin
        if(id_ex_inst[5:0]==6'b000001)
          begin
            alu_op_ctrl = 2'b00;
            beq_inst = 1'b0;
          end
      end
  end
  
endmodule
