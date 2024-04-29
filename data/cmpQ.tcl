set_log_file compare.log
set_config_opt sigma_delay_absolute_tolerance 0.002
set_config_opt sigma_delay_relative_tolerance 0.05
set_config_opt sigma_slew_absolute_tolerance 0.002
set_config_opt sigma_slew_relative_tolerance 0.05
set_config_opt sigma_hold_absolute_tolerance 0.002
set_config_opt sigma_hold_relative_tolerance 0.05
set_config_opt sigma_removal_absolute_tolerance 0.002
set_config_opt sigma_removal_relative_tolerance 0.05
set_config_opt sigma_setup_absolute_tolerance 0.002
set_config_opt sigma_setup_relative_tolerance 0.05
set_config_opt sigma_recovery_absolute_tolerance 0.002
set_config_opt sigma_recovery_relative_tolerance 0.05

set_config_opt mean_shift_delay_absolute_tolerance 0.002
set_config_opt mean_shift_delay_relative_tolerance 0.02
set_config_opt mean_shift_slew_absolute_tolerance 0.002
set_config_opt mean_shift_slew_relative_tolerance 0.02
set_config_opt mean_shift_constraint_absolute_tolerance 0.002
set_config_opt mean_shift_constraint_relative_tolerance 0.02
set_config_opt mean_shift_hold_absolute_tolerance 0.002
set_config_opt mean_shift_hold_relative_tolerance 0.02
set_config_opt mean_shift_removal_absolute_tolerance 0.002
set_config_opt mean_shift_removal_relative_tolerance 0.02
set_config_opt mean_shift_setup_absolute_tolerance 0.002
set_config_opt mean_shift_setup_relative_tolerance 0.02
set_config_opt mean_shift_recovery_absolute_tolerance 0.002
set_config_opt mean_shift_recovery_relative_tolerance 0.02

set_config_opt std_dev_delay_absolute_tolerance 0.002
set_config_opt std_dev_delay_relative_tolerance 0.03
set_config_opt std_dev_slew_absolute_tolerance 0.002
set_config_opt std_dev_slew_relative_tolerance 0.03
set_config_opt std_dev_constraint_absolute_tolerance 0.002
set_config_opt std_dev_constraint_relative_tolerance 0.03
set_config_opt std_dev_hold_absolute_tolerance 0.002
set_config_opt std_dev_hold_relative_tolerance 0.03
set_config_opt std_dev_removal_absolute_tolerance 0.002
set_config_opt std_dev_removal_relative_tolerance 0.03
set_config_opt std_dev_setup_absolute_tolerance 0.002
set_config_opt std_dev_setup_relative_tolerance 0.03
set_config_opt std_dev_recovery_absolute_tolerance 0.002
set_config_opt std_dev_recovery_relative_tolerance 0.03

set_config_opt skew_delay_absolute_tolerance 0.002
set_config_opt skew_delay_relative_tolerance 0.02
set_config_opt skew_slew_absolute_tolerance 0.002
set_config_opt skew_slew_relative_tolerance 0.02
set_config_opt skew_constraint_absolute_tolerance 0.002
set_config_opt skew_constraint_relative_tolerance 0.02
set_config_opt skew_hold_absolute_tolerance 0.002
set_config_opt skew_hold_relative_tolerance 0.02
set_config_opt skew_removal_absolute_tolerance 0.002
set_config_opt skew_removal_relative_tolerance 0.02
set_config_opt skew_setup_absolute_tolerance 0.002
set_config_opt skew_setup_relative_tolerance 0.02
set_config_opt skew_recovery_absolute_tolerance 0.002
set_config_opt skew_recovery_relative_tolerance 0.02

set_config_opt compare_library_top_failures 10

#set_config_opt compare_library_table_points { 1 8 57 64 }
#set_config_opt compare_library_table_points {1 3 5 13 15 17 25 27 29}
#set_config_opt compare_library_slew_indices {1 2 3 4 5 6 7}
#set_config_opt compare_library_load_indices {1 2 3 4 5 6 7}

set_config_opt compare_library_relative_error {sigma_delay_early "3*(test_value-ref_value)/(abs(nominal_ref)-3*ref_value+input_slew)" sigma_delay_late "3*(test_value-ref_value)/(abs(nominal_ref)+3*ref_value+input_slew)" sigma_slew_early "3*(test_value-ref_value)/(abs(nominal_ref)-3*ref_value)" sigma_slew_late "3*(test_value-ref_value)/(abs(nominal_ref)+3*ref_value)" mean_shift_delay "(test_value -ref_value)/(abs(nominal_ref) + 3*std_dev_ref + ref_value)" mean_shift_slew "(test_value -ref_value)/(abs(nominal_ref) + 3*std_dev_ref + ref_value)" std_dev_delay "3*(test_value -ref_value)/(abs(nominal_ref) + 3*ref_value)" std_dev_slew "3*(test_value -ref_value)/(abs(nominal_ref) + 3*ref_value)" skewness_delay "(test_value -ref_value)/(abs(nominal_ref) + 3*std_dev_ref)" skewness_slew "(test_value -ref_value)/(abs(nominal_ref) + 3*std_dev_ref)" sigma_hold "3*(test_value -ref_value)/(abs(nominal_ref) + 3*ref_value)" sigma_setup "3*(test_value -ref_value)/(abs(nominal_ref) + 3*ref_value)" mean_shift_hold "(test_value -ref_value)/(abs(nominal_ref) + 3*std_dev_ref + ref_value)" mean_shift_setup "(test_value -ref_value)/(abs(nominal_ref) + 3*std_dev_ref + ref_value)" std_dev_hold "3*(test_value -ref_value)/(abs(nominal_ref) + 3*ref_value)" std_dev_setup "3*(test_value -ref_value)/(abs(nominal_ref) + 3*ref_value)" skewness_hold "(test_value -ref_value)/(abs(nominal_ref) + 3*std_dev_ref)" skewness_setup "(test_value -ref_value)/(abs(nominal_ref) + 3*std_dev_ref)" sigma_removal "3*(test_value -ref_value)/(abs(nominal_ref) + 3*ref_value)" sigma_recovery "3*(test_value -ref_value)/(abs(nominal_ref) + 3*ref_value)" mean_shift_removal "(test_value -ref_value)/(abs(nominal_ref) + 3*std_dev_ref + ref_value)" mean_shift_recovery "(test_value -ref_value)/(abs(nominal_ref) + 3*std_dev_ref + ref_value)" std_dev_removal "3*(test_value -ref_value)/(abs(nominal_ref) + 3*ref_value)" std_dev_recovery "3*(test_value -ref_value)/(abs(nominal_ref) + 3*ref_value)" skewness_removal "(test_value -ref_value)/(abs(nominal_ref) + 3*std_dev_ref)" skewness_recovery "(test_value -ref_value)/(abs(nominal_ref) + 3*std_dev_ref)"}

set ref /global/gts_qcom19/ss5lpp/monikav/QCOM_2020_benchmark/2020.03-1/0.500v_tt_0c_cw_ccw_wfeol_wbeol/MC_100K/accuracy_lvf_20cells/models/liberty/liberty_TC_0C_0.500v.lib 
set ref_cons /global/gts_qcom19/ss5lpp/monikav/QCOM_2020_benchmark/2020.03-1/0.500v_tt_0c_cw_ccw_wfeol_wbeol/MC_cons/accuracy_lvf_20cells/models/liberty/liberty_TC_0C_0.500v.lib
set test ./accuracy_lvf_20cells/models/liberty/liberty_TC_0C_0.500v.lib

#compare_library -ref ref.lib -test sis.lib -value -all_points  -max_rel_diff -1 -compare_values {lvf} -output_dir compare_lvf_def -gui

set ref /global/gts_qcom19/ss5lpp/monikav/QCOM_2020_benchmark/2020.03-1/0.500v_tt_0c_cw_ccw_wfeol_wbeol/MC_100K_xor_mux/accuracy_lvf_20cells/models/liberty/liberty_TC_0C_0.500v.lib 
set test ./accuracy_lvf_20cells/models/liberty/liberty_TC_0C_0.500v.lib
#compare_library -ref $ref -test $test -value -all_points  -max_rel_diff -1 -compare_values {lvf} -output_dir compare_lvf_mux_xor_xnor
#set_config_opt compare_library_slew_indices {1 2 3 4 5}
#set_config_opt compare_library_load_indices {1 2 3 4 5}
#compare_library -ref $ref_cons -test $test -value -all_points  -max_rel_diff -1 -compare_values {lvf} -output_dir compare_lvf_constraints


compare_library -ref ref.lib -test sis.lib -value -all_points  -max_rel_diff -1 -compare_values {lvf} -output_dir /slowfs/hs_scr1/tcko/temp/out  -gui


