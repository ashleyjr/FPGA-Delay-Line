module x_byte_des_syn_test (
   input    logic          i_clk,
   input    logic          i_rst,
   input    logic          i_in0,
   input    logic          i_in1,
   input    logic          i_in2,
   input    logic          i_in3,
   input    logic          i_in4,
   input    logic          i_in5,
   input    logic          i_in6,
   input    logic          i_in7,
   input    logic          i_in8,
   output   logic          o_out
);
   logic [7:0]    cmd;
   logic [63:0]   data; 

   assign cmd = { i_in1, 
                  i_in2, 
                  i_in3,
                  i_in4,
                  i_in5,
                  i_in6,
                  i_in7,
                  i_in8 };

   assign o_out = ^data;

   x_byte_des u_tx(
      .i_clk      (i_clk      ),
      .i_rst      (i_rst      ),
      .i_valid    (i_in0      ),
      .i_cmd      (cmd        ),
      .o_data     (data       )
   );

endmodule

