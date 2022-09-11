#include <stdlib.h>
#include <iostream>
#include <verilated.h>
#include <verilated_vcd_c.h>
#include "Vx_delay_line_cell.h"

#define MAX_SIM_TIME 1000000
vluint64_t sim_time = 0;

int main(int argc, char** argv, char** env) {
   Vx_delay_line_cell *dut = new Vx_delay_line_cell; 
   Verilated::traceEverOn(true);
   VerilatedVcdC *m_trace = new VerilatedVcdC;
   unsigned int dl;

   dut->trace(m_trace, 5);
   m_trace->open("waveform.vcd");
    
   dut->i_clk  = 0;    
   dut->i_nrst = 0; 
   dut->i_dl   = 0;
      
   while (sim_time < MAX_SIM_TIME) {
      dut->i_clk ^= 1;
      
      if(sim_time > 10) 
         dut->i_nrst = 1;
           
      switch(sim_time){
         case 10000:  dut->i_dl = 0;  break;
         case 12000:  dut->i_dl = 1;  break;
         case 100000: dut->i_dl = 0;  break;
         case 102000: dut->i_dl = 1;  break;
         default:;
      } 
   
      dut->eval();
      m_trace->dump(sim_time);
      sim_time++;
   }
   
   m_trace->close();
   delete dut;
   exit(EXIT_SUCCESS);
}

