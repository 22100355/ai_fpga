# This script segment is generated automatically by AutoPilot

set id 111
set name lenet5_mac_muladd_7ns_9ns_9ns_16_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 7
set in0_signed 0
set in1_width 9
set in1_signed 0
set in2_width 9
set in2_signed 0
set ce_width 1
set ce_signed 0
set out_width 16
set arg_lists {i0 {7 0 +} i1 {9 0 +} m {16 1 +} i2 {9 0 +} p {16 0 +} c_reg {1} rnd {0} acc {0} }
set TrueReset 0
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {add} IMPL {dsp} LATENCY 3 ALLOW_PRAGMA 1
}


set op mac
set corename DSP48
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_dsp48] == "::AESL_LIB_VIRTEX::xil_gen_dsp48"} {
eval "::AESL_LIB_VIRTEX::xil_gen_dsp48 { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    true_reset ${TrueReset} \
    stage_num ${stage_num} \
    clk_width ${clk_width} \
    clk_signed ${clk_signed} \
    reset_width ${reset_width} \
    reset_signed ${reset_signed} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    in2_width ${in2_width} \
    in2_signed ${in2_signed} \
    ce_width ${ce_width} \
    ce_signed ${ce_signed} \
    out_width ${out_width} \
    arg_lists {${arg_lists}} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_dsp48, check your platform lib"
}
}


# Memory (RAM/ROM)  definition:
set ID 113
set hasByteEnable 0
set MemName lenet5_lenet5_Pipeline_VITIS_LOOP_64_1_VITIS_LOOP_68_2_fc1_bias_ROM_AUTO_1R
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 32
set AddrRange 120
set AddrWd 7
set impl_style auto
set TrueReset 0
set IsROM 1
set ROMData { "10111101010000000010010110110100" "10111011110100011000001100111100" "10111100000001001111000100100111" "00111100000011010110111100011000" "10111011011011100110100110000110" "10111011101001011010111000101111" "00111100100101010111111000110001" "10111101000101000001000011000111" "10111100011111111111010110010100" "00111100100011101001100000101110" "10111101001011001010111111010101" "00111101001000010100011100111110" "00111100100111000010010010001010" "00111100011000001001101010110100" "00111100111011011101010100111011" "10111100010100101000111111011111" "00111101000100101100001000010111" "10111101010110111000011001111011" "10111101010001000111100000110011" "10111101000010001111101001110110" "00111101001000100111111100101010" "10111101000111011101000000010000" "00111100010011010111010101111110" "00111100100101000010010001000111" "10111100011001101001110111010001" "00111100110100011101101111011110" "10111101000011110011011001011000" "00111100101110101101010111011001" "10111011001111000010110001101100" "00111100011011001101011110100000" "10111100110010001001111011011011" "00111101010100101101111010101110" "00111101000000111010000011001100" "00111100110111001000001011011000" "10111011100111000110111001011110" "10111101000100110010010000011100" "00111100011001100111111001010000" "10111100100110000010011001001001" "00111011011100100000011011101110" "10111100111110110010001100101101" "00111101000111011100100000110110" "00111011000000110011001100111011" "00111101011111001010011111110000" "10111101000001111011001001111011" "10111101000110010011111010111101" "10111100010111111100010111100111" "00111100101001111011000001010100" "00111100111000001111101100110101" "10111100011100100101001100100111" "10111101000001000010111101011100" "00111100101011100111010011110110" "10111100010110111111011111011110" "00111100001001000100111011110100" "10111101000110100010101111000010" "10111101000110011000111111100101" "00111101001111101111000100011011" "10111100100101000111100100011101" "00111101001111000111111111011001" "10111011101101000000110101011000" "00111100111101101100111100110111" "10111101001101011101001101010010" "10111100101011111101101110100001" "10111100100101000000011010001111" "10111100100011000111000000011011" "10111100101110001000111011110000" "00111101001101010001101010101011" "00111010110001100010001101110101" "10111100100111000101110001001110" "10111100101111011110001110000001" "00111101000110001110000101111111" "10111101000001011101101110100001" "10111101010001011111111010100001" "10111100110001000011001100000101" "10111101001100011010111011111011" "10111100101000111111010101011100" "00111101011000101101100010111101" "10111100110100001010110001011000" "10111100000100100011101110100100" "10111100011010000001010001110001" "00111101000011111000001000011101" "10111100111110100001010010111111" "10111100110011011110101011011111" "00111101000001010110110011011000" "00111100111110010110101000111111" "10111011010110100011001110000011" "00111101010010000100111001011100" "10111101001111001000101111011101" "10111100101001001001010001100111" "10111100100001111110001100101101" "10111100101011110000010010011010" "00111011010010001110010110000010" "10111100111110000110110001100011" "10111010100111111011001100101101" "00111100001010111000010001001001" "00111100111101000001000110011011" "00111101001110001000011111011010" "00111100111101001000001100100000" "00111100110000100000001110111101" "00111101010010100111111100001101" "10111101000010101011001100010100" "00111100100110101111111001000010" "00111100111111110101111001110000" "10111001101100000001101110001100" "00111100110100001110001101100110" "10111100000011000011110011111110" "10111100100011110000000110110001" "10111100010110111001001101011110" "00111101000000010101110011000000" "00111101000110111011011000101100" "00111100101010001010110001110100" "10111101010000110010000000010010" "10111011010001101101000111101101" "10111011010100100011101101001111" "10111100111001001000100100101100" "00111100111011110000101011011010" "10111101001001101110010100000101" "10111101000111111000101100011001" "10111100101100101010111011011111" "10111100000000100001100100001100" "00111100101101010101101010010101" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set DelayBudget 3.254
set ClkPeriod 10
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem  \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $MemName BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


set CoreName ROM
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem  \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 114
set hasByteEnable 0
set MemName lenet5_lenet5_Pipeline_VITIS_LOOP_64_1_VITIS_LOOP_68_2_fc1_weight_ROM_AUTO_1R
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 32
set AddrRange 48000
set AddrWd 16
set impl_style auto
set TrueReset 0
set IsROM 1
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set DelayBudget 3.254
set ClkPeriod 10
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem  \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $MemName BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


set CoreName ROM
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem  \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 115 \
    name p2_out_data \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename p2_out_data \
    op interface \
    ports { p2_out_data_address0 { O 9 vector } p2_out_data_ce0 { O 1 bit } p2_out_data_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'p2_out_data'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 116 \
    name f1_out_data \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename f1_out_data \
    op interface \
    ports { f1_out_data_address0 { O 7 vector } f1_out_data_ce0 { O 1 bit } f1_out_data_we0 { O 1 bit } f1_out_data_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'f1_out_data'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# flow_control definition:
set InstName lenet5_flow_control_loop_pipe_sequential_init_U
set CompName lenet5_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix lenet5_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}

