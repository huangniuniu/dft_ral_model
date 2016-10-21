`ifndef _ASSIGN_DISPLAYPLL_DFT_SV
`define _ASSIGN_DISPLAYPLL_DFT_SV

    `define DPLL1_PATH DUT.displaypll_u

    assign `DPLL1_PATH.core_disppll_antiglitch_resetb  = pll_if.core_disppll_antiglitch_resetb;
    assign `DPLL1_PATH.core_disppll_cfg_addrdata       = pll_if.core_disppll_cfg_addrdata;
    assign `DPLL1_PATH.core_disppll_cfg_clk            = pll_if.core_disppll_cfg_clk;
    assign `DPLL1_PATH.core_disppll_cfg_mstrack        = pll_if.core_disppll_cfg_mstrack;
    assign `DPLL1_PATH.core_disppll_cfg_rden           = pll_if.core_disppll_cfg_rden;
    assign `DPLL1_PATH.core_disppll_cfg_spare          = pll_if.core_disppll_cfg_spare;
    assign `DPLL1_PATH.core_disppll_cfg_wren           = pll_if.core_disppll_cfg_wren;
    assign `DPLL1_PATH.core_disppll_pwr_ok             = pll_if.core_disppll_pwr_ok;
    assign `DPLL1_PATH.core_disppll_rcu_dc_resetb      = pll_if.core_disppll_rcu_dc_resetb;
    assign `DPLL1_PATH.core_disppll_refclk2            = pll_if.core_disppll_refclk2;
    assign `DPLL1_PATH.core_disppll_scan_clk           = pll_if.core_disppll_scan_clk;
    assign `DPLL1_PATH.core_disppll_scan_en            = pll_if.core_disppll_scan_en;
    assign `DPLL1_PATH.core_disppll_scan_in            = pll_if.core_disppll_scan_in;
    assign `DPLL1_PATH.core_disppll_scan_mode          = pll_if.core_disppll_scan_mode;
    assign `DPLL1_PATH.core_disppll_stop_on_skid       = pll_if.core_disppll_stop_on_skid;
    assign `DPLL1_PATH.core_disppll_v_update_level     = pll_if.core_disppll_v_update_level;
    assign `DPLL1_PATH.disppll_obsclkin_n              =~pll_if.disppll_obsclkin;
    assign `DPLL1_PATH.disppll_obsclkin_p              = pll_if.disppll_obsclkin;
    //temp assign `DPLL1_PATH.disppll_refclk0                 = pll_if.disppll_refclk0;
    //temp assign `DPLL1_PATH.disppll_refclk0_n               =~pll_if.disppll_refclk0;
    //temp assign `DPLL1_PATH.disppll_refclk0_p               = pll_if.disppll_refclk0;
    //temp assign `DPLL1_PATH.disppll_refclk1                 = pll_if.disppll_refclk1;
    //temp assign `DPLL1_PATH.disppll_refclk1_n               =~pll_if.disppll_refclk1;
    //temp assign `DPLL1_PATH.disppll_refclk1_p               = pll_if.disppll_refclk1;
    //temp assign `DPLL1_PATH.disppll_refclk2_n               =~pll_if.disppll_refclk2;
    //temp assign `DPLL1_PATH.disppll_refclk2_p               = pll_if.disppll_refclk2;
    //temp assign `DPLL1_PATH.disppll_refclk3                 = pll_if.disppll_refclk3;
    //temp assign `DPLL1_PATH.disppll_refclk3_n               =~pll_if.disppll_refclk3;
    //temp assign `DPLL1_PATH.disppll_refclk3_p               = pll_if.disppll_refclk3;


`endif
