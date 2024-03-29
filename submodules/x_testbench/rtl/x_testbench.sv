module x_testbench#(
   p_clk_hz = 12000000 
)(
   // Infra
   input    logic          i_clk,
   input    logic          i_rst,
   input    logic          i_rx,
   output   logic          o_tx,
   // DUT   
   input    logic [31:0]   i_data,
   output   logic [31:0]   o_data
);

   logic          rx_valid;
   logic [7:0]    rx_data;

   logic          des_valid;
   logic          des_accept;
   logic [7:0]    des_cmd;
   logic [63:0]   des_data;

   logic          seq_start;
   logic          seq_busy;
   logic          seq_wen;
   logic [3:0]    seq_wcmd;
   logic [35:0]   seq_wdata;
   logic [8:0]    seq_waddr;
   logic [35:0]   seq_rdata;

   logic          scope_start;
   logic          scope_busy;
   logic [31:0]   scope_wdata;
   logic          scope_ren;
   logic [10:0]   scope_raddr;
   logic [31:0]   scope_rdata;

   logic [7:0]    tx_data;
   logic          tx_valid_d;
   logic          tx_valid_q;
   logic          tx_accept;

   logic [2:0]    mux_d;
   logic [2:0]    mux_q;

   logic [31:0]   loopback_d;
   logic [31:0]   loopback_q;

   x_uart_rx #(
      .p_clk_hz   (p_clk_hz      )
   ) u_rx (
      .i_clk      (i_clk         ),
      .i_rst      (i_rst         ),
      .i_rx       (i_rx          ),
      .o_valid    (rx_valid      ),    
      .o_data     (rx_data       )
   );
 
   x_byte_des u_des (
      .i_clk      (i_clk         ),
      .i_rst      (i_rst         ),
      .i_valid    (des_valid     ),
      .o_accept   (des_accept    ),    
      .i_cmd      (des_cmd       ),
      .o_data     (des_data      )
   ); 

   x_micro_sequencer u_seq (
      .i_clk      (i_clk         ),
      .i_rst      (i_rst         ),
      .i_start    (seq_start     ),
      .o_busy     (seq_busy      ),
      .i_wen      (seq_wen       ),
      .i_wcmd     (seq_wcmd      ),  
      .i_wdata    (seq_wdata     ),
      .i_waddr    (seq_waddr     ), 
      .o_data     (seq_rdata     )
   );
  
   assign o_data      = seq_rdata[31:0];
   assign scope_wdata = i_data; 

   x_micro_scope u_scope (
      .i_clk      (i_clk         ),
      .i_rst      (i_rst         ),
      .i_start    (scope_start   ),
      .o_busy     (scope_busy    ),
      .i_data     (scope_wdata   ),
      .i_ren      (scope_ren     ),  
      .i_raddr    (scope_raddr   ), 
      .o_data     (scope_rdata   )
   );

   x_uart_tx #(
      .p_clk_hz   (p_clk_hz      )
   ) u_tx (
      .i_clk      (i_clk         ),
      .i_rst      (i_rst         ), 
      .i_data     (tx_data       ),
      .o_tx       (o_tx          ),
      .i_valid    (tx_valid_q    ),
      .o_accept   (tx_accept     )
   );
 
   // Wiring
   assign des_valid = rx_valid;
   assign des_cmd   = rx_data;

   assign seq_wdata = {4'b0000, des_data[31:0]};
   assign seq_wcmd  = des_data[35:32];
   assign seq_start = des_data[36];
   assign seq_wen   = des_data[37];
   assign seq_waddr = des_data[46:38];
    
   assign scope_start = des_data[47];
   assign scope_ren   = des_data[48];
   assign scope_raddr = des_data[59:49];

   assign tx_valid_d = des_data[60];
   
   assign mux_d = des_data[63:61];

   // Delay valid a cycle for read latency
   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)   tx_valid_q <= 'd0;
      else        tx_valid_q <= tx_valid_d;
   end
 
   // Delay mux control for read latency
   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)            mux_q <= 'd0;
      else if(tx_valid_d)  mux_q <= mux_d;
   end
 
   // Delay mux control for read latency
   assign loopback_d = des_data[31:0];

   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)            loopback_q <= 'd0;
      else if(tx_valid_d)  loopback_q <= loopback_d;
   end
   
   // Muxing
   always_comb begin
      tx_data = scope_rdata[7:0];
      unique case(mux_q) 
         3'b000: tx_data = scope_rdata[7:0];
         3'b001: tx_data = scope_rdata[15:8];
         3'b010: tx_data = scope_rdata[23:16];
         3'b011: tx_data = scope_rdata[31:24];
         3'b100: tx_data = loopback_q[7:0];
         3'b101: tx_data = loopback_q[15:8];
         3'b110: tx_data = loopback_q[23:16];
         3'b111: tx_data = loopback_q[31:24];
         default:;
      endcase
   end

endmodule

