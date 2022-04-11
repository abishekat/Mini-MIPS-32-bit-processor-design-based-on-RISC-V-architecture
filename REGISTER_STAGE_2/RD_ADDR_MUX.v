module RD_ADDR_MUX (
  rd_out_addr,
  rt,
  rd,
  rd_addr_ctrl,
  rd_enable_ctrl
  );
  
  input rd_addr_ctrl, rd_enable_ctrl;
  input [4:0] rt, rd;
  output reg [4:0]rd_out_addr;
  
  always @ (*)
    begin
      if(rd_enable_ctrl)
        begin
          if(rd_addr_ctrl)
            rd_out_addr = rd;
          else
            rd_out_addr = rt;
        end
      else
        rd_out_addr = 5'bXXXXX;
    end
  
  
endmodule
