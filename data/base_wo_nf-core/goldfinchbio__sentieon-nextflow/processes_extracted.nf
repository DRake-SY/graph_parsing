Name : alignment
Inputs : [[0, 'fasta_ref'], [1, 'fasta_ref_dict'], [2, 'fasta_ref_fai'], [3, 'fasta_ref_alt'], [4, 'fasta_ref_amb'], [5, 'fasta_ref_ann'], [6, 'fasta_ref_bwt'], [7, 'fasta_ref_pac'], [8, 'fasta_ref_sa'], [9, 'fastq1Path'], [10, 'fastq2Path']]
Outputs : [[0, 'outputs_sorted_bam'], [1, 'outputs_indexed_bam']]
Emits : []


Name : alignment_metrics
Inputs : [[0, 'outputs_sorted_bam'], [1, 'outputs_indexed_bam'], [2, 'fasta_ref'], [3, 'fasta_ref_dict'], [4, 'fasta_ref_fai']]
Outputs : [[0, 'output_meanqualitybycycle'], [1, 'output_qualdistribution'], [2, 'output_gcsummary'], [3, 'output_gcmetrics'], [4, 'output_alignsummary'], [5, 'output_insertsize']]
Emits : []


Name : plot_alignment_metrics_gc
Inputs : [[0, 'output_gcmetrics']]
Outputs : []
Emits : []


Name : plot_alignment_metrics_qd
Inputs : [[0, 'output_qualdistribution']]
Outputs : []
Emits : []


Name : plot_alignment_metrics_mq
Inputs : [[0, 'output_meanqualitybycycle']]
Outputs : []
Emits : []


Name : plot_alignment_metrics_isize
Inputs : [[0, 'output_insertsize']]
Outputs : []
Emits : []


Name : locus_collector
Inputs : [[0, 'outputs_sorted_bam'], [1, 'outputs_indexed_bam']]
Outputs : [[0, 'output_score_info'], [1, 'output_score_info_index']]
Emits : []


Name : deduplication
Inputs : [[0, 'outputs_sorted_bam'], [1, 'outputs_indexed_bam'], [2, 'output_score_info'], [3, 'output_score_info_index']]
Outputs : [[0, 'outputs_deduped_bam'], [1, 'outputs_deduped_indexed_bam'], [2, 'outputs_deduped_metrics']]
Emits : []


Name : realignment
Inputs : [[0, 'outputs_deduped_bam'], [1, 'outputs_deduped_indexed_bam'], [2, 'fasta_ref'], [3, 'fasta_ref_dict'], [4, 'fasta_ref_fai'], [5, 'reference_mills'], [6, 'reference_mills_index']]
Outputs : [[0, 'outputs_bam_realignment'], [1, 'outputs_realigned_indexed_bam']]
Emits : []


Name : qualcal
Inputs : [[0, 'outputs_bam_realignment'], [1, 'outputs_realigned_indexed_bam'], [2, 'fasta_ref'], [3, 'fasta_ref_dict'], [4, 'fasta_ref_fai'], [5, 'reference_mills'], [6, 'reference_mills_index'], [7, 'reference_dbsnp'], [8, 'reference_dbsnp_index']]
Outputs : [[0, 'outputs_recal_table']]
Emits : []


Name : qualcalpost
Inputs : [[0, 'outputs_bam_realignment'], [1, 'outputs_realigned_indexed_bam'], [2, 'outputs_recal_table'], [3, 'fasta_ref'], [4, 'fasta_ref_dict'], [5, 'fasta_ref_fai'], [6, 'reference_mills'], [7, 'reference_mills_index'], [8, 'reference_dbsnp'], [9, 'reference_dbsnp_index']]
Outputs : [[0, 'outputs_recal_table_post']]
Emits : []


Name : applyrecal
Inputs : [[0, 'outputs_recal_table'], [1, 'outputs_recal_table_post']]
Outputs : [[0, 'outputs_bqsr']]
Emits : []


Name : plotbqsr
Inputs : [[0, 'outputs_bqsr']]
Outputs : []
Emits : []


Name : haplotypecaller
Inputs : [[0, 'outputs_bam_realignment'], [1, 'outputs_realigned_indexed_bam'], [2, 'outputs_recal_table'], [3, 'fasta_ref'], [4, 'fasta_ref_dict'], [5, 'fasta_ref_fai'], [6, 'reference_dbsnp'], [7, 'reference_dbsnp_index']]
Outputs : [[0, 'outputs_gvcf'], [1, 'outputs_gvcf_index']]
Emits : []


