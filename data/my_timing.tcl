set charpt test_timing_ck_s1l1
###set charpt tmp
###set charpt bisec1
 
source my_cell.tcl
#set cells { HSBLVT16_INV_1 } 
create $charpt
#exec cp configure.tcl $charpt/config/configure.tcl
#exec cp run.tcl $charpt
#exec cp my_cell.tcl $charpt

set_config_opt sis_dbg_dp 2

set_location $charpt
set_config_opt constraint_simulated_seed 1
set_config_opt simulator_bisection_using_sis 1
set_config_opt legacy_constraint_deck 0
set_config_opt lvf_model_slew 1
set_config_opt statistical_avoid_screening_acquisition 0
set_config_opt lvf_format both
set_config_opt separate_cell_initialization nodeset
# set_config_opt -type {lvf} enable_parallel_sweeps 1
# set_config_opt -type {lvf} netlist_max_sweeps 1

 set_config_opt statistical_reduction_factor 1.0
# set_config_opt statistical_simulation_points { 1   7 22  25  28   50  56 }
# set_config_opt statistical_simulation_points { 1   7 50  56 }
# set_config_opt statistical_simulation_points { 1   7  28   50  56 }
# set_config_opt -type {statistical_constraint } statistical_simulation_points  { 1 5 21  25 }

set_config_opt lvf_sigma_scaling 0
set_config_opt total_slew_multiplier   190
#set_config_opt -type {mpw setup hold recovery removal} state_partitions none
set_config_opt statistical_enable_constraint_sensitivity 1

 set_config_opt simulator hspice
 set_config_opt simulator_cmd {  /global/apps/hspice_2023.12-2/hspice/bin/hspice  -i <input_deck> -o <listing_file>}

### set_config_opt simulator primesim
### set_config_opt simulator_cmd { /global/apps/primesim_2023.12-SP1/bin/primesim   -spice <input_deck> -out <listing_file>}

#set_config_opt -type lvf simulator_cmd { /global/apps/hspice_2023.03-SP1/hspice/bin/hspice  -i <input_deck> -o <listing_file>}
#set_config_opt -type lvf simulator_cmd {/remote/swefs1/PE/products/cktsim/u2023.03_sp2_rel/image/nightly/hspice_optimize/D20230817_8377030/Testing/hspice/bin/hspice -i <input_deck> -o <listing_file>}
#set_config_opt simulator_cmd { /remote/swefs1/PE/products/cktsim/u2023.03_rel/image/nightly/hspice_optimize/D20230407_8129314/Testing/hspice/bin/hspice  -i <input_deck> -o <listing_file>}
#set_config_opt -type lvf simulator_cmd { /slowfs/neuron6/jsjou/BU/HSP2023.03-1-T/hspice/bin/hspice  -i <input_deck> -o <listing_file>}
#set_config_opt -type lvf simulator_cmd { /slowfs/neuron6/jsjou/BU/hspice_2023.03-2/hspice/bin/hspice  -i <input_deck> -o <listing_file>}
#set_config_opt -type lvf simulator_cmd { /remote/char_fast6/jsjou/P4/jsjou_ava_2303_DEV/snps/hspice/optimize/bin/hspice  -i <input_deck> -o <listing_file>}
#set_config_opt -type lvf simulator_cmd { /remote/char_fast7/jsjou/P4/jsjou_ava_2303_SP2/snps/hspice/optimize/bin/hspice  -i <input_deck> -o <listing_file>}
#set_config_opt -type lvf simulator_cmd { /slowfs/char_slow9/jsjou/BU/SP2_D20230809_8361910/hspice/bin/hspice -i <input_deck> -o <listing_file>}
#set_config_opt -type lvf simulator_cmd { /global/apps/hspice_2023.03-SP2/hspice/bin/hspice -i <input_deck> -o <listing_file>}
#set_config_opt -type lvf simulator_cmd { /global/apps/hspice_2023.03-SP2-1/hspice/bin/hspice -i <input_deck> -o <listing_file>}
#set_config_opt -type lvf simulator_cmd { /global/apps/hspice_2023.03-SP2-2/hspice/bin/hspice -i <input_deck> -o <listing_file>}
#set_config_opt -type lvf simulator_cmd { /global/apps/hspice_2023.12-1/hspice/bin/hspice -i <input_deck> -o <listing_file>}
#set_config_opt -type lvf simulator_cmd { /slowfs/char_slow9/jsjou/BU/hspice_2023.03-SP2/hspice/bin/hspice -i <input_deck> -o <listing_file>}
#set_config_opt -type lvf simulator_cmd { /remote/swefs7/PE/products/cktsim/v2023.12_sp1_rel/image/nightly/hspice_optimize/D20240224_8753532/Testing/hspice/bin/hspice -i <input_deck> -o <listing_file> >& /dev/null}
 set_config_opt -type lvf simulator_cmd { /remote/swefs7/PE/products/cktsim/v2023.12_sp1_rel/image/nightly/hspice_optimize/D20240229_8766371/Testing/hspice/bin/hspice -i <input_deck> -o <listing_file> >& /dev/null}
 
######################################################## LVF
#SBA
#set_config_opt lvf_external_sampling 1
#set_config_opt lvf_ml_mode 0
# oldML
#set_config_opt lvf_external_sampling 1
#set_config_opt lvf_ml_mode 1
# MC 
#set_config_opt statistical_model_sigma_montecarlo 1
#set_config_opt statistical_montecarlo_sample_size  10
#set_config_opt enable_mc_sweeps 1
# HSMC
# set_config_opt lvf_hsmc 1
# set_config_opt lvf_ml_mode 0
# set_config_opt lvf_external_sampling 0
# advML 
  # lvf_ava_ml_legacy_id 4 match HSP 2023.12-1
  set_config_opt lvf_ava_ml_legacy_id 0
  set_config_opt lvf_hsmc 1
  set_config_opt lvf_hsmc_mode 1
# set_config_opt lvf_hsmc_sigma_rel_tol 0.03
  set_config_opt lvf_ava_accuracy_level 1
  set_config_opt lvf_ava_auto_accuracy  0
# set_config_opt lvf_model_check 0
# set_config_opt lvf_chk_max_abs_value 1e-6
# set_config_opt lvf_chk_min_abs_value 101e-12 
# set_config_opt lvf_chk_max_abs_ratio 11 
# set_config_opt lvf_chk_max_sigma_ratio 101 
# set_config_opt lvf_chk_min_sigma_ratio 1.1 
# set_config_opt lvf_chk_min_sigma_delta 11e-12 



# set_config_opt lvf_hsmc_sa_k3 2
 set_config_opt enable_netlist_pruning 1
 set_config_opt netlist_pruning_rc_method 3
 
 set_config_opt mpp_simulator /global/apps/hspice_2021.09-1/hspice/bin/hspice
 set_config_opt lvf_optimize_model yes
 set_config_opt lvf_optimize_model_sensitivity_threshold 0.05
#set_config_opt lvf_optimize_model_vtgm 1
#set_config_opt lvf_optimize_model_vtgm_tol  0.2
 set_config_opt lvf_hsmc_do_not_vary_pruned_transistors 1
 set_config_opt lvf_hsmc_default_netlist original 
#set_config_opt lvf_hsmc_moment_model_mode 2

 set_config_opt sis_dbg_dp 2
 set_config_opt job_scheduler standalone
### set_config_opt job_scheduler  custom 
### set_config_opt cdpl_host_file  cdplfarm.cfg   
### set_config_opt run_list_maxsize 200 

#import -fast -liberty /slowfs/char_slow13/jsjou/hsmc/case/N16/seed.lib_0.35V -netlist_dir /slowfs/char_slow13/jsjou/hsmc/case/N16/Inputs/Netlist -ext  .cwccwt.spx  $my_cells
import -fast -liberty seed.lib   -netlist_dir /slowfs/char_slow13/jsjou/hsmc/case/N16/Inputs/Netlist -ext  .cwccwt.spx -use_default_slews -use_default_loads $my_cells
#analyze_netlists -statistical
configure -timing $my_cells
###configure -timing $my_cells
characterize $my_cells

#report_sim_stats 

###model -fast -timing -lvf -file sis.lib
model -timing -file sis.lib
model -verilog -output mytag

# exec cp sis.lib $charpt 
# exec cp primelib.log $charpt/char.log  
