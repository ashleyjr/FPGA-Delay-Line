#include <stdlib.h>
#include <iostream>
#include <verilated.h>
#include <verilated_vcd_c.h>
#include "Vx_clocked_delay_line.h"

#define MAX_SIM_TIME 1000000
vluint64_t sim_time = 0;

int main(int argc, char** argv, char** env) {
   Vx_clocked_delay_line *dut = new Vx_clocked_delay_line; 
   Verilated::traceEverOn(true);
   VerilatedVcdC *m_trace = new VerilatedVcdC;
   unsigned int dl;

   dut->trace(m_trace, 5);
   m_trace->open("waveform.vcd");
   
   dl             = 0;
   dut->i_clk     = 0;    
   dut->i_nrst    = 0;
   dut->i_uart_rx = 1;
   dut->i_dl_rx   = 0;
   
      
   while (sim_time < MAX_SIM_TIME) {
      dut->i_clk ^= 1;
      
      if(sim_time > 10) 
         dut->i_nrst = 1;
           
      switch(sim_time){
         case 10000:  dut->i_uart_rx = 0;  break;
         case 12000:  dut->i_uart_rx = 1;  break;
         case 100000: dut->i_uart_rx = 0;  break;
         case 102000: dut->i_uart_rx = 1;  break;
         default:;
      }
     
      if(sim_time < 50000){
         dl <<= 1;
         dl |= dut->o_dl_tx;
      }else{
         dl <<= 3;
         dl |= dut->o_dl_tx;
         dl |= dut->o_dl_tx << 1;
         dl |= dut->o_dl_tx << 2;
      } 
      dut->i_dl_rx = dl >> 31;
   
      dut->eval();
      m_trace->dump(sim_time);
      sim_time++;
   }
   
   m_trace->close();
   delete dut;
   exit(EXIT_SUCCESS);
}

