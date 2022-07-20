Name : download_leg_files
Inputs : [[0, 'legend_for_hapgen2_file_ch']]
Outputs : [[0, 'downloaded_leg_files_ch']]
Emits : []


Name : download_1000G
Inputs : [[0, 'reference_1000G_ch']]
Outputs : [[0, 'downloaded_1000G_genetic_map_ch'], [1, 'downloaded_1000G_hap_ch']]
Emits : []


Name : simulate_gen_and_sample
Inputs : [[0, 'all_hapgen_inputs_ch'], [1, 'ch_num_participants']]
Outputs : [[0, 'simulated_gen_results_ch'], [1, '']]
Emits : []


Name : simulate_vcf
Inputs : [[0, 'simulated_gen_for_vcf_ch']]
Outputs : [[0, 'not_compressed_and_indexed_simulated_vcf_results_ch'], [1, 'not_compressed_and_indexed_simulated_vcf_ch']]
Emits : []


Name : compress_index_reheader_vcf
Inputs : [[0, 'not_compressed_and_indexed_simulated_vcf_ch'], [1, 'ch_sample_ids']]
Outputs : [[0, 'compressed_and_indexed_simulated_vcf_ch']]
Emits : []


Name : compress_and_index_vcf
Inputs : [[0, 'not_compressed_and_indexed_simulated_vcf_ch']]
Outputs : [[0, 'compressed_and_indexed_simulated_vcf_ch']]
Emits : []


Name : simulate_plink
Inputs : [[0, 'simulated_gen_for_plink_ch']]
Outputs : [[0, 'simulated_plink_results_ch'], [1, 'simulated_plink_ch']]
Emits : []


Name : simulate_gwas_sum_stats
Inputs : [[0, 'simulated_plink_ch'], [1, 'params'], [2, 'ch_num_participants']]
Outputs : [[0, 'simulated_gwas_sum_stats_ch']]
Emits : []


Name : simulate_cb_output
Inputs : [[0, 'cohort_browser_yaml_config_ch']]
Outputs : [[0, 'simulated_cb_pheno_data_ch'], [1, 'simulated_cb_pheno_metadata_ch']]
Emits : []


