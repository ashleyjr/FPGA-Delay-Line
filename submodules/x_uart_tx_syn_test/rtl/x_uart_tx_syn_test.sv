module x_uart_tx_syn_test (
   input    logic          i_clk,
   input    logic          i_rst,
   input    logic          i_in,
   output   logic          o_out
);

   logic       tx;
   logic       accept; 

   assign o_out = ^({tx, accept});

   x_uart_tx u_tx(
      .i_clk      (i_clk      ),
      .i_rst      (i_rst      ),
      .i_data     ({8{i_in}}  ),
      .o_tx       (tx         ),
      .i_valid    (i_in       ),
      .o_accept   (accept     )
   );

endmodule

