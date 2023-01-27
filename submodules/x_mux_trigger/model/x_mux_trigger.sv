module x_mux_trigger(
   input    wire           i_trigger,
   input    wire [31:0]    i_data,
   output   wire           o_driver
);

   wire [31:0] trigger_line;
   wire [31:0] mux;
   
   assign trigger_line[0] = i_trigger;

   assign #70 trigger_line[31:1] = trigger_line[30:0];

   genvar i;
   generate 
      for(i=0;i<32;i=i+1)  begin
         assign #70 mux[i] = trigger_line[i] ? mux[i+1] : i_data[i]; 
      end
   endgenerate

   assign o_driver = mux[0];

endmodule 
