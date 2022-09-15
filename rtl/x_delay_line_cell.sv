module x_delay_line_cell #(
   localparam p_stgs = 4
)(
   input    logic i_clk,
   input    logic i_dl,
   output   logic o_dl,
   output   logic o_q
);

   logic [p_stgs-1:0] stgs;

   // - Force LUT during synth so logic is not optimised away
   // - 16 entry LUT hold 0 in [0], 1 in [1] 
   // - During SIM using neg edge flop so verilator works

   `ifdef SIM 
      always_ff@(negedge i_clk) begin
         o_dl <= i_dl;
      end
   `else

      SB_LUT4 #(
         .LUT_INIT   (16'h0002)
      ) u_buf (
         .O          (o_dl    ),
         .I0         (i_dl    ),
         .I1         (1'b0    ),
         .I2         (1'b0    ),
         .I3         (1'b0    )
      );  

   `endif

   // Create metastability resolver

   always_ff@(posedge i_clk) begin
      stgs <= {stgs[p_stgs-2:0], o_dl};
   end

   assign o_q = stgs[p_stgs-1]; 

endmodule
