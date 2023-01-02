module x_micro_scope_syn_test (
   input    logic          i_clk,
   input    logic          i_rst,
   input    logic          i_in,
   output   logic          o_out
);
   logic          busy;
   logic [31:0]   data;

   assign o_out = ^({data,busy});

   x_micro_scope u_scope (
      .i_clk      (i_clk      ),
      .i_rst      (i_rst      ), 
      .i_start    (i_in       ), 
      .o_busy     (busy       ),
      .i_data     ({32{i_in}} ),
      .i_ren      (i_in       ),
      .i_raddr    ({11{i_in}} ),
      .o_data     (data       )
   );

endmodule


