#include <stdlib.h>
#include <iostream>
#include <cstdlib>
#include <verilated.h>
#include <verilated_vcd_c.h>
#include "Vx_dummy.h"

#define MAX_SIM_TIME 10000

Vx_dummy *dut = new Vx_dummy; 
VerilatedVcdC *m_trace = new VerilatedVcdC;
vluint64_t sim_time = 0;

void tick(){ 
   dut->eval();
   m_trace->dump(sim_time);
   sim_time++;
   dut->i_clk = 0;

   dut->eval();
   m_trace->dump(sim_time);
   sim_time++;
   dut->i_clk = 1;
}

void ticks(uint32_t t){
   for(uint32_t i=0;i<t;i++){
      tick();
   }
}

void uart_tx(uint8_t tx){
   dut->i_rx = 0;
   ticks(104);
   for(uint8_t i=0;i<8;i++){ 
      dut->i_rx = (tx >> i) & 0x01;
      ticks(104);
   } 
   dut->i_rx = 1; 
   ticks(104);
}

uint8_t uart_rx(){
   uint8_t data = 0;
   while(dut->o_tx == 1) ticks(1);
   ticks(52);
   ticks(104); 
   for(uint8_t i=0;i<8;i++){ 
      data |= dut->o_tx;
      data <<= 1;
      ticks(104);
   }  
   ticks(104);
   return data;
}

void load(uint64_t a, uint64_t b){
   uint8_t d;
   for(uint8_t i=0;i<64;i+=4){ 
      d = (a >> i) & 0xF; 
      uart_tx(d);
   }
   for(uint8_t i=0;i<64;i+=4){ 
      d = (b >> i) & 0xF;
      d |= 0x10;
      uart_tx(d);
   } 
   uart_tx(0x20);
}

int main(int argc, char** argv, char** env) { 
   Verilated::traceEverOn(true);
   
   dut->trace(m_trace, 5);
   m_trace->open("waveform.vcd");

   dut->i_rx = 1;
   ticks(100);
   dut->i_rst = 1;
   ticks(10);
   dut->i_rst = 0;
   ticks(100);


   load(0xFFFFFFFFFFFFFFFF,0);

   ticks(10000);

   m_trace->close();
   delete dut;
   exit(EXIT_SUCCESS);
}

