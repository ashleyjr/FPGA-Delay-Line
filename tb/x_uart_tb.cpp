#include <stdlib.h>
#include <iostream>
#include <verilated.h>
#include <verilated_vcd_c.h>
#include "Vx_uart.h"

#define MAX_SIM_TIME 1000000
vluint64_t sim_time = 0;

int main(int argc, char** argv, char** env) {
   Vx_uart *dut = new Vx_uart; 
   Verilated::traceEverOn(true);
   VerilatedVcdC *m_trace = new VerilatedVcdC;
   
   dut->trace(m_trace, 5);
   m_trace->open("waveform.vcd");
 
   dut->i_clk        = 0;    
   dut->i_nrst       = 0; 
   dut->i_data       = 0xDEADBEEF;
   dut->i_uart_rx    = 1;
      
   while (sim_time < MAX_SIM_TIME) {
      dut->i_clk ^= 1;
        
      if(sim_time > 50) 
         dut->i_nrst = 1;
      
      if(sim_time > 500) 
         dut->i_uart_rx = 0;
       
      if(sim_time > 600) 
         dut->i_uart_rx = 1;
          
      dut->eval();
      m_trace->dump(sim_time);
      sim_time++;
   }
   
   m_trace->close();
   delete dut;
   exit(EXIT_SUCCESS);
}

