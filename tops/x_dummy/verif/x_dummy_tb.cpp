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
      data |= (dut->o_tx << i); 
      ticks(104);
   }  
   ticks(104);
   return data;
}

void load(uint64_t a, uint64_t b){
   uint8_t d;
   for(int8_t i=60;i>=0;i-=4){ 
      d = (a >> i) & 0xF; 
      uart_tx(d);
   }
   for(int8_t i=60;i>=0;i-=4){ 
      d = (b >> i) & 0xF;
      d |= 0x10;
      uart_tx(d);
   } 
   uart_tx(0x20);
}

void write_seq_cmd(uint8_t cmd, uint32_t data, uint16_t addr){
   uint64_t i;
   i  = ((uint64_t)data);
   i |= ((uint64_t)cmd) << 32;
   i |= ((uint64_t)1) << 37;
   i |= ((uint64_t)addr) << 38;
   load(i,0);
}

void seq_start(){ 
   uint64_t i;
   i = ((uint64_t)1) << 36;
   load(i,0);
}

void seq_scope_start(){ 
   uint64_t i;
   i = ((uint64_t)1) << 36;
   i |= ((uint64_t)1) << 47;
   load(i,0);
}

uint32_t unload_scope(uint16_t addr){ 
   uint64_t d;
   uint32_t rx = 0;
   for(int8_t i=3;i>=0;i--){ 
      rx <<= 8;
      d = ((uint64_t)addr) << 49;
      d |= ((uint64_t)1) << 48;
      d |= ((uint64_t)1) << 60;
      d |= ((uint64_t)i) << 61;
      load(d,0);
      rx |= uart_rx(); 
   }
   return rx;
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

   // Test UART loopback
   for(uint16_t i=4;i<8;i++){
      uint64_t d = 0x10000000DEADBEEF;
      d |= ((uint64_t)i) << 61;
      load(d,0);
      printf("Loopback %x: %x\n\r", i, uart_rx());
   }

   // Sequence
   write_seq_cmd(0, 0xDEADBEEF, 0);
   write_seq_cmd(0, 0xAAAAAAAA, 1);
   write_seq_cmd(1, 0x00000003, 2);
   write_seq_cmd(2, 0xFFFFFFFF, 3);
   
   seq_scope_start();


   for(uint16_t i=0;i<12;i++){
      printf("Scope %x: %x\n\r", i, unload_scope(i));
   }
   
   ticks(10000);

   m_trace->close();
   delete dut;
   exit(EXIT_SUCCESS);
}

