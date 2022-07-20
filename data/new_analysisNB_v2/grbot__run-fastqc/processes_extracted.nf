Name : runFastQC
Inputs : [[0, 'read_pair']]
Outputs : [[0, 'fastqc_files']]
Emits : []


Name : runMultiQC
Inputs : [[0, 'fastqc_files']]
Outputs : []
Emits : []


