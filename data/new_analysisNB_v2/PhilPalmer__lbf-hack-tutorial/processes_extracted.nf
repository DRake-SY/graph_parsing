Name : fastqc
Inputs : [[0, 'reads']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : multiqc
Inputs : [[0, 'fastqc_results']]
Outputs : [[0, 'multiqc_report']]
Emits : []


