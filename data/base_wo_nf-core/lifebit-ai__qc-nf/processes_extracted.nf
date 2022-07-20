Name : fastqc
Inputs : [[0, 'raw_reads_fastqc']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : multiqc
Inputs : [[0, 'fastqc_results']]
Outputs : [[0, 'multiqc_report']]
Emits : []


