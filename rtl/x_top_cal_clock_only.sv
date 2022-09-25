module x_top_cal_clock_only (
   input    logic       i_clk,
   input    logic       i_nrst,
   input    logic       i_uart_rx,
   output   logic       o_uart_tx
); 
   logic          d_clk;
   
   logic          p0_uart_rx;
   logic          p1_uart_rx;
   logic          p2_uart_rx;
   
   logic          done;

   logic          data_en;
   logic [255:0]  data_d;
   logic [255:0]  data_q;

   logic [7:0]    ctrl_d;
   logic [7:0]    ctrl_q;
   logic [255:0]  ctrl; 

   // Inc control at end of each frame

   assign ctrl_d = ctrl_q + 'd1;

   always_ff@(posedge i_clk or negedge i_nrst) begin
      if(!i_nrst)    ctrl_q <= 'd0;
      else if(done)  ctrl_q <= ctrl_d;
   end  

   assign ctrl = (1 << ctrl_q);
   
   x_variable_delay_line u_vdl(
      .i_dl       (i_clk      ),
      .i_ctrl     (ctrl       ),
      .o_dl       (d_clk      )
   );
   
   x_delay_line u_dl(
      .i_clk      (i_clk      ),
      .i_dl       (d_clk      ),
      .o_data     (data_d     )
   );

   // Trigger capture of data
   
   assign p0_uart_rx = i_uart_rx;

   always_ff@(posedge i_clk or negedge i_nrst) begin
      if(!i_nrst) p1_uart_rx <= 'd1;
      else        p1_uart_rx <= p0_uart_rx;
   end
 
   always_ff@(posedge i_clk or negedge i_nrst) begin
      if(!i_nrst) p2_uart_rx <= 'd1;
      else        p2_uart_rx <= p1_uart_rx;
   end 

   assign data_en = ~p1_uart_rx & p2_uart_rx;

   always_ff@(posedge i_clk or negedge i_nrst) begin
      if(!i_nrst)       data_q <= 'd0;
      else if(data_en)  data_q <= data_d;
   end 

   x_uart  #(
      .p_length   (256 + 8          ),
      .p_clk_hz   (12000000         ),
      .p_baud     (115200           )
   ) u_uart (
      .i_clk      (i_clk            ),
      .i_nrst     (i_nrst           ),
      .i_data     ({data_q,ctrl_q}  ),
      .i_uart_rx  (i_uart_rx        ),
      .o_uart_tx  (o_uart_tx        ),
      .o_done     (done             )
   );

endmodule
