Name : fastqc
Inputs : [[0, 'read_files_fastqc']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : trimming
Inputs : [[0, 'read_files_trimming']]
Outputs : [[0, 'ch_fastq_trimmed']]
Emits : []


Name : panda_pair_trimmed
Inputs : [[0, 'ch_fastq_trimmed']]
Outputs : [[0, 'panda_results']]
Emits : []


Name : panda_pair_untrimmed
Inputs : [[0, 'read_files_trimming']]
Outputs : [[0, 'panda_results']]
Emits : []


Name : unique_count
Inputs : [[0, 'panda_results']]
Outputs : [[0, 'count_results']]
Emits : []


Name : csv_convert
Inputs : [[0, 'count_results']]
Outputs : [[0, 'csv_results']]
Emits : []


