module WB_MUX(
  wb_out,
  dm_wb_alu_out,
  dm_wb_data_out,
  wb_mux_ctrl
  );
  
  input [31:0] dm_wb_alu_out, dm_wb_data_out;
  input wb_mux_ctrl;
  output [31:0] wb_out;
  
  assign wb_out = wb_mux_ctrl ? dm_wb_alu_out : dm_wb_data_out;
  
endmodule
