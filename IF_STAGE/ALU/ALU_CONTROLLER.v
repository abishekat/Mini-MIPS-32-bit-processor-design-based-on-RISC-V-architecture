module ALU_CONTROLLER(
  input [31:0] id_ex_inst,
  output reg [3:0] alu_op_ctrl,
  output reg beq_inst
  );
  
  always@(*)
  begin
  if(id_ex_inst[31:26]==6'b000000)
  begin
      if(id_ex_inst[5:0]==6'b000010)  ////SLL
          begin
              alu_op_ctrl = 4'd1;
              beq_inst = 1'b0;
          end
      else if(id_ex_inst[5:0]==6'b000100)  ///XNOR
          begin
              alu_op_ctrl = 4'd2;
              beq_inst = 1'b0;
          end
      else if(id_ex_inst[5:0]==6'b000101)    ////NAND
          begin
              alu_op_ctrl = 4'd3;
              beq_inst = 1'b0;
          end
      else
      $display("INVALID INSTRUCTION");
  end
  else if(id_ex_inst[31:26]==6'b000001)  ///ORI
      begin
          alu_op_ctrl = 4'd0;
          beq_inst = 1'b0;
      end
  else if(id_ex_inst[31:26]==6'b000110)  ///SUBI
      begin
          alu_op_ctrl = 4'd4;
          beq_inst = 1'b0;
      end
  else if(id_ex_inst[31:26]==6'b000111)  ///ADDUI
      begin
          alu_op_ctrl = 4'd5;
          beq_inst = 1'b0;
      end
  else if(id_ex_inst[31:26]==6'b001000)  ///LH
      begin
          alu_op_ctrl = 4'd5;
          beq_inst = 1'b0;
      end
  else if(id_ex_inst[31:26]==6'b001001)  ///SB
      begin
          alu_op_ctrl = 4'd5;
          beq_inst = 1'b0;
      end
  else if(id_ex_inst[31:26]==6'b001000)  ///BNE
      begin
          alu_op_ctrl = 4'd4;
          beq_inst = 1'b1;
      end
                              // else if(id_ex_inst[31:26]==6'b001010)  ///JR
                              //     begin
                              //         alu_op_ctrl = 4'd5;
                              //     end
                              // else if(id_ex_inst[31:26]==6'b000010)  ///J
                              //     begin
                              //         alu_op_ctrl = 4'd5;
                              //     end
  else
      $display("INVALID INSTRUCTION");
  end
  
endmodule
