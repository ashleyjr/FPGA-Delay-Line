module x_uart_rx_syn_test (
   input    logic          i_clk,
   input    logic          i_rst,
   input    logic          i_in,
   output   logic          o_out
);

   logic       valid;
   logic [7:0] data;

   assign o_out = ^({valid, data});

   x_uart_rx u_rx(
      .i_clk      (i_clk   ),
      .i_rst      (i_rst   ),
      .i_rx       (i_in    ),
      .o_valid    (valid   ),    
      .o_data     (data    )
   );

endmodule

