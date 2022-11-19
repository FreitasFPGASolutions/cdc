create_project cdc ./ -part xc7a100tcsg324-1

add_files -norecurse ./cdc.sv
update_compile_order -fileset sources_1
add_files -fileset constrs_1 -norecurse ./cdc.xdc

launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1
puts "Implementation done!"

open_run impl_1
report_cdc -details -file ./cdc_report.txt

