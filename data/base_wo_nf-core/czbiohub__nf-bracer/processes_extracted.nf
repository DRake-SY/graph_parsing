Name : unzip_fastqs
Inputs : [[0, 'read_files']]
Outputs : [[0, 'reads_unzipped_ch']]
Emits : []


Name : assemble
Inputs : [[0, 'reads_unzipped_ch']]
Outputs : [[0, 'assembled_ch']]
Emits : []


Name : summarize
Inputs : [[0, 'assembled_ch']]
Outputs : [[0, 'sum_ch']]
Emits : []


