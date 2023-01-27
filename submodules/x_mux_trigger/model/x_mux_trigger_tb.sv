`timescale 1ns/1ps
module fast_delay_line_tb;

reg            trigger;
reg [31:0]     data;
wire           driver;

fast_delay_line u_dut(
   .i_trigger  (trigger ), 
   .i_data     (data    ),
   .o_driver   (driver  )
);

initial begin
   $dumpfile("fast_delay_line_tb.vcd");
   $dumpvars(0,fast_delay_line_tb);
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



endmodule // test
