module SB_DFF(
   input    wire  C,
   input    wire  D,
   output   reg   Q
);

   // Sim only
   initial Q = 0;

   always@(posedge C) begin
      Q <= D;
   end

endmodule
