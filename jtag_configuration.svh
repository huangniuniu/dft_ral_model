typedef class clk_wave_description;

//---------------------------------------------------------------------------
// Class: jtag_configuration
//---------------------------------------------------------------------------

class jtag_configuration extends uvm_object;
   `uvm_object_utils( jtag_configuration )

   function new( string name = "" );
      super.new( name );
   endfunction: new

   virtual jtag_if          jtag_vi;

   dft_register_block       reg_block;

   bit                      gen_stil_file;
   string                   stil_file_name;
   int                      tck_half_period;

   string                   pad_name[3];
   int unsigned             pad_dir[3]; //0: input; 1: output; 2: inout
   
   function void pad_info_init();
      pad_name[0] = "TDI";
      pad_dir[0] = 0;
   
      pad_name[1] = "TMS";
      pad_dir[1] = 0;
   
      pad_name[2] = "TDO";
      pad_dir[2] = 1;
   
   endfunction: pad_info_init

   function string convert2string();
      string       s;
      $sformat(s, "%s\n ********************jtag_configuration*****",s );
      $sformat(s, "%s\n gen_stil_file = \t%b \n stil_file_name = \t%s \n tck_half_period = \t%0d",s, gen_stil_file, stil_file_name, tck_half_period);
      $sformat(s, "%s\n ********************jtag_configuration*****",s );
      return s;
   endfunction: convert2string
endclass: jtag_configuration

//---------------------------------------------------------------------------
// Class: clk_configuration_base
//---------------------------------------------------------------------------

class clk_configuration_base #(string name = "")extends uvm_object;
   //typedef clk_configuration_base#(name) this_type;
   `uvm_object_utils( clk_configuration_base )
   //`uvm_object_utils( this_type )


   bit                      gen_stil_file;
   bit                      stop_clk,free_running;
   int                      half_period;
   
   string                   pad_name[1];
   int unsigned             pad_dir[1]; //0: input; 1: output; 2: inout
   
   virtual clk_if           clk_vi;
   clk_wave_description     clk_wave_desc;

   virtual function void pad_info_init();
      pad_name[0] = name;
      pad_dir[0] = 0;
   endfunction: pad_info_init 
  
   function new( string name = "" );
      super.new( name );
      clk_wave_desc = new("clk_wave_desc");
   endfunction: new

   function string convert2string();
      string       s;

      $sformat(s, "%s\n gen_stil_file = %b \n stop_clk = %b \n free_running = %s \n pad_name = %s, \n pad_dir = %s",s, gen_stil_file,stop_clk, free_running, pad_name[0], pad_dir[0] ? "input" : "output");
      foreach(clk_wave_desc.wave_desc[i]) $sformat(s, "%s\n wave_desc[%0d] = %s",s, i, clk_wave_desc.wave_desc[i]);
      return s;
   endfunction: convert2string

endclass: clk_configuration_base



//---------------------------------------------------------------------------
// Class: TCK_clk_configuration
//---------------------------------------------------------------------------
class TCK_clk_configuration extends clk_configuration_base#("TCK");
   `uvm_object_utils( TCK_clk_configuration )

   function new( string name = "" );
      super.new( name );
   endfunction: new

endclass: TCK_clk_configuration
//typedef clk_configuration_base#("TCK") TCK_clk_configuration;



//---------------------------------------------------------------------------
// Class: SYSCLK_clk_configuration
//---------------------------------------------------------------------------
class SYSCLK_clk_configuration extends clk_configuration_base#("SYSCLK");
   `uvm_object_utils( SYSCLK_clk_configuration )

   function new( string name = "" );
      super.new( name );
   endfunction: new

endclass: SYSCLK_clk_configuration

//typedef clk_configuration_base#("SYSCLK") SYSCLK_clk_configuration;

//---------------------------------------------------------------------------
// Class: reset_configuration
//---------------------------------------------------------------------------

class reset_configuration extends uvm_object;
   `uvm_object_utils( reset_configuration )

   function new( string name = "" );
      super.new( name );
   endfunction: new

   virtual reset_if          reset_vi;

   bit                       gen_stil_file;
   
   string                   pad_name[2];
   int unsigned             pad_dir[2]; //0: input; 1: output; 2: inout
   
   function void pad_info_init();
      pad_name[0] = "TRST";
      pad_dir[0] = 0;
   
      pad_name[1] = "RESET_L";
      pad_dir[1] = 0;
   endfunction: pad_info_init 

endclass: reset_configuration

//---------------------------------------------------------------------------
// Class: pad_configuration
//---------------------------------------------------------------------------

class pad_configuration extends uvm_object;
   `uvm_object_utils( pad_configuration )
   
   virtual pad_if          pad_vi;
   bit                      gen_stil_file;
   string                   grp0_in_name[`PAD_GRP0_IN_NUM];
   string                   grp0_out_name[`PAD_GRP0_OUT_NUM];
   string                   grp0_inout_name[`PAD_GRP0_INOUT_NUM];

   string                   grp1_in_name[`PAD_GRP1_IN_NUM];
   string                   grp1_out_name[`PAD_GRP1_OUT_NUM];
   string                   grp1_inout_name[`PAD_GRP1_INOUT_NUM];
   
   function new( string name = "" );
      super.new( name );
   endfunction: new

   function void pad_info_init();
   endfunction: pad_info_init 
endclass: pad_configuration

//------------------------------------------------------------------------------
// Interface: pad_if 
//------------------------------------------------------------------------------

interface pad_if( input bit clk);
    logic [`PAD_GRP0_IN_NUM-1:0]      pad_grp0_in;
    logic [`PAD_GRP0_OUT_NUM-1:0]     pad_grp0_out;
    logic [`PAD_GRP0_INOUT_NUM-1:0]   pad_grp0_inout;
    
    logic [`PAD_GRP1_IN_NUM-1:0]      pad_grp1_in;
    logic [`PAD_GRP1_OUT_NUM-1:0]     pad_grp1_out;
    logic [`PAD_GRP1_INOUT_NUM-1:0]   pad_grp1_inout;
    modport driver_mp(input pad_grp0_out, output  pad_grp0_in, inout  pad_grp0_inout,input  pad_grp1_out, output  pad_grp1_in, inout  pad_grp1_inout);    
    modport dut_mp(output pad_grp0_out, input  pad_grp0_in, inout  pad_grp0_inout,output pad_grp1_out, input  pad_grp1_in, inout  pad_grp1_inout);    
 endinterface: pad_if

//------------------------------------------------------------------------------
// Interface: jtag_if 
//------------------------------------------------------------------------------

interface jtag_if( input bit tck, input bit trst);
    logic tdi;
    logic tdo;
    logic tms;
    logic read_not_write;

    clocking negedge_cb @ ( negedge tck);
        //default output #3ns;
       output tdi;
       output tms;
       output read_not_write;
    endclocking: negedge_cb 

    clocking posedge_cb @ ( posedge tck);
       input  tdo;
    endclocking: posedge_cb 

    clocking monitor_cb @ ( posedge tck );
        input tdi;
        input tdo;
        input tms;
        input read_not_write;
    endclocking: monitor_cb
    modport master_mp( input trst, clocking negedge_cb, clocking posedge_cb );
    modport slave_mp ( input tdi, tms, output tdo);
    modport monitor_mp ( input trst, clocking monitor_cb);
    
 endinterface: jtag_if

//------------------------------------------------------------------------------
// Interface: clk_if 
//------------------------------------------------------------------------------

interface clk_if( );
   logic clk;
   modport driver_mp(output clk); 
   modport dut_mp(input clk); 
endinterface: clk_if


//------------------------------------------------------------------------------
// Interface: reset_if 
//------------------------------------------------------------------------------

interface reset_if( input bit tck);
   logic trst;
   logic RESET_L;

    clocking posedge_cb @ ( posedge tck);
       output trst;
       output RESET_L;
    endclocking: posedge_cb 
    modport dut_mp(input trst, RESET_L);
    modport driver_mp(clocking posedge_cb);
endinterface: reset_if



