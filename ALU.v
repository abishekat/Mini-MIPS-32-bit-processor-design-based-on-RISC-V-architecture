module ALU(output reg signed [31:0] alu_out,
 output reg beq_and_in1, 
 input signed [31:0] alu_ip1,alu_ip2, 
 input [4:0] alu_op_ctrl, 
 input alu_control,beq_inst);

/* alu control signals : 0000 - OR
                       : 0001 - SHIFT
                       : 0010 - XNOR
                       : 0011 - NAND
                       : 0100 - SUB
                       : 0101 - ADD
                       : 0110 - NOT EQUAL*/
always @(*)
begin
  if(alu_control)
    begin
case(alu_op_ctrl)
  2'd0 : alu_out =  alu_ip1 | alu_ip2;
  2'd1 : alu_out =  alu_ip1 << alu_ip2;
  2'd2 : alu_out =  ~(alu_ip1 ^ alu_ip2);
  2'd3 : alu_out =  ~(alu_ip1 & alu_ip2);
  2'd4 : alu_out =  alu_ip1 - alu_ip2;
  2'd5 : alu_out =  alu_ip1 + alu_ip2;
  default: $display("INVALID INSTRUCTION");
endcase					   
end
 
else
   alu_out = 32'bX;
end

always@(alu_out,beq_inst)
begin
if(beq_inst)
begin
if(alu_out==0)
beq_and_in1 = 1'b1;
else
beq_and_in1 = 1'b0;
end
else
beq_and_in1 = 1'b0;
end
endmodule