Name : runFastQC
Inputs : [[0, 'read_pair']]
Outputs : [[0, 'fastqc_files']]
Emits : []


Name : runMultiQC
Inputs : [[0, 'fastqc_files']]
Outputs : []
Emits : []


Name : adapter_trimming
Inputs : []
Outputs : [[0, 'trimmed_reads']]
Emits : []


Name : filter_long
Inputs : []
Outputs : [[0, 'filtlong_reads']]
Emits : []


Name : assembly
Inputs : []
Outputs : [[0, 'filtlong_reads']]
Emits : []


