`ifndef _ASSIGN_OCC_DFT_SV
`define _ASSIGN_OCC_DFT_SV

    `define DUT_TOP_PATH DUT
    // for Clock chain input
    assign `DUT_TOP_PATH.SCANSHIFTCLK   = occ_if.SCANSHIFTCLK;
    assign `DUT_TOP_PATH.SCANSHIFTEN    = occ_if.SCANSHIFTEN;
    assign (supply1,supply0) `DUT_TOP_PATH.occ_intest1_si = occ_if.occ_intest1_si;
    // for Clock chain output
    assign occ_if.occ_intest1_so = `DUT_TOP_PATH.occ_intest1_so;
    assign occ_if.OCC_data = `DUT_TOP_PATH.OCC_data;

    // for OCC controller input
    assign `DUT_TOP_PATH.pll_clk = occ_if.pll_clk;
    assign `DUT_TOP_PATH.HRESETB = occ_if.HRESETB;
    //logic SCANSHIFTCLK;
    // for OCC controller output
    assign occ_if.occ_clkout = `DUT_TOP_PATH.occ_clkout;

`endif
