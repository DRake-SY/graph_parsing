Name : index
Inputs : [[0, 'transcriptome_file']]
Outputs : [[0, 'index_ch']]
Emits : []


Name : quant
Inputs : [[0, 'index_ch'], [1, 'read_pairs_ch']]
Outputs : [[0, 'quant_ch']]
Emits : []


Name : fastqc
Inputs : [[0, 'read_pairs2_ch']]
Outputs : [[0, 'fastqc_ch']]
Emits : []


Name : multiqc
Inputs : [[0, 'quant_ch'], [0, 'fastqc_ch'], [1, 'multiqc_file']]
Outputs : []
Emits : []


