`timescale 1ps/1fs
module x_mux_trigger_dual_tb;

reg            i_clk;
reg  [31:0]    i_data;
wire [31:0]    o_data;

x_mux_trigger_dual u_dut(
   .i_clk      (i_clk   ),
   .i_data     (i_data  ),
   .o_data     (o_data  )
);

initial begin
   $dumpfile("x_mux_trigger_dual_tb.vcd");
   $dumpvars(0,x_mux_trigger_dual_tb);
end

initial begin 
   i_clk = 0;
   forever begin
      // 96MHz
      #10417 i_clk = ~i_clk;
   end 
end

initial begin
   i_data  = 32'h00000000; 
   @(posedge i_clk); 
   @(posedge i_clk);
   @(posedge i_clk); 
   i_data  = 32'hCCCCCCCC;  
   @(posedge i_clk); 
   @(posedge i_clk); 
   @(posedge i_clk); 
   @(posedge i_clk); 
   $finish;
end



endmodule
