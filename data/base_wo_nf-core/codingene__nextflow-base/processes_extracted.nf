Name : fastp
Inputs : [[0, 'read_pairs_ch']]
Outputs : [[0, 'fastp_ch'], [0, 'fastp_ch2'], [1, 'fastp_reports']]
Emits : []


Name : fastqc
Inputs : [[0, 'fastp_ch']]
Outputs : [[0, 'fastqc_report']]
Emits : []


Name : index
Inputs : [[0, 'cdna_file']]
Outputs : [[0, 'index_ch']]
Emits : []


Name : quant
Inputs : [[0, 'index_ch'], [1, 'fastp_ch2']]
Outputs : [[0, 'quant_ch']]
Emits : []


Name : multiqc
Inputs : [[0, 'quant_ch'], [0, 'fastqc_report']]
Outputs : []
Emits : []


