Name : align
Inputs : [[0, 'read_pairs_ch']]
Outputs : [[0, 'aligned_reads_ch']]
Emits : []


Name : markDuplicatesSpark
Inputs : [[0, 'aligned_reads_ch']]
Outputs : [[0, 'pair_id'], [1, ''], [2, 'bam_for_variant_calling'], [2, 'sorted_dedup_ch_for_metrics'], [2, 'bam_for_bqsr'], [3, 'pair_id'], [4, 'dedup_qc_ch']]
Emits : []


Name : getMetrics
Inputs : [[0, 'pair_id'], [1, 'round'], [2, 'sorted_dedup_ch_for_metrics']]
Outputs : [[0, 'pair_id'], [3, 'metrics_qc_ch']]
Emits : []


Name : haplotypeCaller
Inputs : [[0, 'pair_id'], [1, 'round'], [2, 'bam_for_variant_calling']]
Outputs : [[0, 'round'], [1, 'hc_output_ch']]
Emits : []


Name : selectVariants
Inputs : [[0, 'pair_id'], [1, 'round'], [2, 'hc_output_ch']]
Outputs : [[0, 'pair_id'], [1, 'round'], [2, 'raw_snps_ch'], [3, 'pair_id'], [4, 'round'], [5, 'raw_indels_ch']]
Emits : []


Name : filterSnps
Inputs : [[0, 'raw_snps_ch']]
Outputs : [[0, 'filtered_snps_ch_1'], [0, 'filtered_snps_ch_2']]
Emits : []


Name : filterIndels
Inputs : [[0, 'pair_id'], [1, 'round'], [2, 'raw_indels_ch']]
Outputs : [[0, 'pair_id'], [2, 'filtered_indels_for_recal']]
Emits : []


Name : bqsr
Inputs : [[0, 'pair_id'], [1, 'round'], [2, 'input_bam'], [3, 'round'], [4, 'filtered_snps'], [5, 'filtered_snps_index'], [6, 'filtered_indels'], [7, 'bam_for_bqsr'], [7, 'filtered_snps_for_recal'], [7, 'filtered_indels_for_recal']]
Outputs : [[0, 'pair_id'], [2, 'analyze_covariates_in_ch'], [3, 'pair_id'], [4, 'new_round'], [5, 'recalibrated_bam_ch']]
Emits : []


Name : analyzeCovariates
Inputs : [[0, 'analyze_covariates_in_ch']]
Outputs : [[0, 'analyzed_covariates_ch']]
Emits : []


Name : snpEff
Inputs : [[0, 'pair_id'], [1, 'round'], [2, 'filtered_snps'], [3, 'filtered_snps_for_snpeff']]
Outputs : [[0, 'snpeff_out']]
Emits : []


Name : qc
Inputs : [[0, 'pair_id'], [6, 'round_1'], [9, 'round_2'], [11, 'dedup_qc_ch'], [11, 'metrics_qc_ch'], [11, 'snps_1_qc_ch'], [11, 'snps_2_qc_ch']]
Outputs : [[0, 'qc_output']]
Emits : []


