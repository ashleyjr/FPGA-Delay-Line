module x_micro_sequencer (
   input    logic          i_clk,
   input    logic          i_rst,
   input    logic          i_start,
   output   logic          o_busy,
   input    logic          i_wen,
   input    logic [3:0]    i_wcmd,  
   input    logic [35:0]   i_wdata,
   input    logic [8:0]    i_waddr, 
   output   logic [35:0]   o_data
);

   localparam SM_INIT  = 2'b00;
   localparam SM_PIPE  = 2'b01;
   localparam SM_DATA  = 2'b10;
   localparam SM_DELAY = 2'b11; 

   localparam CMD_DAT = 4'b0000;
   localparam CMD_DEL = 4'b0001;
   localparam CMD_END = 4'b0010;

   logic [8:0]    raddr;
   logic [35:0]   rdata;
   logic [3:0]    rcmd;

   logic [35:0]   data_d;
   logic [35:0]   data_q;
   logic          data_en;
  
   logic [16:0]   delay_d;
   logic [16:0]   delay_q;
   logic          delay_en;
  
   logic [1:0]    sm_d;
   logic [1:0]    sm_q;
   logic          sm_en;

   assign o_busy = 1'd0;
   assign raddr  = i_waddr; 

   x_micro_sequencer_ram u_ram(
      .i_clk      (i_clk            ),
      .i_rst      (i_rst            ), 
      .i_wen      (i_wen            ), 
      .i_waddr    (i_waddr          ),
      .i_wdata    ({i_wdata, i_wcmd}),
      .i_raddr    (raddr            ),
      .o_rdata    ({rdata, rcmd}    )
   );

   // Buffer output data

   assign data_d  = rdata;
   assign data_en = (rcmd == CMD_DAT);

   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)         o_data <= 'd0;
      else if(data_en)  o_data <= data_d;
   end
 
   // Counter

   assign delay_d = rdata[16:0];
   assign delay_en = 1'b1;

   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)         delay_q <= 'd0;
      else if(delay_en) delay_q <= delay_d;
   end

   // State Machine
   assign sm_en = ((sm_q == SM_INIT) & i_start) |
                  ((sm_q != SM_INIT) & (rcmd == CMD_END)) |
                  ((sm_q != SM_INIT) & (rcmd == CMD_DAT));

   always_comb begin
      sm_d = SM_INIT;
      if(rcmd != CMD_END) begin
         unique case(sm_q)
            SM_INIT:                         sm_d = SM_PIPE;     
            SM_PIPE:                         sm_d = SM_DATA;
            SM_DATA:    if(rcmd == CMD_DEL)  sm_d = SM_DELAY; 
            SM_DELAY:   if(rcmd == CMD_DAT)  sm_d = SM_INIT;
            default:;
         endcase
      end
   end

   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)      sm_q <= SM_INIT;
      else if(sm_en) sm_q <= sm_d;
   end
 
endmodule


