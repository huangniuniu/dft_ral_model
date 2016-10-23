//------------------------------------------------------------------------
virtual class dft_reg_block extends uvm_reg_block;

   local uvm_reg_block  parent;

   local static bit     m_roots[uvm_reg_block];
   local int unsigned   blks[uvm_reg_block];
   local int unsigned   regs[uvm_reg];
   local int unsigned   vregs[uvm_vreg];
   local int unsigned   mems[uvm_mem];
   local bit            maps[uvm_reg_map];

   local string         default_hdl_path = "RTL";
   local uvm_reg_backdoor backdoor;
   local uvm_object_string_pool #(uvm_queue #(string)) hdl_paths_pool;
   local string         root_hdl_paths[string];

   local bit            locked;

   local int            has_cover;
   local int            cover_on;
   local string         fname;
   local int            lineno;

   local static int id;
   
   function new(string name="", int has_coverage=UVM_NO_COVERAGE);
      super.new(name,has_coverage);
      hdl_paths_pool = new("hdl_paths");
      this.has_cover = has_coverage;
      // Root block until registered with a parent
      m_roots[this] = 0;

   endfunction: new
   
   virtual function dft_reg_map create_dft_map(string name,
                                                  uvm_reg_addr_t base_addr,
                                                  int unsigned n_bytes,
                                                  uvm_endianness_e endian,
                                                  bit byte_addressing=1);
   
      dft_reg_map  map;
      uvm_reg_map  temp_map;   
      if (this.locked) begin
         `uvm_error("RegModel", "Cannot add map to locked model");
         return null;
      end
   
      map = dft_reg_map::type_id::create(name,,this.get_full_name());
      map.configure(this,base_addr,n_bytes,endian,byte_addressing);
  
      temp_map = map;
      this.maps[temp_map] = 1;
      if (maps.num() == 1)
        default_map = temp_map;
   
      return map;
   endfunction


endclass 
