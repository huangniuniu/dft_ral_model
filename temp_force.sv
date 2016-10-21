`ifdef FAKE_SOC
//Add forces here to fix DUT at the moment.


initial begin
   //force top.dut_wrapper.DUT.dft_top_u.Cpl_PWROKRAW = 1'b1;
   //force top.dut_wrapper.DUT.goppphy_dft_wrapper_x2_u.gopphy_dft_gasket_2_u.gopphy_dft_gasket_2_laneconfig_gasket_inst.uGOPPHY_DFT_Gasket_2_laneconfig_STAC.I_CORE.AEB_GLOBAL = 1'b1;
   //force top.dut_wrapper.DUT.goppphy_dft_wrapper_x4_u.gopphy_dft_gasket_4_laneconfig_u.gopphy_dft_gasket_4_laneconfig_gasket_inst.uGOPPHY_DFT_Gasket_4_laneconfig_STAC.I_CORE.AEB_GLOBAL = 1'b1;

   // unconnected in dft_top_u  <  .Stac_PipelineEn(),    // Input to STAC  >
   //force top.dut_wrapper.DUT.dft_top_u.SoC_STAC_U.Stac_PipelineEn = 1'b0;

   //ruhuang added to work around ALTTAP test.
   force top.dut_wrapper.DUT.dft_top_u.mtap_u.mtap_ir_decode.mtap_aeb_sync = 1'b1;
   force top.dut_wrapper.DUT.goppphy_dft_wrapper_x4_u.gopphy_dft_gasket_4_laneconfig_u.gopphy_dft_gasket_4_laneconfig_gasket_inst.uGOPPHY_DFT_Gasket_4_laneconfig_STAC.ALTTAP_1_AEB = 1'b1;
   force top.dut_wrapper.DUT.goppphy_dft_wrapper_x2_u.gopphy_dft_gasket_2_u.gopphy_dft_gasket_2_laneconfig_gasket_inst.uGOPPHY_DFT_Gasket_2_laneconfig_STAC.ALTTAP_1_AEB = 1'b1;
   //ruhuang added for drive DBREQ_L.
   force top.dut_wrapper.DUT.dft_top_u.mtap_u.DBREQ_L = DBREQ_L;


//for support sptap
      force top.dut_wrapper.DUT.dft_top_u.sp_trstn = 0;
      force top.dut_wrapper.DUT.dft_top_u.sp_tck = tck_clk_if.clk;
      force top.dut_wrapper.DUT.dft_top_u.sp_tdi = jtag_if.tdi;
      force top.dut_wrapper.DUT.dft_top_u.sp_tms = jtag_if.tms;
   if($test$plusargs("sptap")) begin
      force top.dut_wrapper.DUT.dft_top_u.sp_trstn = 1;
      force jtag_if.tdo = top.dut_wrapper.DUT.dft_top_u.sp_tdo;
   end
end

initial begin
   //for async reset sms tdr 
   force top.dut_wrapper.DUT.dft_top_u.sms_top_u.JTAG_TARG_TRSTb = 0;
   repeat (2) @(posedge tck_clk_if.clk);
   #3;
   force top.dut_wrapper.DUT.dft_top_u.sms_top_u.JTAG_TARG_TRSTb = 1;
end
/*
initial begin
   force top.dut_wrapper.DUT.clk_sms = tck_clk_if.clk;
   force top.dut_wrapper.DUT.rst_sms = ~reset_if.trst;

end
*/
initial begin
      force top.dut_wrapper.DUT.dft_top_u.repair_clk = tck_clk_if.clk;
      if($test$plusargs("smart")) begin
         //for smart udr_load, now udr_load was connected with capture, i think the
         //connection is wrong
 //        force top.dut_wrapper.DUT.dft_top_u.sms_top_u.vl_srv.udr_load = 1;
         //must force repair_reset here if test smart mode. no need on other case
         //repair_clk and repair_start all can been overrided by sms config
         //tdr, so not must be forced.
         force top.dut_wrapper.DUT.dft_top_u.repair_reset = 1;
         force top.dut_wrapper.DUT.dft_top_u.repair_start = 0;
         repeat (500) @(posedge tck_clk_if.clk);//long delay for config BR_REG before de-assert reset
         #3;
         force top.dut_wrapper.DUT.dft_top_u.repair_reset = 0;
         repeat (1) @(posedge tck_clk_if.clk);
         #1;
         force top.dut_wrapper.DUT.dft_top_u.repair_start = 1;
      end
end


//temp initial fusebox with non-zero value
initial begin
  //$readmemh("fuse.ini", top.dut_wrapper.DUT.dft_top_u.sms_top_u.vl_srv.U_server_sfp_wr.U_GF14LPPEFUSE6K.efuse_mem);
  bit [7:0] i;

   if($test$plusargs("init_efuse")) begin
  for(i=0;i<192;i=i+1)
      top.dut_wrapper.DUT.dft_top_u.sms_top_u.vl_srv.U_server_sfp_wr.U_GF14LPPEFUSE6K.efuse_mem[i] = {i,i,i,i};
   end

   force top.dut_wrapper.DUT.dft_top_u.sms_top_u.vl_srv.U_server_sfp_wr.U_GF14LPPEFUSE6K.VQPS_EFUSE = 1'b1;

end

//temp force GOP_X4_STAC.Stac_Wso to solve multi-drive by fake_soc_wrap.v on STAC_1_Wso.
    `define GOP_X4_STAC DUT.goppphy_dft_wrapper_x4_u.gopphy_dft_gasket_4_laneconfig_u.gopphy_dft_gasket_4_laneconfig_gasket_inst.uGOPPHY_DFT_Gasket_4_laneconfig_STAC
    assign (supply1,supply0) `GOP_X4_STAC.Stac_Wso = `GOP_X4_STAC.Stac_PipelineEn ? `GOP_X4_STAC.PipelineWso : `GOP_X4_STAC.NonPipelineWso ;

`endif

`ifdef FULL_CHIP_GATE
initial
begin
//PWRGOOD_18H is stub file
    force top.dut_wrapper.DUT.uio.upwr.D_POWERGOOD = 1'b1;
    force top.dut_wrapper.DUT.uio.upwr.D_POWERGOOD_CRV = 1'b1;  //
    force top.dut_wrapper.DUT.uio.upwr.ISO_ENB = 1'b1;  //
    force top.dut_wrapper.DUT.uio.upwr.PG_OSC_CLOCK = 1'b1;
    force top.dut_wrapper.DUT.uio.upwr.PRGRM_V18 = 1'b1; //
    force top.dut_wrapper.DUT.uio.upwr.PRGRM_VSS = 1'b0; //
    force top.dut_wrapper.DUT.uio.upwr.PWROK_18_33 = 1'b1; //
    force top.dut_wrapper.DUT.uio.upwr.PWROK_ALL = 1'b1;
    force top.dut_wrapper.DUT.uio.upwr.RAWPWRGD_18 = 1'b1;
    force top.dut_wrapper.DUT.uio.upwr.RAWPWRGD_CRV = 1'b1;
    force top.dut_wrapper.DUT.uio.upwr.V18_PWRGD_CRV = 1'b1; //
    force top.dut_wrapper.DUT.uio.upwr.VCORE_PWRGD_18 = 1'b1;
    force top.dut_wrapper.DUT.uio.upwr.VDD18_GPIO = 1'b1;
    force top.dut_wrapper.DUT.uio.upwr.VDD_CORE = 1'b1;
    force top.dut_wrapper.DUT.uio.upwr.VDD_CORE2 = 1'b1;
    force top.dut_wrapper.DUT.uio.upwr.VSS_CORE = 1'b0;
//tdo_en
    force top.dut_wrapper.DUT.uio.leonardo_top_leonardo_top_tdo_en_in = top.dut_wrapper.DUT.dft_top_u.Jtag_tdo_en;

    force top.dut_wrapper.DUT.dft_top_u.Cpl_PWROKRAW = 1'b1;
    force top.dut_wrapper.DUT.dft_top_u.DBREQ_L = 1'b0;
//async_rst_sync cell shell
    force top.dut_wrapper.DUT.dft_top_u.mtap_u.TRSTb_Sync = top.dut_wrapper.DUT.dft_top_u.mtap_u.TRSTb_Fsm;
    force top.dut_wrapper.DUT.dft_top_u.mtap_u.TRSTb_alttapen = top.dut_wrapper.DUT.dft_top_u.mtap_u.n_3_net_;
    force top.dut_wrapper.DUT.dft_top_u.mtap_u.baco_s5_pwrok_sync = top.dut_wrapper.DUT.dft_top_u.mtap_u.BACO_S5_PWROK;
    force top.dut_wrapper.DUT.dft_top_u.mtap_u.mtap_fsm.TestLogicResetB = top.dut_wrapper.DUT.dft_top_u.mtap_u.mtap_fsm.TestLogicResetB_pre;

end

`endif
