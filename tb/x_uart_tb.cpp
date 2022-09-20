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
   
   
   m_trace->close();
   delete dut;
   exit(EXIT_SUCCESS);
}

