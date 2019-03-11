# @Author: Internet:blog https://www.cnblogs.com/hfyfpga/p/4396103.html
# @Date:   2019-03-04 20:22:46
# @Last Modified by:   Ruige_Lee
# @Last Modified time: 2019-03-06 14:19:55



# define the output directory area.

set outputDir .

#setup design sources and constraints

read_verilog  [ glob ../baseVerilog/*.v ]                				
read_verilog  [ glob ../../Result/3-4-4/verilog/*.v ]  


read_xdc [ glob ../*.xdc ]

# run synthesis, write design checkpoint, report timing,
# and utilization estimates
synth_design -top top       \
             -part xc7a200tfbg484-3  \
             -fanout_limit 10000     \
             -shreg_min_size 3      \
             -flatten_hierarchy rebuilt		\
             -bufg	32

write_checkpoint -force $outputDir/synth.dcp 			

# run logic optimization, placement and physical logic optimization,
# write design checkpoint, report utilization and timing estimates
opt_design
place_design
# report_clock_utilization -file $outputDir/clock_util.rpt
write_checkpoint -force $outputDir/place.dcp
# report_timing_summary -file $outputDir/post_place_timing_summary.rpt

route_design

write_checkpoint -force $outputDir/route.dcp 	
				
report_route_status -file $outputDir/post_route_status.rpt			
report_timing_summary -file $outputDir/post_route_timing_summary.rpt
report_power -file $outputDir/post_route_power.rpt					
report_drc -file $outputDir/post_imp_drc.rpt    
report_utilization -file $outputDir/post_synth_util.rpt 

  


