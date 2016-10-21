`ifndef _DFT_ENV_PKG_SV
`define _DFT_ENV_PKG_SV

//------------------------------------------------------------------------------
// Package: dft_env_pkg
//------------------------------------------------------------------------------
`timescale 1ns/1ps
//`timescale 1ns/1ps
//`include "uvm_pkg.sv"

package dft_env_pkg;
    import uvm_pkg::*;
    `include "../common/global_define.svh"
    `include "../common/global_class.svh"
    //All TDR definations and classes and dft_register_block is include in ral.svh 
    `include "../top/ral.svh" 
    `include "../component/include_all_components_here.svh" 
    `include "../sequence/include_all_sequences_here.svh"
    //dft_env class
    `include "../top/dft_env.svh"
    `include "../top/pll_env.sv"
    `include "../test/dft_test.svh"

endpackage: dft_env_pkg

`endif
