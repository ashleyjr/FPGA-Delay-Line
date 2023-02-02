module x_mux_trigger_dual_32 (
   input    logic    i_clk,
   input    logic    i_rst,
   input    logic    i_rx,
   output   logic    o_tx
);
 
   logic        clk;
   logic [31:0] ctrl; 
   logic [31:0] data;

   // 12MHz > 96MHz
   SB_PLL40_CORE #(
      .FEEDBACK_PATH ("SIMPLE"   ),
      .PLLOUT_SELECT ("GENCLK"   ),
      .DIVR          (4'd0       ),
      .DIVF          (7'd63      ),
      .DIVQ          (3'd3       ),
      .FILTER_RANGE  (3'b001     )
   ) u_sb_pll40_core (
      .LOCK          (           ),
      .RESETB        (~i_rst     ),
      .BYPASS        (1'b0       ),
      .REFERENCECLK  (i_clk      ),
      .PLLOUTCORE    (clk        )
   );

   x_testbench #(
      .p_clk_hz   (96000000)
   ) u_testbench (
      .i_clk      (clk     ),
      .i_rst      (i_rst   ),
      .i_rx       (i_rx    ),
      .o_tx       (o_tx    ),
      .o_data     (ctrl    ),
      .i_data     (data    )
   );
  
   x_mux_trigger_dual u_mt(
      .i_clk   (clk     ),
      .i_data  (ctrl    ),
      .o_data  (data    )
   );

endmodule

