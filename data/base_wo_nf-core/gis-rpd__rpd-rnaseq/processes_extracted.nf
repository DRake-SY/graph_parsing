Name : readunit_merge
Inputs : [[0, 'raw_fastq_ch']]
Outputs : [[0, 'merged_fastq_ch'], [0, 'fastqc_ch']]
Emits : []


Name : fastqc
Inputs : [[0, 'fastqc_ch']]
Outputs : [[0, 'fastqc_results'], [1, 'fastqc_out_ch']]
Emits : []


Name : trim_galore
Inputs : [[0, 'merged_fastq_ch']]
Outputs : [[0, 'trim_fastq'], [1, 'trim_fastqc_results'], [2, 'trim_fastqc']]
Emits : []


Name : star
Inputs : [[0, 'fastq_input_ch'], [1, 'ref_staridx'], [2, 'star_gtf']]
Outputs : [[0, 'star_aligned'], [1, 'alignment_logs'], [3, 'star_log']]
Emits : []


Name : collectRnaSeqMetrics
Inputs : [[0, 'collectRnaSeqMetrics'], [1, 'refflat']]
Outputs : [[0, 'picard_metrics']]
Emits : []


Name : rseqc
Inputs : [[0, 'bam_rseqc'], [1, 'gtf_bed']]
Outputs : [[0, 'rseqc_results']]
Emits : []


Name : createBigWig
Inputs : [[0, 'bam_createBigWig']]
Outputs : [[0, 'bigwig_for_genebody']]
Emits : []


Name : rsem
Inputs : [[0, 'bam_rsem'], [1, 'rsemidx']]
Outputs : [[0, 'rsem_results']]
Emits : []


Name : multiqc
Inputs : [[0, 'multiqc_config'], [1, 'fastqc_ch_test'], [2, 'alignment_logs'], [3, 'rseqc_results'], [4, 'rsem_results'], [5, 'picard_metrics']]
Outputs : [[0, 'multiqc_report'], [1, 'multiqc_data']]
Emits : []


