#include <stdlib.h>
#include <iostream>
#include <cstdlib>
#include <verilated.h>
#include <verilated_vcd_c.h>
#include "Vx_byte_des.h"

#define MAX_SIM_TIME 10000
vluint64_t sim_time = 0;

int main(int argc, char** argv, char** env) {
   Vx_byte_des *dut = new Vx_byte_des; 
   Verilated::traceEverOn(true);
   VerilatedVcdC *m_trace = new VerilatedVcdC;
   
   dut->trace(m_trace, 5);
   m_trace->open("waveform.vcd");
 
   while (sim_time < MAX_SIM_TIME) {
      dut->i_clk ^= 1;
      

      if(1  == sim_time) dut->i_rst = 1;
      if(11 == sim_time) dut->i_rst = 0;

      // Pattern 1
      if(21 == sim_time){
         dut->i_valid = 1;
         dut->i_cmd   = 0x0F;
      }
      if(53 == sim_time){
         dut->i_valid = 0;
         dut->i_cmd   = 0x00;
      }

      if(121 == sim_time){
         dut->i_valid = 1;
         dut->i_cmd   = 0x1A;
      }
      if(153 == sim_time){
         dut->i_valid = 0;
         dut->i_cmd   = 0x00;
      }

      if(163 == sim_time){
         dut->i_valid = 1;
         dut->i_cmd   = 0x2A;
      }
       
      if(165 == sim_time){
         dut->i_valid = 0;
         dut->i_cmd   = 0xEE;
      }

      dut->eval();
      m_trace->dump(sim_time);
      sim_time++;
   }
   
   m_trace->close();
   delete dut;
   exit(EXIT_SUCCESS);
}

