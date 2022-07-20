Name : index
Inputs : []
Outputs : [[0, 'index_ch']]
Emits : []


Name : parseEncode
Inputs : []
Outputs : [[0, '']]
Emits : []


Name : quant
Inputs : [[0, 'index_ch'], [1, 'encode_files_ch_1']]
Outputs : [[0, 'quant_ch']]
Emits : []


Name : fastqc
Inputs : [[0, 'encode_files_ch_2']]
Outputs : [[0, 'fastqc_ch']]
Emits : []


Name : multiqc
Inputs : [[0, 'quant_ch'], [0, 'fastqc_ch']]
Outputs : []
Emits : []


