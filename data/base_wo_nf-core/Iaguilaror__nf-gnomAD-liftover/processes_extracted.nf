Name : _pre0_split_vcf
Inputs : [[0, 'vcf_inputs'], [1, 'mkfiles_pre0']]
Outputs : [[0, 'results_pre0_split_vcf']]
Emits : []


Name : _pre1_filtering_PASS
Inputs : [[0, 'delayed_results_pre0_split_vcf'], [1, 'mkfiles_pre1']]
Outputs : [[0, 'results_pre1_filtering_PASS']]
Emits : []


Name : _001_liftover
Inputs : [[0, 'delayed_results_pre1_filtering_PASS'], [1, 'liftover_references'], [2, 'mkfiles_001']]
Outputs : [[0, 'results_001_liftover_mapped'], [1, 'results_001_liftover_unmapped']]
Emits : []


Name : _002_edit_vcf
Inputs : [[0, 'delayed_results_001_liftover_mapped'], [1, 'mkfiles_002']]
Outputs : [[0, 'results_002_edit_vcf']]
Emits : []


Name : _003_concatenate_vcf
Inputs : [[0, 'multiplechunks_from_results_002_edit_vcf'], [1, 'mkfiles_003']]
Outputs : [[0, 'results_003_concatenate_vcf'], [0, 'also_results_003_concatenate_vcf']]
Emits : []


Name : _004_sort_and_compress
Inputs : [[0, 'delayed_results_003_concatenate_vcf'], [1, 'mkfiles_004']]
Outputs : []
Emits : []


Name : _pos1_count_lifted_variants
Inputs : [[0, 'inputs_for_pos1'], [1, 'mkfiles_pos1']]
Outputs : [[0, 'results_pos1_count_lifted_variants']]
Emits : []


