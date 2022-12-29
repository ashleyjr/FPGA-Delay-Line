module x_byte_des(
   input             i_clk,
   input             i_rst,
   input             i_valid,
   input    [7:0]    i_cmd,
   output   [63:0]   o_data,
);
   
   logic [5:0]    index;
   logic          data;
   logic          wr_n_op;
   logic [6:0]    op;
 
   logic          data0_en;
   logic [63:0]   data0_d;
   logic [63:0]   data0_q;

   logic          data_en;
   logic [63:0]   data_d;
   logic [63:0]   data_q;

   // Breakdown command
   assign index   = i_cmd[5:0];
   assign data    = i_cmd[6];
   assign wr_n_op = i_cmd[7];
   assign op      = i_cmd[6:0];

   // Data Bank 0
   always_comb begin
      data0_d        = data0_q;
      data0_d[index] = data; 
   end

   assign data0_en = i_valid & wr_n_op;

   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)         data0_q <= 'd0;
      else if(data0_en) data0_q <= data0_d;
   end 

   // Apply
   assign data_d = data0_q;

   assign data_en = i_valid & ~wr_n_op;

   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)         o_data <= 'd0;
      else if(data_en)  o_data <= data_d;
   end 

endmodule
