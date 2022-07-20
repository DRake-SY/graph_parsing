Name : sort_bams_to_fastq
Inputs : [[0, 'bams_sorting']]
Outputs : [[0, 'read_pairs_fastqc']]
Emits : []


Name : fastqc
Inputs : [[0, 'read_pairs_fastqc']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : multiqc
Inputs : [[0, 'fastqc_results']]
Outputs : [[0, 'multiqc_report']]
Emits : []


