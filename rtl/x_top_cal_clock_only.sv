module x_top_cal_clock_only (
   input    logic       i_clk,
   input    logic       i_nrst,
   input    logic       i_uart_rx,
   output   logic       o_uart_tx
);
   logic [255:0]  data;

   x_delay_line u_dl(
      .i_clk      (i_clk      ),
      .i_dl       (i_clk      ),
      .o_data     (data       )
   );

   x_uart  #(
      .p_length   (256        ),
      .p_clk_hz   (12000000   ),
      .p_baud     (115200     )
   ) u_uart (
      .i_clk      (i_clk      ),
      .i_nrst     (i_nrst     ),
      .i_data     (data       ),
      .i_uart_rx  (i_uart_rx  ),
      .o_uart_tx  (o_uart_tx  )
   );

endmodule
