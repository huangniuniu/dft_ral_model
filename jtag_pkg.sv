//------------------------------------------------------------------------------
// Package: jtag_pkg
//------------------------------------------------------------------------------

package jtag_pkg;
import uvm_pkg::*;
typedef enum bit[1:0] { IEEE_1149_1, IEEE_1500, IEEE_1687} protocol_e;
typedef enum bit[3:0] { TEST_LOGIC_RESET, RUN_TEST_IDLE, SELECT_DR_SCAN, CAPTURE_DR,
                        SHIFT_DR, EXIT1_DR, PAUSE_DR, EXIT2_DR,UPDATE_DR,SELECT_IR_SCAN,
                        CAPTURE_IR,SHIFT_IR,EXIT1_IR,PAUSE_IR,EXIT2_IR,UPDATE_IR} ieee_1149_1_fsm_e;


typedef bit                dft_reg_data_t[$]; 
`define   CLK_STOP_LOW        255    
`define   TCK_HALF_PERIOD     20     
`define   SYSCLK_HALF_PERIOD  12     
`define   ON                  1
`define   OFF                 0 
//`define   IR_WIDTH            8
`define   MAX_DR_WIDTH        32
`define   GOPPHY_IR_WIDTH     8
`define   SMS_IR_WIDTH        6 
`define   IEEE_1149_IR_WIDTH  8
`define   IEEE_1500_IR_WIDTH  8 
`define   IEEE_1687_IR_WIDTH  8
`define   LVL1SIB_WIDTH       1 
`define   LVL2SIB_WIDTH       8 
//GOP Gasketx2 is controlled by level2 SIB bit 0
`define   GOP_GASKETX2_BIT    0 
//GOP Gasketx4 is controlled by level2 SIB bit 1
`define   GOP_GASKETX4_BIT    1 
//`define   SIB_WIDTH           `LVL1SIB_WIDTH + `LVL2SIB_WIDTH 
`define   SIB_WIDTH           9
//DFT_REG_ADDR_WIDTH = `IEEE_1500_IR_WIDTH + `SIB_WIDTH
`define   DFT_REG_ADDR_WIDTH  17
//SMS_REG_ADDR_WIDTH = `SMS_IR_WIDTH + sptap/JPC/SMS indication bits which are two bits.
`define   SMS_REG_ADDR_WIDTH  8 
`define   MTAP_JPC_TDR        2'h0 
`define   MTAP_SMS_TDR        2'h1 
`define   SPTAP_JPC_TDR       2'h2 
`define   SPTAP_SMS_TDR       2'h3 
`define   SPTAP_IR_WIDTH      3 
//ruhuang
//Update this define MAX_N_BYTES if you are going to enlarge TDR max bit width allowed in RAL model.
//And also update the define which is UVM_REG_DATA_WIDTH in dft_build script as well.
//ruhuang
`define   MAX_N_BYTES         4 
`define   TEST_LOGIC_RESET    4'h0
`define   RUN_TEST_IDLE       4'h1
`define   SELECT_DR_SCAN      4'h2
`define   CAPTURE_DR          4'h3  
`define   SHIFT_DR            4'h4
`define   EXIT1_DR            4'h5
`define   PAUSE_DR            4'h6
`define   EXIT2_DR            4'h7
`define   UPDATE_DR           4'h8
`define   SELECT_IR_SCAN      4'h9
`define   CAPTURE_IR          4'ha
`define   SHIFT_IR            4'hb
`define   EXIT1_IR            4'hc
`define   PAUSE_IR            4'hd
`define   EXIT2_IR            4'he
`define   UPDATE_IR           4'hf                 

             
//GRP0
`define   PAD_GRP0_IN_NUM    2 
`define   PAD_GRP0_OUT_NUM   2 
`define   PAD_GRP0_INOUT_NUM 2 
`define   PAD_GRP0_IN_TOTAL_NUM       `PAD_GRP0_IN_NUM + `PAD_GRP0_INOUT_NUM 
`define   PAD_GRP0_OUT_TOTAL_NUM      `PAD_GRP0_OUT_NUM + `PAD_GRP0_INOUT_NUM 
//GRP1
`define   PAD_GRP1_IN_NUM    2 
`define   PAD_GRP1_OUT_NUM   2 
`define   PAD_GRP1_INOUT_NUM 2 
`define   PAD_GRP1_IN_TOTAL_NUM       `PAD_GRP1_IN_NUM + `PAD_GRP1_INOUT_NUM 
`define   PAD_GRP1_OUT_TOTAL_NUM      `PAD_GRP1_OUT_NUM + `PAD_GRP1_INOUT_NUM 
`include "dft_reg.svh"
`include "ral.svh"
`include "jtag_configuration.svh"
//`include "jtag_transaction.svh"
//`include "jtag_driver.svh"
//`include "jtag_monitor.svh"
//`include "jtag_agent.svh"
//`include "jtag_scoreboard.svh"
`include "jtag_env1.svh"
`include "jtag_env2.svh"
//`include "one_operation_jtag_sequence.svh"
`include "jtag_test.svh"
endpackage: jtag_pkg

