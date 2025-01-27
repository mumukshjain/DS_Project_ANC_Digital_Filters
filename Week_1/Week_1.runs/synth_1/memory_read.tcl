# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param chipscope.maxJobs 5
set_param synth.incrementalSynthesisCache {C:/Digital Filters/DS_Project_ANC_Digital_Filters/Week_1/.Xil/Vivado-12968-hp/incrSyn}
set_msg_config -id {Common 17-41} -limit 10000000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir {C:/Digital Filters/DS_Project_ANC_Digital_Filters/Week_1/Week_1.cache/wt} [current_project]
set_property parent.project_path {C:/Digital Filters/DS_Project_ANC_Digital_Filters/Week_1/Week_1.xpr} [current_project]
set_property XPM_LIBRARIES XPM_MEMORY [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part_repo_paths {C:/Users/nisha/AppData/Roaming/Xilinx/Vivado/2019.2/xhub/board_store} [current_project]
set_property board_part digilentinc.com:basys3:part0:1.1 [current_project]
set_property ip_output_repo {c:/Digital Filters/DS_Project_ANC_Digital_Filters/Week_1/Week_1.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files {{C:/Digital Filters/DS_Project_ANC_Digital_Filters/Week_1/Week_1.sim/sim_1/behav/xsim/my_file.coe}}
read_verilog -library xil_defaultlib {{C:/Digital Filters/DS_Project_ANC_Digital_Filters/Week_1/Week_1.srcs/sources_1/new/BRAM_wrapper.v}}
read_ip -quiet {{C:/Digital Filters/DS_Project_ANC_Digital_Filters/Week_1/Week_1.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0.xci}}
set_property used_in_implementation false [get_files -all {{c:/Digital Filters/DS_Project_ANC_Digital_Filters/Week_1/Week_1.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_ooc.xdc}}]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/Digital Filters/DS_Project_ANC_Digital_Filters/Week_1/Week_1.srcs/constrs_1/new/BRAM.xdc}}
set_property used_in_implementation false [get_files {{C:/Digital Filters/DS_Project_ANC_Digital_Filters/Week_1/Week_1.srcs/constrs_1/new/BRAM.xdc}}]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top memory_read -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef memory_read.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file memory_read_utilization_synth.rpt -pb memory_read_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
