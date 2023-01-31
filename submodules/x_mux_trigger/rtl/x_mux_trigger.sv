`timescale 1ps/1fs
module x_mux_trigger (
   input    wire                         i_clk,
   input    wire [32-1:0]          i_data,
   output   wire [32-1:0]          o_data
);

wire [32:0]   p0_dl;
wire [32-1:0] p1_dl;
wire [32-1:0] p2_dl;

wire [32-1:0] mux_a;
wire [32-1:0] mux_b;
wire [32-1:0] mux_s;
wire [32-1:0] mux_y;

// Mux tree
// s   A(S) B(~S) 
// I2  I1   I0    | O
//  0   0    0    | 0
//  0   0    1    | 1  (1)
//  0   1    0    | 0
//  0   1    1    | 1  (3)
//  1   0    0    | 0
//  1   0    1    | 0
//  1   1    0    | 1  (6)
//  1   1    1    | 1  (7)
//
//  0000_0000_1100_1010
//  0    0    C    A

   (* BEL="X12/Y5/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'h00CA         )
   ) u_mux_lut0 (
      .I3      (1'b0             ),
      .I2      (mux_s[1]     ),
      .I1      (mux_y[1]     ),
      .I0      (i_data[1]    ),
      .O       (mux_y[0]       )
   );
   (* BEL="X12/Y5/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'h00CA         )
   ) u_mux_lut1 (
      .I3      (1'b0             ),
      .I2      (mux_s[2]     ),
      .I1      (mux_y[2]     ),
      .I0      (i_data[2]    ),
      .O       (mux_y[1]       )
   );
   (* BEL="X12/Y5/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'h00CA         )
   ) u_mux_lut2 (
      .I3      (1'b0             ),
      .I2      (mux_s[3]     ),
      .I1      (mux_y[3]     ),
      .I0      (i_data[3]    ),
      .O       (mux_y[2]       )
   );
   (* BEL="X12/Y5/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'h00CA         )
   ) u_mux_lut3 (
      .I3      (1'b0             ),
      .I2      (mux_s[4]     ),
      .I1      (mux_y[4]     ),
      .I0      (i_data[4]    ),
      .O       (mux_y[3]       )
   );
   (* BEL="X12/Y5/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'h00CA         )
   ) u_mux_lut4 (
      .I3      (1'b0             ),
      .I2      (mux_s[5]     ),
      .I1      (mux_y[5]     ),
      .I0      (i_data[5]    ),
      .O       (mux_y[4]       )
   );
   (* BEL="X12/Y5/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'h00CA         )
   ) u_mux_lut5 (
      .I3      (1'b0             ),
      .I2      (mux_s[6]     ),
      .I1      (mux_y[6]     ),
      .I0      (i_data[6]    ),
      .O       (mux_y[5]       )
   );
   (* BEL="X12/Y5/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'h00CA         )
   ) u_mux_lut6 (
      .I3      (1'b0             ),
      .I2      (mux_s[7]     ),
      .I1      (mux_y[7]     ),
      .I0      (i_data[7]    ),
      .O       (mux_y[6]       )
   );
   (* BEL="X12/Y5/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'h00CA         )
   ) u_mux_lut7 (
      .I3      (1'b0             ),
      .I2      (mux_s[8]     ),
      .I1      (mux_y[8]     ),
      .I0      (i_data[8]    ),
      .O       (mux_y[7]       )
   );
   (* BEL="X12/Y6/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'h00CA         )
   ) u_mux_lut8 (
      .I3      (1'b0             ),
      .I2      (mux_s[9]     ),
      .I1      (mux_y[9]     ),
      .I0      (i_data[9]    ),
      .O       (mux_y[8]       )
   );
   (* BEL="X12/Y6/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'h00CA         )
   ) u_mux_lut9 (
      .I3      (1'b0             ),
      .I2      (mux_s[10]     ),
      .I1      (mux_y[10]     ),
      .I0      (i_data[10]    ),
      .O       (mux_y[9]       )
   );
   (* BEL="X12/Y6/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'h00CA         )
   ) u_mux_lut10 (
      .I3      (1'b0             ),
      .I2      (mux_s[11]     ),
      .I1      (mux_y[11]     ),
      .I0      (i_data[11]    ),
      .O       (mux_y[10]       )
   );
   (* BEL="X12/Y6/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'h00CA         )
   ) u_mux_lut11 (
      .I3      (1'b0             ),
      .I2      (mux_s[12]     ),
      .I1      (mux_y[12]     ),
      .I0      (i_data[12]    ),
      .O       (mux_y[11]       )
   );
   (* BEL="X12/Y6/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'h00CA         )
   ) u_mux_lut12 (
      .I3      (1'b0             ),
      .I2      (mux_s[13]     ),
      .I1      (mux_y[13]     ),
      .I0      (i_data[13]    ),
      .O       (mux_y[12]       )
   );
   (* BEL="X12/Y6/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'h00CA         )
   ) u_mux_lut13 (
      .I3      (1'b0             ),
      .I2      (mux_s[14]     ),
      .I1      (mux_y[14]     ),
      .I0      (i_data[14]    ),
      .O       (mux_y[13]       )
   );
   (* BEL="X12/Y6/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'h00CA         )
   ) u_mux_lut14 (
      .I3      (1'b0             ),
      .I2      (mux_s[15]     ),
      .I1      (mux_y[15]     ),
      .I0      (i_data[15]    ),
      .O       (mux_y[14]       )
   );
   (* BEL="X12/Y6/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'h00CA         )
   ) u_mux_lut15 (
      .I3      (1'b0             ),
      .I2      (mux_s[16]     ),
      .I1      (mux_y[16]     ),
      .I0      (i_data[16]    ),
      .O       (mux_y[15]       )
   );
   (* BEL="X12/Y7/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'h00CA         )
   ) u_mux_lut16 (
      .I3      (1'b0             ),
      .I2      (mux_s[17]     ),
      .I1      (mux_y[17]     ),
      .I0      (i_data[17]    ),
      .O       (mux_y[16]       )
   );
   (* BEL="X12/Y7/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'h00CA         )
   ) u_mux_lut17 (
      .I3      (1'b0             ),
      .I2      (mux_s[18]     ),
      .I1      (mux_y[18]     ),
      .I0      (i_data[18]    ),
      .O       (mux_y[17]       )
   );
   (* BEL="X12/Y7/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'h00CA         )
   ) u_mux_lut18 (
      .I3      (1'b0             ),
      .I2      (mux_s[19]     ),
      .I1      (mux_y[19]     ),
      .I0      (i_data[19]    ),
      .O       (mux_y[18]       )
   );
   (* BEL="X12/Y7/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'h00CA         )
   ) u_mux_lut19 (
      .I3      (1'b0             ),
      .I2      (mux_s[20]     ),
      .I1      (mux_y[20]     ),
      .I0      (i_data[20]    ),
      .O       (mux_y[19]       )
   );
   (* BEL="X12/Y7/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'h00CA         )
   ) u_mux_lut20 (
      .I3      (1'b0             ),
      .I2      (mux_s[21]     ),
      .I1      (mux_y[21]     ),
      .I0      (i_data[21]    ),
      .O       (mux_y[20]       )
   );
   (* BEL="X12/Y7/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'h00CA         )
   ) u_mux_lut21 (
      .I3      (1'b0             ),
      .I2      (mux_s[22]     ),
      .I1      (mux_y[22]     ),
      .I0      (i_data[22]    ),
      .O       (mux_y[21]       )
   );
   (* BEL="X12/Y7/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'h00CA         )
   ) u_mux_lut22 (
      .I3      (1'b0             ),
      .I2      (mux_s[23]     ),
      .I1      (mux_y[23]     ),
      .I0      (i_data[23]    ),
      .O       (mux_y[22]       )
   );
   (* BEL="X12/Y7/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'h00CA         )
   ) u_mux_lut23 (
      .I3      (1'b0             ),
      .I2      (mux_s[24]     ),
      .I1      (mux_y[24]     ),
      .I0      (i_data[24]    ),
      .O       (mux_y[23]       )
   );
   (* BEL="X12/Y8/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'h00CA         )
   ) u_mux_lut24 (
      .I3      (1'b0             ),
      .I2      (mux_s[25]     ),
      .I1      (mux_y[25]     ),
      .I0      (i_data[25]    ),
      .O       (mux_y[24]       )
   );
   (* BEL="X12/Y8/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'h00CA         )
   ) u_mux_lut25 (
      .I3      (1'b0             ),
      .I2      (mux_s[26]     ),
      .I1      (mux_y[26]     ),
      .I0      (i_data[26]    ),
      .O       (mux_y[25]       )
   );
   (* BEL="X12/Y8/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'h00CA         )
   ) u_mux_lut26 (
      .I3      (1'b0             ),
      .I2      (mux_s[27]     ),
      .I1      (mux_y[27]     ),
      .I0      (i_data[27]    ),
      .O       (mux_y[26]       )
   );
   (* BEL="X12/Y8/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'h00CA         )
   ) u_mux_lut27 (
      .I3      (1'b0             ),
      .I2      (mux_s[28]     ),
      .I1      (mux_y[28]     ),
      .I0      (i_data[28]    ),
      .O       (mux_y[27]       )
   );
   (* BEL="X12/Y8/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'h00CA         )
   ) u_mux_lut28 (
      .I3      (1'b0             ),
      .I2      (mux_s[29]     ),
      .I1      (mux_y[29]     ),
      .I0      (i_data[29]    ),
      .O       (mux_y[28]       )
   );
   (* BEL="X12/Y8/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'h00CA         )
   ) u_mux_lut29 (
      .I3      (1'b0             ),
      .I2      (mux_s[30]     ),
      .I1      (mux_y[30]     ),
      .I0      (i_data[30]    ),
      .O       (mux_y[29]       )
   );
   (* BEL="X12/Y8/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'h00CA         )
   ) u_mux_lut30 (
      .I3      (1'b0             ),
      .I2      (mux_s[31]     ),
      .I1      (mux_y[31]     ),
      .I0      (i_data[31]    ),
      .O       (mux_y[30]       )
   );

assign mux_y[31] = 1'b0;

// Trigger line

assign mux_s[0] = i_data[0];

   (* BEL="X11/Y5/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_trigger_lut0 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (mux_s[0]    ),
      .O       (mux_s[1]  )
   );
   (* BEL="X11/Y5/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_trigger_lut1 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (mux_s[1]    ),
      .O       (mux_s[2]  )
   );
   (* BEL="X11/Y5/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_trigger_lut2 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (mux_s[2]    ),
      .O       (mux_s[3]  )
   );
   (* BEL="X11/Y5/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_trigger_lut3 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (mux_s[3]    ),
      .O       (mux_s[4]  )
   );
   (* BEL="X11/Y5/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_trigger_lut4 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (mux_s[4]    ),
      .O       (mux_s[5]  )
   );
   (* BEL="X11/Y5/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_trigger_lut5 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (mux_s[5]    ),
      .O       (mux_s[6]  )
   );
   (* BEL="X11/Y5/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_trigger_lut6 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (mux_s[6]    ),
      .O       (mux_s[7]  )
   );
   (* BEL="X11/Y5/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_trigger_lut7 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (mux_s[7]    ),
      .O       (mux_s[8]  )
   );
   (* BEL="X11/Y6/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_trigger_lut8 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (mux_s[8]    ),
      .O       (mux_s[9]  )
   );
   (* BEL="X11/Y6/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_trigger_lut9 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (mux_s[9]    ),
      .O       (mux_s[10]  )
   );
   (* BEL="X11/Y6/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_trigger_lut10 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (mux_s[10]    ),
      .O       (mux_s[11]  )
   );
   (* BEL="X11/Y6/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_trigger_lut11 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (mux_s[11]    ),
      .O       (mux_s[12]  )
   );
   (* BEL="X11/Y6/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_trigger_lut12 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (mux_s[12]    ),
      .O       (mux_s[13]  )
   );
   (* BEL="X11/Y6/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_trigger_lut13 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (mux_s[13]    ),
      .O       (mux_s[14]  )
   );
   (* BEL="X11/Y6/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_trigger_lut14 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (mux_s[14]    ),
      .O       (mux_s[15]  )
   );
   (* BEL="X11/Y6/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_trigger_lut15 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (mux_s[15]    ),
      .O       (mux_s[16]  )
   );
   (* BEL="X11/Y7/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_trigger_lut16 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (mux_s[16]    ),
      .O       (mux_s[17]  )
   );
   (* BEL="X11/Y7/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_trigger_lut17 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (mux_s[17]    ),
      .O       (mux_s[18]  )
   );
   (* BEL="X11/Y7/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_trigger_lut18 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (mux_s[18]    ),
      .O       (mux_s[19]  )
   );
   (* BEL="X11/Y7/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_trigger_lut19 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (mux_s[19]    ),
      .O       (mux_s[20]  )
   );
   (* BEL="X11/Y7/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_trigger_lut20 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (mux_s[20]    ),
      .O       (mux_s[21]  )
   );
   (* BEL="X11/Y7/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_trigger_lut21 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (mux_s[21]    ),
      .O       (mux_s[22]  )
   );
   (* BEL="X11/Y7/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_trigger_lut22 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (mux_s[22]    ),
      .O       (mux_s[23]  )
   );
   (* BEL="X11/Y7/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_trigger_lut23 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (mux_s[23]    ),
      .O       (mux_s[24]  )
   );
   (* BEL="X11/Y8/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_trigger_lut24 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (mux_s[24]    ),
      .O       (mux_s[25]  )
   );
   (* BEL="X11/Y8/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_trigger_lut25 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (mux_s[25]    ),
      .O       (mux_s[26]  )
   );
   (* BEL="X11/Y8/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_trigger_lut26 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (mux_s[26]    ),
      .O       (mux_s[27]  )
   );
   (* BEL="X11/Y8/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_trigger_lut27 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (mux_s[27]    ),
      .O       (mux_s[28]  )
   );
   (* BEL="X11/Y8/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_trigger_lut28 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (mux_s[28]    ),
      .O       (mux_s[29]  )
   );
   (* BEL="X11/Y8/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_trigger_lut29 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (mux_s[29]    ),
      .O       (mux_s[30]  )
   );
   (* BEL="X11/Y8/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_trigger_lut30 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (mux_s[30]    ),
      .O       (mux_s[31]  )
   );

// Capture the driver for scoper 

assign p0_dl[0] = mux_y[0];

   (* BEL="X12/Y1/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut0 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[31]    ),
      .O       (p0_dl[32]  )
   );
   (* BEL="X12/Y1/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut1 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[30]    ),
      .O       (p0_dl[31]  )
   );
   (* BEL="X12/Y1/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut2 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[29]    ),
      .O       (p0_dl[30]  )
   );
   (* BEL="X12/Y1/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut3 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[28]    ),
      .O       (p0_dl[29]  )
   );
   (* BEL="X12/Y1/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut4 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[27]    ),
      .O       (p0_dl[28]  )
   );
   (* BEL="X12/Y1/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut5 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[26]    ),
      .O       (p0_dl[27]  )
   );
   (* BEL="X12/Y1/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut6 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[25]    ),
      .O       (p0_dl[26]  )
   );
   (* BEL="X12/Y1/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut7 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[24]    ),
      .O       (p0_dl[25]  )
   );
   (* BEL="X12/Y2/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut8 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[23]    ),
      .O       (p0_dl[24]  )
   );
   (* BEL="X12/Y2/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut9 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[22]    ),
      .O       (p0_dl[23]  )
   );
   (* BEL="X12/Y2/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut10 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[21]    ),
      .O       (p0_dl[22]  )
   );
   (* BEL="X12/Y2/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut11 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[20]    ),
      .O       (p0_dl[21]  )
   );
   (* BEL="X12/Y2/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut12 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[19]    ),
      .O       (p0_dl[20]  )
   );
   (* BEL="X12/Y2/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut13 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[18]    ),
      .O       (p0_dl[19]  )
   );
   (* BEL="X12/Y2/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut14 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[17]    ),
      .O       (p0_dl[18]  )
   );
   (* BEL="X12/Y2/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut15 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[16]    ),
      .O       (p0_dl[17]  )
   );
   (* BEL="X12/Y3/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut16 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[15]    ),
      .O       (p0_dl[16]  )
   );
   (* BEL="X12/Y3/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut17 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[14]    ),
      .O       (p0_dl[15]  )
   );
   (* BEL="X12/Y3/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut18 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[13]    ),
      .O       (p0_dl[14]  )
   );
   (* BEL="X12/Y3/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut19 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[12]    ),
      .O       (p0_dl[13]  )
   );
   (* BEL="X12/Y3/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut20 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[11]    ),
      .O       (p0_dl[12]  )
   );
   (* BEL="X12/Y3/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut21 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[10]    ),
      .O       (p0_dl[11]  )
   );
   (* BEL="X12/Y3/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut22 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[9]    ),
      .O       (p0_dl[10]  )
   );
   (* BEL="X12/Y3/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut23 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[8]    ),
      .O       (p0_dl[9]  )
   );
   (* BEL="X12/Y4/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut24 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[7]    ),
      .O       (p0_dl[8]  )
   );
   (* BEL="X12/Y4/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut25 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[6]    ),
      .O       (p0_dl[7]  )
   );
   (* BEL="X12/Y4/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut26 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[5]    ),
      .O       (p0_dl[6]  )
   );
   (* BEL="X12/Y4/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut27 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[4]    ),
      .O       (p0_dl[5]  )
   );
   (* BEL="X12/Y4/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut28 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[3]    ),
      .O       (p0_dl[4]  )
   );
   (* BEL="X12/Y4/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut29 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[2]    ),
      .O       (p0_dl[3]  )
   );
   (* BEL="X12/Y4/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut30 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[1]    ),
      .O       (p0_dl[2]  )
   );
   (* BEL="X12/Y4/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'h0002      )
   ) u_dl_lut31 (
      .I3      (1'b0          ),
      .I2      (1'b0          ),
      .I1      (1'b0          ),
      .I0      (p0_dl[0]    ),
      .O       (p0_dl[1]  )
   );

   (* BEL="X13/Y1/lc0" *)
   SB_DFF  dff_2_0 (
      .C       (i_clk         ),
      .D       (p0_dl[31]  ),
      .Q       (p1_dl[31]    )
   );

   (* BEL="X14/Y1/lc0" *)
   SB_DFF  dff_3_0 (
      .C       (i_clk         ),
      .D       (p1_dl [31]    ),
      .Q       (o_data[31]   )
   );

   (* BEL="X13/Y1/lc1" *)
   SB_DFF  dff_2_1 (
      .C       (i_clk         ),
      .D       (p0_dl[30]  ),
      .Q       (p1_dl[30]    )
   );

   (* BEL="X14/Y1/lc1" *)
   SB_DFF  dff_3_1 (
      .C       (i_clk         ),
      .D       (p1_dl [30]    ),
      .Q       (o_data[30]   )
   );

   (* BEL="X13/Y1/lc2" *)
   SB_DFF  dff_2_2 (
      .C       (i_clk         ),
      .D       (p0_dl[29]  ),
      .Q       (p1_dl[29]    )
   );

   (* BEL="X14/Y1/lc2" *)
   SB_DFF  dff_3_2 (
      .C       (i_clk         ),
      .D       (p1_dl [29]    ),
      .Q       (o_data[29]   )
   );

   (* BEL="X13/Y1/lc3" *)
   SB_DFF  dff_2_3 (
      .C       (i_clk         ),
      .D       (p0_dl[28]  ),
      .Q       (p1_dl[28]    )
   );

   (* BEL="X14/Y1/lc3" *)
   SB_DFF  dff_3_3 (
      .C       (i_clk         ),
      .D       (p1_dl [28]    ),
      .Q       (o_data[28]   )
   );

   (* BEL="X13/Y1/lc4" *)
   SB_DFF  dff_2_4 (
      .C       (i_clk         ),
      .D       (p0_dl[27]  ),
      .Q       (p1_dl[27]    )
   );

   (* BEL="X14/Y1/lc4" *)
   SB_DFF  dff_3_4 (
      .C       (i_clk         ),
      .D       (p1_dl [27]    ),
      .Q       (o_data[27]   )
   );

   (* BEL="X13/Y1/lc5" *)
   SB_DFF  dff_2_5 (
      .C       (i_clk         ),
      .D       (p0_dl[26]  ),
      .Q       (p1_dl[26]    )
   );

   (* BEL="X14/Y1/lc5" *)
   SB_DFF  dff_3_5 (
      .C       (i_clk         ),
      .D       (p1_dl [26]    ),
      .Q       (o_data[26]   )
   );

   (* BEL="X13/Y1/lc6" *)
   SB_DFF  dff_2_6 (
      .C       (i_clk         ),
      .D       (p0_dl[25]  ),
      .Q       (p1_dl[25]    )
   );

   (* BEL="X14/Y1/lc6" *)
   SB_DFF  dff_3_6 (
      .C       (i_clk         ),
      .D       (p1_dl [25]    ),
      .Q       (o_data[25]   )
   );

   (* BEL="X13/Y1/lc7" *)
   SB_DFF  dff_2_7 (
      .C       (i_clk         ),
      .D       (p0_dl[24]  ),
      .Q       (p1_dl[24]    )
   );

   (* BEL="X14/Y1/lc7" *)
   SB_DFF  dff_3_7 (
      .C       (i_clk         ),
      .D       (p1_dl [24]    ),
      .Q       (o_data[24]   )
   );

   (* BEL="X13/Y2/lc0" *)
   SB_DFF  dff_2_8 (
      .C       (i_clk         ),
      .D       (p0_dl[23]  ),
      .Q       (p1_dl[23]    )
   );

   (* BEL="X14/Y2/lc0" *)
   SB_DFF  dff_3_8 (
      .C       (i_clk         ),
      .D       (p1_dl [23]    ),
      .Q       (o_data[23]   )
   );

   (* BEL="X13/Y2/lc1" *)
   SB_DFF  dff_2_9 (
      .C       (i_clk         ),
      .D       (p0_dl[22]  ),
      .Q       (p1_dl[22]    )
   );

   (* BEL="X14/Y2/lc1" *)
   SB_DFF  dff_3_9 (
      .C       (i_clk         ),
      .D       (p1_dl [22]    ),
      .Q       (o_data[22]   )
   );

   (* BEL="X13/Y2/lc2" *)
   SB_DFF  dff_2_10 (
      .C       (i_clk         ),
      .D       (p0_dl[21]  ),
      .Q       (p1_dl[21]    )
   );

   (* BEL="X14/Y2/lc2" *)
   SB_DFF  dff_3_10 (
      .C       (i_clk         ),
      .D       (p1_dl [21]    ),
      .Q       (o_data[21]   )
   );

   (* BEL="X13/Y2/lc3" *)
   SB_DFF  dff_2_11 (
      .C       (i_clk         ),
      .D       (p0_dl[20]  ),
      .Q       (p1_dl[20]    )
   );

   (* BEL="X14/Y2/lc3" *)
   SB_DFF  dff_3_11 (
      .C       (i_clk         ),
      .D       (p1_dl [20]    ),
      .Q       (o_data[20]   )
   );

   (* BEL="X13/Y2/lc4" *)
   SB_DFF  dff_2_12 (
      .C       (i_clk         ),
      .D       (p0_dl[19]  ),
      .Q       (p1_dl[19]    )
   );

   (* BEL="X14/Y2/lc4" *)
   SB_DFF  dff_3_12 (
      .C       (i_clk         ),
      .D       (p1_dl [19]    ),
      .Q       (o_data[19]   )
   );

   (* BEL="X13/Y2/lc5" *)
   SB_DFF  dff_2_13 (
      .C       (i_clk         ),
      .D       (p0_dl[18]  ),
      .Q       (p1_dl[18]    )
   );

   (* BEL="X14/Y2/lc5" *)
   SB_DFF  dff_3_13 (
      .C       (i_clk         ),
      .D       (p1_dl [18]    ),
      .Q       (o_data[18]   )
   );

   (* BEL="X13/Y2/lc6" *)
   SB_DFF  dff_2_14 (
      .C       (i_clk         ),
      .D       (p0_dl[17]  ),
      .Q       (p1_dl[17]    )
   );

   (* BEL="X14/Y2/lc6" *)
   SB_DFF  dff_3_14 (
      .C       (i_clk         ),
      .D       (p1_dl [17]    ),
      .Q       (o_data[17]   )
   );

   (* BEL="X13/Y2/lc7" *)
   SB_DFF  dff_2_15 (
      .C       (i_clk         ),
      .D       (p0_dl[16]  ),
      .Q       (p1_dl[16]    )
   );

   (* BEL="X14/Y2/lc7" *)
   SB_DFF  dff_3_15 (
      .C       (i_clk         ),
      .D       (p1_dl [16]    ),
      .Q       (o_data[16]   )
   );

   (* BEL="X13/Y3/lc0" *)
   SB_DFF  dff_2_16 (
      .C       (i_clk         ),
      .D       (p0_dl[15]  ),
      .Q       (p1_dl[15]    )
   );

   (* BEL="X14/Y3/lc0" *)
   SB_DFF  dff_3_16 (
      .C       (i_clk         ),
      .D       (p1_dl [15]    ),
      .Q       (o_data[15]   )
   );

   (* BEL="X13/Y3/lc1" *)
   SB_DFF  dff_2_17 (
      .C       (i_clk         ),
      .D       (p0_dl[14]  ),
      .Q       (p1_dl[14]    )
   );

   (* BEL="X14/Y3/lc1" *)
   SB_DFF  dff_3_17 (
      .C       (i_clk         ),
      .D       (p1_dl [14]    ),
      .Q       (o_data[14]   )
   );

   (* BEL="X13/Y3/lc2" *)
   SB_DFF  dff_2_18 (
      .C       (i_clk         ),
      .D       (p0_dl[13]  ),
      .Q       (p1_dl[13]    )
   );

   (* BEL="X14/Y3/lc2" *)
   SB_DFF  dff_3_18 (
      .C       (i_clk         ),
      .D       (p1_dl [13]    ),
      .Q       (o_data[13]   )
   );

   (* BEL="X13/Y3/lc3" *)
   SB_DFF  dff_2_19 (
      .C       (i_clk         ),
      .D       (p0_dl[12]  ),
      .Q       (p1_dl[12]    )
   );

   (* BEL="X14/Y3/lc3" *)
   SB_DFF  dff_3_19 (
      .C       (i_clk         ),
      .D       (p1_dl [12]    ),
      .Q       (o_data[12]   )
   );

   (* BEL="X13/Y3/lc4" *)
   SB_DFF  dff_2_20 (
      .C       (i_clk         ),
      .D       (p0_dl[11]  ),
      .Q       (p1_dl[11]    )
   );

   (* BEL="X14/Y3/lc4" *)
   SB_DFF  dff_3_20 (
      .C       (i_clk         ),
      .D       (p1_dl [11]    ),
      .Q       (o_data[11]   )
   );

   (* BEL="X13/Y3/lc5" *)
   SB_DFF  dff_2_21 (
      .C       (i_clk         ),
      .D       (p0_dl[10]  ),
      .Q       (p1_dl[10]    )
   );

   (* BEL="X14/Y3/lc5" *)
   SB_DFF  dff_3_21 (
      .C       (i_clk         ),
      .D       (p1_dl [10]    ),
      .Q       (o_data[10]   )
   );

   (* BEL="X13/Y3/lc6" *)
   SB_DFF  dff_2_22 (
      .C       (i_clk         ),
      .D       (p0_dl[9]  ),
      .Q       (p1_dl[9]    )
   );

   (* BEL="X14/Y3/lc6" *)
   SB_DFF  dff_3_22 (
      .C       (i_clk         ),
      .D       (p1_dl [9]    ),
      .Q       (o_data[9]   )
   );

   (* BEL="X13/Y3/lc7" *)
   SB_DFF  dff_2_23 (
      .C       (i_clk         ),
      .D       (p0_dl[8]  ),
      .Q       (p1_dl[8]    )
   );

   (* BEL="X14/Y3/lc7" *)
   SB_DFF  dff_3_23 (
      .C       (i_clk         ),
      .D       (p1_dl [8]    ),
      .Q       (o_data[8]   )
   );

   (* BEL="X13/Y4/lc0" *)
   SB_DFF  dff_2_24 (
      .C       (i_clk         ),
      .D       (p0_dl[7]  ),
      .Q       (p1_dl[7]    )
   );

   (* BEL="X14/Y4/lc0" *)
   SB_DFF  dff_3_24 (
      .C       (i_clk         ),
      .D       (p1_dl [7]    ),
      .Q       (o_data[7]   )
   );

   (* BEL="X13/Y4/lc1" *)
   SB_DFF  dff_2_25 (
      .C       (i_clk         ),
      .D       (p0_dl[6]  ),
      .Q       (p1_dl[6]    )
   );

   (* BEL="X14/Y4/lc1" *)
   SB_DFF  dff_3_25 (
      .C       (i_clk         ),
      .D       (p1_dl [6]    ),
      .Q       (o_data[6]   )
   );

   (* BEL="X13/Y4/lc2" *)
   SB_DFF  dff_2_26 (
      .C       (i_clk         ),
      .D       (p0_dl[5]  ),
      .Q       (p1_dl[5]    )
   );

   (* BEL="X14/Y4/lc2" *)
   SB_DFF  dff_3_26 (
      .C       (i_clk         ),
      .D       (p1_dl [5]    ),
      .Q       (o_data[5]   )
   );

   (* BEL="X13/Y4/lc3" *)
   SB_DFF  dff_2_27 (
      .C       (i_clk         ),
      .D       (p0_dl[4]  ),
      .Q       (p1_dl[4]    )
   );

   (* BEL="X14/Y4/lc3" *)
   SB_DFF  dff_3_27 (
      .C       (i_clk         ),
      .D       (p1_dl [4]    ),
      .Q       (o_data[4]   )
   );

   (* BEL="X13/Y4/lc4" *)
   SB_DFF  dff_2_28 (
      .C       (i_clk         ),
      .D       (p0_dl[3]  ),
      .Q       (p1_dl[3]    )
   );

   (* BEL="X14/Y4/lc4" *)
   SB_DFF  dff_3_28 (
      .C       (i_clk         ),
      .D       (p1_dl [3]    ),
      .Q       (o_data[3]   )
   );

   (* BEL="X13/Y4/lc5" *)
   SB_DFF  dff_2_29 (
      .C       (i_clk         ),
      .D       (p0_dl[2]  ),
      .Q       (p1_dl[2]    )
   );

   (* BEL="X14/Y4/lc5" *)
   SB_DFF  dff_3_29 (
      .C       (i_clk         ),
      .D       (p1_dl [2]    ),
      .Q       (o_data[2]   )
   );

   (* BEL="X13/Y4/lc6" *)
   SB_DFF  dff_2_30 (
      .C       (i_clk         ),
      .D       (p0_dl[1]  ),
      .Q       (p1_dl[1]    )
   );

   (* BEL="X14/Y4/lc6" *)
   SB_DFF  dff_3_30 (
      .C       (i_clk         ),
      .D       (p1_dl [1]    ),
      .Q       (o_data[1]   )
   );

   (* BEL="X13/Y4/lc7" *)
   SB_DFF  dff_2_31 (
      .C       (i_clk         ),
      .D       (p0_dl[0]  ),
      .Q       (p1_dl[0]    )
   );

   (* BEL="X14/Y4/lc7" *)
   SB_DFF  dff_3_31 (
      .C       (i_clk         ),
      .D       (p1_dl [0]    ),
      .Q       (o_data[0]   )
   );

endmodule

