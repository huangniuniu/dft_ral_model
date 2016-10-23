// Class: dft_reg_map
class dft_reg_map extends uvm_reg_map;
   `uvm_object_utils(dft_reg_map)
   
   // info that is valid only if top-level map
   local uvm_reg_addr_t     m_base_addr;
   local int unsigned       m_n_bytes;
   local uvm_endianness_e   m_endian;
   local bit                m_byte_addressing;
   local uvm_object_wrapper m_sequence_wrapper;
   local uvm_reg_adapter    m_adapter;
   local uvm_sequencer_base m_sequencer;
   local bit                m_auto_predict;
   local bit                m_check_on_read;

   local uvm_reg_block      m_parent;

   local int unsigned       m_system_n_bytes;

   local uvm_reg_map        m_parent_map;
   local uvm_reg_addr_t     m_parent_maps[uvm_reg_map];   // value=offset of this map at parent level
   local uvm_reg_addr_t     m_submaps[uvm_reg_map];       // value=offset of submap at this level
   local string             m_submap_rights[uvm_reg_map]; // value=rights of submap at this level

   local uvm_reg_map_info   m_regs_info[uvm_reg];
   local uvm_reg_map_info   m_mems_info[uvm_mem];

   local uvm_reg            m_regs_by_offset[uvm_reg_addr_t];
                            // Use only in addition to above if a RO and a WO
                            // register share the same address.
   local uvm_reg            m_regs_by_offset_wo[uvm_reg_addr_t]; 
   local uvm_mem            m_mems_by_offset[uvm_reg_map_addr_range];

   //Rui UVM1.2 only local uvm_reg_transaction_order_policy policy;

   //Rui comment out extern /*local*/ function void Xinit_address_mapX();

   static local uvm_reg_map   m_backdoor;


   function new(string name = "dft_reg_map");
      super.new(name);
      m_auto_predict = 0;
      m_check_on_read = 0;
   endfunction: new
   
   // do_bus_write
   virtual task do_bus_write (uvm_reg_item rw, uvm_sequencer_base sequencer, uvm_reg_adapter adapter);
   
     uvm_reg_addr_t     addrs[$];
     uvm_reg_map        system_map = get_root_map();
     int unsigned       bus_width  = get_n_bytes();
     uvm_reg_byte_en_t  byte_en    = -1;
     uvm_reg_map_info   map_info;
     int                n_bits;
     int                lsb;
     int                skip;
     int unsigned       curr_byte;
     int                n_access_extra, n_access;
     int                n_bits_init;
  
     int unsigned       reg_bus_op_num;
     int unsigned       remainder;
     uvm_sequence_item  bus_req;
     uvm_reg_bus_op     rw_access;
     uvm_reg_data_t     data;
     dft_reg            access_rg;
     
     if ($cast(access_rg,rw.element)) begin             
        `uvm_info(get_type_name(), $sformatf("Current regsiter being written is dft_reg TYPE"), UVM_NONE);
     end
     else begin
        `uvm_error(get_type_name(), $sformatf("Current regsiter being written is not dft_reg TYPE"))
     end

     Xget_bus_infoX(rw, map_info, n_bits_init, lsb, skip);
     addrs=map_info.addr;
 
     reg_bus_op_num = rw.value.size(); 
     for(int i=0; i<reg_bus_op_num; i++) begin
        addrs[i] = addrs[0];
     end
     addrs[reg_bus_op_num-1][`UVM_REG_ADDR_WIDTH-1] = 1; 
     remainder = n_bits_init - `UVM_REG_DATA_WIDTH*(reg_bus_op_num-1);

     //// if a memory, adjust addresses based on offset
     //if (rw.element_kind == UVM_MEM)
     //  foreach (addrs[i])
     //    addrs[i] = addrs[i] + map_info.mem_range.stride * rw.offset;
   
     foreach (rw.value[val_idx]) begin: foreach_value
   
        uvm_reg_data_t value = rw.value[val_idx];
   
       /* calculate byte_enables */
       //if (rw.element_kind == UVM_FIELD) begin
       //  int temp_be;
       //  int idx;
       //  n_access_extra = lsb%(bus_width*8);                
       //  n_access = n_access_extra + n_bits_init;
       //  temp_be = n_access_extra;
       //  value = value << n_access_extra;
       //  while(temp_be >= 8) begin
       //     byte_en[idx++] = 0;
       //     temp_be -= 8;
       //  end                        
       //  temp_be += n_bits_init;
       //  while(temp_be > 0) begin
       //     byte_en[idx++] = 1;
       //     temp_be -= 8;
       //  end
       //  byte_en &= (1<<idx)-1;
       //  for (int i=0; i<skip; i++)
       //    void'(addrs.pop_front());
       //  while (addrs.size() > (n_bits_init/(bus_width*8) + 1))
       //    void'(addrs.pop_back());
       //end
       curr_byte=0;
       n_bits= n_bits_init;     
                 
       //foreach(addrs[i]) begin: foreach_addr
   
   
   
         //data = (value >> (curr_byte*8)) & ((1'b1 << (bus_width * 8))-1);
         data = value;
         if (val_idx == reg_bus_op_num - 1) begin
            `uvm_info(get_type_name(), $sformatf("Writing 'h%0h at 'h%0h via map \"%s\"...", access_rg.print_array_value(rw), {1'b0,addrs[0][`UVM_REG_ADDR_WIDTH-1:0]}, rw.map.get_full_name()), UVM_FULL);
         end
         else begin
            `uvm_info(get_type_name(), $sformatf("Sending package %0d to adapter, data being transfered is %0h", val_idx, data), UVM_FULL);
         end
         //if (rw.element_kind == UVM_FIELD) begin
         //  for (int z=0;z<bus_width;z++)
         //    rw_access.byte_en[z] = byte_en[curr_byte+z];
         //end
                   
         rw_access.kind    = rw.kind;
         rw_access.addr    = addrs[val_idx];
         rw_access.data    = rw.value[val_idx];
         rw_access.n_bits  = (val_idx == reg_bus_op_num-1) ? remainder : `UVM_REG_DATA_WIDTH;
         rw_access.byte_en = byte_en;
         
         adapter.m_set_item(rw);
         bus_req = adapter.reg2bus(rw_access);
         adapter.m_set_item(null);
         
         if(val_idx == reg_bus_op_num - 1) begin :last_reg_bus_op_transaction 
            //adapter.m_set_item(rw);
            //bus_req = adapter.reg2bus(rw_access);
            //adapter.m_set_item(null);
            if (bus_req == null)
              `uvm_fatal("RegMem",{"adapter [",adapter.get_name(),"] didnt return a bus transaction"});
            
            bus_req.set_sequencer(sequencer);
            rw.parent.start_item(bus_req,rw.prior);
   
            //if (rw.parent != null && i == 0)
            //  rw.parent.mid_do(rw);
             
            rw.parent.finish_item(bus_req);
            bus_req.end_event.wait_on();
   
            if (adapter.provides_responses) begin
              uvm_sequence_item bus_rsp;
              uvm_access_e op;
              // TODO: need to test for right trans type, if not put back in q
              rw.parent.get_base_response(bus_rsp);
              adapter.bus2reg(bus_rsp,rw_access);
            end
            else begin
              adapter.bus2reg(bus_req,rw_access);
            end
   
            //if (rw.parent != null && i == addrs.size()-1)
            //  rw.parent.post_do(rw);
   
            rw.status = rw_access.status;
            //`uvm_info(get_type_name(), $sformatf("Wrote 'h%0h at 'h%0h via map \"%s\": %s...", rw.value[val_idx], {1'b0,addrs[0][`UVM_REG_ADDR_WIDTH-1:0]}, rw.map.get_full_name(), rw.status.name()), UVM_FULL)
            `uvm_info(get_type_name(), $sformatf("Wrote 'h%0h at 'h%0h via map \"%s\": %s...", access_rg.print_array_value(rw), {1'b0,addrs[0][`UVM_REG_ADDR_WIDTH-1:0]}, rw.map.get_full_name(), rw.status.name()), UVM_FULL)
   
            if (rw.status == UVM_NOT_OK)
               break;
   
            curr_byte += bus_width;
            n_bits -= bus_width * 8;
         end: last_reg_bus_op_transaction //if(val_idx = reg_bus_op_num - 1) begin
   
       //end: foreach_addr
   
       //foreach (addrs[i])
       //  addrs[i] = addrs[i] + map_info.mem_range.stride;
   
     end: foreach_value
   
   endtask: do_bus_write
   
   //function string print_array_value (uvm_reg_item rw);
   //   int unsigned         array_size;
   //   int unsigned         remainder;
   //   int unsigned         total_bits;
   //   uvm_reg_data_t       value;
   //   string               s;
   //   array_size = rw.value.size();

   //   foreach(m_fields[i]) total_bits+= m_fields[i].get_n_bits;

   //   remainder = total_bits - `UVM_REG_DATA_WIDTH*(array_size-1);

   //   if(`UVM_REG_DATA_WIDTH % 4 != 0) `uvm_warning("RegModel", "UVM_REG_DATA_WIDTH%4 != 0, will cause dft_reg::print_array_value error.");

   //   for(int i=0; i<array_size-1; i++) begin
   //      foreach(rw.value[i][j]) value[j] = rw.value[i][j];
   //      $sformat(s,"%0h%s",value,s);
   //   end

   //   begin
   //      for(int j=0; j<remainder; j++) value[j] = rw.value[array_size-1][j];
   //      $sformat(s,"%0h%s",value,s);
   //   end

   //   $sformat(s,"%d'h%s",total_bits,s);
   //   return s;
   //endfunction
endclass: dft_reg_map



