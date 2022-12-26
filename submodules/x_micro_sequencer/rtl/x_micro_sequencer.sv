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

   assign o_busy = 1'd0;
   assign o_data = 36'd0;


   x_micro_sequencer_ram u_ram(
      
   );

endmodule


