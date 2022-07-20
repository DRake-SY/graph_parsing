Name : pre_process
Inputs : [[0, 'd1_file'], [1, 'd2_file'], [2, 'sample_file']]
Outputs : [[0, 'd1_file_use_1'], [0, 'd1_file_use_2'], [1, 'd2_file_use_1'], [1, 'd2_file_use_2'], [2, 'sample_file_use_1'], [2, 'sample_file_use_2']]
Emits : []


Name : run_method_1
Inputs : [[0, 'd1_file_use_1'], [1, 'd2_file_use_1'], [2, 'sample_file_use_1']]
Outputs : [[0, 'method1_out_folder']]
Emits : []


Name : run_method_2
Inputs : [[0, 'd1_file_use_2'], [1, 'd2_file_use_2'], [2, 'sample_file_use_2']]
Outputs : [[0, 'method2_out_folder']]
Emits : []


Name : combine_methods
Inputs : [[0, 'method1_out_folder'], [1, 'method2_out_folder'], [2, 'sample_file']]
Outputs : [[0, 'final_res_folder']]
Emits : []


