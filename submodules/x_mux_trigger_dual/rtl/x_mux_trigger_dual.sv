`timescale 1ps/1fs

module x_mux_trigger_dual (
   input    wire        i_clk,
   input    wire [31:0] i_data,
   output   wire [31:0] o_data
);

wire [31:0] p0_dl;
wire [31:0] p1_dl;
wire [31:0] p2_dl;
wire [15:0] mux_a_s;
wire [16:0] mux_a_y;
wire [15:0] mux_a_d;
wire [15:0] mux_b_s;
wire [16:0] mux_b_y;
wire [15:0] mux_b_d;

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

// A side trigger/mux
(* BEL="X14/Y5/lc0" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_trig_a_0 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (mux_a_s[0]     ),
   .O       (mux_a_s[1]   )
);
(* BEL="X14/Y5/lc1" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_trig_a_1 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (mux_a_s[1]     ),
   .O       (mux_a_s[2]   )
);
(* BEL="X14/Y5/lc2" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_trig_a_2 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (mux_a_s[2]     ),
   .O       (mux_a_s[3]   )
);
(* BEL="X14/Y5/lc3" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_trig_a_3 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (mux_a_s[3]     ),
   .O       (mux_a_s[4]   )
);
(* BEL="X14/Y5/lc4" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_trig_a_4 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (mux_a_s[4]     ),
   .O       (mux_a_s[5]   )
);
(* BEL="X14/Y5/lc5" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_trig_a_5 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (mux_a_s[5]     ),
   .O       (mux_a_s[6]   )
);
(* BEL="X14/Y5/lc6" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_trig_a_6 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (mux_a_s[6]     ),
   .O       (mux_a_s[7]   )
);
(* BEL="X14/Y5/lc7" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_trig_a_7 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (mux_a_s[7]     ),
   .O       (mux_a_s[8]   )
);
(* BEL="X14/Y6/lc0" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_trig_a_8 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (mux_a_s[8]     ),
   .O       (mux_a_s[9]   )
);
(* BEL="X14/Y6/lc1" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_trig_a_9 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (mux_a_s[9]     ),
   .O       (mux_a_s[10]   )
);
(* BEL="X14/Y6/lc2" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_trig_a_10 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (mux_a_s[10]     ),
   .O       (mux_a_s[11]   )
);
(* BEL="X14/Y6/lc3" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_trig_a_11 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (mux_a_s[11]     ),
   .O       (mux_a_s[12]   )
);
(* BEL="X14/Y6/lc4" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_trig_a_12 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (mux_a_s[12]     ),
   .O       (mux_a_s[13]   )
);
(* BEL="X14/Y6/lc5" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_trig_a_13 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (mux_a_s[13]     ),
   .O       (mux_a_s[14]   )
);
(* BEL="X14/Y6/lc6" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_trig_a_14 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (mux_a_s[14]     ),
   .O       (mux_a_s[15]   )
);
(* BEL="X12/Y5/lc0" *)
SB_DFF u_dff_a_0 (
   .C       (i_clk            ),
   .D       (i_data[0]  ),
   .Q       (mux_a_d[0]     )
);
(* BEL="X12/Y5/lc1" *)
SB_DFF u_dff_a_1 (
   .C       (i_clk            ),
   .D       (i_data[2]  ),
   .Q       (mux_a_d[1]     )
);
(* BEL="X12/Y5/lc2" *)
SB_DFF u_dff_a_2 (
   .C       (i_clk            ),
   .D       (i_data[4]  ),
   .Q       (mux_a_d[2]     )
);
(* BEL="X12/Y5/lc3" *)
SB_DFF u_dff_a_3 (
   .C       (i_clk            ),
   .D       (i_data[6]  ),
   .Q       (mux_a_d[3]     )
);
(* BEL="X12/Y5/lc4" *)
SB_DFF u_dff_a_4 (
   .C       (i_clk            ),
   .D       (i_data[8]  ),
   .Q       (mux_a_d[4]     )
);
(* BEL="X12/Y5/lc5" *)
SB_DFF u_dff_a_5 (
   .C       (i_clk            ),
   .D       (i_data[10]  ),
   .Q       (mux_a_d[5]     )
);
(* BEL="X12/Y5/lc6" *)
SB_DFF u_dff_a_6 (
   .C       (i_clk            ),
   .D       (i_data[12]  ),
   .Q       (mux_a_d[6]     )
);
(* BEL="X12/Y5/lc7" *)
SB_DFF u_dff_a_7 (
   .C       (i_clk            ),
   .D       (i_data[14]  ),
   .Q       (mux_a_d[7]     )
);
(* BEL="X12/Y6/lc0" *)
SB_DFF u_dff_a_8 (
   .C       (i_clk            ),
   .D       (i_data[16]  ),
   .Q       (mux_a_d[8]     )
);
(* BEL="X12/Y6/lc1" *)
SB_DFF u_dff_a_9 (
   .C       (i_clk            ),
   .D       (i_data[18]  ),
   .Q       (mux_a_d[9]     )
);
(* BEL="X12/Y6/lc2" *)
SB_DFF u_dff_a_10 (
   .C       (i_clk            ),
   .D       (i_data[20]  ),
   .Q       (mux_a_d[10]     )
);
(* BEL="X12/Y6/lc3" *)
SB_DFF u_dff_a_11 (
   .C       (i_clk            ),
   .D       (i_data[22]  ),
   .Q       (mux_a_d[11]     )
);
(* BEL="X12/Y6/lc4" *)
SB_DFF u_dff_a_12 (
   .C       (i_clk            ),
   .D       (i_data[24]  ),
   .Q       (mux_a_d[12]     )
);
(* BEL="X12/Y6/lc5" *)
SB_DFF u_dff_a_13 (
   .C       (i_clk            ),
   .D       (i_data[26]  ),
   .Q       (mux_a_d[13]     )
);
(* BEL="X12/Y6/lc6" *)
SB_DFF u_dff_a_14 (
   .C       (i_clk            ),
   .D       (i_data[28]  ),
   .Q       (mux_a_d[14]     )
);
(* BEL="X12/Y6/lc7" *)
SB_DFF u_dff_a_15 (
   .C       (i_clk            ),
   .D       (i_data[30]  ),
   .Q       (mux_a_d[15]     )
);
(* BEL="X13/Y5/lc0" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_a_0 (
   .I3      (1'b0             ),
   .I2      (mux_a_s[0]     ),
   .I1      (mux_a_y[1]   ),
   .I0      (mux_a_d[0]     ),
   .O       (mux_a_y[0]     )
);
(* BEL="X13/Y5/lc1" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_a_1 (
   .I3      (1'b0             ),
   .I2      (mux_a_s[1]     ),
   .I1      (mux_a_y[2]   ),
   .I0      (mux_a_d[1]     ),
   .O       (mux_a_y[1]     )
);
(* BEL="X13/Y5/lc2" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_a_2 (
   .I3      (1'b0             ),
   .I2      (mux_a_s[2]     ),
   .I1      (mux_a_y[3]   ),
   .I0      (mux_a_d[2]     ),
   .O       (mux_a_y[2]     )
);
(* BEL="X13/Y5/lc3" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_a_3 (
   .I3      (1'b0             ),
   .I2      (mux_a_s[3]     ),
   .I1      (mux_a_y[4]   ),
   .I0      (mux_a_d[3]     ),
   .O       (mux_a_y[3]     )
);
(* BEL="X13/Y5/lc4" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_a_4 (
   .I3      (1'b0             ),
   .I2      (mux_a_s[4]     ),
   .I1      (mux_a_y[5]   ),
   .I0      (mux_a_d[4]     ),
   .O       (mux_a_y[4]     )
);
(* BEL="X13/Y5/lc5" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_a_5 (
   .I3      (1'b0             ),
   .I2      (mux_a_s[5]     ),
   .I1      (mux_a_y[6]   ),
   .I0      (mux_a_d[5]     ),
   .O       (mux_a_y[5]     )
);
(* BEL="X13/Y5/lc6" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_a_6 (
   .I3      (1'b0             ),
   .I2      (mux_a_s[6]     ),
   .I1      (mux_a_y[7]   ),
   .I0      (mux_a_d[6]     ),
   .O       (mux_a_y[6]     )
);
(* BEL="X13/Y5/lc7" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_a_7 (
   .I3      (1'b0             ),
   .I2      (mux_a_s[7]     ),
   .I1      (mux_a_y[8]   ),
   .I0      (mux_a_d[7]     ),
   .O       (mux_a_y[7]     )
);
(* BEL="X13/Y6/lc0" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_a_8 (
   .I3      (1'b0             ),
   .I2      (mux_a_s[8]     ),
   .I1      (mux_a_y[9]   ),
   .I0      (mux_a_d[8]     ),
   .O       (mux_a_y[8]     )
);
(* BEL="X13/Y6/lc1" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_a_9 (
   .I3      (1'b0             ),
   .I2      (mux_a_s[9]     ),
   .I1      (mux_a_y[10]   ),
   .I0      (mux_a_d[9]     ),
   .O       (mux_a_y[9]     )
);
(* BEL="X13/Y6/lc2" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_a_10 (
   .I3      (1'b0             ),
   .I2      (mux_a_s[10]     ),
   .I1      (mux_a_y[11]   ),
   .I0      (mux_a_d[10]     ),
   .O       (mux_a_y[10]     )
);
(* BEL="X13/Y6/lc3" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_a_11 (
   .I3      (1'b0             ),
   .I2      (mux_a_s[11]     ),
   .I1      (mux_a_y[12]   ),
   .I0      (mux_a_d[11]     ),
   .O       (mux_a_y[11]     )
);
(* BEL="X13/Y6/lc4" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_a_12 (
   .I3      (1'b0             ),
   .I2      (mux_a_s[12]     ),
   .I1      (mux_a_y[13]   ),
   .I0      (mux_a_d[12]     ),
   .O       (mux_a_y[12]     )
);
(* BEL="X13/Y6/lc5" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_a_13 (
   .I3      (1'b0             ),
   .I2      (mux_a_s[13]     ),
   .I1      (mux_a_y[14]   ),
   .I0      (mux_a_d[13]     ),
   .O       (mux_a_y[13]     )
);
(* BEL="X13/Y6/lc6" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_a_14 (
   .I3      (1'b0             ),
   .I2      (mux_a_s[14]     ),
   .I1      (mux_a_y[15]   ),
   .I0      (mux_a_d[14]     ),
   .O       (mux_a_y[14]     )
);
(* BEL="X13/Y6/lc7" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_a_15 (
   .I3      (1'b0             ),
   .I2      (mux_a_s[15]     ),
   .I1      (mux_a_y[16]   ),
   .I0      (mux_a_d[15]     ),
   .O       (mux_a_y[15]     )
);
assign mux_a_y[16] = 1'b0;

// B side trigger/mux
(* BEL="X17/Y5/lc0" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_trig_b_0 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (mux_b_s[0]     ),
   .O       (mux_b_s[1]   )
);
(* BEL="X17/Y5/lc1" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_trig_b_1 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (mux_b_s[1]     ),
   .O       (mux_b_s[2]   )
);
(* BEL="X17/Y5/lc2" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_trig_b_2 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (mux_b_s[2]     ),
   .O       (mux_b_s[3]   )
);
(* BEL="X17/Y5/lc3" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_trig_b_3 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (mux_b_s[3]     ),
   .O       (mux_b_s[4]   )
);
(* BEL="X17/Y5/lc4" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_trig_b_4 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (mux_b_s[4]     ),
   .O       (mux_b_s[5]   )
);
(* BEL="X17/Y5/lc5" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_trig_b_5 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (mux_b_s[5]     ),
   .O       (mux_b_s[6]   )
);
(* BEL="X17/Y5/lc6" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_trig_b_6 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (mux_b_s[6]     ),
   .O       (mux_b_s[7]   )
);
(* BEL="X17/Y5/lc7" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_trig_b_7 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (mux_b_s[7]     ),
   .O       (mux_b_s[8]   )
);
(* BEL="X17/Y6/lc0" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_trig_b_8 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (mux_b_s[8]     ),
   .O       (mux_b_s[9]   )
);
(* BEL="X17/Y6/lc1" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_trig_b_9 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (mux_b_s[9]     ),
   .O       (mux_b_s[10]   )
);
(* BEL="X17/Y6/lc2" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_trig_b_10 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (mux_b_s[10]     ),
   .O       (mux_b_s[11]   )
);
(* BEL="X17/Y6/lc3" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_trig_b_11 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (mux_b_s[11]     ),
   .O       (mux_b_s[12]   )
);
(* BEL="X17/Y6/lc4" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_trig_b_12 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (mux_b_s[12]     ),
   .O       (mux_b_s[13]   )
);
(* BEL="X17/Y6/lc5" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_trig_b_13 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (mux_b_s[13]     ),
   .O       (mux_b_s[14]   )
);
(* BEL="X17/Y6/lc6" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_trig_b_14 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (mux_b_s[14]     ),
   .O       (mux_b_s[15]   )
);
(* BEL="X15/Y5/lc0" *)
SB_DFF u_dff_b_0 (
   .C       (i_clk            ),
   .D       (i_data[1]),
   .Q       (mux_b_d[0]     )
);
(* BEL="X15/Y5/lc1" *)
SB_DFF u_dff_b_1 (
   .C       (i_clk            ),
   .D       (i_data[3]),
   .Q       (mux_b_d[1]     )
);
(* BEL="X15/Y5/lc2" *)
SB_DFF u_dff_b_2 (
   .C       (i_clk            ),
   .D       (i_data[5]),
   .Q       (mux_b_d[2]     )
);
(* BEL="X15/Y5/lc3" *)
SB_DFF u_dff_b_3 (
   .C       (i_clk            ),
   .D       (i_data[7]),
   .Q       (mux_b_d[3]     )
);
(* BEL="X15/Y5/lc4" *)
SB_DFF u_dff_b_4 (
   .C       (i_clk            ),
   .D       (i_data[9]),
   .Q       (mux_b_d[4]     )
);
(* BEL="X15/Y5/lc5" *)
SB_DFF u_dff_b_5 (
   .C       (i_clk            ),
   .D       (i_data[11]),
   .Q       (mux_b_d[5]     )
);
(* BEL="X15/Y5/lc6" *)
SB_DFF u_dff_b_6 (
   .C       (i_clk            ),
   .D       (i_data[13]),
   .Q       (mux_b_d[6]     )
);
(* BEL="X15/Y5/lc7" *)
SB_DFF u_dff_b_7 (
   .C       (i_clk            ),
   .D       (i_data[15]),
   .Q       (mux_b_d[7]     )
);
(* BEL="X15/Y6/lc0" *)
SB_DFF u_dff_b_8 (
   .C       (i_clk            ),
   .D       (i_data[17]),
   .Q       (mux_b_d[8]     )
);
(* BEL="X15/Y6/lc1" *)
SB_DFF u_dff_b_9 (
   .C       (i_clk            ),
   .D       (i_data[19]),
   .Q       (mux_b_d[9]     )
);
(* BEL="X15/Y6/lc2" *)
SB_DFF u_dff_b_10 (
   .C       (i_clk            ),
   .D       (i_data[21]),
   .Q       (mux_b_d[10]     )
);
(* BEL="X15/Y6/lc3" *)
SB_DFF u_dff_b_11 (
   .C       (i_clk            ),
   .D       (i_data[23]),
   .Q       (mux_b_d[11]     )
);
(* BEL="X15/Y6/lc4" *)
SB_DFF u_dff_b_12 (
   .C       (i_clk            ),
   .D       (i_data[25]),
   .Q       (mux_b_d[12]     )
);
(* BEL="X15/Y6/lc5" *)
SB_DFF u_dff_b_13 (
   .C       (i_clk            ),
   .D       (i_data[27]),
   .Q       (mux_b_d[13]     )
);
(* BEL="X15/Y6/lc6" *)
SB_DFF u_dff_b_14 (
   .C       (i_clk            ),
   .D       (i_data[29]),
   .Q       (mux_b_d[14]     )
);
(* BEL="X15/Y6/lc7" *)
SB_DFF u_dff_b_15 (
   .C       (i_clk            ),
   .D       (i_data[31]),
   .Q       (mux_b_d[15]     )
);
(* BEL="X16/Y5/lc0" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_b_0 (
   .I3      (1'b0             ),
   .I2      (mux_b_s[0]     ),
   .I1      (mux_b_y[1]   ),
   .I0      (mux_b_d[0]     ),
   .O       (mux_b_y[0]     )
);
(* BEL="X16/Y5/lc1" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_b_1 (
   .I3      (1'b0             ),
   .I2      (mux_b_s[1]     ),
   .I1      (mux_b_y[2]   ),
   .I0      (mux_b_d[1]     ),
   .O       (mux_b_y[1]     )
);
(* BEL="X16/Y5/lc2" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_b_2 (
   .I3      (1'b0             ),
   .I2      (mux_b_s[2]     ),
   .I1      (mux_b_y[3]   ),
   .I0      (mux_b_d[2]     ),
   .O       (mux_b_y[2]     )
);
(* BEL="X16/Y5/lc3" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_b_3 (
   .I3      (1'b0             ),
   .I2      (mux_b_s[3]     ),
   .I1      (mux_b_y[4]   ),
   .I0      (mux_b_d[3]     ),
   .O       (mux_b_y[3]     )
);
(* BEL="X16/Y5/lc4" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_b_4 (
   .I3      (1'b0             ),
   .I2      (mux_b_s[4]     ),
   .I1      (mux_b_y[5]   ),
   .I0      (mux_b_d[4]     ),
   .O       (mux_b_y[4]     )
);
(* BEL="X16/Y5/lc5" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_b_5 (
   .I3      (1'b0             ),
   .I2      (mux_b_s[5]     ),
   .I1      (mux_b_y[6]   ),
   .I0      (mux_b_d[5]     ),
   .O       (mux_b_y[5]     )
);
(* BEL="X16/Y5/lc6" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_b_6 (
   .I3      (1'b0             ),
   .I2      (mux_b_s[6]     ),
   .I1      (mux_b_y[7]   ),
   .I0      (mux_b_d[6]     ),
   .O       (mux_b_y[6]     )
);
(* BEL="X16/Y5/lc7" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_b_7 (
   .I3      (1'b0             ),
   .I2      (mux_b_s[7]     ),
   .I1      (mux_b_y[8]   ),
   .I0      (mux_b_d[7]     ),
   .O       (mux_b_y[7]     )
);
(* BEL="X16/Y6/lc0" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_b_8 (
   .I3      (1'b0             ),
   .I2      (mux_b_s[8]     ),
   .I1      (mux_b_y[9]   ),
   .I0      (mux_b_d[8]     ),
   .O       (mux_b_y[8]     )
);
(* BEL="X16/Y6/lc1" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_b_9 (
   .I3      (1'b0             ),
   .I2      (mux_b_s[9]     ),
   .I1      (mux_b_y[10]   ),
   .I0      (mux_b_d[9]     ),
   .O       (mux_b_y[9]     )
);
(* BEL="X16/Y6/lc2" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_b_10 (
   .I3      (1'b0             ),
   .I2      (mux_b_s[10]     ),
   .I1      (mux_b_y[11]   ),
   .I0      (mux_b_d[10]     ),
   .O       (mux_b_y[10]     )
);
(* BEL="X16/Y6/lc3" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_b_11 (
   .I3      (1'b0             ),
   .I2      (mux_b_s[11]     ),
   .I1      (mux_b_y[12]   ),
   .I0      (mux_b_d[11]     ),
   .O       (mux_b_y[11]     )
);
(* BEL="X16/Y6/lc4" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_b_12 (
   .I3      (1'b0             ),
   .I2      (mux_b_s[12]     ),
   .I1      (mux_b_y[13]   ),
   .I0      (mux_b_d[12]     ),
   .O       (mux_b_y[12]     )
);
(* BEL="X16/Y6/lc5" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_b_13 (
   .I3      (1'b0             ),
   .I2      (mux_b_s[13]     ),
   .I1      (mux_b_y[14]   ),
   .I0      (mux_b_d[13]     ),
   .O       (mux_b_y[13]     )
);
(* BEL="X16/Y6/lc6" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_b_14 (
   .I3      (1'b0             ),
   .I2      (mux_b_s[14]     ),
   .I1      (mux_b_y[15]   ),
   .I0      (mux_b_d[14]     ),
   .O       (mux_b_y[14]     )
);
(* BEL="X16/Y6/lc7" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA         )
) u_mux_b_15 (
   .I3      (1'b0             ),
   .I2      (mux_b_s[15]     ),
   .I1      (mux_b_y[16]   ),
   .I0      (mux_b_d[15]     ),
   .O       (mux_b_y[15]     )
);

assign mux_b_y[16] = 1'b0;

// A/B 
(* BEL="X12/Y4/lc7" *)
SB_DFF u_dff_trig (
   .C       (i_clk      ),
   .D       (mux_a_s[0] ),
   .Q       (mux_b_s[0] )
); 
(* BEL="X12/Y4/lc6" *)
SB_LUT4 #(
   .LUT_INIT(16'h0001   )
) u_inv (
   .I3      (1'b0       ),
   .I2      (1'b0       ),
   .I1      (1'b0       ),
   .I0      (mux_b_s[0] ),
   .O       (mux_a_s[0] )
);
(* BEL="X13/Y4/lc7" *)
SB_LUT4 #(
   .LUT_INIT(16'h00CA   )
) u_mux (
   .I3      (1'b0       ),
   .I2      (mux_a_s[0] ),
   .I1      (mux_a_y[0] ),
   .I0      (mux_b_y[0] ),
   .O       (p0_dl[31]  )
);

// Capture the driver for scoper 
(* BEL="X14/Y1/lc0" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_dl_0 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (p0_dl[1]    ),
   .O       (p0_dl[0]  )
);
(* BEL="X14/Y1/lc1" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_dl_1 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (p0_dl[2]    ),
   .O       (p0_dl[1]  )
);
(* BEL="X14/Y1/lc2" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_dl_2 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (p0_dl[3]    ),
   .O       (p0_dl[2]  )
);
(* BEL="X14/Y1/lc3" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_dl_3 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (p0_dl[4]    ),
   .O       (p0_dl[3]  )
);
(* BEL="X14/Y1/lc4" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_dl_4 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (p0_dl[5]    ),
   .O       (p0_dl[4]  )
);
(* BEL="X14/Y1/lc5" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_dl_5 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (p0_dl[6]    ),
   .O       (p0_dl[5]  )
);
(* BEL="X14/Y1/lc6" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_dl_6 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (p0_dl[7]    ),
   .O       (p0_dl[6]  )
);
(* BEL="X14/Y1/lc7" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_dl_7 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (p0_dl[8]    ),
   .O       (p0_dl[7]  )
);
(* BEL="X14/Y2/lc0" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_dl_8 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (p0_dl[9]    ),
   .O       (p0_dl[8]  )
);
(* BEL="X14/Y2/lc1" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_dl_9 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (p0_dl[10]    ),
   .O       (p0_dl[9]  )
);
(* BEL="X14/Y2/lc2" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_dl_10 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (p0_dl[11]    ),
   .O       (p0_dl[10]  )
);
(* BEL="X14/Y2/lc3" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_dl_11 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (p0_dl[12]    ),
   .O       (p0_dl[11]  )
);
(* BEL="X14/Y2/lc4" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_dl_12 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (p0_dl[13]    ),
   .O       (p0_dl[12]  )
);
(* BEL="X14/Y2/lc5" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_dl_13 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (p0_dl[14]    ),
   .O       (p0_dl[13]  )
);
(* BEL="X14/Y2/lc6" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_dl_14 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (p0_dl[15]    ),
   .O       (p0_dl[14]  )
);
(* BEL="X14/Y2/lc7" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_dl_15 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (p0_dl[16]    ),
   .O       (p0_dl[15]  )
);
(* BEL="X14/Y3/lc0" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_dl_16 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (p0_dl[17]    ),
   .O       (p0_dl[16]  )
);
(* BEL="X14/Y3/lc1" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_dl_17 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (p0_dl[18]    ),
   .O       (p0_dl[17]  )
);
(* BEL="X14/Y3/lc2" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_dl_18 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (p0_dl[19]    ),
   .O       (p0_dl[18]  )
);
(* BEL="X14/Y3/lc3" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_dl_19 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (p0_dl[20]    ),
   .O       (p0_dl[19]  )
);
(* BEL="X14/Y3/lc4" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_dl_20 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (p0_dl[21]    ),
   .O       (p0_dl[20]  )
);
(* BEL="X14/Y3/lc5" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_dl_21 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (p0_dl[22]    ),
   .O       (p0_dl[21]  )
);
(* BEL="X14/Y3/lc6" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_dl_22 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (p0_dl[23]    ),
   .O       (p0_dl[22]  )
);
(* BEL="X14/Y3/lc7" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_dl_23 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (p0_dl[24]    ),
   .O       (p0_dl[23]  )
);
(* BEL="X14/Y4/lc0" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_dl_24 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (p0_dl[25]    ),
   .O       (p0_dl[24]  )
);
(* BEL="X14/Y4/lc1" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_dl_25 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (p0_dl[26]    ),
   .O       (p0_dl[25]  )
);
(* BEL="X14/Y4/lc2" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_dl_26 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (p0_dl[27]    ),
   .O       (p0_dl[26]  )
);
(* BEL="X14/Y4/lc3" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_dl_27 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (p0_dl[28]    ),
   .O       (p0_dl[27]  )
);
(* BEL="X14/Y4/lc4" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_dl_28 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (p0_dl[29]    ),
   .O       (p0_dl[28]  )
);
(* BEL="X14/Y4/lc5" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_dl_29 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (p0_dl[30]    ),
   .O       (p0_dl[29]  )
);
(* BEL="X14/Y4/lc6" *)
SB_LUT4 #(
   .LUT_INIT(16'h0002         )
) u_dl_30 (
   .I3      (1'b0             ),
   .I2      (1'b0             ),
   .I1      (1'b0             ),
   .I0      (p0_dl[31]    ),
   .O       (p0_dl[30]  )
);
(* BEL="X15/Y1/lc0" *)
SB_DFF  u_dff_p0_0 (
   .C       (i_clk            ),
   .D       (p0_dl[0]    ),
   .Q       (p1_dl[0]    )
);
(* BEL="X15/Y1/lc1" *)
SB_DFF  u_dff_p0_1 (
   .C       (i_clk            ),
   .D       (p0_dl[1]    ),
   .Q       (p1_dl[1]    )
);
(* BEL="X15/Y1/lc2" *)
SB_DFF  u_dff_p0_2 (
   .C       (i_clk            ),
   .D       (p0_dl[2]    ),
   .Q       (p1_dl[2]    )
);
(* BEL="X15/Y1/lc3" *)
SB_DFF  u_dff_p0_3 (
   .C       (i_clk            ),
   .D       (p0_dl[3]    ),
   .Q       (p1_dl[3]    )
);
(* BEL="X15/Y1/lc4" *)
SB_DFF  u_dff_p0_4 (
   .C       (i_clk            ),
   .D       (p0_dl[4]    ),
   .Q       (p1_dl[4]    )
);
(* BEL="X15/Y1/lc5" *)
SB_DFF  u_dff_p0_5 (
   .C       (i_clk            ),
   .D       (p0_dl[5]    ),
   .Q       (p1_dl[5]    )
);
(* BEL="X15/Y1/lc6" *)
SB_DFF  u_dff_p0_6 (
   .C       (i_clk            ),
   .D       (p0_dl[6]    ),
   .Q       (p1_dl[6]    )
);
(* BEL="X15/Y1/lc7" *)
SB_DFF  u_dff_p0_7 (
   .C       (i_clk            ),
   .D       (p0_dl[7]    ),
   .Q       (p1_dl[7]    )
);
(* BEL="X15/Y2/lc0" *)
SB_DFF  u_dff_p0_8 (
   .C       (i_clk            ),
   .D       (p0_dl[8]    ),
   .Q       (p1_dl[8]    )
);
(* BEL="X15/Y2/lc1" *)
SB_DFF  u_dff_p0_9 (
   .C       (i_clk            ),
   .D       (p0_dl[9]    ),
   .Q       (p1_dl[9]    )
);
(* BEL="X15/Y2/lc2" *)
SB_DFF  u_dff_p0_10 (
   .C       (i_clk            ),
   .D       (p0_dl[10]    ),
   .Q       (p1_dl[10]    )
);
(* BEL="X15/Y2/lc3" *)
SB_DFF  u_dff_p0_11 (
   .C       (i_clk            ),
   .D       (p0_dl[11]    ),
   .Q       (p1_dl[11]    )
);
(* BEL="X15/Y2/lc4" *)
SB_DFF  u_dff_p0_12 (
   .C       (i_clk            ),
   .D       (p0_dl[12]    ),
   .Q       (p1_dl[12]    )
);
(* BEL="X15/Y2/lc5" *)
SB_DFF  u_dff_p0_13 (
   .C       (i_clk            ),
   .D       (p0_dl[13]    ),
   .Q       (p1_dl[13]    )
);
(* BEL="X15/Y2/lc6" *)
SB_DFF  u_dff_p0_14 (
   .C       (i_clk            ),
   .D       (p0_dl[14]    ),
   .Q       (p1_dl[14]    )
);
(* BEL="X15/Y2/lc7" *)
SB_DFF  u_dff_p0_15 (
   .C       (i_clk            ),
   .D       (p0_dl[15]    ),
   .Q       (p1_dl[15]    )
);
(* BEL="X15/Y3/lc0" *)
SB_DFF  u_dff_p0_16 (
   .C       (i_clk            ),
   .D       (p0_dl[16]    ),
   .Q       (p1_dl[16]    )
);
(* BEL="X15/Y3/lc1" *)
SB_DFF  u_dff_p0_17 (
   .C       (i_clk            ),
   .D       (p0_dl[17]    ),
   .Q       (p1_dl[17]    )
);
(* BEL="X15/Y3/lc2" *)
SB_DFF  u_dff_p0_18 (
   .C       (i_clk            ),
   .D       (p0_dl[18]    ),
   .Q       (p1_dl[18]    )
);
(* BEL="X15/Y3/lc3" *)
SB_DFF  u_dff_p0_19 (
   .C       (i_clk            ),
   .D       (p0_dl[19]    ),
   .Q       (p1_dl[19]    )
);
(* BEL="X15/Y3/lc4" *)
SB_DFF  u_dff_p0_20 (
   .C       (i_clk            ),
   .D       (p0_dl[20]    ),
   .Q       (p1_dl[20]    )
);
(* BEL="X15/Y3/lc5" *)
SB_DFF  u_dff_p0_21 (
   .C       (i_clk            ),
   .D       (p0_dl[21]    ),
   .Q       (p1_dl[21]    )
);
(* BEL="X15/Y3/lc6" *)
SB_DFF  u_dff_p0_22 (
   .C       (i_clk            ),
   .D       (p0_dl[22]    ),
   .Q       (p1_dl[22]    )
);
(* BEL="X15/Y3/lc7" *)
SB_DFF  u_dff_p0_23 (
   .C       (i_clk            ),
   .D       (p0_dl[23]    ),
   .Q       (p1_dl[23]    )
);
(* BEL="X15/Y4/lc0" *)
SB_DFF  u_dff_p0_24 (
   .C       (i_clk            ),
   .D       (p0_dl[24]    ),
   .Q       (p1_dl[24]    )
);
(* BEL="X15/Y4/lc1" *)
SB_DFF  u_dff_p0_25 (
   .C       (i_clk            ),
   .D       (p0_dl[25]    ),
   .Q       (p1_dl[25]    )
);
(* BEL="X15/Y4/lc2" *)
SB_DFF  u_dff_p0_26 (
   .C       (i_clk            ),
   .D       (p0_dl[26]    ),
   .Q       (p1_dl[26]    )
);
(* BEL="X15/Y4/lc3" *)
SB_DFF  u_dff_p0_27 (
   .C       (i_clk            ),
   .D       (p0_dl[27]    ),
   .Q       (p1_dl[27]    )
);
(* BEL="X15/Y4/lc4" *)
SB_DFF  u_dff_p0_28 (
   .C       (i_clk            ),
   .D       (p0_dl[28]    ),
   .Q       (p1_dl[28]    )
);
(* BEL="X15/Y4/lc5" *)
SB_DFF  u_dff_p0_29 (
   .C       (i_clk            ),
   .D       (p0_dl[29]    ),
   .Q       (p1_dl[29]    )
);
(* BEL="X15/Y4/lc6" *)
SB_DFF  u_dff_p0_30 (
   .C       (i_clk            ),
   .D       (p0_dl[30]    ),
   .Q       (p1_dl[30]    )
);
(* BEL="X15/Y4/lc7" *)
SB_DFF  u_dff_p0_31 (
   .C       (i_clk            ),
   .D       (p0_dl[31]    ),
   .Q       (p1_dl[31]    )
);
(* BEL="X16/Y1/lc0" *)
SB_DFF  u_dff_p1_0 (
   .C       (i_clk            ),
   .D       (p1_dl[0]    ),
   .Q       (o_data[0]   )
);
(* BEL="X16/Y1/lc1" *)
SB_DFF  u_dff_p1_1 (
   .C       (i_clk            ),
   .D       (p1_dl[1]    ),
   .Q       (o_data[1]   )
);
(* BEL="X16/Y1/lc2" *)
SB_DFF  u_dff_p1_2 (
   .C       (i_clk            ),
   .D       (p1_dl[2]    ),
   .Q       (o_data[2]   )
);
(* BEL="X16/Y1/lc3" *)
SB_DFF  u_dff_p1_3 (
   .C       (i_clk            ),
   .D       (p1_dl[3]    ),
   .Q       (o_data[3]   )
);
(* BEL="X16/Y1/lc4" *)
SB_DFF  u_dff_p1_4 (
   .C       (i_clk            ),
   .D       (p1_dl[4]    ),
   .Q       (o_data[4]   )
);
(* BEL="X16/Y1/lc5" *)
SB_DFF  u_dff_p1_5 (
   .C       (i_clk            ),
   .D       (p1_dl[5]    ),
   .Q       (o_data[5]   )
);
(* BEL="X16/Y1/lc6" *)
SB_DFF  u_dff_p1_6 (
   .C       (i_clk            ),
   .D       (p1_dl[6]    ),
   .Q       (o_data[6]   )
);
(* BEL="X16/Y1/lc7" *)
SB_DFF  u_dff_p1_7 (
   .C       (i_clk            ),
   .D       (p1_dl[7]    ),
   .Q       (o_data[7]   )
);
(* BEL="X16/Y2/lc0" *)
SB_DFF  u_dff_p1_8 (
   .C       (i_clk            ),
   .D       (p1_dl[8]    ),
   .Q       (o_data[8]   )
);
(* BEL="X16/Y2/lc1" *)
SB_DFF  u_dff_p1_9 (
   .C       (i_clk            ),
   .D       (p1_dl[9]    ),
   .Q       (o_data[9]   )
);
(* BEL="X16/Y2/lc2" *)
SB_DFF  u_dff_p1_10 (
   .C       (i_clk            ),
   .D       (p1_dl[10]    ),
   .Q       (o_data[10]   )
);
(* BEL="X16/Y2/lc3" *)
SB_DFF  u_dff_p1_11 (
   .C       (i_clk            ),
   .D       (p1_dl[11]    ),
   .Q       (o_data[11]   )
);
(* BEL="X16/Y2/lc4" *)
SB_DFF  u_dff_p1_12 (
   .C       (i_clk            ),
   .D       (p1_dl[12]    ),
   .Q       (o_data[12]   )
);
(* BEL="X16/Y2/lc5" *)
SB_DFF  u_dff_p1_13 (
   .C       (i_clk            ),
   .D       (p1_dl[13]    ),
   .Q       (o_data[13]   )
);
(* BEL="X16/Y2/lc6" *)
SB_DFF  u_dff_p1_14 (
   .C       (i_clk            ),
   .D       (p1_dl[14]    ),
   .Q       (o_data[14]   )
);
(* BEL="X16/Y2/lc7" *)
SB_DFF  u_dff_p1_15 (
   .C       (i_clk            ),
   .D       (p1_dl[15]    ),
   .Q       (o_data[15]   )
);
(* BEL="X16/Y3/lc0" *)
SB_DFF  u_dff_p1_16 (
   .C       (i_clk            ),
   .D       (p1_dl[16]    ),
   .Q       (o_data[16]   )
);
(* BEL="X16/Y3/lc1" *)
SB_DFF  u_dff_p1_17 (
   .C       (i_clk            ),
   .D       (p1_dl[17]    ),
   .Q       (o_data[17]   )
);
(* BEL="X16/Y3/lc2" *)
SB_DFF  u_dff_p1_18 (
   .C       (i_clk            ),
   .D       (p1_dl[18]    ),
   .Q       (o_data[18]   )
);
(* BEL="X16/Y3/lc3" *)
SB_DFF  u_dff_p1_19 (
   .C       (i_clk            ),
   .D       (p1_dl[19]    ),
   .Q       (o_data[19]   )
);
(* BEL="X16/Y3/lc4" *)
SB_DFF  u_dff_p1_20 (
   .C       (i_clk            ),
   .D       (p1_dl[20]    ),
   .Q       (o_data[20]   )
);
(* BEL="X16/Y3/lc5" *)
SB_DFF  u_dff_p1_21 (
   .C       (i_clk            ),
   .D       (p1_dl[21]    ),
   .Q       (o_data[21]   )
);
(* BEL="X16/Y3/lc6" *)
SB_DFF  u_dff_p1_22 (
   .C       (i_clk            ),
   .D       (p1_dl[22]    ),
   .Q       (o_data[22]   )
);
(* BEL="X16/Y3/lc7" *)
SB_DFF  u_dff_p1_23 (
   .C       (i_clk            ),
   .D       (p1_dl[23]    ),
   .Q       (o_data[23]   )
);
(* BEL="X16/Y4/lc0" *)
SB_DFF  u_dff_p1_24 (
   .C       (i_clk            ),
   .D       (p1_dl[24]    ),
   .Q       (o_data[24]   )
);
(* BEL="X16/Y4/lc1" *)
SB_DFF  u_dff_p1_25 (
   .C       (i_clk            ),
   .D       (p1_dl[25]    ),
   .Q       (o_data[25]   )
);
(* BEL="X16/Y4/lc2" *)
SB_DFF  u_dff_p1_26 (
   .C       (i_clk            ),
   .D       (p1_dl[26]    ),
   .Q       (o_data[26]   )
);
(* BEL="X16/Y4/lc3" *)
SB_DFF  u_dff_p1_27 (
   .C       (i_clk            ),
   .D       (p1_dl[27]    ),
   .Q       (o_data[27]   )
);
(* BEL="X16/Y4/lc4" *)
SB_DFF  u_dff_p1_28 (
   .C       (i_clk            ),
   .D       (p1_dl[28]    ),
   .Q       (o_data[28]   )
);
(* BEL="X16/Y4/lc5" *)
SB_DFF  u_dff_p1_29 (
   .C       (i_clk            ),
   .D       (p1_dl[29]    ),
   .Q       (o_data[29]   )
);
(* BEL="X16/Y4/lc6" *)
SB_DFF  u_dff_p1_30 (
   .C       (i_clk            ),
   .D       (p1_dl[30]    ),
   .Q       (o_data[30]   )
);
(* BEL="X16/Y4/lc7" *)
SB_DFF  u_dff_p1_31 (
   .C       (i_clk            ),
   .D       (p1_dl[31]    ),
   .Q       (o_data[31]   )
);
endmodule

