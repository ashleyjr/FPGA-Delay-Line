x_micro_sequencer
-----------------

![x_micro_sequencer](images/x_micro_sequencer.svg "x_micro_sequencer")

Pin Out
~~~~~~~

| Signal      | Width       |
| ----------- | ----------- |
| i_clk       | 1           |
| i_rst       | 1           |
| i_start     | 1           | 
| i_wen       | 1           |
| i_wcmd      | 4           |
| i_wdata     | 36          |
| o_data      | 36          |

RAM
~~~

- The RAM is 40 Bits Wide
- The RAM has 512 entries
- This is constructed from 5 Qty 512 x 8 (4 k) FPGA BRAMs

Commands
~~~~~~~~

| Code   | Name | Description           |
| ------ | ---- | --------------------- |
| 2'b00  | SCD  | Single Cycle Data     |
| 2'b01  | MCD  | Multiple Cycle Data   |
| 2'b10  | DEL  | Delay                 |
| 2'b11  | JTZ  | Jump to zero          |

![x_micro_sequencer_sm](images/x_micro_sequencer_sm.svg "x_micro_sequencer")



- Reset

   - Count 

- Load RAM

   - A low speed interface write t 
