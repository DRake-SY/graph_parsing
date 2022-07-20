Name : filter_length
Inputs : [[0, 'fastq_ch1']]
Outputs : [[0, 'sequences_ch']]
Emits : []


Name : split_sequence
Inputs : [[0, 'sequences_ch']]
Outputs : [[0, 'split_ch']]
Emits : []


Name : run_assembly
Inputs : [[0, 'split_ch']]
Outputs : [[0, 'assembly_ch'], [1, 'assembly_results_ch']]
Emits : []


Name : run_map_back
Inputs : [[0, 'fastq_ch2'], [0, 'assembly_ch']]
Outputs : [[0, 'remap_ch']]
Emits : []


