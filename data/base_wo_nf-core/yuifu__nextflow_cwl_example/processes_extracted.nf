Name : download_fastq
Inputs : [[0, 'run_ids']]
Outputs : [[0, 'fastq_files']]
Emits : []


Name : kallisto_se
Inputs : [[0, 'fastq_files'], [1, 'params']]
Outputs : [[0, 'kallisto_results']]
Emits : []


