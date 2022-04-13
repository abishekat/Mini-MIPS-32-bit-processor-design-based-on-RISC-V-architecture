module PROGRAM_COUNTER(
  pc_out,
  pc_in,
  pc_ctrl,
  clk);
    
    input [31:0] pc_in;
    input pc_ctrl, clk;
    output reg [31:0] pc_out;
    
    initial
      begin
        pc_out = 32'b0;
        
      end
      
      always @(pc_in or pc_ctrl or clk)
        begin
          if(pc_ctrl)
            //@(posedge clk)
            pc_out = pc_in;
        end
    
endmodule
