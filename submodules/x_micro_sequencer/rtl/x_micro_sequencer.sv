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

   logic [39:0]   wdata;
   logic          ren_d;
   logic          ren_q;  
   logic [35:0]   rdata;
   logic [3:0]    rcmd;

   logic          rcmd_dat;
   logic          rcmd_del;
   logic          sm_d_init;
   logic          sm_q_init;
   logic          sm_q_pipe;
   logic          sm_q_delay;
   logic          sm_q_data;

   logic          start_q;
   logic          start;

   logic [35:0]   data_d;
   logic [35:0]   data_q;
   logic          data_en;
  
   logic [16:0]   delay_d;
   logic [16:0]   delay_q;
   logic          delay_en;
    
   logic [1:0]    sm_cmd; 
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
      .o_rdata    ({rdata, rcmd}    )
   );
 
   assign ren_d = ~sm_d_init & (
                     (sm_q_init & start) |  
                     (sm_q_delay & (delay_q <= 'd1) & ~ren_q) |
                     (  
                        (sm_q_pipe | sm_q_data) & 
                        (~rcmd_del | (data_d == 'd0))
                     )
                  );
    
   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)   ren_q <= 'd0;
      else        ren_q <= ren_d;
   end 

   // Decode
   assign rcmd_dat   = (rcmd == CMD_DAT);
   assign rcmd_del   = (rcmd == CMD_DEL);
   assign sm_d_init  = (sm_d == SM_INIT);
   assign sm_q_init  = (sm_q == SM_INIT);
   assign sm_q_pipe  = (sm_q == SM_PIPE);
   assign sm_q_delay = (sm_q == SM_DELAY);
   assign sm_q_data  = (sm_q == SM_DATA);
   
   // Start 
   assign start = i_start & ~start_q;

   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)   start_q <= 'd0;
      else        start_q <= i_start;
   end
 
   // Buffer output data
   assign data_d  = (sm_d_init) ? 'd0 : rdata;
   assign data_en = (sm_d_init) | (ren_q & rcmd_dat); 

   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)         o_data <= 'd0;
      else if(data_en)  o_data <= data_d;
   end
 
   // Pointer
   assign ptr_d  = (sm_d_init) ? 9'd0 : (ptr_q + 'd1);
   assign ptr_en = ren_d | sm_d_init;

   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)         ptr_q <= 'd0;
      else if(ptr_en)   ptr_q <= ptr_d;
   end

   // Delay counter
   assign delay_d  = (ren_q) ? rdata[16:0] : (delay_q - 'd1);
   assign delay_en = rcmd_del | (delay_q != 0);

   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)         delay_q <= 'd0;
      else if(delay_en) delay_q <= delay_d;
   end

   // Drive busy signal 
   assign o_busy = ~sm_q_init;
   
   // State Machine command driven transitions
   always_comb begin
      sm_cmd = SM_INIT; 
      
      // Finished on end of memory
      if(ptr_q == 9'h1FF) begin
         sm_cmd = SM_INIT;
      end else begin
      
         // Normal command update
         unique case(rcmd)
            CMD_DEL:  sm_cmd = SM_DELAY; 
            CMD_DAT:  sm_cmd = SM_DATA;
            CMD_END:  sm_cmd = SM_INIT;
            default:;
         endcase
      end
   end

   // Main State Machine logic
   always_comb begin
      sm_d = SM_INIT;
      unique case(sm_q)
         SM_INIT:    if(start)            sm_d = SM_PIPE;     
         SM_PIPE,    
         SM_DATA:                         sm_d = sm_cmd;
         SM_DELAY:   if(delay_q == 'd0)   sm_d = sm_cmd;
                     else                 sm_d = SM_DELAY; 
         default:;
      endcase 
   end

   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)   sm_q <= SM_INIT;
      else        sm_q <= sm_d;
   end
 
endmodule


