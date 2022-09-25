module x_variable_delay_line (
   input    logic                   i_dl,
   input    logic [256-1:0]    i_ctrl,
   output   logic                   o_dl
);

logic [256:0]   l;

// i_ctrl   in[i+1]     i_dl    |  in[i]
// ---------------------------------------
//    0       0          0      |   0 
//    0       0          1      |   0 
//    0       1          0      |   1 
//    0       1          1      |   1 
//    1       0          0      |   0 
//    1       0          1      |   1 
//    1       1          0      |   0 
//    1       1          1      |   1 

   (* BEL="X1/Y1/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut0 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[1]          ),
      .I1      (l[1]               ),
      .I0      (i_dl                   ),
      .O       (l[0]                 )
   );
   (* BEL="X1/Y1/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut1 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[2]          ),
      .I1      (l[2]               ),
      .I0      (i_dl                   ),
      .O       (l[1]                 )
   );
   (* BEL="X1/Y1/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut2 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[3]          ),
      .I1      (l[3]               ),
      .I0      (i_dl                   ),
      .O       (l[2]                 )
   );
   (* BEL="X1/Y1/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut3 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[4]          ),
      .I1      (l[4]               ),
      .I0      (i_dl                   ),
      .O       (l[3]                 )
   );
   (* BEL="X1/Y1/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut4 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[5]          ),
      .I1      (l[5]               ),
      .I0      (i_dl                   ),
      .O       (l[4]                 )
   );
   (* BEL="X1/Y1/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut5 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[6]          ),
      .I1      (l[6]               ),
      .I0      (i_dl                   ),
      .O       (l[5]                 )
   );
   (* BEL="X1/Y1/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut6 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[7]          ),
      .I1      (l[7]               ),
      .I0      (i_dl                   ),
      .O       (l[6]                 )
   );
   (* BEL="X1/Y1/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut7 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[8]          ),
      .I1      (l[8]               ),
      .I0      (i_dl                   ),
      .O       (l[7]                 )
   );
   (* BEL="X1/Y2/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut8 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[9]          ),
      .I1      (l[9]               ),
      .I0      (i_dl                   ),
      .O       (l[8]                 )
   );
   (* BEL="X1/Y2/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut9 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[10]          ),
      .I1      (l[10]               ),
      .I0      (i_dl                   ),
      .O       (l[9]                 )
   );
   (* BEL="X1/Y2/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut10 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[11]          ),
      .I1      (l[11]               ),
      .I0      (i_dl                   ),
      .O       (l[10]                 )
   );
   (* BEL="X1/Y2/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut11 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[12]          ),
      .I1      (l[12]               ),
      .I0      (i_dl                   ),
      .O       (l[11]                 )
   );
   (* BEL="X1/Y2/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut12 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[13]          ),
      .I1      (l[13]               ),
      .I0      (i_dl                   ),
      .O       (l[12]                 )
   );
   (* BEL="X1/Y2/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut13 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[14]          ),
      .I1      (l[14]               ),
      .I0      (i_dl                   ),
      .O       (l[13]                 )
   );
   (* BEL="X1/Y2/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut14 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[15]          ),
      .I1      (l[15]               ),
      .I0      (i_dl                   ),
      .O       (l[14]                 )
   );
   (* BEL="X1/Y2/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut15 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[16]          ),
      .I1      (l[16]               ),
      .I0      (i_dl                   ),
      .O       (l[15]                 )
   );
   (* BEL="X1/Y3/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut16 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[17]          ),
      .I1      (l[17]               ),
      .I0      (i_dl                   ),
      .O       (l[16]                 )
   );
   (* BEL="X1/Y3/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut17 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[18]          ),
      .I1      (l[18]               ),
      .I0      (i_dl                   ),
      .O       (l[17]                 )
   );
   (* BEL="X1/Y3/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut18 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[19]          ),
      .I1      (l[19]               ),
      .I0      (i_dl                   ),
      .O       (l[18]                 )
   );
   (* BEL="X1/Y3/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut19 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[20]          ),
      .I1      (l[20]               ),
      .I0      (i_dl                   ),
      .O       (l[19]                 )
   );
   (* BEL="X1/Y3/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut20 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[21]          ),
      .I1      (l[21]               ),
      .I0      (i_dl                   ),
      .O       (l[20]                 )
   );
   (* BEL="X1/Y3/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut21 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[22]          ),
      .I1      (l[22]               ),
      .I0      (i_dl                   ),
      .O       (l[21]                 )
   );
   (* BEL="X1/Y3/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut22 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[23]          ),
      .I1      (l[23]               ),
      .I0      (i_dl                   ),
      .O       (l[22]                 )
   );
   (* BEL="X1/Y3/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut23 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[24]          ),
      .I1      (l[24]               ),
      .I0      (i_dl                   ),
      .O       (l[23]                 )
   );
   (* BEL="X1/Y4/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut24 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[25]          ),
      .I1      (l[25]               ),
      .I0      (i_dl                   ),
      .O       (l[24]                 )
   );
   (* BEL="X1/Y4/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut25 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[26]          ),
      .I1      (l[26]               ),
      .I0      (i_dl                   ),
      .O       (l[25]                 )
   );
   (* BEL="X1/Y4/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut26 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[27]          ),
      .I1      (l[27]               ),
      .I0      (i_dl                   ),
      .O       (l[26]                 )
   );
   (* BEL="X1/Y4/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut27 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[28]          ),
      .I1      (l[28]               ),
      .I0      (i_dl                   ),
      .O       (l[27]                 )
   );
   (* BEL="X1/Y4/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut28 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[29]          ),
      .I1      (l[29]               ),
      .I0      (i_dl                   ),
      .O       (l[28]                 )
   );
   (* BEL="X1/Y4/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut29 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[30]          ),
      .I1      (l[30]               ),
      .I0      (i_dl                   ),
      .O       (l[29]                 )
   );
   (* BEL="X1/Y4/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut30 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[31]          ),
      .I1      (l[31]               ),
      .I0      (i_dl                   ),
      .O       (l[30]                 )
   );
   (* BEL="X1/Y4/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut31 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[32]          ),
      .I1      (l[32]               ),
      .I0      (i_dl                   ),
      .O       (l[31]                 )
   );
   (* BEL="X1/Y5/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut32 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[33]          ),
      .I1      (l[33]               ),
      .I0      (i_dl                   ),
      .O       (l[32]                 )
   );
   (* BEL="X1/Y5/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut33 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[34]          ),
      .I1      (l[34]               ),
      .I0      (i_dl                   ),
      .O       (l[33]                 )
   );
   (* BEL="X1/Y5/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut34 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[35]          ),
      .I1      (l[35]               ),
      .I0      (i_dl                   ),
      .O       (l[34]                 )
   );
   (* BEL="X1/Y5/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut35 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[36]          ),
      .I1      (l[36]               ),
      .I0      (i_dl                   ),
      .O       (l[35]                 )
   );
   (* BEL="X1/Y5/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut36 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[37]          ),
      .I1      (l[37]               ),
      .I0      (i_dl                   ),
      .O       (l[36]                 )
   );
   (* BEL="X1/Y5/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut37 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[38]          ),
      .I1      (l[38]               ),
      .I0      (i_dl                   ),
      .O       (l[37]                 )
   );
   (* BEL="X1/Y5/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut38 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[39]          ),
      .I1      (l[39]               ),
      .I0      (i_dl                   ),
      .O       (l[38]                 )
   );
   (* BEL="X1/Y5/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut39 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[40]          ),
      .I1      (l[40]               ),
      .I0      (i_dl                   ),
      .O       (l[39]                 )
   );
   (* BEL="X1/Y6/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut40 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[41]          ),
      .I1      (l[41]               ),
      .I0      (i_dl                   ),
      .O       (l[40]                 )
   );
   (* BEL="X1/Y6/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut41 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[42]          ),
      .I1      (l[42]               ),
      .I0      (i_dl                   ),
      .O       (l[41]                 )
   );
   (* BEL="X1/Y6/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut42 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[43]          ),
      .I1      (l[43]               ),
      .I0      (i_dl                   ),
      .O       (l[42]                 )
   );
   (* BEL="X1/Y6/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut43 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[44]          ),
      .I1      (l[44]               ),
      .I0      (i_dl                   ),
      .O       (l[43]                 )
   );
   (* BEL="X1/Y6/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut44 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[45]          ),
      .I1      (l[45]               ),
      .I0      (i_dl                   ),
      .O       (l[44]                 )
   );
   (* BEL="X1/Y6/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut45 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[46]          ),
      .I1      (l[46]               ),
      .I0      (i_dl                   ),
      .O       (l[45]                 )
   );
   (* BEL="X1/Y6/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut46 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[47]          ),
      .I1      (l[47]               ),
      .I0      (i_dl                   ),
      .O       (l[46]                 )
   );
   (* BEL="X1/Y6/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut47 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[48]          ),
      .I1      (l[48]               ),
      .I0      (i_dl                   ),
      .O       (l[47]                 )
   );
   (* BEL="X1/Y7/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut48 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[49]          ),
      .I1      (l[49]               ),
      .I0      (i_dl                   ),
      .O       (l[48]                 )
   );
   (* BEL="X1/Y7/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut49 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[50]          ),
      .I1      (l[50]               ),
      .I0      (i_dl                   ),
      .O       (l[49]                 )
   );
   (* BEL="X1/Y7/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut50 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[51]          ),
      .I1      (l[51]               ),
      .I0      (i_dl                   ),
      .O       (l[50]                 )
   );
   (* BEL="X1/Y7/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut51 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[52]          ),
      .I1      (l[52]               ),
      .I0      (i_dl                   ),
      .O       (l[51]                 )
   );
   (* BEL="X1/Y7/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut52 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[53]          ),
      .I1      (l[53]               ),
      .I0      (i_dl                   ),
      .O       (l[52]                 )
   );
   (* BEL="X1/Y7/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut53 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[54]          ),
      .I1      (l[54]               ),
      .I0      (i_dl                   ),
      .O       (l[53]                 )
   );
   (* BEL="X1/Y7/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut54 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[55]          ),
      .I1      (l[55]               ),
      .I0      (i_dl                   ),
      .O       (l[54]                 )
   );
   (* BEL="X1/Y7/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut55 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[56]          ),
      .I1      (l[56]               ),
      .I0      (i_dl                   ),
      .O       (l[55]                 )
   );
   (* BEL="X1/Y8/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut56 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[57]          ),
      .I1      (l[57]               ),
      .I0      (i_dl                   ),
      .O       (l[56]                 )
   );
   (* BEL="X1/Y8/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut57 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[58]          ),
      .I1      (l[58]               ),
      .I0      (i_dl                   ),
      .O       (l[57]                 )
   );
   (* BEL="X1/Y8/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut58 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[59]          ),
      .I1      (l[59]               ),
      .I0      (i_dl                   ),
      .O       (l[58]                 )
   );
   (* BEL="X1/Y8/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut59 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[60]          ),
      .I1      (l[60]               ),
      .I0      (i_dl                   ),
      .O       (l[59]                 )
   );
   (* BEL="X1/Y8/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut60 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[61]          ),
      .I1      (l[61]               ),
      .I0      (i_dl                   ),
      .O       (l[60]                 )
   );
   (* BEL="X1/Y8/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut61 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[62]          ),
      .I1      (l[62]               ),
      .I0      (i_dl                   ),
      .O       (l[61]                 )
   );
   (* BEL="X1/Y8/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut62 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[63]          ),
      .I1      (l[63]               ),
      .I0      (i_dl                   ),
      .O       (l[62]                 )
   );
   (* BEL="X1/Y8/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut63 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[64]          ),
      .I1      (l[64]               ),
      .I0      (i_dl                   ),
      .O       (l[63]                 )
   );
   (* BEL="X1/Y9/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut64 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[65]          ),
      .I1      (l[65]               ),
      .I0      (i_dl                   ),
      .O       (l[64]                 )
   );
   (* BEL="X1/Y9/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut65 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[66]          ),
      .I1      (l[66]               ),
      .I0      (i_dl                   ),
      .O       (l[65]                 )
   );
   (* BEL="X1/Y9/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut66 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[67]          ),
      .I1      (l[67]               ),
      .I0      (i_dl                   ),
      .O       (l[66]                 )
   );
   (* BEL="X1/Y9/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut67 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[68]          ),
      .I1      (l[68]               ),
      .I0      (i_dl                   ),
      .O       (l[67]                 )
   );
   (* BEL="X1/Y9/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut68 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[69]          ),
      .I1      (l[69]               ),
      .I0      (i_dl                   ),
      .O       (l[68]                 )
   );
   (* BEL="X1/Y9/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut69 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[70]          ),
      .I1      (l[70]               ),
      .I0      (i_dl                   ),
      .O       (l[69]                 )
   );
   (* BEL="X1/Y9/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut70 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[71]          ),
      .I1      (l[71]               ),
      .I0      (i_dl                   ),
      .O       (l[70]                 )
   );
   (* BEL="X1/Y9/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut71 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[72]          ),
      .I1      (l[72]               ),
      .I0      (i_dl                   ),
      .O       (l[71]                 )
   );
   (* BEL="X1/Y10/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut72 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[73]          ),
      .I1      (l[73]               ),
      .I0      (i_dl                   ),
      .O       (l[72]                 )
   );
   (* BEL="X1/Y10/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut73 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[74]          ),
      .I1      (l[74]               ),
      .I0      (i_dl                   ),
      .O       (l[73]                 )
   );
   (* BEL="X1/Y10/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut74 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[75]          ),
      .I1      (l[75]               ),
      .I0      (i_dl                   ),
      .O       (l[74]                 )
   );
   (* BEL="X1/Y10/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut75 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[76]          ),
      .I1      (l[76]               ),
      .I0      (i_dl                   ),
      .O       (l[75]                 )
   );
   (* BEL="X1/Y10/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut76 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[77]          ),
      .I1      (l[77]               ),
      .I0      (i_dl                   ),
      .O       (l[76]                 )
   );
   (* BEL="X1/Y10/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut77 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[78]          ),
      .I1      (l[78]               ),
      .I0      (i_dl                   ),
      .O       (l[77]                 )
   );
   (* BEL="X1/Y10/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut78 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[79]          ),
      .I1      (l[79]               ),
      .I0      (i_dl                   ),
      .O       (l[78]                 )
   );
   (* BEL="X1/Y10/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut79 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[80]          ),
      .I1      (l[80]               ),
      .I0      (i_dl                   ),
      .O       (l[79]                 )
   );
   (* BEL="X1/Y11/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut80 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[81]          ),
      .I1      (l[81]               ),
      .I0      (i_dl                   ),
      .O       (l[80]                 )
   );
   (* BEL="X1/Y11/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut81 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[82]          ),
      .I1      (l[82]               ),
      .I0      (i_dl                   ),
      .O       (l[81]                 )
   );
   (* BEL="X1/Y11/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut82 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[83]          ),
      .I1      (l[83]               ),
      .I0      (i_dl                   ),
      .O       (l[82]                 )
   );
   (* BEL="X1/Y11/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut83 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[84]          ),
      .I1      (l[84]               ),
      .I0      (i_dl                   ),
      .O       (l[83]                 )
   );
   (* BEL="X1/Y11/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut84 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[85]          ),
      .I1      (l[85]               ),
      .I0      (i_dl                   ),
      .O       (l[84]                 )
   );
   (* BEL="X1/Y11/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut85 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[86]          ),
      .I1      (l[86]               ),
      .I0      (i_dl                   ),
      .O       (l[85]                 )
   );
   (* BEL="X1/Y11/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut86 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[87]          ),
      .I1      (l[87]               ),
      .I0      (i_dl                   ),
      .O       (l[86]                 )
   );
   (* BEL="X1/Y11/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut87 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[88]          ),
      .I1      (l[88]               ),
      .I0      (i_dl                   ),
      .O       (l[87]                 )
   );
   (* BEL="X1/Y12/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut88 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[89]          ),
      .I1      (l[89]               ),
      .I0      (i_dl                   ),
      .O       (l[88]                 )
   );
   (* BEL="X1/Y12/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut89 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[90]          ),
      .I1      (l[90]               ),
      .I0      (i_dl                   ),
      .O       (l[89]                 )
   );
   (* BEL="X1/Y12/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut90 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[91]          ),
      .I1      (l[91]               ),
      .I0      (i_dl                   ),
      .O       (l[90]                 )
   );
   (* BEL="X1/Y12/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut91 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[92]          ),
      .I1      (l[92]               ),
      .I0      (i_dl                   ),
      .O       (l[91]                 )
   );
   (* BEL="X1/Y12/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut92 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[93]          ),
      .I1      (l[93]               ),
      .I0      (i_dl                   ),
      .O       (l[92]                 )
   );
   (* BEL="X1/Y12/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut93 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[94]          ),
      .I1      (l[94]               ),
      .I0      (i_dl                   ),
      .O       (l[93]                 )
   );
   (* BEL="X1/Y12/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut94 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[95]          ),
      .I1      (l[95]               ),
      .I0      (i_dl                   ),
      .O       (l[94]                 )
   );
   (* BEL="X1/Y12/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut95 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[96]          ),
      .I1      (l[96]               ),
      .I0      (i_dl                   ),
      .O       (l[95]                 )
   );
   (* BEL="X1/Y13/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut96 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[97]          ),
      .I1      (l[97]               ),
      .I0      (i_dl                   ),
      .O       (l[96]                 )
   );
   (* BEL="X1/Y13/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut97 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[98]          ),
      .I1      (l[98]               ),
      .I0      (i_dl                   ),
      .O       (l[97]                 )
   );
   (* BEL="X1/Y13/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut98 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[99]          ),
      .I1      (l[99]               ),
      .I0      (i_dl                   ),
      .O       (l[98]                 )
   );
   (* BEL="X1/Y13/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut99 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[100]          ),
      .I1      (l[100]               ),
      .I0      (i_dl                   ),
      .O       (l[99]                 )
   );
   (* BEL="X1/Y13/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut100 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[101]          ),
      .I1      (l[101]               ),
      .I0      (i_dl                   ),
      .O       (l[100]                 )
   );
   (* BEL="X1/Y13/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut101 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[102]          ),
      .I1      (l[102]               ),
      .I0      (i_dl                   ),
      .O       (l[101]                 )
   );
   (* BEL="X1/Y13/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut102 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[103]          ),
      .I1      (l[103]               ),
      .I0      (i_dl                   ),
      .O       (l[102]                 )
   );
   (* BEL="X1/Y13/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut103 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[104]          ),
      .I1      (l[104]               ),
      .I0      (i_dl                   ),
      .O       (l[103]                 )
   );
   (* BEL="X1/Y14/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut104 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[105]          ),
      .I1      (l[105]               ),
      .I0      (i_dl                   ),
      .O       (l[104]                 )
   );
   (* BEL="X1/Y14/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut105 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[106]          ),
      .I1      (l[106]               ),
      .I0      (i_dl                   ),
      .O       (l[105]                 )
   );
   (* BEL="X1/Y14/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut106 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[107]          ),
      .I1      (l[107]               ),
      .I0      (i_dl                   ),
      .O       (l[106]                 )
   );
   (* BEL="X1/Y14/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut107 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[108]          ),
      .I1      (l[108]               ),
      .I0      (i_dl                   ),
      .O       (l[107]                 )
   );
   (* BEL="X1/Y14/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut108 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[109]          ),
      .I1      (l[109]               ),
      .I0      (i_dl                   ),
      .O       (l[108]                 )
   );
   (* BEL="X1/Y14/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut109 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[110]          ),
      .I1      (l[110]               ),
      .I0      (i_dl                   ),
      .O       (l[109]                 )
   );
   (* BEL="X1/Y14/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut110 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[111]          ),
      .I1      (l[111]               ),
      .I0      (i_dl                   ),
      .O       (l[110]                 )
   );
   (* BEL="X1/Y14/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut111 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[112]          ),
      .I1      (l[112]               ),
      .I0      (i_dl                   ),
      .O       (l[111]                 )
   );
   (* BEL="X1/Y15/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut112 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[113]          ),
      .I1      (l[113]               ),
      .I0      (i_dl                   ),
      .O       (l[112]                 )
   );
   (* BEL="X1/Y15/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut113 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[114]          ),
      .I1      (l[114]               ),
      .I0      (i_dl                   ),
      .O       (l[113]                 )
   );
   (* BEL="X1/Y15/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut114 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[115]          ),
      .I1      (l[115]               ),
      .I0      (i_dl                   ),
      .O       (l[114]                 )
   );
   (* BEL="X1/Y15/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut115 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[116]          ),
      .I1      (l[116]               ),
      .I0      (i_dl                   ),
      .O       (l[115]                 )
   );
   (* BEL="X1/Y15/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut116 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[117]          ),
      .I1      (l[117]               ),
      .I0      (i_dl                   ),
      .O       (l[116]                 )
   );
   (* BEL="X1/Y15/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut117 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[118]          ),
      .I1      (l[118]               ),
      .I0      (i_dl                   ),
      .O       (l[117]                 )
   );
   (* BEL="X1/Y15/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut118 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[119]          ),
      .I1      (l[119]               ),
      .I0      (i_dl                   ),
      .O       (l[118]                 )
   );
   (* BEL="X1/Y15/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut119 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[120]          ),
      .I1      (l[120]               ),
      .I0      (i_dl                   ),
      .O       (l[119]                 )
   );
   (* BEL="X1/Y16/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut120 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[121]          ),
      .I1      (l[121]               ),
      .I0      (i_dl                   ),
      .O       (l[120]                 )
   );
   (* BEL="X1/Y16/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut121 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[122]          ),
      .I1      (l[122]               ),
      .I0      (i_dl                   ),
      .O       (l[121]                 )
   );
   (* BEL="X1/Y16/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut122 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[123]          ),
      .I1      (l[123]               ),
      .I0      (i_dl                   ),
      .O       (l[122]                 )
   );
   (* BEL="X1/Y16/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut123 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[124]          ),
      .I1      (l[124]               ),
      .I0      (i_dl                   ),
      .O       (l[123]                 )
   );
   (* BEL="X1/Y16/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut124 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[125]          ),
      .I1      (l[125]               ),
      .I0      (i_dl                   ),
      .O       (l[124]                 )
   );
   (* BEL="X1/Y16/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut125 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[126]          ),
      .I1      (l[126]               ),
      .I0      (i_dl                   ),
      .O       (l[125]                 )
   );
   (* BEL="X1/Y16/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut126 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[127]          ),
      .I1      (l[127]               ),
      .I0      (i_dl                   ),
      .O       (l[126]                 )
   );
   (* BEL="X1/Y16/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut127 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[128]          ),
      .I1      (l[128]               ),
      .I0      (i_dl                   ),
      .O       (l[127]                 )
   );
   (* BEL="X1/Y17/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut128 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[129]          ),
      .I1      (l[129]               ),
      .I0      (i_dl                   ),
      .O       (l[128]                 )
   );
   (* BEL="X1/Y17/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut129 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[130]          ),
      .I1      (l[130]               ),
      .I0      (i_dl                   ),
      .O       (l[129]                 )
   );
   (* BEL="X1/Y17/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut130 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[131]          ),
      .I1      (l[131]               ),
      .I0      (i_dl                   ),
      .O       (l[130]                 )
   );
   (* BEL="X1/Y17/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut131 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[132]          ),
      .I1      (l[132]               ),
      .I0      (i_dl                   ),
      .O       (l[131]                 )
   );
   (* BEL="X1/Y17/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut132 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[133]          ),
      .I1      (l[133]               ),
      .I0      (i_dl                   ),
      .O       (l[132]                 )
   );
   (* BEL="X1/Y17/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut133 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[134]          ),
      .I1      (l[134]               ),
      .I0      (i_dl                   ),
      .O       (l[133]                 )
   );
   (* BEL="X1/Y17/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut134 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[135]          ),
      .I1      (l[135]               ),
      .I0      (i_dl                   ),
      .O       (l[134]                 )
   );
   (* BEL="X1/Y17/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut135 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[136]          ),
      .I1      (l[136]               ),
      .I0      (i_dl                   ),
      .O       (l[135]                 )
   );
   (* BEL="X1/Y18/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut136 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[137]          ),
      .I1      (l[137]               ),
      .I0      (i_dl                   ),
      .O       (l[136]                 )
   );
   (* BEL="X1/Y18/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut137 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[138]          ),
      .I1      (l[138]               ),
      .I0      (i_dl                   ),
      .O       (l[137]                 )
   );
   (* BEL="X1/Y18/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut138 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[139]          ),
      .I1      (l[139]               ),
      .I0      (i_dl                   ),
      .O       (l[138]                 )
   );
   (* BEL="X1/Y18/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut139 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[140]          ),
      .I1      (l[140]               ),
      .I0      (i_dl                   ),
      .O       (l[139]                 )
   );
   (* BEL="X1/Y18/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut140 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[141]          ),
      .I1      (l[141]               ),
      .I0      (i_dl                   ),
      .O       (l[140]                 )
   );
   (* BEL="X1/Y18/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut141 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[142]          ),
      .I1      (l[142]               ),
      .I0      (i_dl                   ),
      .O       (l[141]                 )
   );
   (* BEL="X1/Y18/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut142 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[143]          ),
      .I1      (l[143]               ),
      .I0      (i_dl                   ),
      .O       (l[142]                 )
   );
   (* BEL="X1/Y18/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut143 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[144]          ),
      .I1      (l[144]               ),
      .I0      (i_dl                   ),
      .O       (l[143]                 )
   );
   (* BEL="X1/Y19/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut144 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[145]          ),
      .I1      (l[145]               ),
      .I0      (i_dl                   ),
      .O       (l[144]                 )
   );
   (* BEL="X1/Y19/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut145 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[146]          ),
      .I1      (l[146]               ),
      .I0      (i_dl                   ),
      .O       (l[145]                 )
   );
   (* BEL="X1/Y19/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut146 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[147]          ),
      .I1      (l[147]               ),
      .I0      (i_dl                   ),
      .O       (l[146]                 )
   );
   (* BEL="X1/Y19/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut147 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[148]          ),
      .I1      (l[148]               ),
      .I0      (i_dl                   ),
      .O       (l[147]                 )
   );
   (* BEL="X1/Y19/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut148 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[149]          ),
      .I1      (l[149]               ),
      .I0      (i_dl                   ),
      .O       (l[148]                 )
   );
   (* BEL="X1/Y19/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut149 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[150]          ),
      .I1      (l[150]               ),
      .I0      (i_dl                   ),
      .O       (l[149]                 )
   );
   (* BEL="X1/Y19/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut150 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[151]          ),
      .I1      (l[151]               ),
      .I0      (i_dl                   ),
      .O       (l[150]                 )
   );
   (* BEL="X1/Y19/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut151 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[152]          ),
      .I1      (l[152]               ),
      .I0      (i_dl                   ),
      .O       (l[151]                 )
   );
   (* BEL="X1/Y20/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut152 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[153]          ),
      .I1      (l[153]               ),
      .I0      (i_dl                   ),
      .O       (l[152]                 )
   );
   (* BEL="X1/Y20/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut153 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[154]          ),
      .I1      (l[154]               ),
      .I0      (i_dl                   ),
      .O       (l[153]                 )
   );
   (* BEL="X1/Y20/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut154 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[155]          ),
      .I1      (l[155]               ),
      .I0      (i_dl                   ),
      .O       (l[154]                 )
   );
   (* BEL="X1/Y20/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut155 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[156]          ),
      .I1      (l[156]               ),
      .I0      (i_dl                   ),
      .O       (l[155]                 )
   );
   (* BEL="X1/Y20/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut156 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[157]          ),
      .I1      (l[157]               ),
      .I0      (i_dl                   ),
      .O       (l[156]                 )
   );
   (* BEL="X1/Y20/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut157 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[158]          ),
      .I1      (l[158]               ),
      .I0      (i_dl                   ),
      .O       (l[157]                 )
   );
   (* BEL="X1/Y20/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut158 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[159]          ),
      .I1      (l[159]               ),
      .I0      (i_dl                   ),
      .O       (l[158]                 )
   );
   (* BEL="X1/Y20/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut159 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[160]          ),
      .I1      (l[160]               ),
      .I0      (i_dl                   ),
      .O       (l[159]                 )
   );
   (* BEL="X1/Y21/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut160 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[161]          ),
      .I1      (l[161]               ),
      .I0      (i_dl                   ),
      .O       (l[160]                 )
   );
   (* BEL="X1/Y21/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut161 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[162]          ),
      .I1      (l[162]               ),
      .I0      (i_dl                   ),
      .O       (l[161]                 )
   );
   (* BEL="X1/Y21/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut162 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[163]          ),
      .I1      (l[163]               ),
      .I0      (i_dl                   ),
      .O       (l[162]                 )
   );
   (* BEL="X1/Y21/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut163 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[164]          ),
      .I1      (l[164]               ),
      .I0      (i_dl                   ),
      .O       (l[163]                 )
   );
   (* BEL="X1/Y21/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut164 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[165]          ),
      .I1      (l[165]               ),
      .I0      (i_dl                   ),
      .O       (l[164]                 )
   );
   (* BEL="X1/Y21/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut165 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[166]          ),
      .I1      (l[166]               ),
      .I0      (i_dl                   ),
      .O       (l[165]                 )
   );
   (* BEL="X1/Y21/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut166 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[167]          ),
      .I1      (l[167]               ),
      .I0      (i_dl                   ),
      .O       (l[166]                 )
   );
   (* BEL="X1/Y21/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut167 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[168]          ),
      .I1      (l[168]               ),
      .I0      (i_dl                   ),
      .O       (l[167]                 )
   );
   (* BEL="X1/Y22/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut168 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[169]          ),
      .I1      (l[169]               ),
      .I0      (i_dl                   ),
      .O       (l[168]                 )
   );
   (* BEL="X1/Y22/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut169 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[170]          ),
      .I1      (l[170]               ),
      .I0      (i_dl                   ),
      .O       (l[169]                 )
   );
   (* BEL="X1/Y22/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut170 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[171]          ),
      .I1      (l[171]               ),
      .I0      (i_dl                   ),
      .O       (l[170]                 )
   );
   (* BEL="X1/Y22/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut171 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[172]          ),
      .I1      (l[172]               ),
      .I0      (i_dl                   ),
      .O       (l[171]                 )
   );
   (* BEL="X1/Y22/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut172 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[173]          ),
      .I1      (l[173]               ),
      .I0      (i_dl                   ),
      .O       (l[172]                 )
   );
   (* BEL="X1/Y22/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut173 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[174]          ),
      .I1      (l[174]               ),
      .I0      (i_dl                   ),
      .O       (l[173]                 )
   );
   (* BEL="X1/Y22/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut174 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[175]          ),
      .I1      (l[175]               ),
      .I0      (i_dl                   ),
      .O       (l[174]                 )
   );
   (* BEL="X1/Y22/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut175 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[176]          ),
      .I1      (l[176]               ),
      .I0      (i_dl                   ),
      .O       (l[175]                 )
   );
   (* BEL="X1/Y23/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut176 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[177]          ),
      .I1      (l[177]               ),
      .I0      (i_dl                   ),
      .O       (l[176]                 )
   );
   (* BEL="X1/Y23/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut177 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[178]          ),
      .I1      (l[178]               ),
      .I0      (i_dl                   ),
      .O       (l[177]                 )
   );
   (* BEL="X1/Y23/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut178 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[179]          ),
      .I1      (l[179]               ),
      .I0      (i_dl                   ),
      .O       (l[178]                 )
   );
   (* BEL="X1/Y23/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut179 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[180]          ),
      .I1      (l[180]               ),
      .I0      (i_dl                   ),
      .O       (l[179]                 )
   );
   (* BEL="X1/Y23/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut180 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[181]          ),
      .I1      (l[181]               ),
      .I0      (i_dl                   ),
      .O       (l[180]                 )
   );
   (* BEL="X1/Y23/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut181 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[182]          ),
      .I1      (l[182]               ),
      .I0      (i_dl                   ),
      .O       (l[181]                 )
   );
   (* BEL="X1/Y23/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut182 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[183]          ),
      .I1      (l[183]               ),
      .I0      (i_dl                   ),
      .O       (l[182]                 )
   );
   (* BEL="X1/Y23/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut183 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[184]          ),
      .I1      (l[184]               ),
      .I0      (i_dl                   ),
      .O       (l[183]                 )
   );
   (* BEL="X1/Y24/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut184 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[185]          ),
      .I1      (l[185]               ),
      .I0      (i_dl                   ),
      .O       (l[184]                 )
   );
   (* BEL="X1/Y24/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut185 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[186]          ),
      .I1      (l[186]               ),
      .I0      (i_dl                   ),
      .O       (l[185]                 )
   );
   (* BEL="X1/Y24/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut186 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[187]          ),
      .I1      (l[187]               ),
      .I0      (i_dl                   ),
      .O       (l[186]                 )
   );
   (* BEL="X1/Y24/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut187 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[188]          ),
      .I1      (l[188]               ),
      .I0      (i_dl                   ),
      .O       (l[187]                 )
   );
   (* BEL="X1/Y24/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut188 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[189]          ),
      .I1      (l[189]               ),
      .I0      (i_dl                   ),
      .O       (l[188]                 )
   );
   (* BEL="X1/Y24/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut189 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[190]          ),
      .I1      (l[190]               ),
      .I0      (i_dl                   ),
      .O       (l[189]                 )
   );
   (* BEL="X1/Y24/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut190 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[191]          ),
      .I1      (l[191]               ),
      .I0      (i_dl                   ),
      .O       (l[190]                 )
   );
   (* BEL="X1/Y24/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut191 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[192]          ),
      .I1      (l[192]               ),
      .I0      (i_dl                   ),
      .O       (l[191]                 )
   );
   (* BEL="X1/Y25/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut192 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[193]          ),
      .I1      (l[193]               ),
      .I0      (i_dl                   ),
      .O       (l[192]                 )
   );
   (* BEL="X1/Y25/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut193 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[194]          ),
      .I1      (l[194]               ),
      .I0      (i_dl                   ),
      .O       (l[193]                 )
   );
   (* BEL="X1/Y25/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut194 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[195]          ),
      .I1      (l[195]               ),
      .I0      (i_dl                   ),
      .O       (l[194]                 )
   );
   (* BEL="X1/Y25/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut195 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[196]          ),
      .I1      (l[196]               ),
      .I0      (i_dl                   ),
      .O       (l[195]                 )
   );
   (* BEL="X1/Y25/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut196 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[197]          ),
      .I1      (l[197]               ),
      .I0      (i_dl                   ),
      .O       (l[196]                 )
   );
   (* BEL="X1/Y25/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut197 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[198]          ),
      .I1      (l[198]               ),
      .I0      (i_dl                   ),
      .O       (l[197]                 )
   );
   (* BEL="X1/Y25/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut198 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[199]          ),
      .I1      (l[199]               ),
      .I0      (i_dl                   ),
      .O       (l[198]                 )
   );
   (* BEL="X1/Y25/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut199 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[200]          ),
      .I1      (l[200]               ),
      .I0      (i_dl                   ),
      .O       (l[199]                 )
   );
   (* BEL="X1/Y26/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut200 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[201]          ),
      .I1      (l[201]               ),
      .I0      (i_dl                   ),
      .O       (l[200]                 )
   );
   (* BEL="X1/Y26/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut201 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[202]          ),
      .I1      (l[202]               ),
      .I0      (i_dl                   ),
      .O       (l[201]                 )
   );
   (* BEL="X1/Y26/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut202 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[203]          ),
      .I1      (l[203]               ),
      .I0      (i_dl                   ),
      .O       (l[202]                 )
   );
   (* BEL="X1/Y26/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut203 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[204]          ),
      .I1      (l[204]               ),
      .I0      (i_dl                   ),
      .O       (l[203]                 )
   );
   (* BEL="X1/Y26/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut204 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[205]          ),
      .I1      (l[205]               ),
      .I0      (i_dl                   ),
      .O       (l[204]                 )
   );
   (* BEL="X1/Y26/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut205 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[206]          ),
      .I1      (l[206]               ),
      .I0      (i_dl                   ),
      .O       (l[205]                 )
   );
   (* BEL="X1/Y26/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut206 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[207]          ),
      .I1      (l[207]               ),
      .I0      (i_dl                   ),
      .O       (l[206]                 )
   );
   (* BEL="X1/Y26/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut207 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[208]          ),
      .I1      (l[208]               ),
      .I0      (i_dl                   ),
      .O       (l[207]                 )
   );
   (* BEL="X1/Y27/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut208 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[209]          ),
      .I1      (l[209]               ),
      .I0      (i_dl                   ),
      .O       (l[208]                 )
   );
   (* BEL="X1/Y27/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut209 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[210]          ),
      .I1      (l[210]               ),
      .I0      (i_dl                   ),
      .O       (l[209]                 )
   );
   (* BEL="X1/Y27/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut210 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[211]          ),
      .I1      (l[211]               ),
      .I0      (i_dl                   ),
      .O       (l[210]                 )
   );
   (* BEL="X1/Y27/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut211 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[212]          ),
      .I1      (l[212]               ),
      .I0      (i_dl                   ),
      .O       (l[211]                 )
   );
   (* BEL="X1/Y27/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut212 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[213]          ),
      .I1      (l[213]               ),
      .I0      (i_dl                   ),
      .O       (l[212]                 )
   );
   (* BEL="X1/Y27/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut213 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[214]          ),
      .I1      (l[214]               ),
      .I0      (i_dl                   ),
      .O       (l[213]                 )
   );
   (* BEL="X1/Y27/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut214 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[215]          ),
      .I1      (l[215]               ),
      .I0      (i_dl                   ),
      .O       (l[214]                 )
   );
   (* BEL="X1/Y27/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut215 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[216]          ),
      .I1      (l[216]               ),
      .I0      (i_dl                   ),
      .O       (l[215]                 )
   );
   (* BEL="X1/Y28/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut216 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[217]          ),
      .I1      (l[217]               ),
      .I0      (i_dl                   ),
      .O       (l[216]                 )
   );
   (* BEL="X1/Y28/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut217 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[218]          ),
      .I1      (l[218]               ),
      .I0      (i_dl                   ),
      .O       (l[217]                 )
   );
   (* BEL="X1/Y28/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut218 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[219]          ),
      .I1      (l[219]               ),
      .I0      (i_dl                   ),
      .O       (l[218]                 )
   );
   (* BEL="X1/Y28/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut219 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[220]          ),
      .I1      (l[220]               ),
      .I0      (i_dl                   ),
      .O       (l[219]                 )
   );
   (* BEL="X1/Y28/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut220 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[221]          ),
      .I1      (l[221]               ),
      .I0      (i_dl                   ),
      .O       (l[220]                 )
   );
   (* BEL="X1/Y28/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut221 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[222]          ),
      .I1      (l[222]               ),
      .I0      (i_dl                   ),
      .O       (l[221]                 )
   );
   (* BEL="X1/Y28/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut222 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[223]          ),
      .I1      (l[223]               ),
      .I0      (i_dl                   ),
      .O       (l[222]                 )
   );
   (* BEL="X1/Y28/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut223 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[224]          ),
      .I1      (l[224]               ),
      .I0      (i_dl                   ),
      .O       (l[223]                 )
   );
   (* BEL="X1/Y29/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut224 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[225]          ),
      .I1      (l[225]               ),
      .I0      (i_dl                   ),
      .O       (l[224]                 )
   );
   (* BEL="X1/Y29/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut225 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[226]          ),
      .I1      (l[226]               ),
      .I0      (i_dl                   ),
      .O       (l[225]                 )
   );
   (* BEL="X1/Y29/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut226 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[227]          ),
      .I1      (l[227]               ),
      .I0      (i_dl                   ),
      .O       (l[226]                 )
   );
   (* BEL="X1/Y29/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut227 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[228]          ),
      .I1      (l[228]               ),
      .I0      (i_dl                   ),
      .O       (l[227]                 )
   );
   (* BEL="X1/Y29/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut228 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[229]          ),
      .I1      (l[229]               ),
      .I0      (i_dl                   ),
      .O       (l[228]                 )
   );
   (* BEL="X1/Y29/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut229 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[230]          ),
      .I1      (l[230]               ),
      .I0      (i_dl                   ),
      .O       (l[229]                 )
   );
   (* BEL="X1/Y29/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut230 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[231]          ),
      .I1      (l[231]               ),
      .I0      (i_dl                   ),
      .O       (l[230]                 )
   );
   (* BEL="X1/Y29/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut231 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[232]          ),
      .I1      (l[232]               ),
      .I0      (i_dl                   ),
      .O       (l[231]                 )
   );
   (* BEL="X1/Y30/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut232 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[233]          ),
      .I1      (l[233]               ),
      .I0      (i_dl                   ),
      .O       (l[232]                 )
   );
   (* BEL="X1/Y30/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut233 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[234]          ),
      .I1      (l[234]               ),
      .I0      (i_dl                   ),
      .O       (l[233]                 )
   );
   (* BEL="X1/Y30/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut234 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[235]          ),
      .I1      (l[235]               ),
      .I0      (i_dl                   ),
      .O       (l[234]                 )
   );
   (* BEL="X1/Y30/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut235 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[236]          ),
      .I1      (l[236]               ),
      .I0      (i_dl                   ),
      .O       (l[235]                 )
   );
   (* BEL="X1/Y30/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut236 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[237]          ),
      .I1      (l[237]               ),
      .I0      (i_dl                   ),
      .O       (l[236]                 )
   );
   (* BEL="X1/Y30/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut237 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[238]          ),
      .I1      (l[238]               ),
      .I0      (i_dl                   ),
      .O       (l[237]                 )
   );
   (* BEL="X1/Y30/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut238 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[239]          ),
      .I1      (l[239]               ),
      .I0      (i_dl                   ),
      .O       (l[238]                 )
   );
   (* BEL="X1/Y30/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut239 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[240]          ),
      .I1      (l[240]               ),
      .I0      (i_dl                   ),
      .O       (l[239]                 )
   );
   (* BEL="X1/Y31/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut240 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[241]          ),
      .I1      (l[241]               ),
      .I0      (i_dl                   ),
      .O       (l[240]                 )
   );
   (* BEL="X1/Y31/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut241 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[242]          ),
      .I1      (l[242]               ),
      .I0      (i_dl                   ),
      .O       (l[241]                 )
   );
   (* BEL="X1/Y31/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut242 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[243]          ),
      .I1      (l[243]               ),
      .I0      (i_dl                   ),
      .O       (l[242]                 )
   );
   (* BEL="X1/Y31/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut243 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[244]          ),
      .I1      (l[244]               ),
      .I0      (i_dl                   ),
      .O       (l[243]                 )
   );
   (* BEL="X1/Y31/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut244 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[245]          ),
      .I1      (l[245]               ),
      .I0      (i_dl                   ),
      .O       (l[244]                 )
   );
   (* BEL="X1/Y31/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut245 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[246]          ),
      .I1      (l[246]               ),
      .I0      (i_dl                   ),
      .O       (l[245]                 )
   );
   (* BEL="X1/Y31/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut246 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[247]          ),
      .I1      (l[247]               ),
      .I0      (i_dl                   ),
      .O       (l[246]                 )
   );
   (* BEL="X1/Y31/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut247 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[248]          ),
      .I1      (l[248]               ),
      .I0      (i_dl                   ),
      .O       (l[247]                 )
   );
   (* BEL="X1/Y32/lc0" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut248 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[249]          ),
      .I1      (l[249]               ),
      .I0      (i_dl                   ),
      .O       (l[248]                 )
   );
   (* BEL="X1/Y32/lc1" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut249 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[250]          ),
      .I1      (l[250]               ),
      .I0      (i_dl                   ),
      .O       (l[249]                 )
   );
   (* BEL="X1/Y32/lc2" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut250 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[251]          ),
      .I1      (l[251]               ),
      .I0      (i_dl                   ),
      .O       (l[250]                 )
   );
   (* BEL="X1/Y32/lc3" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut251 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[252]          ),
      .I1      (l[252]               ),
      .I0      (i_dl                   ),
      .O       (l[251]                 )
   );
   (* BEL="X1/Y32/lc4" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut252 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[253]          ),
      .I1      (l[253]               ),
      .I0      (i_dl                   ),
      .O       (l[252]                 )
   );
   (* BEL="X1/Y32/lc5" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut253 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[254]          ),
      .I1      (l[254]               ),
      .I0      (i_dl                   ),
      .O       (l[253]                 )
   );
   (* BEL="X1/Y32/lc6" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut254 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[255]          ),
      .I1      (l[255]               ),
      .I0      (i_dl                   ),
      .O       (l[254]                 )
   );
   (* BEL="X1/Y32/lc7" *)
   SB_LUT4 #(
      .LUT_INIT(16'b0000000010101100   )
   ) u_in_lut255 (
      .I3      (1'b0                   ),
      .I2      (i_ctrl[256]          ),
      .I1      (l[256]               ),
      .I0      (i_dl                   ),
      .O       (l[255]                 )
   );

assign o_dl = l[0];

endmodule

