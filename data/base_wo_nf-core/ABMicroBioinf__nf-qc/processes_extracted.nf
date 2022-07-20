Name : stats_rawreads
Inputs : [[0, 'fastq_input_to_rawstats'], [1, 'rawreads_ch']]
Outputs : [[0, 'stats_rawreads_results']]
Emits : []


Name : fastqc_rawreads
Inputs : [[0, 'fastq_input_to_fastqc']]
Outputs : [[0, 'raw_fastqc_results']]
Emits : []


Name : bbduk
Inputs : [[0, 'fastq_input_to_qc'], [1, 'params'], [2, 'params']]
Outputs : [[0, 'qcreads_to_fastqc'], [1, 'qcreads_to_kraken2'], [2, 'qcreads_to_stats'], [3, 'qc_stats']]
Emits : []


Name : stats_qcreads
Inputs : [[0, 'qcreads_to_stats'], [1, 'qcreads_ch']]
Outputs : [[0, 'stats_qcreads_results']]
Emits : []


Name : kraken2
Inputs : [[0, 'qcreads_to_kraken2']]
Outputs : [[0, 'kraken2_results'], [1, 'bracken_results']]
Emits : []


Name : fastqc_qcreads
Inputs : [[0, 'qcreads_to_fastqc']]
Outputs : [[0, 'qc_fastqc_results']]
Emits : []


Name : multiqc
Inputs : [[0, 'raw_fastqc_results'], [1, 'qc_fastqc_results'], [2, 'qc_stats']]
Outputs : [[0, 'multiqc_report'], [1, 'multiqc_report_files']]
Emits : []


