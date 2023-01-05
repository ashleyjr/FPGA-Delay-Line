module x_mem (
   input    logic          i_rst,
   input    logic          i_clk, 
   input    logic          i_wen, 
   input    logic [7:0]    i_waddr,
   input    logic [15:0]   i_wdata, 
   input    logic          i_ren,
   input    logic [7:0]    i_raddr,
   output   logic [15:0]   o_rdata
);

`ifndef SIM

   SB_RAM40_4K #(
      .WRITE_MODE (32'sd0     ),
      .READ_MODE  (32'sd0     )
   ) u_mem (
      .MASK       (16'hxxxx   ),
      .RDATA      (o_rdata    ),
      .RADDR      (i_raddr    ),
      .RCLK       (i_clk      ),
      .RCLKE      (1'b1       ),
      .RE         (i_ren      ),
      .WADDR      (i_waddr    ),
      .WCLK       (i_clk      ),
      .WCLKE      (1'b1       ),
      .WDATA      (i_wdata    ),
      .WE         (i_wen      )
   );

`else

   logic [15:0] mem [255:0]; 
   
   always@(posedge i_clk or posedge i_rst) begin 
      if(i_rst)      o_rdata <= 16'hxxxx; 
      else begin
         if(i_ren)   o_rdata <= mem[i_raddr];
         else        o_rdata <= 16'hxxxx; 
      end
   end 
   
   always@(posedge i_clk) begin  
      if(i_wen) mem[i_waddr] <= i_wdata; 
   end

`endif

endmodule
