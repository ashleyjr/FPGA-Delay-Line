module x_micro_scope (
   input    logic          i_clk,
   input    logic          i_rst,
   input    logic          i_start,
   output   logic          o_busy,
   input    logic [31:0]   i_data,
   input    logic          i_ren,  
   input    logic [10:0]   i_raddr, 
   output   logic [31:0]   o_data
);

   logic          waddr_en;
   logic [10:0]   waddr_d;
   logic [10:0]   waddr_q;

   logic [31:0]   rdata_d;
   logic [31:0]   rdata_q;
   logic          ren_d;
   logic          ren_q;
   
   // Drive busy logic   
   assign o_busy = (waddr_q > 'd0);

   // Write Address Counter
   // - Power of 2 so rely on wrap on 11'h7FF
   assign waddr_d  = waddr_q + 'd1;
   assign waddr_en = i_start | o_busy;

   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)         waddr_q <= 'd0;
      else if(waddr_en) waddr_q <= waddr_d;
   end
 
   // RAM 
   assign ren_d = i_ren & ~o_busy;

   x_micro_scope_ram u_ram(
      .i_clk      (i_clk      ),
      .i_rst      (i_rst      ), 
      .i_wen      (waddr_en   ), 
      .i_waddr    (waddr_q    ),
      .i_wdata    (i_data     ),
      .i_ren      (ren_d      ),
      .i_raddr    (i_raddr    ),
      .o_rdata    (rdata_d    )
   );

   // Hold data on output
    
   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)   ren_q <= 'd0;
      else        ren_q <= ren_d;
   end

   assign o_data = (ren_q) ? rdata_d : rdata_q;

   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)      rdata_q <= 'd0;
      else if(ren_q) rdata_q <= rdata_d;
   end
 
endmodule


