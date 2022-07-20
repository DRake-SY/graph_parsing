Name : shuffle_accessions
Inputs : [[0, 'ch_schemes']]
Outputs : [[0, 'ch_schemes_shuffled']]
Emits : []


Name : fasterq_dump
Inputs : [[0, 'ch_accessions']]
Outputs : [[0, 'ch_fastqs'], [0, 'ch_fastqs_2'], [0, 'ch_fastqs_snippy'], [0, 'ch_fastqs_for_wc']]
Emits : []


Name : biohansel
Inputs : [[0, '1'], [1, 'thread_combos'], [2, 'ch_collected_fastqs']]
Outputs : [[0, 'ch_biohansel'], [1, 'ch_biohansel_multi_trace']]
Emits : []


Name : biohansel_single_cpu
Inputs : [[0, '1'], [1, 'ch_fastqs_2']]
Outputs : [[0, 'ch_biohansel_singles'], [1, 'ch_biohansel_single_trace']]
Emits : []


Name : snippy
Inputs : [[0, 'thread_combos'], [1, 'ch_fastqs_snippy']]
Outputs : [[0, 'ch_snippy_trace']]
Emits : []


Name : trace_table
Inputs : [[0, 'ch_trace']]
Outputs : [[0, 'trace_table_csv']]
Emits : []


