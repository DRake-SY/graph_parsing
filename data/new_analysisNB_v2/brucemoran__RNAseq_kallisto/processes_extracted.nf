Name : endedness
Inputs : [[0, 'sampleInputs']]
Outputs : [[0, 'sampleCsvInput']]
Emits : []


Name : bbduk
Inputs : [[0, 'bbduking']]
Outputs : [[0, 'fastppreing'], [1, '']]
Emits : []


Name : fastp
Inputs : [[0, 'fastping']]
Outputs : [[0, 'fastp_multiqc']]
Emits : []


Name : kallistondx
Inputs : []
Outputs : [[0, 'kallisto_index']]
Emits : []


Name : kallisto
Inputs : [[0, 'kallistoing'], [1, 'kallisto_index']]
Outputs : [[0, 'de_kallisto'], [1, 'kallisto_multiqc']]
Emits : []


Name : mltiqc
Inputs : [[0, 'multiqc_multiqc']]
Outputs : [[0, 'completedmultiqc'], [1, 'sendmail_multiqc']]
Emits : []


Name : RNAseqR
Inputs : [[0, 'de_kallisto']]
Outputs : [[0, 'completedRNAseqR']]
Emits : []


