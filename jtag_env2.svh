//---------------------------------------------------------------------------
// Class: pad_sequencer
//---------------------------------------------------------------------------
typedef uvm_sequencer #(pad_rw_transaction) pad_sequencer;

//---------------------------------------------------------------------------
// Class: pad_driver
//---------------------------------------------------------------------------
class pad_driver extends uvm_driver#( pad_rw_transaction);
   `uvm_component_utils( pad_driver )
   
   string                  report_id = "pad_driver";
   virtual pad_if          pad_vi;
   bit                     gen_stil_file;
   pad_configuration       pad_cfg; 
   uvm_analysis_port #(stil_info_transaction)      pad_drv_ap;

   function new( string name, uvm_component parent );
      super.new( name, parent );
   endfunction: new
   
   function void build_phase( uvm_phase phase );
      super.build_phase( phase );
      pad_drv_ap = new("pad_drv_ap", this );
      pad_cfg = pad_configuration::type_id::create(.name("pad_cfg"));
      assert(uvm_config_db#(pad_configuration)::get ( .cntxt( this ), .inst_name( "*" ), .field_name( "pad_cfg" ), .value( this.pad_cfg) ));
      gen_stil_file = pad_cfg.gen_stil_file;
      pad_vi = pad_cfg.pad_vi;
   endfunction: build_phase

   task run_phase( uvm_phase phase );
      pad_rw_transaction      pad_tx;
     logic[1:0]                   temp_data = 3;
     pad_vi.driver_mp.pad_grp0_in[0] <= 1'bz;
     pad_vi.driver_mp.pad_grp0_in[1] <= 1'b1;
      //forever begin
         seq_item_port.get_next_item( pad_tx );
         //@(posedge pad_vi.clk);
        #20;
         if(pad_tx.grp_num == 0)begin
           //foreach(pad_tx.in_data_queue[i]) begin
            // temp_data = pad_tx.in_data_queue[$-i];
             $display("temp_data = %b",temp_data);
             //pad_vi.driver_mp.pad_grp0_in[i] <= temp_data;
           //end
             //pad_vi.driver_mp.pad_grp0_in <= temp_data;
           pad_vi.driver_mp.pad_grp0_in[0] <= 1'b0;
           pad_vi.driver_mp.pad_grp0_in[1] <= 1'b0;
            foreach(pad_tx.exp_out_data_queue[i])begin
               if(pad_tx.exp_out_data_queue[$-i] !== 1'bx) pad_tx.out_data_queue.push_front(pad_vi.driver_mp.pad_grp0_out[i]);
               else pad_tx.out_data_queue.push_front(1'bx);
            end
            
            foreach(pad_tx.inout_data_queue[i])begin
               //in dir mode. need drive
              //if(pad_tx.inout_data_queue[$-i] !== 1'bx) pad_vi.driver_mp.pad_grp0_inout[i] <= pad_tx.inout_data_queue.pop_back;
            end
            
            foreach(pad_tx.exp_inout_data_queue[i])begin
               pad_tx.inout_data_queue.delete();
               if(pad_tx.exp_inout_data_queue[$-i] !== 1'bx) pad_tx.inout_data_queue.push_front(pad_vi.driver_mp.pad_grp0_inout[i]);
               else pad_tx.inout_data_queue.push_front(1'bx);
            end
            
         end// if(pad_tx.grp_num == 0)begin
	      seq_item_port.item_done();
      //end//forever
   endtask: run_phase
endclass: pad_driver
//---------------------------------------------------------------------------
// Class: pad_agent
//---------------------------------------------------------------------------

class pad_agent extends uvm_agent;
   `uvm_component_utils( pad_agent )
   
   function new( string name, uvm_component parent );
      super.new( name, parent );
   endfunction: new

   //handles for agent's components
   pad_sequencer               pad_sqr;
   pad_driver                  pad_drv;
   //handles for monitor's analysis port
   //uvm_analysis_port#( pad_transaction ) pad_ap;

   function void build_phase( uvm_phase phase );
      super.build_phase( phase );
	   
      pad_sqr = pad_sequencer::type_id::create(.name( "pad_sqr" ), .parent(this));
      pad_drv = pad_driver::type_id::create   (.name( "pad_drv" ), .parent(this));
      //pad_ap = new( .name("pad_ap"), .parent(this) );
   endfunction: build_phase

   function void connect_phase( uvm_phase phase );
      pad_drv.seq_item_port.connect(pad_sqr.seq_item_export);
   endfunction: connect_phase
endclass:pad_agent
//---------------------------------------------------------------------------
// Class: reset_driver
//---------------------------------------------------------------------------
class reset_driver extends uvm_driver#( jtag_transaction );
   `uvm_component_utils( reset_driver )
   
   virtual reset_if          reset_vi;

   bit                       gen_stil_file;
   reset_configuration       reset_cfg; 
   uvm_analysis_port #(stil_info_transaction)      reset_drv_ap;
   stil_info_transaction     stil_info_tx;

   function new( string name, uvm_component parent );
      super.new( name, parent );
   endfunction: new
   
   function void build_phase( uvm_phase phase );
      super.build_phase( phase );
      reset_drv_ap = new("reset_drv_ap", this );
      reset_cfg = reset_configuration::type_id::create(.name("reset_cfg"));
      assert(uvm_config_db#(reset_configuration)::get ( .cntxt( this ), .inst_name( "*" ), .field_name( "reset_cfg" ), .value( this.reset_cfg) ));
      
      gen_stil_file = reset_cfg.gen_stil_file;
      reset_vi = reset_cfg.reset_vi;
   endfunction: build_phase
   
   function void call_stil_gen (bit gen_stil_file, bit trst, bit RESET_L,string comment_str = "");
      if(gen_stil_file == `ON) begin
         stil_info_tx = stil_info_transaction::type_id::create("stil_info_tx");
         stil_info_tx.stil_info = $sformatf({"TRST = %0b; RESET_L = %0b;"},trst,RESET_L);
         stil_info_tx.comment_info = comment_str;
         stil_info_tx.time_stamp = $time;
         //`uvm_info("reset_drv",stil_info_tx.convert2string,UVM_NONE);
         reset_drv_ap.write(stil_info_tx);
      end
   endfunction :call_stil_gen


   task run_phase( uvm_phase phase );
         call_stil_gen(gen_stil_file,0,0);
         @reset_vi.driver_mp.posedge_cb;
         reset_vi.driver_mp.posedge_cb.trst <= 1'b1;
         call_stil_gen(gen_stil_file,1,0);
         
         repeat (3) @reset_vi.driver_mp.posedge_cb;
         reset_vi.driver_mp.posedge_cb.trst <= 1'b0;
         reset_vi.driver_mp.posedge_cb.RESET_L<= 1'b0;
         call_stil_gen(gen_stil_file,0,0);
         
         @reset_vi.driver_mp.posedge_cb;
         reset_vi.driver_mp.posedge_cb.RESET_L<= 1'b1;
         call_stil_gen(gen_stil_file,0,1);
   endtask: run_phase
endclass: reset_driver

//---------------------------------------------------------------------------
// Class: clk_driver_base
//---------------------------------------------------------------------------
//class clk_driver_base #(type configuration = clk_configuration_base, string clk_name) extends uvm_driver#( jtag_transaction );
class clk_driver_base #(type configuration = clk_configuration_base) extends uvm_driver;
    
   typedef clk_driver_base #(configuration) this_type;

   typedef configuration     cfg_type;

   virtual clk_if            clk_vi;

   bit                       gen_stil_file;
   bit                       free_running;
   bit                       stop_clk;
   bit                       clk_is_high;
   int                       half_period;
   cfg_type                  clk_cfg; 
  
   int unsigned              total_time,lcm,tck_cycle_cnt,delta;
   clk_wave_description      clk_wave_desc;

   `uvm_component_utils( this_type )
   
   uvm_analysis_port #(stil_info_transaction) clk_drv_ap;
   stil_info_transaction     stil_info_tx;
   
   function new( string name, uvm_component parent );
      super.new( name, parent );
   endfunction: new
   
   function void build_phase( uvm_phase phase );
      super.build_phase( phase );
      
      clk_drv_ap = new({"clk_drv_ap"}, this);
      clk_wave_desc = new("clk_wave_desc");
      clk_cfg = cfg_type::type_id::create(.name("clk_cfg"));
      assert(uvm_config_db#(cfg_type)::get ( .cntxt( this ), .inst_name( "*" ), .field_name( "clk_cfg"), .value( this.clk_cfg) ));
      
      gen_stil_file = clk_cfg.gen_stil_file;
      half_period = clk_cfg.half_period;
      free_running = clk_cfg.free_running;
      clk_vi = clk_cfg.clk_vi;
   endfunction: build_phase
   
   virtual function void call_stil_gen (bit gen_stil_file, int wave_char, string comment_str = {""});
      if(gen_stil_file == `ON) begin
         stil_info_tx = stil_info_transaction::type_id::create("stil_info_tx");
         stil_info_tx.stil_info = $sformatf({"%s = %0d;"},clk_cfg.pad_name, wave_char);
         stil_info_tx.comment_info = comment_str;
         stil_info_tx.time_stamp = $time;
         //`uvm_info("clk_drv",stil_info_tx.convert2string,UVM_NONE);
         clk_drv_ap.write(stil_info_tx);
      end

   endfunction :call_stil_gen

   function int unsigned lcm_cal(int unsigned a, int unsigned b);
      int unsigned c,temp;
      temp = a*b;
      while(a!=0) begin
         c = a;
         a = b%a;
         b = c;
      end
      return temp/b;
   endfunction: lcm_cal
   
   task run_phase( uvm_phase phase );
      assert(uvm_config_db#(cfg_type)::get ( .cntxt( this ), .inst_name( "*" ), .field_name( "clk_cfg"), .value( this.clk_cfg) ));
      clk_vi = clk_cfg.clk_vi;

      lcm = lcm_cal(half_period,`TCK_HALF_PERIOD);
      
      //`uvm_info("clk_driver_base",$sformatf("lcm = %0d",lcm),UVM_NONE);
      
      clk_wave_desc.array_size = (lcm / `TCK_HALF_PERIOD)+1;
      clk_wave_desc.wave_desc = new[clk_wave_desc.array_size];
      clk_wave_desc.wave_desc[0] = "'0ns' D;";
      
      //`uvm_info("clk_driver_base",clk_wave_desc.convert2string,UVM_NONE);
      //generate clk wave description
      clk_wave_desc_init();

      //store clk_wave_desc 
      clk_cfg.clk_wave_desc = clk_wave_desc;
      //$cast(clk_cfg.clk_wave_desc, clk_wave_desc.clone());
      
      uvm_config_db#(cfg_type)::set ( .cntxt( this ), .inst_name( "*" ), .field_name( "clk_cfg"), .value( this.clk_cfg) );
      clk_vi.clk = 0;
      
      forever begin
         if(free_running) begin
            generate_clk;
         end
         else begin
            assert(uvm_config_db#(cfg_type)::get ( .cntxt( this ), .inst_name( "*" ), .field_name( "clk_cfg"), .value( this.clk_cfg) ));
            stop_clk = clk_cfg.stop_clk;
            if(stop_clk) begin
               #half_period; 
               #half_period; 
            end
            else begin
               generate_clk;
            end
         end
      end
   endtask: run_phase 
   
   function void clk_wave_desc_init();
      total_time = 0;
      tck_cycle_cnt = 0;
      clk_is_high = 0;

      $sformat(clk_wave_desc.wave_desc[tck_cycle_cnt+1],"%s '%0dns' %s;", clk_wave_desc.wave_desc[tck_cycle_cnt+1], (total_time % (`TCK_HALF_PERIOD * 2)), (clk_is_high == 0) ? "D" : "U");
      while(total_time < lcm*2) begin
         

         if(total_time + half_period >= (`TCK_HALF_PERIOD * 2 * (tck_cycle_cnt + 1))) begin
            delta = `TCK_HALF_PERIOD*2*(tck_cycle_cnt+1) - total_time;
            
            tck_cycle_cnt = tck_cycle_cnt + 1;
            total_time = total_time + delta;
            
            //`uvm_info("clk_driver_base",$sformatf("total_time = %0d, tck_cycle_cnt = %0d", total_time, tck_cycle_cnt),UVM_NONE);
            
            $sformat(clk_wave_desc.wave_desc[tck_cycle_cnt+1],"%s '%0dns' %s;", clk_wave_desc.wave_desc[tck_cycle_cnt+1], (total_time % (`TCK_HALF_PERIOD * 2)), (clk_is_high == 0) ? "D" : "U");
            if(delta != 0) begin
               clk_is_high = ~clk_is_high;
               total_time = total_time + half_period - delta;
            
               //`uvm_info("clk_driver_base",$sformatf("total_time = %0d, tck_cycle_cnt = %0d", total_time, tck_cycle_cnt),UVM_NONE);
               $sformat(clk_wave_desc.wave_desc[tck_cycle_cnt+1],"%s '%0dns' %s;", clk_wave_desc.wave_desc[tck_cycle_cnt+1], (total_time % (`TCK_HALF_PERIOD * 2)), (clk_is_high == 0) ? "D" : "U");
            end
            //`uvm_info("clk_driver_base",clk_wave_desc.convert2string,UVM_NONE);
         end// if(total_time + half_period <= (`TCK_HALF_PERIOD * 2 * tck_cycle_cnt)) begin
         else begin
            clk_is_high = ~clk_is_high;
            total_time = total_time + half_period;
            
            //`uvm_info("clk_driver_base",$sformatf("total_time = %0d, tck_cycle_cnt = %0d", total_time, tck_cycle_cnt),UVM_NONE);
            $sformat(clk_wave_desc.wave_desc[tck_cycle_cnt+1],"%s '%0dns' %s;", clk_wave_desc.wave_desc[tck_cycle_cnt+1], (total_time % (`TCK_HALF_PERIOD * 2)), (clk_is_high == 0) ? "D" : "U");

            //`uvm_info("clk_driver_base",clk_wave_desc.convert2string,UVM_NONE);
         end// !if(total_time + half_period <= (`TCK_HALF_PERIOD * 2 * tck_cycle_cnt)) begin
      end// while(total_time < lcm*2) begin

   endfunction: clk_wave_desc_init

   task generate_clk;
      total_time = 0;
      tck_cycle_cnt = 0;

      //call_stil_gen(gen_stil_file,tck_cycle_cnt);

      while(total_time < lcm*2) begin
         
         if(total_time + half_period >= (`TCK_HALF_PERIOD * 2 * (tck_cycle_cnt + 1))) begin
            delta = `TCK_HALF_PERIOD*2*(tck_cycle_cnt + 1) - total_time;
            
            tck_cycle_cnt = tck_cycle_cnt + 1;
            call_stil_gen(gen_stil_file,tck_cycle_cnt);

            if(delta != 0) begin
               #half_period;
               clk_vi.clk = ~clk_vi.clk;
               total_time = total_time + half_period;
            end
         end// if(total_time + half_period <= (`TCK_HALF_PERIOD * 2 * tck_cycle_cnt)) begin
         else begin
            #half_period clk_vi.clk = ~clk_vi.clk;
            total_time = total_time + half_period;
         end// !if(total_time + half_period <= (`TCK_HALF_PERIOD * 2 * tck_cycle_cnt)) begin
      end// while(total_time < lcm*2) begin
   endtask: generate_clk
endclass: clk_driver_base

//---------------------------------------------------------------------------
// Class: TCK_clk_driver
//---------------------------------------------------------------------------
class TCK_clk_driver extends uvm_driver;
   `uvm_component_utils( TCK_clk_driver )
   
   virtual clk_if          clk_vi;

   bit                       gen_stil_file;
   bit                       stop_tck;
   int                       tck_half_period;
   TCK_clk_configuration     clk_cfg; 

   clk_wave_description      clk_wave_desc;
   uvm_analysis_port #(stil_info_transaction) clk_drv_ap;
   stil_info_transaction     stil_info_tx;
   function new( string name, uvm_component parent );
      super.new( name, parent );
   endfunction: new
   
   function void build_phase( uvm_phase phase );
      super.build_phase( phase );
      
      clk_drv_ap = new("clk_drv_ap ", this);
      clk_cfg = TCK_clk_configuration::type_id::create(.name("clk_cfg"));
      clk_wave_desc = new("clk_wave_desc");
      assert(uvm_config_db#(TCK_clk_configuration)::get ( .cntxt( this ), .inst_name( "*" ), .field_name( "clk_cfg" ), .value( this.clk_cfg) ));
      
      gen_stil_file = clk_cfg.gen_stil_file;
      tck_half_period = clk_cfg.half_period;
      clk_vi = clk_cfg.clk_vi;
   endfunction: build_phase
   
   function void call_stil_gen (bit gen_stil_file, string comment_str = {""});
      if(gen_stil_file == `ON) begin
         stil_info_tx = stil_info_transaction::type_id::create("stil_info_tx");
         stil_info_tx.stil_info = $sformatf({"TCK = %0b; "},clk_vi.clk);
         stil_info_tx.comment_info = comment_str;
         stil_info_tx.time_stamp = $time;
         //`uvm_info("clk_drv",stil_info_tx.convert2string,UVM_NONE);
         clk_drv_ap.write(stil_info_tx);
      end
   endfunction :call_stil_gen


   task run_phase( uvm_phase phase );
      clk_wave_desc.wave_desc = new[2];
      clk_wave_desc.wave_desc[0] = "{'0ns' D;}"; 
      clk_wave_desc.wave_desc[1] = "{'0ns' U;}"; 
      clk_cfg.clk_wave_desc = clk_wave_desc;
      uvm_config_db#(TCK_clk_configuration)::set ( .cntxt( this ), .inst_name( "*" ), .field_name( "clk_cfg"), .value( this.clk_cfg) );
      
      clk_vi.clk = 0;
      call_stil_gen(gen_stil_file);
      //#tck_half_period;
      forever begin
        #tck_half_period;
        clk_vi.clk = ~clk_vi.clk; 
        call_stil_gen(gen_stil_file);
      end
   endtask: run_phase
endclass: TCK_clk_driver

//---------------------------------------------------------------------------
// Class: SYSCLK_clk_driver
//---------------------------------------------------------------------------

//typedef clk_driver_base#(SYSCLK_clk_configuration) SYSCLK_clk_driver; 
class SYSCLK_clk_driver extends clk_driver_base #(SYSCLK_clk_configuration);
   `uvm_component_utils( SYSCLK_clk_driver)
   function new( string name, uvm_component parent );
      super.new( name, parent );
   endfunction: new
  
   virtual function void call_stil_gen (bit gen_stil_file, int wave_char, string comment_str = {""});
      if(gen_stil_file == `ON) begin
         stil_info_tx = stil_info_transaction::type_id::create("stil_info_tx");
         if(wave_char == `CLK_STOP_LOW)
            stil_info_tx.stil_info = $sformatf({"%s = 0;"},clk_cfg.pad_name);
         else
            stil_info_tx.stil_info = $sformatf({"%s = %0d;"},clk_cfg.pad_name,wave_char);
         stil_info_tx.comment_info = comment_str;
         stil_info_tx.time_stamp = $time;
         //`uvm_info("clk_drv",stil_info_tx.convert2string,UVM_NONE);
         clk_drv_ap.write(stil_info_tx);
      end

   endfunction :call_stil_gen


endclass: SYSCLK_clk_driver 

//---------------------------------------------------------------------------
// Class: jtag_driver
//---------------------------------------------------------------------------

class jtag_driver extends uvm_driver#( jtag_transaction );
   `uvm_component_utils( jtag_driver )
   
   uvm_analysis_port #(stil_info_transaction)   jtag_drv_ap; 
   virtual jtag_if         jtag_vi;
   string                  report_id = "jtag_driver";
   bit                     gen_stil_file;
   string                  stil_file_name;
   int                     tck_half_period;
   jtag_configuration      jtag_cfg;
   stil_info_transaction   stil_info_tx;

   function new( string name, uvm_component parent );
      super.new( name, parent );
   endfunction: new

   function void build_phase( uvm_phase phase );
      super.build_phase( phase );
      jtag_drv_ap = new("jtag_drv_ap ", this);

      jtag_cfg = jtag_configuration::type_id::create( .name( "jtag_cfg" ) );
      assert(uvm_config_db#(jtag_configuration)::get ( .cntxt( this ), .inst_name( "*" ), .field_name( "jtag_cfg" ), .value( this.jtag_cfg) ));

      `uvm_info(report_id,jtag_cfg.convert2string,UVM_DEBUG);
      gen_stil_file = jtag_cfg.gen_stil_file;
      stil_file_name = jtag_cfg.stil_file_name;
      tck_half_period = jtag_cfg.tck_half_period;
      jtag_vi = jtag_cfg.jtag_vi;
   endfunction: build_phase
  
   function void call_stil_gen (bit gen_stil_file, bit[1:0] tms = 1'bx, bit[1:0] tdi = 1'bx, bit[1:0] tdo = "X",string comment_str = {""});
      string tdi_wave_char,tms_wave_char,tdo_wave_char;
      
      if(tdo == 0) tdo_wave_char = "L";
      else if(tdo == 1) tdo_wave_char = "H";
      else tdo_wave_char = "x";

      if(tdi == 0) tdi_wave_char = "0";
      else if(tdi == 1) tdi_wave_char = "1";
      else tdi_wave_char = "x";
      
      if(tms == 0) tms_wave_char = "0";
      else if(tms == 1) tms_wave_char = "1";
      else tms_wave_char = "x";

      if(gen_stil_file == `ON) begin
         stil_info_tx = stil_info_transaction::type_id::create("stil_info_tx");
         stil_info_tx.stil_info = $sformatf({"TMS = %s; TDI = %s; TDO = %s;"},tms_wave_char,tdi_wave_char,tdo_wave_char);
         stil_info_tx.comment_info = comment_str;
         stil_info_tx.time_stamp = $time;
         //`uvm_info("jtag_drv",stil_info_tx.convert2string,UVM_NONE);
         
         jtag_drv_ap.write(stil_info_tx);
      end
   endfunction :call_stil_gen

   task run_phase( uvm_phase phase );
      jtag_transaction  jtag_tx;

      string            fsm_nstate;
      string            stil_str;
      string            comment_str;
      //int               stil_fd;
      logic[1:0]        stil_tms = 1'b1, stil_tdi = 3, stil_tdo = 3;
      jtag_vi.master_mp.negedge_cb.tms <= 1;
      
      stil_tms = 1'b1;
      call_stil_gen(gen_stil_file,stil_tms,stil_tdi,stil_tdo);
     
      @(negedge jtag_vi.master_mp.trst);
      forever begin
         seq_item_port.get_next_item( jtag_tx );
         `uvm_info( "jtag_tx", { "\n",jtag_tx.convert2string() }, UVM_LOW );
         ////take jtag fsm into test_logic_reset state
         //for(int i = 0; i < 5; i ++) begin
         //   @jtag_vi.master_mp.posedge_cb;
         //   jtag_vi.master_mp.negedge_cb.tms <= 1;
         //end
     
         //take jtag fsm into run_test_idle state
         @jtag_vi.master_mp.negedge_cb;
         jtag_vi.master_mp.negedge_cb.tms <= 0;

         fsm_nstate = "take jtag fsm into run_test_idle state ";
         `uvm_info( "jtag_driver", { fsm_nstate }, UVM_DEBUG );

         stil_tms = 0;
         call_stil_gen(gen_stil_file,stil_tms,stil_tdi,stil_tdo,fsm_nstate);
         
         //read_not_write is used for monitor only
         @jtag_vi.master_mp.negedge_cb;
         jtag_vi.master_mp.negedge_cb.read_not_write <= jtag_tx.read_not_write;


         //take jtag fsm into select_dr_scan state
         jtag_vi.master_mp.negedge_cb.tms <= 1;
         
         fsm_nstate = "take jtag fsm into select_dr_scan state ";
         `uvm_info( "jtag_driver", { fsm_nstate }, UVM_DEBUG );
         
         stil_tms = 1;
         call_stil_gen(gen_stil_file,stil_tms,stil_tdi,stil_tdo,fsm_nstate);
         
         //take jtag fsm into select_ir_scan state
         @jtag_vi.master_mp.negedge_cb;
         jtag_vi.master_mp.negedge_cb.tms <= 1;
         
         fsm_nstate = "take jtag fsm into select_ir_scan state ";
         `uvm_info( "jtag_driver", { fsm_nstate }, UVM_DEBUG );
         
         stil_tms = 1;
         call_stil_gen(gen_stil_file,stil_tms,stil_tdi,stil_tdo,fsm_nstate);
                  
         //take jtag fsm into capture_ir state
         @jtag_vi.master_mp.negedge_cb;
         jtag_vi.master_mp.negedge_cb.tms <= 0;
         fsm_nstate = "take jtag fsm into capture_ir state ";
         `uvm_info( "jtag_driver", { fsm_nstate }, UVM_DEBUG );
         
         stil_tms = 0;
         call_stil_gen(gen_stil_file,stil_tms,stil_tdi,stil_tdo,fsm_nstate);

         //take jtag fsm into shift_ir state
         @jtag_vi.master_mp.negedge_cb;
         fsm_nstate = $sformatf("take jtag fsm into shift_ir state");
         `uvm_info( "jtag_driver", { fsm_nstate }, UVM_DEBUG );
         jtag_vi.master_mp.negedge_cb.tms <= 0; 

         stil_tms = 0;
         call_stil_gen(gen_stil_file,stil_tms,stil_tdi,stil_tdo,fsm_nstate);
 
         for(int i = 0; i < jtag_tx.o_ir_length-1; i ++) begin
            @jtag_vi.master_mp.negedge_cb;
            
            fsm_nstate = $sformatf("shift_count = %0d", i);
            `uvm_info( "jtag_driver", { fsm_nstate }, UVM_DEBUG );
            
            //stimulus part
            jtag_vi.master_mp.negedge_cb.tms <= 0;
            jtag_vi.master_mp.negedge_cb.tdi <= jtag_tx.o_ir[i];
           

            //STIL part
            stil_tms = 0;
            stil_tdi = jtag_tx.o_ir[i];
            call_stil_gen(gen_stil_file,stil_tms,stil_tdi,stil_tdo,fsm_nstate);
            
            @jtag_vi.master_mp.posedge_cb;
            if(jtag_tx.chk_ir_tdo)begin
               if(jtag_tx.exp_tdo_ir_queue[i] != jtag_vi.master_mp.posedge_cb.tdo) 
                  `uvm_error("jtag_driver",$sformatf("jtag_tx.exp_tdo_ir_queue[%0d] = %0b differs with current tdo[%b]",i,jtag_tx.exp_tdo_ir_queue[i],jtag_vi.master_mp.posedge_cb.tdo))
               if(jtag_tx.exp_tdo_ir_queue[i])  stil_tdo = 1;
               else stil_tdo = 0;
            end
            else stil_tdo = 3;
           
            call_stil_gen(gen_stil_file,stil_tms,stil_tdi,stil_tdo);

         end //for(int i = 0; i < jtag_tx.o_ir_length-1; i ++) begin

         //take jtag fsm into exit1_ir state
         @jtag_vi.master_mp.negedge_cb;
         
         fsm_nstate = "take jtag fsm into exit1_ir state ";
         `uvm_info( "jtag_driver", { fsm_nstate }, UVM_DEBUG );
         
         //stimulus part
         jtag_vi.master_mp.negedge_cb.tms <= 1;
         jtag_vi.master_mp.negedge_cb.tdi <= jtag_tx.o_ir[jtag_tx.o_ir_length-1];
         
         //STIL part
         stil_tms = 1;
         stil_tdi = jtag_tx.o_ir[jtag_tx.o_ir_length-1];
         call_stil_gen(gen_stil_file,stil_tms,stil_tdi,stil_tdo,fsm_nstate);
         
         @jtag_vi.master_mp.posedge_cb;
         if(jtag_tx.chk_ir_tdo)begin
            if(jtag_tx.exp_tdo_ir_queue[jtag_tx.o_ir_length-1] != jtag_vi.master_mp.posedge_cb.tdo) 
               `uvm_error("jtag_driver",$sformatf("jtag_tx.exp_tdo_ir_queue[%0d] = %0b differs with current tdo[%b]",jtag_tx.o_ir_length-1,jtag_tx.exp_tdo_ir_queue[jtag_tx.o_ir_length-1],jtag_vi.master_mp.posedge_cb.tdo))
            if(jtag_tx.exp_tdo_ir_queue[jtag_tx.o_ir_length-1])  stil_tdo = 1;
            else stil_tdo = 0;
         end
         else stil_tdo = 3;
         
         call_stil_gen(gen_stil_file,stil_tms,stil_tdi,stil_tdo);
         stil_tdo = 3;
         //take jtag fsm into update_ir state
         @jtag_vi.master_mp.negedge_cb;
         jtag_vi.master_mp.negedge_cb.tms <= 1;
         fsm_nstate = "take jtag fsm into update_ir state ";
         `uvm_info( "jtag_driver", { fsm_nstate }, UVM_DEBUG );
         
         stil_tms = 1;
         call_stil_gen(gen_stil_file,stil_tms,stil_tdi,stil_tdo,fsm_nstate);

         //take jtag fsm into select_dr_scan state
         @jtag_vi.master_mp.negedge_cb;
         jtag_vi.master_mp.negedge_cb.tms <= 1;
         fsm_nstate = "take jtag fsm into select_dr_scan state ";
         `uvm_info( "jtag_driver", { fsm_nstate }, UVM_DEBUG );
         
         stil_tms = 1;
         call_stil_gen(gen_stil_file,stil_tms,stil_tdi,stil_tdo,fsm_nstate);
         
         //take jtag fsm into capture_dr state
         @jtag_vi.master_mp.negedge_cb;
         jtag_vi.master_mp.negedge_cb.tms <= 0;
         fsm_nstate = "take jtag fsm into capture_dr state ";
         `uvm_info( "jtag_driver", { fsm_nstate }, UVM_DEBUG );
         
         stil_tms = 0;
         call_stil_gen(gen_stil_file,stil_tms,stil_tdi,stil_tdo,fsm_nstate);

          //take jtag fsm into shift_dr state
         @jtag_vi.master_mp.negedge_cb;
         fsm_nstate = $sformatf("take jtag fsm into shift_dr state");
         `uvm_info( "jtag_driver", { fsm_nstate }, UVM_DEBUG );
         jtag_vi.master_mp.negedge_cb.tms <= 0; 

         stil_tms = 0;
         call_stil_gen(gen_stil_file,stil_tms,stil_tdi,stil_tdo,fsm_nstate);
 
         for(int i = 0; i < jtag_tx.o_dr_length-1; i ++) begin
            @jtag_vi.master_mp.negedge_cb;
            
            fsm_nstate = $sformatf("shift_count = %0d", i);
            `uvm_info( "jtag_driver", { fsm_nstate }, UVM_DEBUG );
            
            //stimulus part
            jtag_vi.master_mp.negedge_cb.tms <= 0;
            jtag_vi.master_mp.negedge_cb.tdi <= jtag_tx.o_dr[i];
           

            //STIL part
            stil_tms = 0;
            stil_tdi = jtag_tx.o_dr[i];
            call_stil_gen(gen_stil_file,stil_tms,stil_tdi,stil_tdo,fsm_nstate);
            
            @jtag_vi.master_mp.posedge_cb;
            if(jtag_tx.chk_dr_tdo)begin
               if(jtag_tx.exp_tdo_dr_queue[i] != jtag_vi.master_mp.posedge_cb.tdo) 
                  `uvm_error("jtag_driver",$sformatf("jtag_tx.exp_tdo_dr_queue[%0d] = %0b differs with current tdo[%b]",i,jtag_tx.exp_tdo_dr_queue[i],jtag_vi.master_mp.posedge_cb.tdo))
               if(jtag_tx.exp_tdo_dr_queue[i])  stil_tdo = 1;
               else stil_tdo = 0;
            end
            else stil_tdo = 3;
           
            call_stil_gen(gen_stil_file,stil_tms,stil_tdi,stil_tdo);

         end //for(int i = 0; i < jtag_tx.o_dr_length-1; i ++) begin

         //take jtag fsm into exit1_dr state
         @jtag_vi.master_mp.negedge_cb;
         
         fsm_nstate = "take jtag fsm into exit1_dr state ";
         `uvm_info( "jtag_driver", { fsm_nstate }, UVM_DEBUG );
         
         //stimulus part
         jtag_vi.master_mp.negedge_cb.tms <= 1;
         jtag_vi.master_mp.negedge_cb.tdi <= jtag_tx.o_dr[jtag_tx.o_dr_length-1];
         
         //STIL part
         stil_tms = 1;
         stil_tdi = jtag_tx.o_dr[jtag_tx.o_dr_length-1];
         call_stil_gen(gen_stil_file,stil_tms,stil_tdi,stil_tdo,fsm_nstate);
         
         @jtag_vi.master_mp.posedge_cb;
         if(jtag_tx.chk_dr_tdo)begin
            if(jtag_tx.exp_tdo_dr_queue[jtag_tx.o_dr_length-1] != jtag_vi.master_mp.posedge_cb.tdo) 
               `uvm_error("jtag_driver",$sformatf("jtag_tx.exp_tdo_dr_queue[%0d] = %0b differs with current tdo[%b]",jtag_tx.o_dr_length-1,jtag_tx.exp_tdo_dr_queue[jtag_tx.o_dr_length-1],jtag_vi.master_mp.posedge_cb.tdo))
            if(jtag_tx.exp_tdo_dr_queue[jtag_tx.o_dr_length-1])  stil_tdo = 1;
            else stil_tdo = 0;
         end
         else stil_tdo = 3;
         
         call_stil_gen(gen_stil_file,stil_tms,stil_tdi,stil_tdo);
         stil_tdo = 3;
     
         //take jtag fsm into update_dr state
         @jtag_vi.master_mp.negedge_cb;
         jtag_vi.master_mp.negedge_cb.tms <= 1;
         fsm_nstate = "take jtag fsm into update_dr state ";
         `uvm_info( "jtag_driver", { fsm_nstate }, UVM_DEBUG );
          
         stil_tms = 1;
         call_stil_gen(gen_stil_file,stil_tms,stil_tdi,stil_tdo,fsm_nstate);
 
         //take jtag fsm into run_test_idle state
         @jtag_vi.master_mp.negedge_cb;
         jtag_vi.master_mp.negedge_cb.tms <= 0;
         fsm_nstate = "take jtag fsm into run_test_idle state ";
         `uvm_info( "jtag_driver", { fsm_nstate }, UVM_DEBUG );
         
         stil_tms = 1;
         call_stil_gen(gen_stil_file,stil_tms,stil_tdi,stil_tdo,fsm_nstate);
         
         repeat (2) @jtag_vi.master_mp.posedge_cb;
	      seq_item_port.item_done();

      end
   endtask: run_phase
endclass: jtag_driver


//---------------------------------------------------------------------------
// Class: jtag_sequencer
//---------------------------------------------------------------------------
typedef uvm_sequencer #(jtag_transaction) jtag_sequencer;

//------------------------------------------------------------------------------
// Class: ieee_1149_1_reg_adapter
//------------------------------------------------------------------------------

class ieee_1149_1_reg_adapter extends uvm_reg_adapter;
   `uvm_object_utils( ieee_1149_1_reg_adapter )

   function new( string name = "" );
      super.new( name );
      supports_byte_enable = 0;
      provides_responses   = 0;
   endfunction: new

   virtual function uvm_sequence_item reg2bus( const ref uvm_reg_bus_op rw );
      bus_reg_ext             extension;
      uvm_reg_item            item = get_item();
      jtag_transaction        jtag_tx = jtag_transaction::type_id::create("jtag_tx");

      
      if(!$cast(extension,item.extension))
         `uvm_error("reg2bus", "Extension casting failed.")

      if( extension != null ) begin
         jtag_tx.chk_ir_tdo = extension.chk_ir_tdo;
         jtag_tx.chk_dr_tdo = extension.chk_dr_tdo;

         foreach(extension.exp_tdo_ir_q[i])
            jtag_tx.exp_tdo_ir_queue = {jtag_tx.exp_tdo_ir_queue,extension.exp_tdo_ir_q[i]};
         
         foreach(extension.exp_tdo_dr_q[i])
            jtag_tx.exp_tdo_dr_queue = {jtag_tx.exp_tdo_dr_queue,extension.exp_tdo_dr_q[i]};
      end

      //jtag_tx.protocol = IEEE_1149_1;
      jtag_tx.o_ir_length = `IEEE_1149_IR_WIDTH;
      jtag_tx.o_ir = new[jtag_tx.o_ir_length];
      foreach(jtag_tx.o_ir[i]) jtag_tx.o_ir[i] = rw.addr[i];

      jtag_tx.o_dr_length = rw.data[`MAX_DR_WIDTH-1 : 0];
      jtag_tx.o_dr = new[jtag_tx.o_dr_length];
      for( int i = 0; i < jtag_tx.o_dr_length; i++) begin
          jtag_tx.o_dr[i] = rw.data[`MAX_DR_WIDTH + i];
      end
      
      return jtag_tx;
   endfunction: reg2bus

   virtual function void bus2reg( uvm_sequence_item bus_item, ref uvm_reg_bus_op rw );
      jtag_transaction  jtag_tx;
      
      logic queue_comp_rslt = 1;
      
      if ( ! $cast( jtag_tx, bus_item ) ) begin
         `uvm_fatal( get_name(), "bus_item is not of the jtag_transaction type." )
         return;
      end
       
      rw.data[`MAX_DR_WIDTH-1 : 0] = jtag_tx.o_dr_length;
      foreach( jtag_tx.tdo_dr_queue[i] ) begin
          rw.data[`MAX_DR_WIDTH + i] = jtag_tx.tdi_dr_queue[i];
          if( jtag_tx.tdo_dr_queue[i] != jtag_tx.tdi_dr_queue[i] ) queue_comp_rslt = 0; 
      end
      
      rw.addr = 0;
      foreach( jtag_tx.tdi_ir_queue[i] ) begin
          rw.addr[i] = jtag_tx.tdi_ir_queue[i];
      end

      `uvm_info("adapter", {$sformatf("rw.addr=%0h,rw.data=%0h", rw.addr,rw.data)}, UVM_DEBUG);
      rw.kind = ( queue_comp_rslt ) ? UVM_READ : UVM_WRITE;
      rw.status = UVM_IS_OK;
   endfunction: bus2reg
endclass: ieee_1149_1_reg_adapter

//------------------------------------------------------------------------------
// class: jtag_monitor
//------------------------------------------------------------------------------
class jtag_monitor extends uvm_monitor;
   `uvm_component_utils( jtag_monitor )

   virtual jtag_if jtag_vi;
   
   function new( string name, uvm_component parent );
      super.new( name, parent );
   endfunction: new
  
   uvm_analysis_port #(jtag_transaction) jtag_ap;

   function void build_phase( uvm_phase phase );
      super.build_phase( phase );
      //assert(uvm_config_db#( jtag_configuration)::get ( .cntxt( this ), .inst_name( "*" ), .field_name( "jtag_cfg" ), .value( jtag_vi) ));
      //else `uvm_fatal("NOVIF", "Failed to get virtual interfaces form uvm_config_db.\n");
      
      jtag_ap = new( .name("jtag_ap"), .parent(this) );
   endfunction: build_phase

   task run_phase( uvm_phase phase );
      
      ieee_1149_1_fsm_e     c_state;
      jtag_transaction      jtag_tx;
     
      @(negedge jtag_vi.monitor_mp.trst) begin
         c_state = TEST_LOGIC_RESET;
      end
      forever @jtag_vi.monitor_mp.monitor_cb begin
         `uvm_info( "mon",{ "before assignment ",c_state.name }, UVM_DEBUG );
         `uvm_info( "mon",{ $sformatf( "tms = %0b, tdi = %0b", jtag_vi.monitor_mp.monitor_cb.tms, jtag_vi.monitor_mp.monitor_cb.tdi ) }, UVM_DEBUG );
         if( c_state == CAPTURE_IR)begin
            //create a jtag transaction for boradcasting.
            jtag_tx = jtag_transaction::type_id::create( .name("jtag_tx") );
            jtag_tx.o_dr_length = 0;
         end
         
         if( c_state == UPDATE_DR)begin
            jtag_ap.write(jtag_tx);
            `uvm_info("mon",{jtag_tx.print_queue()}, UVM_LOW);
         end

         case (c_state)
            TEST_LOGIC_RESET: begin
               if(jtag_vi.monitor_mp.monitor_cb.tms == 1'b0) c_state = RUN_TEST_IDLE;
            end
            
            RUN_TEST_IDLE: begin
               if(jtag_vi.monitor_mp.monitor_cb.tms == 1'b1) c_state = SELECT_DR_SCAN;
            end
            
            SELECT_DR_SCAN: begin
               if(jtag_vi.monitor_mp.monitor_cb.tms == 1'b1) c_state = SELECT_IR_SCAN;
               else if(jtag_vi.monitor_mp.monitor_cb.tms == 1'b0) c_state = CAPTURE_DR;
            end

            CAPTURE_DR: begin
               if(jtag_vi.monitor_mp.monitor_cb.tms == 1'b1) c_state = EXIT1_DR;
               else if(jtag_vi.monitor_mp.monitor_cb.tms == 1'b0) c_state = SHIFT_DR;
            end
            
            SHIFT_DR: begin
               if(jtag_vi.monitor_mp.monitor_cb.tms == 1'b1) c_state = EXIT1_DR;

               jtag_tx.o_dr_length = jtag_tx.o_dr_length + 1;

               //collects tdi/tdo data 
               jtag_tx.tdi_dr_queue = { jtag_tx.tdi_dr_queue,jtag_vi.monitor_mp.monitor_cb.tdi };
               jtag_tx.tdo_dr_queue = { jtag_tx.tdo_dr_queue,jtag_vi.monitor_mp.monitor_cb.tdo };

            end

            EXIT1_DR: begin
               if(jtag_vi.monitor_mp.monitor_cb.tms == 1'b1) c_state = UPDATE_DR;
               else if(jtag_vi.monitor_mp.monitor_cb.tms == 1'b0) c_state = PAUSE_DR;
            end
            
            PAUSE_DR: begin
               if(jtag_vi.monitor_mp.monitor_cb.tms == 1'b1) c_state = EXIT2_DR;
            end
            
            EXIT2_DR: begin
               if(jtag_vi.monitor_mp.monitor_cb.tms == 1'b1) c_state = UPDATE_DR;
               else if(jtag_vi.monitor_mp.monitor_cb.tms == 1'b0) c_state = SHIFT_DR;
            end
            
            UPDATE_DR: begin
               if(jtag_vi.monitor_mp.monitor_cb.tms == 1'b1) c_state = SELECT_DR_SCAN;
               else if(jtag_vi.monitor_mp.monitor_cb.tms == 1'b0) c_state = RUN_TEST_IDLE;
            end
            
            SELECT_IR_SCAN: begin
               if(jtag_vi.monitor_mp.monitor_cb.tms == 1'b1) c_state = TEST_LOGIC_RESET;
               else if(jtag_vi.monitor_mp.monitor_cb.tms == 1'b0) c_state = CAPTURE_IR;
            end

            CAPTURE_IR: begin
               if(jtag_vi.monitor_mp.monitor_cb.tms == 1'b1) c_state = EXIT1_IR;
               else if(jtag_vi.monitor_mp.monitor_cb.tms == 1'b0) c_state = SHIFT_IR;
            end
            
            SHIFT_IR: begin
               if(jtag_vi.monitor_mp.monitor_cb.tms == 1'b1) c_state = EXIT1_IR;

               //collects tdi/tdo data 
               jtag_tx.tdi_ir_queue = { jtag_tx.tdi_ir_queue,jtag_vi.monitor_mp.monitor_cb.tdi };
               jtag_tx.tdo_ir_queue = { jtag_tx.tdo_ir_queue,jtag_vi.monitor_mp.monitor_cb.tdo };
            end

            EXIT1_IR: begin
               if(jtag_vi.monitor_mp.monitor_cb.tms == 1'b1) c_state = UPDATE_IR;
               else if(jtag_vi.monitor_mp.monitor_cb.tms == 1'b0) c_state = PAUSE_IR;
            end
            
            PAUSE_IR: begin
               if(jtag_vi.monitor_mp.monitor_cb.tms == 1'b1) c_state = EXIT2_IR;
            end
            
            EXIT2_IR: begin
               if(jtag_vi.monitor_mp.monitor_cb.tms == 1'b1) c_state = UPDATE_IR;
               else if(jtag_vi.monitor_mp.monitor_cb.tms == 1'b0) c_state = SHIFT_IR;
            end
            
            UPDATE_IR: begin
               if(jtag_vi.monitor_mp.monitor_cb.tms == 1'b1) c_state = SELECT_DR_SCAN;
               else if(jtag_vi.monitor_mp.monitor_cb.tms == 1'b0) c_state = RUN_TEST_IDLE;
            end   
         endcase
         
         `uvm_info( "mon",{ "after assignment ",c_state.name }, UVM_DEBUG );
      end
   endtask: run_phase    


endclass:jtag_monitor
//---------------------------------------------------------------------------
// Class: jtag_agent
//---------------------------------------------------------------------------

class jtag_agent extends uvm_agent;
   `uvm_component_utils( jtag_agent )
   
   function new( string name, uvm_component parent );
      super.new( name, parent );
   endfunction: new

   //handles for agent's components
   jtag_sequencer               sqr;
   jtag_driver                  drv;
   jtag_monitor                 mon;
   ieee_1149_1_reg_adapter      jtag_reg_adapter; 
   //jtag_config       m_config;

   //configuration knobs
   //localparam OFF = 1'b0, ON = 1'b1;
   
   //handles for monitor's analysis port
   uvm_analysis_port#( jtag_transaction ) jtag_ap;

   function void build_phase( uvm_phase phase );
      super.build_phase( phase );
	   
      sqr = jtag_sequencer::type_id::create(.name( "sqr" ), .parent(this));
      drv = jtag_driver::type_id::create   (.name( "drv" ), .parent(this));
      mon = jtag_monitor::type_id::create  (.name( "mon" ), .parent(this));
      jtag_reg_adapter = ieee_1149_1_reg_adapter::type_id::create  (.name( "jtag_reg_adapter " ), .parent(this));
      
      jtag_ap = new( .name("jtag_ap"), .parent(this) );
   endfunction: build_phase

   function void connect_phase( uvm_phase phase );
      drv.seq_item_port.connect(sqr.seq_item_export);
      mon.jtag_ap.connect(jtag_ap);
   endfunction: connect_phase
endclass:jtag_agent
//---------------------------------------------------------------------------
// Class: stil_generator
//---------------------------------------------------------------------------
class stil_generator extends uvm_subscriber #( stil_info_transaction );
   `uvm_component_utils( stil_generator )

   uvm_analysis_imp_jtag_drv        #(stil_info_transaction, stil_generator) jtag_drv_imp_export;
   uvm_analysis_imp_TCK_clk_drv     #(stil_info_transaction, stil_generator) TCK_clk_drv_imp_export;
   uvm_analysis_imp_SYSCLK_clk_drv  #(stil_info_transaction, stil_generator) SYSCLK_clk_drv_imp_export;
   uvm_analysis_imp_pad_drv         #(stil_info_transaction, stil_generator) pad_drv_imp_export;
   
   bit                        write_to_file; 
   string                     jtag_drv_info;
   string                     clk_drv_info;
   string                     reset_drv_info;
   string                     pad_drv_info;
   
   jtag_configuration         jtag_cfg;
   TCK_clk_configuration      TCK_clk_cfg;
   SYSCLK_clk_configuration   SYSCLK_clk_cfg;
   reset_configuration        reset_cfg;
   
   string                     stil_file_name;
   int                        stil_fd;
   bit                        gen_stil_file; 
   int                        timing_window;
   clk_wave_description       TCK_clk_wave_des;
   clk_wave_description       SYSCLK_clk_wave_des;
   
   stil_info_transaction      pad_stil_info_tx_ping,pad_stil_info_tx_pong;
   stil_info_transaction      reset_stil_info_tx_ping,reset_stil_info_tx_pong;
   stil_info_transaction      TCK_stil_info_tx_ping,TCK_stil_info_tx_pong;
   stil_info_transaction      SYSCLK_stil_info_tx_ping,SYSCLK_stil_info_tx_pong;
   stil_info_transaction      jtag_stil_info_tx_ping,jtag_stil_info_tx_pong;
  
   bit                        pad_ping_data_rdy, pad_pong_data_rdy;
   bit                        jtag_ping_data_rdy, jtag_pong_data_rdy;
   bit                        SYSCLK_ping_data_rdy, SYSCLK_pong_data_rdy;
   bit                        TCK_ping_data_rdy, TCK_pong_data_rdy;
   bit                        reset_ping_data_rdy, reset_pong_data_rdy;
  
   string                     stil_str;
   string                     comment_str;
   semaphore                  pad_sem, jtag_sem, SYSCLK_sem, TCK_sem, reset_sem;
   function new( string name, uvm_component parent );
      super.new( name, parent );
   endfunction: new
   
   function void build_phase(uvm_phase phase);
      super.build_phase( phase );
      
      jtag_drv_imp_export = new("jtag_drv_imp_export", this);
      TCK_clk_drv_imp_export = new("TCK_clk_drv_imp_export", this);
      SYSCLK_clk_drv_imp_export = new("SYSCLK_clk_drv_imp_export", this);
      pad_drv_imp_export = new("pad_drv_imp_export", this);
     
      TCK_clk_wave_des = clk_wave_description::type_id::create( .name("TCK_clk_wave_des"));
      SYSCLK_clk_wave_des = clk_wave_description::type_id::create( .name("SYSCLK_clk_wave_des"));
      
      jtag_cfg = jtag_configuration::type_id::create( .name( "jtag_cfg" ) );
      assert(uvm_config_db#(jtag_configuration)::get ( .cntxt( this ), .inst_name( "*" ), .field_name( "jtag_cfg" ), .value( this.jtag_cfg) ));

      TCK_clk_cfg = TCK_clk_configuration::type_id::create( .name( "TCK_clk_cfg" ) );
      assert(uvm_config_db#(TCK_clk_configuration)::get ( .cntxt( this ), .inst_name( "*" ), .field_name( "clk_cfg" ), .value( this.TCK_clk_cfg) ));

      SYSCLK_clk_cfg = SYSCLK_clk_configuration::type_id::create( .name( "SYSCLK_clk_cfg" ) );
      assert(uvm_config_db#(SYSCLK_clk_configuration)::get ( .cntxt( this ), .inst_name( "*" ), .field_name( "clk_cfg" ), .value( this.SYSCLK_clk_cfg) ));
      
      reset_cfg = reset_configuration::type_id::create( .name( "reset_cfg" ) );
      assert(uvm_config_db#(reset_configuration)::get ( .cntxt( this ), .inst_name( "*" ), .field_name( "reset_cfg" ), .value( this.reset_cfg) ));

      gen_stil_file = jtag_cfg.gen_stil_file;
      stil_file_name = jtag_cfg.stil_file_name;
      timing_window = TCK_clk_cfg.half_period * 2;
      
      pad_sem = new(1);
      jtag_sem = new(1);
      SYSCLK_sem = new(1);
      TCK_sem = new(1);
      reset_sem = new(1);
   endfunction: build_phase
   
   function void write( stil_info_transaction t);
      while(!reset_sem.try_get(1)) `uvm_info("stil_generator","try get semafore",UVM_DEBUG);
      case({reset_ping_data_rdy, reset_pong_data_rdy})
         2'b00: begin
            reset_stil_info_tx_ping = t; 
            reset_ping_data_rdy = 1;
         end
         2'b10: begin
            reset_stil_info_tx_pong = t; 
            reset_pong_data_rdy = 1;
         end
         2'b01: `uvm_error("stil_generator","Illegal data reday combination.")
         2'b11: `uvm_error("stil_generator","Reset ping-pong buffer is full.")
      endcase
      reset_sem.put(1);
   endfunction: write
 
   function void write_jtag_drv( stil_info_transaction t);
      while(!jtag_sem.try_get(1))`uvm_info("stil_generator","try get semafore",UVM_DEBUG);
      case({jtag_ping_data_rdy, jtag_pong_data_rdy})
         2'b00: begin
            jtag_stil_info_tx_ping = t; 
            jtag_ping_data_rdy = 1;
         end
         2'b10: begin
            jtag_stil_info_tx_pong = t; 
            jtag_pong_data_rdy = 1;
         end
         2'b01: `uvm_error("stil_generator","Illegal data reday combination.")
         2'b11: `uvm_error("stil_generator","jtag ping-pong buffer is full.")
      endcase
      jtag_sem.put(1);
   endfunction: write_jtag_drv
   
   function void write_TCK_clk_drv( stil_info_transaction t);
      while(!TCK_sem.try_get(1)) `uvm_info("stil_generator","try get semafore",UVM_DEBUG);
      case({TCK_ping_data_rdy, TCK_pong_data_rdy})
         2'b00: begin
            TCK_stil_info_tx_ping = t; 
            TCK_ping_data_rdy = 1;
         end
         2'b10: begin
            TCK_stil_info_tx_pong = t; 
            TCK_pong_data_rdy = 1;
         end
         2'b01: `uvm_error("stil_generator","Illegal data reday combination.")
         2'b11: `uvm_error("stil_generator","TCK ping-pong buffer is full.")
      endcase
      TCK_sem.put(1);
   endfunction: write_TCK_clk_drv
   
   function void write_SYSCLK_clk_drv( stil_info_transaction t);
      while(!SYSCLK_sem.try_get(1))`uvm_info("stil_generator","try get semafore",UVM_DEBUG);
      case({SYSCLK_ping_data_rdy, SYSCLK_pong_data_rdy})
         2'b00: begin
            SYSCLK_stil_info_tx_ping = t; 
            SYSCLK_ping_data_rdy = 1;
         end
         2'b10: begin
            SYSCLK_stil_info_tx_pong = t; 
            SYSCLK_pong_data_rdy = 1;
         end
         2'b01: `uvm_error("stil_generator","Illegal data reday combination.")
         2'b11: `uvm_error("stil_generator","SYSCLK ping-pong buffer is full.")
      endcase
      SYSCLK_sem.put(1);
   endfunction: write_SYSCLK_clk_drv
   
   function void write_pad_drv( stil_info_transaction t);
      while(!pad_sem.try_get(1)) `uvm_info("stil_generator","try get semafore",UVM_DEBUG);
      case({pad_ping_data_rdy, pad_pong_data_rdy})
         2'b00: begin
            pad_stil_info_tx_ping = t; 
            pad_ping_data_rdy = 1;
         end
         2'b10: begin
            pad_stil_info_tx_pong = t; 
            pad_pong_data_rdy = 1;
         end
         2'b01: `uvm_error("stil_generator","Illegal data reday combination.")
         2'b11: `uvm_error("stil_generator","pad ping-pong buffer is full.")
      endcase
      pad_sem.put(1);
   endfunction: write_pad_drv
  
   function void print_stil_header(int stil_fd);
      string            s;
      
      assert(uvm_config_db#(TCK_clk_configuration)::get ( .cntxt( this ), .inst_name( "*" ), .field_name( "clk_cfg" ), .value( this.TCK_clk_cfg) ));
      assert(uvm_config_db#(SYSCLK_clk_configuration)::get ( .cntxt( this ), .inst_name( "*" ), .field_name( "clk_cfg" ), .value( this.SYSCLK_clk_cfg) ));
 
      //`uvm_info("stil_generator",TCK_clk_cfg.convert2string,UVM_NONE);
      $cast(TCK_clk_wave_des, TCK_clk_cfg.clk_wave_desc.clone());
      SYSCLK_clk_wave_des = SYSCLK_clk_cfg.clk_wave_desc;
      
      $sformat(s,"%s STIL 1.0;\n",s);

      //Print Signals block
      $sformat(s,"%s Signals {\n",s);

      foreach(jtag_cfg.pad_name[i]) $sformat(s,"%s \t%s\t%s;\n",s,jtag_cfg.pad_name[i],(jtag_cfg.pad_dir[i] ? (jtag_cfg.pad_dir[i] == 1 ? "Out" : "InOut") : "In"));
      
      foreach(reset_cfg.pad_name[i]) $sformat(s,"%s \t%s\t%s;\n",s,reset_cfg.pad_name[i],(reset_cfg.pad_dir[i] ? (reset_cfg.pad_dir[i] == 1 ? "Out" : "InOut") : "In"));
      
      foreach(TCK_clk_cfg.pad_name[i]) $sformat(s,"%s \t%s\t%s;\n",s,TCK_clk_cfg.pad_name[i],(TCK_clk_cfg.pad_dir[i] ? (TCK_clk_cfg.pad_dir[i] == 1 ? "Out" : "InOut") : "In"));
      foreach(SYSCLK_clk_cfg.pad_name[i]) $sformat(s,"%s \t%s\t%s;\n",s,SYSCLK_clk_cfg.pad_name[i],(SYSCLK_clk_cfg.pad_dir[i] ? (SYSCLK_clk_cfg.pad_dir[i] == 1 ? "Out" : "InOut") : "In"));
      $sformat(s,"%s}\n",s);
      
      //Print WaveformTable block
      $sformat(s,"%s Timing basic {\n",s);
      $sformat(s,"%s \t WaveformTable wave_form_table{\n",s);
      $sformat(s,"%s \t\t Period '%dns';\n",s,timing_window);
      $sformat(s,"%s \t\t Waveforms {\n",s);
      
      //Print TCK description
      $sformat(s,"%s \t\t %s {\n",s, TCK_clk_cfg.pad_name[0]);
      foreach(TCK_clk_wave_des.wave_desc[i]) 
         $sformat(s,"%s \t\t\t %0d {%s}\n",s,i,TCK_clk_wave_des.wave_desc[i]);
      $sformat(s,"%s \t\t }\n",s);

     // //Print SYSCLK description
     // $sformat(s,"%s \t\t %s {\n",s, SYSCLK_clk_cfg.pad_name[0]);
     // foreach(SYSCLK_clk_wave_des.wave_desc[i]) 
     //    $sformat(s,"%s \t\t\t %0d {%s}\n",s,i,SYSCLK_clk_wave_des.wave_desc[i]);
     // $sformat(s,"%s \t\t }\n",s);

      foreach(jtag_cfg.pad_name[i]) begin
         if(jtag_cfg.pad_dir[i] == 0)
            $sformat(s,"%s \t\t %s {01x {'0ns' D/U/Z;}}\n",s, jtag_cfg.pad_name[i]);
         else if(jtag_cfg.pad_dir[i] == 1)
            $sformat(s,"%s \t\t %s {LHx {'0ns' L/H/X;}}\n",s, jtag_cfg.pad_name[i]);
         else begin 
            $sformat(s,"%s \t\t %s {01x {'0ns' D/U/Z;}}\n",s, jtag_cfg.pad_name[i]);
            $sformat(s,"%s \t\t {LHX {'0ns'Z; '1ns' L/H/X;}}\n",s);
         end
      end

      foreach(reset_cfg.pad_name[i]) begin
         if(reset_cfg.pad_dir[i] == 0)
            $sformat(s,"%s \t\t %s {01x {'0ns' D/U/Z;}}\n",s, reset_cfg.pad_name[i]);
         else if(reset_cfg.pad_dir[i] == 1)
            $sformat(s,"%s \t\t %s {LHx {'0ns' L/H/X;}}\n",s, reset_cfg.pad_name[i]);
         else begin 
            $sformat(s,"%s \t\t %s {01x {'0ns' D/U/Z;}\n",s, reset_cfg.pad_name[i]);
            $sformat(s,"%s \t\t LHX {'0ns'Z; '1ns' L/H/X;}}\n",s);
         end
      end
      $sformat(s,"%s \t\t}\n",s);
      $sformat(s,"%s \t}\n",s);
      $sformat(s,"%s }\n",s);

      //Print PatternBurst block
      $sformat(s,"%s PatternBurst basic_burst {\n",s);
      $sformat(s,"%s \t PatList { basic; }\n",s);
      $sformat(s,"%s }\n",s);
      
      //Print PatternExec block
      $sformat(s,"%s PatternExec {\n",s);
      $sformat(s,"%s \t Timing  basic;\n",s);
      $sformat(s,"%s \t PatternBurst basic_burst;\n",s);
      $sformat(s,"%s }\n",s);

      //Print Patternblock
      $sformat(s,"%s Pattern basic{\n",s);
      $sformat(s,"%s \t W wave_form_table;\n",s);
      $fdisplay(stil_fd,s);
   endfunction: print_stil_header

   function void update_ping_pong_buffer(ref bit ping_data_rdy, pong_data_rdy, ref stil_info_transaction ping_stil_info_tx, pong_stil_info_tx);
      //`uvm_info("stil_generator","before proces... ",UVM_NONE);
      //`uvm_info("stil_generator",$sformatf("ping_data_rdy = %0b, pong_data_rdy = %0b",ping_data_rdy, pong_data_rdy),UVM_NONE);
      
      case({ping_data_rdy,pong_data_rdy})
         //2'b00:
         2'b10: begin
            if(ping_stil_info_tx.comment_info.len() != 0) comment_str = {comment_str, ping_stil_info_tx.comment_info};
            stil_str = {stil_str, ping_stil_info_tx.stil_info};
            ping_data_rdy = 1'b0;
         end
         2'b11: begin
            if(ping_stil_info_tx.comment_info.len() != 0) comment_str = {comment_str, ping_stil_info_tx.comment_info};
            stil_str = {stil_str, ping_stil_info_tx.stil_info};
            ping_data_rdy = 1'b1;
            pong_data_rdy = 1'b0;
            ping_stil_info_tx = pong_stil_info_tx;
         end
         2'b01: `uvm_error("stil_generator","Illegal data reday combination.")
      endcase
      
      //`uvm_info("stil_generator","after proces... ",UVM_NONE);
      //`uvm_info("stil_generator",$sformatf("ping_data_rdy = %0b, pong_data_rdy = %0b",ping_data_rdy, pong_data_rdy),UVM_NONE);
      //`uvm_info("stil_generator",$sformatf("stil_str = %s, comment_str = %s",stil_str, comment_str),UVM_NONE);

   endfunction: update_ping_pong_buffer

   task run_phase(uvm_phase phase);
      
      stil_fd = $fopen(stil_file_name, "w");
      if(gen_stil_file) #1 print_stil_header(stil_fd);
      forever begin
         if(TCK_ping_data_rdy && TCK_pong_data_rdy || SYSCLK_ping_data_rdy && SYSCLK_pong_data_rdy ||
            jtag_pong_data_rdy && jtag_ping_data_rdy || pad_ping_data_rdy && pad_pong_data_rdy ||
            reset_ping_data_rdy && reset_pong_data_rdy)begin
               
               while(!pad_sem.try_get(1)) `uvm_info("stil_generator","try get semafore",UVM_DEBUG);
               while(!TCK_sem.try_get(1)) `uvm_info("stil_generator","try get semafore",UVM_DEBUG);
               while(!SYSCLK_sem.try_get(1))`uvm_info("stil_generator","try get semafore",UVM_DEBUG);
               while(!jtag_sem.try_get(1))`uvm_info("stil_generator","try get semafore",UVM_DEBUG);
               while(!reset_sem.try_get(1)) `uvm_info("stil_generator","try get semafore",UVM_DEBUG);

               //`uvm_info("stil_generator","check TCK stil_info_transaction",UVM_NONE);
               update_ping_pong_buffer(TCK_ping_data_rdy,TCK_pong_data_rdy,TCK_stil_info_tx_ping,TCK_stil_info_tx_pong);
               
               //`uvm_info("stil_generator","check pad stil_info_transaction",UVM_NONE);
               update_ping_pong_buffer(pad_ping_data_rdy,pad_pong_data_rdy,pad_stil_info_tx_ping,pad_stil_info_tx_pong);
               
               //`uvm_info("stil_generator","check reset stil_info_transaction",UVM_NONE);
               update_ping_pong_buffer(reset_ping_data_rdy,reset_pong_data_rdy,reset_stil_info_tx_ping,reset_stil_info_tx_pong);
               
               //`uvm_info("stil_generator","check jtag stil_info_transaction",UVM_NONE);
               update_ping_pong_buffer(jtag_ping_data_rdy,jtag_pong_data_rdy,jtag_stil_info_tx_ping,jtag_stil_info_tx_pong);
               
               //`uvm_info("stil_generator","check SYSCLK stil_info_transaction",UVM_NONE);
               update_ping_pong_buffer(SYSCLK_ping_data_rdy,SYSCLK_pong_data_rdy,SYSCLK_stil_info_tx_ping,SYSCLK_stil_info_tx_pong);

               TCK_sem.put(1);   
               SYSCLK_sem.put(1);   
               jtag_sem.put(1);   
               pad_sem.put(1);   
               reset_sem.put(1);   

               write_to_file = 1;
         end
         
         if(write_to_file) begin
            //`uvm_info("stil_generator",comment_str,UVM_NONE);
            //`uvm_info("stil_generator",stil_str,UVM_NONE);
            if(comment_str.len() != 0) $fdisplay(stil_fd,{"//",comment_str});
            $fdisplay(stil_fd,{"\t V { ",stil_str, " }"});
            //`uvm_info("stil_generator",stil_str,UVM_NONE);
            write_to_file = 0;
            stil_str = "";
            comment_str= "";
            #1;
         end 
         else #1;
      end
   endtask: run_phase


   function void final_phase( uvm_phase phase );
      super.final_phase( phase );
      if(gen_stil_file)$fdisplay(stil_fd,"\}");
   endfunction: final_phase
endclass:stil_generator

   
//---------------------------------------------------------------------------
// Class: jtag_scoreboard
//---------------------------------------------------------------------------

class jtag_scoreboard extends uvm_subscriber#( jtag_transaction );
   `uvm_component_utils( jtag_scoreboard )

   function new( string name, uvm_component parent );
      super.new( name, parent );
   endfunction: new

   function void write( jtag_transaction t);
	   uvm_table_printer p = new;
       `uvm_info("jtag_scoreboard",{"\n",t.sprint(p)},UVM_LOW);
     `uvm_info("Got one more jtag_transaction",{"\n",t.sprint(p)},UVM_LOW);
   endfunction: write

endclass:jtag_scoreboard

//------------------------------------------------------------------------------
// Class: jtag_reg_predictor
//------------------------------------------------------------------------------

typedef uvm_reg_predictor#( jtag_transaction ) jtag_reg_predictor;
//---------------------------------------------------------------------------
// Class: dft_register_layering
//---------------------------------------------------------------------------

class dft_register_layering extends uvm_scoreboard;
   `uvm_component_utils( dft_register_layering )
   
   function new( string name, uvm_component parent );
      super.new( name, parent );
   endfunction: new

   uvm_analysis_port #(jtag_transaction) jtag_ap;
   
   dft_register_predictor    dft_reg_prdctr;
   dft_register_map          dft_reg_map;
   dft_register_monitor      dft_reg_mon;
   dft_register_adapter      dft_reg_adptr;
   dft_register_sequencer    dft_reg_sqr;
   jtag_configuration        jtag_cfg;
   jtag_agent                agent;

   function void build_phase( uvm_phase phase );
      super.build_phase( phase );

      jtag_ap = new( .name("jtag_ap"), .parent(this) );
      dft_reg_prdctr = dft_register_predictor::type_id::create(.name( "dft_reg_prdctr" ), .parent(this));
      dft_reg_map = dft_register_map::type_id::create(.name( "dft_reg_map" ), .parent(this));
      dft_reg_mon = dft_register_monitor::type_id::create(.name( "dft_reg_mon" ), .parent(this));
      dft_reg_adptr = dft_register_adapter::type_id::create(.name( "dft_reg_adptr" ), .parent(this));
      dft_reg_sqr = dft_register_sequencer::type_id::create(.name( "dft_reg_sqr" ), .parent(this));
      
      assert(uvm_config_db#( jtag_configuration )::get ( .cntxt( this ), .inst_name( "*" ), .field_name( "jtag_cfg" ), .value( jtag_cfg) ))
      else `uvm_fatal("NOVIF", "Failed to get jtag_cfg form uvm_config_db.\n");
      
   endfunction: build_phase

   function void connect_phase( uvm_phase phase );

      this.jtag_ap.connect(dft_reg_mon.analysis_export);

      dft_reg_mon.dft_reg_ap.connect(dft_reg_map.analysis_export);
      
      //dft_reg_prdctr connection
      dft_reg_mon.dft_reg_ap.connect(dft_reg_prdctr.bus_in);
      dft_reg_mon.dft_network_info_put_port.connect(dft_reg_sqr.dft_network_info_put_export); 
      dft_reg_prdctr.adapter = dft_reg_adptr;
      dft_reg_prdctr.map = jtag_cfg.reg_block.reg_map;
      jtag_cfg.reg_block.reg_map.set_sequencer( .sequencer( dft_reg_sqr ), .adapter( dft_reg_adptr) );
   endfunction: connect_phase
   
   virtual task run_phase(uvm_phase phase);
      dft_reg_tx_to_jtag_tx_sequence         dft_reg_tx_to_jtag_tx_seq;

      dft_reg_tx_to_jtag_tx_seq = dft_reg_tx_to_jtag_tx_sequence::type_id::create("dft_reg_tx_to_jtag_tx_seq");

      // connect translation sequences to their respective upstream sequencers
      dft_reg_tx_to_jtag_tx_seq.up_sequencer = dft_reg_sqr;
      
      // start the translation sequences
      fork
        dft_reg_tx_to_jtag_tx_seq.start(agent.sqr);
      join_none
   endtask

endclass:dft_register_layering


//---------------------------------------------------------------------------
// Class: jtag_env
//---------------------------------------------------------------------------

class jtag_env extends uvm_env;
   `uvm_component_utils( jtag_env )
   
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

   stil_generator       stil_gen;
   dft_register_layering     reg_layering;

   function void build_phase( uvm_phase phase );
      super.build_phase( phase );
	   
      agent = jtag_agent::type_id::create           (.name( "agent"      ), .parent(this));
      scoreboard = jtag_scoreboard::type_id::create (.name( "scoreboard" ), .parent(this));
      //reg_predictor = jtag_reg_predictor::type_id::create(.name( "reg_predictor" ), .parent(this));
      
      TCK_clk_drv = TCK_clk_driver::type_id::create(.name( "TCK_clk_drv" ), .parent(this));
      SYSCLK_clk_drv = SYSCLK_clk_driver::type_id::create(.name( "SYSCLK_clk_drv" ), .parent(this));
      reset_drv = reset_driver::type_id::create(.name( "reset_drv" ), .parent(this));
      pad_agnt = pad_agent::type_id::create(.name( "pad_agent" ), .parent(this));
      stil_gen = stil_generator::type_id::create(.name( "stil_gen" ), .parent(this));
      reg_layering = dft_register_layering::type_id::create(.name( "reg_layering" ), .parent(this));
      
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

   endfunction: connect_phase

endclass:jtag_env

