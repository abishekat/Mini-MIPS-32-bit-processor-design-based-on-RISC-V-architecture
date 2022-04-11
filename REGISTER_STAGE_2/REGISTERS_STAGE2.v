module REGISTER_STAGE2(
  rs_data,
  rt_data,
  rs_addr,
  rt_addr,
  wd_addr,
  wd_data,
  r_enable,
  w_enable,
  clk
  );
  
  input [4:0] rs_addr, rt_addr, wd_addr;
  input [31:0] wd_data;
  input r_enable, w_enable, clk;
  output reg [31:0] rs_data, rt_data;
  
  reg [31:0] reg_file [0:31];
  
  initial
    begin
      reg_file[0] = 32'd0;
      reg_file[1] = 32'd1;
      reg_file[2] = 32'd2;
      reg_file[3] = 32'd3;
      reg_file[4] = 32'd4;
      reg_file[5] = 32'd5;
      reg_file[6] = 32'd6;
      reg_file[7] = 32'd7;
      reg_file[8] = 32'd8;
      reg_file[9] = 32'd9;
      reg_file[10] = 32'd10;
      reg_file[11] = 32'd11;
      reg_file[12] = 32'd12;
    end
  
  always @ (rs_addr or rt_addr or r_enable)
    begin
      if(r_enable)
        begin
          rs_data = reg_file[rs_addr];
          rt_data = reg_file[rt_addr];
        end
    end
    
  always @(negedge clk)
    begin
      if(w_enable)
          begin
            case(wd_addr)
              
              5'd0  : reg_file[0]   <= wd_data;
              5'd1  : reg_file[1]   <= wd_data;
              5'd2  : reg_file[2]   <= wd_data;
              5'd3  : reg_file[3]   <= wd_data;
              5'd4  : reg_file[4]   <= wd_data;
              5'd5  : reg_file[5]   <= wd_data;
              5'd6  : reg_file[6]   <= wd_data;
              5'd7  : reg_file[7]   <= wd_data;
              5'd8  : reg_file[8]   <= wd_data;
              5'd9  : reg_file[9]   <= wd_data;
              5'd10 : reg_file[10]  <= wd_data;
              5'd11 : reg_file[11]  <= wd_data;
              5'd12 : reg_file[12]  <= wd_data;
              5'd13 : reg_file[13]  <= wd_data;
              5'd14 : reg_file[14]  <= wd_data;
              5'd15 : reg_file[15]  <= wd_data;
              5'd16 : reg_file[16]  <= wd_data;
              5'd17 : reg_file[17]  <= wd_data;
              5'd18 : reg_file[18]  <= wd_data;
              5'd19 : reg_file[19]  <= wd_data;
              5'd20 : reg_file[20]  <= wd_data;
              5'd21 : reg_file[21]  <= wd_data;
              5'd22 : reg_file[22]  <= wd_data;
              5'd23 : reg_file[23]  <= wd_data;
              5'd24 : reg_file[24]  <= wd_data;
              5'd25 : reg_file[25]  <= wd_data;
              5'd26 : reg_file[26]  <= wd_data;
              5'd27 : reg_file[27]  <= wd_data;
              5'd28 : reg_file[28]  <= wd_data;
              5'd29 : reg_file[29]  <= wd_data;
              5'd30 : reg_file[30]  <= wd_data;
              5'd31 : reg_file[31]  <= wd_data;
              
              default : $display("invalid wd_addr");
            endcase
          end
    end
  
endmodule
