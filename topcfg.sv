// topcfg.sv
config topcfg;
   design top;  //top level module name

   instance top.dut_wrapper.DUT.dft_top_u use dft_top;
   instance top.dut_wrapper.DUT.goppphy_dft_wrapper_x2_u use goppphy_dft_wrapper_x2;
   instance top.dut_wrapper.DUT.goppphy_dft_wrapper_x4_u use goppphy_dft_wrapper_x4;
   instance top.dut_wrapper.DUT.systempll_dft0 use systempll_dft;
   instance top.dut_wrapper.DUT.displaypll_u use displaypll;
   instance top.dut_wrapper.DUT.u_drw_cch_tile6 use drw_cch_tile6;
   instance top.dut_wrapper.DUT.u_drw_tile14 use drw_tile14;
   partition instance top.dut_wrapper.DUT.dft_top_u;
   partition instance top.dut_wrapper.DUT.goppphy_dft_wrapper_x2_u;
   partition instance top.dut_wrapper.DUT.goppphy_dft_wrapper_x4_u;
   partition instance top.dut_wrapper.DUT.systempll_dft0;
   partition instance top.dut_wrapper.DUT.displaypll_u;
   partition instance top.dut_wrapper.DUT.u_drw_cch_tile6;
   partition instance top.dut_wrapper.DUT.u_drw_tile14;
   partition package uvm_pkg;
   partition package dft_env_pkg;

endconfig
