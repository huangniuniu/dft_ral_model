`ifndef _ASSIGN_GOPPHYX4_SV
`define _ASSIGN_GOPPHYX4_SV

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

    `ifndef _ASSIGN_GOPPHYX2_SV
    reg tx0_req ;
    reg tx1_req ;
    reg rx0_req ;
    reg rx1_req ;
    reg tx0_clk_rdy;
    reg tx1_clk_rdy;
    `endif

    reg tx2_req ;
    reg tx3_req ;
    reg rx2_req ;
    reg rx3_req ;
    reg tx2_clk_rdy;
    reg tx3_clk_rdy;


    `define GOP_X4_PATH DUT.goppphy_dft_wrapper_x4_u
    assign `GOP_X4_PATH.MTAP_Capture =  1'b0;
    assign `GOP_X4_PATH.MTAP_Capture_Pos =  1'b0;
    assign `GOP_X4_PATH.MTAP_Update =  1'b0;
    assign `GOP_X4_PATH.MTAP_Shift =  1'b0;
    assign `GOP_X4_PATH.MTAP_Shift_Pos =  1'b0;
    assign `GOP_X4_PATH.MTAP_SampleEn =  1'b0;
    assign `GOP_X4_PATH.MTAP_ExtestEn =  1'b0;
    assign `GOP_X4_PATH.MTAP_IntestEn =  1'b0;
    assign `GOP_X4_PATH.MTAP_TrainEn =  1'b0;
    assign `GOP_X4_PATH.MTAP_PulseEn =  1'b0;
    assign `GOP_X4_PATH.MTAP_ClampEn =  1'b0;
    assign `GOP_X4_PATH.MTAP_HizEn =  1'b0;
    assign `GOP_X4_PATH.MTAP_Actest =  1'b0;
    assign `GOP_X4_PATH.MTAP_Acmode =  1'b0;
    assign `GOP_X4_PATH.MTAP_Hystclk =  1'b0;
    assign `GOP_X4_PATH.MTAP_Tck =  1'b0;
    assign `GOP_X4_PATH.MTAP_Rti =  1'b0;
    assign `GOP_X4_PATH.MTAP_PauseDr =  1'b0;
    assign `GOP_X4_PATH.MTAP_SelectDr =  1'b0;
    assign `GOP_X4_PATH.CORE_DFTG_ScanShiftEn   = 1'b0;
    assign `GOP_X4_PATH.CORE_DFTG_ScanShiftClk  = tck_clk_if.clk;
    assign `GOP_X4_PATH.CORE_DFTG_ScanClk       = tck_clk_if.clk;
    assign `GOP_X4_PATH.DFTG_CORE_pcs_pwr_stable   = 1'b1;
    assign `GOP_X4_PATH.DFTG_CORE_pg_mode_en   = 1'b0;

    assign `GOP_X4_PATH.mpllb_force_en       = 1'b0;
    assign `GOP_X4_PATH.pma_pwr_stable       = 1'b1;
    assign `GOP_X4_PATH.ref_alt_clk_m   = 1'b0;
    assign `GOP_X4_PATH.ref_alt_clk_p   = 1'b0;
    assign `GOP_X4_PATH.ref_clk_mplla_div2_en   = 1'b0;
    assign `GOP_X4_PATH.ref_clk_mpllb_div2_en   = 1'b1;
    assign `GOP_X4_PATH.ref_range   = 3'h3;
    assign `GOP_X4_PATH.ref_repeat_clk_en       = 1'b1;
    assign `GOP_X4_PATH.rx_vref_ctrl            = 5'hf;
    assign `GOP_X4_PATH.cr_para_clk            = tck_clk_if.clk;
    assign `GOP_X4_PATH.DFTG_COMBOGOP_bs_rx_bigswing = 1'h1;
    assign `GOP_X4_PATH.DFTG_COMBOGOP_bs_rx_init     = 1'h0;
    assign `GOP_X4_PATH.lane0_rx2tx_par_lb_en= 1'h0;
    assign `GOP_X4_PATH.lane0_tx2rx_ser_lb_en= 1'h0;
    assign `GOP_X4_PATH.lane1_rx2tx_par_lb_en= 1'h0;
    assign `GOP_X4_PATH.lane1_tx2rx_ser_lb_en= 1'h0;
    assign `GOP_X4_PATH.lane2_rx2tx_par_lb_en= 1'h0;
    assign `GOP_X4_PATH.lane2_tx2rx_ser_lb_en= 1'h0;
    assign `GOP_X4_PATH.lane3_rx2tx_par_lb_en= 1'h0;
    assign `GOP_X4_PATH.lane3_tx2rx_ser_lb_en= 1'h0;
    assign `GOP_X4_PATH.rx0_adapt_afe_en      = 0;
    assign `GOP_X4_PATH.rx0_adapt_dfe_en      = 0;
    assign `GOP_X4_PATH.rx0_align_en          = 0;
    assign `GOP_X4_PATH.rx0_cdr_ssc_en        = 0;
    assign `GOP_X4_PATH.rx0_cdr_track_en      = 1'b1;
    assign `GOP_X4_PATH.rx0_clk_shift         = 0;
    assign `GOP_X4_PATH.rx0_disable           = 0;
    assign `GOP_X4_PATH.rx0_div16p5_clk_en    = 0;
    assign `GOP_X4_PATH.rx0_eq_att_lvl        = 0;
    assign `GOP_X4_PATH.rx0_eq_ctle_boost     = 4'd6;
    assign `GOP_X4_PATH.rx0_eq_ctle_pole      = 0;
    assign `GOP_X4_PATH.rx0_eq_dfe_tap1       = 0;
    assign `GOP_X4_PATH.rx0_eq_vga1_gain      = 'd7;
    assign `GOP_X4_PATH.rx0_eq_vga2_gain      = 'd7;
    assign `GOP_X4_PATH.rx0_invert            = 0;
    assign `GOP_X4_PATH.rx0_los_lfps_en       = 0;
    assign `GOP_X4_PATH.rx0_req               = rx0_req;
    assign `GOP_X4_PATH.rx0_term_acdc         = 0;
    assign `GOP_X4_PATH.rx0_term_en           = 0;
    assign `GOP_X4_PATH.rx1_adapt_afe_en      = 0;
    assign `GOP_X4_PATH.rx1_adapt_dfe_en      = 0;
    assign `GOP_X4_PATH.rx1_align_en          = 0;
    assign `GOP_X4_PATH.rx1_cdr_ssc_en        = 0;
    assign `GOP_X4_PATH.rx1_cdr_track_en      = 1'b1;
    assign `GOP_X4_PATH.rx1_clk_shift         = 0;
    assign `GOP_X4_PATH.rx1_disable           = 0;
    assign `GOP_X4_PATH.rx1_div16p5_clk_en    = 0;
    assign `GOP_X4_PATH.rx1_eq_att_lvl        = 0;
    assign `GOP_X4_PATH.rx1_eq_ctle_boost     = 4'd6;
    assign `GOP_X4_PATH.rx1_eq_ctle_pole      = 0;
    assign `GOP_X4_PATH.rx1_eq_dfe_tap1       = 0;
    assign `GOP_X4_PATH.rx1_eq_vga1_gain      = 'd7;
    assign `GOP_X4_PATH.rx1_eq_vga2_gain      = 'd7;
    assign `GOP_X4_PATH.rx1_invert            = 0;
    assign `GOP_X4_PATH.rx1_los_lfps_en       = 0;
    assign `GOP_X4_PATH.rx1_req               = rx1_req;
    assign `GOP_X4_PATH.rx1_term_acdc         = 0;
    assign `GOP_X4_PATH.rx1_term_en           = 0;
    assign `GOP_X4_PATH.rx2_adapt_afe_en      = 0;
    assign `GOP_X4_PATH.rx2_adapt_dfe_en      = 0;
    assign `GOP_X4_PATH.rx2_align_en          = 0;
    assign `GOP_X4_PATH.rx2_cdr_ssc_en        = 0;
    assign `GOP_X4_PATH.rx2_cdr_track_en      = 1'b1;
    assign `GOP_X4_PATH.rx2_clk_shift         = 0;
    assign `GOP_X4_PATH.rx2_disable           = 0;
    assign `GOP_X4_PATH.rx2_div16p5_clk_en    = 0;
    assign `GOP_X4_PATH.rx2_eq_att_lvl        = 0;
    assign `GOP_X4_PATH.rx2_eq_ctle_boost     = 4'd6;
    assign `GOP_X4_PATH.rx2_eq_ctle_pole      = 0;
    assign `GOP_X4_PATH.rx2_eq_dfe_tap1       = 0;
    assign `GOP_X4_PATH.rx2_eq_vga1_gain      = 'd7;
    assign `GOP_X4_PATH.rx2_eq_vga2_gain      = 'd7;
    assign `GOP_X4_PATH.rx2_invert            = 0;
    assign `GOP_X4_PATH.rx2_los_lfps_en       = 0;
    assign `GOP_X4_PATH.rx2_req               = rx2_req;
    assign `GOP_X4_PATH.rx2_term_acdc         = 0;
    assign `GOP_X4_PATH.rx2_term_en           = 0;
    assign `GOP_X4_PATH.rx3_adapt_afe_en      = 0;
    assign `GOP_X4_PATH.rx3_adapt_dfe_en      = 0;
    assign `GOP_X4_PATH.rx3_align_en          = 0;
    assign `GOP_X4_PATH.rx3_cdr_ssc_en        = 0;
    assign `GOP_X4_PATH.rx3_cdr_track_en      = 1'b1;
    assign `GOP_X4_PATH.rx3_clk_shift         = 0;
    assign `GOP_X4_PATH.rx3_disable           = 0;
    assign `GOP_X4_PATH.rx3_div16p5_clk_en    = 0;
    assign `GOP_X4_PATH.rx3_eq_att_lvl        = 0;
    assign `GOP_X4_PATH.rx3_eq_ctle_boost     = 4'd6;
    assign `GOP_X4_PATH.rx3_eq_ctle_pole      = 0;
    assign `GOP_X4_PATH.rx3_eq_dfe_tap1       = 0;
    assign `GOP_X4_PATH.rx3_eq_vga1_gain      = 'd7;
    assign `GOP_X4_PATH.rx3_eq_vga2_gain      = 'd7;
    assign `GOP_X4_PATH.rx3_invert            = 0;
    assign `GOP_X4_PATH.rx3_los_lfps_en       = 0;
    assign `GOP_X4_PATH.rx3_req               = rx3_req;
    assign `GOP_X4_PATH.rx3_term_acdc         = 0;
    assign `GOP_X4_PATH.rx3_term_en           = 0;
    assign `GOP_X4_PATH.tx0_beacon_en         = 0;
    assign `GOP_X4_PATH.tx0_clk_rdy           = tx0_clk_rdy;
    assign `GOP_X4_PATH.tx0_detrx_req         = 0;
    assign `GOP_X4_PATH.tx0_disable           = 0;
    assign `GOP_X4_PATH.tx0_eq_main           = 'h28;
    assign `GOP_X4_PATH.tx0_eq_post           = 0;
    assign `GOP_X4_PATH.tx0_eq_pre            = 0;
    assign `GOP_X4_PATH.tx0_iboost_lvl        = 'hf;
    assign `GOP_X4_PATH.tx0_invert            = 0;
    assign `GOP_X4_PATH.tx0_req               = tx0_req;
    assign `GOP_X4_PATH.tx0_vboost_en         = 0;
    assign `GOP_X4_PATH.tx0_clk               = `GOP_X4_PATH.dwc_e12mp_phy_x4_ns_u.tx0_mpllb_sel?`GOP_X4_PATH.mpllb_word_clk:`GOP_X4_PATH.mplla_word_clk;
    assign `GOP_X4_PATH.tx0_data              = 0;
    assign `GOP_X4_PATH.tx0_data_en           = 0;
    assign `GOP_X4_PATH.tx1_beacon_en         = 0;
    assign `GOP_X4_PATH.tx1_clk_rdy           = tx1_clk_rdy;
    assign `GOP_X4_PATH.tx1_detrx_req         = 0;
    assign `GOP_X4_PATH.tx1_disable           = 0;
    assign `GOP_X4_PATH.tx1_eq_main           = 'h28;
    assign `GOP_X4_PATH.tx1_eq_post           = 0;
    assign `GOP_X4_PATH.tx1_eq_pre            = 0;
    assign `GOP_X4_PATH.tx1_iboost_lvl        = 'hf;
    assign `GOP_X4_PATH.tx1_invert            = 0;
    assign `GOP_X4_PATH.tx1_req               = tx1_req;
    assign `GOP_X4_PATH.tx1_vboost_en         = 0;
    assign `GOP_X4_PATH.tx1_clk               = `GOP_X4_PATH.dwc_e12mp_phy_x4_ns_u.tx1_mpllb_sel?`GOP_X4_PATH.mpllb_word_clk:`GOP_X4_PATH.mplla_word_clk;
    assign `GOP_X4_PATH.tx1_data              = 0;
    assign `GOP_X4_PATH.tx1_data_en           = 0;
    assign `GOP_X4_PATH.tx2_beacon_en         = 0;
    assign `GOP_X4_PATH.tx2_clk_rdy           = tx2_clk_rdy;
    assign `GOP_X4_PATH.tx2_detrx_req         = 0;
    assign `GOP_X4_PATH.tx2_disable           = 0;
    assign `GOP_X4_PATH.tx2_eq_main           = 'h28;
    assign `GOP_X4_PATH.tx2_eq_post           = 0;
    assign `GOP_X4_PATH.tx2_eq_pre            = 0;
    assign `GOP_X4_PATH.tx2_iboost_lvl        = 'hf;
    assign `GOP_X4_PATH.tx2_invert            = 0;
    assign `GOP_X4_PATH.tx2_req               = tx2_req;
    assign `GOP_X4_PATH.tx2_vboost_en         = 0;
    assign `GOP_X4_PATH.tx2_clk               = `GOP_X4_PATH.dwc_e12mp_phy_x4_ns_u.tx2_mpllb_sel?`GOP_X4_PATH.mpllb_word_clk:`GOP_X4_PATH.mplla_word_clk;
    assign `GOP_X4_PATH.tx2_data              = 0;
    assign `GOP_X4_PATH.tx2_data_en           = 0;
    assign `GOP_X4_PATH.tx3_beacon_en         = 0;
    assign `GOP_X4_PATH.tx3_clk_rdy           = tx3_clk_rdy;
    assign `GOP_X4_PATH.tx3_detrx_req         = 0;
    assign `GOP_X4_PATH.tx3_disable           = 0;
    assign `GOP_X4_PATH.tx3_eq_main           = 'h28;
    assign `GOP_X4_PATH.tx3_eq_post           = 0;
    assign `GOP_X4_PATH.tx3_eq_pre            = 0;
    assign `GOP_X4_PATH.tx3_iboost_lvl        = 'hf;
    assign `GOP_X4_PATH.tx3_invert            = 0;
    assign `GOP_X4_PATH.tx3_req               = tx3_req;
    assign `GOP_X4_PATH.tx3_vboost_en         = 0;
    assign `GOP_X4_PATH.tx3_clk               = `GOP_X4_PATH.dwc_e12mp_phy_x4_ns_u.tx3_mpllb_sel?`GOP_X4_PATH.mpllb_word_clk:`GOP_X4_PATH.mplla_word_clk;
    assign `GOP_X4_PATH.tx3_data              = 0;
    assign `GOP_X4_PATH.tx3_data_en           = 0;
    assign `GOP_X4_PATH.test_flyover_en       = 0;                 //  1'b0
    assign `GOP_X4_PATH.tx0_flyover_data_m    = 0;                 //  1'b0
    assign `GOP_X4_PATH.tx0_flyover_data_p    = 0;                 //  1'b0
    assign `GOP_X4_PATH.tx1_flyover_data_m    = 0;                 //  1'b0
    assign `GOP_X4_PATH.tx1_flyover_data_p    = 0;                 //  1'b0
    assign `GOP_X4_PATH.tx2_flyover_data_m    = 0;                 //  1'b0
    assign `GOP_X4_PATH.tx2_flyover_data_p    = 0;                 //  1'b0
    assign `GOP_X4_PATH.tx3_flyover_data_m    = 0;                 //  1'b0
    assign `GOP_X4_PATH.tx3_flyover_data_p    = 0;                 //  1'b0

    assign `GOP_X4_PATH.tx0_mpll_en       = 1'b1;
    assign `GOP_X4_PATH.tx1_mpll_en       = 1'b1;
    assign `GOP_X4_PATH.tx2_mpll_en       = 1'b1;
    assign `GOP_X4_PATH.tx3_mpll_en       = 1'b1;
    assign `GOP_X4_PATH.tx0_master_mplla_state       = `GOP_X4_PATH.mplla_state;
    assign `GOP_X4_PATH.tx1_master_mplla_state       = `GOP_X4_PATH.mplla_state;
    assign `GOP_X4_PATH.tx2_master_mplla_state       = `GOP_X4_PATH.mplla_state;
    assign `GOP_X4_PATH.tx3_master_mplla_state       = `GOP_X4_PATH.mplla_state;
    assign `GOP_X4_PATH.tx0_master_mpllb_state       = `GOP_X4_PATH.mpllb_state;
    assign `GOP_X4_PATH.tx1_master_mpllb_state       = `GOP_X4_PATH.mpllb_state;
    assign `GOP_X4_PATH.tx2_master_mpllb_state       = `GOP_X4_PATH.mpllb_state;
    assign `GOP_X4_PATH.tx3_master_mpllb_state       = `GOP_X4_PATH.mpllb_state;

    assign `GOP_X4_PATH.rx0_p               = (`GOP_X4_PATH.dwc_e12mp_phy_x4_ns_u.lane0_rx2tx_par_lb_en|| `GOP_X4_PATH.dwc_e12mp_phy_x4_ns_u.lane0_tx2rx_ser_lb_en) ? 1'bz : `GOP_X4_PATH.tx0_p;
    assign `GOP_X4_PATH.rx0_m               = (`GOP_X4_PATH.dwc_e12mp_phy_x4_ns_u.lane0_rx2tx_par_lb_en|| `GOP_X4_PATH.dwc_e12mp_phy_x4_ns_u.lane0_tx2rx_ser_lb_en) ? 1'bz : `GOP_X4_PATH.tx0_m;
    assign `GOP_X4_PATH.rx1_p               = (`GOP_X4_PATH.dwc_e12mp_phy_x4_ns_u.lane1_rx2tx_par_lb_en|| `GOP_X4_PATH.dwc_e12mp_phy_x4_ns_u.lane1_tx2rx_ser_lb_en) ? 1'bz : `GOP_X4_PATH.tx1_p;
    assign `GOP_X4_PATH.rx1_m               = (`GOP_X4_PATH.dwc_e12mp_phy_x4_ns_u.lane1_rx2tx_par_lb_en|| `GOP_X4_PATH.dwc_e12mp_phy_x4_ns_u.lane1_tx2rx_ser_lb_en) ? 1'bz : `GOP_X4_PATH.tx1_m;
    assign `GOP_X4_PATH.rx2_p               = (`GOP_X4_PATH.dwc_e12mp_phy_x4_ns_u.lane2_rx2tx_par_lb_en|| `GOP_X4_PATH.dwc_e12mp_phy_x4_ns_u.lane2_tx2rx_ser_lb_en) ? 1'bz : `GOP_X4_PATH.tx2_p;
    assign `GOP_X4_PATH.rx2_m               = (`GOP_X4_PATH.dwc_e12mp_phy_x4_ns_u.lane2_rx2tx_par_lb_en|| `GOP_X4_PATH.dwc_e12mp_phy_x4_ns_u.lane2_tx2rx_ser_lb_en) ? 1'bz : `GOP_X4_PATH.tx2_m;
    assign `GOP_X4_PATH.rx3_p               = (`GOP_X4_PATH.dwc_e12mp_phy_x4_ns_u.lane3_rx2tx_par_lb_en|| `GOP_X4_PATH.dwc_e12mp_phy_x4_ns_u.lane3_tx2rx_ser_lb_en) ? 1'bz : `GOP_X4_PATH.tx3_p;
    assign `GOP_X4_PATH.rx3_m               = (`GOP_X4_PATH.dwc_e12mp_phy_x4_ns_u.lane3_rx2tx_par_lb_en|| `GOP_X4_PATH.dwc_e12mp_phy_x4_ns_u.lane3_tx2rx_ser_lb_en) ? 1'bz : `GOP_X4_PATH.tx3_m;

 initial 
  begin
 `ifndef _ASSIGN_GOPPHYX2_SV
   tx0_req = 1'b0;
   tx1_req = 1'b0;
   rx0_req = 1'b0;
   rx1_req = 1'b0;
   tx0_clk_rdy = 1'b0;
   tx1_clk_rdy = 1'b0;
 `endif
   tx2_req = 1'b0;
   tx3_req = 1'b0;
   rx2_req = 1'b0;
   rx3_req = 1'b0;
   tx2_clk_rdy = 1'b0;
   tx3_clk_rdy = 1'b0;
  end



    `define PHY_X4_TOP `GOP_X4_PATH.dwc_e12mp_phy_x4_ns_u

 `ifdef _GOPPHYX4_IS_REAL
 initial 
  begin
   force `PHY_X4_TOP.pcs_raw.lane0.lane_pcs_xface.rx_ovrd_out_en = 1'b0;
   force `PHY_X4_TOP.pcs_raw.lane1.lane_pcs_xface.rx_ovrd_out_en = 1'b0;
   fork 
    begin 
       force `PHY_X4_TOP.pma.dig.lane0.rx.pwr_ctl.rx_word_ckg.en_f_reg.GN  = 1'b1; 
       force `PHY_X4_TOP.pma.dig.lane0.rx.pwr_ctl.rx_word_ckg.en_f_reg.D   = 1'b0; 
       force `PHY_X4_TOP.pma.dig.lane0.rx.pwr_ctl.rx_dword_ckg.en_f_reg.GN = 1'b1; 
       force `PHY_X4_TOP.pma.dig.lane0.rx.pwr_ctl.rx_dword_ckg.en_f_reg.D  = 1'b0; 
       force `PHY_X4_TOP.pma.dig.lane0.rx.rx_dword_word_glcm.clk_a_s_gate.en_f_reg.GN = 1'b1; 
       force `PHY_X4_TOP.pma.dig.lane0.rx.rx_dword_word_glcm.clk_a_s_gate.en_f_reg.D = 1'b0; 
       force `PHY_X4_TOP.pma.dig.lane0.rx.rx_dword_word_glcm.clk_b_s_gate.en_f_reg.GN = 1'b1; 
       force `PHY_X4_TOP.pma.dig.lane0.rx.rx_dword_word_glcm.clk_b_s_gate.en_f_reg.D = 1'b0; 
       #20 ;
       force `PHY_X4_TOP.pma.dig.lane0.rx.pwr_ctl.rx_word_ckg.en_f_reg.GN  = 1'b0; 
       force `PHY_X4_TOP.pma.dig.lane0.rx.pwr_ctl.rx_dword_ckg.en_f_reg.GN = 1'b0; 
       force `PHY_X4_TOP.pma.dig.lane0.rx.rx_dword_word_glcm.clk_a_s_gate.en_f_reg.GN = 1'b0; 
       force `PHY_X4_TOP.pma.dig.lane0.rx.rx_dword_word_glcm.clk_b_s_gate.en_f_reg.GN = 1'b0; 
       #10;
       release `PHY_X4_TOP.pma.dig.lane0.rx.pwr_ctl.rx_word_ckg.en_f_reg.GN; 
       release `PHY_X4_TOP.pma.dig.lane0.rx.pwr_ctl.rx_dword_ckg.en_f_reg.GN; 
       release `PHY_X4_TOP.pma.dig.lane0.rx.rx_dword_word_glcm.clk_a_s_gate.en_f_reg.GN ; 
       release `PHY_X4_TOP.pma.dig.lane0.rx.rx_dword_word_glcm.clk_b_s_gate.en_f_reg.GN ; 
       #1;
       release `PHY_X4_TOP.pma.dig.lane0.rx.pwr_ctl.rx_word_ckg.en_f_reg.D  ; 
       release `PHY_X4_TOP.pma.dig.lane0.rx.pwr_ctl.rx_dword_ckg.en_f_reg.D  ; 
       release `PHY_X4_TOP.pma.dig.lane0.rx.rx_dword_word_glcm.clk_a_s_gate.en_f_reg.D; 
       release `PHY_X4_TOP.pma.dig.lane0.rx.rx_dword_word_glcm.clk_b_s_gate.en_f_reg.D; 
     end
     begin
       force `PHY_X4_TOP.pma.dig.lane1.rx.pwr_ctl.rx_word_ckg.en_f_reg.GN  = 1'b1; 
       force `PHY_X4_TOP.pma.dig.lane1.rx.pwr_ctl.rx_word_ckg.en_f_reg.D   = 1'b0; 
       force `PHY_X4_TOP.pma.dig.lane1.rx.pwr_ctl.rx_dword_ckg.en_f_reg.GN = 1'b1; 
       force `PHY_X4_TOP.pma.dig.lane1.rx.pwr_ctl.rx_dword_ckg.en_f_reg.D  = 1'b0; 
       force `PHY_X4_TOP.pma.dig.lane1.rx.rx_dword_word_glcm.clk_a_s_gate.en_f_reg.GN = 1'b1; 
       force `PHY_X4_TOP.pma.dig.lane1.rx.rx_dword_word_glcm.clk_a_s_gate.en_f_reg.D = 1'b0; 
       force `PHY_X4_TOP.pma.dig.lane1.rx.rx_dword_word_glcm.clk_b_s_gate.en_f_reg.GN = 1'b1; 
       force `PHY_X4_TOP.pma.dig.lane1.rx.rx_dword_word_glcm.clk_b_s_gate.en_f_reg.D = 1'b0; 
       #20;
       force `PHY_X4_TOP.pma.dig.lane1.rx.pwr_ctl.rx_word_ckg.en_f_reg.GN = 1'b0; 
       force `PHY_X4_TOP.pma.dig.lane1.rx.pwr_ctl.rx_dword_ckg.en_f_reg.GN = 1'b0; 
       force `PHY_X4_TOP.pma.dig.lane1.rx.rx_dword_word_glcm.clk_a_s_gate.en_f_reg.GN = 1'b0; 
       force `PHY_X4_TOP.pma.dig.lane1.rx.rx_dword_word_glcm.clk_b_s_gate.en_f_reg.GN = 1'b0; 
       #10;
       release  `PHY_X4_TOP.pma.dig.lane1.rx.pwr_ctl.rx_word_ckg.en_f_reg.GN ; 
       release  `PHY_X4_TOP.pma.dig.lane1.rx.pwr_ctl.rx_dword_ckg.en_f_reg.GN ; 
       release  `PHY_X4_TOP.pma.dig.lane1.rx.rx_dword_word_glcm.clk_a_s_gate.en_f_reg.GN; 
       release  `PHY_X4_TOP.pma.dig.lane1.rx.rx_dword_word_glcm.clk_b_s_gate.en_f_reg.GN; 
       #1;
       release  `PHY_X4_TOP.pma.dig.lane1.rx.pwr_ctl.rx_word_ckg.en_f_reg.D  ; 
       release  `PHY_X4_TOP.pma.dig.lane1.rx.pwr_ctl.rx_dword_ckg.en_f_reg.D  ; 
       release  `PHY_X4_TOP.pma.dig.lane1.rx.rx_dword_word_glcm.clk_a_s_gate.en_f_reg.D; 
       release  `PHY_X4_TOP.pma.dig.lane1.rx.rx_dword_word_glcm.clk_b_s_gate.en_f_reg.D; 
     end
     begin 
       force `PHY_X4_TOP.pma.dig.lane2.rx.pwr_ctl.rx_word_ckg.en_f_reg.GN  = 1'b1; 
       force `PHY_X4_TOP.pma.dig.lane2.rx.pwr_ctl.rx_word_ckg.en_f_reg.D   = 1'b0; 
       force `PHY_X4_TOP.pma.dig.lane2.rx.pwr_ctl.rx_dword_ckg.en_f_reg.GN = 1'b1; 
       force `PHY_X4_TOP.pma.dig.lane2.rx.pwr_ctl.rx_dword_ckg.en_f_reg.D  = 1'b0; 
       force `PHY_X4_TOP.pma.dig.lane2.rx.rx_dword_word_glcm.clk_a_s_gate.en_f_reg.GN = 1'b1; 
       force `PHY_X4_TOP.pma.dig.lane2.rx.rx_dword_word_glcm.clk_a_s_gate.en_f_reg.D = 1'b0; 
       force `PHY_X4_TOP.pma.dig.lane2.rx.rx_dword_word_glcm.clk_b_s_gate.en_f_reg.GN = 1'b1; 
       force `PHY_X4_TOP.pma.dig.lane2.rx.rx_dword_word_glcm.clk_b_s_gate.en_f_reg.D = 1'b0; 
       #20 ;
       force `PHY_X4_TOP.pma.dig.lane2.rx.pwr_ctl.rx_word_ckg.en_f_reg.GN  = 1'b0; 
       force `PHY_X4_TOP.pma.dig.lane2.rx.pwr_ctl.rx_dword_ckg.en_f_reg.GN = 1'b0; 
       force `PHY_X4_TOP.pma.dig.lane2.rx.rx_dword_word_glcm.clk_a_s_gate.en_f_reg.GN = 1'b0; 
       force `PHY_X4_TOP.pma.dig.lane2.rx.rx_dword_word_glcm.clk_b_s_gate.en_f_reg.GN = 1'b0; 
       #10;
       release `PHY_X4_TOP.pma.dig.lane2.rx.pwr_ctl.rx_word_ckg.en_f_reg.GN; 
       release `PHY_X4_TOP.pma.dig.lane2.rx.pwr_ctl.rx_dword_ckg.en_f_reg.GN; 
       release `PHY_X4_TOP.pma.dig.lane2.rx.rx_dword_word_glcm.clk_a_s_gate.en_f_reg.GN ; 
       release `PHY_X4_TOP.pma.dig.lane2.rx.rx_dword_word_glcm.clk_b_s_gate.en_f_reg.GN ; 
       #1;
       release `PHY_X4_TOP.pma.dig.lane2.rx.pwr_ctl.rx_word_ckg.en_f_reg.D  ; 
       release `PHY_X4_TOP.pma.dig.lane2.rx.pwr_ctl.rx_dword_ckg.en_f_reg.D  ; 
       release `PHY_X4_TOP.pma.dig.lane2.rx.rx_dword_word_glcm.clk_a_s_gate.en_f_reg.D; 
       release `PHY_X4_TOP.pma.dig.lane2.rx.rx_dword_word_glcm.clk_b_s_gate.en_f_reg.D; 
     end
     begin 
       force `PHY_X4_TOP.pma.dig.lane3.rx.pwr_ctl.rx_word_ckg.en_f_reg.GN  = 1'b1; 
       force `PHY_X4_TOP.pma.dig.lane3.rx.pwr_ctl.rx_word_ckg.en_f_reg.D   = 1'b0; 
       force `PHY_X4_TOP.pma.dig.lane3.rx.pwr_ctl.rx_dword_ckg.en_f_reg.GN = 1'b1; 
       force `PHY_X4_TOP.pma.dig.lane3.rx.pwr_ctl.rx_dword_ckg.en_f_reg.D  = 1'b0; 
       force `PHY_X4_TOP.pma.dig.lane3.rx.rx_dword_word_glcm.clk_a_s_gate.en_f_reg.GN = 1'b1; 
       force `PHY_X4_TOP.pma.dig.lane3.rx.rx_dword_word_glcm.clk_a_s_gate.en_f_reg.D = 1'b0; 
       force `PHY_X4_TOP.pma.dig.lane3.rx.rx_dword_word_glcm.clk_b_s_gate.en_f_reg.GN = 1'b1; 
       force `PHY_X4_TOP.pma.dig.lane3.rx.rx_dword_word_glcm.clk_b_s_gate.en_f_reg.D = 1'b0; 
       #20 ;
       force `PHY_X4_TOP.pma.dig.lane3.rx.pwr_ctl.rx_word_ckg.en_f_reg.GN  = 1'b0; 
       force `PHY_X4_TOP.pma.dig.lane3.rx.pwr_ctl.rx_dword_ckg.en_f_reg.GN = 1'b0; 
       force `PHY_X4_TOP.pma.dig.lane3.rx.rx_dword_word_glcm.clk_a_s_gate.en_f_reg.GN = 1'b0; 
       force `PHY_X4_TOP.pma.dig.lane3.rx.rx_dword_word_glcm.clk_b_s_gate.en_f_reg.GN = 1'b0; 
       #10;
       release `PHY_X4_TOP.pma.dig.lane3.rx.pwr_ctl.rx_word_ckg.en_f_reg.GN; 
       release `PHY_X4_TOP.pma.dig.lane3.rx.pwr_ctl.rx_dword_ckg.en_f_reg.GN; 
       release `PHY_X4_TOP.pma.dig.lane3.rx.rx_dword_word_glcm.clk_a_s_gate.en_f_reg.GN ; 
       release `PHY_X4_TOP.pma.dig.lane3.rx.rx_dword_word_glcm.clk_b_s_gate.en_f_reg.GN ; 
       #1;
       release `PHY_X4_TOP.pma.dig.lane3.rx.pwr_ctl.rx_word_ckg.en_f_reg.D  ; 
       release `PHY_X4_TOP.pma.dig.lane3.rx.pwr_ctl.rx_dword_ckg.en_f_reg.D  ; 
       release `PHY_X4_TOP.pma.dig.lane3.rx.rx_dword_word_glcm.clk_a_s_gate.en_f_reg.D; 
       release `PHY_X4_TOP.pma.dig.lane3.rx.rx_dword_word_glcm.clk_b_s_gate.en_f_reg.D; 
     end
   join
  end
 `endif // _GOPPHYX4_IS_REAL


`endif
