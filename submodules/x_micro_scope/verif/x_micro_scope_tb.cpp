#include <stdlib.h>
#include <iostream>
#include <cstdlib>
#include <verilated.h>
#include <verilated_vcd_c.h>
#include "Vx_micro_scope.h"

#define MAX_SIM_TIME 10000
#define REC 23+(2048*2)

vluint64_t sim_time = 0;

int main(int argc, char** argv, char** env) {
   Vx_micro_scope *dut = new Vx_micro_scope; 
   Verilated::traceEverOn(true);
   VerilatedVcdC *m_trace = new VerilatedVcdC;
   
   dut->trace(m_trace, 5);
   m_trace->open("waveform.vcd");
 
   while (sim_time < MAX_SIM_TIME) {
      dut->i_clk ^= 1;
        
      if(11 == sim_time) dut->i_rst = 1;
      if(21 == sim_time) dut->i_rst = 0;
     
      if(23 == sim_time) dut->i_start = 1;
      if(25 == sim_time) dut->i_start = 0;
     
      if((23 <= sim_time) && 
         (sim_time < REC) &&
         ((sim_time % 2) == 1)){   
         dut->i_data = (uint32_t)(rand());
         dut->i_ren  = rand() % 2;
      }

      if((sim_time > REC) && ((sim_time % 2) == 1)){
         dut->i_raddr = (uint32_t)(rand());
         dut->i_ren   = rand() % 2;
      }

      dut->eval();
      m_trace->dump(sim_time);
      sim_time++;
   }
   
   m_trace->close();
   delete dut;
   exit(EXIT_SUCCESS);
}

