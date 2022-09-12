module x_delay_line #(
   localparam p_dl_length = 128
)(
   input    logic i_clk,
   input    logic i_nrst,
   // Delay Line  
   input    logic i_dl,
   input    logic i_dl_en,
   // Data
   output   logic o_shift,
   input    logic i_shift_en
);

   logic [p_dl_length:0] dl;
   logic [p_dl_length:0] shift;

   assign dl[0]    = i_dl;
   assign shift[0] = 1'b0;
   assign o_shift  = shift[p_dl_length];

   generate
      for(genvar i=0;i<p_dl_length;i++) begin : DELAY_LINE
      
         x_delay_line_cell u_cell (
            .i_clk      (i_clk      ),
            .i_nrst     (i_nrst     ),
            // Delay Line
            .i_dl_en    (i_dl_en    ),
            .i_dl       (dl[i]      ),
            .o_dl       (dl[i+1]    ),
            // Shift data
            .i_shift_en (i_shift_en ),
            .i_shift    (shift[i]   ),
            .o_shift    (shift[i+1] )
         );
      
      end
   endgenerate

endmodule
