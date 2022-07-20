Name : fastqc
Inputs : [[0, 'read_ch']]
Outputs : [[0, 'fastqc_ch']]
Emits : []


Name : multiqc
Inputs : [[0, 'fastqc_ch']]
Outputs : []
Emits : []


