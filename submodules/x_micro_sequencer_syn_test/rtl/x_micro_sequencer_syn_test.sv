module x_micro_sequencer_syn_test (
   input    logic          i_clk,
   input    logic          i_rst,
   input    logic          i_in,
   output   logic          o_out
);

   logic          busy;
   logic [35:0]   data;

   assign o_out = ^({busy, data});

   x_micro_sequencer u_seq (
      .i_clk      (i_clk      ),
      .i_rst      (i_rst      ), 
      .i_start    (i_in       ), 
      .o_busy     (busy       ),
      .i_wen      (i_in       ),
      .i_wcmd     ({4{i_in}}  ),
      .i_wdata    ({36{i_in}} ),
      .i_waddr    ({9{i_in}}  ), 
      .o_data     (data       )
   );

endmodule


