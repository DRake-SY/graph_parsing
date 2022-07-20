Name : download_ref
Inputs : []
Outputs : [[0, 'fasta_downloaded']]
Emits : []


Name : download_gtf_toBed
Inputs : []
Outputs : [[0, 'bed12_1'], [0, 'bed12_2'], [1, 'gtf1'], [1, 'gtf2'], [1, 'gtf3 when']]
Emits : []


Name : download_adapters
Inputs : []
Outputs : [[0, 'ch_adapters']]
Emits : []


Name : trim
Inputs : [[0, 'BBDUK_reads'], [1, 'ch_adapters']]
Outputs : [[0, 'trimmed_reads_ch_1'], [0, 'trimmed_reads_ch_2'], [1, 'trimmed_stats_ch']]
Emits : []


Name : fastqc
Inputs : [[0, 'trimmed_reads_ch_1']]
Outputs : [[0, 'fastqc_trim']]
Emits : []


Name : multiqc
Inputs : [[0, 'fastqc_trim']]
Outputs : [[0, 'multiqc_report_ch']]
Emits : []


Name : create_index
Inputs : [[0, 'fasta_downloaded']]
Outputs : [[0, 'index_created']]
Emits : []


Name : align_hisat2
Inputs : [[0, 'aligner_reads'], [1, 'ch_index']]
Outputs : [[0, 'hisat_sams'], [1, 'alignment_logs']]
Emits : []


Name : samtobams
Inputs : [[0, 'hisat_sams']]
Outputs : [[0, 'bam_sorted1'], [0, 'bam_sorted2 when']]
Emits : []


Name : indexBams
Inputs : [[0, 'hisat_bams1']]
Outputs : [[0, 'bai_bam']]
Emits : []


Name : featureCounts
Inputs : [[0, 'hisat_bams2'], [1, 'gtf1']]
Outputs : [[0, 'counts']]
Emits : []


Name : tin
Inputs : [[0, 'bed12_1'], [1, 'bai_bam']]
Outputs : [[0, 'tin_out']]
Emits : []


