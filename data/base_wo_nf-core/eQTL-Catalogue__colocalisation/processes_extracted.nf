Name : lift_to_GRCh38
Inputs : [[0, 'gwas_vcf_ch'], [1, 'gwas_lift_chain_ch'], [2, 'hg38_ref_genome_ch']]
Outputs : [[0, 'tabix_index_ch']]
Emits : []


Name : tabix_index_gwas
Inputs : [[0, 'tabix_index_ch']]
Outputs : [[0, 'gwas_summstats_GRCh38']]
Emits : []


Name : extract_lead_var_pairs
Inputs : [[0, 'extract_lead_var_pairs_ch']]
Outputs : [[0, 'eqtl_summ_stats_ch']]
Emits : []


Name : run_coloc
Inputs : [[0, '1'], [1, 'eqtl_summ_stats_ch'], [1, 'gwas_summstats_GRCh38']]
Outputs : [[0, 'batch_files_merge_coloc_results']]
Emits : []


Name : merge_coloc_results
Inputs : [[0, 'batch_files_merge_coloc_results']]
Outputs : [[0, 'gwas_qtl_subset']]
Emits : []


