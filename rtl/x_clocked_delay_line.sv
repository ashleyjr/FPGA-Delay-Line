module x_clocked_delay_line #(
   localparam p_dl_length = 64,
   localparam p_clk_hz    = 12000000, 
   localparam p_baud      = 115200
)(
   input    logic       i_clk,
   input    logic       i_nrst,
   // Delay Line 
   input    logic       i_dl_rx,
   output   logic       o_dl_tx,
   // UART
   input    logic       i_uart_rx,
   output   logic       o_uart_tx
);

   localparam                             p_uart_length = 8;
   localparam                             p_uart_width  = $clog2(p_uart_length);
   localparam                             p_timer_top   = p_clk_hz / p_baud;
   localparam                             p_timer_half  = p_timer_top / 2;
   localparam                             p_timer_width = $clog2(p_timer_top);
   localparam logic [p_timer_width-1:0]   p_timer_cmp   = p_timer_top[p_timer_width-1:0];
   localparam                             p_dl_width    = $clog2(p_dl_length);
   localparam logic [p_dl_width-1:0]      p_dl_cmp      = p_dl_length[p_dl_width-1:0] - {{(p_dl_width-1){1'b0}},1'b1};
   localparam                             p_frame_top   = p_dl_length / 8;
   localparam                             p_frame_width = $clog2(p_frame_top);
   localparam logic [p_frame_width-1:0]   p_frame_cmp   = p_frame_top[p_frame_width-1:0] - {{(p_frame_width-1){1'b0}},1'b1};
   
   typedef enum logic [3:0] {
      IDLE, START, A0, A1, A2, A3, A4, A5, A6, A7, STOP
   } uart_sm_t;
 
   logic                                     dl_tx_d;
   logic                                     dl_tx_q;
   logic                                     dl_tx_en;
   logic                                     dl_tx_start;
   logic                                     dl_tx_stop;

   logic [p_dl_length-1:0]                   dl_rx_d;
   logic [p_dl_length-1:0]                   dl_rx_q;
   logic                                     dl_rx_en;

   logic [p_dl_width-1:0]                    dl_cnt_d;
   logic [p_dl_width-1:0]                    dl_cnt_q;
   logic                                     dl_cnt_en;
   logic                                     dl_cnt_top;

   logic                                     p0_uart_rx;
   logic                                     p1_uart_rx;
   logic                                     p2_uart_rx;

   logic                                     uart_timer_en;
   logic                                     uart_timer_top;
   logic [p_timer_width-1:0]                 uart_timer_inc; 
   logic [p_timer_width-1:0]                 uart_timer_d;
   logic [p_timer_width-1:0]                 uart_timer_q;

   logic                                     uart_frame_en;
   logic                                     uart_frame_end;
   logic [p_frame_width-1:0]                 uart_frame_inc;
   logic [p_frame_width-1:0]                 uart_frame_d;
   logic [p_frame_width-1:0]                 uart_frame_q;
   logic                                     uart_frame_top;

   logic [(p_frame_width+p_uart_width)-1:0]  uart_data_offset;
   logic [p_dl_length-1:0]                   uart_data_shift;
   logic [p_uart_length-1:0]                 uart_data;

   uart_sm_t                                 uart_sm_d;
   uart_sm_t                                 uart_sm_q;
   logic                                     uart_sm_en;

   ///////////////////////////////////////////////////////////////////
   // Toggle Delay Line TX
   
   assign o_dl_tx     = dl_tx_q;
   assign dl_tx_d     = ~dl_tx_q;
   assign dl_tx_start = (p1_uart_rx & ~p2_uart_rx & (dl_cnt_q == 0) & (uart_sm_q == IDLE)); 
   assign dl_tx_stop  = ((uart_sm_q == STOP) & uart_frame_top & uart_timer_top); 
   assign dl_tx_en    = dl_tx_start | dl_tx_stop;

   always_ff@(posedge i_clk or negedge i_nrst) begin
      if(!i_nrst)       dl_tx_q <= 'd0;
      else if(dl_tx_en) dl_tx_q <= dl_tx_d;
   end
 
   ///////////////////////////////////////////////////////////////////
   // Capture Delay Line RX
     
   assign dl_rx_d  = {dl_rx_q[p_dl_length-2:0], i_dl_rx};
   assign dl_rx_en = dl_cnt_en;

   always_ff@(posedge i_clk or negedge i_nrst) begin
      if(!i_nrst)       dl_rx_q <= 'd0;
      else if(dl_rx_en) dl_rx_q <= dl_rx_d;
   end

   ///////////////////////////////////////////////////////////////////
   // Frame Capture Delay Line RX
    
   assign dl_cnt_en  = (dl_cnt_q != 0) | dl_tx_start;
   assign dl_cnt_top = (dl_cnt_q == p_dl_cmp);
   assign dl_cnt_d   = (dl_cnt_top) ? 'd0 : (dl_cnt_q + 'd1); 

   always_ff@(posedge i_clk or negedge i_nrst) begin
      if(!i_nrst)          dl_cnt_q <= 'd0;
      else if(dl_cnt_en)   dl_cnt_q <= dl_cnt_d;
   end
   
   ///////////////////////////////////////////////////////////////////
   // UART RX Trigger
   //    - The data is unused it just triggers the start
 
   assign p0_uart_rx = i_uart_rx;

   always_ff@(posedge i_clk or negedge i_nrst) begin
      if(!i_nrst) p1_uart_rx <= 'd1;
      else        p1_uart_rx <= p0_uart_rx;
   end
 
   always_ff@(posedge i_clk or negedge i_nrst) begin
      if(!i_nrst) p2_uart_rx <= 'd1;
      else        p2_uart_rx <= p1_uart_rx;
   end 

   ///////////////////////////////////////////////////////////////////
   // UART TX 
 
   // - Bit timer
   assign uart_timer_top = (uart_timer_q == p_timer_cmp);
   assign uart_timer_inc = uart_timer_q + 'd1;
   assign uart_timer_d   = (uart_timer_top) ? 'd0 : uart_timer_inc; 
   assign uart_timer_en  = (uart_sm_q != IDLE);

   always_ff@(posedge i_clk or negedge i_nrst) begin
      if(!i_nrst)             uart_timer_q <= 'd0;
      else if(uart_timer_en)  uart_timer_q <= uart_timer_d;
   end 
   
   // - Count frames 
   assign uart_frame_inc = uart_frame_q + 'd1;
   assign uart_frame_top = (uart_frame_q == p_frame_cmp);
   assign uart_frame_d   = (uart_frame_top) ? 'd0 : uart_frame_inc;
   assign uart_frame_en  = (uart_sm_q == STOP) & uart_timer_top;

   always_ff@(posedge i_clk or negedge i_nrst) begin
      if(!i_nrst)             uart_frame_q <= 0;
      else if(uart_frame_en)  uart_frame_q <= uart_frame_d;
   end
  
   // - Point to frame
   
   assign uart_data_offset = uart_frame_q * p_uart_length;
   assign uart_data_shift  = (dl_rx_q >> uart_data_offset);  
   assign uart_data        = uart_data_shift[7:0]; 

   // - SM to drive output data 
   always_comb begin
      uart_sm_d = uart_sm_q + 'd1;
      if(uart_sm_q == STOP) begin
         if(uart_frame_top)   uart_sm_d = IDLE;
         else                 uart_sm_d = START; 
      end
   end

   assign uart_sm_en = (uart_sm_q == IDLE) ? dl_cnt_top : uart_timer_top; 
 
   always_ff@(posedge i_clk or negedge i_nrst) begin
      if(!i_nrst)          uart_sm_q <= IDLE;
      else if(uart_sm_en)  uart_sm_q <= uart_sm_d;
   end
 
   always_comb begin
      case(uart_sm_q) 
         START:   o_uart_tx = 1'b0;      
         A0:      o_uart_tx = uart_data[0];
         A1:      o_uart_tx = uart_data[1];
         A2:      o_uart_tx = uart_data[2];
         A3:      o_uart_tx = uart_data[3];
         A4:      o_uart_tx = uart_data[4];
         A5:      o_uart_tx = uart_data[5];
         A6:      o_uart_tx = uart_data[6];
         A7:      o_uart_tx = uart_data[7];
         default: o_uart_tx = 1'b1;
      endcase
   end
 

endmodule
