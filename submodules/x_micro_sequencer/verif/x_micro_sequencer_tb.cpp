#include <stdlib.h>
#include <iostream>
#include <verilated.h>
#include <verilated_vcd_c.h>
#include "Vx_micro_sequencer.h"

#define MAX_SIM_TIME 100
vluint64_t sim_time = 0;

int main(int argc, char** argv, char** env) {
   Vx_micro_sequencer *dut = new Vx_micro_sequencer; 
   Verilated::traceEverOn(true);
   VerilatedVcdC *m_trace = new VerilatedVcdC;
   
   dut->trace(m_trace, 5);
   m_trace->open("waveform.vcd");
 
   while (sim_time < MAX_SIM_TIME) {
      dut->i_clk ^= 1;
        
      if(10 == sim_time) 
         dut->i_rst;
     

      // Load in a simple pattern 
      if(20 == sim_time){
         dut->i_waddr = 1;
         dut->i_wdata = 0x00000000; // Data
      }
      if(21 == sim_time){
         dut->i_wdata = 0xFFFFFFF0; // Data
      }
      if(22 == sim_time){
         dut->i_wdata = 0x000000F1; // Delay
      }
      if(23 == sim_time){
         dut->i_wdata = 0x00000000; // Data
      }
      if(24 == sim_time){
         dut->i_waddr = 1;
         dut->i_wdata = 0x00000002; // End
      }
   
      if(30 == sim_time){
         dut->i_start = 1;
      }

      dut->eval();
      m_trace->dump(sim_time);
      sim_time++;
   }
   
   m_trace->close();
   delete dut;
   exit(EXIT_SUCCESS);
}

