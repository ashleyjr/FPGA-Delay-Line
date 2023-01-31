module SB_DFF(
   input    wire  C,
   input    wire  D,
   output   reg   Q
);

   always@(posedge C) begin
      Q <= D;
   end

endmodule
