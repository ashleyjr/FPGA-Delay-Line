module SB_LUT4#(
   parameter LUT_INIT = 16'h0000
)(
   input  wire  I3,
   input  wire  I2,
   input  wire  I1,
   input  wire  I0,
   output wire  O
);

   wire [3:0] index;

   assign index = {I3,I2,I1,I0};

   assign #700 O = LUT_INIT[index]; 

endmodule
