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

   logic          ren_d;
   logic          ren_q;
   logic [8:0]    raddr;
   logic [39:0]   rdata;
   logic [3:0]    rcmd;

   logic [35:0]   data_d;
   logic [35:0]   data_q;
   logic          data_en;
  
   logic [16:0]   delay_d;
   logic [16:0]   delay_q;
   logic          delay_en;
  
   logic [1:0]    sm_d;
   logic [1:0]    sm_q; 
   
   logic [8:0]    ptr_d;
   logic [8:0]    ptr_q;
   logic          ptr_en;

   // RAM
   x_micro_sequencer_ram u_ram(
      .i_clk      (i_clk            ),
      .i_rst      (i_rst            ), 
      .i_wen      (i_wen            ), 
      .i_waddr    (i_waddr          ),
      .i_wdata    ({i_wdata, i_wcmd}),
      .i_ren      (ren_d            ),
      .i_raddr    (ptr_q            ),
      .o_rdata    (rdata            )
   );

   assign rcmd = rdata[3:0];
  
   assign ren_d = ((sm_q == SM_INIT) & i_start) | 
                  (sm_q == SM_DATA) |
                  ((sm_q == SM_DELAY) & (ptr_q == 'd1)) |
                  ((sm_q == SM_PIPE) & (rcmd == CMD_DAT));
    
   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)   ren_q <= 'd0;
      else        ren_q <= ren_d;
   end 

   // Buffer output data
   assign data_d  = rdata[39:4];
   assign data_en = ren_q & (rcmd == CMD_DAT); 

   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)         o_data <= 'd0;
      else if(data_en)  o_data <= data_d;
   end
 
   // Pointer

   assign ptr_d  = (rcmd == CMD_END) ? 9'd0 : (ptr_q + 'd1);
   assign ptr_en = ren_d;

   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)         ptr_q <= 'd0;
      else if(ptr_en)   ptr_q <= ptr_d;
   end

   // Delay counter

   assign delay_d  = (rcmd == CMD_DEL) ? rdata[20:4] : (delay_q - 'd1);
   assign delay_en = (rcmd == CMD_DEL) | (delay_q != 0);

   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)         delay_q <= 'd0;
      else if(delay_en) delay_q <= delay_d;
   end

   // Drive busy signal 
   assign o_busy = (sm_q != SM_INIT);
   
   // State Machine   
   always_comb begin
      sm_d = SM_INIT;
      unique case(sm_q)
         SM_INIT:    if(i_start) 
                        sm_d = SM_PIPE;     
         SM_PIPE,    
         SM_DATA,
         SM_DELAY:   begin
                        if(rcmd == CMD_DEL)  sm_d = SM_DELAY; 
                        if(rcmd == CMD_DAT)  sm_d = SM_DATA;
                        if(rcmd == CMD_END)  sm_d = SM_INIT;  
                     end
         default:;
      endcase 
   end

   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)   sm_q <= SM_INIT;
      else        sm_q <= sm_d;
   end
 
endmodule


