`ifndef _ASSIGN_TMDPPHY_SV
`define _ASSIGN_TMDPPHY_SV

`ifdef TMDPPHY_AVAILABLE
reg pwrOkVddcore;
initial begin
    //$deposit (u_TMDP_phy.pcie_phy.ln0.tx.fifoprbs.fifo_ssm.fifo.ptr_init_gang_mode_cntr[3:0],4'b0);
    pwrOkVddcore = 1'b0;
    #1000;  // 100ns
    pwrOkVddcore = 1'b1;
end

`define   CLK_GENERATE(_freq) \
    reg  tb_clk_``_freq ; \
    real period_``_freq ; \
    initial begin \
        if (      "_freq" == "10MHz" ) begin  period_``_freq = 1000/( 10); end \
        else if ( "_freq" == "20MHz" ) begin  period_``_freq = 1000/( 20); end \
        else if ( "_freq" == "25MHz" ) begin  period_``_freq = 1000/( 25); end \
        else if ( "_freq" == "40MHz" ) begin  period_``_freq = 1000/( 40); end \
        else if ( "_freq" == "50MHz" ) begin  period_``_freq = 1000/( 50); end \
        else if ( "_freq" == "100MHz") begin  period_``_freq = 1000/(100); end \
        else if ( "_freq" == "200MHz") begin  period_``_freq = 1000/(200); end \
        else if ( "_freq" == "250MHz") begin  period_``_freq = 1000/(250); end \
        else if ( "_freq" == "500MHz") begin  period_``_freq = 1000/(500); end \
        else if ( "_freq" == "800MHz") begin  period_``_freq = 1.25; end \
        else if(( "_freq" == "1000MHz")||( "_freq" == "1GHz")) \
                                          begin  period_``_freq =  1 ; end \
        else                              begin  period_``_freq = 100; end \
        tb_clk_``_freq <= $random();\
        forever begin\
                #(period_``_freq/2);\
                tb_clk_``_freq <= ~tb_clk_``_freq;\
        end \
    end

`CLK_GENERATE(10MHz)
`CLK_GENERATE(100MHz)
`CLK_GENERATE(20MHz)

serdes_common_tx_v_4x u_TMDP_phy(
    .RING_BPHY_pll_cmldisp1Clk_p( tb_clk_100MHz),
    .RING_BPHY_pll_cmldisp1Clk_n(~tb_clk_100MHz),
    .RING_BPHY_pll_cmldisp2Clk_p( tb_clk_10MHz),
    .RING_BPHY_pll_cmldisp2Clk_n(~tb_clk_10MHz),
    .RING_BPHY_pll_cmldisp3Clk_p( tb_clk_10MHz),
    .RING_BPHY_pll_cmldisp3Clk_n(~tb_clk_10MHz),
    .RING_BPHY_pll_cmldisp4Clk_p( tb_clk_10MHz),
    .RING_BPHY_pll_cmldisp4Clk_n(~tb_clk_10MHz),
    .CHIP_BPHY_pll_cmosdisp1Clk_p(tb_clk_100MHz),
    .CHIP_BPHY_pll_cmosdisp2Clk_p(tb_clk_10MHz),
    .CHIP_BPHY_pll_cmosdisp3Clk_p(tb_clk_10MHz),
    .CHIP_BPHY_pll_cmosdisp4Clk_p(tb_clk_10MHz),
    .DFT_BPHY_testerMode(1'b0),
    .DFT_BPHY_testMode(1'b0),
    .DFT_BPHY_selectWsp(DUT.STAC_2_SelectWSP),
    .DFT_BPHY_tms(DUT.STAC_2_Tms),
    .DFT_BPHY_wrck(DUT.STAC_2_Wrck),
    .DFT_BPHY_wrstn(DUT.STAC_2_WrstN),
    .DFT_BPHY_wsi(DUT.STAC_2_Wsi),
    .DFT_BPHY_altTapEn(DUT.STAC_2_AltTapEn),
    .BPHY_DFT_altTdoEn(DUT.STAC_2_AltTdoEn),
    .BPHY_DFT_wso(DUT.STAC_2_Wso),
    .PCS_BPHY_reset_l(~reset),
    .DFT_BPHY_edtUpdate(1'b0),
    .DFT_BPHY_scanShiftEn(1'b0),
    .PCS_BPHY_cfg_ssclk(tb_clk_20MHz),
    .PCS_BPHY_cfg_mstrAck(1'b0),
    .PCS_BPHY_cfg_rdEn(1'b0),
    .PCS_BPHY_cfg_wrEn(1'b0),
    .DFT_BPHY_scanClk(tck),
    .PCS_BPHY_tx0_clk(tb_clk_20MHz),
    .PCS_BPHY_tx0_ctl(2'b0),
    .PCS_BPHY_tx1_clk(tb_clk_20MHz),
    .PCS_BPHY_tx1_ctl(2'b0),
    .PCS_BPHY_tx2_clk(tb_clk_20MHz),
    .PCS_BPHY_tx2_ctl(2'b0),
    .PCS_BPHY_tx3_clk(tb_clk_20MHz),
    .PCS_BPHY_tx3_ctl(2'b0),
    .RING_BPHY_misc_pwrOkVddcore(pwrOkVddcore),
    .DFT_BPHY_stopOnSkd(1'b0),
    .DFT_BPHY_bsrAcMode(1'b0),
    .DFT_BPHY_bsrAcTest(1'b0),
    .DFT_BPHY_bsrCapture(1'b0),
    .DFT_BPHY_bsrHysClk(1'b0),
    .DFT_BPHY_bsrMode(1'b0),
    .DFT_BPHY_bsrShift(1'b0),
    .DFT_BPHY_bsrSi(1'b0),
    .DFT_BPHY_bsrTck(1'b0),
    .DFT_BPHY_bsrToggle(1'b0),
    .DFT_BPHY_bsrUpdate(1'b0),
    .DFT_BPHY_test_flyoverEn(4'b0),
    .PCS_BPHY_txsb0_flyoverData(2'b0),
    .PCS_BPHY_txsb0_flyoverEn(1'b0),
    .PCS_BPHY_txsb0_highImpIdle(1'b0),
    .PCS_BPHY_txsb1_flyoverData(2'b0),
    .PCS_BPHY_txsb1_flyoverEn(1'b0),
    .PCS_BPHY_txsb1_highImpIdle(1'b0),
    .PCS_BPHY_txsb2_flyoverData(2'b0),
    .PCS_BPHY_txsb2_flyoverEn(1'b0),
    .PCS_BPHY_txsb2_highImpIdle(1'b0),
    .PCS_BPHY_txsb3_flyoverData(2'b0),
    .PCS_BPHY_txsb3_flyoverEn(1'b0),
    .PCS_BPHY_txsb3_highImpIdle(1'b0),
    .ZCAL_BPHY_ron_gray_code(5'b0),
    .ZCAL_BPHY_cfg_rdDatVld(1'b0),
    .ZCAL_BPHY_cfg_rdData(32'b0),
    .VDD_CORE(1'b1),
    .VDD_PHY(1'b1),
    .VDD_PLL(1'b1),
    .VSS(1'b0)
);
`endif //TMDPPHY_AVAILABLE

`endif
