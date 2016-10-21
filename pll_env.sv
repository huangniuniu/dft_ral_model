`ifndef _PLL_ENV_SV
`define _PLL_ENV_SV

//---------------------------------------------------------------------------
// Class: pll_env
//---------------------------------------------------------------------------

class pll_env extends uvm_env;
   `uvm_component_utils( pll_env )
   
   function new( string name, uvm_component parent );
      super.new( name, parent );
   endfunction: new

   pll_cfg_agent        pll_cfg_agnt;
   occ_agent            occ_agnt;

   function void build_phase( uvm_phase phase );
      super.build_phase( phase );
      pll_cfg_agnt = pll_cfg_agent::type_id::create(.name( "pll_cfg_agnt" ), .parent(this));
      occ_agnt = occ_agent::type_id::create(.name( "occ_agnt" ), .parent(this));
   endfunction: build_phase


endclass:pll_env

`endif
