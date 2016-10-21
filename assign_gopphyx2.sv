`ifndef _ASSIGN_GOPPHYX2_SV
`define _ASSIGN_GOPPHYX2_SV

    //`ifndef _REFCLK_PHY_GEN
    //`define _REFCLK_PHY_GEN
    //reg refclk_phy = $random();
    //initial forever begin
    //        #(10/2);
    //        refclk_phy <= ~refclk_phy;
    //end

    //assign DUT.RefClk_p = refclk_phy ;
    //assign DUT.RefClk_n =~refclk_phy ;
    //`endif

    `ifndef _ASSIGN_GOPPHYX4_SV
    reg tx0_req ;
    reg tx1_req ;
    reg rx0_req ;
    reg rx1_req ;
    reg tx0_clk_rdy;
    reg tx1_clk_rdy;
    `endif


    `define GOP_X2_PATH DUT.goppphy_dft_wrapper_x2_u
    assign `GOP_X2_PATH.MTAP_Capture =  1'b0;
    assign `GOP_X2_PATH.MTAP_Capture_Pos =  1'b0;
    assign `GOP_X2_PATH.MTAP_Update =  1'b0;
    assign `GOP_X2_PATH.MTAP_Shift =  1'b0;
    assign `GOP_X2_PATH.MTAP_Shift_Pos =  1'b0;
    assign `GOP_X2_PATH.MTAP_SampleEn =  1'b0;
    assign `GOP_X2_PATH.MTAP_ExtestEn =  1'b0;
    assign `GOP_X2_PATH.MTAP_IntestEn =  1'b0;
    assign `GOP_X2_PATH.MTAP_TrainEn =  1'b0;
    assign `GOP_X2_PATH.MTAP_PulseEn =  1'b0;
    assign `GOP_X2_PATH.MTAP_ClampEn =  1'b0;
    assign `GOP_X2_PATH.MTAP_HizEn =  1'b0;
    assign `GOP_X2_PATH.MTAP_Actest =  1'b0;
    assign `GOP_X2_PATH.MTAP_Acmode =  1'b0;
    assign `GOP_X2_PATH.MTAP_Hystclk =  1'b0;
    assign `GOP_X2_PATH.MTAP_Tck =  1'b0;
    assign `GOP_X2_PATH.MTAP_Rti =  1'b0;
    assign `GOP_X2_PATH.MTAP_PauseDr =  1'b0;
    assign `GOP_X2_PATH.MTAP_SelectDr =  1'b0;
    assign `GOP_X2_PATH.CORE_DFTG_ScanShiftEn   = 1'b0;
    assign `GOP_X2_PATH.CORE_DFTG_ScanShiftClk  = tck_clk_if.clk;
    assign `GOP_X2_PATH.CORE_DFTG_ScanClk       = tck_clk_if.clk;
    assign `GOP_X2_PATH.DFTG_COMBOGOP_pcs_pwr_stable   = 1'b1;
    assign `GOP_X2_PATH.DFTG_COMBOGOP_pg_mode_en   = 1'b0;

    assign `GOP_X2_PATH.mpllb_force_en       = 1'b0;
    assign `GOP_X2_PATH.pma_pwr_stable       = 1'b1;
    assign `GOP_X2_PATH.ref_alt_clk_m   = 1'b0;
    assign `GOP_X2_PATH.ref_alt_clk_p   = 1'b0;
    assign `GOP_X2_PATH.ref_clk_mplla_div2_en   = 1'b0;
    assign `GOP_X2_PATH.ref_clk_mpllb_div2_en   = 1'b1;
    assign `GOP_X2_PATH.ref_range   = 3'h3;
    assign `GOP_X2_PATH.ref_repeat_clk_en       = 1'b1;
    assign `GOP_X2_PATH.rx_vref_ctrl            = 5'hf;
    assign `GOP_X2_PATH.cr_para_clk            = tck_clk_if.clk;
    assign `GOP_X2_PATH.DFTG_COMBOGOP_bs_rx_bigswing = 1'h1;
    assign `GOP_X2_PATH.DFTG_COMBOGOP_bs_rx_init     = 1'h0;
    assign `GOP_X2_PATH.lane0_rx2tx_par_lb_en= 1'h0;
    assign `GOP_X2_PATH.lane0_tx2rx_ser_lb_en= 1'h0;
    assign `GOP_X2_PATH.lane1_rx2tx_par_lb_en= 1'h0;
    assign `GOP_X2_PATH.lane1_tx2rx_ser_lb_en= 1'h0;
    assign `GOP_X2_PATH.rx0_adapt_afe_en      = 0;
    assign `GOP_X2_PATH.rx0_adapt_dfe_en      = 0;
    assign `GOP_X2_PATH.rx0_align_en          = 0;
    assign `GOP_X2_PATH.rx0_cdr_ssc_en        = 0;
    assign `GOP_X2_PATH.rx0_cdr_track_en      = 1'b1;
    assign `GOP_X2_PATH.rx0_clk_shift         = 0;
    assign `GOP_X2_PATH.rx0_disable           = 0;
    assign `GOP_X2_PATH.rx0_div16p5_clk_en    = 0;
    assign `GOP_X2_PATH.rx0_eq_att_lvl        = 0;
    assign `GOP_X2_PATH.rx0_eq_ctle_boost     = 4'd6;
    assign `GOP_X2_PATH.rx0_eq_ctle_pole      = 0;
    assign `GOP_X2_PATH.rx0_eq_dfe_tap1       = 0;
    assign `GOP_X2_PATH.rx0_eq_vga1_gain      = 'd7;
    assign `GOP_X2_PATH.rx0_eq_vga2_gain      = 'd7;
    assign `GOP_X2_PATH.rx0_invert            = 0;
    assign `GOP_X2_PATH.rx0_los_lfps_en       = 0;
    assign `GOP_X2_PATH.rx0_req               = rx0_req;
    assign `GOP_X2_PATH.rx0_term_acdc         = 0;
    assign `GOP_X2_PATH.rx0_term_en           = 0;
    assign `GOP_X2_PATH.rx1_adapt_afe_en      = 0;
    assign `GOP_X2_PATH.rx1_adapt_dfe_en      = 0;
    assign `GOP_X2_PATH.rx1_align_en          = 0;
    assign `GOP_X2_PATH.rx1_cdr_ssc_en        = 0;
    assign `GOP_X2_PATH.rx1_cdr_track_en      = 1'b1;
    assign `GOP_X2_PATH.rx1_clk_shift         = 0;
    assign `GOP_X2_PATH.rx1_disable           = 0;
    assign `GOP_X2_PATH.rx1_div16p5_clk_en    = 0;
    assign `GOP_X2_PATH.rx1_eq_att_lvl        = 0;
    assign `GOP_X2_PATH.rx1_eq_ctle_boost     = 4'd6;
    assign `GOP_X2_PATH.rx1_eq_ctle_pole      = 0;
    assign `GOP_X2_PATH.rx1_eq_dfe_tap1       = 0;
    assign `GOP_X2_PATH.rx1_eq_vga1_gain      = 'd7;
    assign `GOP_X2_PATH.rx1_eq_vga2_gain      = 'd7;
    assign `GOP_X2_PATH.rx1_invert            = 0;
    assign `GOP_X2_PATH.rx1_los_lfps_en       = 0;
    assign `GOP_X2_PATH.rx1_req               = rx1_req;
    assign `GOP_X2_PATH.rx1_term_acdc         = 0;
    assign `GOP_X2_PATH.rx1_term_en           = 0;
    assign `GOP_X2_PATH.tx0_beacon_en         = 0;
    assign `GOP_X2_PATH.tx0_clk_rdy           = tx0_clk_rdy;
    assign `GOP_X2_PATH.tx0_detrx_req         = 0;
    assign `GOP_X2_PATH.tx0_disable           = 0;
    assign `GOP_X2_PATH.tx0_eq_main           = 'h28;
    assign `GOP_X2_PATH.tx0_eq_post           = 0;
    assign `GOP_X2_PATH.tx0_eq_pre            = 0;
    assign `GOP_X2_PATH.tx0_iboost_lvl        = 'hf;
    assign `GOP_X2_PATH.tx0_invert            = 0;
    assign `GOP_X2_PATH.tx0_req               = tx0_req;
    assign `GOP_X2_PATH.tx0_vboost_en         = 0;
    assign `GOP_X2_PATH.tx0_clk               = `GOP_X2_PATH.dwc_e12mp_phy_x2_ns_u.tx0_mpllb_sel?`GOP_X2_PATH.mpllb_word_clk:`GOP_X2_PATH.mplla_word_clk;
    assign `GOP_X2_PATH.tx0_data              = 0;
    assign `GOP_X2_PATH.tx0_data_en           = 0;
    assign `GOP_X2_PATH.tx1_beacon_en         = 0;
    assign `GOP_X2_PATH.tx1_clk_rdy           = tx1_clk_rdy;
    assign `GOP_X2_PATH.tx1_detrx_req         = 0;
    assign `GOP_X2_PATH.tx1_disable           = 0;
    assign `GOP_X2_PATH.tx1_eq_main           = 'h28;
    assign `GOP_X2_PATH.tx1_eq_post           = 0;
    assign `GOP_X2_PATH.tx1_eq_pre            = 0;
    assign `GOP_X2_PATH.tx1_iboost_lvl        = 'hf;
    assign `GOP_X2_PATH.tx1_invert            = 0;
    assign `GOP_X2_PATH.tx1_req               = tx1_req;
    assign `GOP_X2_PATH.tx1_vboost_en         = 0;
    assign `GOP_X2_PATH.tx1_clk               = `GOP_X2_PATH.dwc_e12mp_phy_x2_ns_u.tx1_mpllb_sel?`GOP_X2_PATH.mpllb_word_clk:`GOP_X2_PATH.mplla_word_clk;
    assign `GOP_X2_PATH.tx1_data              = 0;
    assign `GOP_X2_PATH.tx1_data_en           = 0;
    assign `GOP_X2_PATH.test_flyover_en       = 0;                 //  1'b0
    assign `GOP_X2_PATH.tx0_flyover_data_m    = 0;                 //  1'b0
    assign `GOP_X2_PATH.tx0_flyover_data_p    = 0;                 //  1'b0
    assign `GOP_X2_PATH.tx1_flyover_data_m    = 0;                 //  1'b0
    assign `GOP_X2_PATH.tx1_flyover_data_p    = 0;                 //  1'b0

    assign `GOP_X2_PATH.tx0_mpll_en       = 1'b1;
    assign `GOP_X2_PATH.tx1_mpll_en       = 1'b1;
    assign `GOP_X2_PATH.tx0_master_mplla_state       = `GOP_X2_PATH.mplla_state;
    assign `GOP_X2_PATH.tx1_master_mplla_state       = `GOP_X2_PATH.mplla_state;
    assign `GOP_X2_PATH.tx0_master_mpllb_state       = `GOP_X2_PATH.mpllb_state;
    assign `GOP_X2_PATH.tx1_master_mpllb_state       = `GOP_X2_PATH.mpllb_state;

    assign `GOP_X2_PATH.rx0_p               = (`GOP_X2_PATH.dwc_e12mp_phy_x2_ns_u.lane0_rx2tx_par_lb_en|| `GOP_X2_PATH.dwc_e12mp_phy_x2_ns_u.lane0_tx2rx_ser_lb_en) ? 1'bz : `GOP_X2_PATH.tx0_p;
    assign `GOP_X2_PATH.rx0_m               = (`GOP_X2_PATH.dwc_e12mp_phy_x2_ns_u.lane0_rx2tx_par_lb_en|| `GOP_X2_PATH.dwc_e12mp_phy_x2_ns_u.lane0_tx2rx_ser_lb_en) ? 1'bz : `GOP_X2_PATH.tx0_m;
    assign `GOP_X2_PATH.rx1_p               = (`GOP_X2_PATH.dwc_e12mp_phy_x2_ns_u.lane1_rx2tx_par_lb_en|| `GOP_X2_PATH.dwc_e12mp_phy_x2_ns_u.lane1_tx2rx_ser_lb_en) ? 1'bz : `GOP_X2_PATH.tx1_p;
    assign `GOP_X2_PATH.rx1_m               = (`GOP_X2_PATH.dwc_e12mp_phy_x2_ns_u.lane1_rx2tx_par_lb_en|| `GOP_X2_PATH.dwc_e12mp_phy_x2_ns_u.lane1_tx2rx_ser_lb_en) ? 1'bz : `GOP_X2_PATH.tx1_m;

 `ifndef _ASSIGN_GOPPHYX4_SV
 initial 
  begin
   tx0_req = 1'b0;
   tx1_req = 1'b0;
   rx0_req = 1'b0;
   rx1_req = 1'b0;
   tx0_clk_rdy = 1'b0;
   tx1_clk_rdy = 1'b0;
  end
 `endif



    `define PHY_X2_TOP `GOP_X2_PATH.dwc_e12mp_phy_x2_ns_u

 `ifdef _GOPPHYX2_IS_REAL
 initial 
  begin
   force `PHY_X2_TOP.pcs_raw.lane0.lane_pcs_xface.rx_ovrd_out_en = 1'b0;
   force `PHY_X2_TOP.pcs_raw.lane1.lane_pcs_xface.rx_ovrd_out_en = 1'b0;
   fork 
    begin 
       force `PHY_X2_TOP.pma.dig.lane0.rx.pwr_ctl.rx_word_ckg.en_f_reg.GN  = 1'b1; 
       force `PHY_X2_TOP.pma.dig.lane0.rx.pwr_ctl.rx_word_ckg.en_f_reg.D   = 1'b0; 
       force `PHY_X2_TOP.pma.dig.lane0.rx.pwr_ctl.rx_dword_ckg.en_f_reg.GN = 1'b1; 
       force `PHY_X2_TOP.pma.dig.lane0.rx.pwr_ctl.rx_dword_ckg.en_f_reg.D  = 1'b0; 
       force `PHY_X2_TOP.pma.dig.lane0.rx.rx_dword_word_glcm.clk_a_s_gate.en_f_reg.GN = 1'b1; 
       force `PHY_X2_TOP.pma.dig.lane0.rx.rx_dword_word_glcm.clk_a_s_gate.en_f_reg.D = 1'b0; 
       force `PHY_X2_TOP.pma.dig.lane0.rx.rx_dword_word_glcm.clk_b_s_gate.en_f_reg.GN = 1'b1; 
       force `PHY_X2_TOP.pma.dig.lane0.rx.rx_dword_word_glcm.clk_b_s_gate.en_f_reg.D = 1'b0; 
       #20 ;
       force `PHY_X2_TOP.pma.dig.lane0.rx.pwr_ctl.rx_word_ckg.en_f_reg.GN  = 1'b0; 
       force `PHY_X2_TOP.pma.dig.lane0.rx.pwr_ctl.rx_dword_ckg.en_f_reg.GN = 1'b0; 
       force `PHY_X2_TOP.pma.dig.lane0.rx.rx_dword_word_glcm.clk_a_s_gate.en_f_reg.GN = 1'b0; 
       force `PHY_X2_TOP.pma.dig.lane0.rx.rx_dword_word_glcm.clk_b_s_gate.en_f_reg.GN = 1'b0; 
       #10;
       release `PHY_X2_TOP.pma.dig.lane0.rx.pwr_ctl.rx_word_ckg.en_f_reg.GN; 
       release `PHY_X2_TOP.pma.dig.lane0.rx.pwr_ctl.rx_dword_ckg.en_f_reg.GN; 
       release `PHY_X2_TOP.pma.dig.lane0.rx.rx_dword_word_glcm.clk_a_s_gate.en_f_reg.GN ; 
       release `PHY_X2_TOP.pma.dig.lane0.rx.rx_dword_word_glcm.clk_b_s_gate.en_f_reg.GN ; 
       #1;
       release `PHY_X2_TOP.pma.dig.lane0.rx.pwr_ctl.rx_word_ckg.en_f_reg.D  ; 
       release `PHY_X2_TOP.pma.dig.lane0.rx.pwr_ctl.rx_dword_ckg.en_f_reg.D  ; 
       release `PHY_X2_TOP.pma.dig.lane0.rx.rx_dword_word_glcm.clk_a_s_gate.en_f_reg.D; 
       release `PHY_X2_TOP.pma.dig.lane0.rx.rx_dword_word_glcm.clk_b_s_gate.en_f_reg.D; 
     end
     begin
       force `PHY_X2_TOP.pma.dig.lane1.rx.pwr_ctl.rx_word_ckg.en_f_reg.GN  = 1'b1; 
       force `PHY_X2_TOP.pma.dig.lane1.rx.pwr_ctl.rx_word_ckg.en_f_reg.D   = 1'b0; 
       force `PHY_X2_TOP.pma.dig.lane1.rx.pwr_ctl.rx_dword_ckg.en_f_reg.GN = 1'b1; 
       force `PHY_X2_TOP.pma.dig.lane1.rx.pwr_ctl.rx_dword_ckg.en_f_reg.D  = 1'b0; 
       force `PHY_X2_TOP.pma.dig.lane1.rx.rx_dword_word_glcm.clk_a_s_gate.en_f_reg.GN = 1'b1; 
       force `PHY_X2_TOP.pma.dig.lane1.rx.rx_dword_word_glcm.clk_a_s_gate.en_f_reg.D = 1'b0; 
       force `PHY_X2_TOP.pma.dig.lane1.rx.rx_dword_word_glcm.clk_b_s_gate.en_f_reg.GN = 1'b1; 
       force `PHY_X2_TOP.pma.dig.lane1.rx.rx_dword_word_glcm.clk_b_s_gate.en_f_reg.D = 1'b0; 
       #20;
       force `PHY_X2_TOP.pma.dig.lane1.rx.pwr_ctl.rx_word_ckg.en_f_reg.GN = 1'b0; 
       force `PHY_X2_TOP.pma.dig.lane1.rx.pwr_ctl.rx_dword_ckg.en_f_reg.GN = 1'b0; 
       force `PHY_X2_TOP.pma.dig.lane1.rx.rx_dword_word_glcm.clk_a_s_gate.en_f_reg.GN = 1'b0; 
       force `PHY_X2_TOP.pma.dig.lane1.rx.rx_dword_word_glcm.clk_b_s_gate.en_f_reg.GN = 1'b0; 
       #10;
       release  `PHY_X2_TOP.pma.dig.lane1.rx.pwr_ctl.rx_word_ckg.en_f_reg.GN ; 
       release  `PHY_X2_TOP.pma.dig.lane1.rx.pwr_ctl.rx_dword_ckg.en_f_reg.GN ; 
       release  `PHY_X2_TOP.pma.dig.lane1.rx.rx_dword_word_glcm.clk_a_s_gate.en_f_reg.GN; 
       release  `PHY_X2_TOP.pma.dig.lane1.rx.rx_dword_word_glcm.clk_b_s_gate.en_f_reg.GN; 
       #1;
       release  `PHY_X2_TOP.pma.dig.lane1.rx.pwr_ctl.rx_word_ckg.en_f_reg.D  ; 
       release  `PHY_X2_TOP.pma.dig.lane1.rx.pwr_ctl.rx_dword_ckg.en_f_reg.D  ; 
       release  `PHY_X2_TOP.pma.dig.lane1.rx.rx_dword_word_glcm.clk_a_s_gate.en_f_reg.D; 
       release  `PHY_X2_TOP.pma.dig.lane1.rx.rx_dword_word_glcm.clk_b_s_gate.en_f_reg.D; 
     end
   join
  end
 `endif // _GOPPHYX2_IS_REAL

`endif
