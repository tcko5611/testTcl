# See SiliconSmart User Guide Appendix B for a complete list of parameters and definitions
#################################
# OPERATING CONDITIONS DEFINITION
#################################

create_operating_condition ssgnp0p35vn40c
set_opc_process ssgnp0p35vn40c {
    {.inc "/slowfs/char_slow13/jsjou/hsmc/case/N16/Inputs/spice_models/spice_ssgnp0p72vn40c.mod"}
}
add_opc_supplies ssgnp0p35vn40c VBP 0.35 VDD 0.35
add_opc_grounds ssgnp0p35vn40c VSS 0.0 VBN 0.0
set_opc_temperature ssgnp0p35vn40c -40
set_opc_default_voltage ssgnp0p35vn40c 0.35

add_back_bias_supplies {
    VBP nwell VDD
    VBN pwell VSS
}

#################################
# GLOBAL CONFIGURATION PARAMETERS
#################################

define_parameters default {
    set model_significant_digits 7

    set nmos_model_names {nch_lvt_mac nch_mpodelvt_mac}
    set pmos_model_names {pch_lvt_mac pch_mpodelvt_mac}
    set nmos_drn_src_shorted_model_names {npode_lvt_mac}
    set pmos_drn_src_shorted_model_names {ppode_lvt_mac}
    set dio_model_names {ndio_mac pdio_mac}

    # List of operating conditions as defined by create_operation_condition
    set active_pvts { ssgnp0p35vn40c }

    # HSPICE
    set simulator hspice
   # set simulator_cmd {/u/hspmgr/QA_dirs/l2016.06_rel/VERILOGA_HOME/bin/hspice -i <input_deck> -o <listing_file>}
#  set simulator_cmd {  /u/hspmgr/QA_dirs/p2019.06_dev/VERILOGA_HOME/bin/hspice -i <input_deck> -o <listing_file>}
#  set simulator_cmd {  /global/apps/hspice_2020.12-3/hspice/bin/hspice  -i <input_deck> -o <listing_file>}
#  set simulator_cmd {  /remote/char_fast6/jsjou/P4/jsjou_ava_MAIN/snps/hspice/optimize/bin/hspice  -i <input_deck> -o <listing_file>}
#  set simulator_cmd {  /remote/char_fast6/jsjou/P4/jsjou_ava_MAIN/share/python/Omega/lvf/invmc/hspice_wrapper.csh  -i <input_deck> -o <listing_file>}

#  set simulator_cmd {  /global/apps/hspice_2020.12-SP1/hspice/bin/hspice  -i <input_deck> -o <listing_file>}
#  set simulator_cmd {  /global/snps2lava/jsjou/HSP/hspice_2020.12-SP1/hspice/bin/hspice   -i <input_deck> -o <listing_file>}
# set simulator_cmd { /global/snps2lava/jsjou/HSP/hspice_202012_SP1/hspice/bin/hspice -i <input_deck> -o <listing_file>}
#set simulator_cmd { /remote/char_fast6/jsjou/P4/jsjou_ava_MAIN/snps/hspice/optimize/bin/hspice  -i <input_deck> -o <listing_file>}
# set simulator_cmd { /remote/char_fast6/jsjou/HSP/hspice_2020.12-SP2/hspice/bin/hspice -i <input_deck> -o <listing_file>}
# set simulator_cmd { /remote/char_fast6/jsjou/P4/jsjou_ava_2109_DEV/snps/hspice/optimize/bin/hspice  -i <input_deck> -o <listing_file>}
# set simulator_cmd { /remote/char_fast6/jsjou/HSP/s2021.09_dev_D20210911/hspice/bin/hspice  -i <input_deck> -o <listing_file>}
# set simulator_cmd { /remote/char_fast6/jsjou/P4/jsjou_ava_2109_SP2/snps/hspice/optimize/bin/hspice  -i <input_deck> -o <listing_file>}


 
    set simulator_bisection 1
    set statistical_simulator_bisection 1
    set auto_fix 2

    # Default simulator options for Finesim, Hspice, Spectre, Msim, and Eldo
    set simulator_options {
        "common,hspice:  statfl=1 brief=1 lislvl=1 ingold=2 nomod nopage numdgt=10 measdgt=10 autostop symb=1 altcc=1 runlvl=5 accurate=1 gmindc=1e-15 macmod=3 mcbrief=5 "
        "leakage,hspice: statfl=1 brief=1 lislvl=1 ingold=2 nomod nopage numdgt=10 measdgt=10 autostop symb=1 altcc=1 runlvl=5 accurate=1 gmindc=1e-15 macmod=3"
    }

    # Simulation resolution
    set time_res_high 1e-10

    # Controls which supplies are measured for power consumption
    set power_meas_supplies { VDD VBP}

    # list of ground supplies used (required for Functional Recognition)
    set power_meas_grounds { VSS VBN}

    # specifies which multi-rail format to be used in Liberty model; none, v1, or v2.
    set liberty_multi_rail_format v2

    # enable modeling of attribute cell_leakage_power
    set enable_cell_leakage_power_modeling 1
    set model_input_leakage_current 1
    set gate_leakage_time_scaling_factor 200
    set enable_dc_leakage 1
    # temporarily setting these, need to change values later
    set power_dynamic_end_threshold 0.05
    set power_stabilization_threshold_absolute 1500e-18

    # LOAD SHARE PARAMETERS
    #  job_scheduler: 'lsf' (Platform), 'grid' (SunGrid), or 'standalone' (local machine)
    set job_scheduler grid 
    set cdpl_worker_timeout 6000
###    set run_list_maxsize 2500 
    set run_list_maxsize 1
#    set normal_queue {-P bnormal -l "arch=glinux,mem_free=4G,qsc=h|i|j|k|l,scratch_free=1G" }
    set normal_queue {-P sis -V -l "mem_free=1G,qsc=r|s" -b n }
#    set simulation_tmpdir /dev/shm 
    set enable_cache 1

    #Retain simulation data
    set archive_condition_on_success yes
    set archive_condition_on_failure yes
    set sis_gzip_enable 0


    set model_back_bias 1
    set back_bias_connection device_layer

    #Pin capacitance calculation method (min/max/ave)
    set model_pin_cap_calc ave
    set model_rise_fall_capacitance 1
    set model_rise_fall_capacitance_range false

    # Model ccs_noise 
    set ccsn_use_enhanced_hw_method 1 
    set ccsn_add_second_level_ccb_load 1
    set ccsn_use_optimal_node_selection_method 0 
    set ccsn_model_default_pin_based_models 0
    set configure_all_states_for_ccb 1
    set enable_exhaustive_modeling_of_ccbs 1
    set generate_all_ccbs_after_passgate 1
    set prechar_binning_timing none
    set ccsn_use_enhanced_miller_cap 1
#    set constraint_pulse_cratering 0
    set constraint_pulse_cratering 1
    set mpw_rail_to_rail 1
    set liberty_cap_unit 1pf
    set report_constraint_iterations 0

    # nochange settings 
    set nochange_variance 15e-12
    set nochange_threshold 0.1

    set model_normalized_driver_waveform 1
    set model_normalized_constraint_driver_waveform 1
    set model_failed_cells_in_lib 1
    #LVF settings
    set enable_netlist_pruning 1
  # set statistical_reduction_factor 0.5
    set_liberty_attribute -library default_operating_conditions ssgnp0p35vn40c
    set sdf_cond_equality_operator '=='
    set sdf_cond_format 1
    set liberty_minimize_timing_when 0
    set model_default_arcs 0
    
    set liberty_power_down_function 1
    set liberty_max_transition 1
    set liberty_flavor "2010.03"
    set liberty_max_capacitance_mode 2

    # ECSM settings
    set ecsm_fixed_levels {0.02 0.05 0.10 0.20 0.30 0.40 0.50 0.60 0.70 0.80 0.90 0.95 0.98}
    set ecsm_use_fixed_levels 1
    set exclude_ecsm_start_end_points 1
    set ecsm_threshold_pcts_rise {0.1 0.3 0.5 0.6 0.7 0.8 0.9 0.999}
    set ecsm_threshold_pcts_fall {0.9 0.7 0.5 0.4 0.3 0.2 0.1 0.001}

    # The SiS default changed from double-side to positive-side in SiS 2016.03
    set smc_degrade_check double-side
}

############################
# DEFAULT PINTYPE PARAMETERS
############################
pintype default {

    set logic_high_name VDD
    set logic_high_threshold 0.7

    set logic_low_name VSS
    set logic_low_threshold 0.3

    set prop_delay_level 0.5

    set logic_low_threshold_rise 0.3
    set logic_low_threshold_fall 0.3
    set logic_high_threshold_rise 0.7
    set logic_high_threshold_fall 0.7

    # Number of slew and load indices
    # (when importing with -use_default_slews -use_default_loads)
    set numsteps_slew 1
    set numsteps_load 1
    set constraint_numsteps_slew 1

    # Operating load ranges
    set smallest_load 8.475e-17
    # set largest_load 500e-15

    # Operating slew ranges
    set smallest_slew 1.112e-12
    set largest_slew 2.738e-10
    set max_tout 2.738e-10
    # Automatically determine largest_load based on max_tout; off or on
    set autorange_load off

    # Option to sweep load on secondary outputs
    #set default_load_mode fixed
    #set default_load_mode swept
    #set default_load_scale 1.0
    set default_load_mode position
    set default_load_index_position 2
    
    # Option to set default load for constraint
    set default_load 50e-15
    set constraint_default_load 50e-15

    # Noise of points in for noise height
    set numsteps_height 8

    # Input noise width.
    set numsteps_width 5

    # Model ccs_noise dc_current tables with 29 points
    set ccsn_numsteps_voltage 29 

    # driver model: pwl, emulated, active, active-waveform, custom
    set driver_mode emulated
    set emulated_driver_ratio 0.5
    set enable_clamped_predriver 1

    #Constraint setup
    set constraint_resolution 1e-12
    set smc_constraint_style relative-degradation 
    set smc_degrade 0.1
    set glitch_high_threshold 0.9
    set glitch_low_threshold 0.1
}

pintype int_1 ->default {
    set smc_constraint_style pass-fail 
    set glitch_high_threshold 0.8
    set glitch_low_threshold 0.2
}

pintype int_2 ->default {
    set smc_constraint_style relative-degradation
    set smc_degrade 0.05
    set smc_degrade_absolute 5e-12
    set smc_max_degrade_absolute 15e-12
}


#####################################
# LIBERTY MODEL GENERATION PARAMETERS
#####################################
define_parameters liberty_model {
    set technology cmos
    set delay_model table_lookup
    set current_unit 1mA
    set leakage_power_unit 1nW
    set pulling_resistance_unit 1kohm
    set time_unit 1ns
    set voltage_unit 1V

    set default_cell_leakage_power 0.0
    set default_fanout_load 1.0
    set default_inout_pin_cap  1.0
    set default_input_pin_cap  1.0
    set default_leakage_power_density 0.0

    set default_max_fanout 100000
    set default_output_pin_cap 0.0
    set default_threshold_voltage_group std

    set input_threshold_pct_fall 50
    set input_threshold_pct_rise 50
    set output_threshold_pct_fall 50
    set output_threshold_pct_rise 50
    set slew_derate_from_library 0.5
    set slew_lower_threshold_pct_fall 30
    set slew_lower_threshold_pct_rise 30
    set slew_upper_threshold_pct_fall 70
    set slew_upper_threshold_pct_rise 70
}

#######################
# VALIDATION PARAMETERS
#######################
define_parameters validation {
set absolute_tolerance 0.005
set relative_tolerance 0.02
set product_tolerance 0
set setup_absolute_tolerance 0.020
set setup_relative_tolerance 0.05
}
