module TEST_BENCH_IF;
  
  wire [31:0] instruction;
  reg [31:0] beq_address;
  reg pc_ctrl, pc_mux_ctrl, clk;
  
  IF_STAGE TB_IF(instruction, pc_4, beq_address, pc_ctrl, pc_mux_ctrl, clk);
    
    initial
      clk = 1;
    
    always
      #50 clk = ~clk;
      
    initial
      begin
        #100 beq_address = 2'bXXXX_XXXX_XXXX_XXXX_XXXX_XXXX_XXXX_XXXX;
            pc_ctrl = 1'bX;
            pc_mux_ctrl = 1'bX;
            
       #100 beq_address <= 2'd9;
           pc_ctrl <= 1'b1;
           pc_mux_ctrl <= 1'b1;
           
           $display ("beq_address(%1d)  =  pc_ctrl(%2d)",beq_address, pc_ctrl);
        
        
          #100 beq_address <= 2'd9;
              pc_ctrl <= 1'b1;
              pc_mux_ctrl <= 1'b1;
              
          #100 beq_address <= 2'd10;
              pc_ctrl <= 1'b0;
              pc_mux_ctrl <= 1'b0;
              
          #100 beq_address <= 2'd11;
              pc_ctrl <= 1'b0;
              pc_mux_ctrl <= 1'b1; 
                 
          #100 beq_address <= 2'd12;
              pc_ctrl <= 1'b1;
              pc_mux_ctrl <= 1'b0;
       
      
      end
  
endmodule
