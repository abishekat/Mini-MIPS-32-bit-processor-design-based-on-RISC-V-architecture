module INSTRUCTION_MEMORY(
  ins_out,
  ins_address
  );
  
  input [31:0] ins_address;
  output reg [31:0] ins_out;
  
  reg [31:0] ins_memory_bank [0:63];
  
  initial
    begin
      ins_memory_bank[0]  = 32'b001101_00100_00010_00001_00000_000001; // ORI  R1 <- R2 + 4;
      ins_memory_bank[4]  = 32'b000000_00011_00011_00010_00000_000010; // SLL  R2 <- R3 << 3;
      ins_memory_bank[8]  = 32'b100111_00101_00110_00100_00000_000100; // XNOR R4 <- ~(R5 ^ R6);
      ins_memory_bank[12] = 32'b100100_01001_01000_00111_00000_000101; // NAND R7 <- ~ (R8 & R9);
      ins_memory_bank[14] = 32'b100010_00100_01011_01010_00000_000110; // SUBI R10 <- R11 - 4;
      ins_memory_bank[18] = 32'b001001_00111_01101_01100_00000_000111; //ADDUI R12 <- R13 +7;
      ins_memory_bank[22] = 32'b000101_00101_01111_01110_00000_001000; //BNE (R14!=R15) ADDR = PC+4+5; R14 R15 5
      ins_memory_bank[24] = 32'b100001_00001_10001_10000_00000_001010; //LH R16. R17(2);
      ins_memory_bank[28] = 32'b101000_00001_10011_10010_00000_001010; //SB R18, R19(2);
      ins_memory_bank[32] = 32'b001000_00000_00000_00000_00000_001010; //JR 10
      ins_memory_bank[36] = 32'b000010_00000_00000_00000_00000_000010; // J 2
    end
endmodule
