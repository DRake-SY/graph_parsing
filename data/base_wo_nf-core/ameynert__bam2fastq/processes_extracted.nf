Name : extractFastqCram
Inputs : [[0, 'alignment_sort_ch'], [1, 'reference_ch']]
Outputs : [[0, 'fastq_ch']]
Emits : []


Name : extractFastqBam
Inputs : [[0, 'alignment_sort_ch']]
Outputs : [[0, 'fastq_ch']]
Emits : []


Name : readStats
Inputs : [[0, 'alignment_flagstat_ch']]
Outputs : [[0, 'flagstat_results_ch'], [1, 'flagstat_counts_ch']]
Emits : []


Name : fastQC
Inputs : [[0, 'fastq_ch']]
Outputs : [[0, 'fastqc_results_ch'], [1, 'fastqc_counts_ch']]
Emits : []


Name : checkCounts
Inputs : [[0, 'flagstat_counts_ch'], [1, 'fastqc_counts_ch']]
Outputs : [[0, 'collect_counts_ch']]
Emits : []


