// Class: dft_reg_map
class dft_reg_map extends uvm_reg_map;
   `uvm_object_utils(dft_reg_map)

   function new(string name = "dft_reg_map");
      super.new(name);
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

     Xget_bus_infoX(rw, map_info, n_bits_init, lsb, skip);
     addrs=map_info.addr;
 
     reg_bus_op_num = rw.value.size(); 
     for(int i=0; i<reg_bus_op_num; i++) begin
        addrs[i] = addrs[0];
     end
     
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
         `uvm_info(get_type_name(),
            $sformatf("Writing 'h%0h at 'h%0h via map \"%s\"...",
                 data, addrs[i], rw.map.get_full_name()), UVM_FULL);
   
         //if (rw.element_kind == UVM_FIELD) begin
         //  for (int z=0;z<bus_width;z++)
         //    rw_access.byte_en[z] = byte_en[curr_byte+z];
         //end
                   
         rw_access.kind    = rw.kind;
         rw_access.addr    = addrs[i];
         rw_access.data    = data;
         rw_access.n_bits  = (val_idx == reg_bus_op_num-1) ? remainder : `UVM_REG_DATA_WIDTH;
         rw_access.byte_en = byte_en;
         
         adapter.m_set_item(rw);
         bus_req = adapter.reg2bus(rw_access);
         adapter.m_set_item(null);
         
         if(val_idx == reg_bus_op_num - 1) begin :last_reg_bus_op_transaction 
            adapter.m_set_item(rw);
            bus_req = adapter.reg2bus(rw_access);
            adapter.m_set_item(null);
            
            if (bus_req == null)
              `uvm_fatal("RegMem",{"adapter [",adapter.get_name(),"] didnt return a bus transaction"});
            
            bus_req.set_sequencer(sequencer);
            rw.parent.start_item(bus_req,rw.prior);
   
            if (rw.parent != null && i == 0)
              rw.parent.mid_do(rw);
   
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
   
            `uvm_info(get_type_name(),
               $sformatf("Wrote 'h%0h at 'h%0h via map \"%s\": %s...",
                  data, addrs[i], rw.map.get_full_name(), rw.status.name()), UVM_FULL)
   
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

endclass: dft_reg_map
