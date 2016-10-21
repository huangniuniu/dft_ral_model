`ifndef _DFT_ENV_SVH
`define _DFT_ENV_SVH

//---------------------------------------------------------------------------
// Class: dft_env
//---------------------------------------------------------------------------

class dft_env extends uvm_env;
   `uvm_component_utils( dft_env )
   
   function new( string name, uvm_component parent );
      super.new( name, parent );
   endfunction: new

   //handles for env's components
   jtag_agent           agent;
   jtag_scoreboard      scoreboard;
   jtag_configuration   cfg;
   //jtag_reg_predictor   reg_predictor;
   TCK_clk_driver       TCK_clk_drv;
   SYSCLK_clk_driver    SYSCLK_clk_drv;
   reset_driver         reset_drv;
   pad_agent            pad_agnt;
   //pll_cfg_agent        pll_cfg_agnt;
   //occ_agent            occ_agnt;

   stil_generator       stil_gen;
   dft_register_layering     reg_layering;
   sms_register_layering     sms_reg_layering;

   function void build_phase( uvm_phase phase );
      super.build_phase( phase );
	   
      agent = jtag_agent::type_id::create           (.name( "agent"      ), .parent(this));
      scoreboard = jtag_scoreboard::type_id::create (.name( "scoreboard" ), .parent(this));
      //reg_predictor = jtag_reg_predictor::type_id::create(.name( "reg_predictor" ), .parent(this));
      
      TCK_clk_drv = TCK_clk_driver::type_id::create(.name( "TCK_clk_drv" ), .parent(this));
      SYSCLK_clk_drv = SYSCLK_clk_driver::type_id::create(.name( "SYSCLK_clk_drv" ), .parent(this));
      reset_drv = reset_driver::type_id::create(.name( "reset_drv" ), .parent(this));
      pad_agnt = pad_agent::type_id::create(.name( "pad_agent" ), .parent(this));
      //pll_cfg_agnt = pll_cfg_agent::type_id::create(.name( "pll_cfg_agnt" ), .parent(this));
      //occ_agnt = occ_agent::type_id::create(.name( "occ_agnt" ), .parent(this));
      stil_gen = stil_generator::type_id::create(.name( "stil_gen" ), .parent(this));
      reg_layering = dft_register_layering::type_id::create(.name( "reg_layering" ), .parent(this));
      sms_reg_layering = sms_register_layering::type_id::create(.name( "sms_reg_layering" ), .parent(this));
      
      assert(uvm_config_db#( jtag_configuration)::get ( .cntxt( this ), .inst_name( "*" ), .field_name( "jtag_cfg" ), .value( cfg) ))
      else `uvm_fatal("NOVIF", "Failed to get virtual interfaces form uvm_config_db.\n");
   endfunction: build_phase

   function void connect_phase( uvm_phase phase );
      agent.jtag_ap.connect(scoreboard.analysis_export);
      agent.drv.jtag_drv_ap.connect(stil_gen.jtag_drv_imp_export); 
      TCK_clk_drv.clk_drv_ap.connect(stil_gen.TCK_clk_drv_imp_export); 
      SYSCLK_clk_drv.clk_drv_ap.connect(stil_gen.SYSCLK_clk_drv_imp_export); 
      pad_agnt.pad_drv.pad_drv_ap.connect(stil_gen.pad_drv_imp_export); 
      reset_drv.reset_drv_ap.connect(stil_gen.analysis_export); 

      agent.mon.jtag_vi = cfg.jtag_vi;
      //agent.drv.jtag_vi = cfg.jtag_vi;
      //cfg.reg_block.reg_map.set_sequencer( .sequencer( agent.sqr ), .adapter( agent.jtag_reg_adapter ) );
      //reg_predictor.map     = cfg.reg_block.reg_map;
      //reg_predictor.adapter = agent.jtag_reg_adapter;
      //agent.jtag_ap.connect( reg_predictor.bus_in );
      
      reg_layering.agent = agent;
      agent.jtag_ap.connect(reg_layering.jtag_ap);
      
      sms_reg_layering.agent = agent;
      agent.sms_reg_mon_ap.connect(sms_reg_layering.jtag_ap);

   endfunction: connect_phase

endclass:dft_env

`endif
