`ifndef _DUT_WRAPPER_SV
`define _DUT_WRAPPER_SV

// Code your design here
`include "uvm_macros.svh"
//`include "dft_env_pkg.sv"
`include "../interface/include_all_if_here.svh"
//`include "clk_if.sv"
//`include "reset_if.sv"
//`include "pad_if.sv"
//`include "pll_if.sv"

//------------------------------------------------------------------------------
// Module: dut_wrapper
//   This is the DUT wrapper.
//------------------------------------------------------------------------------

module dut_wrapper(
                   jtag_if.slave_mp jtag_if
                  ,clk_if.dut_mp    tck_clk_if
                  ,clk_if.dut_mp    sysclk_clk_if
                  ,reset_if.dut_mp  reset_if
                  ,pad_if.dut_mp    pad_if
                  ,pll_if           pll_if
                  ,occ_if           occ_if
                   );

   import dft_env_pkg::*; 

   //-------------------------------------------------------------------------------
   //wires/regs
   //-------------------------------------------------------------------------------
   wire           reset; 
   wire           tck; 
   wire           tdi; 
   wire           tms; 
   //reg            muxed_tdo; 
   wire           soc_tdo;
   wire           soc_tdo_en;

   wire           DBREQ_L;
   //-------------------------------------------------------------------------------
   //connect
   //-------------------------------------------------------------------------------
   assign pad_if.pad_grp0_out[0] = 1'b1;
   assign pad_if.pad_grp0_out[1] = 1'bz;
   //BOZO: fix me when DBREQ_L ready.
   assign DBREQ_L = pad_if.pad_grp0_in[0];

   assign   reset = reset_if.trst;
   assign   tck = tck_clk_if.clk;
   assign   tdi = jtag_if.tdi;
   assign   tms = jtag_if.tms;
   assign   jtag_if.tdo = soc_tdo;

   //TODO, this file need remove when DUT is ready.
   `include "../top/temp_force.sv"
   //-------------------------------------------------------------------------------
   // Instance DUT
   //-------------------------------------------------------------------------------
   `ifdef FAKE_SOC
   //fake_soc_wrap DUT;
   fake_soc_wrap  DUT (
         .Jtag_tclk(tck),
         .Jtag_tdi(tdi),
         .Jtag_tms(tms),
         .Jtag_trstb(~reset),
         .Jtag_tdo(soc_tdo),
         .Jtag_tdo_en(soc_tdo_en)
         //.DBREQ_L(DBREQ_L)
		    );


   // assign pll_if to systempll_dft
   `include "assign_systempll_dft.sv"
   // assign pll_if to displaypll_dft
   `include "assign_displaypll_dft.sv"

   // assign occ_if to OCC
   `include "assign_occ_dft.sv"

   // assign gopphy_x2
   `include "assign_gopphyx2.sv"
   // assign gopphy_x4
   `include "assign_gopphyx4.sv"

   // assign TMDP-PHY
   `include "assign_tmdpphy.sv"
   `endif
   
   `ifdef FULL_CHIP_GATE
   leonardo_top DUT( 
      //.PLLREFP(sysclk_clk_if.clk), .PLLREFN(~sysclk_clk_if.clk), 
      //.PLLMD, 
       // .HRESETB(reset_if.RESET_L), .NSRESETB(reset_if.RESET_L), .SCLKI(sysclk_clk_if.clk), 
        //.AHSPRESREF, .MAGPRESREF, .EDPPRESREF0, .EDPPRESREF1, .HBTSL, .JTGSEL, .HAD, 
        //.HCSB, .HRDB, .HWRB, .HWDTINTN, .HDT, .HIRQ, .HWAIT, .HCLKO, .HTRCCLK, .HTRCCTL, 
        //.HTRCDATA, .HSCL0, .HSDA0, .HSCL1, .HSDA1, .HSCL2, .HSDA2, .HSCL3, .HSDA3, 
        //.HGPORT0, .HGPORT1, .HRXD00, .HSCK00, .HTXD00, .HRXD01, .HSCK01, .HTXD01, 
        //.HRXD02, .HSCK02, .HTXD02, .HRXD03, .HSCK03, .HTXD03, .HRXD04, .HSCK04, .HTXD04, 
        //.HRXD05, .HSCK05, .HTXD05, .HRXD06, .HSCK06, .HTXD06, .HRXD07, .HSCK07, .HTXD07, 
        //.ASIBLCLK0, .ASIBLDT0, .ASIBLCLK1, .ASIBLDT1, .ASIBLCLK2, .ASIBLDT2, 
        //.ASIBLCLK3, .ASIBLDT3, .ASIBMDIN00, .ASIBMCLK00, .ASIBMDT00, .ASIBMDIN01, 
        //.ASIBMCLK01, .ASIBMDT01, .ASIBMDIN10, .ASIBMCLK10, .ASIBMDT10, .ASIBMDIN11, 
        //.ASIBMCLK11, .ASIBMDT11, .ASIBMSFTL00, .ASIBMCT00, .ASIBMSFTL01, .ASIBMCT01, 
        //.ASIBMSFTL10, .ASIBMCT10, .ASIBMSFTL11, .ASIBMCT11, .ASIBMPI0, .ASIBMPI1, 
        //.CWAITB, .CDQS, .CDT, .CCLKO, .CCSB, .CRDB, .CWRB, .CADVB, .CAD, .CRSTB, 
        //.AHSRIDP0, .AHSRIDN0, .AHSTODP0, .AHSTODN0, .AHSRIDP1, .AHSRIDN1, .AHSTODP1, 
        //.AHSTODN1, .MAGRIDP0, .MAGRIDN0, .MAGTODP0, .MAGTODN0, .MAGRIDP1, .MAGRIDN1, 
        //.MAGTODP1, .MAGTODN1, .MAGRIDP2, .MAGRIDN2, .MAGTODP2, .MAGTODN2, .MAGRIDP3, 
        //.MAGRIDN3, .MAGTODP3, .MAGTODN3, .DCLKO, .VSYNC, .HSYNC, .RGBDE, .RGB, 
        //.LVDTCLK0P, .LVDTCLK0N, .LVDTA0P, .LVDTA0N, .LVDTB0P, .LVDTB0N, .LVDTC0P, 
        //.LVDTC0N, .LVDTD0P, .LVDTD0N, .LVDTCLK1P, .LVDTCLK1N, .LVDTA1P, .LVDTA1N, 
        //.LVDTB1P, .LVDTB1N, .LVDTC1P, .LVDTC1N, .LVDTD1P, .LVDTD1N, .EDPHPD0, 
        //.EDPAUX0P, .EDPAUX0N, .EDPTX00P, .EDPTX00N, .EDPTX01P, .EDPTX01N, .EDPTX02P, 
        //.EDPTX02N, .EDPTX03P, .EDPTX03N, .EDPHPD1, .EDPAUX1P, .EDPAUX1N, .EDPTX10P, 
        //.EDPTX10N, .EDPTX11P, .EDPTX11N, .EDPTX12P, .EDPTX12N, .EDPTX13P, .EDPTX13N, 
        //.EDPHPD2, .EDPAUX2P, .EDPAUX2N, .EDPTX20P, .EDPTX20N, .EDPTX21P, .EDPTX21N, 
        //.EDPTX22P, .EDPTX22N, .EDPTX23P, .EDPTX23N, .EDPHPD3, .EDPAUX3P, .EDPAUX3N, 
        //.EDPTX30P, .EDPTX30N, .EDPTX31P, .EDPTX31N, .EDPTX32P, .EDPTX32N, .EDPTX33P, 
        //.EDPTX33N, .SDRXD, .SDTXD, .SLRCLKI, .SBCLKI, .SDIN, .SMCLKO, .SLRCLKO, .SBCLKO, 
        //.SDOUTD, .SCANSHIFTCLK, .SCANSHIFTEN, .SCANSHIFTEND, .SCANCAPTEN, 
        //.STOPCLKGATER, 
        //.PLLBYPASSCLK(tck), 
        .TRSTB(~reset), .TCK(tck), .TMS(tms), .TDI(tdi), .TDO(soc_tdo), 
        .GD5RESETB(~reset), 
        //.GD5ZQ, .GD50MA, .GD50ABIB, .GD50CKT, .GD50CKC, .GD50WCKT, .GD50WCKC, 
        //.GD50CKEB, .GD50CSB, .GD50RASB, .GD50CASB, .GD50WEB, .GD50DQ, .GD50DBIB, 
        //.GD50EDC, .GD51MA, .GD51ABIB, .GD51CKT, .GD51CKC, .GD51WCKT, .GD51WCKC, 
        //.GD51CKEB, .GD51CSB, .GD51RASB, .GD51CASB, .GD51WEB, .GD51DQ, .GD51DBIB, 
     .GD51EDC(4'b0) );

   `endif
endmodule: dut_wrapper
`endif
