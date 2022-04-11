module TB_REG_STAGE2;
  wire [31:0] rs_data, rt_data;
  reg [4:0] rs_addr, rt_addr, wd_addr;
  reg [31:0] wd_data;
  reg r_enable, w_enable, clk;
  
  REGISTER_STAGE2 REG_TEST(rs_data, rt_data, rs_addr, rt_addr, wd_addr, wd_data, r_enable, w_enable, clk);
   
   initial
       begin
         clk = 1'b0;
         r_enable = 1'b0;
         w_enable = 1'b0;
       end
       
       always
       #50 clk = ~clk;
       
       initial
        begin
          #100 rs_addr   <= 5'd7;
               rt_addr   <= 5'd10;
               wd_addr   <= 5'd11;
               wd_data   <= 32'd3;
               r_enable  <= 1'b1;
               w_enable  <= 1'b1;
               
          #150 rs_addr   <= 5'd7;
               rt_addr   <= 5'd10;
               wd_addr   <= 5'd11;
               wd_data   <= 32'd3;
               r_enable  <= 1'b0;
               w_enable  <= 1'b1;
               
          #200 rs_addr   <= 5'd7;
               rt_addr   <= 5'd10;
               wd_addr   <= 5'd11;
               wd_data   <= 32'd3;
               r_enable  <= 1'b1;
               w_enable  <= 1'b0;
               
          #250 rs_addr   <= 5'd7;
               rt_addr   <= 5'd10;
               wd_addr   <= 5'd11;
               wd_data   <= 32'd3;
               r_enable  <= 1'b0;
               w_enable  <= 1'b0;
          
        end
  
endmodule
