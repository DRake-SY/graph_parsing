Name : fastq_screen
Inputs : [[0, 'read_pairs_ch'], [1, 'fastq_screen_file']]
Outputs : [[0, 'fastq_screen_ch']]
Emits : []


Name : fastqc
Inputs : [[0, 'read_pairs2_ch']]
Outputs : [[0, 'fastqc_ch']]
Emits : []


Name : multiqc
Inputs : [[0, 'fastq_screen_ch'], [0, 'fastqc_ch']]
Outputs : []
Emits : []


