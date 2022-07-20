Name : _pre1_add_header
Inputs : [[0, 'feature_files_inputs'], [1, 'mkfiles_pre1']]
Outputs : [[0, 'results_pre1_add_header']]
Emits : []


Name : _pre2_filter_vcfs
Inputs : [[0, 'inputs_for_pre2'], [1, 'mkfiles_pre2']]
Outputs : [[0, 'results_pre2_filter_vcfs']]
Emits : []


Name : _001_concatenate_vcfs
Inputs : [[0, 'results_pre2_filter_vcfs'], [1, 'mkfiles_001']]
Outputs : [[0, 'results_001_concatenate_vcfs']]
Emits : []


Name : _pst1_normalize_and_compress
Inputs : [[0, 'inputs_for_pst1'], [1, 'mkfiles_pst1']]
Outputs : [[0, 'results_pst1_normalize_and_compress']]
Emits : []


