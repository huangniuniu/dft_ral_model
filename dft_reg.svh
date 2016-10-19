//Rui typedef class uvm_reg_cbs;
//Rui typedef class uvm_reg_frontdoor;

virtual class dft_reg extends uvm_reg;

   local bit               m_locked;
   local uvm_reg_block     m_parent;
   local uvm_reg_file      m_regfile_parent;
   local int unsigned      m_n_bits;
   local int unsigned      m_n_used_bits;
   //Rui protected bit           m_maps[uvm_reg_map];
   //Rui protected uvm_reg_field m_fields[$];   // Fields in LSB to MSB order
   local int               m_has_cover;
   local int               m_cover_on;
   local semaphore         m_atomic;
   local process           m_process;
   local string            m_fname;
   local int               m_lineno;
   local bit               m_read_in_progress;
   local bit               m_write_in_progress; 
   //Rui protected bit           m_update_in_progress;
   //Rui/*local*/ bit           m_is_busy;
   //Rui/*local*/ bit           m_is_locked_by_field;
   local uvm_reg_backdoor  m_backdoor;

   local static int unsigned m_max_size;

   local uvm_object_string_pool
       #(uvm_queue #(uvm_hdl_path_concat)) m_hdl_paths_pool;
   
//Rui added/modified start
function new(string name="", int unsigned n_bits, int has_coverage);
   //super.new(name);
   super.new(name,n_bits,has_coverage);
   if (n_bits == 0) begin
      `uvm_error("RegModel", $sformatf("Register \"%s\" cannot have 0 bits", get_name()));
      n_bits = 1;
   end
   m_n_bits      = n_bits;
   m_has_cover   = has_coverage;
   m_atomic      = new(1);
   m_n_used_bits = 0;
   m_locked      = 0;
   m_is_busy     = 0;
   m_is_locked_by_field = 1'b0;
   m_hdl_paths_pool = new("hdl_paths");

   if (n_bits > m_max_size)
      m_max_size = n_bits;

endfunction: new

function void dft_set(bit             value_q[$],
                           string          fname = "",
                           int             lineno = 0);

   uvm_reg_data_t       value;
   // Split the value into the individual fields
   m_fname = fname;
   m_lineno = lineno;
   
   foreach (m_fields[i]) begin
      //for(int f_val_idx=0; f_val_idx<m_fields[i].get_lsb_pos(); f_val_idx++) void'(value_q.pop_front());
      for(int f_val_idx=0; f_val_idx<m_fields[i].get_n_bits(); f_val_idx++) value[f_val_idx] = value_q.pop_front();
      m_fields[i].set(value);
      value = 0;
      //m_fields[i].set((value >> m_fields[i].get_lsb_pos()) & ((1 << m_fields[i].get_n_bits()) - 1));
   end
endfunction: dft_set

// get

function dft_reg_data_t  dft_get(string  fname = "", int     lineno = 0);

   uvm_reg_data_t value;                                   
   // Concatenate the value of the individual fields
   // to form the register value
   m_fname = fname;
   m_lineno = lineno;

   dft_get.delete();
   
   foreach (m_fields[i]) begin
      value = m_fields[i].get(); 
      for(int f_val_idx=0; f_val_idx<m_fields[i].get_n_bits(); f_val_idx++) dft_get.push_back(value[f_val_idx]);
   end
endfunction: dft_get


// predict

function bit dft_predict (uvm_reg_data_t    value,
                               uvm_reg_byte_en_t be = -1,
                               uvm_predict_e     kind = UVM_PREDICT_DIRECT,
                               uvm_path_e        path = UVM_FRONTDOOR,
                               uvm_reg_map       map = null,
                               string            fname = "",
                               int               lineno = 0);
  uvm_reg_item rw = new;
  rw.value[0] = value;
  rw.path = path;
  rw.map = map;
  rw.fname = fname;
  rw.lineno = lineno;
  do_predict(rw, kind, be);
  dft_predict = (rw.status == UVM_NOT_OK) ? 0 : 1;
endfunction: dft_predict


// do_predict

function void do_predict(uvm_reg_item      rw,
                                  uvm_predict_e     kind = UVM_PREDICT_DIRECT,
                                  uvm_reg_byte_en_t be = -1);

   //uvm_reg_data_t reg_value = rw.value[0];
   uvm_reg_data_t field_value;
   bit            value_q[$];

   for(int i=0; i<rw.value.size(); i++)
      for(int j=0; j<`UVM_REG_DATA_WIDTH; j++) value_q.push_back(rw.value[i][j]);

   m_fname = rw.fname;
   m_lineno = rw.lineno;
   
   if (rw.status ==UVM_IS_OK )
      rw.status = UVM_IS_OK;

   if (m_is_busy && kind == UVM_PREDICT_DIRECT) begin
      `uvm_warning("RegModel", {"Trying to predict value of register '",
                  get_full_name(),"' while it is being accessed"})
      rw.status = UVM_NOT_OK;
      return;
   end
   
   foreach (m_fields[i]) begin
      //rw.value[0] = (reg_value >> m_fields[i].get_lsb_pos()) & ((1 << m_fields[i].get_n_bits())-1);
      for(int i=0; i<m_fields[i].get_n_bits; i++) field_value[i] = value_q.pop_front();
      rw.value[0] = field_value;
      m_fields[i].do_predict(rw, kind, be>>(m_fields[i].get_lsb_pos()/8));
      //clear vaule for next interation.
      field_value = 0;
   end

   //rw.value[0] = reg_value;

endfunction: do_predict

// write

task dft_write(output uvm_status_e      status,
                    input  bit               value_q[$],
                    input  uvm_path_e        path = UVM_DEFAULT_PATH,
                    input  uvm_reg_map       map = null,
                    input  uvm_sequence_base parent = null,
                    input  int               prior = -1,
                    input  uvm_object        extension = null,
                    input  string            fname = "",
                    input  int               lineno = 0);

   // create an abstract transaction for this operation
   uvm_reg_item rw;
   uvm_reg_data_t    value;
   int unsigned      value_size;
   int unsigned      value_q_size;
   
   //quotient of value_q_size devided by `UVM_REG_DATA_WIDTH
   int unsigned      quotient;
   //remainder of value_q_size devided by `UVM_REG_DATA_WIDTH
   int unsigned      remainder;

   XatomicX(1);

   dft_set(value_q);

   rw = uvm_reg_item::type_id::create("write_item",,get_full_name());
   rw.element      = this;
   rw.element_kind = UVM_REG;
   rw.kind         = UVM_WRITE;
   //rw.value[0]     = value;
   rw.path         = path;
   rw.map          = map;
   rw.parent       = parent;
   rw.prior        = prior;
   rw.extension    = extension;
   rw.fname        = fname;
   rw.lineno       = lineno;

   value_q_size = value_q.size();
   quotient = value_q_size/`UVM_REG_DATA_WIDTH;
   remainder = value_q_size%`UVM_REG_DATA_WIDTH;
   value_size = quotient + (remainder ? 1 : 0);
   
   rw.value.delete();
   rw.value = new[value_size];
   for(int val_idx=0; val_idx<quotient; val_idx++)
      for(int i=0; i<`UVM_REG_DATA_WIDTH; i++) rw.value[val_idx][i] = value_q.pop_front();
   
   if(remainder!=0)
      for(int i=0; i<remainder; i++) rw.value[value_size-1][i] = value_q.pop_front();

   do_write(rw);

   status = rw.status;

   XatomicX(0);

endtask


// do_write

task do_write (uvm_reg_item rw);

   //uvm_reg_cb_iter  cbs = new(this);
   uvm_reg_map_info map_info;
   uvm_reg_data_t   value; 

   m_fname  = rw.fname;
   m_lineno = rw.lineno;

   if (!Xcheck_accessX(rw,map_info,"write()"))
     return;

   XatomicX(1);

   m_write_in_progress = 1'b1;

   //rw.value[0] &= ((1 << m_n_bits)-1);
   //value = rw.value[0];

   rw.status = UVM_IS_OK;

   //// PRE-WRITE CBS - FIELDS
   //begin : pre_write_callbacks
   //   uvm_reg_data_t  msk;
   //   int lsb;

   //   foreach (m_fields[i]) begin
   //      uvm_reg_field_cb_iter cbs = new(m_fields[i]);
   //      uvm_reg_field f = m_fields[i];
   //      lsb = f.get_lsb_pos();
   //      msk = ((1<<f.get_n_bits())-1) << lsb;
   //      rw.value[0] = (value & msk) >> lsb;
   //      f.pre_write(rw);
   //      for (uvm_reg_cbs cb=cbs.first(); cb!=null; cb=cbs.next()) begin
   //         rw.element = f;
   //         rw.element_kind = UVM_FIELD;
   //         cb.pre_write(rw);
   //      end

   //      value = (value & ~msk) | (rw.value[0] << lsb);
   //   end
   //end
   rw.element = this;
   rw.element_kind = UVM_REG;
   //rw.value[0] = value;

   // PRE-WRITE CBS - REG
   //pre_write(rw);
   //for (uvm_reg_cbs cb=cbs.first(); cb!=null; cb=cbs.next())
   //   cb.pre_write(rw);

   if (rw.status != UVM_IS_OK) begin
     m_write_in_progress = 1'b0;

     XatomicX(0);
         
     return;
   end
         
   // EXECUTE WRITE...
   case (rw.path)
      
      //// ...VIA USER BACKDOOR
      //UVM_BACKDOOR: begin
      //   uvm_reg_data_t final_val;
      //   uvm_reg_backdoor bkdr = get_backdoor();

      //   value = rw.value[0];

      //   // Mimick the final value after a physical read
      //   rw.kind = UVM_READ;
      //   if (bkdr != null)
      //     bkdr.read(rw);
      //   else
      //     backdoor_read(rw);

      //   if (rw.status == UVM_NOT_OK) begin
      //     m_write_in_progress = 1'b0;
      //     return;
      //   end

      //   begin
      //      foreach (m_fields[i]) begin
      //         uvm_reg_data_t field_val;
      //         int lsb = m_fields[i].get_lsb_pos();
      //         int sz  = m_fields[i].get_n_bits();
      //         field_val = m_fields[i].XpredictX((rw.value[0] >> lsb) & ((1<<sz)-1),
      //                                           (value >> lsb) & ((1<<sz)-1),
      //                                           rw.local_map);
      //         final_val |= field_val << lsb;
      //      end
      //   end
      //   rw.kind = UVM_WRITE;
      //   rw.value[0] = final_val;

      //   if (bkdr != null)
      //     bkdr.write(rw);
      //   else
      //     backdoor_write(rw);

      //   do_predict(rw, UVM_PREDICT_WRITE);
      //end

      UVM_FRONTDOOR: begin

         uvm_reg_map system_map = rw.local_map.get_root_map();

         m_is_busy = 1;

         // ...VIA USER FRONTDOOR
         if (map_info.frontdoor != null) begin
            uvm_reg_frontdoor fd = map_info.frontdoor;
            fd.rw_info = rw;
            if (fd.sequencer == null)
              fd.sequencer = system_map.get_sequencer();
            fd.start(fd.sequencer, rw.parent);
         end

         // ...VIA BUILT-IN FRONTDOOR
         else begin : built_in_frontdoor

            rw.local_map.do_write(rw);

         end

         m_is_busy = 0;

         if (system_map.get_auto_predict()) begin
            uvm_status_e status;
            if (rw.status != UVM_NOT_OK) begin
               sample(value, -1, 0, rw.map);
               m_parent.XsampleX(map_info.offset, 0, rw.map);
            end

            status = rw.status; // do_predict will override rw.status, so we save it here
            do_predict(rw, UVM_PREDICT_WRITE);
            rw.status = status;
         end
      end
      
   endcase

   //value = rw.value[0];

   //// POST-WRITE CBS - REG
   //for (uvm_reg_cbs cb=cbs.first(); cb!=null; cb=cbs.next())
   //   cb.post_write(rw);
   //post_write(rw);

   //// POST-WRITE CBS - FIELDS
   //foreach (m_fields[i]) begin
   //   uvm_reg_field_cb_iter cbs = new(m_fields[i]);
   //   uvm_reg_field f = m_fields[i];
   //   
   //   rw.element = f;
   //   rw.element_kind = UVM_FIELD;
   //   rw.value[0] = (value >> f.get_lsb_pos()) & ((1<<f.get_n_bits())-1);
   //   
   //   for (uvm_reg_cbs cb=cbs.first(); cb!=null; cb=cbs.next())
   //      cb.post_write(rw);
   //   f.post_write(rw);
   //end
   
   //rw.value[0] = value;
   rw.element = this;
   rw.element_kind = UVM_REG;

   // REPORT
   if (uvm_report_enabled(UVM_HIGH, UVM_INFO, "RegModel")) begin
     string path_s,value_s;
     if (rw.path == UVM_FRONTDOOR)
       path_s = (map_info.frontdoor != null) ? "user frontdoor" :
                                               {"map ",rw.map.get_full_name()};
     else
       path_s = (get_backdoor() != null) ? "user backdoor" : "DPI backdoor";

     //value_s = $sformatf("=0x%0h",rw.value[0]);
     value_s = print_array_value(rw);

     uvm_report_info("RegModel", {"Wrote register via ",path_s,": ",
                                   get_full_name(),value_s}, UVM_HIGH);
   end

   m_write_in_progress = 1'b0;

   XatomicX(0);

endtask: do_write


function string print_array_value (uvm_reg_item rw);
   int unsigned         array_size;
   int unsigned         remainder;
   int unsigned         total_bits;
   uvm_reg_data_t       value;
   string               s;
   array_size = rw.value.size();

   foreach(m_fields[i]) total_bits+= m_fields[i].get_n_bits;

   remainder = total_bits - `UVM_REG_DATA_WIDTH*(array_size-1);

   if(`UVM_REG_DATA_WIDTH % 4 != 0) `uvm_warning("RegModel", "UVM_REG_DATA_WIDTH%4 != 0, will cause dft_print_array_value error.");

   for(int i=0; i<array_size-1; i++) begin
      foreach(rw.value[i][j]) value[j] = rw.value[i][j];
      $sformat(s,"%0h%s",value,s);
   end

   begin
      for(int j=0; j<remainder; j++) value[j] = rw.value[array_size-1][j];
      $sformat(s,"%0h%s",value,s);
   end

   $sformat(s,"%d'h%s",total_bits,s);
   return s;
endfunction: print_array_value 


//Rui added/modified start
endclass: dft_reg

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

   local uvm_reg_transaction_order_policy policy;

   extern /*local*/ function void Xinit_address_mapX();

   static local uvm_reg_map   m_backdoor;


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
         `uvm_info(get_type_name(),
            $sformatf("Writing 'h%0h at 'h%0h via map \"%s\"...",
            rw.value[val_idx], {1'b0,addrs[0][`UVM_REG_ADDR_WIDTH-1:0]}, rw.map.get_full_name()), UVM_FULL);
   
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
   
            `uvm_info(get_type_name(),
               $sformatf("Wrote 'h%0h at 'h%0h via map \"%s\": %s...",
               rw.value[val_idx], {1'b0,addrs[0][`UVM_REG_ADDR_WIDTH-1:0]}, rw.map.get_full_name(), rw.status.name()), UVM_FULL)
   
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



