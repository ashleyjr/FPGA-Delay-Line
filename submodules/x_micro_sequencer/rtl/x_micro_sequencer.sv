module x_micro_sequencer (
   input    logic          i_clk,
   input    logic          i_rst,
   input    logic          i_start,
   output   logic          o_busy,
   input    logic          i_wen,
   input    logic [3:0]    i_wcmd,  
   input    logic [35:0]   i_wdata,
   input    logic [8:0]    i_waddr, 
   output   logic [35:0]   o_data
);

   logic [8:0]    raddr;
   logic [35:0]   rdata;
   logic [3:0]    rcmd;

   assign o_busy = 1'd0;
   assign raddr  = i_waddr;

   assign o_data = rdata | rcmd;

   x_micro_sequencer_ram u_ram(
      .i_clk      (i_clk            ),
      .i_rst      (i_rst            ), 
      .i_wen      (i_wen            ), 
      .i_waddr    (i_waddr          ),
      .i_wdata    ({i_wdata, i_wcmd}),
      .i_raddr    (raddr            ),
      .o_rdata    ({rdata, rcmd}    )
   );

endmodule


