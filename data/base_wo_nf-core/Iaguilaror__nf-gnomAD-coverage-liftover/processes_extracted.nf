Name : _pre1_split_data
Inputs : [[0, 'covfile_input'], [1, 'mkfiles_pre1']]
Outputs : [[0, 'results_pre1_split_data']]
Emits : []


Name : _001_tsv2bed
Inputs : [[0, 'results_pre1_split_data'], [1, 'mkfiles_001']]
Outputs : [[0, 'results_001_tsv2bed']]
Emits : []


Name : _002_liftover
Inputs : [[0, 'liftover_inputs'], [1, 'mkfiles_002']]
Outputs : [[0, 'results_002_liftover']]
Emits : []


Name : _003_sort_compress
Inputs : [[0, 'all_chunks_002'], [1, 'mkfiles_003']]
Outputs : [[0, 'results_003_sort_compress']]
Emits : []


Name : _pos1_count_lifted_positions
Inputs : [[0, 'results_003_sort_compress'], [1, 'again_covfile_input'], [2, 'mkfiles_pos1']]
Outputs : []
Emits : []


