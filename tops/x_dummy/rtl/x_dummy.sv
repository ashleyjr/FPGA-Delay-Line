module x_dummy (
   input    logic    i_clk,
   input    logic    i_rst,
   input    logic    i_rx,
   output   logic    o_tx
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
   logic          tx_valid;
   logic          tx_accept;

   x_uart_rx u_rx (
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

   x_uart_tx u_tx (
      .i_clk      (i_clk         ),
      .i_rst      (i_rst         ), 
      .i_data     (tx_data       ),
      .o_tx       (o_tx          ),
      .i_valid    (tx_valid      ),
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
   
   assign scope_wdata = seq_rdata[31:0];
   assign scope_start = des_data[47];
   assign scope_ren   = des_data[48];
   assign scope_raddr = des_data[59:49];

   assign tx_valid = des_data[60];
   
   // Muxing
   always_comb begin
      tx_data = 8'hAA;
      unique case(des_data[63:61]) 
         3'b000: tx_data = scope_rdata[7:0];
         3'b001: tx_data = scope_rdata[15:8];
         3'b010: tx_data = scope_rdata[23:16];
         3'b011: tx_data = scope_rdata[31:24];
         default:;
      endcase
   end

endmodule

