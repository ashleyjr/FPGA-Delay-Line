module x_byte_des(
   input  logic           i_clk,
   input  logic           i_rst,
   input  logic           i_valid,
   output logic           o_accept,
   input  logic  [7:0]    i_cmd,
   output logic  [63:0]   o_data
);
  
   localparam CMD_SHIFT_A  = 4'b0000; 
   localparam CMD_SHIFT_B  = 4'b0001; 
   localparam CMD_APPLY_AB = 4'b0010;  
 
   logic [3:0]    data;
   logic [3:0]    op;

   logic          cmd_shift_a;
   logic          cmd_shift_b; 
   logic          cmd_apply_ab; 

   logic          dataA_en;
   logic [63:0]   dataA_d;
   logic [63:0]   dataA_q;

   logic          dataB_en;
   logic [63:0]   dataB_d;
   logic [63:0]   dataB_q;

   logic          apply_a;
   logic          apply_b;

   logic          data_en;
   logic [63:0]   data_d;
   logic [63:0]   data_q;

   // Breakdown command 
   assign data         = i_cmd[3:0];
   assign op           = i_cmd[7:4];
   assign cmd_shift_a  = (op == CMD_SHIFT_A);
   assign cmd_shift_b  = (op == CMD_SHIFT_B);
   assign cmd_apply_ab = (op == CMD_APPLY_AB);

   // Data Bank A
   assign dataA_d  = {dataA_q[59:0], data}; 
   assign dataA_en = i_valid & cmd_shift_a;

   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)         dataA_q <= 'd0;
      else if(dataA_en) dataA_q <= dataA_d;
   end 

   // Data Bank B
   assign dataB_d  = {dataB_q[59:0], data}; 
   assign dataB_en = i_valid & cmd_shift_b;

   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)         dataB_q <= 'd0;
      else if(dataB_en) dataB_q <= dataB_d;
   end 
   
   // Apply 
   assign apply_a = i_valid & cmd_apply_ab; 

   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)   apply_b <= 'd0;
      else        apply_b <= apply_a;
   end 

   // Drive output
   assign data_d  = (apply_b) ? dataB_q : dataA_q;
   assign data_en = apply_a | apply_b;

   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)         o_data <= 'd0;
      else if(data_en)  o_data <= data_d;
   end 

   // Drive output
   assign o_accept = ~apply_a;

endmodule
