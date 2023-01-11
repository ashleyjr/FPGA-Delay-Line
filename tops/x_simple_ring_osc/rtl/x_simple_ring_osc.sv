module x_simple_ring_osc (
   input    logic    i_clk,
   input    logic    i_rst,
   input    logic    i_rx,
   output   logic    o_tx
);
 
   logic [31:0] ctrl;  
   logic [31:0] data;

   x_testbench u_testbench(
      .i_clk   (i_clk   ),
      .i_rst   (i_rst   ),
      .i_rx    (i_rx    ),
      .o_tx    (o_tx    ),
      .o_data  (ctrl    ),
      .i_data  (data    )
   );


   assign data[0] = ~data[0] & ctrl[0];

endmodule

