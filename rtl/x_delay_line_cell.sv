module x_delay_line_cell(
   input    logic i_clk,
   input    logic i_nrst,
   // Delay Line  
   input    logic i_dl,
   output   logic o_dl,
   // Data
   output   logic o_q
);

   logic p0;
   logic p1;
   logic p2;

   // Force LUT during synth so logic is not optimised away
   
   `ifdef SYNTH
      
      SB_LUT4 #(
         .LUT_INIT   (16'd2)
      ) buffers  (
         .O          (o_dl ),
         .I0         (i_dl ),
         .I1         (1'b0 ),
         .I2         (1'b0 ),
         .I3         (1'b0 )
      );

   `else

      assign o_dl = ~i_dl;

   `endif


   // Create metastability resolver

   assign p0 = o_dl;

   always_ff@(posedge i_clk or negedge i_nrst) begin
      if(!i_nrst) p1 <= 'd0;
      else        p1 <= p0;
   end
   
   always_ff@(posedge i_clk or negedge i_nrst) begin
      if(!i_nrst) p2 <= 'd0;
      else        p2 <= p1;
   end

   assign o_q = p2;

endmodule
