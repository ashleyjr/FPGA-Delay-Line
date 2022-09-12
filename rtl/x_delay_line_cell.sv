module x_delay_line_cell(
   input    logic i_clk,
   input    logic i_nrst,
   // Delay Line  
   input    logic i_dl_en,
   input    logic i_dl,
   output   logic o_dl,
   // Shift Data
   input    logic i_shift_en,
   input    logic i_shift,
   output   logic o_shift
);

   logic p0;
   logic p1;
   logic p2;
   logic p3;
   logic p4;

   logic en;

   // - Force LUT during synth so logic is not optimised away
   // - Two inverters back-to-back
   // - During SIM using neg edge flop so verilator works

   `ifdef SIM 
      always_ff@(negedge i_clk or negedge i_nrst) begin
         if(!i_nrst) o_dl <= 'd0;
         else        o_dl <= i_dl;
      end
   `else
      logic dl;

      SB_LUT4 #(
         .LUT_INIT   (16'd2)
      ) inv_0  (
         .O          (dl   ),
         .I0         (i_dl ),
         .I1         (1'b0 ),
         .I2         (1'b0 ),
         .I3         (1'b0 )
      );
      SB_LUT4 #(
         .LUT_INIT   (16'd2)
      ) inv_1  (
         .O          (o_dl ),
         .I0         (dl   ),
         .I1         (1'b0 ),
         .I2         (1'b0 ),
         .I3         (1'b0 )
      );
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

   // After metastability is resolved created shift register
   // to read out data
   
   assign p3 = (i_shift_en) ? i_shift : p2;

   assign en = i_dl_en | i_shift_en;

   always_ff@(posedge i_clk or negedge i_nrst) begin
      if(!i_nrst)    p4 <= 'd0;
      else if(en)    p4 <= p3;
   end
   
   assign o_shift = p4;

endmodule
