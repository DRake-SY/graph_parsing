Name : fastp
Inputs : [[0, 'read_pairs_ch']]
Outputs : [[0, 'fastp_ch'], [2, 'fastp_ch2'], [3, 'seqmode_ch']]
Emits : []


Name : summary
Inputs : [[0, 'fastp_ch2']]
Outputs : [[0, 'total_reads']]
Emits : []


Name : multiqc
Inputs : [[0, 'fastp_ch'], [1, 'mqc_config'], [2, 'total_reads'], [3, 'seqmode_ch']]
Outputs : []
Emits : []


Name : fastq_stats_ilmn
Inputs : [[0, 'reads_ch'], [1, 'fastq_stats_report_ch']]
Outputs : []
Emits : []


Name : fastq_stats_ont
Inputs : [[0, 'reads_ch'], [1, 'fastq_stats_report_ont_ch']]
Outputs : []
Emits : []


