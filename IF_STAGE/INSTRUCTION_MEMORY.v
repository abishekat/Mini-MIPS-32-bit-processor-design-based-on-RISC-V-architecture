module INSTRUCTION_MEMORY(
  ins_out,
  ins_address
  );
  
  input [31:0] ins_address;
  output reg [31:0] ins_out;
  
  reg [31:0] ins_memory_bank [0:63];
  
  initial
    begin
      ins_memory_bank[0] = 32'b000000_00001_00010_00011_00000_000001; // add instruction: R3 <- R2+R1;
    end
endmodule
