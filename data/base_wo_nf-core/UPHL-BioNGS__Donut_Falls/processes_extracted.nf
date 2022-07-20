Name : nanoplot
Inputs : [[0, 'sequencing_summary']]
Outputs : []
Emits : []


Name : fastp
Inputs : [[0, 'illumina_fastqs']]
Outputs : [[0, 'clean_reads']]
Emits : []


Name : filtlong
Inputs : [[0, 'fastq']]
Outputs : [[0, 'filtlong_fastq']]
Emits : []


Name : bgzip
Inputs : [[0, 'filtlong_fastq']]
Outputs : [[0, 'filtered_fastq'], [0, 'filtered_fastq_medaka']]
Emits : []


Name : flye
Inputs : [[0, 'filtered_fastq']]
Outputs : [[0, 'assembled_fastas']]
Emits : []


Name : miniasm_and_minipolish
Inputs : [[0, 'filtered_fastq']]
Outputs : [[0, 'miniasm_gfa']]
Emits : []


Name : any2fasta
Inputs : [[0, 'miniasm_gfa']]
Outputs : [[0, 'assembled_fastas']]
Emits : []


Name : raven
Inputs : [[0, 'filtered_fastq']]
Outputs : [[0, 'raven_fastas']]
Emits : []


Name : medaka
Inputs : [[0, 'assembled_fastas']]
Outputs : [[1, 'medaka_fastas']]
Emits : []


Name : polca
Inputs : [[0, 'for_polca']]
Outputs : [[0, 'new_rounds']]
Emits : []


