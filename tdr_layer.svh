//---------------------------------------------------------------------------
// Class: sib_node 
//---------------------------------------------------------------------------
class sib_node extends uvm_object;
   `uvm_object_utils(sib_node)
   bit    in0; 
   bit    in1; 
   bit    value;
   bit    out;
  
   function new(string name = "sib_node");
     super.new(name);
   endfunction : new
   
   function void out_update ();
      out = value ? in1 : in0;
   endfunction: out_update
   
   function void value_update ();
      value = out;
   endfunction: value_update
endclass : sib_node

//---------------------------------------------------------------------------
// Class: reg_node 
//---------------------------------------------------------------------------
class reg_node extends uvm_object;
   `uvm_object_utils(reg_node)
   bit    in; 
   //bit    is_selwir; 
   bit    value;
   bit    out;
  
   function new(string name = "reg_node");
     super.new(name);
   endfunction : new
    
   function void out_update ();
      out = in;
   endfunction: out_update
    
   function void value_update ();
      value = out;
   endfunction: value_update
endclass : reg_node

//---------------------------------------------------------------------------
// Class: dft_network_info 
//---------------------------------------------------------------------------
class dft_network_info extends uvm_object;
   `uvm_object_utils(dft_network_info)
   
   reg_node                         lvl1_sib[`LVL1SIB_WIDTH];
   reg_node                         lvl2_sib[`LVL2SIB_WIDTH];
   reg_node                         lvl1_seb,lvl1_swb;
   reg_node                         lvl2_seb,lvl2_swb,lvl2_sbc;
   reg_node                         lvl1_wir[`IEEE_1500_IR_WIDTH], lvl1_wdr_dynmc[]; 
   reg_node                         lvl2_wir[`IEEE_1500_IR_WIDTH], lvl2_wdr_dynmc[];
   string                           temp_name;

   function new(string name = "dft_network_info");
      super.new(name);
      
      for(int i=0; i<`LVL1SIB_WIDTH; i++) begin
         temp_name = $sformatf("lvl1_sib[%0d]",i);
         lvl1_sib[i] = new(temp_name);
      end
      
      for(int i=0; i<`LVL2SIB_WIDTH; i++) begin
         temp_name = $sformatf("lvl2_sib[%0d]",i);
         lvl2_sib[i] = new(temp_name);
      end
      
      for(int i=0; i<`IEEE_1500_IR_WIDTH; i++) begin
         temp_name = $sformatf("lvl1_wir[%0d]",i);
         lvl1_wir[i] = new(temp_name);
         temp_name = $sformatf("lvl2_wir[%0d]",i);
         lvl2_wir[i] = new(temp_name);
      end
      
      lvl1_seb = new("lvl1_seb");
      lvl1_swb = new("lvl1_swb");
      
      lvl2_seb = new("lvl2_seb");
      lvl2_swb = new("lvl2_swb");
      lvl2_sbc = new("lvl2_sbc");
      
      node_initialize();
   endfunction : new
   
   
   function string convert2string();
      string       s;
      $sformat(s, "%s\n***************current DFT Network Infomation begin**********",s);
      $sformat(s,{"%s\n",node_value_print()},s);
      $sformat(s, "%s\n***************current DFT Network Infomation end**********",s);
      return s;
   endfunction: convert2string


   function string node_value_print();
      string s; 
      
      $sformat(s, "%s\n lvl1_sib = %0d'b",s, `LVL1SIB_WIDTH);
      for(int i=`LVL1SIB_WIDTH-1; i>=0; i--) $sformat(s, "%s%0b",s,lvl1_sib[i].value);
      
      $sformat(s, "%s\n lvl2_sib = %0d'b",s, `LVL2SIB_WIDTH);
      for(int i=`LVL2SIB_WIDTH-1; i>=0; i--) $sformat(s, "%s%0b",s,lvl2_sib[i].value);
      
      $sformat(s, "%s\n lvl1_swb = %0d",s, lvl1_swb.value);
      $sformat(s, "%s\n lvl2_swb = %0d",s, lvl2_swb.value);

      $sformat(s, "%s\n lvl1_seb = %0d",s, lvl1_seb.value);
      $sformat(s, "%s\n lvl2_seb = %0d",s, lvl2_seb.value);
      
      $sformat(s, "%s\n lvl2_sbc = %0d",s, lvl2_sbc.value);

      $sformat(s, "%s\n lvl1_wir = %0d'b",s, `IEEE_1500_IR_WIDTH);
      for(int i=`IEEE_1500_IR_WIDTH-1; i>=0; i--) $sformat(s, "%s%0b",s,lvl1_wir[i].value);
      
      $sformat(s, "%s\n lvl2_wir = %0d'b",s, `IEEE_1500_IR_WIDTH);
      for(int i=`IEEE_1500_IR_WIDTH-1; i>=0; i--) $sformat(s, "%s%0b",s,lvl2_wir[i].value);
      
      $sformat(s, "%s\n lvl1_wdr_dynmc = %0d'b",s, lvl1_wdr_dynmc.size());
      for(int i=lvl1_wdr_dynmc.size()-1; i>=0; i--) $sformat(s, "%s%0b",s,lvl1_wdr_dynmc[i].value);

      $sformat(s, "%s\n lvl2_wdr_dynmc = %0d'b",s, lvl2_wdr_dynmc.size());
      for(int i=lvl2_wdr_dynmc.size()-1; i>=0; i--) $sformat(s, "%s%0b",s,lvl2_wdr_dynmc[i].value);

      return s;
   endfunction: node_value_print 
   
   virtual function void do_copy( uvm_object rhs );
      dft_network_info     that;

      if ( ! $cast( that, rhs ) ) begin
         `uvm_error( get_name(), "rhs is not a dft_network_info sequence item" )
         return;
      end
      
      super.do_copy( rhs );
      foreach(that.lvl1_sib[i]) this.lvl1_sib[i].value = that.lvl1_sib[i].value;
      foreach(that.lvl2_sib[i]) this.lvl2_sib[i].value = that.lvl2_sib[i].value;

      this.lvl1_seb.value = that.lvl1_seb.value;
      this.lvl1_swb.value = that.lvl1_swb.value;
      
      this.lvl2_seb.value = that.lvl2_seb.value;
      this.lvl2_swb.value = that.lvl2_swb.value;
      this.lvl2_sbc.value = that.lvl2_sbc.value;
      
      foreach(that.lvl1_wir[i]) this.lvl1_wir[i].value = that.lvl1_wir[i].value;
      foreach(that.lvl2_wir[i]) this.lvl2_wir[i].value = that.lvl2_wir[i].value;
      
      foreach(that.lvl1_wdr_dynmc[i]) this.lvl1_wdr_dynmc[i].value = that.lvl1_wdr_dynmc[i].value;
      foreach(that.lvl2_wdr_dynmc[i]) this.lvl2_wdr_dynmc[i].value = that.lvl2_wdr_dynmc[i].value;
   endfunction: do_copy
   
   virtual function void node_initialize();
      //sel_wir node initialize.
      lvl1_swb.in = 1;
      lvl1_swb.value = 1;
      lvl2_swb.in = 1;
      lvl2_swb.value = 1;
   endfunction :node_initialize
 
endclass : dft_network_info


//------------------------------------------------------------------------------
// class:caught_data 
//------------------------------------------------------------------------------
//This class is used to store information genrated by 1687 network maintainer.
class caught_data extends uvm_object;
   `uvm_object_utils(caught_data)
   //bit                              caught_1149_reg; 
   bit                              caught_1500_reg; 
   bit[`DFT_REG_ADDR_WIDTH-1: 0]    reg_addr; 
   bit                              reg_data_q[$];
  
   function new(string name = "caught_data");
     super.new(name);
   endfunction : new
    
   function string convert2string();
       string       s;
       $sformat(s, "%s\n***************caught_data begin**********",s);
       $sformat(s, "%s\n caught_1500_reg = %0d \n reg_addr = %h ",s,  caught_1500_reg, reg_addr);
       $sformat(s, "%s\n reg_data_q = ",s );
       foreach( reg_data_q[i] )
            $sformat(s, "%s%0b",s,reg_data_q[$-i] );
         $sformat(s, "%s\n***************caught_data end**********",s);
       return s;
   endfunction: convert2string
endclass : caught_data

//------------------------------------------------------------------------------
// class: dft_register_transaction
//------------------------------------------------------------------------------
class dft_register_transaction extends uvm_sequence_item;
    `uvm_object_utils( dft_register_transaction )
      
    bit                                read_not_write;
    bit[`DFT_REG_ADDR_WIDTH-1:0]       address;
    bit                                wr_data_q[$];
    bit                                rd_data_q[$];
    bus_reg_ext                        extension;
    int unsigned                       reg_length;
    function new(string name = "dft_register_transaction");
        super.new(name);
        extension = new("extension");
    endfunction

    virtual function string convert2string();
        string       s;
        int unsigned hex_value,wr_data_q_length,rd_data_q_length;
        int unsigned four_bits_num;
        int unsigned remainder;
        bit          temp_q_data[];  
        $sformat(s, "%s\n ********************dft_register_transaction*****\n",s );
        $sformat(s, "%s\n read_not_write = %0d \n address = %h \n reg_length = %0d\n",s, read_not_write, address, reg_length);
        
        $sformat(s, "%s\n ///////////////wr_data_q//////////////////////////\n",s );
        wr_data_q_length = wr_data_q.size();
        four_bits_num = wr_data_q_length / 4;
        remainder = wr_data_q_length % 4;
        temp_q_data = new[wr_data_q_length];
        
        foreach( wr_data_q[i] )
            //$sformat(s, "%s%0b",s,wr_data_q[$-i] );
            temp_q_data[i] = wr_data_q[i];
        $sformat(s, "%s wr_data_q = %0d'h",s, wr_data_q_length);
         
       
        if (remainder != 0) begin
            if (remainder == 1)
                hex_value = temp_q_data[four_bits_num*4];
            else if (remainder == 2)
                hex_value = temp_q_data[four_bits_num*4 + 1] *2 + temp_q_data[four_bits_num*4];
            else if (remainder == 3)
                hex_value = temp_q_data[four_bits_num*4 + 2] *4 + temp_q_data[four_bits_num*4 + 1] *2 + temp_q_data[four_bits_num*4];
            $sformat(s, "%s%0h",s,hex_value);
        end 
        
        for ( int i = four_bits_num-1; i >= 0; i--) begin
            hex_value = temp_q_data[i*4+3] *8 + temp_q_data[i*4+2] *4 + temp_q_data[i*4+1] *2 + temp_q_data[i*4];
            $sformat(s, "%s%0h",s,hex_value);
        end
        temp_q_data.delete(); 
        
        $sformat(s, "%s\n ///////////////rd_data_q//////////////////////////\n",s );
        rd_data_q_length = rd_data_q.size();
        four_bits_num = rd_data_q_length / 4;
        remainder = rd_data_q_length % 4;
        temp_q_data = new[rd_data_q_length];
        
        foreach( rd_data_q[i] )
            //$sformat(s, "%s%0b",s,rd_data_q[$-i] );
            temp_q_data[i] = rd_data_q[i];
        $sformat(s, "%s rd_data_q = %0d'h",s, rd_data_q_length);
         
       
        if (remainder != 0) begin
            if (remainder == 1)
                hex_value = temp_q_data[four_bits_num*4];
            else if (remainder == 2)
                hex_value = temp_q_data[four_bits_num*4 + 1] *2 + temp_q_data[four_bits_num*4];
            else if (remainder == 3)
                hex_value = temp_q_data[four_bits_num*4 + 2] *4 + temp_q_data[four_bits_num*4 + 1] *2 + temp_q_data[four_bits_num*4];
            $sformat(s, "%s%0h",s,hex_value);
        end 
        
        for ( int i = four_bits_num-1; i >= 0; i--) begin
            hex_value = temp_q_data[i*4+3] *8 + temp_q_data[i*4+2] *4 + temp_q_data[i*4+1] *2 + temp_q_data[i*4];
            $sformat(s, "%s%0h",s,hex_value);
        end
        temp_q_data.delete();
      
        return s;
    endfunction: convert2string
    
    virtual function void do_copy( uvm_object rhs );
       dft_register_transaction  that;

       if ( ! $cast( that, rhs ) ) begin
          `uvm_error( get_name(), "rhs is not a dft_register_transaction" )
          return;
       end

       super.do_copy( rhs );

       this.read_not_write = that.read_not_write;
       this.address        = that.address    ;  
       this.wr_data_q      = that.wr_data_q  ; 
       this.rd_data_q      = that.rd_data_q  ; 
       this.extension      = that.extension.clone()  ; 
       this.reg_length     = that.reg_length ;  

    endfunction: do_copy
endclass: dft_register_transaction    

//------------------------------------------------------------------------------
// class: dft_register_monitor
//------------------------------------------------------------------------------
class dft_register_monitor extends uvm_subscriber #(jtag_transaction);
   `uvm_component_utils( dft_register_monitor )
   
   uvm_analysis_port #(dft_register_transaction)         dft_reg_ap;
   uvm_blocking_put_port #(dft_network_info)             dft_network_info_put_port;
  
   dft_register_transaction         dft_reg_tx;
   bit[`DFT_REG_ADDR_WIDTH-1:0]     temp_ir;
   bit                              temp_dr_q[$];
   reg_node                         lvl1_sib[`LVL1SIB_WIDTH];
   reg_node                         lvl2_sib[`LVL2SIB_WIDTH];
   reg_node                         lvl1_seb,lvl1_swb;
   reg_node                         lvl2_seb,lvl2_swb,lvl2_sbc;
   reg_node                         lvl1_wir[`IEEE_1500_IR_WIDTH], lvl1_wdr_dynmc[]; 
   reg_node                         lvl2_wir[`IEEE_1500_IR_WIDTH], lvl2_wdr_dynmc[];
   string                           temp_name;
   string                           report_id = "dft_register_monitor"; 
   dft_network_info                 dft_ntwrk_info;

   function new( string name, uvm_component parent );
      super.new( name, parent );
   endfunction: new

   function void build_phase( uvm_phase phase );
      super.build_phase( phase );
      dft_reg_ap = new( .name("dft_reg_ap"), .parent(this) );
      dft_network_info_put_port = new( .name("dft_network_info_put_port"), .parent(this) );

      for(int i=0; i<`LVL1SIB_WIDTH; i++) begin
         temp_name = $sformatf("lvl1_sib[%0d]",i);
         lvl1_sib[i] = new(temp_name);
      end
      
      for(int i=0; i<`LVL2SIB_WIDTH; i++) begin
         temp_name = $sformatf("lvl2_sib[%0d]",i);
         lvl2_sib[i] = new(temp_name);
      end
      
      for(int i=0; i<`IEEE_1500_IR_WIDTH; i++) begin
         temp_name = $sformatf("lvl1_wir[%0d]",i);
         lvl1_wir[i] = new(temp_name);
         temp_name = $sformatf("lvl2_wir[%0d]",i);
         lvl2_wir[i] = new(temp_name);
      end
      
      lvl1_seb = new("lvl1_seb");
      lvl1_swb = new("lvl1_swb");
      
      lvl2_seb = new("lvl2_seb");
      lvl2_swb = new("lvl2_swb");
      lvl2_sbc = new("lvl2_sbc");
      
      node_initialize();
      node_value_print();

      dft_ntwrk_info = dft_network_info::type_id::create("dft_ntwrk_info");
   endfunction: build_phase

   function void write( jtag_transaction t);
      caught_data          cght_data;
      `uvm_info("dft_register_monitor",{ t.print_queue}, UVM_MEDIUM);
      if(t.read_not_write)begin
         foreach(t.tdo_ir_queue[i]) begin
            temp_ir[i] = t.tdi_ir_queue[i]; 
            temp_dr_q  = t.tdo_dr_queue;
         end
      end
      else begin
         foreach(t.tdi_ir_queue[i]) begin
            temp_ir[i] = t.tdi_ir_queue[i]; 
            temp_dr_q  = t.tdi_dr_queue;
         end
      end
      
      if((temp_ir == `P1687_OPCODE) || (temp_ir == `P1687_QRYUPD_ONLY_OPCODE)) begin
         cght_data = caught_data::type_id::create("cght_data");
         
         cght_data = dft_tdr_network(t); 

         `uvm_info( report_id,{ cght_data.convert2string }, UVM_MEDIUM);
         if(cght_data.caught_1500_reg) begin
            dft_reg_tx = dft_register_transaction::type_id::create("dft_reg_tx");
            
            dft_reg_tx.read_not_write = t.read_not_write;
            dft_reg_tx.address = cght_data.reg_addr;
            
            dft_reg_tx.rd_data_q = cght_data.reg_data_q;
            dft_reg_tx.wr_data_q = cght_data.reg_data_q;
            dft_reg_tx.reg_length = cght_data.reg_data_q.size();
            dft_reg_ap.write(dft_reg_tx);

         end// if(cght_data.caught_1500_reg) begin
         
         foreach(lvl1_sib[i])dft_ntwrk_info.lvl1_sib[i].value = lvl1_sib[i].value;  
         foreach(lvl2_sib[i])dft_ntwrk_info.lvl2_sib[i].value = lvl2_sib[i].value;  
         dft_ntwrk_info.lvl1_seb.value = lvl1_seb.value;      
         dft_ntwrk_info.lvl1_swb.value = lvl1_swb.value;
         dft_ntwrk_info.lvl2_seb.value = lvl2_seb.value;
         dft_ntwrk_info.lvl2_swb.value = lvl2_swb.value;
         dft_ntwrk_info.lvl2_sbc.value = lvl2_sbc.value;
         foreach(lvl1_wir[i]) dft_ntwrk_info.lvl1_wir[i].value = lvl1_wir[i].value;
         foreach(lvl2_wir[i]) dft_ntwrk_info.lvl2_wir[i].value = lvl2_wir[i].value;
         foreach(lvl1_wdr_dynmc[i]) dft_ntwrk_info.lvl1_wdr_dynmc[i].value = lvl1_wdr_dynmc[i].value;
         foreach(lvl2_wdr_dynmc[i]) dft_ntwrk_info.lvl2_wdr_dynmc[i].value = lvl2_wdr_dynmc[i].value;
         `uvm_info("dft_register_monitor",{ dft_ntwrk_info.convert2string}, UVM_DEBUG);
         dft_network_info_put_port.put(dft_ntwrk_info);
      end//if((temp_ir == `P1687_OPCODE) || (temp_ir == `P1687_QRYUPD_ONLY_OPCODE)) begin
      else begin
         dft_reg_tx = dft_register_transaction::type_id::create("dft_reg_tx");
         dft_reg_tx.read_not_write = t.read_not_write;
         dft_reg_tx.address = {temp_ir[`IEEE_1149_IR_WIDTH-1:0],`SIB_WIDTH'b0};
         
         dft_reg_tx.rd_data_q = t.tdo_dr_queue;
         //dft_reg_tx.wr_data_q = t.tdi_dr_queue;
         dft_reg_tx.wr_data_q = t.tdo_dr_queue;
         dft_reg_tx.reg_length = t.tdo_dr_queue.size();
  
         `uvm_info("dft_register_monitor",{ dft_reg_tx.convert2string}, UVM_MEDIUM);
         dft_reg_ap.write(dft_reg_tx);


      end
   endfunction: write
  
   virtual function void node_initialize();
      //sel_wir node initialize.
      lvl1_swb.in = 1;
      lvl1_swb.value = 1;
      lvl2_swb.in = 1;
      lvl2_swb.value = 1;
   endfunction :node_initialize
   
   virtual function void node_out_update();
      lvl1_seb.out_update(); 
      lvl1_swb.out_update(); 
      
      lvl2_seb.out_update(); 
      lvl2_swb.out_update(); 
      lvl2_sbc.out_update(); 
      
      foreach (lvl1_sib[i]) lvl1_sib[i].out_update();
      foreach (lvl2_sib[i]) lvl2_sib[i].out_update();
      
      foreach (lvl2_wir[i]) lvl2_wir[i].out_update();
      foreach (lvl1_wir[i]) lvl1_wir[i].out_update();
      
      if(lvl1_wdr_dynmc.size() >= 1) foreach (lvl1_wdr_dynmc[i]) lvl1_wdr_dynmc[i].out_update();
      if(lvl2_wdr_dynmc.size() >= 1) foreach (lvl2_wdr_dynmc[i]) lvl2_wdr_dynmc[i].out_update();
   endfunction :node_out_update
   
   virtual function void node_value_update();
      lvl1_seb.value_update(); 
      lvl1_swb.value_update(); 
      
      lvl2_seb.value_update(); 
      lvl2_swb.value_update(); 
      lvl2_sbc.value_update(); 
      
      foreach (lvl1_sib[i]) lvl1_sib[i].value_update();
      foreach (lvl2_sib[i]) lvl2_sib[i].value_update();
    
      foreach (lvl1_wir[i]) lvl1_wir[i].value_update();
      foreach (lvl2_wir[i]) lvl2_wir[i].value_update();
      
      if(lvl1_wdr_dynmc.size() >= 1) foreach (lvl1_wdr_dynmc[i]) lvl1_wdr_dynmc[i].value_update();
      if(lvl2_wdr_dynmc.size() >= 1) foreach (lvl2_wdr_dynmc[i]) lvl2_wdr_dynmc[i].value_update();
   endfunction :node_value_update
   
   virtual function void node_value_print();
      string s; 
      
      $sformat(s, "%s\n lvl1_sib = %0d'b",s, `LVL1SIB_WIDTH);
      for(int i=`LVL1SIB_WIDTH-1; i>=0; i--) $sformat(s, "%s%0b",s,lvl1_sib[i].value);
      
      $sformat(s, "%s\n lvl2_sib = %0d'b",s, `LVL2SIB_WIDTH);
      for(int i=`LVL2SIB_WIDTH-1; i>=0; i--) $sformat(s, "%s%0b",s,lvl2_sib[i].value);
      
      $sformat(s, "%s\n lvl1_swb = %0d",s, lvl1_swb.value);
      $sformat(s, "%s\n lvl2_swb = %0d",s, lvl2_swb.value);

      $sformat(s, "%s\n lvl1_seb = %0d",s, lvl1_seb.value);
      $sformat(s, "%s\n lvl2_seb = %0d",s, lvl2_seb.value);
      
      $sformat(s, "%s\n lvl2_sbc = %0d",s, lvl2_sbc.value);

      $sformat(s, "%s\n lvl1_wir = %0d'b",s, `IEEE_1500_IR_WIDTH);
      for(int i=`IEEE_1500_IR_WIDTH-1; i>=0; i--) $sformat(s, "%s%0b",s,lvl1_wir[i].value);
      
      $sformat(s, "%s\n lvl2_wir = %0d'b",s, `IEEE_1500_IR_WIDTH);
      for(int i=`IEEE_1500_IR_WIDTH-1; i>=0; i--) $sformat(s, "%s%0b",s,lvl2_wir[i].value);
      
      $sformat(s, "%s\n lvl1_wdr_dynmc = %0d'b",s, lvl1_wdr_dynmc.size());
      for(int i=lvl1_wdr_dynmc.size()-1; i>=0; i--) $sformat(s, "%s%0b",s,lvl1_wdr_dynmc[i].value);

      $sformat(s, "%s\n lvl2_wdr_dynmc = %0d'b",s, lvl2_wdr_dynmc.size());
      for(int i=lvl2_wdr_dynmc.size()-1; i>=0; i--) $sformat(s, "%s%0b",s,lvl2_wdr_dynmc[i].value);

      `uvm_info("node_value_print",s,UVM_FULL);
   endfunction :node_value_print
   


   virtual function caught_data dft_tdr_network (jtag_transaction jtag_tx); 
      int unsigned                  chain_length;
      int unsigned                  lvl1_wdr_length, lvl2_wdr_length;
      bit[`IEEE_1500_IR_WIDTH-1:0]  lvl1_wir_data;
      bit                           tdi, tdo; 
      caught_data                   cght_data; 

      cght_data = caught_data::type_id::create("cght_data");
      
      lvl1_wdr_dynmc = new[1]; //It's not really being used, just to avoid Null object operation. 
      lvl1_wdr_dynmc[0] = new("lvl1_wdr_dynmc");
      lvl2_wdr_dynmc = new[1]; //It's not really being used, just to avoid Null object operation.
      lvl2_wdr_dynmc[0] = new("lvl2_wdr_dynmc");
      
      if(temp_ir == `P1687_OPCODE) begin
         if(lvl1_seb.value == 1'b0) begin
            if(lvl1_sib[0].value == 1'b0) begin
            end
         end// if(lvl1_seb.value == 1'b0) begin
         else begin
            if(lvl1_sib[0].value == 1'b1) begin
               if(lvl1_swb.value == 1'b1) begin
               end
               else begin
                  foreach(lvl1_wir[i]) lvl1_wir_data[i] = lvl1_wir[i].value;
                  
                  if(lvl1_wir_data == `SUB_CLIENT_SIB_OPCODE) begin
                     if(lvl2_seb.value == 1'b0) begin
                     end
                     else begin
                        //current only consider one sib bit is opened at a time.
                        if(lvl2_swb.value == 1'b1) begin
                        end
                        else begin
                           chain_length = 1 + 1 + 1 + 1 + 1;//lvl1_seb + lvl1_swb + lvl2_sbc + lvl2_seb + lvl2_swb
                           lvl2_wdr_length = jtag_tx.o_dr_length - chain_length;
                           lvl2_wdr_dynmc = new[lvl2_wdr_length];
                           foreach(lvl2_wdr_dynmc[i]) lvl2_wdr_dynmc[i] = new("lvl2_wdr_dynmc");
                        end
                     end// if(lvl2_seb == 1'b1) begin
                  end// if(lvl1_wir_data == `SUB_CLIENT_SIB_OPCODE) begin
                  else begin
                     chain_length = 1 + 1;//lvl1_seb + lvl1_swb
                     lvl1_wdr_length = jtag_tx.o_dr_length - chain_length;
                     lvl1_wdr_dynmc = new[lvl1_wdr_length];
                     foreach(lvl1_wdr_dynmc[i]) lvl1_wdr_dynmc[i] = new("lvl1_wdr_dynmc");
                  end // if(lvl1_wir_data != `SUB_CLIENT_SIB_OPCODE) begin
               end// if(lvl1_swb.value == 1'b0) begin
            end// if(lvl1_sib[0].value == 1'b1) begin
         end// if(lvl1_seb.value == 1'b1) begin
     
         for(int shift_cycle = 0; shift_cycle < jtag_tx.o_dr_length; shift_cycle++) begin

            if(lvl1_seb.value == 1'b1 && lvl1_swb.value == 1'b0 && lvl1_wir_data == `SUB_CLIENT_SIB_OPCODE && lvl2_seb.value == 1'b1 && lvl2_swb.value == 1'b0 && shift_cycle <= jtag_tx.o_dr_length - 1 - 5) tdi = jtag_tx.tdo_dr_queue[shift_cycle];
            else if(lvl1_seb.value == 1'b1 && lvl1_swb.value == 1'b0 && lvl1_wir_data != `SUB_CLIENT_SIB_OPCODE && lvl1_wir_data != `P1687_QRYUPD_ONLY_OPCODE && shift_cycle <= jtag_tx.o_dr_length - 1 - 2) tdi = jtag_tx.tdo_dr_queue[shift_cycle];
            else tdi = jtag_tx.read_not_write ? jtag_tx.tdo_dr_queue[shift_cycle] : jtag_tx.tdi_dr_queue[shift_cycle];
            
            lvl1_seb.in = tdi;
            //if `LVL1SIB_WIDTH has update, following need to be updated accordingly.
            if(lvl1_seb.value == 1'b0) lvl1_sib[0].in = lvl1_seb.out;
            else begin
               lvl1_swb.in = lvl1_seb.out;
               if(lvl1_swb.value == 1'b1) begin
                  lvl1_wir[`IEEE_1500_IR_WIDTH - 1].in = lvl1_swb.out;
                  for(int i=0; i<`IEEE_1500_IR_WIDTH - 1; i++) lvl1_wir[i].in = lvl1_wir[i+1].out;
               end
               else begin
                  foreach(lvl1_wir[i]) lvl1_wir_data[i] = lvl1_wir[i].value;
                  
                  if(lvl1_wir_data == `P1687_QRYUPD_ONLY_OPCODE) begin
                     lvl2_sbc.in = lvl1_swb.out;
                     lvl2_seb.in = lvl2_sbc.out;
                     lvl2_sib[`LVL2SIB_WIDTH - 1].in = lvl2_seb.out;
                     for(int i=0; i<`LVL2SIB_WIDTH - 1; i++) lvl2_sib[i].in = lvl2_sib[i+1].out;
                     
                     if(shift_cycle == jtag_tx.o_dr_length-1)begin
                        node_out_update(); 
                        node_value_update(); 
                     end// if(shift_cycle == jtag_tx.o_dr_length-1)begin

                  end

                  if(lvl1_wir_data == `SUB_CLIENT_SIB_OPCODE) begin
                     lvl2_sbc.in = lvl1_swb.out;
                     lvl2_seb.in = lvl2_sbc.out;
                     
                     if(lvl2_seb.value == 1'b0) begin
                        lvl2_sib[`LVL2SIB_WIDTH - 1].in = lvl2_seb.out;
                        for(int i=0; i<`LVL2SIB_WIDTH - 1; i++) lvl2_sib[i].in = lvl2_sib[i+1].out;
                     end
                     else begin
                        lvl2_swb.in = lvl2_seb.out;
                        //current only consider one sib bit is opened at a time.
                        if(lvl2_swb.value == 1'b1) begin
                           lvl2_wir[`IEEE_1500_IR_WIDTH - 1].in = lvl2_swb.out;
                           for(int i=0; i<`IEEE_1500_IR_WIDTH - 1; i++) lvl2_wir[i].in = lvl2_wir[i+1].out;
                        end
                        else begin
                           lvl2_wdr_dynmc[lvl2_wdr_dynmc.size - 1].in = lvl2_swb.out;
                           for(int i=0; i<lvl2_wdr_dynmc.size - 1; i++) lvl2_wdr_dynmc[i].in = lvl2_wdr_dynmc[i+1].out;
   
                           if(shift_cycle == jtag_tx.o_dr_length-1)begin
                              cght_data.caught_1500_reg = 1;
                              for(int i=0; i<`LVL1SIB_WIDTH; i++) cght_data.reg_addr[i] = lvl1_sib[i].value;
                              for(int i=`LVL1SIB_WIDTH; i<`SIB_WIDTH; i++) cght_data.reg_addr[i] = lvl2_sib[i - `LVL1SIB_WIDTH].value;
                              foreach(lvl2_wir[i]) cght_data.reg_addr[`SIB_WIDTH+i] = lvl2_wir[i].value;
                                       
                              //last shift cycle,in order to store DR in caught_data, need to update out and value in advance.
                              node_out_update(); 
                              node_value_update(); 

                              foreach(lvl2_wdr_dynmc[i]) cght_data.reg_data_q[i] = lvl2_wdr_dynmc[i].value;
                           end// if(shift_cycle == jtag_tx.o_dr_length-1)begin
                        end// if(lvl2_swb.value == 1'b0)
                     end// if(lvl2_seb == 1'b1) begin
                  end// if(lvl1_wir_data == `SUB_CLIENT_SIB_OPCODE) begin
                  else begin
                     lvl1_wdr_dynmc[lvl1_wdr_dynmc.size - 1].in = lvl1_swb.out;
                     for(int i=0; i<lvl1_wdr_dynmc.size - 1; i++) lvl1_wdr_dynmc[i].in = lvl1_wdr_dynmc[i+1].out;
   
                     if(shift_cycle == jtag_tx.o_dr_length-1)begin
                        cght_data.caught_1500_reg = 1;
                        for(int i=0; i<`LVL1SIB_WIDTH; i++) cght_data.reg_addr[i] = lvl1_sib[i].value;
                        for(int i=`LVL1SIB_WIDTH; i<`SIB_WIDTH; i++) cght_data.reg_addr[i] = lvl2_sib[i - `LVL1SIB_WIDTH].value;
                        foreach(lvl1_wir[i]) cght_data.reg_addr[`SIB_WIDTH+i] = lvl1_wir[i].value;
                                 
                        //last shift cycle,in order to store DR in caught_data, need to update out and value in advance.
                        node_out_update(); 
                        node_value_update(); 

                        foreach(lvl1_wdr_dynmc[i]) cght_data.reg_data_q[i] = lvl1_wdr_dynmc[i].value;
                     end// if(shift_cycle == jtag_tx.o_dr_length-1)begin
                  end // if(lvl1_wir_data != `SUB_CLIENT_SIB_OPCODE) begin
               end// if(lvl1_swb.value == 1'b0) begin
            end// if(lvl1_seb.value == 1'b1)
            node_out_update(); 
         end//for(int shift_cycle = 0; shift_cycle < jtag_tx.o_dr_length; shift_cycle++) begin

         node_value_update(); 
         node_value_print(); 
         lvl1_wdr_dynmc.delete();
         lvl2_wdr_dynmc.delete();
  
         return cght_data;

      end// if(temp_ir == `P1687_OPCODE) begin
      
      if(temp_ir == `P1687_QRYUPD_ONLY_OPCODE) begin
         for(int shift_cycle = 0; shift_cycle < jtag_tx.o_dr_length; shift_cycle++) begin
            tdi = jtag_tx.read_not_write ? jtag_tx.tdo_dr_queue[shift_cycle] : jtag_tx.tdi_dr_queue[shift_cycle];
            lvl1_seb.in = tdi;
            //if `LVL1SIB_WIDTH has update, following need to be updated accordingly.
            lvl1_sib[0].in = lvl1_seb.out;
            node_out_update(); 
         end
         node_value_update(); 
         node_value_print(); 
         lvl1_wdr_dynmc.delete();
         lvl2_wdr_dynmc.delete();
         return cght_data;
      end// if(temp_ir == `P1687_QRYUPD_ONLY_OPCODE) begin

   endfunction: dft_tdr_network
endclass:dft_register_monitor

`uvm_blocking_put_imp_decl(_of_reg_monitor_port)
//---------------------------------------------------------------------------
// Class: dft_register_sequencer
//---------------------------------------------------------------------------
//typedef uvm_sequencer #(dft_register_transaction) dft_register_sequencer;
class dft_register_sequencer extends uvm_sequencer #(dft_register_transaction);
   `uvm_component_utils (dft_register_sequencer )
   
   uvm_blocking_put_imp_of_reg_monitor_port #(dft_network_info, dft_register_sequencer)    dft_network_info_put_export;
   dft_network_info                                                    dft_ntwrk_info;
   const string                                                        report_id;
   bit                                                                 smart_mode;
   jtag_configuration                                                  jtag_cfg;

   function new( string name, uvm_component parent );
      super.new( name, parent );
      report_id = name;
   endfunction: new
   
   function void build_phase( uvm_phase phase );
      super.build_phase( phase );
      //dft_network_info_put_export = new( .name("dft_network_info_put_export"), .parent(this) );
      dft_network_info_put_export = new( "dft_network_info_put_export", this );
      dft_ntwrk_info = dft_network_info::type_id::create("dft_ntwrk_info");
      
      assert(uvm_config_db#( jtag_configuration )::get ( .cntxt( this ), .inst_name( "*" ), .field_name( "jtag_cfg" ), .value( jtag_cfg) ))
      else `uvm_fatal("NOVIF", "Failed to get jtag_cfg form uvm_config_db.\n");

      smart_mode = jtag_cfg.dft_reg_layer_smart_mode;
   endfunction: build_phase

   virtual function void put_of_reg_monitor_port(input dft_network_info t);
      $cast(dft_ntwrk_info,t.clone()); 
      `uvm_info(report_id,$sformatf("Got updated DFT network info:\n%s",dft_ntwrk_info.convert2string),UVM_DEBUG);
   endfunction: put_of_reg_monitor_port

endclass: dft_register_sequencer  
//------------------------------------------------------------------------------
// Class: dft_register_adapter
//------------------------------------------------------------------------------

class dft_register_adapter extends uvm_reg_adapter;
   `uvm_object_utils( dft_register_adapter )
   const string                  report_id;
   int unsigned                  got_n_bits = 0;
   dft_register_transaction      dft_reg_tx = dft_register_transaction::type_id::create("dft_reg_tx");
   
   function new( string name = "" );
      super.new( name );
      supports_byte_enable = 0;
      provides_responses   = 0;
      report_id = name;
   endfunction: new

   virtual function uvm_sequence_item reg2bus( const ref uvm_reg_bus_op rw );
      bus_reg_ext                   extension;
      uvm_reg_item                  item = get_item();
      int unsigned                  total_n_bits = rw.n_bits;
      dft_register_transaction      dft_reg_tx_return =  dft_register_transaction::type_id::create("dft_reg_tx_return"); 
      
      got_n_bits = got_n_bits + rw.n_bits;
      
      if(!$cast(extension,item.extension))
         `uvm_error("reg2bus", "Extension casting failed.")

      if( extension != null ) dft_reg_tx.extension = extension;
      dft_reg_tx.address = rw.addr;
     
      //Fix read_not_write to write opertion only.
      dft_reg_tx.read_not_write = 0;

      for(int i=0; i<rw.n_bits; i++)  dft_reg_tx.wr_data_q = {dft_reg_tx.wr_data_q, rw.data[i]}; 
      dft_reg_tx.reg_length += rw.n_bits;

      `uvm_info( "dft_reg_adapter",{dft_reg_tx.convert2string}, UVM_MEDIUM);
      $cast(dft_reg_tx_return, dft_reg_tx.clone());


      if(total_n_bits == got_n_bits) begin
         dft_reg_tx.wr_data_q.delete();
         dft_reg_tx.rd_data_q.delete();
         dft_reg_tx.reg_length = 0;

         got_n_bits = 0;
      end
      return dft_reg_tx_return;
   endfunction: reg2bus
   
   virtual function void bus2reg( uvm_sequence_item bus_item, ref uvm_reg_bus_op rw );
      dft_register_transaction  dft_reg_tx;
      
      if ( ! $cast( dft_reg_tx, bus_item ) ) begin
         `uvm_fatal( get_name(), "bus_item is not of the dft_register_transaction type." )
         return;
      end
     
      rw.kind = (dft_reg_tx.read_not_write == 1) ? UVM_READ : UVM_WRITE;
      rw.addr = dft_reg_tx.address;

      if(dft_reg_tx.read_not_write == 1) begin
         foreach(dft_reg_tx.rd_data_q[i]) rw.data[i] = dft_reg_tx.rd_data_q[i];
      end
      else begin
         foreach(dft_reg_tx.wr_data_q[i]) rw.data[i] = dft_reg_tx.wr_data_q[i];
      end
   endfunction: bus2reg
endclass: dft_register_adapter

//------------------------------------------------------------------------------
// Class: dft_register_predictor
//------------------------------------------------------------------------------

//typedef uvm_reg_predictor#( dft_register_transaction ) dft_register_predictor;
class dft_register_predictor extends uvm_reg_predictor#( dft_register_transaction );
  
   
  `uvm_component_utils(dft_register_predictor)
  
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction


   virtual function void write(BUSTYPE tr);
     uvm_reg rg;
     uvm_reg_bus_op rw;
     int unsigned array_size;
    if (adapter == null)
     `uvm_fatal("REG/WRITE/NULL","write: adapter handle is null") 

     // In case they forget to set byte_en
     rw.byte_en = -1;
     adapter.bus2reg(tr,rw);
     rg = map.get_reg_by_offset(rw.addr, (rw.kind == UVM_READ));

     // ToDo: Add memory look-up and call <uvm_mem::XsampleX()>

     if (rg != null) begin
       bit found;
       uvm_reg_item reg_item;
       uvm_reg_map local_map;
       uvm_reg_map_info map_info;
       uvm_predict_s predict_info;
       uvm_reg_indirect_data ireg;
       uvm_reg ir;
 
       if (!m_pending.exists(rg)) begin
         uvm_reg_item item = new;
         predict_info =new;
         item.element_kind = UVM_REG;
         item.element      = rg;
         item.path         = UVM_PREDICT;
         item.map          = map;
         item.kind         = rw.kind;
         predict_info.reg_item = item;
         m_pending[rg] = predict_info;
       end
       predict_info = m_pending[rg];
       reg_item = predict_info.reg_item;

       if (predict_info.addr.exists(rw.addr)) begin
          `uvm_error("REG_PREDICT_COLLISION",{"Collision detected for register '",
                     rg.get_full_name(),"'"})
          // TODO: what to do with subsequent collisions?
          m_pending.delete(rg);
       end

       local_map = rg.get_local_map(map,"predictor::write()");
       map_info = local_map.get_reg_map_info(rg);
       ir=($cast(ireg, rg))?ireg.get_indirect_reg():rg;

       foreach (map_info.addr[i]) begin
         if (rw.addr == map_info.addr[i]) begin
            found = 1;
           //reg_item.value[0] |= rw.data << (i * map.get_n_bytes()*8);
           //call bus2reg multiple times to get full data.
           //BOZO implement this later. current use tr to assign data to reg_item directly.
           array_size = tr.reg_length / `UVM_REG_DATA_WIDTH + ((tr.reg_length % `UVM_REG_DATA_WIDTH == 0) ? 0 : 1);
           
           reg_item.value.delete();
           reg_item.value = new[array_size];
           
           for(int i=0; i<array_size-1; i++)
              for(int j=0; j<`UVM_REG_DATA_WIDTH;j++) reg_item.value[i][j] = tr.wr_data_q.pop_front();
           foreach(tr.wr_data_q[i]) reg_item.value[array_size-1][i] = tr.wr_data_q.pop_front();
           
           reg_item.n_bits = tr.reg_length;

           predict_info.addr[rw.addr] = 1;
           if (predict_info.addr.num() == map_info.addr.size()) begin
              // We've captured the entire abstract register transaction.
              uvm_predict_e predict_kind = 
                  (reg_item.kind == UVM_WRITE) ? UVM_PREDICT_WRITE : UVM_PREDICT_READ;

              if (reg_item.kind == UVM_READ &&
                  local_map.get_check_on_read() &&
                  reg_item.status != UVM_NOT_OK) begin
                 void'(rg.do_check(ir.get_mirrored_value(), reg_item.value[0], local_map));
              end
              
              pre_predict(reg_item);

              ir.XsampleX(reg_item.value[0], rw.byte_en,
                          reg_item.kind == UVM_READ, local_map);
              begin
                 uvm_reg_block blk = rg.get_parent();
                 blk.XsampleX(map_info.offset,
                              reg_item.kind == UVM_READ,
                              local_map);
              end

              rg.do_predict(reg_item, predict_kind, rw.byte_en);
              if(reg_item.kind == UVM_WRITE)
                `uvm_info("REG_PREDICT", {"Observed WRITE transaction to register ",
                         ir.get_full_name(), ": value='h",
                         $sformatf("%0h",rg.print_array_value(reg_item)), " : updated value = 'h", 
                         $sformatf("%0h",ir.get())},UVM_HIGH)
              else
                `uvm_info("REG_PREDICT", {"Observed READ transaction to register ",
                         ir.get_full_name(), ": value='h",
                         $sformatf("%0h",rg.print_array_value(reg_item))},UVM_HIGH)
              reg_ap.write(reg_item);
              m_pending.delete(rg);
           end
           break;
         end
       end
       if (!found)
         `uvm_error("REG_PREDICT_INTERNAL",{"Unexpected failed address lookup for register '",
                  rg.get_full_name(),"'"})
     end
     else begin
       `uvm_info("REG_PREDICT_NOT_FOR_ME",
          {"Observed transaction does not target a register: ",
            $sformatf("%p",tr)},UVM_FULL)
     end
  endfunction: write
endclass: dft_register_predictor

//---------------------------------------------------------------------------
// Class: dft_register_map
//---------------------------------------------------------------------------

class dft_register_map extends uvm_subscriber#( dft_register_transaction );
   `uvm_component_utils( dft_register_map )
   
   dft_register_transaction     dft_reg_tx;

   function new( string name, uvm_component parent );
      super.new( name, parent );
   endfunction: new

   function void build_phase( uvm_phase phase );
      super.build_phase( phase );
      dft_reg_tx = dft_register_transaction::type_id::create(.name("dft_reg_tx"));
   endfunction: build_phase

   function void write( dft_register_transaction t);
       dft_reg_tx = t;
       //`uvm_info("dft_register_map",{"\n",t.sprint(p)},UVM_LOW);
   endfunction: write

endclass:dft_register_map

//---------------------------------------------------------------------------
// Class: dft_reg_tx_to_jtag_tx_sequence
//---------------------------------------------------------------------------
   
class dft_reg_tx_to_jtag_tx_sequence extends uvm_sequence#( jtag_transaction);
   `uvm_object_utils( dft_reg_tx_to_jtag_tx_sequence )
   const string          report_id;

   function new( string name = "dft_reg_tx_to_jtag_tx_sequence" );
      super.new( name );
      report_id = name;
   endfunction: new

   dft_register_sequencer                       up_sequencer;

   dft_register_transaction                     dft_reg_tx;
   jtag_transaction                             jtag_tx_q[$];

   bit[`SIB_WIDTH-1:0]                          sib; 
   bit[`LVL1SIB_WIDTH-1:0]                      lvl1_sib;
   bit                                          lvl1_seb = 1'b1, lvl1_sbc = 1'b0; 
   bit[`LVL2SIB_WIDTH-1:0]                      lvl2_sib; 
   bit                                          lvl2_seb = 1'b1, lvl2_sbc = 1'b0; 
   bit[`IEEE_1500_IR_WIDTH-1:0]                 wir = `SUB_CLIENT_SIB_OPCODE; 
   bit[`IEEE_1500_IR_WIDTH-1:0]                 p1687_qryupd_only_opcode = `P1687_QRYUPD_ONLY_OPCODE; 
   bit[`IEEE_1500_IR_WIDTH-1:0]                 sub_client_sib_opcode = `SUB_CLIENT_SIB_OPCODE; 
   bit[`IEEE_1149_IR_WIDTH-1:0]                 ir = `P1687_OPCODE; 
   bit                                          lvl1_sel_wir,lvl2_sel_wir; 
   bit                                          temp_dr_q[$]; 
   jtag_transaction                             jtag_tx;
   int unsigned                                 q_index = 0;
   string                                       q_name;
   
   //if smart_mode is 1, the dft_reg_tx_to_jtag_tx_sequence will covert dft_register_transaction according to network status.
   logic                                        smart_mode;
   dft_network_info                             dft_ntwrk_info;
   jtag_configuration                           jtag_cfg;
   logic                                        is_lvl1_reg = 0, is_lvl2_reg = 0;
   logic[`LVL2SIB_WIDTH-1:0]                    crnt_lvl2_sib;
   logic[`LVL1SIB_WIDTH-1:0]                    crnt_lvl1_sib;
   logic[`IEEE_1500_IR_WIDTH-1:0]               crnt_lvl1_wir;
   logic[`IEEE_1500_IR_WIDTH-1:0]               crnt_lvl2_wir;


 
   //Currently does not consider keep sib status after each register r/w. It will be enhanced later to save test times.
   //support check function has not implemented.
   function void dft_reg_tx_to_jtag_tx (dft_register_transaction dft_reg_tx, ref jtag_transaction jtag_tx_q[$]);
       
     
      //-----------------------------------
      //1149 TDR
      //-----------------------------------
      if(sib == `SIB_WIDTH'h0) begin
         q_index = 0;
         q_name = $sformatf("jtag_tx_q[%0d]",q_index);
         jtag_tx_q[q_index] = jtag_transaction::type_id::create( .name(q_name) );
         jtag_tx_q[q_index].read_not_write = dft_reg_tx.read_not_write;
         if($test$plusargs("sptap")) begin
            jtag_tx_q[q_index].o_ir_length = 3;
         end 
         else begin
            jtag_tx_q[q_index].o_ir_length = `IEEE_1149_IR_WIDTH;
         end
         jtag_tx_q[q_index].o_ir = new[jtag_tx_q[q_index].o_ir_length];
         foreach(jtag_tx_q[q_index].o_ir[i])jtag_tx_q[q_index].o_ir[i] = dft_reg_tx.address[`SIB_WIDTH+i];

         jtag_tx_q[q_index].o_dr_length = dft_reg_tx.reg_length;
         jtag_tx_q[q_index].o_dr = new[jtag_tx_q[q_index].o_dr_length];
         foreach(jtag_tx_q[q_index].o_dr[i])jtag_tx_q[q_index].o_dr[i] = dft_reg_tx.wr_data_q[i];

         jtag_tx_q[q_index].chk_ir_tdo       = dft_reg_tx.extension.chk_ir_tdo;
         jtag_tx_q[q_index].chk_dr_tdo       = dft_reg_tx.extension.chk_dr_tdo;
         jtag_tx_q[q_index].exp_tdo_dr_queue = dft_reg_tx.extension.exp_tdo_dr_q; 
         jtag_tx_q[q_index].exp_tdo_dr_mask_queue = dft_reg_tx.extension.exp_tdo_dr_mask_q; 
         jtag_tx_q[q_index].exp_tdo_ir_queue = dft_reg_tx.extension.exp_tdo_ir_q; 
      end//if(sib == `SIB_WIDTH'h0) begin
      //-----------------------------------
      //1500 TDR 
      //-----------------------------------
      else if(smart_mode == 0) begin
         //step1 open sib
         jtag_tx.o_ir_length = `IEEE_1149_IR_WIDTH;
         jtag_tx.o_ir = new[jtag_tx.o_ir_length];
         foreach(jtag_tx.o_ir[i]) jtag_tx.o_ir[i] = ir[i];

         jtag_tx.o_dr_length = 2;
         jtag_tx.o_dr = new[jtag_tx.o_dr_length];
         lvl1_sib = 1;
         lvl1_seb = 1;
         jtag_tx.o_dr = {lvl1_seb,lvl1_sib};

         q_index = 0;
         q_name = $sformatf("jtag_tx_q[%0d]",q_index);
         jtag_tx_q[q_index] = jtag_transaction::type_id::create(q_name);
         $cast(jtag_tx_q[q_index], jtag_tx.clone()); 
         jtag_tx.o_dr.delete(); 

         //step2: load user wir or `SUB_CLIENT_SIB_OPCODE
         lvl1_sel_wir = 1'b0; //lvl1_sel_wir <=> SWB bit.
         
         jtag_tx.o_dr_length = `IEEE_1500_IR_WIDTH + 1 + 1;
         jtag_tx.o_dr = new[jtag_tx.o_dr_length];

         //For SN, lvl1_sib is one bit.
         temp_dr_q = {lvl1_seb,lvl1_sel_wir};
         //load SUB_CLIENT_SIB_OPCODE WIR
         if(lvl2_sib!=0) begin
            for(int i=0; i<`IEEE_1500_IR_WIDTH; i++) temp_dr_q.push_back(sub_client_sib_opcode[`IEEE_1500_IR_WIDTH - 1 - i]);
            //foreach(temp_dr_q[i]) $display( "temp_dr_q[%0d] = %0b",i,temp_dr_q[$-i] );
         end
         //load user WIR
         else begin
            for(int i=0; i<`IEEE_1500_IR_WIDTH; i++) temp_dr_q.push_back(dft_reg_tx.address[`DFT_REG_ADDR_WIDTH - 1- i]);
         end

         foreach(temp_dr_q[i])jtag_tx.o_dr[i] = temp_dr_q[$-i];
         
         q_index = q_index + 1; 
         q_name = $sformatf("jtag_tx_q[%0d]",q_index);
         jtag_tx_q[q_index] = jtag_transaction::type_id::create(q_name);
         $cast(jtag_tx_q[q_index], jtag_tx.clone()); 
         
         
         jtag_tx.o_dr.delete(); 
         temp_dr_q.delete(); 
         
         //step3: load wdr or  2nd level sib
         if(lvl2_sib!=0)begin
            //lvl1_seb -> lvl1_sel_wir -> lvl2_sbc -> lvl2_seb, total 4 bits.
            jtag_tx.o_dr_length = `LVL2SIB_WIDTH + 1 + 1 + 1 + 1;
            jtag_tx.o_dr = new[jtag_tx.o_dr_length];

            lvl1_sel_wir = 0;
            lvl2_seb = 1'b1;
            lvl2_sbc = 1'b0;
            temp_dr_q = {lvl1_seb,lvl1_sel_wir,lvl2_sbc,lvl2_seb};
            //foreach(lvl2_sib[i]) temp_dr_q.push_back(lvl2_sib[`LVL2SIB_WIDTH - 1 - i]);
            for(int i=0; i<`LVL2SIB_WIDTH; i++) temp_dr_q.push_back(lvl2_sib[`LVL2SIB_WIDTH - 1 - i]);
         end
         else begin
            //One bit lvl1_seb,one bit lvl1 SWB
            jtag_tx.o_dr_length = dft_reg_tx.reg_length + 1 + 1;
            jtag_tx.o_dr = new[jtag_tx.o_dr_length];
            
            lvl1_sel_wir = 1'b1;
            temp_dr_q = {lvl1_seb,lvl1_sel_wir};
            foreach(dft_reg_tx.wr_data_q[i]) temp_dr_q.push_back(dft_reg_tx.wr_data_q[$-i]);
         end

         foreach(temp_dr_q[i])jtag_tx.o_dr[i] = temp_dr_q[$-i];
         q_index = q_index + 1; 
         q_name = $sformatf("jtag_tx_q[%0d]",q_index);
         jtag_tx_q[q_index] = jtag_transaction::type_id::create(q_name);
         $cast(jtag_tx_q[q_index], jtag_tx.clone()); 
         
         //add check information 
         if(lvl2_sib == 0)begin
            jtag_tx_q[q_index].chk_ir_tdo       = dft_reg_tx.extension.chk_ir_tdo;
            jtag_tx_q[q_index].chk_dr_tdo       = dft_reg_tx.extension.chk_dr_tdo;
            jtag_tx_q[q_index].exp_tdo_dr_queue = dft_reg_tx.extension.exp_tdo_dr_q; 
            jtag_tx_q[q_index].exp_tdo_dr_mask_queue = dft_reg_tx.extension.exp_tdo_dr_mask_q; 
            jtag_tx_q[q_index].exp_tdo_ir_queue = dft_reg_tx.extension.exp_tdo_ir_q;
         end

         temp_dr_q.delete(); 
         jtag_tx.o_dr.delete(); 
         
         //step4 write 2nd level user WIR then WDR
         if(lvl2_sib!=0)begin
            //load 2nd levle WIR
            //one bit lvl1_seb, one bit lvl1 sel_wir, one bit lvl2_sbc, one bit lvl2_seb and one bit lvl2 sel_wir
            jtag_tx.o_dr_length = `IEEE_1500_IR_WIDTH + 1 + 1 + 1 + 1 + 1;
            jtag_tx.o_dr = new[jtag_tx.o_dr_length];

            lvl1_sel_wir = 0;
            lvl2_sel_wir = 0;
            temp_dr_q = {lvl1_seb,lvl1_sel_wir,lvl2_sbc,lvl2_seb,lvl2_sel_wir};
            
            for(int i=0; i<`IEEE_1500_IR_WIDTH; i++) temp_dr_q.push_back(dft_reg_tx.address[`DFT_REG_ADDR_WIDTH - 1 - i]); 
            foreach(temp_dr_q[i])jtag_tx.o_dr[i] = temp_dr_q[$-i];
            
            q_index = q_index + 1; 
            q_name = $sformatf("jtag_tx_q[%0d]",q_index);
            jtag_tx_q[q_index] = jtag_transaction::type_id::create(q_name);
            $cast(jtag_tx_q[q_index], jtag_tx.clone()); 
            
            temp_dr_q.delete(); 
            jtag_tx.o_dr.delete(); 
            
            //load 2nd levle WDR
            //one bit lvl1_seb, one bit lvl1 sel_wir, one bit lvl2_sbc, one bit lvl2_seb and one bit lvl2 sel_wir
            jtag_tx.o_dr_length = dft_reg_tx.reg_length + 1 + 1 + 1 + 1 + 1;
            jtag_tx.o_dr = new[jtag_tx.o_dr_length];
            
            lvl1_sel_wir = 1;
            lvl2_sel_wir = 1;
            temp_dr_q = {lvl1_seb,lvl1_sel_wir,lvl2_sbc,lvl2_seb,lvl2_sel_wir};
            foreach(dft_reg_tx.wr_data_q[i]) temp_dr_q.push_back(dft_reg_tx.wr_data_q[$-i]);
            foreach(temp_dr_q[i])jtag_tx.o_dr[i] = temp_dr_q[$-i];
            
            q_index = q_index + 1; 
            q_name = $sformatf("jtag_tx_q[%0d]",q_index);
            jtag_tx_q[q_index] = jtag_transaction::type_id::create(q_name);
            $cast(jtag_tx_q[q_index], jtag_tx.clone()); 
            
            //add check information 
            jtag_tx_q[q_index].chk_ir_tdo       = dft_reg_tx.extension.chk_ir_tdo;
            jtag_tx_q[q_index].chk_dr_tdo       = dft_reg_tx.extension.chk_dr_tdo;
            jtag_tx_q[q_index].exp_tdo_dr_queue = dft_reg_tx.extension.exp_tdo_dr_q; 
            jtag_tx_q[q_index].exp_tdo_dr_mask_queue = dft_reg_tx.extension.exp_tdo_dr_mask_q; 
            jtag_tx_q[q_index].exp_tdo_ir_queue = dft_reg_tx.extension.exp_tdo_ir_q;

            temp_dr_q.delete(); 
            jtag_tx.o_dr.delete(); 
         end//2nd level WIR or WDR write
      
         //step5  load QRYUPD_ONLY WIR
         if(lvl2_sib!=0)begin
             //load 1st levle QRYUPD_ONLY WIR
            lvl1_sel_wir = 1'b0; //lvl1_sel_wir <=> SWB bit.
            
            jtag_tx.o_dr_length = `IEEE_1500_IR_WIDTH + 1 + 1;
            jtag_tx.o_dr = new[jtag_tx.o_dr_length];

            //For SN, lvl1_sib is one bit.
            temp_dr_q = {lvl1_seb,lvl1_sel_wir};
            //load QRYUPD_ONLY WIR
            for(int i=0; i<`IEEE_1500_IR_WIDTH; i++) temp_dr_q.push_back(p1687_qryupd_only_opcode[`IEEE_1500_IR_WIDTH - 1- i]);
         end//load 2nd levle QRYUPD_ONLY WIR
         else begin
            //Load 1149 QRYUPD_ONLY IR
            jtag_tx.o_ir_length = `IEEE_1149_IR_WIDTH;
            jtag_tx.o_ir = new[jtag_tx.o_ir_length];
            foreach(jtag_tx.o_ir[i]) jtag_tx.o_ir[i] = p1687_qryupd_only_opcode[i];
            
            //one bit lvl1_seb
            jtag_tx.o_dr_length = 1 + `LVL1SIB_WIDTH;
            jtag_tx.o_dr = new[jtag_tx.o_dr_length];
            lvl1_seb = 0; //seb default is 0
            temp_dr_q = {lvl1_seb};
            for(int i=0; i<`LVL1SIB_WIDTH; i++) temp_dr_q.push_back(1'b0);
         end //step5 if(lvl2_sib == 0)
         
         foreach(temp_dr_q[i])jtag_tx.o_dr[i] = temp_dr_q[$-i];
         q_index = q_index + 1; 
         q_name = $sformatf("jtag_tx_q[%0d]",q_index);
         jtag_tx_q[q_index] = jtag_transaction::type_id::create(q_name);
         $cast(jtag_tx_q[q_index], jtag_tx.clone()); 
         
         jtag_tx.o_dr.delete(); 
         temp_dr_q.delete();
         
         //step6 clear SIB
         if(lvl2_sib!=0)begin
             //lvl1_seb -> lvl1_sel_wir -> lvl2_sbc -> lvl2_seb
            jtag_tx.o_dr_length = `LVL2SIB_WIDTH + 1 + 1 + 1 + 1;
            jtag_tx.o_dr = new[jtag_tx.o_dr_length];
            lvl2_seb = 1'b0; 
            lvl1_sel_wir = 1'b1;
            temp_dr_q = {lvl1_seb,lvl1_sel_wir,lvl2_sbc,lvl2_seb};
            for(int i=0; i<`LVL2SIB_WIDTH; i++) temp_dr_q.push_back(1'b0);
            
            foreach(temp_dr_q[i])jtag_tx.o_dr[i] = temp_dr_q[$-i];
            q_index = q_index + 1; 
            q_name = $sformatf("jtag_tx_q[%0d]",q_index);
            jtag_tx_q[q_index] = jtag_transaction::type_id::create(q_name);
            $cast(jtag_tx_q[q_index], jtag_tx.clone()); 
            
            jtag_tx.o_dr.delete(); 
            temp_dr_q.delete();
            
            //Load 1149 QRYUPD_ONLY IR
            jtag_tx.o_ir_length = `IEEE_1149_IR_WIDTH;
            jtag_tx.o_ir = new[jtag_tx.o_ir_length];
            foreach(jtag_tx.o_ir[i]) jtag_tx.o_ir[i] = p1687_qryupd_only_opcode[i];
            
            //one bit lvl1_seb
            jtag_tx.o_dr_length = 1 + `LVL1SIB_WIDTH;
            jtag_tx.o_dr = new[jtag_tx.o_dr_length];
            lvl1_seb = 0; //seb default is 0
            temp_dr_q = {lvl1_seb};
            for(int i=0; i<`LVL1SIB_WIDTH; i++) temp_dr_q.push_back(1'b0);
            
            foreach(temp_dr_q[i])jtag_tx.o_dr[i] = temp_dr_q[$-i];
            q_index = q_index + 1; 
            q_name = $sformatf("jtag_tx_q[%0d]",q_index);
            jtag_tx_q[q_index] = jtag_transaction::type_id::create(q_name);
            $cast(jtag_tx_q[q_index], jtag_tx.clone()); 
            
            jtag_tx.o_dr.delete(); 
            temp_dr_q.delete();
 
         end//load 2nd levle QRYUPD_ONLY WIR
      end// else if(smart_mode == 0) begin
      else if(smart_mode == 1) begin
         //My general idea:
         //identify the register to be written is controlled by which SIBs.
         //Judge the controlling SIBs are opened already.
         //Different situations of the SIBs status in current network decide how to configue the register write sequence.
         //If current WIR in network is same as the register'w WIR, skip WIR shift step.
         q_index = 0;
         if(is_lvl1_reg) begin
            case({crnt_lvl2_sib,crnt_lvl1_sib})
               //only consider valid combination and don't support broadcast mode.
               `SIB_WIDTH'h0: open_lvl1_sib();
               `SIB_WIDTH'h1: begin
                  `uvm_info(report_id,{"lvl1 sib has already opened.\n"}, UVM_DEBUG); 
               end
               `SIB_WIDTH'b0000_0001_1,
               `SIB_WIDTH'b0000_0010_1,
               `SIB_WIDTH'b0000_0100_1,
               `SIB_WIDTH'b0000_1000_1,
               `SIB_WIDTH'b0001_0000_1,
               `SIB_WIDTH'b0010_0000_1,
               `SIB_WIDTH'b0100_0000_1,
               `SIB_WIDTH'b1000_0000_1: close_lvl2_sib();
               default:`uvm_error(report_id,$sformatf("Invalid SIB combination value, lvl2_sib = %b, lvl1_sib = %b", crnt_lvl2_sib, crnt_lvl1_sib))
            endcase
            write_lvl1_reg();
         end// if(is_lvl1_reg) begin

         if(is_lvl2_reg) begin
            case({crnt_lvl2_sib,crnt_lvl1_sib})
               //only consider valid combination and don't support broadcast mode.
               `SIB_WIDTH'd0: begin
                  open_lvl1_sib();
                  open_lvl2_sib();
               end
               `SIB_WIDTH'd1: begin
                  open_lvl2_sib();
               end
               `SIB_WIDTH'b0000_0001_1,
               `SIB_WIDTH'b0000_0010_1,
               `SIB_WIDTH'b0000_0100_1,
               `SIB_WIDTH'b0000_1000_1,
               `SIB_WIDTH'b0001_0000_1,
               `SIB_WIDTH'b0010_0000_1,
               `SIB_WIDTH'b0100_0000_1,
               `SIB_WIDTH'b1000_0000_1: begin
                  if(crnt_lvl2_sib != lvl2_sib) begin
                     close_lvl2_sib();
                     open_lvl2_sib();
                  end
                  else set_lvl1_sel_wir(0);
               end
               default:`uvm_error(report_id,$sformatf("Invalid SIB combination value, lvl2_sib = %b, lvl1_sib = %b", crnt_lvl2_sib, crnt_lvl1_sib))
            endcase
            write_lvl2_reg();
         end// if(is_lvl2_stc1_reg || is_lvl2_stc0_reg) begin
      end //else if(smart_mode == 1) begin
      foreach(jtag_tx_q[i]) jtag_tx_q[i].read_not_write = dft_reg_tx.read_not_write;
   endfunction: dft_reg_tx_to_jtag_tx 
   
   function void write_lvl2_reg();
      //load 2nd levle WIR
      jtag_tx.o_ir_length = `IEEE_1149_IR_WIDTH;
      jtag_tx.o_ir = new[jtag_tx.o_ir_length];
      ir = `P1687_OPCODE;
      foreach(jtag_tx.o_ir[i]) jtag_tx.o_ir[i] = ir[i];
 
      jtag_tx.o_dr_length = `IEEE_1500_IR_WIDTH + 1 + 1 + 1 + 1 + 1;
      jtag_tx.o_dr = new[jtag_tx.o_dr_length];

      lvl1_sel_wir = 0;
      lvl2_sel_wir = 0;
      temp_dr_q = {lvl1_seb,lvl1_sel_wir,lvl2_sbc,lvl2_seb,lvl2_sel_wir};
      
      for(int i=0; i<`IEEE_1500_IR_WIDTH; i++) temp_dr_q.push_back(dft_reg_tx.address[`DFT_REG_ADDR_WIDTH - 1 - i]); 
      foreach(temp_dr_q[i])jtag_tx.o_dr[i] = temp_dr_q[$-i];
      
      q_name = $sformatf("jtag_tx_q[%0d]",q_index);
      jtag_tx_q[q_index] = jtag_transaction::type_id::create(q_name);
      $cast(jtag_tx_q[q_index], jtag_tx.clone()); 
      
      temp_dr_q.delete(); 
      jtag_tx.o_dr.delete(); 
      q_index = q_index + 1; 
      
      //load 2nd levle WDR
      //one bit lvl1_seb, one bit lvl1 sel_wir, one bit lvl2_sbc, one bit lvl2_seb and one bit lvl2 sel_wir
      jtag_tx.o_dr_length = dft_reg_tx.reg_length + 1 + 1 + 1 + 1 + 1;
      jtag_tx.o_dr = new[jtag_tx.o_dr_length];
      
      lvl1_sel_wir = 1;
      lvl2_sel_wir = 1;
      temp_dr_q = {lvl1_seb,lvl1_sel_wir,lvl2_sbc,lvl2_seb,lvl2_sel_wir};
      foreach(dft_reg_tx.wr_data_q[i]) temp_dr_q.push_back(dft_reg_tx.wr_data_q[$-i]);
      foreach(temp_dr_q[i])jtag_tx.o_dr[i] = temp_dr_q[$-i];
      
      q_name = $sformatf("jtag_tx_q[%0d]",q_index);
      jtag_tx_q[q_index] = jtag_transaction::type_id::create(q_name);
      $cast(jtag_tx_q[q_index], jtag_tx.clone()); 
      
      //add check information 
      jtag_tx_q[q_index].chk_ir_tdo       = dft_reg_tx.extension.chk_ir_tdo;
      jtag_tx_q[q_index].chk_dr_tdo       = dft_reg_tx.extension.chk_dr_tdo;
      jtag_tx_q[q_index].exp_tdo_dr_queue = dft_reg_tx.extension.exp_tdo_dr_q; 
      jtag_tx_q[q_index].exp_tdo_dr_mask_queue = dft_reg_tx.extension.exp_tdo_dr_mask_q; 
      jtag_tx_q[q_index].exp_tdo_ir_queue = dft_reg_tx.extension.exp_tdo_ir_q;

      temp_dr_q.delete(); 
      jtag_tx.o_dr.delete();
      q_index = q_index + 1; 
   endfunction: write_lvl2_reg

   function void write_lvl1_reg();
      //Load user WIR
      jtag_tx.o_ir_length = `IEEE_1149_IR_WIDTH;
      jtag_tx.o_ir = new[jtag_tx.o_ir_length];
      ir = `P1687_OPCODE;
      foreach(jtag_tx.o_ir[i]) jtag_tx.o_ir[i] = ir[i];
      
      jtag_tx.o_dr_length = `IEEE_1500_IR_WIDTH + 1 + 1;
      jtag_tx.o_dr = new[jtag_tx.o_dr_length];
      lvl1_sel_wir = 1'b0; //lvl1_sel_wir <=> SWB bit.
      lvl1_seb = 1'b1;
      temp_dr_q = {lvl1_seb,lvl1_sel_wir};
      for(int i=0; i<`IEEE_1500_IR_WIDTH; i++) temp_dr_q.push_back(dft_reg_tx.address[`DFT_REG_ADDR_WIDTH - 1- i]);
     
      foreach(temp_dr_q[i])jtag_tx.o_dr[i] = temp_dr_q[$-i];
      temp_dr_q.delete(); 
      
      q_name = $sformatf("jtag_tx_q[%0d]",q_index);
      jtag_tx_q[q_index] = jtag_transaction::type_id::create(q_name);
      $cast(jtag_tx_q[q_index], jtag_tx.clone()); 
      jtag_tx.o_dr.delete();
     
      q_index = q_index + 1; 
      //Load user WDR
      //One bit lvl1_seb,one bit lvl1 SWB
      jtag_tx.o_dr_length = dft_reg_tx.reg_length + 1 + 1;
      jtag_tx.o_dr = new[jtag_tx.o_dr_length];
      
      lvl1_sel_wir = 1'b1;
      temp_dr_q = {lvl1_seb,lvl1_sel_wir};
      foreach(dft_reg_tx.wr_data_q[i]) temp_dr_q.push_back(dft_reg_tx.wr_data_q[$-i]);

      foreach(temp_dr_q[i])jtag_tx.o_dr[i] = temp_dr_q[$-i];
      temp_dr_q.delete(); 
      
      q_name = $sformatf("jtag_tx_q[%0d]",q_index);
      jtag_tx_q[q_index] = jtag_transaction::type_id::create(q_name);
      $cast(jtag_tx_q[q_index], jtag_tx.clone()); 
      jtag_tx.o_dr.delete(); 
      
      jtag_tx_q[q_index].chk_ir_tdo       = dft_reg_tx.extension.chk_ir_tdo;
      jtag_tx_q[q_index].chk_dr_tdo       = dft_reg_tx.extension.chk_dr_tdo;
      jtag_tx_q[q_index].exp_tdo_dr_queue = dft_reg_tx.extension.exp_tdo_dr_q; 
      jtag_tx_q[q_index].exp_tdo_dr_mask_queue = dft_reg_tx.extension.exp_tdo_dr_mask_q; 
      jtag_tx_q[q_index].exp_tdo_ir_queue = dft_reg_tx.extension.exp_tdo_ir_q;
      q_index = q_index + 1; 
   endfunction: write_lvl1_reg
   
   function void open_lvl1_sib();
      //Load 1149 QRYUPD_ONLY IR
      jtag_tx.o_ir_length = `IEEE_1149_IR_WIDTH;
      jtag_tx.o_ir = new[jtag_tx.o_ir_length];
      foreach(jtag_tx.o_ir[i]) jtag_tx.o_ir[i] = p1687_qryupd_only_opcode[i];
      
      //one bit lvl1_seb
      jtag_tx.o_dr_length = 1 + `LVL1SIB_WIDTH;
      jtag_tx.o_dr = new[jtag_tx.o_dr_length];
      lvl1_seb = 1; //seb default is 0
      temp_dr_q = {lvl1_seb};
      for(int i=0; i<`LVL1SIB_WIDTH; i++) temp_dr_q.push_back(1'b1);
      
      foreach(temp_dr_q[i])jtag_tx.o_dr[i] = temp_dr_q[$-i];
      temp_dr_q.delete(); 

      q_name = $sformatf("jtag_tx_q[%0d]",q_index);
      jtag_tx_q[q_index] = jtag_transaction::type_id::create(q_name);
      $cast(jtag_tx_q[q_index], jtag_tx.clone()); 
         
      q_index = q_index + 1; 
      jtag_tx.o_dr.delete();
   endfunction: open_lvl1_sib
   
   function void set_lvl1_sel_wir(bit desire_value);
      jtag_tx.o_ir_length = `IEEE_1149_IR_WIDTH;
      jtag_tx.o_ir = new[jtag_tx.o_ir_length];
      ir = `P1687_OPCODE;
      foreach(jtag_tx.o_ir[i]) jtag_tx.o_ir[i] = ir[i];
     
      //when lvl2 sibs are open, the TDO of lvl1 WIR will connect to WSI of the child STC and select WIR path if lvl2_wir is 1.
      //To keep WIR in lvl2, shift current lvl2 WIR at the same time when changing lvl1_sel_wir.
      jtag_tx.o_dr_length = `IEEE_1500_IR_WIDTH + 1 + 1 + 1 + `IEEE_1500_IR_WIDTH;
      jtag_tx.o_dr = new[jtag_tx.o_dr_length];
      lvl1_sel_wir = desire_value; //lvl1_sel_wir <=> SWB bit.
      lvl1_seb = 1'b1;
      lvl2_sbc = 1'b0;
      lvl2_seb = 1'b1;
      lvl2_sel_wir = 1'b1;
      temp_dr_q = {lvl1_seb,lvl1_sel_wir};
      for(int i=0; i<`IEEE_1500_IR_WIDTH; i++) temp_dr_q.push_back(sub_client_sib_opcode[`IEEE_1500_IR_WIDTH - 1 - i]);
      temp_dr_q = {temp_dr_q, lvl2_sel_wir};
      for(int i=0; i<`IEEE_1500_IR_WIDTH; i++) temp_dr_q.push_back(crnt_lvl2_wir[`IEEE_1500_IR_WIDTH - 1 - i]);
      foreach(temp_dr_q[i])jtag_tx.o_dr[i] = temp_dr_q[$-i];
      temp_dr_q.delete(); 
      
      q_name = $sformatf("jtag_tx_q[%0d]",q_index);
      jtag_tx_q[q_index] = jtag_transaction::type_id::create(q_name);
      $cast(jtag_tx_q[q_index], jtag_tx.clone()); 
      jtag_tx.o_dr.delete();
      q_index = q_index + 1; 
   
   endfunction: set_lvl1_sel_wir
  
   function void open_lvl2_sib();
      //Load `SUB_CLIENT_SIB_OPCODE into WIR
      jtag_tx.o_ir_length = `IEEE_1149_IR_WIDTH;
      jtag_tx.o_ir = new[jtag_tx.o_ir_length];
      ir = `P1687_OPCODE;
      foreach(jtag_tx.o_ir[i]) jtag_tx.o_ir[i] = ir[i];
      
      jtag_tx.o_dr_length = `IEEE_1500_IR_WIDTH + 1 + 1;
      jtag_tx.o_dr = new[jtag_tx.o_dr_length];
      lvl1_sel_wir = 1'b0; //lvl1_sel_wir <=> SWB bit.
      lvl1_seb = 1'b1;
      temp_dr_q = {lvl1_seb,lvl1_sel_wir};
      for(int i=0; i<`IEEE_1500_IR_WIDTH; i++) temp_dr_q.push_back(sub_client_sib_opcode[`IEEE_1500_IR_WIDTH - 1 - i]);
     
      foreach(temp_dr_q[i])jtag_tx.o_dr[i] = temp_dr_q[$-i];
      temp_dr_q.delete(); 
      
      q_name = $sformatf("jtag_tx_q[%0d]",q_index);
      jtag_tx_q[q_index] = jtag_transaction::type_id::create(q_name);
      $cast(jtag_tx_q[q_index], jtag_tx.clone()); 
      jtag_tx.o_dr.delete();
      q_index = q_index + 1; 
      
      //open lvl2 sib
      //lvl1_seb -> lvl1_sel_wir -> lvl2_sbc -> lvl2_seb, total 4 bits.
      jtag_tx.o_dr_length = `LVL2SIB_WIDTH + 1 + 1 + 1 + 1;
      jtag_tx.o_dr = new[jtag_tx.o_dr_length];

      lvl1_sel_wir = 0;
      lvl2_seb = 1'b1;
      lvl2_sbc = 1'b0;
      temp_dr_q = {lvl1_seb,lvl1_sel_wir,lvl2_sbc,lvl2_seb};
      for(int i=0; i<`LVL2SIB_WIDTH; i++) temp_dr_q.push_back(lvl2_sib[`LVL2SIB_WIDTH - 1 - i]);
      
      foreach(temp_dr_q[i])jtag_tx.o_dr[i] = temp_dr_q[$-i];
      temp_dr_q.delete(); 
      
      q_name = $sformatf("jtag_tx_q[%0d]",q_index);
      jtag_tx_q[q_index] = jtag_transaction::type_id::create(q_name);
      $cast(jtag_tx_q[q_index], jtag_tx.clone()); 
      jtag_tx.o_dr.delete(); 
      q_index = q_index + 1; 

   endfunction: open_lvl2_sib
   
   function void close_lvl2_sib();
      //Load `P1687_QRYUPD_ONLY_OPCODE into WIR
      jtag_tx.o_ir_length = `IEEE_1149_IR_WIDTH;
      jtag_tx.o_ir = new[jtag_tx.o_ir_length];
      ir = `P1687_OPCODE;
      foreach(jtag_tx.o_ir[i]) jtag_tx.o_ir[i] = ir[i];
      
      lvl1_sel_wir = 1'b0; //lvl1_sel_wir <=> SWB bit.
      lvl1_seb = 1'b1;
      
      jtag_tx.o_dr_length = `IEEE_1500_IR_WIDTH + 1 + 1;
      jtag_tx.o_dr = new[jtag_tx.o_dr_length];
      temp_dr_q = {lvl1_seb,lvl1_sel_wir};
      for(int i=0; i<`IEEE_1500_IR_WIDTH; i++) temp_dr_q.push_back(p1687_qryupd_only_opcode[`IEEE_1500_IR_WIDTH - 1- i]);
     
      foreach(temp_dr_q[i])jtag_tx.o_dr[i] = temp_dr_q[$-i];
      temp_dr_q.delete(); 
      
      q_name = $sformatf("jtag_tx_q[%0d]",q_index);
      jtag_tx_q[q_index] = jtag_transaction::type_id::create(q_name);
      $cast(jtag_tx_q[q_index], jtag_tx.clone()); 
      jtag_tx.o_dr.delete();
      q_index = q_index + 1; 
      
      //close lvl2 sib
      //lvl1_seb -> lvl1_sel_wir -> lvl2_sbc -> lvl2_seb, total 4 bits.
      jtag_tx.o_dr_length = `LVL2SIB_WIDTH + 1 + 1 + 1 + 1;
      jtag_tx.o_dr = new[jtag_tx.o_dr_length];

      lvl1_sel_wir = 1;
      lvl2_seb = 1'b0;
      lvl2_sbc = 1'b0;
      temp_dr_q = {lvl1_seb,lvl1_sel_wir,lvl2_sbc,lvl2_seb};
      for(int i=0; i<`LVL2SIB_WIDTH; i++) temp_dr_q.push_back(1'b0);
      
      foreach(temp_dr_q[i])jtag_tx.o_dr[i] = temp_dr_q[$-i];
      temp_dr_q.delete(); 
      
      q_name = $sformatf("jtag_tx_q[%0d]",q_index);
      jtag_tx_q[q_index] = jtag_transaction::type_id::create(q_name);
      $cast(jtag_tx_q[q_index], jtag_tx.clone()); 
      jtag_tx.o_dr.delete(); 
      q_index = q_index + 1; 

   endfunction: close_lvl2_sib
  
   task body();
      forever begin
         up_sequencer.get_next_item(dft_reg_tx);
         `uvm_info( report_id,{dft_reg_tx.convert2string}, UVM_DEBUG);
         
         jtag_tx = jtag_transaction::type_id::create( .name("jtag_tx") );
         dft_ntwrk_info = dft_network_info::type_id::create("dft_ntwrk_info");
        
         sib = dft_reg_tx.address[`SIB_WIDTH-1:0];
         lvl1_sib = sib[`LVL1SIB_WIDTH-1:0]; 
         lvl2_sib = sib[`LVL2SIB_WIDTH-1+`LVL1SIB_WIDTH:`LVL1SIB_WIDTH]; 

         is_lvl1_reg = (lvl1_sib !=0 && lvl2_sib == 0) ? 1 : 0; 
         is_lvl2_reg = (lvl1_sib !=0 && lvl2_sib != 0) ? 1 : 0; 

         smart_mode = up_sequencer.smart_mode;
        
         $cast(dft_ntwrk_info, up_sequencer.dft_ntwrk_info.clone());
         `uvm_info(report_id,dft_ntwrk_info.convert2string(),UVM_FULL);
         
         foreach(crnt_lvl1_sib[i]) crnt_lvl1_sib[i] = dft_ntwrk_info.lvl1_sib[i].value;
         foreach(crnt_lvl2_sib[i]) crnt_lvl2_sib[i] = dft_ntwrk_info.lvl2_sib[i].value;
         foreach(crnt_lvl1_wir[i]) crnt_lvl1_wir[i] = dft_ntwrk_info.lvl1_wir[i].value;
         foreach(crnt_lvl2_wir[i]) crnt_lvl2_wir[i] = dft_ntwrk_info.lvl2_wir[i].value;
         
         dft_reg_tx_to_jtag_tx(dft_reg_tx,jtag_tx_q);
         foreach(jtag_tx_q[i]) begin
            start_item( jtag_tx_q[i] );
            finish_item( jtag_tx_q[i]);
            `uvm_info( report_id, { "\n",jtag_tx_q[i].convert2string() }, UVM_DEBUG);
         end
         up_sequencer.item_done();
         jtag_tx_q.delete();
      end
   endtask: body

endclass: dft_reg_tx_to_jtag_tx_sequence



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


