Name : bam2fq
Inputs : [[0, 'infiles']]
Outputs : [[0, 'fastqpairs']]
Emits : []


Name : fastqc
Inputs : [[0, 'fastqs']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : multiqc
Inputs : [[0, 'fastqc_results'], [1, 'ch_config_for_multiqc']]
Outputs : [[0, 'final_output']]
Emits : []


