module x_driver (
   input    logic    i_clk,
   input    logic    i_rst,
   input    logic    i_rx,
   output   logic    o_tx, 
   output   logic    o_data_0,  
   output   logic    o_data_1,
   output   logic    o_data_2,
   output   logic    o_data_3,
   output   logic    o_data_4,
   output   logic    o_data_5,
   output   logic    o_data_6,
   output   logic    o_data_7,
   output   logic    o_data_8,
   output   logic    o_data_9,
   output   logic    o_data_10, 
   output   logic    o_data_11,
   output   logic    o_data_12,
   output   logic    o_data_13,
   output   logic    o_data_14,
   output   logic    o_data_15,
   output   logic    o_data_16,
   output   logic    o_data_17,
   output   logic    o_data_18,
   output   logic    o_data_19,
   output   logic    o_data_20,
   output   logic    o_data_21,
   output   logic    o_data_22,
   output   logic    o_data_23,
   output   logic    o_data_24
); 

   logic        clk;
   logic [31:0] data;
   
   // 12MHz > 48MHz
   SB_PLL40_CORE #(
      .FEEDBACK_PATH ("SIMPLE"   ),
      .PLLOUT_SELECT ("GENCLK"   ),
      .DIVR          (4'd0       ),
      .DIVF          (7'd63      ),
      .DIVQ          (3'd4       ),
      .FILTER_RANGE  (3'b001     )
   ) u_sb_pll40_core (
      .LOCK          (           ),
      .RESETB        (~i_rst     ),
      .BYPASS        (1'b0       ),
      .REFERENCECLK  (i_clk      ),
      .PLLOUTCORE    (clk        )
   );

   x_testbench#( 
      .p_clk_hz   (48000000)
   )u_testbench(
      .i_clk   (clk     ),
      .i_rst   (i_rst   ),
      .i_rx    (i_rx    ),
      .o_tx    (o_tx    ),
      .o_data  (data    ),
      .i_data  (data    )
   );


   assign o_data_0 = data[0];
   assign o_data_1 = data[1];
   assign o_data_2 = data[2];
   assign o_data_3 = data[3];
   assign o_data_4 = data[4];
   assign o_data_5 = data[5];
   assign o_data_6 = data[6];
   assign o_data_7 = data[7];
   assign o_data_8 = data[8];
   assign o_data_9 = data[9];
   assign o_data_10 = data[10];
   assign o_data_11 = data[11];
   assign o_data_12 = data[12];
   assign o_data_13 = data[13];
   assign o_data_14 = data[14];
   assign o_data_15 = data[15];
   assign o_data_16 = data[16];
   assign o_data_17 = data[17];
   assign o_data_18 = data[18];
   assign o_data_19 = data[19];
   assign o_data_20 = data[20];
   assign o_data_21 = data[21];
   assign o_data_22 = data[22];
   assign o_data_23 = data[23];
   assign o_data_24 = data[24];
   
endmodule

