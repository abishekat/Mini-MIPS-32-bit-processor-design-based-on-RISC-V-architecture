module R_IN_MUX_SEL(
  output reg [31:0] rt_sign_ext_out,
  input [31:0] rt_in, sign_ext_addr,
  input r_i_sel_ctrl
  );
  
  always@(*)
  begin
    if(r_i_sel_ctrl)
        rt_sign_ext_out = sign_ext_addr;
    else
      rt_sign_ext_out = rt_in;
  end
  
endmodule

