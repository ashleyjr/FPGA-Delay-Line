module x_clocked_delay_line #(
   localparam p_length = 16,
   localparam p_clk_hz = 12000000, 
   localparam p_baud   = 115200
)(
   input    logic                         i_clk,
   input    logic                         i_nrst,
   // Delay Line data  
   inout    logic [p_length-1:0]          i_data,
   // UART
   input    logic                         i_uart_rx,
   output   logic                         o_uart_tx
);

   localparam                             p_uart_length = 8;
   localparam                             p_uart_width  = $clog2(p_uart_length);
   localparam                             p_timer_top   = p_clk_hz / p_baud;
   localparam                             p_timer_half  = p_timer_top / 2;
   localparam                             p_timer_width = $clog2(p_timer_top);
   localparam logic [p_timer_width-1:0]   p_timer_cmp   = p_timer_top[p_timer_width-1:0];
   localparam                             p_width       = $clog2(p_length);
   localparam logic [p_width-1:0]         p_cmp         = p_length[p_width-1:0] - {{(p_width-1){1'b0}},1'b1};
   localparam                             p_frame_top   = p_length / p_uart_length;
   localparam                             p_frame_width = $clog2(p_frame_top);
   localparam logic [p_frame_width-1:0]   p_frame_cmp   = p_frame_top[p_frame_width-1:0] - {{(p_frame_width-1){1'b0}},1'b1};
   
   typedef enum logic [3:0] {
      IDLE, START, A0, A1, A2, A3, A4, A5, A6, A7, STOP
   } uart_sm_t;
 
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
   logic [p_length-1:0]                      uart_data_shift;
   logic [p_uart_length-1:0]                 uart_data;

   uart_sm_t                                 uart_sm_d;
   uart_sm_t                                 uart_sm_q;
   logic                                     uart_sm_en; 

   
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
   assign uart_data_shift  = (i_data >> uart_data_offset);  
   assign uart_data        = uart_data_shift[p_uart_length-1:0]; 

   // - SM to drive output data 
   always_comb begin
      uart_sm_d = uart_sm_q + 'd1;
      if(uart_sm_q == STOP) begin
         if(uart_frame_top)   uart_sm_d = IDLE;
         else                 uart_sm_d = START; 
      end
   end

   assign uart_sm_en = (uart_sm_q == IDLE) ? uart_frame_top : uart_timer_top; 
 
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
