module x_top_cal_clock_only (
   input    logic          i_clk,
   input    logic [7:0]    i_sel,
   output   logic          o_data
);

   x_delay_line u_dl(
      .i_clk   (i_clk   ),
      .i_dl    (i_clk   ),
      .i_sel   (i_sel   ),
      .o_data  (o_data  )
   );

endmodule
