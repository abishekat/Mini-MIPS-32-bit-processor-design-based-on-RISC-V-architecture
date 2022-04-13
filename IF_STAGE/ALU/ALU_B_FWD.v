module ALU_B_FWD (
  output reg [31:0] alu_ip_2, 
  input [31:0] rt_sign_ext_in, ex_dm_alu_out,dm_wb_mux_out,
  input [1:0] fwd_ctrl_b
  );
  
  always @(*)
  begin
    case(fwd_ctrl_b)
      2'd0 : alu_ip_2 = ex_dm_alu_out;
      2'd1 : alu_ip_2 = dm_wb_mux_out;
      2'd2 : alu_ip_2 = rt_sign_ext_in;
      default : $display("invalid FWD of ALU_B control input");
    endcase
  end
  
endmodule
