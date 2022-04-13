module BEQ_MODULE(
  input beq_in_1, beq_in,
  output mux_sel_ctrl
  );

  assign mux_sel_ctrl = beq_in_1 & beq_in;

endmodule