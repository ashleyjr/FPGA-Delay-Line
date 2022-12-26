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
        
      if(11 == sim_time) 
         dut->i_rst;
     

      // Load in a simple pattern 
      if(21 == sim_time){
         dut->i_wen   = 1;
         dut->i_waddr = 0;
         dut->i_wdata = 0xFFFFFFFFF; // Data
         dut->i_wcmd  = 0;
      }
      if(23 == sim_time){
         dut->i_waddr = 1;
         dut->i_wdata = 0x000000000; // Data
         dut->i_wcmd  = 0;
      }
      if(25 == sim_time){
         dut->i_waddr = 2;
         dut->i_wdata = 0x000000000; // Delay 1 Cycle
         dut->i_wcmd  = 1;
      }
      if(27 == sim_time){
         dut->i_waddr = 3;
         dut->i_wdata = 0xFFFFFFFFF; // Data
         dut->i_wcmd  = 0;
      }
      if(29 == sim_time){
         dut->i_waddr = 2;
         dut->i_wdata = 0x000000001; // Delay 2 Cycles
         dut->i_wcmd  = 1;
      }
      if(31 == sim_time){
         dut->i_waddr = 1;
         dut->i_wdata = 0x000000000; // Data
         dut->i_wcmd  = 0;
      }
      if(33 == sim_time){
         dut->i_wen   = 0;
         dut->i_waddr = 4;
         dut->i_wdata = 0x000000000; // End
         dut->i_wcmd  = 2;
      }
   
      if(35 == sim_time){
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

