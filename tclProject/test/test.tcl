# @Author: Internet:blog https://www.cnblogs.com/hfyfpga/p/4396103.html
# @Date:   2019-03-04 20:22:46
# @Last Modified by:   Ruige_Lee
# @Last Modified time: 2019-03-04 20:54:43


##############################################################################
##############################################################################
##############################################################################
# STEP#1: define the output directory area.
# 定义工程文件的存放路径
set outputDir ./prjOutput
# file mkdir $outputDir
#
# STEP#2: setup design sources and constraints
#
# VHDL
#
#read_vhdl -library bftLib [ glob ./Sources/hdl/bftLib/*.vhdl ] 	#指定需要添加的VHDL库文件，glob是扫描某个路径下的全部文件（这里是.vhdl文件）
# read_vhdl ./Sources/hdl/bft.vhdl              					#指定需要添加的VHDL文件
# ##############################
# Verilog HDL
#
## 指定需要添加的Verilog文件，glob是扫描某个路径下的全部文件（这里是.v文件）
#
read_verilog  [ glob ../../Result/Ca/250msx3/3-4-4/verilog/*.v ]                				
# ##############################
# XDC
#
# read_xdc [ glob ./CONSTRS/*.xdc ]               				#指定需要添加的xdc文件，glob是扫描某个路径下的全部文件（这里是.xdc文件）
# ##############################
# EDIF and NGC
#
# read_edif ../test.edif                          				#指定需要添加的网表文件
# ##############################
# IP XCI
#
# read_ip ./CORE/MMCM/MMCM.xci                    				#指定需要添加的xci IP文件
# ##############################
# STEP#3: run synthesis, write design checkpoint, report timing,
# and utilization estimates
# 运行综合 ，同时设定相关综合参数
synth_design -top prm_LUTX1_Ca_3_4_4_chk512p0       \
             -part xc7a200tfbg484-1  \
             -fanout_limit 1000     \
             -shreg_min_size 3      \
             -flatten_hierarchy full



# 存档
write_checkpoint -force $outputDir/post_synth.dcp 			
# 生成时序报告
report_timing_summary -file $outputDir/post_synth_timing_summary.rpt    
# 生成资源使用报告
report_utilization -file $outputDir/post_synth_util.rpt 				
#
#
# STEP#4: run logic optimization, placement and physical logic optimization,
# write design checkpoint, report utilization and timing estimates
#
# 优化设计
opt_design  
# 布局											
place_design
# 生成资源使用报告
report_clock_utilization -file $outputDir/clock_util.rpt    
# 存档			
write_checkpoint -force $outputDir/post_place.dcp
# 生成时序报告    				
report_timing_summary -file $outputDir/post_place_timing_summary.rpt 	
#
# STEP#5: run the router, write the post-route design checkpoint, report the routing
# status, report timing, power, and DRC, and finally save the Verilog netlist.
#
#
#
# 布线
# route_design
# 存档      														
# write_checkpoint -force $outputDir/post_route.dcp 	

# 报告布线状况					
# report_route_status -file $outputDir/post_route_status.rpt
# 生成时序报告 				
# report_timing_summary -file $outputDir/post_route_timing_summary.rpt
# 生成功耗报告    
# report_power -file $outputDir/post_route_power.rpt
# 运行DRC 生成DRC检查报告  					
# report_drc -file $outputDir/post_imp_drc.rpt        					
# write_verilog -force $outputDir/cpu_impl_netlist.v -mode timesim -sdf_anno true
#
# STEP#6: generate a bitstream
#

# write_bitstream -force $outputDir/SCRIPT_TEST.bit  						# 生成bit文件
  
##############################################################################
##############################################################################
##############################################################################
