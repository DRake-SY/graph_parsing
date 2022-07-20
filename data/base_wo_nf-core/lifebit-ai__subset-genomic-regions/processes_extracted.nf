Name : create_design_row
Inputs : [[0, 'ch_files']]
Outputs : [[0, 'ch_rows']]
Emits : []


Name : bind_design_rows
Inputs : [[0, 'ch_rows']]
Outputs : [[0, 'ch_design_file'], [1, 'ch_indices_only'], [2, 'ch_main_files_only'], [3, 'ch_complete_file_sets']]
Emits : []


Name : stage_main_files
Inputs : [[0, 'ch_main_files']]
Outputs : [[0, 'ch_main_files_lists']]
Emits : []


Name : stage_index_files
Inputs : [[0, 'ch_indices']]
Outputs : [[0, 'ch_indices_only_lists']]
Emits : []


Name : stage_file_sets
Inputs : [[0, 'ch_complete_sets']]
Outputs : [[0, 'ch_completed_file_sets_list']]
Emits : []


Name : collect_checksums
Inputs : [[0, 'ch_checksums']]
Outputs : []
Emits : []


