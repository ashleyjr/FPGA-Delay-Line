`timescale 1ns/1ps
module x_mux_trigger_tb;

reg            trigger;
reg [31:0]     data;
wire           driver;

x_mux_trigger u_dut(
   .i_trigger  (trigger ), 
   .i_data     (data    ),
   .o_driver   (driver  )
);

initial begin
   $dumpfile("x_mux_trigger_tb.vcd");
   $dumpvars(0,x_mux_trigger_tb);
end


initial begin
   data    = 0;
   trigger = 0;
   #10000;
   trigger = 1;
   #10000;
   trigger = 0;
   #10000;
   data    = 32'hAAAAAAAA;
   #10000;
   trigger = 1;
   #10000;
   $finish;
end



endmodule
