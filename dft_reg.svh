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


