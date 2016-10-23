`ifndef _RAL_CLASS_SV
`define _RAL_CLASS_SV

//=======================================================================//
//==============================add by hcai1 begin =======================//
//=======================================================================//
// Class: ieee1149_wbypass_reg
class ieee1149_wbypass_reg extends dft_reg;
   `uvm_object_utils( ieee1149_wbypass_reg )

   rand uvm_reg_field ieee1149_wbypass;

   function new( string name = "ieee1149_wbypass_reg" );
      super.new( .name( name ), .n_bits( `IEEE_1149_WBYPASS_LENGTH ), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      ieee1149_wbypass = uvm_reg_field::type_id::create( "ieee1149_wbypass" );
      ieee1149_wbypass.configure( .parent        ( this ), 
                         .size                   ( `IEEE_1149_WBYPASS_LENGTH    ), 
                         .lsb_pos                ( 0), 
                         .access                 ( "RW" ), 
                         .volatile               ( 0    ),
                         .reset                  ( `IEEE_1149_WBYPASS_RST_VALUE    ), 
                         .has_reset              ( 1    ), 
                         .is_rand                ( 1    ), 
                         .individually_accessible( 0   ) );

   endfunction: build
endclass: ieee1149_wbypass_reg

// Class: ieee1149_pipelinemode_reg
class ieee1149_pipelinemode_reg extends dft_reg;
   `uvm_object_utils( ieee1149_pipelinemode_reg )

   rand uvm_reg_field ieee1149_pipelinemode;

   function new( string name = "ieee1149_pipelinemode_reg" );
      super.new( .name( name ), .n_bits( `IEEE_1149_PIPELINEMODE_LENGTH ), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      ieee1149_pipelinemode = uvm_reg_field::type_id::create( "ieee1149_pipelinemode" );
      ieee1149_pipelinemode.configure( .parent             ( this ), 
                              .size                   ( `IEEE_1149_PIPELINEMODE_LENGTH    ), 
                              .lsb_pos                ( 0), 
                              .access                 ( "RW" ), 
                              .volatile               ( 0    ),
                              .reset                  ( `IEEE_1149_PIPELINEMODE_RST_VALUE ), 
                              .has_reset              ( 1    ), 
                              .is_rand                ( 1    ), 
                              .individually_accessible( 0    ) );
   endfunction: build
endclass: ieee1149_pipelinemode_reg

// Class: ieee1149_idcode_reg
class ieee1149_idcode_reg extends dft_reg;
   `uvm_object_utils( ieee1149_idcode_reg )

   rand uvm_reg_field ieee1149_idcode;

   function new( string name = "ieee1149_idcode_reg" );
      super.new( .name( name ), .n_bits( `IEEE_1149_IDCODE_LENGTH ), .has_coverage( UVM_NO_COVERAGE ));
   endfunction: new

   virtual function void build();
      ieee1149_idcode = uvm_reg_field::type_id::create( "ieee1149_idcode" );
      ieee1149_idcode.configure( .parent             ( this ), 
                              .size                   ( `IEEE_1149_IDCODE_LENGTH    ), 
                              .lsb_pos                ( 0), 
                              .access                 ( "RW" ), 
                              .volatile               ( 0    ),
                              .reset                  ( `IEEE_1149_IDCODE_RST_VALUE ), 
                              .has_reset              ( 1    ), 
                              .is_rand                ( 1    ), 
                              .individually_accessible( 0    ) );
   endfunction: build
endclass: ieee1149_idcode_reg

// Class: ieee1149_manid_reg
class ieee1149_manid_reg extends dft_reg;
   `uvm_object_utils( ieee1149_manid_reg )

   rand uvm_reg_field ieee1149_manid;

   function new( string name = "ieee1149_manid_reg" );
      super.new( .name( name ), .n_bits( `IEEE_1149_MANID_LENGTH ), .has_coverage( UVM_NO_COVERAGE ));
   endfunction: new

   virtual function void build();
      ieee1149_manid = uvm_reg_field::type_id::create( "ieee1149_manid" );
      ieee1149_manid.configure( .parent             ( this ), 
                              .size                   ( `IEEE_1149_MANID_LENGTH    ), 
                              .lsb_pos                ( 0), 
                              .access                 ( "RW" ), 
                              .volatile               ( 0    ),
                              .reset                  ( `IEEE_1149_MANID_RST_VALUE ), 
                              .has_reset              ( 1    ), 
                              .is_rand                ( 1    ), 
                              .individually_accessible( 0    ) );
   endfunction: build
endclass: ieee1149_manid_reg

// Class: soc_stac_ieee1500_wbypass_reg
class soc_stac_ieee1500_wbypass_reg extends dft_reg;
   `uvm_object_utils( soc_stac_ieee1500_wbypass_reg )

   rand uvm_reg_field soc_stac_ieee1500_wbypass;

   function new( string name = "soc_stac_ieee1500_wbypass_reg" );
      super.new( .name( name ), .n_bits( `SOC_STAC_WBYPASS_LENGTH ), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      soc_stac_ieee1500_wbypass = uvm_reg_field::type_id::create( "soc_stac_ieee1500_wbypass" );
      soc_stac_ieee1500_wbypass.configure( .parent        ( this ), 
                         .size                   ( `SOC_STAC_WBYPASS_LENGTH    ), 
                         .lsb_pos                ( 0), 
                         .access                 ( "RW" ), 
                         .volatile               ( 0    ),
                         .reset                  ( `SOC_STAC_WBYPASS_RST_VALUE    ), 
                         .has_reset              ( 1    ), 
                         .is_rand                ( 1    ), 
                         .individually_accessible( 0   ) );

   endfunction: build
endclass: soc_stac_ieee1500_wbypass_reg

// Class: soc_stac_ieee1500_bypass_reg
class soc_stac_ieee1500_bypass_reg extends dft_reg;
   `uvm_object_utils( soc_stac_ieee1500_bypass_reg )

   rand uvm_reg_field soc_stac_ieee1500_bypass;

   function new( string name = "soc_stac_ieee1500_bypass_reg" );
      super.new( .name( name ), .n_bits( `SOC_STAC_BYPASS_LENGTH ), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      soc_stac_ieee1500_bypass = uvm_reg_field::type_id::create( "soc_stac_ieee1500_bypass" );
      soc_stac_ieee1500_bypass.configure( .parent        ( this ), 
                         .size                   ( `SOC_STAC_BYPASS_LENGTH    ), 
                         .lsb_pos                ( 0), 
                         .access                 ( "RW" ), 
                         .volatile               ( 0    ),
                         .reset                  ( `SOC_STAC_BYPASS_RST_VALUE    ), 
                         .has_reset              ( 1    ), 
                         .is_rand                ( 1    ), 
                         .individually_accessible( 0   ) );

   endfunction: build
endclass: soc_stac_ieee1500_bypass_reg

// Class: soc_stac_ieee1500_memcfg_reg
class soc_stac_ieee1500_memcfg_reg extends dft_reg;
   `uvm_object_utils( soc_stac_ieee1500_memcfg_reg )

   rand uvm_reg_field soc_stac_ieee1500_memcfg;

   function new( string name = "soc_stac_ieee1500_memcfg_reg" );
      super.new( .name( name ), .n_bits( `SOC_STAC_MEMCFG_LENGTH ), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      soc_stac_ieee1500_memcfg = uvm_reg_field::type_id::create( "soc_stac_ieee1500_memcfg" );
      soc_stac_ieee1500_memcfg.configure( .parent        ( this ), 
                         .size                   ( `SOC_STAC_MEMCFG_LENGTH    ), 
                         .lsb_pos                ( 0), 
                         .access                 ( "RW" ), 
                         .volatile               ( 0    ),
                         .reset                  ( `SOC_STAC_MEMCFG_RST_VALUE    ), 
                         .has_reset              ( 1    ), 
                         .is_rand                ( 1    ), 
                         .individually_accessible( 0   ) );

   endfunction: build
endclass: soc_stac_ieee1500_memcfg_reg

// Class: soc_stac_ieee1500_ioctrl_reg
class soc_stac_ieee1500_ioctrl_reg extends dft_reg;
   `uvm_object_utils( soc_stac_ieee1500_ioctrl_reg )

   rand uvm_reg_field soc_stac_ieee1500_ioctrl;

   function new( string name = "soc_stac_ieee1500_ioctrl_reg" );
      super.new( .name( name ), .n_bits( `SOC_STAC_IOCTRL_LENGTH ), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      soc_stac_ieee1500_ioctrl = uvm_reg_field::type_id::create( "soc_stac_ieee1500_ioctrl" );
      soc_stac_ieee1500_ioctrl.configure( .parent        ( this ), 
                         .size                   ( `SOC_STAC_IOCTRL_LENGTH    ), 
                         .lsb_pos                ( 0), 
                         .access                 ( "RW" ), 
                         .volatile               ( 0    ),
                         .reset                  ( `SOC_STAC_IOCTRL_RST_VALUE    ), 
                         .has_reset              ( 1    ), 
                         .is_rand                ( 1    ), 
                         .individually_accessible( 0   ) );

   endfunction: build
endclass: soc_stac_ieee1500_ioctrl_reg
//=======================================================================//
//==============================add by hcai1 end========================//
//======================================================================//


//------------------------------------------------------------------------------
// Class: ieee1149_dummy_tdr_reg
//------------------------------------------------------------------------------

class ieee1149_dummy_tdr_reg extends dft_reg;
   `uvm_object_utils( ieee1149_dummy_tdr_reg )

   rand uvm_reg_field dummy_tdr_field1;
   rand uvm_reg_field dummy_tdr_field2;
   rand uvm_reg_field dummy_tdr_field3;

   function new( string name = "ieee1149_dummy_tdr_reg" );
      super.new( .name( name ), .n_bits( `DUMMY_TDR_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      dummy_tdr_field1 = uvm_reg_field::type_id::create( "dummy_tdr_field1" );
      dummy_tdr_field1.configure( .parent                 ( this ), 
                       .size                   ( `DUMMY_TDR_FIELD1_WIDTH), 
                       .lsb_pos                ( 0), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `DUMMY_TDR_FIELD1_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      
      dummy_tdr_field2 = uvm_reg_field::type_id::create( "dummy_tdr_field2" );
      dummy_tdr_field2.configure( .parent                 ( this ), 
                       .size                   ( `DUMMY_TDR_FIELD2_WIDTH), 
                       .lsb_pos                ( `DUMMY_TDR_FIELD1_WIDTH), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `DUMMY_TDR_FIELD2_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      
      dummy_tdr_field3 = uvm_reg_field::type_id::create( "dummy_tdr_field3" );
      dummy_tdr_field3.configure( .parent                 ( this ), 
                       .size                   ( `DUMMY_TDR_FIELD3_WIDTH), 
                       .lsb_pos                ( `DUMMY_TDR_FIELD1_WIDTH + `DUMMY_TDR_FIELD2_WIDTH), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `DUMMY_TDR_FIELD3_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 0    ),  //If you don't want to random this field, set 1'b0 here.
                       .individually_accessible( 0   ) );
   endfunction: build
endclass: ieee1149_dummy_tdr_reg
//------------------------------------------------------------------------------
// Class: ieee1149_gopphy_crsel_reg
//------------------------------------------------------------------------------

class ieee1149_gopphy_crsel_reg extends dft_reg;
   `uvm_object_utils( ieee1149_gopphy_crsel_reg )

   rand uvm_reg_field gopphy_crsel_add_data;
   rand uvm_reg_field gopphy_crsel_cmd;

   function new( string name = "ieee1149_gopphy_crsel_reg" );
      super.new( .name( name ), .n_bits( `GOPPHY_CRSEL_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      gopphy_crsel_add_data = uvm_reg_field::type_id::create( "gopphy_crsel_add_data" );
      gopphy_crsel_add_data.configure( .parent                 ( this ), 
                                       .size                   ( `GOPPHY_CRSEL_ADD_DATA_WIDTH), 
                                       .lsb_pos                ( 0), 
                                       .access                 ( "RW" ), 
                                       .volatile               ( 0    ),
                                       .reset                  ( `GOPPHY_CRSEL_ADD_DATA_RST_VALUE), 
                                       .has_reset              ( 1    ), 
                                       .is_rand                ( 1    ), 
                                       .individually_accessible( 0   ) );

      gopphy_crsel_cmd = uvm_reg_field::type_id::create( "gopphy_crsel_cmd" );
      gopphy_crsel_cmd.configure( .parent                 ( this ), 
                                       .size                   ( `GOPPHY_CRSEL_CMD_WIDTH), 
                                       .lsb_pos                ( `GOPPHY_CRSEL_ADD_DATA_WIDTH), 
                                       .access                 ( "RW" ), 
                                       .volatile               ( 0    ),
                                       .reset                  ( `GOPPHY_CRSEL_CMD_RST_VALUE), 
                                       .has_reset              ( 1    ), 
                                       .is_rand                ( 1    ), 
                                       .individually_accessible( 0   ) );
   endfunction: build
endclass: ieee1149_gopphy_crsel_reg



//------------------------------------------------------------------------------
// Class: ieee1149_mtap_alttapen_reg
//------------------------------------------------------------------------------

class ieee1149_mtap_alttapen_reg extends dft_reg;
   `uvm_object_utils( ieee1149_mtap_alttapen_reg )

   rand uvm_reg_field mtap_alttapen;

   function new( string name = "ieee1149_mtap_alttapen_reg" );
      super.new( .name( name ), .n_bits( `MTAP_ALTTAPEN_LENGTH ), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      mtap_alttapen = uvm_reg_field::type_id::create( "mtap_alttapen" );
      mtap_alttapen.configure( .parent                 ( this ), 
                       .size                   ( `MTAP_ALTTAPEN_LENGTH    ), 
                       .lsb_pos                ( 0), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `MTAP_ALTTAPEN_RST_VALUE    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

   endfunction: build
endclass: ieee1149_mtap_alttapen_reg


//------------------------------------------------------------------------------
// Class: ieee1149_bypass_reg
//------------------------------------------------------------------------------

class ieee1149_bypass_reg extends dft_reg;
   `uvm_object_utils( ieee1149_bypass_reg )

   rand uvm_reg_field bypass;

   function new( string name = "ieee1149_bypass_reg" );
      super.new( .name( name ), .n_bits( `BYPASS_LENGTH ), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      bypass = uvm_reg_field::type_id::create( "bypass" );
      bypass.configure( .parent                 ( this ), 
                       .size                   ( `BYPASS_LENGTH    ), 
                       .lsb_pos                ( 0), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `BYPASS_RST_VALUE    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

   endfunction: build
endclass: ieee1149_bypass_reg

//------------------------------------------------------------------------------
// Class: ieee1500_idcode_reg
//------------------------------------------------------------------------------

class ieee1500_idcode_reg extends dft_reg;
   `uvm_object_utils( ieee1500_idcode_reg )

   rand uvm_reg_field idcode;
    function new( string name = "ieee1500_idcode_reg" );
      super.new( .name( name ), .n_bits( `IDCODE_LENGTH ), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
     idcode = uvm_reg_field::type_id::create( "idcode" );
      idcode.configure( .parent                 ( this ), 
                       .size                   ( `IDCODE_LENGTH    ), 
                       .lsb_pos                ( 0), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `IDCODE_RST_VALUE    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
   endfunction: build
endclass: ieee1500_idcode_reg

//------------------------------------------------------------------------------
// Class: ieee1500_scanconfig_reg
//------------------------------------------------------------------------------

class ieee1500_scanconfig_reg extends dft_reg;
   `uvm_object_utils( ieee1500_scanconfig_reg )

   rand uvm_reg_field scanconfig;
      function new( string name = "ieee1500_scanconfig_reg" );
      super.new( .name( name ), .n_bits( `SCANCONFIG_LENGTH ), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      scanconfig = uvm_reg_field::type_id::create( "scanconfig" );
      scanconfig.configure( .parent                 ( this ), 
                       .size                   ( `SCANCONFIG_LENGTH), 
                       .lsb_pos                ( 0), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `SCANCONFIG_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
   endfunction: build
endclass: ieee1500_scanconfig_reg


//------------------------------------------------------------------------------
// Class: ieee1500_sub_client_sib_reg
//------------------------------------------------------------------------------

class ieee1500_sub_client_sib_reg extends dft_reg;
   `uvm_object_utils( ieee1500_sub_client_sib_reg )

   rand uvm_reg_field sub_client_sib;
   
   function new( string name = "ieee1500_sub_client_sib_reg" );
   super.new( .name( name ), .n_bits( `SUB_CLIENT_SIB_LENGTH ), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      sub_client_sib = uvm_reg_field::type_id::create( "sub_client_sib" );
      sub_client_sib.configure( .parent                 ( this ), 
                       .size                   ( `SUB_CLIENT_SIB_LENGTH), 
                       .lsb_pos                ( 0), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `SUB_CLIENT_SIB_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
   endfunction: build
endclass: ieee1500_sub_client_sib_reg

//------------------------------------------------------------------------------
// Class: ieee1500_syspll_cfg_reg
//------------------------------------------------------------------------------

class ieee1500_syspll_cfg_reg extends dft_reg;
   `uvm_object_utils( ieee1500_syspll_cfg_reg )

   rand uvm_reg_field syspll_cfg;
      function new( string name = "ieee1500_syspll_cfg_reg" );
      super.new( .name( name ), .n_bits( `SYSPLL_CFG_LENGTH ), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      syspll_cfg = uvm_reg_field::type_id::create( "syspll_cfg" );
      syspll_cfg.configure( .parent                 ( this ), 
                       .size                   ( `SYSPLL_CFG_LENGTH), 
                       .lsb_pos                ( 0), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `SYSPLL_CFG_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
   endfunction: build
endclass: ieee1500_syspll_cfg_reg

//------------------------------------------------------------------------------
// Class: ieee1500_fuse_override_reg
//------------------------------------------------------------------------------

class ieee1500_fuse_override_reg extends dft_reg;
   `uvm_object_utils( ieee1500_fuse_override_reg )

   rand uvm_reg_field fuse_override_field1;
   rand uvm_reg_field fuse_override_field2;

   function new( string name = "ieee1500_fuse_override_reg" );
      super.new( .name( name ), .n_bits( `FUSE_OVERRIDE_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      fuse_override_field1 = uvm_reg_field::type_id::create( "fuse_override_field1" );
      fuse_override_field1.configure( .parent                 ( this ), 
                       .size                   ( `FUSE_OVERRIDE_FIELD1_WIDTH), 
                       .lsb_pos                ( 0), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `FUSE_OVERRIDE_FIELD1_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      
   endfunction: build
endclass: ieee1500_fuse_override_reg

//------------------------------------------------------------------------------
// Class: ieee1500_sms_status_reg
//------------------------------------------------------------------------------

class ieee1500_sms_status_reg extends dft_reg;
   `uvm_object_utils( ieee1500_sms_status_reg )

   rand uvm_reg_field sms_status;

   function new( string name = "ieee1500_sms_status_reg" );
      super.new( .name( name ), .n_bits( `SMS_STATUS_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      sms_status = uvm_reg_field::type_id::create( "sms_status" );
      sms_status.configure( .parent                 ( this ), 
                       .size                   ( `SMS_STATUS_LENGTH), 
                       .lsb_pos                ( 0), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `SMS_STATUS_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      
   endfunction: build
endclass: ieee1500_sms_status_reg

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Class: ieee1500_sms_config_reg
//------------------------------------------------------------------------------

class ieee1500_sms_config_reg extends dft_reg;
   `uvm_object_utils( ieee1500_sms_config_reg )

   rand uvm_reg_field sms_config;

   function new( string name = "ieee1500_sms_config_reg" );
      super.new( .name( name ), .n_bits( `SMS_CONFIG_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      sms_config = uvm_reg_field::type_id::create( "sms_config" );
      sms_config.configure( .parent                 ( this ), 
                       .size                   ( `SMS_CONFIG_LENGTH), 
                       .lsb_pos                ( 0), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `SMS_CONFIG_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      
   endfunction: build
endclass: ieee1500_sms_config_reg


//------------------------------------------------------------------------------
// Class: ieee1500_lvds_serdes_reg
//------------------------------------------------------------------------------
class ieee1500_lvds_serdes_reg extends dft_reg;
   `uvm_object_utils( ieee1500_lvds_serdes_reg )

   rand uvm_reg_field lvds_serdes;

   function new( string name = "ieee1500_lvds_serdes_reg" );
      super.new( .name( name ), .n_bits( `LVDS_SERDES_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      lvds_serdes = uvm_reg_field::type_id::create( "lvds_serdes" );
      lvds_serdes.configure( .parent                 ( this ), 
                       .size                   ( `LVDS_SERDES_LENGTH), 
                       .lsb_pos                ( 0), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `LVDS_SERDES_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      
   endfunction: build
endclass: ieee1500_lvds_serdes_reg

//------------------------------------------------------------------------------
// Class: ieee1500_lvds_apb_reg
//------------------------------------------------------------------------------
class ieee1500_lvds_apb_reg extends dft_reg;
   `uvm_object_utils( ieee1500_lvds_apb_reg )

   rand uvm_reg_field lvds_pwdata;
   rand uvm_reg_field lvds_paddr;
   rand uvm_reg_field lvds_pwrite;
   rand uvm_reg_field lvds_select_jtag;
   rand uvm_reg_field lvds_jtag_enable;
   rand uvm_reg_field lvds_jtag_ready;
   rand uvm_reg_field lvds_done;


   function new( string name = "ieee1500_lvds_apb_reg" );
      super.new( .name( name ), .n_bits( `LVDS_APB_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      lvds_pwdata = uvm_reg_field::type_id::create( "lvds_pwdata" );
      lvds_pwdata.configure( .parent           ( this ), 
                       .size                   ( 8), 
                       .lsb_pos                ( 0), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      lvds_paddr = uvm_reg_field::type_id::create( "lvds_paddr" );
      lvds_paddr.configure( .parent            ( this ), 
                       .size                   ( 8), 
                       .lsb_pos                ( 8), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      lvds_pwrite = uvm_reg_field::type_id::create( "lvds_pwrite" );
      lvds_pwrite.configure( .parent           ( this ), 
                       .size                   ( 1), 
                       .lsb_pos                ( 16), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      lvds_select_jtag = uvm_reg_field::type_id::create( "lvds_select_jtag" );
      lvds_select_jtag.configure( .parent      ( this ), 
                       .size                   ( 1), 
                       .lsb_pos                ( 17), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      lvds_jtag_enable = uvm_reg_field::type_id::create( "lvds_jtag_enable" );
      lvds_jtag_enable.configure( .parent      ( this ), 
                       .size                   ( 1), 
                       .lsb_pos                ( 18), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      lvds_jtag_ready = uvm_reg_field::type_id::create( "lvds_jtag_ready" );
      lvds_jtag_ready.configure( .parent                 ( this ), 
                       .size                   ( 1), 
                       .lsb_pos                ( 19), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      lvds_done = uvm_reg_field::type_id::create( "lvds_done" );
      lvds_done.configure( .parent             ( this ), 
                       .size                   ( 1), 
                       .lsb_pos                ( 20), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      
   endfunction: build
endclass: ieee1500_lvds_apb_reg











//------------------------------------------------------------------------------
// Class: ieee1500_sptap_bypass_reg
//------------------------------------------------------------------------------

class ieee1500_sptap_bypass_reg extends dft_reg;
   `uvm_object_utils( ieee1500_sptap_bypass_reg )

   rand uvm_reg_field sptap_bypass;

   function new( string name = "ieee1500_sptap_bypass_reg" );
      super.new( .name( name ), .n_bits( `SPTAP_BYPASS_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      sptap_bypass = uvm_reg_field::type_id::create( "sptap_bypass" );
      sptap_bypass.configure( .parent                 ( this ), 
                       .size                   ( `SPTAP_BYPASS_LENGTH), 
                       .lsb_pos                ( 0), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `SPTAP_BYPASS_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      
   endfunction: build
endclass: ieee1500_sptap_bypass_reg

//------------------------------------------------------------------------------
// Class: ieee1500_sptap_jpc_sms_sel_reg
//------------------------------------------------------------------------------

class ieee1500_sptap_jpc_sms_sel_reg extends dft_reg;
   `uvm_object_utils( ieee1500_sptap_jpc_sms_sel_reg )

   rand uvm_reg_field sptap_jpc_sms_sel;

   function new( string name = "ieee1500_sptap_jpc_sms_sel_reg" );
      super.new( .name( name ), .n_bits( `SPTAP_JPC_SMS_SEL_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      sptap_jpc_sms_sel = uvm_reg_field::type_id::create( "sptap_jpc_sms_sel" );
      sptap_jpc_sms_sel.configure( .parent                 ( this ), 
                       .size                   ( `SPTAP_JPC_SMS_SEL_LENGTH), 
                       .lsb_pos                ( 0), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `SPTAP_JPC_SMS_SEL_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      
   endfunction: build
endclass: ieee1500_sptap_jpc_sms_sel_reg

//------------------------------------------------------------------------------
// Class: ieee1500_sptap_jpc_udr_sel_reg
//------------------------------------------------------------------------------

class ieee1500_sptap_jpc_udr_sel_reg extends dft_reg;
   `uvm_object_utils( ieee1500_sptap_jpc_udr_sel_reg )

   rand uvm_reg_field sptap_jpc_udr_sel;

   function new( string name = "ieee1500_sptap_jpc_udr_sel_reg" );
      super.new( .name( name ), .n_bits( `SPTAP_JPC_UDR_SEL_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      sptap_jpc_udr_sel = uvm_reg_field::type_id::create( "sptap_jpc_udr_sel" );
      sptap_jpc_udr_sel.configure( .parent                 ( this ), 
                       .size                   ( `SPTAP_JPC_UDR_SEL_LENGTH), 
                       .lsb_pos                ( 0), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `SPTAP_JPC_UDR_SEL_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      
   endfunction: build
endclass: ieee1500_sptap_jpc_udr_sel_reg

//------------------------------------------------------------------------------
// Class: ieee1500_sptap_sms_tbox_sel_reg
//------------------------------------------------------------------------------

class ieee1500_sptap_sms_tbox_sel_reg extends dft_reg;
   `uvm_object_utils( ieee1500_sptap_sms_tbox_sel_reg )

   rand uvm_reg_field sptap_sms_tbox_sel;

   function new( string name = "ieee1500_sptap_sms_tbox_sel_reg" );
      super.new( .name( name ), .n_bits( `SPTAP_SMS_TBOX_SEL_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      sptap_sms_tbox_sel = uvm_reg_field::type_id::create( "sptap_sms_tbox_sel" );
      sptap_sms_tbox_sel.configure( .parent                 ( this ), 
                       .size                   ( `SPTAP_SMS_TBOX_SEL_LENGTH), 
                       .lsb_pos                ( 0), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `SPTAP_SMS_TBOX_SEL_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      
   endfunction: build
endclass: ieee1500_sptap_sms_tbox_sel_reg

//------------------------------------------------------------------------------
// Class: ieee1500_jpc_br_sel_reg
//------------------------------------------------------------------------------

class ieee1500_jpc_br_sel_reg extends dft_reg;
   `uvm_object_utils( ieee1500_jpc_br_sel_reg )

   rand uvm_reg_field jpc_br_sel;

   function new( string name = "ieee1500_jpc_br_sel_reg" );
      super.new( .name( name ), .n_bits( `JPC_BR_SEL_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      jpc_br_sel = uvm_reg_field::type_id::create( "jpc_br_sel" );
      jpc_br_sel.configure( .parent                 ( this ), 
                       .size                   ( `JPC_BR_SEL_LENGTH), 
                       .lsb_pos                ( 0), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `JPC_BR_SEL_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      
   endfunction: build
endclass: ieee1500_jpc_br_sel_reg

//------------------------------------------------------------------------------
// Class: ieee1500_jpc_sms_sel_reg
//------------------------------------------------------------------------------

class ieee1500_jpc_sms_sel_reg extends dft_reg;
   `uvm_object_utils( ieee1500_jpc_sms_sel_reg )

   rand uvm_reg_field jpc_sms_sel;

   function new( string name = "ieee1500_jpc_sms_sel_reg" );
      super.new( .name( name ), .n_bits( `JPC_SMS_SEL_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      jpc_sms_sel = uvm_reg_field::type_id::create( "jpc_sms_sel" );
      jpc_sms_sel.configure( .parent                 ( this ), 
                       .size                   ( `JPC_SMS_SEL_LENGTH), 
                       .lsb_pos                ( 0), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `JPC_SMS_SEL_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      
   endfunction: build
endclass: ieee1500_jpc_sms_sel_reg

//------------------------------------------------------------------------------
// Class: ieee1500_jpc_udr_load_reg
//------------------------------------------------------------------------------

class ieee1500_jpc_udr_load_reg extends dft_reg;
   `uvm_object_utils( ieee1500_jpc_udr_load_reg )

   rand uvm_reg_field jpc_udr_load;

   function new( string name = "ieee1500_jpc_udr_load_reg" );
      super.new( .name( name ), .n_bits( `JPC_UDR_LOAD_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      jpc_udr_load = uvm_reg_field::type_id::create( "jpc_udr_load" );
      jpc_udr_load.configure( .parent                 ( this ), 
                       .size                   ( `JPC_UDR_LOAD_LENGTH), 
                       .lsb_pos                ( 0), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `JPC_UDR_LOAD_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      
   endfunction: build
endclass: ieee1500_jpc_udr_load_reg

//------------------------------------------------------------------------------
// Class: ieee1500_jpc_udr_sel_reg
//------------------------------------------------------------------------------

class ieee1500_jpc_udr_sel_reg extends dft_reg;
   `uvm_object_utils( ieee1500_jpc_udr_sel_reg )

   rand uvm_reg_field jpc_udr_sel;

   function new( string name = "ieee1500_jpc_udr_sel_reg" );
      super.new( .name( name ), .n_bits( `JPC_UDR_SEL_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      jpc_udr_sel = uvm_reg_field::type_id::create( "jpc_udr_sel" );
      jpc_udr_sel.configure( .parent                 ( this ), 
                       .size                   ( `JPC_UDR_SEL_LENGTH), 
                       .lsb_pos                ( 0), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `JPC_UDR_SEL_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      
   endfunction: build
endclass: ieee1500_jpc_udr_sel_reg

//------------------------------------------------------------------------------
// Class: ieee1500_jpc_pgmr_sel_reg
//------------------------------------------------------------------------------

class ieee1500_jpc_pgmr_sel_reg extends dft_reg;
   `uvm_object_utils( ieee1500_jpc_pgmr_sel_reg )

   rand uvm_reg_field jpc_pgmr_sel;

   function new( string name = "ieee1500_jpc_pgmr_sel_reg" );
      super.new( .name( name ), .n_bits( `JPC_PGMR_SEL_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      jpc_pgmr_sel = uvm_reg_field::type_id::create( "jpc_pgmr_sel" );
      jpc_pgmr_sel.configure( .parent                 ( this ), 
                       .size                   ( `JPC_PGMR_SEL_LENGTH), 
                       .lsb_pos                ( 0), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `JPC_PGMR_SEL_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      
   endfunction: build
endclass: ieee1500_jpc_pgmr_sel_reg

//------------------------------------------------------------------------------
// Class: ieee1500_jpc_udr_program_reg
//------------------------------------------------------------------------------

class ieee1500_jpc_udr_program_reg extends dft_reg;
   `uvm_object_utils( ieee1500_jpc_udr_program_reg )

   rand uvm_reg_field jpc_udr_program;

   function new( string name = "ieee1500_jpc_udr_program_reg" );
      super.new( .name( name ), .n_bits( `JPC_UDR_PROGRAM_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      jpc_udr_program = uvm_reg_field::type_id::create( "jpc_udr_program" );
      jpc_udr_program.configure( .parent                 ( this ), 
                       .size                   ( `JPC_UDR_PROGRAM_LENGTH), 
                       .lsb_pos                ( 0), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `JPC_UDR_PROGRAM_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      
   endfunction: build
endclass: ieee1500_jpc_udr_program_reg

//------------------------------------------------------------------------------
// Class: ieee1500_jpc_udr_compare_reg
//------------------------------------------------------------------------------

class ieee1500_jpc_udr_compare_reg extends dft_reg;
   `uvm_object_utils( ieee1500_jpc_udr_compare_reg )

   rand uvm_reg_field jpc_udr_compare;

   function new( string name = "ieee1500_jpc_udr_compare_reg" );
      super.new( .name( name ), .n_bits( `JPC_UDR_COMPARE_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      jpc_udr_compare = uvm_reg_field::type_id::create( "jpc_udr_compare" );
      jpc_udr_compare.configure( .parent                 ( this ), 
                       .size                   ( `JPC_UDR_COMPARE_LENGTH), 
                       .lsb_pos                ( 0), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `JPC_UDR_COMPARE_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      
   endfunction: build
endclass: ieee1500_jpc_udr_compare_reg

//------------------------------------------------------------------------------
// Class: ieee1500_jpc_rbox_rst_reg
//------------------------------------------------------------------------------

class ieee1500_jpc_rbox_rst_reg extends dft_reg;
   `uvm_object_utils( ieee1500_jpc_rbox_rst_reg )

   rand uvm_reg_field jpc_rbox_rst;

   function new( string name = "ieee1500_jpc_rbox_rst_reg" );
      super.new( .name( name ), .n_bits( `JPC_RBOX_RST_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      jpc_rbox_rst = uvm_reg_field::type_id::create( "jpc_rbox_rst" );
      jpc_rbox_rst.configure( .parent                 ( this ), 
                       .size                   ( `JPC_RBOX_RST_LENGTH), 
                       .lsb_pos                ( 0), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `JPC_RBOX_RST_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      
   endfunction: build
endclass: ieee1500_jpc_rbox_rst_reg

//------------------------------------------------------------------------------
// Class: ieee1500_jpc_rbox_sel_reg
//------------------------------------------------------------------------------

class ieee1500_jpc_rbox_sel_reg extends dft_reg;
   `uvm_object_utils( ieee1500_jpc_rbox_sel_reg )

   rand uvm_reg_field jpc_rbox_sel;

   function new( string name = "ieee1500_jpc_rbox_sel_reg" );
      super.new( .name( name ), .n_bits( `JPC_RBOX_SEL_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      jpc_rbox_sel = uvm_reg_field::type_id::create( "jpc_rbox_sel" );
      jpc_rbox_sel.configure( .parent                 ( this ), 
                       .size                   ( `JPC_RBOX_SEL_LENGTH), 
                       .lsb_pos                ( 0), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `JPC_RBOX_SEL_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      
   endfunction: build
endclass: ieee1500_jpc_rbox_sel_reg

//------------------------------------------------------------------------------
// Class: ieee1500_jpc_rbox_program_reg
//------------------------------------------------------------------------------

class ieee1500_jpc_rbox_program_reg extends dft_reg;
   `uvm_object_utils( ieee1500_jpc_rbox_program_reg )

   rand uvm_reg_field jpc_rbox_program;

   function new( string name = "ieee1500_jpc_rbox_program_reg" );
      super.new( .name( name ), .n_bits( `JPC_RBOX_PROGRAM_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      jpc_rbox_program = uvm_reg_field::type_id::create( "jpc_rbox_program" );
      jpc_rbox_program.configure( .parent                 ( this ), 
                       .size                   ( `JPC_RBOX_PROGRAM_LENGTH), 
                       .lsb_pos                ( 0), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `JPC_RBOX_PROGRAM_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      
   endfunction: build
endclass: ieee1500_jpc_rbox_program_reg

//------------------------------------------------------------------------------
// Class: ieee1500_jpc_rbox_compare_reg
//------------------------------------------------------------------------------

class ieee1500_jpc_rbox_compare_reg extends dft_reg;
   `uvm_object_utils( ieee1500_jpc_rbox_compare_reg )

   rand uvm_reg_field jpc_rbox_compare;

   function new( string name = "ieee1500_jpc_rbox_compare_reg" );
      super.new( .name( name ), .n_bits( `JPC_RBOX_COMPARE_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      jpc_rbox_compare = uvm_reg_field::type_id::create( "jpc_rbox_compare" );
      jpc_rbox_compare.configure( .parent                 ( this ), 
                       .size                   ( `JPC_RBOX_COMPARE_LENGTH), 
                       .lsb_pos                ( 0), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `JPC_RBOX_COMPARE_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      
   endfunction: build
endclass: ieee1500_jpc_rbox_compare_reg

//------------------------------------------------------------------------------
// Class: ieee1500_jpc_status_sel_reg
//------------------------------------------------------------------------------

class ieee1500_jpc_status_sel_reg extends dft_reg;
   `uvm_object_utils( ieee1500_jpc_status_sel_reg )

   rand uvm_reg_field jpc_status_sel;

   function new( string name = "ieee1500_jpc_status_sel_reg" );
      super.new( .name( name ), .n_bits( `JPC_STATUS_SEL_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      jpc_status_sel = uvm_reg_field::type_id::create( "jpc_status_sel" );
      jpc_status_sel.configure( .parent                 ( this ), 
                       .size                   ( `JPC_STATUS_SEL_LENGTH), 
                       .lsb_pos                ( 0), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `JPC_STATUS_SEL_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      
   endfunction: build
endclass: ieee1500_jpc_status_sel_reg

//------------------------------------------------------------------------------
// Class: ieee1500_sms_tbox_sel_reg
//------------------------------------------------------------------------------

class ieee1500_sms_tbox_sel_reg extends dft_reg;
   `uvm_object_utils( ieee1500_sms_tbox_sel_reg )

   rand uvm_reg_field sms_tbox_sel;

   function new( string name = "ieee1500_sms_tbox_sel_reg" );
      super.new( .name( name ), .n_bits( `SMS_TBOX_SEL_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      sms_tbox_sel = uvm_reg_field::type_id::create( "sms_tbox_sel" );
      sms_tbox_sel.configure( .parent                 ( this ), 
                       .size                   ( `SMS_TBOX_SEL_LENGTH), 
                       .lsb_pos                ( 0), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `SMS_TBOX_SEL_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      
   endfunction: build
endclass: ieee1500_sms_tbox_sel_reg

//------------------------------------------------------------------------------
// Class: ieee1500_dpll1_csraccess_reg
//------------------------------------------------------------------------------

class ieee1500_dpll1_csraccess_reg extends dft_reg;
   `uvm_object_utils( ieee1500_dpll1_csraccess_reg )

   rand uvm_reg_field cfg_protectb;
   rand uvm_reg_field execute;
   rand uvm_reg_field cfg_addr;
   rand uvm_reg_field cfg_data;
   rand uvm_reg_field complete_rd_wr;

   function new( string name = "ieee1500_dpll1_csraccess_reg" );
      super.new( .name( name ), .n_bits( `DPLL1_CSRACCESS_LENGTH ), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      //{{{ dpll1_csraccess field config
      cfg_protectb = uvm_reg_field::type_id::create( "cfg_protectb" );
      cfg_protectb.configure( .parent                 ( this ), 
                       .size                   ( `DPLL1_CSRACCESS_CFG_PROTECTB_WIDTH), 
                       .lsb_pos                ( `DPLL1_CSRACCESS_CFG_PROTECTB_LSB), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `DPLL1_CSRACCESS_CFG_PROTECTB_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      execute = uvm_reg_field::type_id::create( "execute" );
      execute.configure( .parent                 ( this ), 
                       .size                   ( `DPLL1_CSRACCESS_EXECUTE_WIDTH), 
                       .lsb_pos                ( `DPLL1_CSRACCESS_EXECUTE_LSB), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `DPLL1_CSRACCESS_EXECUTE_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      cfg_addr = uvm_reg_field::type_id::create( "cfg_addr" );
      cfg_addr.configure( .parent                 ( this ), 
                       .size                   ( `DPLL1_CSRACCESS_CFG_ADDR_WIDTH), 
                       .lsb_pos                ( `DPLL1_CSRACCESS_CFG_ADDR_LSB), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `DPLL1_CSRACCESS_CFG_ADDR_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      cfg_data = uvm_reg_field::type_id::create( "cfg_data" );
      cfg_data.configure( .parent                 ( this ), 
                       .size                   ( `DPLL1_CSRACCESS_CFG_DATA_WIDTH), 
                       .lsb_pos                ( `DPLL1_CSRACCESS_CFG_DATA_LSB), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `DPLL1_CSRACCESS_CFG_DATA_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      complete_rd_wr = uvm_reg_field::type_id::create( "complete_rd_wr" );
      complete_rd_wr.configure( .parent                 ( this ), 
                       .size                   ( `DPLL1_CSRACCESS_COMPLETE_RD_WR_WIDTH), 
                       .lsb_pos                ( `DPLL1_CSRACCESS_COMPLETE_RD_WR_LSB), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `DPLL1_CSRACCESS_COMPLETE_RD_WR_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      //}}} dpll1_csraccess field config
   endfunction: build

endclass: ieee1500_dpll1_csraccess_reg

//------------------------------------------------------------------------------
// Class: ieee1500_testconfig_reg
//------------------------------------------------------------------------------

class ieee1500_testconfig_reg extends dft_reg;
   `uvm_object_utils( ieee1500_testconfig_reg )

   //rand uvm_reg_field testconfig;
   rand uvm_reg_field reserve;
   rand uvm_reg_field tile_sel;
   rand uvm_reg_field scanmode;
   rand uvm_reg_field occ_testmode;
   rand uvm_reg_field tile_testmode3;
   rand uvm_reg_field tile_testmode2;
   rand uvm_reg_field tile_testmode1;
   rand uvm_reg_field PFH_SCAN_ScanMode;
   rand uvm_reg_field pllbypassen;
   function new( string name = "ieee1500_testconfig_reg" );
      super.new( .name( name ), .n_bits( `TESTCONFIG_LENGTH ), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build(); // {{{ testconfig_build
      reserve = uvm_reg_field::type_id::create( "reserve" );
      reserve.configure( .parent                 ( this ), 
                       .size                   ( `TESTCONFIG_RESERVE_WIDTH), 
                       .lsb_pos                ( `TESTCONFIG_RESERVE_LSB), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `TESTCONFIG_RESERVE_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      tile_sel = uvm_reg_field::type_id::create( "tile_sel" );
      tile_sel.configure( .parent                 ( this ), 
                       .size                   ( `TESTCONFIG_TILE_SEL_WIDTH), 
                       .lsb_pos                ( `TESTCONFIG_TILE_SEL_LSB), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `TESTCONFIG_TILE_SEL_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      scanmode = uvm_reg_field::type_id::create( "scanmode" );
      scanmode.configure( .parent                 ( this ), 
                       .size                   ( `TESTCONFIG_SCANMODE_WIDTH), 
                       .lsb_pos                ( `TESTCONFIG_SCANMODE_LSB), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `TESTCONFIG_SCANMODE_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      occ_testmode = uvm_reg_field::type_id::create( "occ_testmode" );
      occ_testmode.configure( .parent                 ( this ), 
                       .size                   ( `TESTCONFIG_OCC_TESTMODE_WIDTH), 
                       .lsb_pos                ( `TESTCONFIG_OCC_TESTMODE_LSB), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `TESTCONFIG_OCC_TESTMODE_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      tile_testmode3 = uvm_reg_field::type_id::create( "tile_testmode3" );
      tile_testmode3.configure( .parent                 ( this ), 
                       .size                   ( `TESTCONFIG_TILE_TESTMODE3_WIDTH), 
                       .lsb_pos                ( `TESTCONFIG_TILE_TESTMODE3_LSB), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `TESTCONFIG_TILE_TESTMODE3_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      tile_testmode2 = uvm_reg_field::type_id::create( "tile_testmode2" );
      tile_testmode2.configure( .parent                 ( this ), 
                       .size                   ( `TESTCONFIG_TILE_TESTMODE2_WIDTH), 
                       .lsb_pos                ( `TESTCONFIG_TILE_TESTMODE2_LSB), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `TESTCONFIG_TILE_TESTMODE2_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      tile_testmode1 = uvm_reg_field::type_id::create( "tile_testmode1" );
      tile_testmode1.configure( .parent                 ( this ), 
                       .size                   ( `TESTCONFIG_TILE_TESTMODE1_WIDTH), 
                       .lsb_pos                ( `TESTCONFIG_TILE_TESTMODE1_LSB), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `TESTCONFIG_TILE_TESTMODE1_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      PFH_SCAN_ScanMode = uvm_reg_field::type_id::create( "PFH_SCAN_ScanMode" );
      PFH_SCAN_ScanMode.configure( .parent                 ( this ), 
                       .size                   ( `TESTCONFIG_PFH_SCAN_SCANMODE_WIDTH), 
                       .lsb_pos                ( `TESTCONFIG_PFH_SCAN_SCANMODE_LSB), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `TESTCONFIG_PFH_SCAN_SCANMODE_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      pllbypassen = uvm_reg_field::type_id::create( "pllbypassen" );
      pllbypassen.configure( .parent                 ( this ), 
                       .size                   ( `TESTCONFIG_PLLBYPASSEN_WIDTH), 
                       .lsb_pos                ( `TESTCONFIG_PLLBYPASSEN_LSB), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `TESTCONFIG_PLLBYPASSEN_RST_VALUE), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );
      //}}} testconfig field config
   endfunction: build // }}} testconfig_build
endclass: ieee1500_testconfig_reg

//------------------------------------------------------------------------------
// Class: ieee1500_gopphy_dft_gasket_2_laneconfig_testmode_reg
//------------------------------------------------------------------------------

class ieee1500_gopphy_dft_gasket_2_laneconfig_testmode_reg extends dft_reg;
   `uvm_object_utils( ieee1500_gopphy_dft_gasket_2_laneconfig_testmode_reg )

   //rand uvm_reg_field gopphy_dft_gasket_2_laneconfig_testmode;
   rand uvm_reg_field reserved0;
   rand uvm_reg_field scan_set_rst       ;
   rand uvm_reg_field phy_reset_sel      ;
   rand uvm_reg_field phy_reset_val      ;
   rand uvm_reg_field bgen_sel           ;
   rand uvm_reg_field bgen_val           ;
   rand uvm_reg_field test_burnin_sel    ;
   rand uvm_reg_field test_burnin_val    ;
   rand uvm_reg_field test_pwrdwn_sel    ;
   rand uvm_reg_field test_pwrdwn_val    ;
   rand uvm_reg_field reserved1          ;
   rand uvm_reg_field masis_safe_sel     ;
   rand uvm_reg_field masis_safe_val     ;
   rand uvm_reg_field reserved_for_future;
   
   function new( string name = "ieee1500_gopphy_dft_gasket_2_laneconfig_testmode_reg" );
      super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_2_LANECONFIG_TESTMODE_LENGTH ), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build(); // {{{ testmode_build
      //gopphy_dft_gasket_2_laneconfig_testmode = uvm_reg_field::type_id::create( "gopphy_dft_gasket_2_laneconfig_testmode" );
      //gopphy_dft_gasket_2_laneconfig_testmode.configure( .parent                 ( this ), 
      //                 .size                   ( `GOPPHY_DFT_GASKET_2_LANECONFIG_TESTMODE_LENGTH), 
      //                 .lsb_pos                ( 0), 
      //                 .access                 ( "RW" ), 
      //                 .volatile               ( 0    ),
      //                 .reset                  ( `GOPPHY_DFT_GASKET_2_LANECONFIG_TESTMODE_RST_VALUE), 
      //                 .has_reset              ( 1    ), 
      //                 .is_rand                ( 1    ), 
      //                 .individually_accessible( 0   ) );
      reserved0 = uvm_reg_field::type_id::create( "reserved0" );
      reserved0.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      scan_set_rst = uvm_reg_field::type_id::create( "scan_set_rst" );
      scan_set_rst.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 1    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      phy_reset_sel = uvm_reg_field::type_id::create( "phy_reset_sel" );
      phy_reset_sel.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 2    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      phy_reset_val = uvm_reg_field::type_id::create( "phy_reset_val" );
      phy_reset_val.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 3    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      bgen_sel = uvm_reg_field::type_id::create( "bgen_sel" );
      bgen_sel.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 4    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      bgen_val = uvm_reg_field::type_id::create( "bgen_val" );
      bgen_val.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 5    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      test_burnin_sel = uvm_reg_field::type_id::create( "test_burnin_sel" );
      test_burnin_sel.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 6    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      test_burnin_val = uvm_reg_field::type_id::create( "test_burnin_val" );
      test_burnin_val.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 7    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      test_pwrdwn_sel = uvm_reg_field::type_id::create( "test_pwrdwn_sel" );
      test_pwrdwn_sel.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 8    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      test_pwrdwn_val = uvm_reg_field::type_id::create( "test_pwrdwn_val" );
      test_pwrdwn_val.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 9    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      reserved1 = uvm_reg_field::type_id::create( "reserved1" );
      reserved1.configure( .parent                 ( this ), 
                       .size                   ( 5    ), 
                       .lsb_pos                ( 10   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      masis_safe_sel = uvm_reg_field::type_id::create( "masis_safe_sel" );
      masis_safe_sel.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 15   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      masis_safe_val = uvm_reg_field::type_id::create( "masis_safe_val" );
      masis_safe_val.configure( .parent                 ( this ), 
                       .size                   ( 10   ), 
                       .lsb_pos                ( 16   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      reserved_for_future = uvm_reg_field::type_id::create( "reserved_for_future" );
      reserved_for_future.configure( .parent                 ( this ), 
                       .size                   ( 4    ), 
                       .lsb_pos                ( 26   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
   endfunction: build // }}} testmode_build
endclass: ieee1500_gopphy_dft_gasket_2_laneconfig_testmode_reg

//------------------------------------------------------------------------------
// Class: ieee1500_gopphy_dft_gasket_2_alttap_en_reg
//------------------------------------------------------------------------------

class ieee1500_gopphy_dft_gasket_2_alttap_en_reg extends dft_reg;
   `uvm_object_utils( ieee1500_gopphy_dft_gasket_2_alttap_en_reg )

   rand uvm_reg_field gopphy_dft_gasket_2_alttap_en_sipc0;
   rand uvm_reg_field gopphy_dft_gasket_2_alttap_en_enable;
    
   function new( string name = "ieee1500_gopphy_dft_gasket_2_alttap_en_reg" );
      super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_2_ALTTAP_EN_LENGTH ), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      gopphy_dft_gasket_2_alttap_en_sipc0 = uvm_reg_field::type_id::create( "gopphy_dft_gasket_2_alttap_en_sipc0" ); 
      gopphy_dft_gasket_2_alttap_en_sipc0.configure( .parent                 ( this ), 
                                                     .size                   ( `GOPPHY_DFT_GASKET_2_ALTTAP_EN_SIPC0_WIDTH), 
                                                     .lsb_pos                ( 0), 
                                                     .access                 ( "RW" ), 
                                                     .volatile               ( 0    ),
                                                     .reset                  ( `GOPPHY_DFT_GASKET_2_ALTTAP_EN_SIPC0_RST_VALUE), 
                                                     .has_reset              ( 1    ), 
                                                     .is_rand                ( 1    ), 
                                                     .individually_accessible( 0   ) );
      
     gopphy_dft_gasket_2_alttap_en_enable = uvm_reg_field::type_id::create( "gopphy_dft_gasket_2_alttap_en_enable" ); 
     gopphy_dft_gasket_2_alttap_en_enable.configure( .parent                 ( this ), 
                                                     .size                   ( `GOPPHY_DFT_GASKET_2_ALTTAP_EN_ENABLE_WIDTH), 
                                                     .lsb_pos                ( `GOPPHY_DFT_GASKET_2_ALTTAP_EN_SIPC0_WIDTH), 
                                                     .access                 ( "RW" ), 
                                                     .volatile               ( 0    ),
                                                     .reset                  ( `GOPPHY_DFT_GASKET_2_ALTTAP_EN_ENABLE_RST_VALUE), 
                                                     .has_reset              ( 1    ), 
                                                     .is_rand                ( 1    ), 
                                                     .individually_accessible( 0   ) );
   endfunction: build
endclass: ieee1500_gopphy_dft_gasket_2_alttap_en_reg


//below is for GOP2

//------------------------------------------------------------------------------
// Class: ieee1500_gopphy_dft_gasket_2_laneconfig_scanconfig_reg
//------------------------------------------------------------------------------
class ieee1500_gopphy_dft_gasket_2_laneconfig_scanconfig_reg extends dft_reg;
  `uvm_object_utils( ieee1500_gopphy_dft_gasket_2_laneconfig_scanconfig_reg )

  rand uvm_reg_field acscanmode;
  rand uvm_reg_field asyncresetoverride;
  rand uvm_reg_field clkdecodeoverride;
  rand uvm_reg_field dcscanmode;
  rand uvm_reg_field edtbypass;
  rand uvm_reg_field ioface;
  rand uvm_reg_field locmode;
  rand uvm_reg_field loesmode;
  rand uvm_reg_field rsvd0;
  rand uvm_reg_field rsvd4;
  rand uvm_reg_field rsvd5;
  rand uvm_reg_field rsvd6;
  rand uvm_reg_field scanwrpen;
  rand uvm_reg_field accapten_en;
  rand uvm_reg_field edt_low_power_shift_en;
  rand uvm_reg_field scanmode_wrp_clk;
  rand uvm_reg_field stoponskid_en;
  rand uvm_reg_field wrp_capt_en_override;

  function new( string name = "ieee1500_gopphy_dft_gasket_2_laneconfig_scanconfig_reg" );
    super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_2_LANECONFIG_SCANCONFIG_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

  virtual function void build(); // {{{ scanconfig_build
  dcscanmode = uvm_reg_field::type_id::create( "dcscanmode" );
  dcscanmode.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  acscanmode = uvm_reg_field::type_id::create( "acscanmode" );
  acscanmode.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 1    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  rsvd0 = uvm_reg_field::type_id::create( "rsvd0" );
  rsvd0.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 2    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  scanwrpen = uvm_reg_field::type_id::create( "scanwrpen" );
  scanwrpen.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 3    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  ioface = uvm_reg_field::type_id::create( "ioface" );
  ioface.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 4    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 1    ),//gaowei set to 1 accroding doc 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  edtbypass = uvm_reg_field::type_id::create( "edtbypass" );
  edtbypass.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 5    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 1    ),//gaowei set to 1 accroding doc  
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  stoponskid_en = uvm_reg_field::type_id::create( "stoponskid_en" );
  stoponskid_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 6    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  clkdecodeoverride = uvm_reg_field::type_id::create( "clkdecodeoverride" );
  clkdecodeoverride.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 7    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 1    ),//gaowei set to 1 accroding doc 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  locmode = uvm_reg_field::type_id::create( "locmode" );
  locmode.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 8    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  loesmode = uvm_reg_field::type_id::create( "loesmode" );
  loesmode.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 9    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  accapten_en = uvm_reg_field::type_id::create( "accapten_en" );
  accapten_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 10    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  scanmode_wrp_clk = uvm_reg_field::type_id::create( "scanmode_wrp_clk" );
  scanmode_wrp_clk.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 11    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  edt_low_power_shift_en = uvm_reg_field::type_id::create( "edt_low_power_shift_en" );
  edt_low_power_shift_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 12    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  wrp_capt_en_override = uvm_reg_field::type_id::create( "wrp_capt_en_override" );
  wrp_capt_en_override.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 13    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  rsvd4 = uvm_reg_field::type_id::create( "rsvd4" );
  rsvd4.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 14    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  rsvd5 = uvm_reg_field::type_id::create( "rsvd5" );
  rsvd5.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 15    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  rsvd6 = uvm_reg_field::type_id::create( "rsvd6" );
  rsvd6.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 16    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  asyncresetoverride = uvm_reg_field::type_id::create( "asyncresetoverride" );
  asyncresetoverride.configure( .parent        ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 17    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  endfunction: build // }}} scanconfig_build
endclass: ieee1500_gopphy_dft_gasket_2_laneconfig_scanconfig_reg

//------------------------------------------------------------------------------
//GOPPHY_DFT_GASKET_2_LANECONFIG_CLOCK_SELECT Define
//------------------------------------------------------------------------------
class ieee1500_gopphy_dft_gasket_2_laneconfig_clock_select_reg extends dft_reg;
  `uvm_object_utils( ieee1500_gopphy_dft_gasket_2_laneconfig_clock_select_reg )

  //rand uvm_reg_field gopphy_dft_gasket_2_laneconfig_clock_select;
  rand uvm_reg_field clock_select;

  function new( string name = "ieee1500_gopphy_dft_gasket_2_laneconfig_clock_select_reg" );
    super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_2_LANECONFIG_CLOCK_SELECT_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

  virtual function void build(); // {{{ clock_select_build
  clock_select = uvm_reg_field::type_id::create( "clock_select" );
  clock_select.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  endfunction: build // }}} clock_select_build
endclass: ieee1500_gopphy_dft_gasket_2_laneconfig_clock_select_reg

//------------------------------------------------------------------------------
//GOPPHY_DFT_GASKET_2_LANECONFIG_CLK_OBSERVE Define
//------------------------------------------------------------------------------
class ieee1500_gopphy_dft_gasket_2_laneconfig_clk_observe_reg extends dft_reg;
  `uvm_object_utils( ieee1500_gopphy_dft_gasket_2_laneconfig_clk_observe_reg )

  rand uvm_reg_field clk1_divider;//0
  rand uvm_reg_field clk1_sel_clk_0;//5
  rand uvm_reg_field clk1_sel_clk_1;//8
  rand uvm_reg_field clk1_sel_daisy_clk;//11
  rand uvm_reg_field clk1_sel_clk_out;//12
  rand uvm_reg_field clk1_byp_dfs;//13
  rand uvm_reg_field clk0_divider;//0
  rand uvm_reg_field clk0_sel_clk_0;//5
  rand uvm_reg_field clk0_sel_clk_1;//8
  rand uvm_reg_field clk0_sel_daisy_clk;//11
  rand uvm_reg_field clk0_sel_clk_out;//12
  rand uvm_reg_field clk0_byp_dfs;//13
  

  function new( string name = "ieee1500_gopphy_dft_gasket_2_laneconfig_clk_observe_reg" );
    super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_2_LANECONFIG_CLK_OBSERVE_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

  virtual function void build(); // {{{ clk_observe_build
  clk1_divider = uvm_reg_field::type_id::create( "clk1_divider" );
  clk1_divider.configure( .parent                 ( this ), 
                       .size                   ( 5    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
   
  clk1_sel_clk_0 = uvm_reg_field::type_id::create( "clk1_sel_clk_0" );
  clk1_sel_clk_0.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 5    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  clk1_sel_clk_1 = uvm_reg_field::type_id::create( "clk1_sel_clk_1" );
  clk1_sel_clk_1.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 8    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  clk1_sel_daisy_clk = uvm_reg_field::type_id::create( "clk1_sel_daisy_clk" );
  clk1_sel_daisy_clk.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 11    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  clk1_sel_clk_out = uvm_reg_field::type_id::create( "clk1_sel_clk_out" );
  clk1_sel_clk_out.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 12    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  clk1_byp_dfs = uvm_reg_field::type_id::create( "clk1_byp_dfs" );
  clk1_byp_dfs.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 13    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  clk0_divider = uvm_reg_field::type_id::create( "clk0_divider" );
  clk0_divider.configure( .parent                 ( this ), 
                       .size                   ( 5    ), 
                       .lsb_pos                ( 14    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
   
  clk0_sel_clk_0 = uvm_reg_field::type_id::create( "clk0_sel_clk_0" );
  clk0_sel_clk_0.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 19    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  clk0_sel_clk_1 = uvm_reg_field::type_id::create( "clk0_sel_clk_1" );
  clk0_sel_clk_1.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 22    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  clk0_sel_daisy_clk = uvm_reg_field::type_id::create( "clk0_sel_daisy_clk" );
  clk0_sel_daisy_clk.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 25    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  clk0_sel_clk_out = uvm_reg_field::type_id::create( "clk0_sel_clk_out" );
  clk0_sel_clk_out.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 26    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  clk0_byp_dfs = uvm_reg_field::type_id::create( "clk0_byp_dfs" );
  clk0_byp_dfs.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 27    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  endfunction: build // }}} clk_observe_build
endclass: ieee1500_gopphy_dft_gasket_2_laneconfig_clk_observe_reg

//------------------------------------------------------------------------------
//GOPPHY_DFT_GASKET_2_LANECONFIG_ANALOG_OBS_EN Define
//------------------------------------------------------------------------------
class ieee1500_gopphy_dft_gasket_2_laneconfig_analog_obs_en_reg extends dft_reg;
  `uvm_object_utils( ieee1500_gopphy_dft_gasket_2_laneconfig_analog_obs_en_reg )

  //rand uvm_reg_field gopphy_dft_gasket_2_laneconfig_analog_obs_en;
  rand uvm_reg_field atb_f_p_obsen;
  rand uvm_reg_field atb_s_m_obsen;
  rand uvm_reg_field atb_s_p_obsen;

  function new( string name = "ieee1500_gopphy_dft_gasket_2_laneconfig_analog_obs_en_reg" );
    super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_2_LANECONFIG_ANALOG_OBS_EN_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

  virtual function void build(); // {{{ analog_obs_en_build
  atb_f_p_obsen = uvm_reg_field::type_id::create( "atb_f_p_obsen" );
  atb_f_p_obsen.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  atb_s_m_obsen = uvm_reg_field::type_id::create( "atb_s_m_obsen" );
  atb_s_m_obsen.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 1    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  atb_s_p_obsen = uvm_reg_field::type_id::create( "atb_s_p_obsen" );
  atb_s_p_obsen.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 2    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );                   
    
  endfunction: build // }}} analog_obs_en_build
endclass: ieee1500_gopphy_dft_gasket_2_laneconfig_analog_obs_en_reg



//------------------------------------------------------------------------------
//GOPPHY_DFT_GASKET_2_LANECONFIG_CHANNEL_BYPASS Define
//------------------------------------------------------------------------------
class ieee1500_gopphy_dft_gasket_2_laneconfig_channel_bypass_reg extends dft_reg;
  `uvm_object_utils( ieee1500_gopphy_dft_gasket_2_laneconfig_channel_bypass_reg )

  //rand uvm_reg_field gopphy_dft_gasket_2_laneconfig_;
  rand uvm_reg_field channel_bypass;


  function new( string name = "ieee1500_gopphy_dft_gasket_2_laneconfig_channel_bypass_reg" );
    super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_2_LANECONFIG_CHANNEL_BYPASS_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

  virtual function void build(); // {{{ channel_bypass_build
  channel_bypass = uvm_reg_field::type_id::create( "channel_bypass" );
  channel_bypass.configure( .parent                 ( this ), 
                       .size                   ( 4    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  endfunction: build // }}} channel_bypass_build
endclass: ieee1500_gopphy_dft_gasket_2_laneconfig_channel_bypass_reg



//------------------------------------------------------------------------------
//GOPPHY_DFT_GASKET_2_LANECONFIG_ROS_CNTL_COUNTER Define 
//------------------------------------------------------------------------------
class ieee1500_gopphy_dft_gasket_2_laneconfig_ros_cntl_counter_reg extends dft_reg;
  `uvm_object_utils( ieee1500_gopphy_dft_gasket_2_laneconfig_ros_cntl_counter_reg )

  rand uvm_reg_field ros_cntl_counter;

  function new( string name = "ieee1500_gopphy_dft_gasket_2_laneconfig_ros_cntl_counter_reg" );
    super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_2_LANECONFIG_ROS_CNTL_COUNTER_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

  virtual function void build(); // {{{ ros_cntl_counter_build
  ros_cntl_counter = uvm_reg_field::type_id::create( "ros_cntl_counter" );
  ros_cntl_counter.configure( .parent                 ( this ), 
                       .size                   ( 8    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 4    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  endfunction: build // }}} ros_cntl_counter_build
endclass: ieee1500_gopphy_dft_gasket_2_laneconfig_ros_cntl_counter_reg



//------------------------------------------------------------------------------
//GOPPHY_DFT_GASKET_2_LANECONFIG_ROS_CNTL_ROSEN Define
//------------------------------------------------------------------------------
class ieee1500_gopphy_dft_gasket_2_laneconfig_ros_cntl_rosen_reg extends dft_reg;
  `uvm_object_utils( ieee1500_gopphy_dft_gasket_2_laneconfig_ros_cntl_rosen_reg )

  rand uvm_reg_field ros_cntl_rosen;

  function new( string name = "ieee1500_gopphy_dft_gasket_2_laneconfig_ros_cntl_rosen_reg" );
    super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_2_LANECONFIG_ROS_CNTL_ROSEN_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

  virtual function void build(); // {{{ ros_cntl_rosen_build
  ros_cntl_rosen = uvm_reg_field::type_id::create( "ros_cntl_rosen" );
  ros_cntl_rosen.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  endfunction: build // }}} ros_cntl_rosen_build
endclass: ieee1500_gopphy_dft_gasket_2_laneconfig_ros_cntl_rosen_reg


//------------------------------------------------------------------------------
//GOPPHY_DFT_GASKET_2_LANECONFIG_ROS_SETUP Define 
//------------------------------------------------------------------------------
class ieee1500_gopphy_dft_gasket_2_laneconfig_ros_setup_reg extends dft_reg;
  `uvm_object_utils( ieee1500_gopphy_dft_gasket_2_laneconfig_ros_setup_reg )

  rand uvm_reg_field cfg_bits;
  rand uvm_reg_field ros_size;
  rand uvm_reg_field counter_reset;
  rand uvm_reg_field enable_all;
  rand uvm_reg_field ros_clk_sel;

  function new( string name = "ieee1500_gopphy_dft_gasket_2_laneconfig_ros_setup_reg" );
    super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_2_LANECONFIG_ROS_SETUP_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

  virtual function void build(); // {{{ ros_setup_build
  cfg_bits = uvm_reg_field::type_id::create( "cfg_bits" );
  cfg_bits.configure( .parent                 ( this ), 
                       .size                   ( 4    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
   
  ros_size = uvm_reg_field::type_id::create( "ros_size" );
  ros_size.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 4    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  counter_reset = uvm_reg_field::type_id::create( "counter_reset" );
  counter_reset.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 6    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 1    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  enable_all = uvm_reg_field::type_id::create( "enable_all" );
  enable_all.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 7    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  ros_clk_sel = uvm_reg_field::type_id::create( "ros_clk_sel" );
  ros_clk_sel.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 8    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 1    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  endfunction: build // }}} ros_setup_build
endclass: ieee1500_gopphy_dft_gasket_2_laneconfig_ros_setup_reg

//------------------------------------------------------------------------------
//GOPPHY_DFT_GASKET_2_LANECONFIG_ROS_STATUS Define
//------------------------------------------------------------------------------
class ieee1500_gopphy_dft_gasket_2_laneconfig_ros_status_reg extends dft_reg;
  `uvm_object_utils( ieee1500_gopphy_dft_gasket_2_laneconfig_ros_status_reg )

  rand uvm_reg_field overflow;
  rand uvm_reg_field counter_bits;

  function new( string name = "ieee1500_gopphy_dft_gasket_2_laneconfig_ros_status_reg" );
    super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_2_LANECONFIG_ROS_STATUS_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

  virtual function void build(); // {{{ ros_status_build
  overflow = uvm_reg_field::type_id::create( "overflow" );
  overflow.configure( .parent                 ( this ),
                       .size                   ( 1    ),
                       .lsb_pos                ( 0    ),
                       .access                 ( "RO" ),
                       .volatile               ( 0    ),
                       .reset                  ( 0    ),
                       .has_reset              ( 1    ),
                       .is_rand                ( 1    ),
                       .individually_accessible( 0    ) );

  counter_bits = uvm_reg_field::type_id::create( "counter_bits" );
  counter_bits.configure( .parent                 ( this ),
                       .size                   ( 29    ),
                       .lsb_pos                ( 1    ),
                       .access                 ( "RO" ),
                       .volatile               ( 0    ),
                       .reset                  ( 0    ),
                       .has_reset              ( 1    ),
                       .is_rand                ( 1    ),
                       .individually_accessible( 0    ) );
  endfunction: build // }}} ros_status_build
endclass: ieee1500_gopphy_dft_gasket_2_laneconfig_ros_status_reg

//------------------------------------------------------------------------------
// Class: ieee1500_gopphy_dft_gasket_2_laneconfig_bsr_debug_reg
//------------------------------------------------------------------------------

class ieee1500_gopphy_dft_gasket_2_laneconfig_bsr_debug_reg extends dft_reg;
   `uvm_object_utils( ieee1500_gopphy_dft_gasket_2_laneconfig_bsr_debug_reg )

   rand uvm_reg_field reserved;
   rand uvm_reg_field bs_rx_level       ;
   rand uvm_reg_field bs_rx_lowswing      ;
   rand uvm_reg_field bs_tx_lowswing      ;

   function new( string name = "ieee1500_gopphy_dft_gasket_2_laneconfig_bsr_debug_reg" );
      super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_2_LANECONFIG_BSR_DEBUG_LENGTH ), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build(); // {{{ bsr_debug_build
      reserved = uvm_reg_field::type_id::create( "reserved" );
      reserved.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 7    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      bs_rx_level = uvm_reg_field::type_id::create( "bs_rx_level" );
      bs_rx_level.configure( .parent                 ( this ), 
                       .size                   ( 5    ), 
                       .lsb_pos                ( 2    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      bs_rx_lowswing = uvm_reg_field::type_id::create( "bs_rx_lowswing" );
      bs_rx_lowswing.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 1    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      bs_tx_lowswing = uvm_reg_field::type_id::create( "bs_tx_lowswing" );
      bs_tx_lowswing.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
   endfunction: build // }}} bsr_debug_build
endclass: ieee1500_gopphy_dft_gasket_2_laneconfig_bsr_debug_reg

//------------------------------------------------------------------------------
// Class: ieee1500_gopphy_dft_gasket_2_laneconfig_mpll_control_reg
//------------------------------------------------------------------------------

class ieee1500_gopphy_dft_gasket_2_laneconfig_mpll_control_reg extends dft_reg;
   `uvm_object_utils( ieee1500_gopphy_dft_gasket_2_laneconfig_mpll_control_reg )

   rand uvm_reg_field mpll_tdr_select;
   rand uvm_reg_field mpllb_ssc_range;
   rand uvm_reg_field mpllb_ssc_en;
   rand uvm_reg_field mpllb_ssc_clk_sel;
   rand uvm_reg_field mpllb_fracn_ctrl;
   rand uvm_reg_field mpllb_force_en;
   rand uvm_reg_field mpllb_div_multiplier;
   rand uvm_reg_field mpllb_div_clk_en;
   rand uvm_reg_field mpllb_init_cal_disable;
   rand uvm_reg_field mpllb_div16p5_clk_en;
   rand uvm_reg_field mpllb_div10_clk_en;
   rand uvm_reg_field mpllb_div8_clk_en;
   rand uvm_reg_field mpllb_bandwidth;
   rand uvm_reg_field mpllb_multiplier;
   rand uvm_reg_field mplla_ssc_range;
   rand uvm_reg_field mplla_ssc_en;
   rand uvm_reg_field mplla_ssc_clk_sel;
   rand uvm_reg_field mplla_fracn_ctrl    ;
   rand uvm_reg_field mplla_force_en     ;
   rand uvm_reg_field mplla_div_multiplier          ;
   rand uvm_reg_field mplla_div_clk_en           ;
   rand uvm_reg_field mplla_init_cal_disable     ;
   rand uvm_reg_field mplla_div16p5_clk_en      ;
   rand uvm_reg_field mplla_div10_clk_en      ;
   rand uvm_reg_field mplla_div8_clk_en           ;
   rand uvm_reg_field mplla_bandwidth       ;
   rand uvm_reg_field mplla_multiplier      ;
   
   function new( string name = "ieee1500_gopphy_dft_gasket_2_laneconfig_mpll_control_reg" );
      super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_2_LANECONFIG_MPLL_CONTROL_LENGTH ), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build(); // {{{ mpll_control_build
      mpll_tdr_select = uvm_reg_field::type_id::create( "mpll_tdr_select" );
      mpll_tdr_select.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 96   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      mpllb_ssc_range = uvm_reg_field::type_id::create( "mpllb_ssc_range" );
      mpllb_ssc_range.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 93   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      mpllb_ssc_en = uvm_reg_field::type_id::create( "mpllb_ssc_en" );
      mpllb_ssc_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 92   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      mpllb_ssc_clk_sel = uvm_reg_field::type_id::create( "mpllb_ssc_clk_sel" );
      mpllb_ssc_clk_sel.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 89   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      mpllb_fracn_ctrl = uvm_reg_field::type_id::create( "mpllb_fracn_ctrl" );
      mpllb_fracn_ctrl.configure( .parent                 ( this ), 
                       .size                   ( 9    ), 
                       .lsb_pos                ( 80   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      mpllb_force_en = uvm_reg_field::type_id::create( "mpllb_force_en" );
      mpllb_force_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 79   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      mpllb_div_multiplier = uvm_reg_field::type_id::create( "mpllb_div_multiplier" );
      mpllb_div_multiplier.configure( .parent                 ( this ), 
                       .size                   ( 7    ), 
                       .lsb_pos                ( 72   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      mpllb_div_clk_en = uvm_reg_field::type_id::create( "mpllb_div_clk_en" );
      mpllb_div_clk_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 71   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      mpllb_init_cal_disable = uvm_reg_field::type_id::create( "mpllb_init_cal_disable" );
      mpllb_init_cal_disable.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 70   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      mpllb_div16p5_clk_en = uvm_reg_field::type_id::create( "mpllb_div16p5_clk_en" );
      mpllb_div16p5_clk_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 69   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      mpllb_div10_clk_en = uvm_reg_field::type_id::create( "mpllb_div10_clk_en" );
      mpllb_div10_clk_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 68   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      mpllb_div8_clk_en = uvm_reg_field::type_id::create( "mpllb_div8_clk_en" );
      mpllb_div8_clk_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 67   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      mpllb_bandwidth = uvm_reg_field::type_id::create( "mpllb_bandwidth" );
      mpllb_bandwidth.configure( .parent                 ( this ), 
                       .size                   ( 11   ), 
                       .lsb_pos                ( 56   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      mpllb_multiplier = uvm_reg_field::type_id::create( "mpllb_multiplier" );
      mpllb_multiplier.configure( .parent                 ( this ), 
                       .size                   ( 8    ), 
                       .lsb_pos                ( 48   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      mplla_ssc_range = uvm_reg_field::type_id::create( "mplla_ssc_range" );
      mplla_ssc_range.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 45   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      mplla_ssc_en = uvm_reg_field::type_id::create( "mplla_ssc_en" );
      mplla_ssc_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 44   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      mplla_ssc_clk_sel = uvm_reg_field::type_id::create( "mplla_ssc_clk_sel" );
      mplla_ssc_clk_sel.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 41   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      mplla_fracn_ctrl = uvm_reg_field::type_id::create( "mplla_fracn_ctrl" );
      mplla_fracn_ctrl.configure( .parent                 ( this ), 
                       .size                   ( 9    ), 
                       .lsb_pos                ( 32   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      mplla_force_en = uvm_reg_field::type_id::create( "mplla_force_en" );
      mplla_force_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 31   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      mplla_div_multiplier = uvm_reg_field::type_id::create( "mplla_div_multiplier" );
      mplla_div_multiplier.configure( .parent                 ( this ), 
                       .size                   ( 7    ), 
                       .lsb_pos                ( 24   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      mplla_div_clk_en = uvm_reg_field::type_id::create( "mplla_div_clk_en" );
      mplla_div_clk_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 23   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      mplla_init_cal_disable = uvm_reg_field::type_id::create( "mplla_init_cal_disable" );
      mplla_init_cal_disable.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 22   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      mplla_div16p5_clk_en = uvm_reg_field::type_id::create( "mplla_div16p5_clk_en" );
      mplla_div16p5_clk_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 21   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      mplla_div10_clk_en = uvm_reg_field::type_id::create( "mplla_div10_clk_en" );
      mplla_div10_clk_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 20   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      mplla_div8_clk_en = uvm_reg_field::type_id::create( "mplla_div8_clk_en" );
      mplla_div8_clk_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 19   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      mplla_bandwidth = uvm_reg_field::type_id::create( "mplla_bandwidth" );
      mplla_bandwidth.configure( .parent                 ( this ), 
                       .size                   ( 11   ), 
                       .lsb_pos                ( 8    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      mplla_multiplier = uvm_reg_field::type_id::create( "mplla_multiplier" );
      mplla_multiplier.configure( .parent                 ( this ), 
                       .size                   ( 8    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
   endfunction: build // }}} mpll_control_build
endclass: ieee1500_gopphy_dft_gasket_2_laneconfig_mpll_control_reg

//------------------------------------------------------------------------------
//GOPPHY_DFT_GASKET_2_LANECONFIG_STATUS Define
//------------------------------------------------------------------------------
class ieee1500_gopphy_dft_gasket_2_laneconfig_status_reg extends dft_reg;
  `uvm_object_utils( ieee1500_gopphy_dft_gasket_2_laneconfig_status_reg )

  rand uvm_reg_field mplla_state;
  rand uvm_reg_field mpllb_state;
  rand uvm_reg_field tx0_ack;
  rand uvm_reg_field tx0_detrx_result;
  rand uvm_reg_field rx0_valid;
  rand uvm_reg_field rx0_los;
  rand uvm_reg_field rx0_ack;
  rand uvm_reg_field rx0_adapt_ack;
  rand uvm_reg_field tx1_ack;
  rand uvm_reg_field tx1_detrx_result;
  rand uvm_reg_field rx1_valid;
  rand uvm_reg_field rx1_los;
  rand uvm_reg_field rx1_ack;
  rand uvm_reg_field rx1_adapt_ack;
  rand uvm_reg_field tx2_ack;
  rand uvm_reg_field tx2_detrx_result;
  rand uvm_reg_field rx2_valid;
  rand uvm_reg_field rx2_los;
  rand uvm_reg_field rx2_ack;
  rand uvm_reg_field rx2_adapt_ack;
  rand uvm_reg_field tx3_ack;
  rand uvm_reg_field tx3_detrx_result;
  rand uvm_reg_field rx3_valid;
  rand uvm_reg_field rx3_los;
  rand uvm_reg_field rx3_ack;
  //rand uvm_reg_field rx3_adapt_ack;//gaowei in doc not in rtl
 
  function new( string name = "ieee1500_gopphy_dft_gasket_2_laneconfig_status_reg" );
    super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_2_LANECONFIG_STATUS_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

  virtual function void build(); // {{{ status_build
  mplla_state = uvm_reg_field::type_id::create( "mplla_state" );
  mplla_state.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  mpllb_state = uvm_reg_field::type_id::create( "mpllb_state" );
  mpllb_state.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 1    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  tx0_ack = uvm_reg_field::type_id::create( "tx0_ack" );
  tx0_ack.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 2    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  tx0_detrx_result = uvm_reg_field::type_id::create( "tx0_detrx_result" );
  tx0_detrx_result.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 3    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  rx0_valid = uvm_reg_field::type_id::create( "rx0_valid" );
  rx0_valid.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 4    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  rx0_los = uvm_reg_field::type_id::create( "rx0_los" );
  rx0_los.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 5    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  rx0_ack = uvm_reg_field::type_id::create( "rx0_ack" );
  rx0_ack.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 6    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  rx0_adapt_ack = uvm_reg_field::type_id::create( "rx0_adapt_ack" );
  rx0_adapt_ack.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 7    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  tx1_ack = uvm_reg_field::type_id::create( "tx1_ack" );
  tx1_ack.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 8    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  tx1_detrx_result = uvm_reg_field::type_id::create( "tx1_detrx_result" );
  tx1_detrx_result.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 9    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  rx1_valid = uvm_reg_field::type_id::create( "rx1_valid" );
  rx1_valid.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 10    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  rx1_los = uvm_reg_field::type_id::create( "rx1_los" );
  rx1_los.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 11    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  rx1_ack = uvm_reg_field::type_id::create( "rx1_ack" );
  rx1_ack.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 12    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  rx1_adapt_ack = uvm_reg_field::type_id::create( "rx1_adapt_ack" );
  rx1_adapt_ack.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 13    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  tx2_ack = uvm_reg_field::type_id::create( "tx2_ack" );
  tx2_ack.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 14    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  tx2_detrx_result = uvm_reg_field::type_id::create( "tx2_detrx_result" );
  tx2_detrx_result.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 15    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  rx2_valid = uvm_reg_field::type_id::create( "rx2_valid" );
  rx2_valid.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 16    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  rx2_los = uvm_reg_field::type_id::create( "rx2_los" );
  rx2_los.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 17    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  rx2_ack = uvm_reg_field::type_id::create( "rx2_ack" );
  rx2_ack.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 18    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  rx2_adapt_ack = uvm_reg_field::type_id::create( "rx2_adapt_ack" );
  rx2_adapt_ack.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 19    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
    
  tx3_ack = uvm_reg_field::type_id::create( "tx3_ack" );
  tx3_ack.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 20    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  tx3_detrx_result = uvm_reg_field::type_id::create( "tx3_detrx_result" );
  tx3_detrx_result.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 21    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  rx3_valid = uvm_reg_field::type_id::create( "rx3_valid" );
  rx3_valid.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 22    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  rx3_los = uvm_reg_field::type_id::create( "rx3_los" );
  rx3_los.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 23    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  rx3_ack = uvm_reg_field::type_id::create( "rx3_ack" );
  rx3_ack.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 24    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  //rx3_adapt_ack in doc not in spec
  //gaowei rx3_adapt_ack = uvm_reg_field::type_id::create( "rx3_adapt_ack" );
  //gaowei rx3_adapt_ack.configure( .parent                 ( this ), 
  //gaowei                      .size                   ( 1    ), 
  //gaowei                      .lsb_pos                ( 25    ), 
  //gaowei                      .access                 ( "RO" ), 
  //gaowei                      .volatile               ( 0    ),
  //gaowei                      .reset                  ( 0    ), 
  //gaowei                      .has_reset              ( 1    ), 
  //gaowei                      .is_rand                ( 1    ), 
  //gaowei                      .individually_accessible( 0    ) );
  endfunction: build // }}} status_build
endclass: ieee1500_gopphy_dft_gasket_2_laneconfig_status_reg

//------------------------------------------------------------------------------
// Class: ieee1500_gopphy_dft_gasket_2_laneconfig_loopback_reg
//------------------------------------------------------------------------------

class ieee1500_gopphy_dft_gasket_2_laneconfig_loopback_reg extends dft_reg;
   `uvm_object_utils( ieee1500_gopphy_dft_gasket_2_laneconfig_loopback_reg )

   rand uvm_reg_field rx1_cdr_vco_lowfreq   ;
   rand uvm_reg_field rx1_ref_ld_val        ;
   rand uvm_reg_field rx1_offcan_cont       ;
   rand uvm_reg_field rx1_adapt_cont        ;
   rand uvm_reg_field rx1_adapt_req         ;
   rand uvm_reg_field rx1_los_threshold     ;
   rand uvm_reg_field rx1_vco_ld_val        ;
   rand uvm_reg_field rx0_cdr_vco_lowfreq   ;
   rand uvm_reg_field rx0_ref_ld_val        ;
   rand uvm_reg_field rx0_offcan_cont       ;
   rand uvm_reg_field rx0_adapt_cont        ;
   rand uvm_reg_field rx0_adapt_req         ;
   rand uvm_reg_field rx0_los_threshold     ;
   rand uvm_reg_field rx0_vco_ld_val        ;
   rand uvm_reg_field loopback_tdr_select   ;
   rand uvm_reg_field lane0_rx2tx_par_lb_en ;
   rand uvm_reg_field lane0_tx2rx_ser_lb_en ;
   rand uvm_reg_field lane1_rx2tx_par_lb_en ;
   rand uvm_reg_field lane1_tx2rx_ser_lb_en ;
   rand uvm_reg_field lane2_rx2tx_par_lb_en ;
   rand uvm_reg_field lane2_tx2rx_ser_lb_en ;
   rand uvm_reg_field lane3_rx2tx_par_lb_en ;
   rand uvm_reg_field lane3_tx2rx_ser_lb_en ;
   rand uvm_reg_field tx0_data_en           ;
   rand uvm_reg_field rx0_data_en           ;
   rand uvm_reg_field tx1_data_en           ;
   rand uvm_reg_field rx1_data_en           ;
   rand uvm_reg_field tx2_data_en           ;
   rand uvm_reg_field rx2_data_en           ;
   rand uvm_reg_field tx3_data_en           ;
   rand uvm_reg_field rx3_data_en           ;
   
   function new( string name = "ieee1500_gopphy_dft_gasket_2_laneconfig_loopback_reg" );
      super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_2_LANECONFIG_LOOPBACK_LENGTH ), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build(); // {{{ loopback_build
      rx1_cdr_vco_lowfreq = uvm_reg_field::type_id::create( "rx1_cdr_vco_lowfreq" );
      rx1_cdr_vco_lowfreq.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 68   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx1_ref_ld_val = uvm_reg_field::type_id::create( "rx1_ref_ld_val" );
      rx1_ref_ld_val.configure( .parent                 ( this ), 
                       .size                   ( 6    ), 
                       .lsb_pos                ( 62   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx1_offcan_cont = uvm_reg_field::type_id::create( "rx1_offcan_cont" );
      rx1_offcan_cont.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 61   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx1_adapt_cont = uvm_reg_field::type_id::create( "rx1_adapt_cont" );
      rx1_adapt_cont.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 60   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx1_adapt_req = uvm_reg_field::type_id::create( "rx1_adapt_req" );
      rx1_adapt_req.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 59   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx1_los_threshold = uvm_reg_field::type_id::create( "rx1_los_threshold" );
      rx1_los_threshold.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 56   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx1_vco_ld_val = uvm_reg_field::type_id::create( "rx1_vco_ld_val" );
      rx1_vco_ld_val.configure( .parent                 ( this ), 
                       .size                   ( 13   ), 
                       .lsb_pos                ( 43   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx0_cdr_vco_lowfreq = uvm_reg_field::type_id::create( "rx0_cdr_vco_lowfreq" );
      rx0_cdr_vco_lowfreq.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 42   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx0_ref_ld_val = uvm_reg_field::type_id::create( "rx0_ref_ld_val" );
      rx0_ref_ld_val.configure( .parent                 ( this ), 
                       .size                   ( 6    ), 
                       .lsb_pos                ( 36   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx0_offcan_cont = uvm_reg_field::type_id::create( "rx0_offcan_cont" );
      rx0_offcan_cont.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 35   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx0_adapt_cont = uvm_reg_field::type_id::create( "rx0_adapt_cont" );
      rx0_adapt_cont.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 34   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx0_adapt_req = uvm_reg_field::type_id::create( "rx0_adapt_req" );
      rx0_adapt_req.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 33   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx0_los_threshold = uvm_reg_field::type_id::create( "rx0_los_threshold" );
      rx0_los_threshold.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 30   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx0_vco_ld_val = uvm_reg_field::type_id::create( "rx0_vco_ld_val" );
      rx0_vco_ld_val.configure( .parent                 ( this ), 
                       .size                   ( 13   ), 
                       .lsb_pos                ( 17   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      loopback_tdr_select = uvm_reg_field::type_id::create( "loopback_tdr_select" );
      loopback_tdr_select.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 16   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      lane0_rx2tx_par_lb_en = uvm_reg_field::type_id::create( "lane0_rx2tx_par_lb_en" );
      lane0_rx2tx_par_lb_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 15   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      lane0_tx2rx_ser_lb_en = uvm_reg_field::type_id::create( "lane0_tx2rx_ser_lb_en" );
      lane0_tx2rx_ser_lb_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 14   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      lane1_rx2tx_par_lb_en = uvm_reg_field::type_id::create( "lane1_rx2tx_par_lb_en" );
      lane1_rx2tx_par_lb_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 13   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      lane1_tx2rx_ser_lb_en = uvm_reg_field::type_id::create( "lane1_tx2rx_ser_lb_en" );
      lane1_tx2rx_ser_lb_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 12   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      lane2_rx2tx_par_lb_en = uvm_reg_field::type_id::create( "lane2_rx2tx_par_lb_en" );
      lane2_rx2tx_par_lb_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 11   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      lane2_tx2rx_ser_lb_en = uvm_reg_field::type_id::create( "lane2_tx2rx_ser_lb_en" );
      lane2_tx2rx_ser_lb_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 10   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      lane3_rx2tx_par_lb_en = uvm_reg_field::type_id::create( "lane3_rx2tx_par_lb_en" );
      lane3_rx2tx_par_lb_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 9    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      lane3_tx2rx_ser_lb_en = uvm_reg_field::type_id::create( "lane3_tx2rx_ser_lb_en" );
      lane3_tx2rx_ser_lb_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 8    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      tx0_data_en = uvm_reg_field::type_id::create( "tx0_data_en" );
      tx0_data_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 7    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx0_data_en = uvm_reg_field::type_id::create( "rx0_data_en" );
      rx0_data_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 6    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      tx1_data_en = uvm_reg_field::type_id::create( "tx1_data_en" );
      tx1_data_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 5    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx1_data_en = uvm_reg_field::type_id::create( "rx1_data_en" );
      rx1_data_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 4    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      tx2_data_en = uvm_reg_field::type_id::create( "tx2_data_en" );
      tx2_data_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 3    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx2_data_en = uvm_reg_field::type_id::create( "rx2_data_en" );
      rx2_data_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 2    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      tx3_data_en = uvm_reg_field::type_id::create( "tx3_data_en" );
      tx3_data_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 1    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx3_data_en = uvm_reg_field::type_id::create( "rx3_data_en" );
      rx3_data_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
   endfunction: build // }}} loopback_build
endclass: ieee1500_gopphy_dft_gasket_2_laneconfig_loopback_reg

//------------------------------------------------------------------------------
// Class: ieee1500_gopphy_dft_gasket_2_laneconfig_loopback_rx_reg
//------------------------------------------------------------------------------

class ieee1500_gopphy_dft_gasket_2_laneconfig_loopback_rx_reg extends dft_reg;
   `uvm_object_utils( ieee1500_gopphy_dft_gasket_2_laneconfig_loopback_rx_reg )

   rand uvm_reg_field loopback_rx_tdr_select;
   rand uvm_reg_field rx0_reset   ;
   rand uvm_reg_field rx1_reset   ;
   rand uvm_reg_field rx2_reset   ;
   rand uvm_reg_field rx3_reset   ;
   rand uvm_reg_field rx0_lpd     ;
   rand uvm_reg_field rx1_lpd     ;
   rand uvm_reg_field rx2_lpd     ;
   rand uvm_reg_field rx3_lpd     ;
   rand uvm_reg_field rx0_pstate  ;
   rand uvm_reg_field rx1_pstate  ;
   rand uvm_reg_field rx2_pstate  ;
   rand uvm_reg_field rx3_pstate  ;
   rand uvm_reg_field rx0_rate    ;
   rand uvm_reg_field rx1_rate    ;
   rand uvm_reg_field rx2_rate    ;
   rand uvm_reg_field rx3_rate    ;
   rand uvm_reg_field rx0_width   ;
   rand uvm_reg_field rx1_width   ;
   rand uvm_reg_field rx2_width   ;
   rand uvm_reg_field rx3_width   ;
   
   function new( string name = "ieee1500_gopphy_dft_gasket_2_laneconfig_loopback_rx_reg" );
      super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_2_LANECONFIG_LOOPBACK_RX_LENGTH ), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build(); // {{{ loopback_rx_build
      loopback_rx_tdr_select = uvm_reg_field::type_id::create( "loopback_rx_tdr_select" );
      loopback_rx_tdr_select.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 32   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx0_reset = uvm_reg_field::type_id::create( "rx0_reset" );
      rx0_reset.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 31   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx1_reset = uvm_reg_field::type_id::create( "rx1_reset" );
      rx1_reset.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 30   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx2_reset = uvm_reg_field::type_id::create( "rx2_reset" );
      rx2_reset.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 29   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx3_reset = uvm_reg_field::type_id::create( "rx3_reset" );
      rx3_reset.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 28   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx0_lpd = uvm_reg_field::type_id::create( "rx0_lpd" );
      rx0_lpd.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 27   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx1_lpd = uvm_reg_field::type_id::create( "rx1_lpd" );
      rx1_lpd.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 26   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx2_lpd = uvm_reg_field::type_id::create( "rx2_lpd" );
      rx2_lpd.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 25   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx3_lpd = uvm_reg_field::type_id::create( "rx3_lpd" );
      rx3_lpd.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 24   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx0_pstate = uvm_reg_field::type_id::create( "rx0_pstate" );
      rx0_pstate.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 22   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx1_pstate = uvm_reg_field::type_id::create( "rx1_pstate" );
      rx1_pstate.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 20   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx2_pstate = uvm_reg_field::type_id::create( "rx2_pstate" );
      rx2_pstate.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 18   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx3_pstate = uvm_reg_field::type_id::create( "rx3_pstate" );
      rx3_pstate.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 16   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx0_rate = uvm_reg_field::type_id::create( "rx0_rate" );
      rx0_rate.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 14   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx1_rate = uvm_reg_field::type_id::create( "rx1_rate" );
      rx1_rate.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 12   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx2_rate = uvm_reg_field::type_id::create( "rx2_rate" );
      rx2_rate.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 10   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx3_rate = uvm_reg_field::type_id::create( "rx3_rate" );
      rx3_rate.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 8    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx0_width = uvm_reg_field::type_id::create( "rx0_width" );
      rx0_width.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 6    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx1_width = uvm_reg_field::type_id::create( "rx1_width" );
      rx1_width.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 4    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx2_width = uvm_reg_field::type_id::create( "rx2_width" );
      rx2_width.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 2    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      rx3_width = uvm_reg_field::type_id::create( "rx3_width" );
      rx3_width.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
   endfunction: build // }}} loopback_rx_build
endclass: ieee1500_gopphy_dft_gasket_2_laneconfig_loopback_rx_reg

//------------------------------------------------------------------------------
// Class: ieee1500_gopphy_dft_gasket_2_laneconfig_loopback_tx_reg
//------------------------------------------------------------------------------

class ieee1500_gopphy_dft_gasket_2_laneconfig_loopback_tx_reg extends dft_reg;
   `uvm_object_utils( ieee1500_gopphy_dft_gasket_2_laneconfig_loopback_tx_reg )

   rand uvm_reg_field loopback_tx_tdr_select;
   rand uvm_reg_field tx0_mpllb_sel   ;
   rand uvm_reg_field tx1_mpllb_sel   ;
   rand uvm_reg_field tx2_mpllb_sel   ;
   rand uvm_reg_field tx3_mpllb_sel   ;
   rand uvm_reg_field tx0_reset       ;
   rand uvm_reg_field tx1_reset       ;
   rand uvm_reg_field tx2_reset       ;
   rand uvm_reg_field tx3_reset       ;
   rand uvm_reg_field tx0_lpd         ;
   rand uvm_reg_field tx1_lpd         ;
   rand uvm_reg_field tx2_lpd         ;
   rand uvm_reg_field tx3_lpd         ;
   rand uvm_reg_field tx0_pstate      ;
   rand uvm_reg_field tx1_pstate      ;
   rand uvm_reg_field tx2_pstate      ;
   rand uvm_reg_field tx3_pstate      ;
   rand uvm_reg_field tx0_rate        ;
   rand uvm_reg_field tx1_rate        ;
   rand uvm_reg_field tx2_rate        ;
   rand uvm_reg_field tx3_rate        ;
   rand uvm_reg_field tx0_width       ;
   rand uvm_reg_field tx1_width       ;
   rand uvm_reg_field tx2_width       ;
   rand uvm_reg_field tx3_width       ;
   
   function new( string name = "ieee1500_gopphy_dft_gasket_2_laneconfig_loopback_tx_reg" );
      super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_2_LANECONFIG_LOOPBACK_TX_LENGTH ), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build(); // {{{ loopback_tx_build
      loopback_tx_tdr_select = uvm_reg_field::type_id::create( "loopback_tx_tdr_select" );
      loopback_tx_tdr_select.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 40   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      tx0_mpllb_sel = uvm_reg_field::type_id::create( "tx0_mpllb_sel" );
      tx0_mpllb_sel.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 39   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      tx1_mpllb_sel = uvm_reg_field::type_id::create( "tx1_mpllb_sel" );
      tx1_mpllb_sel.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 38   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      tx2_mpllb_sel = uvm_reg_field::type_id::create( "tx2_mpllb_sel" );
      tx2_mpllb_sel.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 37   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      tx3_mpllb_sel = uvm_reg_field::type_id::create( "tx3_mpllb_sel" );
      tx3_mpllb_sel.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 36   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      tx0_reset = uvm_reg_field::type_id::create( "tx0_reset" );
      tx0_reset.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 35   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      tx1_reset = uvm_reg_field::type_id::create( "tx1_reset" );
      tx1_reset.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 34   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      tx2_reset = uvm_reg_field::type_id::create( "tx2_reset" );
      tx2_reset.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 33   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      tx3_reset = uvm_reg_field::type_id::create( "tx3_reset" );
      tx3_reset.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 32   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      tx0_lpd = uvm_reg_field::type_id::create( "tx0_lpd" );
      tx0_lpd.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 31   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      tx1_lpd = uvm_reg_field::type_id::create( "tx1_lpd" );
      tx1_lpd.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 30   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      tx2_lpd = uvm_reg_field::type_id::create( "tx2_lpd" );
      tx2_lpd.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 29   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      tx3_lpd = uvm_reg_field::type_id::create( "tx3_lpd" );
      tx3_lpd.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 28   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      tx0_pstate = uvm_reg_field::type_id::create( "tx0_pstate" );
      tx0_pstate.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 26   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      tx1_pstate = uvm_reg_field::type_id::create( "tx1_pstate" );
      tx1_pstate.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 24   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      tx2_pstate = uvm_reg_field::type_id::create( "tx2_pstate" );
      tx2_pstate.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 22   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      tx3_pstate = uvm_reg_field::type_id::create( "tx3_pstate" );
      tx3_pstate.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 20   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      tx0_rate = uvm_reg_field::type_id::create( "tx0_rate" );
      tx0_rate.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 17   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      tx1_rate = uvm_reg_field::type_id::create( "tx1_rate" );
      tx1_rate.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 14   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      tx2_rate = uvm_reg_field::type_id::create( "tx2_rate" );
      tx2_rate.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 11   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      tx3_rate = uvm_reg_field::type_id::create( "tx3_rate" );
      tx3_rate.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 8    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      tx0_width = uvm_reg_field::type_id::create( "tx0_width" );
      tx0_width.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 6    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      tx1_width = uvm_reg_field::type_id::create( "tx1_width" );
      tx1_width.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 4    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      tx2_width = uvm_reg_field::type_id::create( "tx2_width" );
      tx2_width.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 2    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      tx3_width = uvm_reg_field::type_id::create( "tx3_width" );
      tx3_width.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
   endfunction: build // }}} loopback_tx_build
endclass: ieee1500_gopphy_dft_gasket_2_laneconfig_loopback_tx_reg

//------------------------------------------------------------------------------
// Class: ieee1500_gopphy_dft_gasket_2_laneconfig_isolation_chain_ctrl_reg
//------------------------------------------------------------------------------

class ieee1500_gopphy_dft_gasket_2_laneconfig_isolation_chain_ctrl_reg extends dft_reg;
   `uvm_object_utils( ieee1500_gopphy_dft_gasket_2_laneconfig_isolation_chain_ctrl_reg )

   rand uvm_reg_field isochain_override_select;
   rand uvm_reg_field test_powerdown       ;
   rand uvm_reg_field ref_clk_div2_en      ;
   rand uvm_reg_field ref_clk_en      ;
   rand uvm_reg_field res_ack_in           ;
   rand uvm_reg_field ref_use_pad           ;
   rand uvm_reg_field cr_para_sel          ;
   rand uvm_reg_field cr_para_wr_en     ;
   rand uvm_reg_field cr_para_rd_en    ;
   rand uvm_reg_field cr_para_wr_data     ;
   rand uvm_reg_field cr_para_addr;
   
   function new( string name = "ieee1500_gopphy_dft_gasket_2_laneconfig_isolation_chain_ctrl_reg" );
      super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_2_LANECONFIG_ISOLATION_CHAIN_CTRL_LENGTH ), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build(); // {{{ isolation_chain_ctrl_build
      isochain_override_select = uvm_reg_field::type_id::create( "isochain_override_select" );
      isochain_override_select.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 40   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      test_powerdown = uvm_reg_field::type_id::create( "test_powerdown" );
      test_powerdown.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 39   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      ref_clk_div2_en = uvm_reg_field::type_id::create( "ref_clk_div2_en" );
      ref_clk_div2_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 38   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      ref_clk_en = uvm_reg_field::type_id::create( "ref_clk_en" );
      ref_clk_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 37   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      res_ack_in = uvm_reg_field::type_id::create( "res_ack_in" );
      res_ack_in.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 36   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      ref_use_pad = uvm_reg_field::type_id::create( "ref_use_pad" );
      ref_use_pad.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 35   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      cr_para_sel = uvm_reg_field::type_id::create( "cr_para_sel" );
      cr_para_sel.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 34   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      cr_para_wr_en = uvm_reg_field::type_id::create( "cr_para_wr_en" );
      cr_para_wr_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 33   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      cr_para_rd_en = uvm_reg_field::type_id::create( "cr_para_rd_en" );
      cr_para_rd_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 32   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      cr_para_wr_data = uvm_reg_field::type_id::create( "cr_para_wr_data" );
      cr_para_wr_data.configure( .parent                 ( this ), 
                       .size                   ( 16   ), 
                       .lsb_pos                ( 16   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
      cr_para_addr = uvm_reg_field::type_id::create( "cr_para_addr" );
      cr_para_addr.configure( .parent                 ( this ), 
                       .size                   ( 16   ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
   endfunction: build // }}} isolation_chain_ctrl_build
endclass: ieee1500_gopphy_dft_gasket_2_laneconfig_isolation_chain_ctrl_reg

//------------------------------------------------------------------------------
//GOPPHY_DFT_GASKET_2_LANECONFIG_ISOLATION_CHAIN_OBS Define
//------------------------------------------------------------------------------
class ieee1500_gopphy_dft_gasket_2_laneconfig_isolation_chain_obs_reg extends dft_reg;
  `uvm_object_utils( ieee1500_gopphy_dft_gasket_2_laneconfig_isolation_chain_obs_reg )

  //rand uvm_reg_field gopphy_dft_gasket_2_laneconfig_isolation_chain_obs;
  rand uvm_reg_field cr_para_ack;
  rand uvm_reg_field cr_para_rd_data;

  function new( string name = "ieee1500_gopphy_dft_gasket_2_laneconfig_isolation_chain_obs_reg" );
    super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_2_LANECONFIG_ISOLATION_CHAIN_OBS_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

  virtual function void build(); // {{{ isolation_chain_obs_build
  cr_para_ack = uvm_reg_field::type_id::create( "cr_para_ack" );
  cr_para_ack.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  cr_para_rd_data= uvm_reg_field::type_id::create( "cr_para_rd_data" );
  cr_para_rd_data.configure( .parent                 ( this ), 
                       .size                   ( 16    ), 
                       .lsb_pos                ( 1    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  endfunction: build // }}} isolation_chain_obs_build
endclass: ieee1500_gopphy_dft_gasket_2_laneconfig_isolation_chain_obs_reg

//finish GOP2

//below is for GOP4
//------------------------------------------------------------------------------
// Class: ieee1500_gopphy_dft_gasket_4_laneconfig_testmode_reg
//------------------------------------------------------------------------------

class ieee1500_gopphy_dft_gasket_4_laneconfig_testmode_reg extends dft_reg;
   `uvm_object_utils( ieee1500_gopphy_dft_gasket_4_laneconfig_testmode_reg )

  rand uvm_reg_field reserved0;// 0
  rand uvm_reg_field scan_set_rst;//1
  rand uvm_reg_field phy_reset_sel;//2
  rand uvm_reg_field phy_reset_val;//3
  rand uvm_reg_field bgen_sel;//4
  rand uvm_reg_field bgen_val;//5
  rand uvm_reg_field test_burnin_sel;//6
  rand uvm_reg_field test_burnin_val;//7
  rand uvm_reg_field test_pwrdwn_sel;//8
  rand uvm_reg_field test_pwrdwn_val;//9--
  rand uvm_reg_field reserved1;// 10
  rand uvm_reg_field masis_safe_sel;//15
  rand uvm_reg_field mplla_tx_clk_div;//16
  rand uvm_reg_field mpllb_tx_clk_div;//18
  rand uvm_reg_field pcs_pwr_stable;//20
  rand uvm_reg_field pg_mode_en;//21
  rand uvm_reg_field pg_reset;//22
  rand uvm_reg_field pma_pwr_stable;//23
  rand uvm_reg_field ref_clk_mplla_div2_en;//24
  rand uvm_reg_field ref_clk_mpllb_div2_en;//25--
  rand uvm_reg_field ref_range;//26
  rand uvm_reg_field ref_repeat_clk_en;//29
  rand uvm_reg_field res_req_in;//30
  rand uvm_reg_field rtune_req;//31
  rand uvm_reg_field rxn_adapt_afe_en;//32
  rand uvm_reg_field rxn_adapt_dfe_en;//36
  rand uvm_reg_field rxn_align_en;//40
  rand uvm_reg_field rxn_cdr_ssc_en;//44
  rand uvm_reg_field rxn_cdr_track_en;//48
  rand uvm_reg_field rxn_clk_shift;//52--
  rand uvm_reg_field rxn_disable;//56
  rand uvm_reg_field rxn_eq_afe_gain;//60
  rand uvm_reg_field rxn_eq_att_lvl;//76
  rand uvm_reg_field rxn_eq_ctle_boost;//88
  rand uvm_reg_field rxn_eq_dfe_tap1;//108
  rand uvm_reg_field rxn_invert;//140
  rand uvm_reg_field rxn_los_lfps_en;//144
  rand uvm_reg_field rxn_req;//148
  rand uvm_reg_field rxn_term_acdc;//152
  rand uvm_reg_field rxn_term_en;//156--
  rand uvm_reg_field rx_vref_ctrl;//160
  rand uvm_reg_field test_flyover_en;//165
  rand uvm_reg_field txn_beacon_en;//166
  rand uvm_reg_field txn_clk;//170
  rand uvm_reg_field txn_clk_rdy;//174
  rand uvm_reg_field txn_data;//178
  rand uvm_reg_field txn_detrx_req;//258
  rand uvm_reg_field txn_disable;//262
  rand uvm_reg_field txn_eq_main;//266
  rand uvm_reg_field txn_eq_post;//290--
  rand uvm_reg_field txn_eq_pre;//314
  rand uvm_reg_field txn_flyover_data_m;//338
  rand uvm_reg_field txn_flyover_data_p;//342
  rand uvm_reg_field txn_iboost_lvl;//346
  rand uvm_reg_field txn_invert;//362
  rand uvm_reg_field txn_master_mplla_state;//366
  rand uvm_reg_field txn_master_mpllb_state;//370
  rand uvm_reg_field txn_mpll_en;//374
  rand uvm_reg_field txn_req;//378
  rand uvm_reg_field txn_vboost_en;//382--
  rand uvm_reg_field tx_vboost_lvl;//386
  rand uvm_reg_field ana_pwr_en;//389

  function new( string name = "ieee1500_gopphy_dft_gasket_4_laneconfig_testmode_reg" );
    super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_4_LANECONFIG_TESTMODE_LENGTH ), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

   virtual function void build();
      reserved0 = uvm_reg_field::type_id::create( "reserved0" );
      reserved0.configure( .parent                 ( this ), 
                       .size                   ( 1), 
                       .lsb_pos                ( 0), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      scan_set_rst = uvm_reg_field::type_id::create( "scan_set_rst" );
      scan_set_rst.configure( .parent                 ( this ), 
                       .size                   ( 1), 
                       .lsb_pos                ( 1), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      phy_reset_sel = uvm_reg_field::type_id::create( "phy_reset_sel" );
      phy_reset_sel.configure( .parent                 ( this ), 
                       .size                   ( 1), 
                       .lsb_pos                ( 2), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      phy_reset_val = uvm_reg_field::type_id::create( "phy_reset_val" );
      phy_reset_val.configure( .parent                 ( this ), 
                       .size                   ( 1), 
                       .lsb_pos                ( 3), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      bgen_sel = uvm_reg_field::type_id::create( "bgen_sel" );
      bgen_sel.configure( .parent                 ( this ), 
                       .size                   ( 1), 
                       .lsb_pos                ( 4), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      bgen_val = uvm_reg_field::type_id::create( "bgen_val" );
      bgen_val.configure( .parent                 ( this ), 
                       .size                   ( 1), 
                       .lsb_pos                ( 5), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      test_burnin_sel = uvm_reg_field::type_id::create( "test_burnin_sel" );
      test_burnin_sel.configure( .parent                 ( this ), 
                       .size                   ( 1), 
                       .lsb_pos                ( 6), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      test_burnin_val = uvm_reg_field::type_id::create( "test_burnin_val" );
      test_burnin_val.configure( .parent                 ( this ), 
                       .size                   ( 1), 
                       .lsb_pos                ( 7), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      test_pwrdwn_sel = uvm_reg_field::type_id::create( "test_pwrdwn_sel" );
      test_pwrdwn_sel.configure( .parent                 ( this ), 
                       .size                   ( 1), 
                       .lsb_pos                ( 8), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      test_pwrdwn_val = uvm_reg_field::type_id::create( "test_pwrdwn_val" );
      test_pwrdwn_val.configure( .parent                 ( this ), 
                       .size                   ( 1), 
                       .lsb_pos                ( 9), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      reserved1 = uvm_reg_field::type_id::create( "reserved1" );
      reserved1.configure( .parent                 ( this ), 
                       .size                   ( 5), 
                       .lsb_pos                ( 10), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      masis_safe_sel = uvm_reg_field::type_id::create( "masis_safe_sel" );
      masis_safe_sel.configure( .parent                 ( this ), 
                       .size                   ( 1), 
                       .lsb_pos                ( 15), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      mplla_tx_clk_div = uvm_reg_field::type_id::create( "mplla_tx_clk_div" );
      mplla_tx_clk_div.configure( .parent                 ( this ), 
                       .size                   ( 2), 
                       .lsb_pos                ( 16), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      mpllb_tx_clk_div= uvm_reg_field::type_id::create( "mpllb_tx_clk_div" );
      mpllb_tx_clk_div.configure( .parent                 ( this ), 
                       .size                   ( 2), 
                       .lsb_pos                ( 18), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      pcs_pwr_stable = uvm_reg_field::type_id::create( "pcs_pwr_stable" );
      pcs_pwr_stable.configure( .parent                 ( this ), 
                       .size                   ( 1), 
                       .lsb_pos                ( 20), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      pg_mode_en = uvm_reg_field::type_id::create( "pg_mode_en" );
      pg_mode_en.configure( .parent                 ( this ), 
                       .size                   ( 1), 
                       .lsb_pos                ( 21), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      pg_reset = uvm_reg_field::type_id::create( "pg_reset" );
      pg_reset.configure( .parent                 ( this ), 
                       .size                   ( 1), 
                       .lsb_pos                ( 22), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      pma_pwr_stable = uvm_reg_field::type_id::create( "pma_pwr_stable" );
      pma_pwr_stable.configure( .parent                 ( this ), 
                       .size                   ( 1), 
                       .lsb_pos                ( 23), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      ref_clk_mplla_div2_en = uvm_reg_field::type_id::create( "ref_clk_mplla_div2_en" );
      ref_clk_mplla_div2_en.configure( .parent                 ( this ), 
                       .size                   ( 1), 
                       .lsb_pos                ( 24), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      ref_clk_mpllb_div2_en = uvm_reg_field::type_id::create( "ref_clk_mpllb_div2_en" );
      ref_clk_mpllb_div2_en.configure( .parent                 ( this ), 
                       .size                   ( 1), 
                       .lsb_pos                ( 25), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      ref_range = uvm_reg_field::type_id::create( "ref_range" );
      ref_range.configure( .parent                 ( this ), 
                       .size                   ( 3), 
                       .lsb_pos                ( 26), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      ref_repeat_clk_en = uvm_reg_field::type_id::create( "ref_repeat_clk_en" );
      ref_repeat_clk_en.configure( .parent                 ( this ), 
                       .size                   ( 1), 
                       .lsb_pos                ( 29), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      res_req_in = uvm_reg_field::type_id::create( "res_req_in" );
      res_req_in.configure( .parent                 ( this ), 
                       .size                   ( 1), 
                       .lsb_pos                ( 30), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      rtune_req = uvm_reg_field::type_id::create( "rtune_req" );
      rtune_req.configure( .parent                 ( this ), 
                       .size                   ( 1), 
                       .lsb_pos                ( 31), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      rxn_adapt_afe_en = uvm_reg_field::type_id::create( "rxn_adapt_afe_en" );
      rxn_adapt_afe_en.configure( .parent                 ( this ), 
                       .size                   ( 4), 
                       .lsb_pos                ( 32), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      rxn_adapt_dfe_en = uvm_reg_field::type_id::create( "rxn_adapt_dfe_en" );
      rxn_adapt_dfe_en.configure( .parent                 ( this ), 
                       .size                   ( 4), 
                       .lsb_pos                ( 36), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      rxn_align_en = uvm_reg_field::type_id::create( "rxn_align_en" );
      rxn_align_en.configure( .parent                 ( this ), 
                       .size                   ( 4), 
                       .lsb_pos                ( 40), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      rxn_cdr_ssc_en = uvm_reg_field::type_id::create( "rxn_cdr_ssc_en" );
      rxn_cdr_ssc_en.configure( .parent                 ( this ), 
                       .size                   ( 4), 
                       .lsb_pos                ( 44), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      rxn_cdr_track_en = uvm_reg_field::type_id::create( "rxn_cdr_track_en" );
      rxn_cdr_track_en .configure( .parent                 ( this ), 
                       .size                   ( 4), 
                       .lsb_pos                ( 48), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      rxn_clk_shift = uvm_reg_field::type_id::create( "rxn_clk_shift" );
      rxn_clk_shift.configure( .parent                 ( this ), 
                       .size                   ( 4), 
                       .lsb_pos                ( 52), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      rxn_disable = uvm_reg_field::type_id::create( "rxn_disable" );
      rxn_disable.configure( .parent                 ( this ), 
                       .size                   ( 4), 
                       .lsb_pos                ( 56), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      rxn_eq_afe_gain = uvm_reg_field::type_id::create( "rxn_eq_afe_gain" );
      rxn_eq_afe_gain.configure( .parent                 ( this ), 
                       .size                   ( 16), 
                       .lsb_pos                ( 60), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      rxn_eq_att_lvl = uvm_reg_field::type_id::create( "rxn_eq_att_lvl" );
      rxn_eq_att_lvl.configure( .parent                 ( this ), 
                       .size                   ( 12), 
                       .lsb_pos                ( 76), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      rxn_eq_ctle_boost = uvm_reg_field::type_id::create( "rxn_eq_ctle_boost" );
      rxn_eq_ctle_boost.configure( .parent                 ( this ), 
                       .size                   ( 20), 
                       .lsb_pos                ( 88), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      rxn_eq_dfe_tap1 = uvm_reg_field::type_id::create( "rxn_eq_dfe_tap1" );
      rxn_eq_dfe_tap1.configure( .parent                 ( this ), 
                       .size                   ( 32), 
                       .lsb_pos                ( 108), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      rxn_invert = uvm_reg_field::type_id::create( "rxn_invert" );
      rxn_invert.configure( .parent                 ( this ), 
                       .size                   ( 4), 
                       .lsb_pos                ( 140), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      rxn_los_lfps_en = uvm_reg_field::type_id::create( "rxn_los_lfps_en" );
      rxn_los_lfps_en.configure( .parent                 ( this ), 
                       .size                   ( 4), 
                       .lsb_pos                ( 144), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      rxn_req = uvm_reg_field::type_id::create( "rxn_req" );
      rxn_req.configure( .parent                 ( this ), 
                       .size                   ( 4), 
                       .lsb_pos                ( 148), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      rxn_term_acdc= uvm_reg_field::type_id::create( "rxn_term_acdc" );
      rxn_term_acdc.configure( .parent                 ( this ), 
                       .size                   ( 4), 
                       .lsb_pos                ( 152), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      rxn_term_en= uvm_reg_field::type_id::create( "rxn_term_en" );
      rxn_term_en.configure( .parent                 ( this ), 
                       .size                   ( 4), 
                       .lsb_pos                ( 156), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      rx_vref_ctrl = uvm_reg_field::type_id::create( "rx_vref_ctrl" );
      rx_vref_ctrl.configure( .parent                 ( this ), 
                       .size                   ( 5), 
                       .lsb_pos                ( 160), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      test_flyover_en= uvm_reg_field::type_id::create( "test_flyover_en" );
      test_flyover_en.configure( .parent                 ( this ), 
                       .size                   ( 1), 
                       .lsb_pos                ( 165), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      txn_beacon_en = uvm_reg_field::type_id::create( "txn_beacon_en" );
      txn_beacon_en.configure( .parent                 ( this ), 
                       .size                   ( 4), 
                       .lsb_pos                ( 166), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      txn_clk = uvm_reg_field::type_id::create( "txn_clk" );
      txn_clk.configure( .parent                 ( this ), 
                       .size                   ( 4), 
                       .lsb_pos                ( 170), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      txn_clk_rdy = uvm_reg_field::type_id::create( "txn_clk_rdy" );
      txn_clk_rdy.configure( .parent                 ( this ), 
                       .size                   ( 4), 
                       .lsb_pos                ( 174), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      txn_data = uvm_reg_field::type_id::create( "txn_data" );
      txn_data.configure( .parent                 ( this ), 
                       .size                   ( 80), 
                       .lsb_pos                ( 178), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      txn_detrx_req = uvm_reg_field::type_id::create( "txn_detrx_req" );
      txn_detrx_req.configure( .parent                 ( this ), 
                       .size                   ( 4), 
                       .lsb_pos                ( 258), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      txn_disable = uvm_reg_field::type_id::create( "txn_disable" );
      txn_disable.configure( .parent                 ( this ), 
                       .size                   ( 4), 
                       .lsb_pos                ( 262), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      txn_eq_main = uvm_reg_field::type_id::create( "txn_eq_main" );
      txn_eq_main.configure( .parent                 ( this ), 
                       .size                   ( 24), 
                       .lsb_pos                ( 266), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      txn_eq_post = uvm_reg_field::type_id::create( "txn_eq_post" );
      txn_eq_post.configure( .parent                 ( this ), 
                       .size                   ( 24), 
                       .lsb_pos                ( 290), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      txn_eq_pre = uvm_reg_field::type_id::create( "txn_eq_pre" );
      txn_eq_pre.configure( .parent                 ( this ), 
                       .size                   ( 24), 
                       .lsb_pos                ( 314), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      txn_flyover_data_m = uvm_reg_field::type_id::create( "txn_flyover_data_m" );
      txn_flyover_data_m.configure( .parent                 ( this ), 
                       .size                   ( 4), 
                       .lsb_pos                ( 338), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      txn_flyover_data_p = uvm_reg_field::type_id::create( "txn_flyover_data_p" );
      txn_flyover_data_p.configure( .parent                 ( this ), 
                       .size                   ( 4), 
                       .lsb_pos                ( 342), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      txn_iboost_lvl = uvm_reg_field::type_id::create( "txn_iboost_lvl" );
      txn_iboost_lvl.configure( .parent                 ( this ), 
                       .size                   ( 16), 
                       .lsb_pos                ( 346), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      txn_invert = uvm_reg_field::type_id::create( "txn_invert" );
      txn_invert.configure( .parent                 ( this ), 
                       .size                   ( 4), 
                       .lsb_pos                ( 362), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      txn_master_mplla_state = uvm_reg_field::type_id::create( "txn_master_mplla_state" );
      txn_master_mplla_state.configure( .parent                 ( this ), 
                       .size                   ( 4), 
                       .lsb_pos                ( 366), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      txn_master_mpllb_state = uvm_reg_field::type_id::create( "txn_master_mpllb_state" );
      txn_master_mpllb_state.configure( .parent                 ( this ), 
                       .size                   ( 4), 
                       .lsb_pos                ( 370), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      txn_mpll_en = uvm_reg_field::type_id::create( "txn_mpll_en" );
      txn_mpll_en.configure( .parent                 ( this ), 
                       .size                   ( 4), 
                       .lsb_pos                ( 374), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      txn_req = uvm_reg_field::type_id::create( "txn_req" );
      txn_req.configure( .parent                 ( this ), 
                       .size                   ( 4), 
                       .lsb_pos                ( 378), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      txn_vboost_en = uvm_reg_field::type_id::create( "txn_vboost_en" );
      txn_vboost_en.configure( .parent                 ( this ), 
                       .size                   ( 4), 
                       .lsb_pos                ( 382), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      tx_vboost_lvl = uvm_reg_field::type_id::create( "tx_vboost_lvl" );
      tx_vboost_lvl.configure( .parent                 ( this ), 
                       .size                   ( 3), 
                       .lsb_pos                ( 386), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

      ana_pwr_en = uvm_reg_field::type_id::create( "ana_pwr_en" );
      ana_pwr_en.configure( .parent                 ( this ), 
                       .size                   ( 1), 
                       .lsb_pos                ( 389), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );   
   endfunction: build
endclass: ieee1500_gopphy_dft_gasket_4_laneconfig_testmode_reg

//------------------------------------------------------------------------------
// Class: ieee1500_gopphy_dft_gasket_4_alttap_en_reg gaowei need confirm, this tdr is defined by other people 
//------------------------------------------------------------------------------

class ieee1500_gopphy_dft_gasket_4_alttap_en_reg extends dft_reg;
   `uvm_object_utils( ieee1500_gopphy_dft_gasket_4_alttap_en_reg )

   rand uvm_reg_field gopphy_dft_gasket_4_alttap_en_sipc0;
   rand uvm_reg_field gopphy_dft_gasket_4_alttap_en_enable;
    
   function new( string name = "ieee1500_gopphy_dft_gasket_4_alttap_en_reg" );
      super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_4_ALTTAP_EN_LENGTH ), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      gopphy_dft_gasket_4_alttap_en_sipc0 = uvm_reg_field::type_id::create( "gopphy_dft_gasket_4_alttap_en_sipc0" ); 
      gopphy_dft_gasket_4_alttap_en_sipc0.configure( .parent                 ( this ), 
                                                     .size                   ( `GOPPHY_DFT_GASKET_4_ALTTAP_EN_SIPC0_WIDTH), 
                                                     .lsb_pos                ( 0), 
                                                     .access                 ( "RW" ), 
                                                     .volatile               ( 0    ),
                                                     .reset                  ( `GOPPHY_DFT_GASKET_4_ALTTAP_EN_SIPC0_RST_VALUE), 
                                                     .has_reset              ( 1    ), 
                                                     .is_rand                ( 1    ), 
                                                     .individually_accessible( 0   ) );
      
     gopphy_dft_gasket_4_alttap_en_enable = uvm_reg_field::type_id::create( "gopphy_dft_gasket_4_alttap_en_enable" ); 
     gopphy_dft_gasket_4_alttap_en_enable.configure( .parent                 ( this ), 
                                                     .size                   ( `GOPPHY_DFT_GASKET_4_ALTTAP_EN_ENABLE_WIDTH), 
                                                     .lsb_pos                ( `GOPPHY_DFT_GASKET_4_ALTTAP_EN_SIPC0_WIDTH), 
                                                     .access                 ( "RW" ), 
                                                     .volatile               ( 0    ),
                                                     .reset                  ( `GOPPHY_DFT_GASKET_4_ALTTAP_EN_ENABLE_RST_VALUE), 
                                                     .has_reset              ( 1    ), 
                                                     .is_rand                ( 1    ), 
                                                     .individually_accessible( 0   ) );
   endfunction: build
endclass: ieee1500_gopphy_dft_gasket_4_alttap_en_reg


//------------------------------------------------------------------------------
// Class: ieee1500_gopphy_dft_gasket_4_laneconfig_scanconfig_reg
//------------------------------------------------------------------------------
class ieee1500_gopphy_dft_gasket_4_laneconfig_scanconfig_reg extends dft_reg;
  `uvm_object_utils( ieee1500_gopphy_dft_gasket_4_laneconfig_scanconfig_reg )

  rand uvm_reg_field acscanmode;
  rand uvm_reg_field asyncresetoverride;
  rand uvm_reg_field clkdecodeoverride;
  rand uvm_reg_field dcscanmode;
  rand uvm_reg_field edtbypass;
  rand uvm_reg_field ioface;
  rand uvm_reg_field locmode;
  rand uvm_reg_field loesmode;
  rand uvm_reg_field rsvd0;
  rand uvm_reg_field rsvd4;
  rand uvm_reg_field rsvd5;
  rand uvm_reg_field rsvd6;
  rand uvm_reg_field scanwrpen;
  rand uvm_reg_field accapten_en;
  rand uvm_reg_field edt_low_power_shift_en;
  rand uvm_reg_field scanmode_wrp_clk;
  rand uvm_reg_field stoponskid_en;
  rand uvm_reg_field wrp_capt_en_override;

  function new( string name = "ieee1500_gopphy_dft_gasket_4_laneconfig_scanconfig_reg" );
    super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_4_LANECONFIG_SCANCONFIG_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

  virtual function void build(); // {{{ scanconfig_build
  dcscanmode = uvm_reg_field::type_id::create( "dcscanmode" );
  dcscanmode.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  acscanmode = uvm_reg_field::type_id::create( "acscanmode" );
  acscanmode.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 1    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  rsvd0 = uvm_reg_field::type_id::create( "rsvd0" );
  rsvd0.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 2    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  scanwrpen = uvm_reg_field::type_id::create( "scanwrpen" );
  scanwrpen.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 3    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  ioface = uvm_reg_field::type_id::create( "ioface" );
  ioface.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 4    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 1    ),//gaowei set to 1 accroding doc 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  edtbypass = uvm_reg_field::type_id::create( "edtbypass" );
  edtbypass.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 5    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 1    ),//gaowei set to 1 accroding doc  
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  stoponskid_en = uvm_reg_field::type_id::create( "stoponskid_en" );
  stoponskid_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 6    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  clkdecodeoverride = uvm_reg_field::type_id::create( "clkdecodeoverride" );
  clkdecodeoverride.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 7    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 1    ),//gaowei set to 1 accroding doc 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  locmode = uvm_reg_field::type_id::create( "locmode" );
  locmode.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 8    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  loesmode = uvm_reg_field::type_id::create( "loesmode" );
  loesmode.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 9    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  accapten_en = uvm_reg_field::type_id::create( "accapten_en" );
  accapten_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 10    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  scanmode_wrp_clk = uvm_reg_field::type_id::create( "scanmode_wrp_clk" );
  scanmode_wrp_clk.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 11    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  edt_low_power_shift_en = uvm_reg_field::type_id::create( "edt_low_power_shift_en" );
  edt_low_power_shift_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 12    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  wrp_capt_en_override = uvm_reg_field::type_id::create( "wrp_capt_en_override" );
  wrp_capt_en_override.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 13    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  rsvd4 = uvm_reg_field::type_id::create( "rsvd4" );
  rsvd4.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 14    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  rsvd5 = uvm_reg_field::type_id::create( "rsvd5" );
  rsvd5.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 15    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  rsvd6 = uvm_reg_field::type_id::create( "rsvd6" );
  rsvd6.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 16    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  asyncresetoverride = uvm_reg_field::type_id::create( "asyncresetoverride" );
  asyncresetoverride.configure( .parent        ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 17    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  endfunction: build // }}} scanconfig_build
endclass: ieee1500_gopphy_dft_gasket_4_laneconfig_scanconfig_reg

//------------------------------------------------------------------------------
// Class: ieee1500_gopphy_dft_gasket_4_laneconfig_bsr_debug_reg
//------------------------------------------------------------------------------
class ieee1500_gopphy_dft_gasket_4_laneconfig_bsr_debug_reg extends dft_reg;
  `uvm_object_utils( ieee1500_gopphy_dft_gasket_4_laneconfig_bsr_debug_reg )

  //rand uvm_reg_field gopphy_dft_gasket_4_laneconfig_bsr_debug;
  rand uvm_reg_field bs_tx_lowswing;
  rand uvm_reg_field bs_rx_lowswing;
  rand uvm_reg_field bs_rx_level;
  rand uvm_reg_field reserved;

  function new( string name = "ieee1500_gopphy_dft_gasket_4_laneconfig_bsr_debug_reg" );
    super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_4_LANECONFIG_BSR_DEBUG_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

  virtual function void build(); // {{{ bsr_debug_build
  bs_tx_lowswing = uvm_reg_field::type_id::create( "bs_tx_lowswing" );
  bs_tx_lowswing.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  bs_rx_lowswing = uvm_reg_field::type_id::create( "bs_rx_lowswing" );
  bs_rx_lowswing.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 1    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  bs_rx_level = uvm_reg_field::type_id::create( "bs_rx_level" );
  bs_rx_level.configure( .parent                 ( this ), 
                       .size                   ( 5    ), 
                       .lsb_pos                ( 2    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  reserved = uvm_reg_field::type_id::create( "reserved" );
  reserved.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 7    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  endfunction: build // }}} bsr_debug_build
endclass: ieee1500_gopphy_dft_gasket_4_laneconfig_bsr_debug_reg

//------------------------------------------------------------------------------
// Class: ieee1500_gopphy_dft_gasket_4_laneconfig_loopback_reg
//------------------------------------------------------------------------------
class ieee1500_gopphy_dft_gasket_4_laneconfig_loopback_reg extends dft_reg;
  `uvm_object_utils( ieee1500_gopphy_dft_gasket_4_laneconfig_loopback_reg )

  //rand uvm_reg_field gopphy_dft_gasket_4_laneconfig_loopback;
  rand uvm_reg_field rx3_data_en;
  rand uvm_reg_field tx3_data_en;
  rand uvm_reg_field rx2_data_en;
  rand uvm_reg_field tx2_data_en;
  rand uvm_reg_field rx1_data_en;
  rand uvm_reg_field tx1_data_en;
  rand uvm_reg_field rx0_data_en;
  rand uvm_reg_field tx0_data_en;
  rand uvm_reg_field lane3_tx2rx_ser_lb_en;
  rand uvm_reg_field lane3_rx2tx_par_lb_en;
  rand uvm_reg_field lane2_tx2rx_ser_lb_en;
  rand uvm_reg_field lane2_rx2tx_par_lb_en;
  rand uvm_reg_field lane1_tx2rx_ser_lb_en;
  rand uvm_reg_field lane1_rx2tx_par_lb_en;
  rand uvm_reg_field lane0_tx2rx_ser_lb_en;
  rand uvm_reg_field lane0_rx2tx_par_lb_en;
  rand uvm_reg_field loopback_tdr_select;
  rand uvm_reg_field rx0_vco_ld_val;
  rand uvm_reg_field rx0_los_threshold;
  rand uvm_reg_field rx0_adapt_req;
  rand uvm_reg_field rx0_adapt_cont;
  rand uvm_reg_field rx0_offcan_cont;
  rand uvm_reg_field rx0_ref_ld_val;
  rand uvm_reg_field rx0_cdr_vco_lowfreq;
  rand uvm_reg_field rx1_vco_ld_val;
  rand uvm_reg_field rx1_los_threshold;
  rand uvm_reg_field rx1_adapt_req;
  rand uvm_reg_field rx1_adapt_cont;
  rand uvm_reg_field rx1_offcan_cont;
  rand uvm_reg_field rx1_ref_ld_val;
  rand uvm_reg_field rx1_cdr_vco_lowfreq;
  rand uvm_reg_field rx2_vco_ld_val;
  rand uvm_reg_field rx2_los_threshold;
  rand uvm_reg_field rx2_adapt_req;
  rand uvm_reg_field rx2_adapt_cont;
  rand uvm_reg_field rx2_offcan_cont;
  rand uvm_reg_field rx2_ref_ld_val;
  rand uvm_reg_field rx2_cdr_vco_lowfreq;
  rand uvm_reg_field rx3_vco_ld_val;
  rand uvm_reg_field rx3_los_threshold;
  rand uvm_reg_field rx3_adapt_req;
  rand uvm_reg_field rx3_adapt_cont;
  rand uvm_reg_field rx3_offcan_cont;
  rand uvm_reg_field rx3_ref_ld_val;
  rand uvm_reg_field rx3_cdr_vco_lowfreq;


  function new( string name = "ieee1500_gopphy_dft_gasket_4_laneconfig_loopback_reg" );
    super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_4_LANECONFIG_LOOPBACK_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

  virtual function void build(); // {{{ loopback_build
  rx3_data_en = uvm_reg_field::type_id::create( "rx3_data_en" );
  rx3_data_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  tx3_data_en = uvm_reg_field::type_id::create( "tx3_data_en" );
  tx3_data_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 1    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx2_data_en = uvm_reg_field::type_id::create( "rx2_data_en" );
  rx2_data_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 2    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  tx2_data_en = uvm_reg_field::type_id::create( "tx2_data_en" );
  tx2_data_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 3    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx1_data_en = uvm_reg_field::type_id::create( "rx1_data_en" );
  rx1_data_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 4    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  tx1_data_en = uvm_reg_field::type_id::create( "tx1_data_en" );
  tx1_data_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 5    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  rx0_data_en = uvm_reg_field::type_id::create( "rx0_data_en" );
  rx0_data_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 6    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  tx0_data_en = uvm_reg_field::type_id::create( "tx0_data_en" );
  tx0_data_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 7    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  lane3_tx2rx_ser_lb_en = uvm_reg_field::type_id::create( "lane3_tx2rx_ser_lb_en" );
  lane3_tx2rx_ser_lb_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 8    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  lane3_rx2tx_par_lb_en = uvm_reg_field::type_id::create( "lane3_rx2tx_par_lb_en" );
  lane3_rx2tx_par_lb_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 9    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  lane2_tx2rx_ser_lb_en = uvm_reg_field::type_id::create( "lane2_tx2rx_ser_lb_en" );
  lane2_tx2rx_ser_lb_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 10    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  lane2_rx2tx_par_lb_en = uvm_reg_field::type_id::create( "lane2_rx2tx_par_lb_en" );
  lane2_rx2tx_par_lb_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 11    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  lane1_tx2rx_ser_lb_en = uvm_reg_field::type_id::create( "lane1_tx2rx_ser_lb_en" );
  lane1_tx2rx_ser_lb_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 12    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  lane1_rx2tx_par_lb_en = uvm_reg_field::type_id::create( "lane1_rx2tx_par_lb_en" );
  lane1_rx2tx_par_lb_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 13    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  lane0_tx2rx_ser_lb_en = uvm_reg_field::type_id::create( "lane0_tx2rx_ser_lb_en" );
  lane0_tx2rx_ser_lb_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 14    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  lane0_rx2tx_par_lb_en = uvm_reg_field::type_id::create( "lane0_rx2tx_par_lb_en" );
  lane0_rx2tx_par_lb_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 15    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  loopback_tdr_select = uvm_reg_field::type_id::create( "loopback_tdr_select" );
  loopback_tdr_select.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 16    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx0_vco_ld_val = uvm_reg_field::type_id::create( "rx0_vco_ld_val" );
  rx0_vco_ld_val.configure( .parent                 ( this ), 
                       .size                   ( 13    ), 
                       .lsb_pos                ( 17    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx0_los_threshold = uvm_reg_field::type_id::create( "rx0_los_threshold" );
  rx0_los_threshold.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 30    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx0_adapt_req = uvm_reg_field::type_id::create( "rx0_adapt_req" );
  rx0_adapt_req.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 33    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx0_adapt_cont = uvm_reg_field::type_id::create( "rx0_adapt_cont" );
  rx0_adapt_cont.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 34    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  rx0_offcan_cont = uvm_reg_field::type_id::create( "rx0_offcan_cont" );
  rx0_offcan_cont.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 35    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx0_ref_ld_val = uvm_reg_field::type_id::create( "rx0_ref_ld_val" );
  rx0_ref_ld_val.configure( .parent                 ( this ), 
                       .size                   ( 6   ), 
                       .lsb_pos                ( 36    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx0_cdr_vco_lowfreq = uvm_reg_field::type_id::create( "rx0_cdr_vco_lowfreq" );
  rx0_cdr_vco_lowfreq.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 42    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx1_vco_ld_val = uvm_reg_field::type_id::create( "rx1_vco_ld_val" );
  rx1_vco_ld_val.configure( .parent                 ( this ), 
                       .size                   ( 13    ), 
                       .lsb_pos                ( 43    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx1_los_threshold = uvm_reg_field::type_id::create( "rx1_los_threshold" );
  rx1_los_threshold.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 56    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx1_adapt_req = uvm_reg_field::type_id::create( "rx1_adapt_req" );
  rx1_adapt_req.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 59    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx1_adapt_cont = uvm_reg_field::type_id::create( "rx1_adapt_cont" );
  rx1_adapt_cont.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 60    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  rx1_offcan_cont = uvm_reg_field::type_id::create( "rx1_offcan_cont" );
  rx1_offcan_cont.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 61    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx1_ref_ld_val = uvm_reg_field::type_id::create( "rx1_ref_ld_val" );
  rx1_ref_ld_val.configure( .parent                 ( this ), 
                       .size                   ( 6    ), 
                       .lsb_pos                ( 62    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx1_cdr_vco_lowfreq = uvm_reg_field::type_id::create( "rx1_cdr_vco_lowfreq" );
  rx1_cdr_vco_lowfreq.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 68    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  rx2_vco_ld_val = uvm_reg_field::type_id::create( "rx2_vco_ld_val" );
  rx2_vco_ld_val.configure( .parent                 ( this ), 
                       .size                   ( 13    ), 
                       .lsb_pos                ( 69    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx2_los_threshold = uvm_reg_field::type_id::create( "rx2_los_threshold" );
  rx2_los_threshold.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 82    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx2_adapt_req = uvm_reg_field::type_id::create( "rx2_adapt_req" );
  rx2_adapt_req.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 85    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx2_adapt_cont = uvm_reg_field::type_id::create( "rx2_adapt_cont" );
  rx2_adapt_cont.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 86    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  rx2_offcan_cont = uvm_reg_field::type_id::create( "rx2_offcan_cont" );
  rx2_offcan_cont.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 87    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx2_ref_ld_val = uvm_reg_field::type_id::create( "rx2_ref_ld_val" );
  rx2_ref_ld_val.configure( .parent                 ( this ), 
                       .size                   ( 6    ), 
                       .lsb_pos                ( 88    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx2_cdr_vco_lowfreq = uvm_reg_field::type_id::create( "rx2_cdr_vco_lowfreq" );
  rx2_cdr_vco_lowfreq.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 94    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  rx3_vco_ld_val = uvm_reg_field::type_id::create( "rx3_vco_ld_val" );
  rx3_vco_ld_val.configure( .parent                 ( this ), 
                       .size                   ( 13    ), 
                       .lsb_pos                ( 95    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx3_los_threshold = uvm_reg_field::type_id::create( "rx3_los_threshold" );
  rx3_los_threshold.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 108    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx3_adapt_req = uvm_reg_field::type_id::create( "rx3_adapt_req" );
  rx3_adapt_req.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 111    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx3_adapt_cont = uvm_reg_field::type_id::create( "rx3_adapt_cont" );
  rx3_adapt_cont.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 112    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  rx3_offcan_cont = uvm_reg_field::type_id::create( "rx3_offcan_cont" );
  rx3_offcan_cont.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 113    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx3_ref_ld_val = uvm_reg_field::type_id::create( "rx3_ref_ld_val" );
  rx3_ref_ld_val.configure( .parent                 ( this ), 
                       .size                   ( 6    ), 
                       .lsb_pos                ( 114    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx3_cdr_vco_lowfreq = uvm_reg_field::type_id::create( "rx3_cdr_vco_lowfreq" );
  rx3_cdr_vco_lowfreq.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 120    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );


  endfunction: build // }}} loopback_build
endclass: ieee1500_gopphy_dft_gasket_4_laneconfig_loopback_reg

//------------------------------------------------------------------------------
// Class: ieee1500_gopphy_dft_gasket_4_laneconfig_loopback_tx_reg LOOPBACK_TX
//------------------------------------------------------------------------------
class ieee1500_gopphy_dft_gasket_4_laneconfig_loopback_tx_reg extends dft_reg;
  `uvm_object_utils( ieee1500_gopphy_dft_gasket_4_laneconfig_loopback_tx_reg )

  //rand uvm_reg_field gopphy_dft_gasket_4_laneconfig_loopback_tx;
  rand uvm_reg_field tx3_width;
  rand uvm_reg_field tx2_width;
  rand uvm_reg_field tx1_width;
  rand uvm_reg_field tx0_width;
  rand uvm_reg_field tx3_rate;
  rand uvm_reg_field tx2_rate;
  rand uvm_reg_field tx1_rate;
  rand uvm_reg_field tx0_rate;
  rand uvm_reg_field tx3_pstate;
  rand uvm_reg_field tx2_pstate;
  rand uvm_reg_field tx1_pstate;
  rand uvm_reg_field tx0_pstate;
  rand uvm_reg_field tx3_lpd;
  rand uvm_reg_field tx2_lpd;
  rand uvm_reg_field tx1_lpd;
  rand uvm_reg_field tx0_lpd;
  rand uvm_reg_field tx3_reset;
  rand uvm_reg_field tx2_reset;
  rand uvm_reg_field tx1_reset;
  rand uvm_reg_field tx0_reset;
  rand uvm_reg_field tx3_mpllb_sel;
  rand uvm_reg_field tx2_mpllb_sel;
  rand uvm_reg_field tx1_mpllb_sel;
  rand uvm_reg_field tx0_mpllb_sel;
  rand uvm_reg_field loopback_tx_tdr_select;

  function new( string name = "ieee1500_gopphy_dft_gasket_4_laneconfig_loopback_tx_reg" );
    super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_4_LANECONFIG_LOOPBACK_TX_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

  virtual function void build(); // {{{ loopback_tx_build
  tx3_width = uvm_reg_field::type_id::create( "tx3_width" );
  tx3_width.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
   
  tx2_width = uvm_reg_field::type_id::create( "tx2_width" );
  tx2_width.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 2    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  tx1_width = uvm_reg_field::type_id::create( "tx1_width" );
  tx1_width.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 4    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  tx0_width = uvm_reg_field::type_id::create( "tx0_width" );
  tx0_width.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 6    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  tx3_rate = uvm_reg_field::type_id::create( "tx3_rate" );
  tx3_rate.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 8    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  tx2_rate = uvm_reg_field::type_id::create( "tx2_rate" );
  tx2_rate.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 11    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  tx1_rate = uvm_reg_field::type_id::create( "tx1_rate" );
  tx1_rate.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 14    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  tx0_rate = uvm_reg_field::type_id::create( "tx0_rate" );
  tx0_rate.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 17    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  tx3_pstate = uvm_reg_field::type_id::create( "tx3_pstate" );
  tx3_pstate.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 20    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  tx2_pstate = uvm_reg_field::type_id::create( "tx2_pstate" );
  tx2_pstate.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 22    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  tx1_pstate = uvm_reg_field::type_id::create( "tx1_pstate" );
  tx1_pstate.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 24    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  tx0_pstate = uvm_reg_field::type_id::create( "tx0_pstate" );
  tx0_pstate.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 26    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  tx3_lpd = uvm_reg_field::type_id::create( "tx3_lpd" );
  tx3_lpd.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 28    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  tx2_lpd = uvm_reg_field::type_id::create( "tx2_lpd" );
  tx2_lpd.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 29    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  tx1_lpd = uvm_reg_field::type_id::create( "tx1_lpd" );
  tx1_lpd.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 30    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  tx0_lpd = uvm_reg_field::type_id::create( "tx0_lpd" );
  tx0_lpd.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 31    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  tx3_reset = uvm_reg_field::type_id::create( "tx3_reset" );
  tx3_reset.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 32    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  tx2_reset = uvm_reg_field::type_id::create( "tx2_reset" );
  tx2_reset.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 33    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  tx1_reset = uvm_reg_field::type_id::create( "tx1_reset" );
  tx1_reset.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 34    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  tx0_reset = uvm_reg_field::type_id::create( "tx0_reset" );
  tx0_reset.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 35    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  tx3_mpllb_sel = uvm_reg_field::type_id::create( "tx3_mpllb_sel" );
  tx3_mpllb_sel.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 36    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  tx2_mpllb_sel = uvm_reg_field::type_id::create( "tx2_mpllb_sel" );
  tx2_mpllb_sel.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 37    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  tx1_mpllb_sel = uvm_reg_field::type_id::create( "tx1_mpllb_sel" );
  tx1_mpllb_sel.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 38    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  tx0_mpllb_sel = uvm_reg_field::type_id::create( "tx0_mpllb_sel" );
  tx0_mpllb_sel.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 39    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  loopback_tx_tdr_select = uvm_reg_field::type_id::create( "loopback_tx_tdr_select" );
  loopback_tx_tdr_select.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 40    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
   
  endfunction: build // }}} loopback_tx_build
endclass: ieee1500_gopphy_dft_gasket_4_laneconfig_loopback_tx_reg

//------------------------------------------------------------------------------
// Class: ieee1500_gopphy_dft_gasket_4_laneconfig_loopback_rx_reg LOOPBACK_RX
//------------------------------------------------------------------------------
class ieee1500_gopphy_dft_gasket_4_laneconfig_loopback_rx_reg extends dft_reg;
  `uvm_object_utils( ieee1500_gopphy_dft_gasket_4_laneconfig_loopback_rx_reg )

  //rand uvm_reg_field gopphy_dft_gasket_4_laneconfig_loopback_rx;
  rand uvm_reg_field rx3_width;
  rand uvm_reg_field rx2_width;
  rand uvm_reg_field rx1_width;
  rand uvm_reg_field rx0_width;
  rand uvm_reg_field rx3_rate;
  rand uvm_reg_field rx2_rate;
  rand uvm_reg_field rx1_rate;
  rand uvm_reg_field rx0_rate;
  rand uvm_reg_field rx3_pstate;
  rand uvm_reg_field rx2_pstate;
  rand uvm_reg_field rx1_pstate;
  rand uvm_reg_field rx0_pstate;
  rand uvm_reg_field rx3_lpd;
  rand uvm_reg_field rx2_lpd;
  rand uvm_reg_field rx1_lpd;
  rand uvm_reg_field rx0_lpd;
  rand uvm_reg_field rx3_reset;
  rand uvm_reg_field rx2_reset;
  rand uvm_reg_field rx1_reset;
  rand uvm_reg_field rx0_reset;
  rand uvm_reg_field loopback_rx_tdr_select;
  

  function new( string name = "ieee1500_gopphy_dft_gasket_4_laneconfig_loopback_rx_reg" );
    super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_4_LANECONFIG_LOOPBACK_RX_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

  virtual function void build(); // {{{ loopback_rx_build
  rx3_width = uvm_reg_field::type_id::create( "rx3_width" );
  rx3_width.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx2_width = uvm_reg_field::type_id::create( "rx2_width" );
  rx2_width.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 2    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx1_width = uvm_reg_field::type_id::create( "rx1_width" );
  rx1_width.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 4    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx0_width = uvm_reg_field::type_id::create( "rx0_width" );
  rx0_width.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 6    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx3_rate = uvm_reg_field::type_id::create( "rx3_rate" );
  rx3_rate.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 8    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx2_rate = uvm_reg_field::type_id::create( "rx2_rate" );
  rx2_rate.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 10    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx1_rate = uvm_reg_field::type_id::create( "rx1_rate" );
  rx1_rate.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 12    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx0_rate = uvm_reg_field::type_id::create( "rx0_rate" );
  rx0_rate.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 14    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx3_pstate = uvm_reg_field::type_id::create( "rx3_pstate" );
  rx3_pstate.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 16    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx2_pstate = uvm_reg_field::type_id::create( "rx2_pstate" );
  rx2_pstate.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 18    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx1_pstate = uvm_reg_field::type_id::create( "rx1_pstate" );
  rx1_pstate.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 20    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx0_pstate = uvm_reg_field::type_id::create( "rx0_pstate" );
  rx0_pstate.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 22    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx3_lpd = uvm_reg_field::type_id::create( "rx3_lpd" );
  rx3_lpd.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 24    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx2_lpd = uvm_reg_field::type_id::create( "rx2_lpd" );
  rx2_lpd.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 25    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx1_lpd = uvm_reg_field::type_id::create( "rx1_lpd" );
  rx1_lpd.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 26    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx0_lpd = uvm_reg_field::type_id::create( "rx0_lpd" );
  rx0_lpd.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 27    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  rx3_reset = uvm_reg_field::type_id::create( "rx3_reset" );
  rx3_reset.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 28    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );


  rx2_reset = uvm_reg_field::type_id::create( "rx2_reset" );
  rx2_reset.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 29    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  rx1_reset = uvm_reg_field::type_id::create( "rx1_reset" );
  rx1_reset.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 30    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  rx0_reset = uvm_reg_field::type_id::create( "rx0_reset" );
  rx0_reset.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 31    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  loopback_rx_tdr_select = uvm_reg_field::type_id::create( "loopback_rx_tdr_select" );
  loopback_rx_tdr_select.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 32    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );


  endfunction: build // }}} loopback_rx_build
endclass: ieee1500_gopphy_dft_gasket_4_laneconfig_loopback_rx_reg


//------------------------------------------------------------------------------
// Class: ieee1500_gopphy_dft_gasket_4_laneconfig_ws_bypass_reg 
//------------------------------------------------------------------------------
class ieee1500_gopphy_dft_gasket_4_laneconfig_ws_bypass_reg extends dft_reg;
  `uvm_object_utils( ieee1500_gopphy_dft_gasket_4_laneconfig_ws_bypass_reg )

  rand uvm_reg_field ws_bypass;

  function new( string name = "ieee1500_gopphy_dft_gasket_4_laneconfig_ws_bypass_reg" );
    super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_4_LANECONFIG_WS_BYPASS_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

  virtual function void build(); // {{{ ws_bypass_build
  ws_bypass = uvm_reg_field::type_id::create( "ws_bypass" );
  ws_bypass.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  endfunction: build // }}} ws_bypass_build
endclass: ieee1500_gopphy_dft_gasket_4_laneconfig_ws_bypass_reg

//------------------------------------------------------------------------------
// Class: ieee1500_gopphy_dft_gasket_4_laneconfig_ros_cntl_counter_reg ROS_CNTL_COUNTER
//------------------------------------------------------------------------------
class ieee1500_gopphy_dft_gasket_4_laneconfig_ros_cntl_counter_reg extends dft_reg;
  `uvm_object_utils( ieee1500_gopphy_dft_gasket_4_laneconfig_ros_cntl_counter_reg )

  rand uvm_reg_field ros_cntl_counter;

  function new( string name = "ieee1500_gopphy_dft_gasket_4_laneconfig_ros_cntl_counter_reg" );
    super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_4_LANECONFIG_ROS_CNTL_COUNTER_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

  virtual function void build(); // {{{ ros_cntl_counter_build
  ros_cntl_counter = uvm_reg_field::type_id::create( "ros_cntl_counter" );
  ros_cntl_counter.configure( .parent                 ( this ), 
                       .size                   ( 8    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 4    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  endfunction: build // }}} ros_cntl_counter_build
endclass: ieee1500_gopphy_dft_gasket_4_laneconfig_ros_cntl_counter_reg

//------------------------------------------------------------------------------
// Class: ieee1500_gopphy_dft_gasket_4_laneconfig_ros_cntl_rosen_reg 
//------------------------------------------------------------------------------
class ieee1500_gopphy_dft_gasket_4_laneconfig_ros_cntl_rosen_reg extends dft_reg;
  `uvm_object_utils( ieee1500_gopphy_dft_gasket_4_laneconfig_ros_cntl_rosen_reg )

  rand uvm_reg_field ros_cntl_rosen;

  function new( string name = "ieee1500_gopphy_dft_gasket_4_laneconfig_ros_cntl_rosen_reg" );
    super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_4_LANECONFIG_ROS_CNTL_ROSEN_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

  virtual function void build(); // {{{ ros_cntl_rosen_build
  ros_cntl_rosen = uvm_reg_field::type_id::create( "ros_cntl_rosen" );
  ros_cntl_rosen.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  endfunction: build // }}} ros_cntl_rosen_build
endclass: ieee1500_gopphy_dft_gasket_4_laneconfig_ros_cntl_rosen_reg

//------------------------------------------------------------------------------
// Class: ieee1500_gopphy_dft_gasket_4_laneconfig_ros_setup_reg 
//------------------------------------------------------------------------------
class ieee1500_gopphy_dft_gasket_4_laneconfig_ros_setup_reg extends dft_reg;
  `uvm_object_utils( ieee1500_gopphy_dft_gasket_4_laneconfig_ros_setup_reg )

  rand uvm_reg_field cfg_bits;
  rand uvm_reg_field ros_size;
  rand uvm_reg_field counter_reset;
  rand uvm_reg_field enable_all;
  rand uvm_reg_field ros_clk_sel;

  function new( string name = "ieee1500_gopphy_dft_gasket_4_laneconfig_ros_setup_reg" );
    super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_4_LANECONFIG_ROS_SETUP_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

  virtual function void build(); // {{{ ros_setup_build
  cfg_bits = uvm_reg_field::type_id::create( "cfg_bits" );
  cfg_bits.configure( .parent                 ( this ), 
                       .size                   ( 4    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
   
  ros_size = uvm_reg_field::type_id::create( "ros_size" );
  ros_size.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 4    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  counter_reset = uvm_reg_field::type_id::create( "counter_reset" );
  counter_reset.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 6    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 1    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  enable_all = uvm_reg_field::type_id::create( "enable_all" );
  enable_all.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 7    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  ros_clk_sel = uvm_reg_field::type_id::create( "ros_clk_sel" );
  ros_clk_sel.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 8    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 1    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  endfunction: build // }}} ros_setup_build
endclass: ieee1500_gopphy_dft_gasket_4_laneconfig_ros_setup_reg

//------------------------------------------------------------------------------
// Class: ieee1500_gopphy_dft_gasket_4_laneconfig_ros_status_reg ROS_CNTL_COUNTER
//------------------------------------------------------------------------------
class ieee1500_gopphy_dft_gasket_4_laneconfig_ros_status_reg extends dft_reg;
  `uvm_object_utils( ieee1500_gopphy_dft_gasket_4_laneconfig_ros_status_reg )

  rand uvm_reg_field overflow;
  rand uvm_reg_field counter_bits;

  function new( string name = "ieee1500_gopphy_dft_gasket_4_laneconfig_ros_status_reg" );
    super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_4_LANECONFIG_ROS_STATUS_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

  virtual function void build(); // {{{ ros_status_build
  overflow = uvm_reg_field::type_id::create( "overflow" );
  overflow.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
   
  counter_bits = uvm_reg_field::type_id::create( "counter_bits" );
  counter_bits.configure( .parent                 ( this ), 
                       .size                   ( 29    ), 
                       .lsb_pos                ( 1    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );   
  endfunction: build // }}} ros_status_build
endclass: ieee1500_gopphy_dft_gasket_4_laneconfig_ros_status_reg

//------------------------------------------------------------------------------
// Class: ieee1500_gopphy_dft_gasket_4_laneconfig_mpll_control_reg MPLL_CONTROL
//------------------------------------------------------------------------------
class ieee1500_gopphy_dft_gasket_4_laneconfig_mpll_control_reg extends dft_reg;
  `uvm_object_utils( ieee1500_gopphy_dft_gasket_4_laneconfig_mpll_control_reg )

  //rand uvm_reg_field gopphy_dft_gasket_4_laneconfig_mpll_control;
  rand uvm_reg_field mplla_multiplier;
  rand uvm_reg_field mplla_bandwidth;
  rand uvm_reg_field mplla_div8_clk_en;
  rand uvm_reg_field mplla_div10_clk_en;
  rand uvm_reg_field mplla_div16p5_clk_en;
  rand uvm_reg_field mplla_init_cal_disable;
  rand uvm_reg_field mplla_div_clk_en;
  rand uvm_reg_field mplla_div_multiplier;
  rand uvm_reg_field mplla_force_en;
  rand uvm_reg_field mplla_fracn_ctrl;
  rand uvm_reg_field mplla_ssc_clk_sel;
  rand uvm_reg_field mplla_ssc_en;
  rand uvm_reg_field mplla_ssc_range;
  rand uvm_reg_field mpllb_multiplier;
  rand uvm_reg_field mpllb_bandwidth;
  rand uvm_reg_field mpllb_div8_clk_en;
  rand uvm_reg_field mpllb_div10_clk_en;
  rand uvm_reg_field mpllb_div16p5_clk_en;
  rand uvm_reg_field mpllb_init_cal_disable;
  rand uvm_reg_field mpllb_div_clk_en;
  rand uvm_reg_field mpllb_div_multiplier;
  rand uvm_reg_field mpllb_force_en;
  rand uvm_reg_field mpllb_fracn_ctrl;
  rand uvm_reg_field mpllb_ssc_clk_sel;
  rand uvm_reg_field mpllb_ssc_en;
  rand uvm_reg_field mpllb_ssc_range;
  rand uvm_reg_field mpll_tdr_select;


  function new( string name = "ieee1500_gopphy_dft_gasket_4_laneconfig_mpll_control_reg" );
    super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_4_LANECONFIG_MPLL_CONTROL_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

  virtual function void build(); // {{{ mpll_control_build
  mplla_multiplier = uvm_reg_field::type_id::create( "mplla_multiplier" );
  mplla_multiplier.configure( .parent                 ( this ), 
                       .size                   ( 8    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  mplla_bandwidth = uvm_reg_field::type_id::create( "mplla_bandwidth" );
  mplla_bandwidth.configure( .parent                 ( this ), 
                       .size                   ( 11    ), 
                       .lsb_pos                ( 8    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  mplla_div8_clk_en= uvm_reg_field::type_id::create( "mplla_div8_clk_en" );
  mplla_div8_clk_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 19    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  mplla_div10_clk_en= uvm_reg_field::type_id::create( "mplla_div10_clk_en" );
  mplla_div10_clk_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 20    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  mplla_div16p5_clk_en = uvm_reg_field::type_id::create( "mplla_div16p5_clk_en" );
  mplla_div16p5_clk_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 21    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  mplla_init_cal_disable = uvm_reg_field::type_id::create( "mplla_init_cal_disable" );
  mplla_init_cal_disable.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 22    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  mplla_div_clk_en = uvm_reg_field::type_id::create( "mplla_div_clk_en" );
  mplla_div_clk_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 23    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  mplla_div_multiplier = uvm_reg_field::type_id::create( "mplla_div_multiplier" );
  mplla_div_multiplier.configure( .parent                 ( this ), 
                       .size                   ( 7    ), 
                       .lsb_pos                ( 24    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  mplla_force_en = uvm_reg_field::type_id::create( "mplla_force_en" );
  mplla_force_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 31    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  mplla_fracn_ctrl = uvm_reg_field::type_id::create( "mplla_fracn_ctrl" );
  mplla_fracn_ctrl.configure( .parent                 ( this ), 
                       .size                   ( 9    ), 
                       .lsb_pos                ( 32    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  mplla_ssc_clk_sel = uvm_reg_field::type_id::create( "mplla_ssc_clk_sel" );
  mplla_ssc_clk_sel.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 41    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  mplla_ssc_en = uvm_reg_field::type_id::create( "mplla_ssc_en" );
  mplla_ssc_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 44    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  mplla_ssc_range = uvm_reg_field::type_id::create( "mplla_ssc_range" );
  mplla_ssc_range.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 45    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );




  mpllb_multiplier = uvm_reg_field::type_id::create( "mpllb_multiplier" );
  mpllb_multiplier.configure( .parent                 ( this ), 
                       .size                   ( 8    ), 
                       .lsb_pos                ( 48    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  mpllb_bandwidth = uvm_reg_field::type_id::create( "mpllb_bandwidth" );
  mpllb_bandwidth.configure( .parent                 ( this ), 
                       .size                   ( 11    ), 
                       .lsb_pos                ( 56    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  mpllb_div8_clk_en= uvm_reg_field::type_id::create( "mpllb_div8_clk_en" );
  mpllb_div8_clk_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 67    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  mpllb_div10_clk_en= uvm_reg_field::type_id::create( "mpllb_div10_clk_en" );
  mpllb_div10_clk_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 68    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  mpllb_div16p5_clk_en = uvm_reg_field::type_id::create( "mpllb_div16p5_clk_en" );
  mpllb_div16p5_clk_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 69    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  mpllb_init_cal_disable = uvm_reg_field::type_id::create( "mpllb_init_cal_disable" );
  mpllb_init_cal_disable.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 70    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  mpllb_div_clk_en = uvm_reg_field::type_id::create( "mpllb_div_clk_en" );
  mpllb_div_clk_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 71    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  mpllb_div_multiplier = uvm_reg_field::type_id::create( "mpllb_div_multiplier" );
  mpllb_div_multiplier.configure( .parent                 ( this ), 
                       .size                   ( 7    ), 
                       .lsb_pos                ( 72    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  mpllb_force_en = uvm_reg_field::type_id::create( "mpllb_force_en" );
  mpllb_force_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 79    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  mpllb_fracn_ctrl = uvm_reg_field::type_id::create( "mpllb_fracn_ctrl" );
  mpllb_fracn_ctrl.configure( .parent                 ( this ), 
                       .size                   ( 9    ), 
                       .lsb_pos                ( 80    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  mpllb_ssc_clk_sel = uvm_reg_field::type_id::create( "mpllb_ssc_clk_sel" );
  mpllb_ssc_clk_sel.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 89    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  mpllb_ssc_en = uvm_reg_field::type_id::create( "mpllb_ssc_en" );
  mpllb_ssc_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 92    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  mpllb_ssc_range = uvm_reg_field::type_id::create( "mpllb_ssc_range" );
  mpllb_ssc_range.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 93    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );


  mpll_tdr_select = uvm_reg_field::type_id::create( "mpll_tdr_select" );
  mpll_tdr_select.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 96    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  endfunction: build // }}} mpll_control_build
endclass: ieee1500_gopphy_dft_gasket_4_laneconfig_mpll_control_reg

//------------------------------------------------------------------------------
// Class: ieee1500_gopphy_dft_gasket_4_laneconfig_status_reg STATUS
//------------------------------------------------------------------------------
class ieee1500_gopphy_dft_gasket_4_laneconfig_status_reg extends dft_reg;
  `uvm_object_utils( ieee1500_gopphy_dft_gasket_4_laneconfig_status_reg )

  rand uvm_reg_field mplla_state;
  rand uvm_reg_field mpllb_state;
  rand uvm_reg_field tx0_ack;
  rand uvm_reg_field tx0_detrx_result;
  rand uvm_reg_field rx0_valid;
  rand uvm_reg_field rx0_los;
  rand uvm_reg_field rx0_ack;
  rand uvm_reg_field rx0_adapt_ack;
  rand uvm_reg_field tx1_ack;
  rand uvm_reg_field tx1_detrx_result;
  rand uvm_reg_field rx1_valid;
  rand uvm_reg_field rx1_los;
  rand uvm_reg_field rx1_ack;
  rand uvm_reg_field rx1_adapt_ack;
  rand uvm_reg_field tx2_ack;
  rand uvm_reg_field tx2_detrx_result;
  rand uvm_reg_field rx2_valid;
  rand uvm_reg_field rx2_los;
  rand uvm_reg_field rx2_ack;
  rand uvm_reg_field rx2_adapt_ack;
  rand uvm_reg_field tx3_ack;
  rand uvm_reg_field tx3_detrx_result;
  rand uvm_reg_field rx3_valid;
  rand uvm_reg_field rx3_los;
  rand uvm_reg_field rx3_ack;
  //rand uvm_reg_field rx3_adapt_ack;//gaowei in doc not in rtl
 
  function new( string name = "ieee1500_gopphy_dft_gasket_4_laneconfig_status_reg" );
    super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_4_LANECONFIG_STATUS_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

  virtual function void build(); // {{{ status_build
  mplla_state = uvm_reg_field::type_id::create( "mplla_state" );
  mplla_state.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  mpllb_state = uvm_reg_field::type_id::create( "mpllb_state" );
  mpllb_state.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 1    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  tx0_ack = uvm_reg_field::type_id::create( "tx0_ack" );
  tx0_ack.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 2    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  tx0_detrx_result = uvm_reg_field::type_id::create( "tx0_detrx_result" );
  tx0_detrx_result.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 3    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  rx0_valid = uvm_reg_field::type_id::create( "rx0_valid" );
  rx0_valid.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 4    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  rx0_los = uvm_reg_field::type_id::create( "rx0_los" );
  rx0_los.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 5    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  rx0_ack = uvm_reg_field::type_id::create( "rx0_ack" );
  rx0_ack.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 6    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  rx0_adapt_ack = uvm_reg_field::type_id::create( "rx0_adapt_ack" );
  rx0_adapt_ack.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 7    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  tx1_ack = uvm_reg_field::type_id::create( "tx1_ack" );
  tx1_ack.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 8    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  tx1_detrx_result = uvm_reg_field::type_id::create( "tx1_detrx_result" );
  tx1_detrx_result.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 9    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  rx1_valid = uvm_reg_field::type_id::create( "rx1_valid" );
  rx1_valid.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 10    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  rx1_los = uvm_reg_field::type_id::create( "rx1_los" );
  rx1_los.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 11    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  rx1_ack = uvm_reg_field::type_id::create( "rx1_ack" );
  rx1_ack.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 12    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  rx1_adapt_ack = uvm_reg_field::type_id::create( "rx1_adapt_ack" );
  rx1_adapt_ack.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 13    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  tx2_ack = uvm_reg_field::type_id::create( "tx2_ack" );
  tx2_ack.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 14    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  tx2_detrx_result = uvm_reg_field::type_id::create( "tx2_detrx_result" );
  tx2_detrx_result.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 15    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  rx2_valid = uvm_reg_field::type_id::create( "rx2_valid" );
  rx2_valid.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 16    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  rx2_los = uvm_reg_field::type_id::create( "rx2_los" );
  rx2_los.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 17    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  rx2_ack = uvm_reg_field::type_id::create( "rx2_ack" );
  rx2_ack.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 18    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  rx2_adapt_ack = uvm_reg_field::type_id::create( "rx2_adapt_ack" );
  rx2_adapt_ack.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 19    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
    
  tx3_ack = uvm_reg_field::type_id::create( "tx3_ack" );
  tx3_ack.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 20    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  tx3_detrx_result = uvm_reg_field::type_id::create( "tx3_detrx_result" );
  tx3_detrx_result.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 21    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  rx3_valid = uvm_reg_field::type_id::create( "rx3_valid" );
  rx3_valid.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 22    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  rx3_los = uvm_reg_field::type_id::create( "rx3_los" );
  rx3_los.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 23    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  rx3_ack = uvm_reg_field::type_id::create( "rx3_ack" );
  rx3_ack.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 24    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  
  //rx3_adapt_ack in doc not in spec
  //gaowei rx3_adapt_ack = uvm_reg_field::type_id::create( "rx3_adapt_ack" );
  //gaowei rx3_adapt_ack.configure( .parent                 ( this ), 
  //gaowei                      .size                   ( 1    ), 
  //gaowei                      .lsb_pos                ( 25    ), 
  //gaowei                      .access                 ( "RO" ), 
  //gaowei                      .volatile               ( 0    ),
  //gaowei                      .reset                  ( 0    ), 
  //gaowei                      .has_reset              ( 1    ), 
  //gaowei                      .is_rand                ( 1    ), 
  //gaowei                      .individually_accessible( 0    ) );
  endfunction: build // }}} status_build
endclass: ieee1500_gopphy_dft_gasket_4_laneconfig_status_reg

//------------------------------------------------------------------------------
// Class: ieee1500_gopphy_dft_gasket_4_laneconfig_isolation_chain_ctrl_reg ISOLATION_CHAIN_CTRL
//------------------------------------------------------------------------------
class ieee1500_gopphy_dft_gasket_4_laneconfig_isolation_chain_ctrl_reg extends dft_reg;
  `uvm_object_utils( ieee1500_gopphy_dft_gasket_4_laneconfig_isolation_chain_ctrl_reg )

  //rand uvm_reg_field gopphy_dft_gasket_4_laneconfig_isolation_chain_ctrl;
  rand uvm_reg_field cr_para_addr;
  rand uvm_reg_field cr_para_wr_data;
  rand uvm_reg_field cr_para_rd_en;
  rand uvm_reg_field cr_para_wr_en;
  rand uvm_reg_field cr_para_sel;
  rand uvm_reg_field ref_use_pad;
  rand uvm_reg_field res_ack_in;
  rand uvm_reg_field ref_clk_en;
  rand uvm_reg_field ref_clk_div2_en;
  rand uvm_reg_field test_powerdown;
  rand uvm_reg_field isochain_override_select;


  function new( string name = "ieee1500_gopphy_dft_gasket_4_laneconfig_isolation_chain_ctrl_reg" );
    super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_4_LANECONFIG_ISOLATION_CHAIN_CTRL_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

  virtual function void build(); // {{{ isolation_chain_ctrl_build
  cr_para_addr = uvm_reg_field::type_id::create( "cr_para_addr" );
  cr_para_addr.configure( .parent                 ( this ), 
                       .size                   ( 16    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  cr_para_wr_data = uvm_reg_field::type_id::create( "cr_para_wr_data" );
  cr_para_wr_data.configure( .parent                 ( this ), 
                       .size                   ( 16    ), 
                       .lsb_pos                ( 16    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  cr_para_rd_en = uvm_reg_field::type_id::create( "cr_para_rd_en" );
  cr_para_rd_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 32    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  cr_para_wr_en = uvm_reg_field::type_id::create( "cr_para_wr_en" );
  cr_para_wr_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 33    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  cr_para_sel = uvm_reg_field::type_id::create( "cr_para_sel" );
  cr_para_sel.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 34    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  ref_use_pad = uvm_reg_field::type_id::create( "ref_use_pad" );
  ref_use_pad.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 35    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  res_ack_in = uvm_reg_field::type_id::create( "res_ack_in" );
  res_ack_in.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 36    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  ref_clk_en = uvm_reg_field::type_id::create( "ref_clk_en" );
  ref_clk_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 37    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  ref_clk_div2_en = uvm_reg_field::type_id::create( "ref_clk_div2_en" );
  ref_clk_div2_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 38    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  test_powerdown = uvm_reg_field::type_id::create( "test_powerdown" );
  test_powerdown.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 39    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  isochain_override_select = uvm_reg_field::type_id::create( "isochain_override_select" );
  isochain_override_select.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 40    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  endfunction: build // }}} isolation_chain_ctrl_build
endclass: ieee1500_gopphy_dft_gasket_4_laneconfig_isolation_chain_ctrl_reg

//------------------------------------------------------------------------------
// Class: ieee1500_gopphy_dft_gasket_4_laneconfig_isolation_chain_obs_reg ISOLATION_CHAIN_OBS
//------------------------------------------------------------------------------
class ieee1500_gopphy_dft_gasket_4_laneconfig_isolation_chain_obs_reg extends dft_reg;
  `uvm_object_utils( ieee1500_gopphy_dft_gasket_4_laneconfig_isolation_chain_obs_reg )

  //rand uvm_reg_field gopphy_dft_gasket_4_laneconfig_isolation_chain_obs;
  rand uvm_reg_field cr_para_ack;
  rand uvm_reg_field cr_para_rd_data;

  function new( string name = "ieee1500_gopphy_dft_gasket_4_laneconfig_isolation_chain_obs_reg" );
    super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_4_LANECONFIG_ISOLATION_CHAIN_OBS_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

  virtual function void build(); // {{{ isolation_chain_obs_build
  cr_para_ack = uvm_reg_field::type_id::create( "cr_para_ack" );
  cr_para_ack.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  cr_para_rd_data= uvm_reg_field::type_id::create( "cr_para_rd_data" );
  cr_para_rd_data.configure( .parent                 ( this ), 
                       .size                   ( 16    ), 
                       .lsb_pos                ( 1    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  endfunction: build // }}} isolation_chain_obs_build
endclass: ieee1500_gopphy_dft_gasket_4_laneconfig_isolation_chain_obs_reg

//------------------------------------------------------------------------------
// Class: ieee1500_gopphy_dft_gasket_4_laneconfig_clock_select_reg CLOCK_SELECT
//------------------------------------------------------------------------------
class ieee1500_gopphy_dft_gasket_4_laneconfig_clock_select_reg extends dft_reg;
  `uvm_object_utils( ieee1500_gopphy_dft_gasket_4_laneconfig_clock_select_reg )

  //rand uvm_reg_field gopphy_dft_gasket_4_laneconfig_clock_select;
  rand uvm_reg_field clock_select;

  function new( string name = "ieee1500_gopphy_dft_gasket_4_laneconfig_clock_select_reg" );
    super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_4_LANECONFIG_CLOCK_SELECT_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

  virtual function void build(); // {{{ clock_select_build
  clock_select = uvm_reg_field::type_id::create( "clock_select" );
  clock_select.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  endfunction: build // }}} clock_select_build
endclass: ieee1500_gopphy_dft_gasket_4_laneconfig_clock_select_reg

//------------------------------------------------------------------------------
// Class: ieee1500_gopphy_dft_gasket_4_laneconfig_clk_observe_reg CLK_OBSERVE 
//------------------------------------------------------------------------------
class ieee1500_gopphy_dft_gasket_4_laneconfig_clk_observe_reg extends dft_reg;
  `uvm_object_utils( ieee1500_gopphy_dft_gasket_4_laneconfig_clk_observe_reg )

  rand uvm_reg_field clk2_divider;//0
  rand uvm_reg_field clk2_sel_clk_0;//5
  rand uvm_reg_field clk2_sel_clk_1;//8
  rand uvm_reg_field clk2_sel_daisy_clk;//11
  rand uvm_reg_field clk2_sel_clk_out;//12
  rand uvm_reg_field clk2_byp_dfs;//13
  rand uvm_reg_field clk1_divider;//0
  rand uvm_reg_field clk1_sel_clk_0;//5
  rand uvm_reg_field clk1_sel_clk_1;//8
  rand uvm_reg_field clk1_sel_daisy_clk;//11
  rand uvm_reg_field clk1_sel_clk_out;//12
  rand uvm_reg_field clk1_byp_dfs;//13
  rand uvm_reg_field clk0_divider;//0
  rand uvm_reg_field clk0_sel_clk_0;//5
  rand uvm_reg_field clk0_sel_clk_1;//8
  rand uvm_reg_field clk0_sel_daisy_clk;//11
  rand uvm_reg_field clk0_sel_clk_out;//12
  rand uvm_reg_field clk0_byp_dfs;//13
  

  function new( string name = "ieee1500_gopphy_dft_gasket_4_laneconfig_clk_observe_reg" );
    super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_4_LANECONFIG_CLK_OBSERVE_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

  virtual function void build(); // {{{ clk_observe_build
  clk2_divider = uvm_reg_field::type_id::create( "clk2_divider" );
  clk2_divider.configure( .parent                 ( this ), 
                       .size                   ( 5    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
   
  clk2_sel_clk_0 = uvm_reg_field::type_id::create( "clk2_sel_clk_0" );
  clk2_sel_clk_0.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 5    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  clk2_sel_clk_1 = uvm_reg_field::type_id::create( "clk2_sel_clk_1" );
  clk2_sel_clk_1.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 8    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  clk2_sel_daisy_clk = uvm_reg_field::type_id::create( "clk2_sel_daisy_clk" );
  clk2_sel_daisy_clk.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 11    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  clk2_sel_clk_out = uvm_reg_field::type_id::create( "clk2_sel_clk_out" );
  clk2_sel_clk_out.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 12    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  clk2_byp_dfs = uvm_reg_field::type_id::create( "clk2_byp_dfs" );
  clk2_byp_dfs.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 13    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  clk1_divider = uvm_reg_field::type_id::create( "clk1_divider" );
  clk1_divider.configure( .parent                 ( this ), 
                       .size                   ( 5    ), 
                       .lsb_pos                ( 14    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
   
  clk1_sel_clk_0 = uvm_reg_field::type_id::create( "clk1_sel_clk_0" );
  clk1_sel_clk_0.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 19    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  clk1_sel_clk_1 = uvm_reg_field::type_id::create( "clk1_sel_clk_1" );
  clk1_sel_clk_1.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 22    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  clk1_sel_daisy_clk = uvm_reg_field::type_id::create( "clk1_sel_daisy_clk" );
  clk1_sel_daisy_clk.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 25    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  clk1_sel_clk_out = uvm_reg_field::type_id::create( "clk1_sel_clk_out" );
  clk1_sel_clk_out.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 26    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  clk1_byp_dfs = uvm_reg_field::type_id::create( "clk1_byp_dfs" );
  clk1_byp_dfs.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 27    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  clk0_divider = uvm_reg_field::type_id::create( "clk0_divider" );
  clk0_divider.configure( .parent                 ( this ), 
                       .size                   ( 5    ), 
                       .lsb_pos                ( 28    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
   
  clk0_sel_clk_0 = uvm_reg_field::type_id::create( "clk0_sel_clk_0" );
  clk0_sel_clk_0.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 33    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  clk0_sel_clk_1 = uvm_reg_field::type_id::create( "clk0_sel_clk_1" );
  clk0_sel_clk_1.configure( .parent                 ( this ), 
                       .size                   ( 3    ), 
                       .lsb_pos                ( 36    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  clk0_sel_daisy_clk = uvm_reg_field::type_id::create( "clk0_sel_daisy_clk" );
  clk0_sel_daisy_clk.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 39    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  clk0_sel_clk_out = uvm_reg_field::type_id::create( "clk0_sel_clk_out" );
  clk0_sel_clk_out.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 40    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  clk0_byp_dfs = uvm_reg_field::type_id::create( "clk0_byp_dfs" );
  clk0_byp_dfs.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 41    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );


  endfunction: build // }}} clk_observe_build
endclass: ieee1500_gopphy_dft_gasket_4_laneconfig_clk_observe_reg

//------------------------------------------------------------------------------
// Class: ieee1500_gopphy_dft_gasket_4_laneconfig_channel_bypass_reg CHANNEL_BYPASS
//------------------------------------------------------------------------------
class ieee1500_gopphy_dft_gasket_4_laneconfig_channel_bypass_reg extends dft_reg;
  `uvm_object_utils( ieee1500_gopphy_dft_gasket_4_laneconfig_channel_bypass_reg )

  //rand uvm_reg_field gopphy_dft_gasket_4_laneconfig_;
  rand uvm_reg_field channel_bypass;


  function new( string name = "ieee1500_gopphy_dft_gasket_4_laneconfig_channel_bypass_reg" );
    super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_4_LANECONFIG_CHANNEL_BYPASS_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

  virtual function void build(); // {{{ channel_bypass_build
  channel_bypass = uvm_reg_field::type_id::create( "channel_bypass" );
  channel_bypass.configure( .parent                 ( this ), 
                       .size                   ( 5    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
    
  endfunction: build // }}} channel_bypass_build
endclass: ieee1500_gopphy_dft_gasket_4_laneconfig_channel_bypass_reg

//------------------------------------------------------------------------------
// Class: ieee1500_gopphy_dft_gasket_4_laneconfig_analog_obs_en_reg ANALOG_OBS_EN
//------------------------------------------------------------------------------
class ieee1500_gopphy_dft_gasket_4_laneconfig_analog_obs_en_reg extends dft_reg;
  `uvm_object_utils( ieee1500_gopphy_dft_gasket_4_laneconfig_analog_obs_en_reg )

  //rand uvm_reg_field gopphy_dft_gasket_4_laneconfig_analog_obs_en;
  rand uvm_reg_field atb_f_p_obsen;
  rand uvm_reg_field atb_s_m_obsen;
  rand uvm_reg_field atb_s_p_obsen;

  function new( string name = "ieee1500_gopphy_dft_gasket_4_laneconfig_analog_obs_en_reg" );
    super.new( .name( name ), .n_bits( `GOPPHY_DFT_GASKET_4_LANECONFIG_ANALOG_OBS_EN_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

  virtual function void build(); // {{{ analog_obs_en_build
  atb_f_p_obsen = uvm_reg_field::type_id::create( "atb_f_p_obsen" );
  atb_f_p_obsen.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  atb_s_m_obsen = uvm_reg_field::type_id::create( "atb_s_m_obsen" );
  atb_s_m_obsen.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 1    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );

  atb_s_p_obsen = uvm_reg_field::type_id::create( "atb_s_p_obsen" );
  atb_s_p_obsen.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 2    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );                   
    
  endfunction: build // }}} analog_obs_en_build
endclass: ieee1500_gopphy_dft_gasket_4_laneconfig_analog_obs_en_reg

//gaowei end



//------------------------------------------------------------------------------
// Class: ieee1500_soc_stac_alttapen_reg
//------------------------------------------------------------------------------

class ieee1500_soc_stac_alttapen_reg extends dft_reg;
   `uvm_object_utils( ieee1500_soc_stac_alttapen_reg )

   rand uvm_reg_field soc_stac_alttapen;

   function new( string name = "ieee1500_soc_stac_alttapen_reg" );
      super.new( .name( name ), .n_bits( `SOC_STAC_ALTTAPEN_LENGTH ), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      soc_stac_alttapen = uvm_reg_field::type_id::create( "soc_stac_alttapen" );
      soc_stac_alttapen.configure( .parent                 ( this ), 
                       .size                   ( `SOC_STAC_ALTTAPEN_LENGTH    ), 
                       .lsb_pos                ( 0), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( `SOC_STAC_ALTTAPEN_RST_VALUE    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0   ) );

   endfunction: build
endclass: ieee1500_soc_stac_alttapen_reg

//------------------------------------------------------------------------------
// Class: ieee1500_tmdpphy_1_cfgaccess_reg
//------------------------------------------------------------------------------
class ieee1500_tmdpphy_1_cfgaccess_reg extends dft_reg;
  `uvm_object_utils( ieee1500_tmdpphy_1_cfgaccess_reg )

  rand uvm_reg_field execute;
  rand uvm_reg_field cfg_addr;
  rand uvm_reg_field cfg_data;
  rand uvm_reg_field complete_rd_wr;

  function new( string name = "ieee1500_tmdpphy_1_cfgaccess_reg" );
    super.new( .name( name ), .n_bits( `TMDPPHY_1_CFGACCESS_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

  virtual function void build(); // {{{ tmdpphy_1_cfgaccess_build
  execute = uvm_reg_field::type_id::create( "execute" );
  execute.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 49   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  cfg_addr = uvm_reg_field::type_id::create( "cfg_addr" );
  cfg_addr.configure( .parent                 ( this ), 
                       .size                   ( 16   ), 
                       .lsb_pos                ( 33   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  cfg_data = uvm_reg_field::type_id::create( "cfg_data" );
  cfg_data.configure( .parent                 ( this ), 
                       .size                   ( 32   ), 
                       .lsb_pos                ( 1    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  complete_rd_wr = uvm_reg_field::type_id::create( "complete_rd_wr" );
  complete_rd_wr.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  endfunction: build // }}} tmdpphy_1_cfgaccess_build
endclass: ieee1500_tmdpphy_1_cfgaccess_reg

//------------------------------------------------------------------------------
// Class: ieee1500_tmdpphy_1_scanconfig_reg
//------------------------------------------------------------------------------
class ieee1500_tmdpphy_1_scanconfig_reg extends dft_reg;
  `uvm_object_utils( ieee1500_tmdpphy_1_scanconfig_reg )

  rand uvm_reg_field dfx_ignore_nb_cfg_cmds;
  rand uvm_reg_field dc_scan;
  rand uvm_reg_field dfxcm_gen_ac_scan;
  rand uvm_reg_field block_async_rst;
  rand uvm_reg_field scan_wrap_en;
  rand uvm_reg_field dfxcm_gen_wrap_io_face;
  rand uvm_reg_field test_clk_en_override;
  rand uvm_reg_field dfxcm_edt_m_bypass_en;
  rand uvm_reg_field dfxcm_edt_s_bypass_en;
  rand uvm_reg_field dfxcm_edt_s_comp_en;
  rand uvm_reg_field dfxcm_edt_low_power_shift_en;
  rand uvm_reg_field dfxcm_lvl_func_iso_en;
  rand uvm_reg_field dfxcm_scan_pipe_en;
  rand uvm_reg_field dfx_sticky_clamp;
  rand uvm_reg_field dfxcm_gen_force_pwr_gating_off;
  rand uvm_reg_field sel_scan_for_BPHY_or_CPHYPLL;
  rand uvm_reg_field sel_scan_for_PLL0_or_PLL1;

  function new( string name = "ieee1500_tmdpphy_1_scanconfig_reg" );
    super.new( .name( name ), .n_bits( `TMDPPHY_1_SCANCONFIG_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
  endfunction: new

  virtual function void build(); // {{{ tmdpphy_1_scanconfig_build
  sel_scan_for_PLL0_or_PLL1 = uvm_reg_field::type_id::create( "sel_scan_for_PLL0_or_PLL1" );
  sel_scan_for_PLL0_or_PLL1.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 16   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  sel_scan_for_BPHY_or_CPHYPLL = uvm_reg_field::type_id::create( "sel_scan_for_BPHY_or_CPHYPLL" );
  sel_scan_for_BPHY_or_CPHYPLL.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 15   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  dfxcm_gen_force_pwr_gating_off = uvm_reg_field::type_id::create( "dfxcm_gen_force_pwr_gating_off" );
  dfxcm_gen_force_pwr_gating_off.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 14   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 1    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  dfx_sticky_clamp = uvm_reg_field::type_id::create( "dfx_sticky_clamp" );
  dfx_sticky_clamp.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 13   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  dfxcm_scan_pipe_en = uvm_reg_field::type_id::create( "dfxcm_scan_pipe_en" );
  dfxcm_scan_pipe_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 12   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  dfxcm_lvl_func_iso_en = uvm_reg_field::type_id::create( "dfxcm_lvl_func_iso_en" );
  dfxcm_lvl_func_iso_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 11   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  dfxcm_edt_low_power_shift_en = uvm_reg_field::type_id::create( "dfxcm_edt_low_power_shift_en" );
  dfxcm_edt_low_power_shift_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 10   ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  dfxcm_edt_s_comp_en = uvm_reg_field::type_id::create( "dfxcm_edt_s_comp_en" );
  dfxcm_edt_s_comp_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 9    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  dfxcm_edt_s_bypass_en = uvm_reg_field::type_id::create( "dfxcm_edt_s_bypass_en" );
  dfxcm_edt_s_bypass_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 8    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 1    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  dfxcm_edt_m_bypass_en = uvm_reg_field::type_id::create( "dfxcm_edt_m_bypass_en" );
  dfxcm_edt_m_bypass_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 7    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  test_clk_en_override = uvm_reg_field::type_id::create( "test_clk_en_override" );
  test_clk_en_override.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 6    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 1    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  dfxcm_gen_wrap_io_face = uvm_reg_field::type_id::create( "dfxcm_gen_wrap_io_face" );
  dfxcm_gen_wrap_io_face.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 5    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 1    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  scan_wrap_en = uvm_reg_field::type_id::create( "scan_wrap_en" );
  scan_wrap_en.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 4    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  block_async_rst = uvm_reg_field::type_id::create( "block_async_rst" );
  block_async_rst.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 3    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 1    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  dfxcm_gen_ac_scan = uvm_reg_field::type_id::create( "dfxcm_gen_ac_scan" );
  dfxcm_gen_ac_scan.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 2    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  dc_scan = uvm_reg_field::type_id::create( "dc_scan" );
  dc_scan.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 1    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  dfx_ignore_nb_cfg_cmds = uvm_reg_field::type_id::create( "dfx_ignore_nb_cfg_cmds" );
  dfx_ignore_nb_cfg_cmds.configure( .parent                 ( this ), 
                       .size                   ( 1    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RW" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 0    ) );
  endfunction: build // }}} tmdpphy_1_scanconfig_build
endclass: ieee1500_tmdpphy_1_scanconfig_reg

// Class: ieee1149_gddr5_ioctrl_reg
//------------------------------------------------------------------------------

class ieee1500_gddr5_ioctrl_reg extends dft_reg;
   `uvm_object_utils( ieee1500_gddr5_ioctrl_reg )

   rand uvm_reg_field g5bst_data_sel;
   rand uvm_reg_field g5bst_oe_sel;
   rand uvm_reg_field g5tsteou;
   rand uvm_reg_field g5tstein;
   rand uvm_reg_field g5tsto;
   rand uvm_reg_field g5iotest_mode;
   rand uvm_reg_field g5nochain_tste;
   rand uvm_reg_field g5intercept_testmode;
   rand uvm_reg_field g5clamp_sticky;
   rand uvm_reg_field g5ioc_scan_flyov_en;
   rand uvm_reg_field g5pwrgd_chicken;
   rand uvm_reg_field gpiodftflyoverouttsto;
   rand uvm_reg_field gpiodftflyoverouten;
   rand uvm_reg_field gpiodftflyoverinen;


   function new( string name = "ieee1500_gddr5_ioctrl_reg" );
      super.new( .name( name ), .n_bits( `GDDR5_IOCTRL_LENGTH), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();

      g5bst_data_sel = uvm_reg_field::type_id::create( "g5bst_data_sel" );
      g5bst_data_sel.configure( .parent                 ( this ), 
                                       .size                   ( 1 ), 
                                       .lsb_pos                ( 0), 
                                       .access                 ( "RW" ), 
                                       .volatile               ( 0    ),
                                       .reset                  ( 0    ), 
                                       .has_reset              ( 1    ), 
                                       .is_rand                ( 1    ), 
                                       .individually_accessible( 0   ) );

      g5bst_oe_sel = uvm_reg_field::type_id::create( "g5bst_oe_sel" );
      g5bst_oe_sel.configure( .parent                 ( this ), 
                                       .size                   ( 1 ), 
                                       .lsb_pos                ( 1), 
                                       .access                 ( "RW" ), 
                                       .volatile               ( 0    ),
                                       .reset                  ( 0    ), 
                                       .has_reset              ( 1    ), 
                                       .is_rand                ( 1    ), 
                                       .individually_accessible( 0   ) );

      g5tsteou = uvm_reg_field::type_id::create( "g5tsteou" );
      g5tsteou.configure( .parent                 ( this ), 
                                       .size                   ( 1 ), 
                                       .lsb_pos                ( 2), 
                                       .access                 ( "RW" ), 
                                       .volatile               ( 0    ),
                                       .reset                  ( 0    ), 
                                       .has_reset              ( 1    ), 
                                       .is_rand                ( 1    ), 
                                       .individually_accessible( 0   ) );

      g5tstein = uvm_reg_field::type_id::create( "g5tstein" );
      g5tstein.configure( .parent                 ( this ), 
                                       .size                   ( 1 ), 
                                       .lsb_pos                ( 3), 
                                       .access                 ( "RW" ), 
                                       .volatile               ( 0    ),
                                       .reset                  ( 0    ), 
                                       .has_reset              ( 1    ), 
                                       .is_rand                ( 1    ), 
                                       .individually_accessible( 0   ) );

      g5tsto = uvm_reg_field::type_id::create( "g5tsto" );
      g5tsto.configure( .parent                 ( this ), 
                                       .size                   ( 1 ), 
                                       .lsb_pos                ( 4), 
                                       .access                 ( "RW" ), 
                                       .volatile               ( 0    ),
                                       .reset                  ( 0    ), 
                                       .has_reset              ( 1    ), 
                                       .is_rand                ( 1    ), 
                                       .individually_accessible( 0   ) );

      g5iotest_mode = uvm_reg_field::type_id::create( "g5iotest_mode" );
      g5iotest_mode.configure( .parent                 ( this ), 
                                       .size                   ( 1 ), 
                                       .lsb_pos                ( 5), 
                                       .access                 ( "RW" ), 
                                       .volatile               ( 0    ),
                                       .reset                  ( 0    ), 
                                       .has_reset              ( 1    ), 
                                       .is_rand                ( 1    ), 
                                       .individually_accessible( 0   ) );

      g5nochain_tste = uvm_reg_field::type_id::create( "g5nochain_tste" );
      g5nochain_tste.configure( .parent                 ( this ), 
                                       .size                   ( 1 ), 
                                       .lsb_pos                ( 6), 
                                       .access                 ( "RW" ), 
                                       .volatile               ( 0    ),
                                       .reset                  ( 0    ), 
                                       .has_reset              ( 1    ), 
                                       .is_rand                ( 1    ), 
                                       .individually_accessible( 0   ) );

      g5intercept_testmode = uvm_reg_field::type_id::create( "g5intercept_testmode" );
      g5intercept_testmode.configure( .parent                 ( this ), 
                                       .size                   ( 1 ), 
                                       .lsb_pos                ( 7), 
                                       .access                 ( "RW" ), 
                                       .volatile               ( 0    ),
                                       .reset                  ( 0    ), 
                                       .has_reset              ( 1    ), 
                                       .is_rand                ( 1    ), 
                                       .individually_accessible( 0   ) );

      g5clamp_sticky = uvm_reg_field::type_id::create( "g5clamp_sticky" );
      g5clamp_sticky.configure( .parent                 ( this ), 
                                       .size                   ( 1 ), 
                                       .lsb_pos                ( 8), 
                                       .access                 ( "RW" ), 
                                       .volatile               ( 0    ),
                                       .reset                  ( 0    ), 
                                       .has_reset              ( 1    ), 
                                       .is_rand                ( 1    ), 
                                       .individually_accessible( 0   ) );

      g5ioc_scan_flyov_en = uvm_reg_field::type_id::create( "g5ioc_scan_flyov_en" );
      g5ioc_scan_flyov_en.configure( .parent                 ( this ), 
                                       .size                   ( 1 ), 
                                       .lsb_pos                ( 9), 
                                       .access                 ( "RW" ), 
                                       .volatile               ( 0    ),
                                       .reset                  ( 0    ), 
                                       .has_reset              ( 1    ), 
                                       .is_rand                ( 1    ), 
                                       .individually_accessible( 0   ) );

      g5pwrgd_chicken= uvm_reg_field::type_id::create( "g5pwrgd_chicken" );
      g5pwrgd_chicken.configure( .parent                 ( this ), 
                                       .size                   ( 1 ), 
                                       .lsb_pos                ( 10), 
                                       .access                 ( "RW" ), 
                                       .volatile               ( 0    ),
                                       .reset                  ( 0    ), 
                                       .has_reset              ( 1    ), 
                                       .is_rand                ( 1    ), 
                                       .individually_accessible( 0   ) );

      gpiodftflyoverouttsto= uvm_reg_field::type_id::create( "gpiodftflyoveroutston" );
      gpiodftflyoverouttsto.configure( .parent                 ( this ), 
                                       .size                   ( 1 ), 
                                       .lsb_pos                ( 11), 
                                       .access                 ( "RW" ), 
                                       .volatile               ( 0    ),
                                       .reset                  ( 0    ), 
                                       .has_reset              ( 1    ), 
                                       .is_rand                ( 1    ), 
                                       .individually_accessible( 0   ) );


      gpiodftflyoverouten= uvm_reg_field::type_id::create( "gpiodftflyoverouten" );
      gpiodftflyoverouten.configure( .parent                 ( this ), 
                                       .size                   ( 1 ), 
                                       .lsb_pos                ( 12), 
                                       .access                 ( "RW" ), 
                                       .volatile               ( 0    ),
                                       .reset                  ( 0    ), 
                                       .has_reset              ( 1    ), 
                                       .is_rand                ( 1    ), 
                                       .individually_accessible( 0   ) );
      gpiodftflyoverinen= uvm_reg_field::type_id::create( "gpiodftflyoveinten" );
      gpiodftflyoverinen.configure( .parent                 ( this ), 
                                       .size                   ( 1 ), 
                                       .lsb_pos                ( 13), 
                                       .access                 ( "RW" ), 
                                       .volatile               ( 0    ),
                                       .reset                  ( 0    ), 
                                       .has_reset              ( 1    ), 
                                       .is_rand                ( 1    ), 
                                       .individually_accessible( 0   ) );
                                     
   endfunction: build
endclass: ieee1500_gddr5_ioctrl_reg

//------------------------------------------------------------------------------
// Class: dft_register_block
//------------------------------------------------------------------------------

class dft_register_block extends dft_reg_block;
   `uvm_object_utils( dft_register_block )

//==================add by hcai1 begin=================//
   rand ieee1149_wbypass_reg               mtap_wbypass_reg; 
   rand ieee1149_pipelinemode_reg         mtap_pipelinemode_reg;
   rand ieee1149_idcode_reg               mtap_idcode_reg;
   rand ieee1149_manid_reg                mtap_manid_reg;
   rand soc_stac_ieee1500_wbypass_reg     soc_stac_wbypass_reg;
   rand soc_stac_ieee1500_bypass_reg      soc_stac_bypass_reg;
   rand soc_stac_ieee1500_memcfg_reg      soc_stac_memcfg_reg; 
   rand soc_stac_ieee1500_ioctrl_reg      soc_stac_ioctrl_reg;    
//==================add by hcai1 end===================//

   rand ieee1149_bypass_reg            bypass_reg;
   rand ieee1149_dummy_tdr_reg         dummy_tdr_reg;
   rand ieee1149_mtap_alttapen_reg     mtap_alttapen_reg;
   rand ieee1149_gopphy_crsel_reg      gopphy_crsel_reg;
   rand ieee1500_soc_stac_alttapen_reg soc_stac_alttapen_reg;
   rand ieee1500_idcode_reg            idcode_reg;
   rand ieee1500_scanconfig_reg        scanconfig_reg;
   rand ieee1500_sub_client_sib_reg    sub_client_sib_reg;
   rand ieee1500_syspll_cfg_reg        syspll1_cfg_reg,syspll2_cfg_reg;
   rand ieee1500_fuse_override_reg     fuse_override_reg;
   rand ieee1500_sms_status_reg        sms_status_reg;
   rand ieee1500_sms_config_reg        sms_config_reg;
   rand ieee1500_lvds_serdes_reg       lvds_serdes_reg;
   rand ieee1500_lvds_apb_reg          lvds_apb_reg;
   rand ieee1500_sptap_bypass_reg      sptap_bypass_reg;
   rand ieee1500_sptap_jpc_sms_sel_reg       sptap_jpc_sms_sel_reg;
   rand ieee1500_sptap_jpc_udr_sel_reg       sptap_jpc_udr_sel_reg;
   rand ieee1500_sptap_sms_tbox_sel_reg      sptap_sms_tbox_sel_reg;
   rand ieee1500_jpc_br_sel_reg        jpc_br_sel_reg;
   rand ieee1500_jpc_sms_sel_reg       jpc_sms_sel_reg;
   rand ieee1500_jpc_udr_load_reg      jpc_udr_load_reg;
   rand ieee1500_jpc_udr_sel_reg       jpc_udr_sel_reg;
   rand ieee1500_jpc_pgmr_sel_reg      jpc_pgmr_sel_reg;
   rand ieee1500_jpc_udr_program_reg   jpc_udr_program_reg;
   rand ieee1500_jpc_udr_compare_reg   jpc_udr_compare_reg;
   rand ieee1500_jpc_rbox_rst_reg       jpc_rbox_rst_reg;
   rand ieee1500_jpc_rbox_sel_reg       jpc_rbox_sel_reg;
   rand ieee1500_jpc_rbox_program_reg   jpc_rbox_program_reg;
   rand ieee1500_jpc_rbox_compare_reg   jpc_rbox_compare_reg;
   rand ieee1500_jpc_status_sel_reg    jpc_status_sel_reg;
   rand ieee1500_sms_tbox_sel_reg      sms_tbox_sel_reg;
   rand ieee1500_dpll1_csraccess_reg   dpll1_csraccess_reg;
   rand ieee1500_testconfig_reg        testconfig_reg;
   rand ieee1500_gopphy_dft_gasket_2_laneconfig_testmode_reg      gopphy_dft_gasket_2_laneconfig_testmode_reg;
   rand ieee1500_gopphy_dft_gasket_4_laneconfig_testmode_reg      gopphy_dft_gasket_4_laneconfig_testmode_reg;
   rand ieee1500_gopphy_dft_gasket_2_alttap_en_reg                gopphy_dft_gasket_2_alttap_en_reg;
   rand ieee1500_gopphy_dft_gasket_4_alttap_en_reg                gopphy_dft_gasket_4_alttap_en_reg;

   rand ieee1500_gopphy_dft_gasket_2_laneconfig_bsr_debug_reg     gopphy_dft_gasket_2_laneconfig_bsr_debug_reg;
   rand ieee1500_gopphy_dft_gasket_2_laneconfig_isolation_chain_ctrl_reg      gopphy_dft_gasket_2_laneconfig_isolation_chain_ctrl_reg;
   rand ieee1500_gopphy_dft_gasket_2_laneconfig_loopback_reg      gopphy_dft_gasket_2_laneconfig_loopback_reg;
   rand ieee1500_gopphy_dft_gasket_2_laneconfig_loopback_rx_reg   gopphy_dft_gasket_2_laneconfig_loopback_rx_reg;
   rand ieee1500_gopphy_dft_gasket_2_laneconfig_loopback_tx_reg   gopphy_dft_gasket_2_laneconfig_loopback_tx_reg;
  //gaowei begin gop2 and gop4
  rand ieee1500_gopphy_dft_gasket_2_laneconfig_scanconfig_reg     gopphy_dft_gasket_2_laneconfig_scanconfig_reg; 
  rand ieee1500_gopphy_dft_gasket_2_laneconfig_clock_select_reg   gopphy_dft_gasket_2_laneconfig_clock_select_reg;
  rand ieee1500_gopphy_dft_gasket_2_laneconfig_clk_observe_reg    gopphy_dft_gasket_2_laneconfig_clk_observe_reg;
  rand ieee1500_gopphy_dft_gasket_2_laneconfig_analog_obs_en_reg  gopphy_dft_gasket_2_laneconfig_analog_obs_en_reg;
  rand ieee1500_gopphy_dft_gasket_2_laneconfig_channel_bypass_reg gopphy_dft_gasket_2_laneconfig_channel_bypass_reg;
  rand ieee1500_gopphy_dft_gasket_2_laneconfig_ros_cntl_counter_reg gopphy_dft_gasket_2_laneconfig_ros_cntl_counter_reg;
  rand ieee1500_gopphy_dft_gasket_2_laneconfig_ros_cntl_rosen_reg gopphy_dft_gasket_2_laneconfig_ros_cntl_rosen_reg;
  rand ieee1500_gopphy_dft_gasket_2_laneconfig_ros_setup_reg      gopphy_dft_gasket_2_laneconfig_ros_setup_reg;
  rand ieee1500_gopphy_dft_gasket_2_laneconfig_ros_status_reg     gopphy_dft_gasket_2_laneconfig_ros_status_reg;
  rand ieee1500_gopphy_dft_gasket_2_laneconfig_mpll_control_reg   gopphy_dft_gasket_2_laneconfig_mpll_control_reg;
  rand ieee1500_gopphy_dft_gasket_2_laneconfig_status_reg         gopphy_dft_gasket_2_laneconfig_status_reg;
  rand ieee1500_gopphy_dft_gasket_2_laneconfig_isolation_chain_obs_reg gopphy_dft_gasket_2_laneconfig_isolation_chain_obs_reg;


  rand ieee1500_gopphy_dft_gasket_4_laneconfig_scanconfig_reg     gopphy_dft_gasket_4_laneconfig_scanconfig_reg; 
  rand ieee1500_gopphy_dft_gasket_4_laneconfig_bsr_debug_reg      gopphy_dft_gasket_4_laneconfig_bsr_debug_reg; 
  rand ieee1500_gopphy_dft_gasket_4_laneconfig_loopback_reg       gopphy_dft_gasket_4_laneconfig_loopback_reg; 
  rand ieee1500_gopphy_dft_gasket_4_laneconfig_loopback_tx_reg    gopphy_dft_gasket_4_laneconfig_loopback_tx_reg; 
  rand ieee1500_gopphy_dft_gasket_4_laneconfig_loopback_rx_reg    gopphy_dft_gasket_4_laneconfig_loopback_rx_reg;
  rand ieee1500_gopphy_dft_gasket_4_laneconfig_mpll_control_reg   gopphy_dft_gasket_4_laneconfig_mpll_control_reg;
  rand ieee1500_gopphy_dft_gasket_4_laneconfig_status_reg         gopphy_dft_gasket_4_laneconfig_status_reg;
  rand ieee1500_gopphy_dft_gasket_4_laneconfig_isolation_chain_ctrl_reg gopphy_dft_gasket_4_laneconfig_isolation_chain_ctrl_reg;
  rand ieee1500_gopphy_dft_gasket_4_laneconfig_isolation_chain_obs_reg gopphy_dft_gasket_4_laneconfig_isolation_chain_obs_reg;
  rand ieee1500_gopphy_dft_gasket_4_laneconfig_clock_select_reg   gopphy_dft_gasket_4_laneconfig_clock_select_reg;
  rand ieee1500_gopphy_dft_gasket_4_laneconfig_clk_observe_reg    gopphy_dft_gasket_4_laneconfig_clk_observe_reg;
  rand ieee1500_gopphy_dft_gasket_4_laneconfig_channel_bypass_reg gopphy_dft_gasket_4_laneconfig_channel_bypass_reg;
  rand ieee1500_gopphy_dft_gasket_4_laneconfig_analog_obs_en_reg  gopphy_dft_gasket_4_laneconfig_analog_obs_en_reg;
  rand ieee1500_gopphy_dft_gasket_4_laneconfig_ws_bypass_reg      gopphy_dft_gasket_4_laneconfig_ws_bypass_reg;
  rand ieee1500_gopphy_dft_gasket_4_laneconfig_ros_cntl_counter_reg gopphy_dft_gasket_4_laneconfig_ros_cntl_counter_reg;
  rand ieee1500_gopphy_dft_gasket_4_laneconfig_ros_cntl_rosen_reg gopphy_dft_gasket_4_laneconfig_ros_cntl_rosen_reg;
  rand ieee1500_gopphy_dft_gasket_4_laneconfig_ros_setup_reg      gopphy_dft_gasket_4_laneconfig_ros_setup_reg;
  rand ieee1500_gopphy_dft_gasket_4_laneconfig_ros_status_reg     gopphy_dft_gasket_4_laneconfig_ros_status_reg;
  //gaowei end
  rand ieee1500_tmdpphy_1_cfgaccess_reg     tmdpphy_1_cfgaccess_reg;
  rand ieee1500_tmdpphy_1_scanconfig_reg    tmdpphy_1_scanconfig_reg;
  rand ieee1500_gddr5_ioctrl_reg            gddr5_ioctrl_reg;
   dft_reg_map                         reg_map;
   uvm_reg_map                         sms_reg_map;

   function new( string name = "dft_register_block" );
      super.new( .name( name ), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();

   //==========add by hcai1 begin============//
     mtap_wbypass_reg = ieee1149_wbypass_reg::type_id::create( "mtap_wbypass_reg" );
     mtap_wbypass_reg.configure( .blk_parent( this ) );
     mtap_wbypass_reg.build();

     mtap_pipelinemode_reg = ieee1149_pipelinemode_reg::type_id::create( "mtap_pipelinemode_reg" );
     mtap_pipelinemode_reg.configure( .blk_parent( this ) );
     mtap_pipelinemode_reg.build();

     mtap_idcode_reg = ieee1149_idcode_reg::type_id::create( "mtap_idcode_reg" );
     mtap_idcode_reg.configure( .blk_parent( this ) );
     mtap_idcode_reg.build();

     mtap_manid_reg = ieee1149_manid_reg::type_id::create( "mtap_manid_reg" );
     mtap_manid_reg.configure( .blk_parent( this ) );
     mtap_manid_reg.build();

     soc_stac_wbypass_reg = soc_stac_ieee1500_wbypass_reg::type_id::create("soc_stac_wbypass_reg");
     soc_stac_wbypass_reg.configure( .blk_parent( this ) );
     soc_stac_wbypass_reg.build();

     soc_stac_bypass_reg = soc_stac_ieee1500_bypass_reg::type_id::create("soc_stac_bypass_reg");
     soc_stac_bypass_reg.configure( .blk_parent( this ) );
     soc_stac_bypass_reg.build();

     soc_stac_memcfg_reg = soc_stac_ieee1500_memcfg_reg::type_id::create("soc_stac_memcfg_reg");
     soc_stac_memcfg_reg.configure( .blk_parent( this ) );
     soc_stac_memcfg_reg.build();

     soc_stac_ioctrl_reg = soc_stac_ieee1500_ioctrl_reg::type_id::create("soc_stac_ioctrl_reg");
     soc_stac_ioctrl_reg.configure( .blk_parent( this ) );
     soc_stac_ioctrl_reg.build();
   //==========add by hcai1 end ============//

      bypass_reg = ieee1149_bypass_reg::type_id::create( "bypass_reg" );
      bypass_reg.configure( .blk_parent( this ) );
      bypass_reg.build();

      mtap_alttapen_reg = ieee1149_mtap_alttapen_reg::type_id::create( "mtap_alttapen_reg" );
      mtap_alttapen_reg.configure( .blk_parent( this ) );
      mtap_alttapen_reg.build();

      dummy_tdr_reg = ieee1149_dummy_tdr_reg::type_id::create( "dummy_tdr_reg" );
      dummy_tdr_reg.configure( .blk_parent( this ) );
      dummy_tdr_reg.build();

      gopphy_crsel_reg = ieee1149_gopphy_crsel_reg::type_id::create( "gopphy_crsel_reg" );
      gopphy_crsel_reg.configure( .blk_parent( this ) );
      gopphy_crsel_reg.build();

      idcode_reg = ieee1500_idcode_reg::type_id::create( "idcode_reg" );
      idcode_reg.configure( .blk_parent( this ) );
      idcode_reg.build();

      scanconfig_reg = ieee1500_scanconfig_reg::type_id::create( "scanconfig_reg" );
      scanconfig_reg.configure( .blk_parent( this ) );
      scanconfig_reg.build();

      soc_stac_alttapen_reg = ieee1500_soc_stac_alttapen_reg::type_id::create( "soc_stac_alttapen_reg" );
      soc_stac_alttapen_reg.configure( .blk_parent( this ) );
      soc_stac_alttapen_reg.build();

      sub_client_sib_reg = ieee1500_sub_client_sib_reg::type_id::create( "sub_client_sib_reg" );
      sub_client_sib_reg.configure( .blk_parent( this ) );
      sub_client_sib_reg.build();

      syspll1_cfg_reg = ieee1500_syspll_cfg_reg::type_id::create( "syspll1_cfg_reg" );
      syspll1_cfg_reg.configure( .blk_parent( this ) );
      syspll1_cfg_reg.build();
      
      syspll2_cfg_reg = ieee1500_syspll_cfg_reg::type_id::create( "syspll2_cfg_reg" );
      syspll2_cfg_reg.configure( .blk_parent( this ) );
      syspll2_cfg_reg.build();

      fuse_override_reg = ieee1500_fuse_override_reg::type_id::create("fuse_override_reg" );
      fuse_override_reg.configure( .blk_parent( this ) );
      fuse_override_reg.build();
      
      sms_status_reg = ieee1500_sms_status_reg::type_id::create("sms_status_reg" );
      sms_status_reg.configure( .blk_parent( this ) );
      sms_status_reg.build();

      sms_config_reg = ieee1500_sms_config_reg::type_id::create("sms_config_reg" );
      sms_config_reg.configure( .blk_parent( this ) );
      sms_config_reg.build();

      lvds_serdes_reg = ieee1500_lvds_serdes_reg::type_id::create("lvds_serdes_reg" );
      lvds_serdes_reg.configure( .blk_parent( this ) );
      lvds_serdes_reg.build();
      
      lvds_apb_reg = ieee1500_lvds_apb_reg::type_id::create("lvds_apb_reg" );
      lvds_apb_reg.configure( .blk_parent( this ) );
      lvds_apb_reg.build();
      
      sptap_bypass_reg = ieee1500_sptap_bypass_reg::type_id::create("sptap_bypass_reg" );
      sptap_bypass_reg.configure( .blk_parent( this ) );
      sptap_bypass_reg.build();

      sptap_jpc_sms_sel_reg = ieee1500_sptap_jpc_sms_sel_reg::type_id::create("sptap_jpc_sms_sel_reg" );
      sptap_jpc_sms_sel_reg.configure( .blk_parent( this ) );
      sptap_jpc_sms_sel_reg.build();

      sptap_jpc_udr_sel_reg = ieee1500_sptap_jpc_udr_sel_reg::type_id::create("sptap_jpc_udr_sel_reg" );
      sptap_jpc_udr_sel_reg.configure( .blk_parent( this ) );
      sptap_jpc_udr_sel_reg.build();

      sptap_sms_tbox_sel_reg = ieee1500_sptap_sms_tbox_sel_reg::type_id::create("sptap_sms_tbox_sel_reg" );
      sptap_sms_tbox_sel_reg.configure( .blk_parent( this ) );
      sptap_sms_tbox_sel_reg.build();

      jpc_br_sel_reg = ieee1500_jpc_br_sel_reg::type_id::create("jpc_br_sel_reg" );
      jpc_br_sel_reg.configure( .blk_parent( this ) );
      jpc_br_sel_reg.build();

      jpc_sms_sel_reg = ieee1500_jpc_sms_sel_reg::type_id::create("jpc_sms_sel_reg" );
      jpc_sms_sel_reg.configure( .blk_parent( this ) );
      jpc_sms_sel_reg.build();

      jpc_udr_load_reg = ieee1500_jpc_udr_load_reg::type_id::create("jpc_udr_load_reg" );
      jpc_udr_load_reg.configure( .blk_parent( this ) );
      jpc_udr_load_reg.build();

      jpc_udr_sel_reg = ieee1500_jpc_udr_sel_reg::type_id::create("jpc_udr_sel_reg" );
      jpc_udr_sel_reg.configure( .blk_parent( this ) );
      jpc_udr_sel_reg.build();

      jpc_pgmr_sel_reg = ieee1500_jpc_pgmr_sel_reg::type_id::create("jpc_pgmr_sel_reg" );
      jpc_pgmr_sel_reg.configure( .blk_parent( this ) );
      jpc_pgmr_sel_reg.build();

      jpc_udr_program_reg = ieee1500_jpc_udr_program_reg::type_id::create("jpc_udr_program_reg" );
      jpc_udr_program_reg.configure( .blk_parent( this ) );
      jpc_udr_program_reg.build();

      jpc_udr_compare_reg = ieee1500_jpc_udr_compare_reg::type_id::create("jpc_udr_compare_reg" );
      jpc_udr_compare_reg.configure( .blk_parent( this ) );
      jpc_udr_compare_reg.build();

      jpc_rbox_rst_reg = ieee1500_jpc_rbox_rst_reg::type_id::create("jpc_rbox_rst_reg" );
      jpc_rbox_rst_reg.configure( .blk_parent( this ) );
      jpc_rbox_rst_reg.build();

      jpc_rbox_sel_reg = ieee1500_jpc_rbox_sel_reg::type_id::create("jpc_rbox_sel_reg" );
      jpc_rbox_sel_reg.configure( .blk_parent( this ) );
      jpc_rbox_sel_reg.build();

      jpc_rbox_program_reg = ieee1500_jpc_rbox_program_reg::type_id::create("jpc_rbox_program_reg" );
      jpc_rbox_program_reg.configure( .blk_parent( this ) );
      jpc_rbox_program_reg.build();

      jpc_rbox_compare_reg = ieee1500_jpc_rbox_compare_reg::type_id::create("jpc_rbox_compare_reg" );
      jpc_rbox_compare_reg.configure( .blk_parent( this ) );
      jpc_rbox_compare_reg.build();

      jpc_status_sel_reg = ieee1500_jpc_status_sel_reg::type_id::create("jpc_status_sel_reg" );
      jpc_status_sel_reg.configure( .blk_parent( this ) );
      jpc_status_sel_reg.build();

      sms_tbox_sel_reg = ieee1500_sms_tbox_sel_reg::type_id::create("sms_tbox_sel_reg" );
      sms_tbox_sel_reg.configure( .blk_parent( this ) );
      sms_tbox_sel_reg.build();

      dpll1_csraccess_reg = ieee1500_dpll1_csraccess_reg::type_id::create( "dpll1_csraccess_reg" );
      dpll1_csraccess_reg.configure( .blk_parent( this ) );
      dpll1_csraccess_reg.build();
      
      testconfig_reg = ieee1500_testconfig_reg::type_id::create( "testconfig_reg" );
      testconfig_reg.configure( .blk_parent( this ) );
      testconfig_reg.build();
      
      gopphy_dft_gasket_2_laneconfig_testmode_reg = ieee1500_gopphy_dft_gasket_2_laneconfig_testmode_reg::type_id::create( "gopphy_dft_gasket_2_laneconfig_testmode_reg" );
      gopphy_dft_gasket_2_laneconfig_testmode_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_2_laneconfig_testmode_reg.build();

      gopphy_dft_gasket_2_laneconfig_bsr_debug_reg = ieee1500_gopphy_dft_gasket_2_laneconfig_bsr_debug_reg::type_id::create( "gopphy_dft_gasket_2_laneconfig_bsr_debug_reg" );
      gopphy_dft_gasket_2_laneconfig_bsr_debug_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_2_laneconfig_bsr_debug_reg.build();

      gopphy_dft_gasket_2_laneconfig_isolation_chain_ctrl_reg = ieee1500_gopphy_dft_gasket_2_laneconfig_isolation_chain_ctrl_reg::type_id::create( "gopphy_dft_gasket_2_laneconfig_isolation_chain_ctrl_reg" );
      gopphy_dft_gasket_2_laneconfig_isolation_chain_ctrl_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_2_laneconfig_isolation_chain_ctrl_reg.build();

      gopphy_dft_gasket_2_laneconfig_loopback_reg = ieee1500_gopphy_dft_gasket_2_laneconfig_loopback_reg::type_id::create( "gopphy_dft_gasket_2_laneconfig_loopback_reg" );
      gopphy_dft_gasket_2_laneconfig_loopback_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_2_laneconfig_loopback_reg.build();

      gopphy_dft_gasket_2_laneconfig_loopback_rx_reg = ieee1500_gopphy_dft_gasket_2_laneconfig_loopback_rx_reg::type_id::create( "gopphy_dft_gasket_2_laneconfig_loopback_rx_reg" );
      gopphy_dft_gasket_2_laneconfig_loopback_rx_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_2_laneconfig_loopback_rx_reg.build();

      gopphy_dft_gasket_2_laneconfig_loopback_tx_reg = ieee1500_gopphy_dft_gasket_2_laneconfig_loopback_tx_reg::type_id::create( "gopphy_dft_gasket_2_laneconfig_loopback_tx_reg" );
      gopphy_dft_gasket_2_laneconfig_loopback_tx_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_2_laneconfig_loopback_tx_reg.build();

      gopphy_dft_gasket_4_laneconfig_testmode_reg = ieee1500_gopphy_dft_gasket_4_laneconfig_testmode_reg::type_id::create( "gopphy_dft_gasket_4_laneconfig_testmode_reg" );
      gopphy_dft_gasket_4_laneconfig_testmode_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_4_laneconfig_testmode_reg.build();

      gopphy_dft_gasket_2_alttap_en_reg = ieee1500_gopphy_dft_gasket_2_alttap_en_reg::type_id::create( "gopphy_dft_gasket_2_alttap_en_reg" );
      gopphy_dft_gasket_2_alttap_en_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_2_alttap_en_reg.build();

      gopphy_dft_gasket_4_alttap_en_reg = ieee1500_gopphy_dft_gasket_4_alttap_en_reg::type_id::create( "gopphy_dft_gasket_4_alttap_en_reg" );
      gopphy_dft_gasket_4_alttap_en_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_4_alttap_en_reg.build();
      
      //gaowei begin for gop2 and gop4
      gopphy_dft_gasket_2_laneconfig_scanconfig_reg = ieee1500_gopphy_dft_gasket_2_laneconfig_scanconfig_reg::type_id::create( "gopphy_dft_gasket_2_laneconfig_scanconfig_reg" );
      gopphy_dft_gasket_2_laneconfig_scanconfig_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_2_laneconfig_scanconfig_reg.build();

      gopphy_dft_gasket_2_laneconfig_clock_select_reg = ieee1500_gopphy_dft_gasket_2_laneconfig_clock_select_reg::type_id::create( "gopphy_dft_gasket_2_laneconfig_clock_select_reg" );
      gopphy_dft_gasket_2_laneconfig_clock_select_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_2_laneconfig_clock_select_reg.build();

      gopphy_dft_gasket_2_laneconfig_clk_observe_reg = ieee1500_gopphy_dft_gasket_2_laneconfig_clk_observe_reg::type_id::create( "gopphy_dft_gasket_2_laneconfig_clk_observe_reg" );
      gopphy_dft_gasket_2_laneconfig_clk_observe_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_2_laneconfig_clk_observe_reg.build();

      gopphy_dft_gasket_2_laneconfig_analog_obs_en_reg = ieee1500_gopphy_dft_gasket_2_laneconfig_analog_obs_en_reg::type_id::create( "gopphy_dft_gasket_2_laneconfig_analog_obs_en_reg" );
      gopphy_dft_gasket_2_laneconfig_analog_obs_en_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_2_laneconfig_analog_obs_en_reg.build();

      gopphy_dft_gasket_2_laneconfig_analog_obs_en_reg = ieee1500_gopphy_dft_gasket_2_laneconfig_analog_obs_en_reg::type_id::create( "gopphy_dft_gasket_2_laneconfig_analog_obs_en_reg" );
      gopphy_dft_gasket_2_laneconfig_analog_obs_en_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_2_laneconfig_analog_obs_en_reg.build();

      gopphy_dft_gasket_2_laneconfig_channel_bypass_reg = ieee1500_gopphy_dft_gasket_2_laneconfig_channel_bypass_reg::type_id::create( "gopphy_dft_gasket_2_laneconfig_channel_bypass_reg" );
      gopphy_dft_gasket_2_laneconfig_channel_bypass_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_2_laneconfig_channel_bypass_reg.build();

      gopphy_dft_gasket_2_laneconfig_ros_cntl_counter_reg = ieee1500_gopphy_dft_gasket_2_laneconfig_ros_cntl_counter_reg::type_id::create( "gopphy_dft_gasket_2_laneconfig_ros_cntl_counter_reg" );
      gopphy_dft_gasket_2_laneconfig_ros_cntl_counter_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_2_laneconfig_ros_cntl_counter_reg.build();

      gopphy_dft_gasket_2_laneconfig_ros_cntl_rosen_reg = ieee1500_gopphy_dft_gasket_2_laneconfig_ros_cntl_rosen_reg::type_id::create( "gopphy_dft_gasket_2_laneconfig_ros_cntl_rosen_reg" );
      gopphy_dft_gasket_2_laneconfig_ros_cntl_rosen_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_2_laneconfig_ros_cntl_rosen_reg.build();

      gopphy_dft_gasket_2_laneconfig_ros_setup_reg = ieee1500_gopphy_dft_gasket_2_laneconfig_ros_setup_reg::type_id::create( "gopphy_dft_gasket_2_laneconfig_ros_setup_reg" );
      gopphy_dft_gasket_2_laneconfig_ros_setup_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_2_laneconfig_ros_setup_reg.build();

      gopphy_dft_gasket_2_laneconfig_ros_status_reg = ieee1500_gopphy_dft_gasket_2_laneconfig_ros_status_reg::type_id::create( "gopphy_dft_gasket_2_laneconfig_ros_status_reg" );
      gopphy_dft_gasket_2_laneconfig_ros_status_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_2_laneconfig_ros_status_reg.build();

      gopphy_dft_gasket_2_laneconfig_mpll_control_reg = ieee1500_gopphy_dft_gasket_2_laneconfig_mpll_control_reg::type_id::create( "gopphy_dft_gasket_2_laneconfig_mpll_control_reg" );
      gopphy_dft_gasket_2_laneconfig_mpll_control_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_2_laneconfig_mpll_control_reg.build();

      gopphy_dft_gasket_2_laneconfig_status_reg = ieee1500_gopphy_dft_gasket_2_laneconfig_status_reg::type_id::create( "gopphy_dft_gasket_2_laneconfig_status_reg" );
      gopphy_dft_gasket_2_laneconfig_status_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_2_laneconfig_status_reg.build();

      gopphy_dft_gasket_2_laneconfig_isolation_chain_obs_reg = ieee1500_gopphy_dft_gasket_2_laneconfig_isolation_chain_obs_reg::type_id::create( "gopphy_dft_gasket_2_laneconfig_isolation_chain_obs_reg" );
      gopphy_dft_gasket_2_laneconfig_isolation_chain_obs_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_2_laneconfig_isolation_chain_obs_reg.build();



      gopphy_dft_gasket_4_laneconfig_scanconfig_reg = ieee1500_gopphy_dft_gasket_4_laneconfig_scanconfig_reg::type_id::create( "gopphy_dft_gasket_4_laneconfig_scanconfig_reg" );
      gopphy_dft_gasket_4_laneconfig_scanconfig_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_4_laneconfig_scanconfig_reg.build();
      
      gopphy_dft_gasket_4_laneconfig_bsr_debug_reg = ieee1500_gopphy_dft_gasket_4_laneconfig_bsr_debug_reg::type_id::create( "gopphy_dft_gasket_4_laneconfig_bsr_debug_reg" );
      gopphy_dft_gasket_4_laneconfig_bsr_debug_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_4_laneconfig_bsr_debug_reg.build();

      gopphy_dft_gasket_4_laneconfig_loopback_reg = ieee1500_gopphy_dft_gasket_4_laneconfig_loopback_reg::type_id::create( "gopphy_dft_gasket_4_laneconfig_loopback_reg" );
      gopphy_dft_gasket_4_laneconfig_loopback_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_4_laneconfig_loopback_reg.build();

      gopphy_dft_gasket_4_laneconfig_loopback_tx_reg = ieee1500_gopphy_dft_gasket_4_laneconfig_loopback_tx_reg::type_id::create( "gopphy_dft_gasket_4_laneconfig_loopback_tx_reg" );
      gopphy_dft_gasket_4_laneconfig_loopback_tx_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_4_laneconfig_loopback_tx_reg.build();

      gopphy_dft_gasket_4_laneconfig_loopback_rx_reg = ieee1500_gopphy_dft_gasket_4_laneconfig_loopback_rx_reg::type_id::create( "gopphy_dft_gasket_4_laneconfig_loopback_rx_reg" );
      gopphy_dft_gasket_4_laneconfig_loopback_rx_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_4_laneconfig_loopback_rx_reg.build();

      gopphy_dft_gasket_4_laneconfig_mpll_control_reg = ieee1500_gopphy_dft_gasket_4_laneconfig_mpll_control_reg::type_id::create( "gopphy_dft_gasket_4_laneconfig_mpll_control_reg" );
      gopphy_dft_gasket_4_laneconfig_mpll_control_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_4_laneconfig_mpll_control_reg.build();

      gopphy_dft_gasket_4_laneconfig_status_reg = ieee1500_gopphy_dft_gasket_4_laneconfig_status_reg::type_id::create( "gopphy_dft_gasket_4_laneconfig_status_reg" );
      gopphy_dft_gasket_4_laneconfig_status_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_4_laneconfig_status_reg.build();

      gopphy_dft_gasket_4_laneconfig_isolation_chain_ctrl_reg = ieee1500_gopphy_dft_gasket_4_laneconfig_isolation_chain_ctrl_reg::type_id::create( "gopphy_dft_gasket_4_laneconfig_isolation_chain_ctrl_reg" );
      gopphy_dft_gasket_4_laneconfig_isolation_chain_ctrl_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_4_laneconfig_isolation_chain_ctrl_reg.build();

      gopphy_dft_gasket_4_laneconfig_isolation_chain_obs_reg = ieee1500_gopphy_dft_gasket_4_laneconfig_isolation_chain_obs_reg::type_id::create( "gopphy_dft_gasket_4_laneconfig_isolation_chain_obs_reg" );
      gopphy_dft_gasket_4_laneconfig_isolation_chain_obs_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_4_laneconfig_isolation_chain_obs_reg.build();

      gopphy_dft_gasket_4_laneconfig_clock_select_reg = ieee1500_gopphy_dft_gasket_4_laneconfig_clock_select_reg::type_id::create( "gopphy_dft_gasket_4_laneconfig_clock_select_reg" );
      gopphy_dft_gasket_4_laneconfig_clock_select_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_4_laneconfig_clock_select_reg.build();

      gopphy_dft_gasket_4_laneconfig_clk_observe_reg = ieee1500_gopphy_dft_gasket_4_laneconfig_clk_observe_reg::type_id::create( "gopphy_dft_gasket_4_laneconfig_clk_observe_reg" );
      gopphy_dft_gasket_4_laneconfig_clk_observe_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_4_laneconfig_clk_observe_reg.build();

      gopphy_dft_gasket_4_laneconfig_channel_bypass_reg = ieee1500_gopphy_dft_gasket_4_laneconfig_channel_bypass_reg::type_id::create( "gopphy_dft_gasket_4_laneconfig_channel_bypass_reg" );
      gopphy_dft_gasket_4_laneconfig_channel_bypass_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_4_laneconfig_channel_bypass_reg.build();
      
      gopphy_dft_gasket_4_laneconfig_analog_obs_en_reg = ieee1500_gopphy_dft_gasket_4_laneconfig_analog_obs_en_reg::type_id::create( "gopphy_dft_gasket_4_laneconfig_analog_obs_en_reg" );
      gopphy_dft_gasket_4_laneconfig_analog_obs_en_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_4_laneconfig_analog_obs_en_reg.build();

      gopphy_dft_gasket_4_laneconfig_ws_bypass_reg = ieee1500_gopphy_dft_gasket_4_laneconfig_ws_bypass_reg::type_id::create( "gopphy_dft_gasket_4_laneconfig_ws_bypass_reg" );
      gopphy_dft_gasket_4_laneconfig_ws_bypass_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_4_laneconfig_ws_bypass_reg.build();

      gopphy_dft_gasket_4_laneconfig_ros_cntl_counter_reg = ieee1500_gopphy_dft_gasket_4_laneconfig_ros_cntl_counter_reg::type_id::create( "gopphy_dft_gasket_4_laneconfig_ros_cntl_counter_reg" );
      gopphy_dft_gasket_4_laneconfig_ros_cntl_counter_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_4_laneconfig_ros_cntl_counter_reg.build();

      gopphy_dft_gasket_4_laneconfig_ros_cntl_rosen_reg = ieee1500_gopphy_dft_gasket_4_laneconfig_ros_cntl_rosen_reg::type_id::create( "gopphy_dft_gasket_4_laneconfig_ros_cntl_rosen_reg" );
      gopphy_dft_gasket_4_laneconfig_ros_cntl_rosen_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_4_laneconfig_ros_cntl_rosen_reg.build();

      gopphy_dft_gasket_4_laneconfig_ros_setup_reg = ieee1500_gopphy_dft_gasket_4_laneconfig_ros_setup_reg::type_id::create( "gopphy_dft_gasket_4_laneconfig_ros_setup_reg" );
      gopphy_dft_gasket_4_laneconfig_ros_setup_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_4_laneconfig_ros_setup_reg.build();

      gopphy_dft_gasket_4_laneconfig_ros_status_reg = ieee1500_gopphy_dft_gasket_4_laneconfig_ros_status_reg::type_id::create( "gopphy_dft_gasket_4_laneconfig_ros_status_reg" );
      gopphy_dft_gasket_4_laneconfig_ros_status_reg.configure( .blk_parent( this ) );
      gopphy_dft_gasket_4_laneconfig_ros_status_reg.build();
      //gaowei end

      tmdpphy_1_cfgaccess_reg = ieee1500_tmdpphy_1_cfgaccess_reg::type_id::create( "tmdpphy_1_cfgaccess_reg" );
      tmdpphy_1_cfgaccess_reg.configure( .blk_parent( this ) );
      tmdpphy_1_cfgaccess_reg.build();

      tmdpphy_1_scanconfig_reg = ieee1500_tmdpphy_1_scanconfig_reg::type_id::create( "tmdpphy_1_scanconfig_reg" );
      tmdpphy_1_scanconfig_reg.configure( .blk_parent( this ) );
      tmdpphy_1_scanconfig_reg.build();

      gddr5_ioctrl_reg = ieee1500_gddr5_ioctrl_reg::type_id::create( "gddr5_ioctrl_reg" );
      gddr5_ioctrl_reg.configure( .blk_parent( this ) );
      gddr5_ioctrl_reg.build();
      
      //reg_map = create_map( .name( "reg_map" ), .base_addr( `DFT_REG_ADDR_WIDTH'b0 ),.n_bytes( `MAX_N_BYTES ), .endian( UVM_LITTLE_ENDIAN ) );
      reg_map = create_dft_map( .name( "dft_reg_map" ), .base_addr( 0 ),.n_bytes( `MAX_N_BYTES ), .endian( UVM_LITTLE_ENDIAN ) );
      //================add by hcai1 begin=========================//
      reg_map.add_reg( .rg( mtap_wbypass_reg ), .offset( `IEEE_1149_WBYPASS_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( mtap_pipelinemode_reg ), .offset( `IEEE_1149_PIPELINEMODE_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( mtap_idcode_reg ), .offset( `IEEE_1149_IDCODE_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( mtap_manid_reg ), .offset( `IEEE_1149_MANID_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( soc_stac_wbypass_reg ), .offset( `SOC_STAC_WBYPASS_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( soc_stac_bypass_reg ), .offset( `SOC_STAC_BYPASS_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( soc_stac_memcfg_reg ), .offset( `SOC_STAC_MEMCFG_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( soc_stac_ioctrl_reg ), .offset( `SOC_STAC_IOCTRL_ADDR), .rights( "RW" ) );
      //================add by hcai end============================//

      reg_map.add_reg( .rg( bypass_reg ), .offset( `BYPASS_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( mtap_alttapen_reg), .offset( `MTAP_ALTTAPEN_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( soc_stac_alttapen_reg), .offset( `SOC_STAC_ALTTAPEN_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( idcode_reg  ), .offset( `IDCODE_ADDR ), .rights( "RW" ) );
      reg_map.add_reg( .rg( scanconfig_reg), .offset( `SCANCONFIG_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( sub_client_sib_reg), .offset( `SUB_CLIENT_SIB_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( dummy_tdr_reg), .offset( `DUMMY_TDR_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_crsel_reg), .offset( `GOPPHY_CRSEL_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( syspll1_cfg_reg ), .offset( `SYSPLL1_CFG_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( syspll2_cfg_reg ), .offset( `SYSPLL2_CFG_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( fuse_override_reg), .offset( `FUSE_OVERRIDE_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( sms_status_reg), .offset( `SMS_STATUS_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( sms_config_reg), .offset( `SMS_CONFIG_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( lvds_serdes_reg), .offset( `LVDS_SERDES_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( lvds_apb_reg), .offset( `LVDS_APB_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( sptap_bypass_reg), .offset( `SPTAP_BYPASS_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( dpll1_csraccess_reg  ), .offset( `DPLL1_CSRACCESS_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( testconfig_reg  ), .offset( `TESTCONFIG_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_2_laneconfig_testmode_reg), .offset( `GOPPHY_DFT_GASKET_2_LANECONFIG_TESTMODE_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_2_laneconfig_bsr_debug_reg), .offset( `GOPPHY_DFT_GASKET_2_LANECONFIG_BSR_DEBUG_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_2_laneconfig_isolation_chain_ctrl_reg), .offset( `GOPPHY_DFT_GASKET_2_LANECONFIG_ISOLATION_CHAIN_CTRL_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_2_laneconfig_loopback_reg), .offset( `GOPPHY_DFT_GASKET_2_LANECONFIG_LOOPBACK_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_2_laneconfig_loopback_rx_reg), .offset( `GOPPHY_DFT_GASKET_2_LANECONFIG_LOOPBACK_RX_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_2_laneconfig_loopback_tx_reg), .offset( `GOPPHY_DFT_GASKET_2_LANECONFIG_LOOPBACK_TX_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_4_laneconfig_testmode_reg), .offset( `GOPPHY_DFT_GASKET_4_LANECONFIG_TESTMODE_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_2_alttap_en_reg), .offset( `GOPPHY_DFT_GASKET_2_ALTTAP_EN_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_4_alttap_en_reg), .offset( `GOPPHY_DFT_GASKET_4_ALTTAP_EN_ADDR), .rights( "RW" ) );
      //gaowei begin for gop2 and gop4
      reg_map.add_reg( .rg( gopphy_dft_gasket_2_laneconfig_scanconfig_reg), .offset( `GOPPHY_DFT_GASKET_2_LANECONFIG_SCANCONFIG_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_2_laneconfig_clock_select_reg), .offset( `GOPPHY_DFT_GASKET_2_LANECONFIG_CLOCK_SELECT_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_2_laneconfig_clk_observe_reg), .offset( `GOPPHY_DFT_GASKET_2_LANECONFIG_CLK_OBSERVE_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_2_laneconfig_analog_obs_en_reg), .offset( `GOPPHY_DFT_GASKET_2_LANECONFIG_ANALOG_OBS_EN_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_2_laneconfig_channel_bypass_reg), .offset( `GOPPHY_DFT_GASKET_2_LANECONFIG_CHANNEL_BYPASS_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_2_laneconfig_ros_cntl_counter_reg), .offset( `GOPPHY_DFT_GASKET_2_LANECONFIG_ROS_CNTL_COUNTER_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_2_laneconfig_ros_cntl_rosen_reg), .offset( `GOPPHY_DFT_GASKET_2_LANECONFIG_ROS_CNTL_ROSEN_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_2_laneconfig_ros_setup_reg), .offset( `GOPPHY_DFT_GASKET_2_LANECONFIG_ROS_SETUP_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_2_laneconfig_ros_status_reg), .offset( `GOPPHY_DFT_GASKET_2_LANECONFIG_ROS_STATUS_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_2_laneconfig_mpll_control_reg), .offset( `GOPPHY_DFT_GASKET_2_LANECONFIG_MPLL_CONTROL_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_2_laneconfig_status_reg), .offset( `GOPPHY_DFT_GASKET_2_LANECONFIG_STATUS_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_2_laneconfig_isolation_chain_obs_reg), .offset( `GOPPHY_DFT_GASKET_2_LANECONFIG_ISOLATION_CHAIN_OBS_ADDR), .rights( "RW" ) );


      reg_map.add_reg( .rg( gopphy_dft_gasket_4_laneconfig_scanconfig_reg), .offset( `GOPPHY_DFT_GASKET_4_LANECONFIG_SCANCONFIG_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_4_laneconfig_bsr_debug_reg), .offset( `GOPPHY_DFT_GASKET_4_LANECONFIG_BSR_DEBUG_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_4_laneconfig_loopback_reg), .offset( `GOPPHY_DFT_GASKET_4_LANECONFIG_LOOPBACK_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_4_laneconfig_loopback_tx_reg), .offset( `GOPPHY_DFT_GASKET_4_LANECONFIG_LOOPBACK_TX_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_4_laneconfig_loopback_rx_reg), .offset( `GOPPHY_DFT_GASKET_4_LANECONFIG_LOOPBACK_RX_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_4_laneconfig_mpll_control_reg), .offset( `GOPPHY_DFT_GASKET_4_LANECONFIG_MPLL_CONTROL_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_4_laneconfig_status_reg), .offset( `GOPPHY_DFT_GASKET_4_LANECONFIG_STATUS_ADDR), .rights( "RO" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_4_laneconfig_isolation_chain_ctrl_reg), .offset( `GOPPHY_DFT_GASKET_4_LANECONFIG_ISOLATION_CHAIN_CTRL_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_4_laneconfig_isolation_chain_obs_reg), .offset( `GOPPHY_DFT_GASKET_4_LANECONFIG_ISOLATION_CHAIN_OBS_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_4_laneconfig_clock_select_reg), .offset( `GOPPHY_DFT_GASKET_4_LANECONFIG_CLOCK_SELECT_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_4_laneconfig_clk_observe_reg), .offset( `GOPPHY_DFT_GASKET_4_LANECONFIG_CLK_OBSERVE_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_4_laneconfig_channel_bypass_reg), .offset( `GOPPHY_DFT_GASKET_4_LANECONFIG_CHANNEL_BYPASS_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_4_laneconfig_analog_obs_en_reg), .offset( `GOPPHY_DFT_GASKET_4_LANECONFIG_ANALOG_OBS_EN_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_4_laneconfig_ws_bypass_reg), .offset( `GOPPHY_DFT_GASKET_4_LANECONFIG_WS_BYPASS_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_4_laneconfig_ros_cntl_counter_reg), .offset( `GOPPHY_DFT_GASKET_4_LANECONFIG_ROS_CNTL_COUNTER_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_4_laneconfig_ros_cntl_rosen_reg), .offset( `GOPPHY_DFT_GASKET_4_LANECONFIG_ROS_CNTL_ROSEN_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_4_laneconfig_ros_setup_reg), .offset( `GOPPHY_DFT_GASKET_4_LANECONFIG_ROS_SETUP_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gopphy_dft_gasket_4_laneconfig_ros_status_reg), .offset( `GOPPHY_DFT_GASKET_4_LANECONFIG_ROS_STATUS_ADDR), .rights( "RO" ) );
      //gaowei end
      reg_map.add_reg( .rg( tmdpphy_1_cfgaccess_reg), .offset( `TMDPPHY_1_CFGACCESS_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( tmdpphy_1_scanconfig_reg), .offset( `TMDPPHY_1_SCANCONFIG_ADDR), .rights( "RW" ) );
      reg_map.add_reg( .rg( gddr5_ioctrl_reg), .offset( `GDDR5_IOCTRL_ADDR), .rights( "RW" ) );

      sms_reg_map = create_map( .name( "sms_reg_map" ), .base_addr( 0 ),.n_bytes( `MAX_N_BYTES ), .endian( UVM_LITTLE_ENDIAN ) );
      sms_reg_map.add_reg( .rg( sptap_jpc_sms_sel_reg), .offset( `SPTAP_JPC_SMS_SEL_ADDR), .rights( "RW" ) );
      sms_reg_map.add_reg( .rg( sptap_jpc_udr_sel_reg), .offset( `SPTAP_JPC_UDR_SEL_ADDR), .rights( "RW" ) );
      sms_reg_map.add_reg( .rg( sptap_sms_tbox_sel_reg), .offset( `SPTAP_SMS_TBOX_SEL_ADDR), .rights( "RW" ) );
      sms_reg_map.add_reg( .rg( jpc_br_sel_reg), .offset( `JPC_BR_SEL_ADDR), .rights( "RW" ) );
      sms_reg_map.add_reg( .rg( jpc_sms_sel_reg), .offset( `JPC_SMS_SEL_ADDR), .rights( "RW" ) );
      sms_reg_map.add_reg( .rg( jpc_udr_load_reg), .offset( `JPC_UDR_LOAD_ADDR), .rights( "RW" ) );
      sms_reg_map.add_reg( .rg( jpc_udr_sel_reg), .offset( `JPC_UDR_SEL_ADDR), .rights( "RW" ) );
      sms_reg_map.add_reg( .rg( jpc_pgmr_sel_reg), .offset( `JPC_PGMR_SEL_ADDR), .rights( "RW" ) );
      sms_reg_map.add_reg( .rg( jpc_udr_program_reg), .offset( `JPC_UDR_PROGRAM_ADDR), .rights( "RW" ) );
      sms_reg_map.add_reg( .rg( jpc_udr_compare_reg), .offset( `JPC_UDR_COMPARE_ADDR), .rights( "RW" ) );
      sms_reg_map.add_reg( .rg( jpc_rbox_rst_reg), .offset( `JPC_RBOX_RST_ADDR), .rights( "RW" ) );
      sms_reg_map.add_reg( .rg( jpc_rbox_sel_reg), .offset( `JPC_RBOX_SEL_ADDR), .rights( "RW" ) );
      sms_reg_map.add_reg( .rg( jpc_rbox_program_reg), .offset( `JPC_RBOX_PROGRAM_ADDR), .rights( "RW" ) );
      sms_reg_map.add_reg( .rg( jpc_rbox_compare_reg), .offset( `JPC_RBOX_COMPARE_ADDR), .rights( "RW" ) );
      sms_reg_map.add_reg( .rg( jpc_status_sel_reg), .offset( `JPC_STATUS_SEL_ADDR), .rights( "RW" ) );
      sms_reg_map.add_reg( .rg( sms_tbox_sel_reg), .offset( `SMS_TBOX_SEL_ADDR), .rights( "RW" ) );
      lock_model(); // finalize the address mapping
   endfunction: build

endclass: dft_register_block   

`endif
