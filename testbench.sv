`ifndef _TESTBENCH_SV
`define _TESTBENCH_SV

// Code your testbench here
// or browse Examples
//---------------------------------------------------------------------------
// module: top
//---------------------------------------------------------------------------
module top;
   `timescale 1ns/1ps
   import uvm_pkg::*;

  clk_if         TCK_clk_if(); 
  jtag_if        jtag_if(TCK_clk_if.clk,reset_if.trst);
  clk_if         SYSCLK_clk_if(); 
  reset_if       reset_if(TCK_clk_if.clk);
  pad_if         pad_if(TCK_clk_if.clk);
  pll_if         pll_if();
  occ_if         occ_if();
  dut_wrapper    dut_wrapper( jtag_if, TCK_clk_if.dut_mp,SYSCLK_clk_if.dut_mp, reset_if, pad_if.dut_mp, pll_if, occ_if);
  string         testname;
  
   initial begin // waveform
      if($value$plusargs("UVM_TESTNAME=%s",testname)) begin
         $display("\n TEST NAME is : %0s",testname);
      end
      if($test$plusargs("FSDB")) begin
         //$fsdbDumpfile("test.fsdb");
         $fsdbDumpfile({testname,".fsdb"});
         `ifdef FAKE_SOC
            $fsdbDumpvars(0, top);
         `endif
         `ifdef FULL_CHIP_GATE 
            $fsdbDumpvarsToFile("gate_dump_scope.txt");
         `endif
      end
      if($test$plusargs("VPD")) begin
         //$vcdplusfile("test.vpd");
         $vcdplusfile({testname,".vpd"});
         $vcdpluson;
         //$dumpvars( 0, top );
      end
   end
   
   initial begin
      uvm_config_db#( virtual jtag_if)::set( .cntxt( null ), .inst_name( "" ), .field_name( "jtag_if" ), .value( jtag_if ) );
      uvm_config_db#( virtual clk_if)::set( .cntxt( null ), .inst_name( "" ), .field_name( "TCK_clk_if" ), .value( TCK_clk_if ) );
      uvm_config_db#( virtual clk_if)::set( .cntxt( null ), .inst_name( "" ), .field_name( "SYSCLK_clk_if" ), .value( SYSCLK_clk_if ) );
      uvm_config_db#( virtual reset_if)::set( .cntxt( null ), .inst_name( "" ), .field_name( "reset_if" ), .value( reset_if ) );
      uvm_config_db#( virtual pad_if)::set( .cntxt( null ), .inst_name( "" ), .field_name( "pad_if" ), .value( pad_if ) );
      uvm_config_db#( virtual pll_if)::set( .cntxt( null ), .inst_name( "" ), .field_name( "pll_if" ), .value( pll_if ) );
      uvm_config_db#( virtual occ_if)::set( .cntxt( null ), .inst_name( "" ), .field_name( "occ_if" ), .value( occ_if ) );
      run_test();
   end
endmodule:top

`endif
