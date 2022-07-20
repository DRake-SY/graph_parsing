Name : consolidate_gvcf
Inputs : []
Outputs : [[0, 'genomicsdb_ch']]
Emits : []


Name : joint_genotyping
Inputs : [[0, 'genomicsdb_ch']]
Outputs : [[0, 'genotyped_filter_ch']]
Emits : []


Name : filter_qual
Inputs : [[0, 'genotyped_filter_ch']]
Outputs : [[0, 'genotyped_snprecal_ch'], [0, 'genotyped_snpapplyrecal_ch'], [0, 'genotyped_indelrecal_ch'], [0, 'genotyped_indelapplyrecal_ch']]
Emits : []


Name : recalibrate_snps
Inputs : [[0, 'genotyped_snprecal_ch']]
Outputs : [[0, 'snps_recal_table_ch'], [1, 'snps_trances_table_ch']]
Emits : []


Name : apply_vqsr_snps
Inputs : [[0, 'genotyped_snpapplyrecal_ch'], [1, 'snps_recal_table_ch'], [2, 'snps_trances_table_ch']]
Outputs : []
Emits : []


Name : recalibrate_indels
Inputs : [[0, 'genotyped_indelrecal_ch']]
Outputs : [[0, 'indels_recal_table_ch'], [1, 'indels_trances_table_ch']]
Emits : []


Name : apply_vqsr_indels
Inputs : [[0, 'genotyped_indelapplyrecal_ch'], [1, 'indels_recal_table_ch'], [2, 'indels_trances_table_ch']]
Outputs : [[0, 'recalibrated_indels_ch']]
Emits : []


Name : join_SNPs_INDELs
Inputs : [[0, 'recalibrated_snps_ch'], [1, 'recalibrated_indels_ch']]
Outputs : [[0, 'joined_snp_indel_ch']]
Emits : []


Name : refine_genotypes
Inputs : [[0, 'joined_snp_indel_ch']]
Outputs : [[0, 'refined_vcf_ch']]
Emits : []


Name : filter_nonvariant_sites
Inputs : [[0, 'refined_vcf_ch']]
Outputs : [[0, 'filtered_nonvar_annotate_ch']]
Emits : []


Name : annotate_rsid
Inputs : [[0, 'filtered_nonvar_annotate_ch']]
Outputs : [[0, 'rsid_annotated_vcf_ch']]
Emits : []


Name : annotate_effect
Inputs : [[0, 'rsid_annotated_vcf_ch']]
Outputs : [[0, 'effect_vcf_annotate_ch'], [1, 'snpeff_stats_ch']]
Emits : []


Name : zip_and_index_vcf
Inputs : [[0, 'effect_vcf_annotate_ch']]
Outputs : [[0, 'variants_evaluate_ch'], [0, 'variants_validate_ch']]
Emits : []


Name : validate_vcf
Inputs : [[0, 'variants_validate_ch']]
Outputs : [[0, 'validation_log_ch']]
Emits : []


Name : variant_evaluation
Inputs : [[0, 'variants_evaluate_ch']]
Outputs : [[0, 'variant_eval_table_ch']]
Emits : []


Name : multiqc
Inputs : [[0, 'variant_eval_table_ch']]
Outputs : [[0, 'multiqc_report_ch'], [1, 'multiqc_data_ch']]
Emits : []


