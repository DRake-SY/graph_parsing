Name : merge_agg_vcfs
Inputs : [[0, 'ch_vcf_file']]
Outputs : [[0, 'ch_updated_vcf_list']]
Emits : []


Name : merge_ind_vcfs
Inputs : [[0, 'ch_vcf_file'], [1, 'ch_vcf_ind']]
Outputs : [[0, 'ch_updated_vcf_list']]
Emits : []


Name : combine_vcfs
Inputs : [[0, 'ch_vcfs'], [1, 'ch_updated_vcf_list'], [2, 'ch_samples_to_combine_vcfs']]
Outputs : [[0, 'ch_vcf_plink']]
Emits : []


Name : vcf_2_plink
Inputs : [[0, 'ch_vcf_plink']]
Outputs : [[0, 'ch_plink'], [0, 'ch_plink2']]
Emits : []


Name : preprocess_plink
Inputs : [[0, 'ch_bed'], [1, 'ch_bim'], [2, 'ch_fam']]
Outputs : [[0, 'ch_plink'], [0, 'ch_plink2']]
Emits : []


Name : preprocess_plink_folder
Inputs : [[0, 'plinkCh']]
Outputs : [[0, 'ch_plink'], [0, 'ch_plink2']]
Emits : []


Name : get_snps
Inputs : [[0, 'ch_plink'], [1, 'ch_pheno_for_assoc_test']]
Outputs : [[0, 'ch_snps']]
Emits : []


Name : recode
Inputs : [[0, 'ch_plink2'], [1, 'ch_snps']]
Outputs : [[0, 'phewas']]
Emits : []


Name : phewas
Inputs : [[0, 'phewas'], [1, 'ch_codes_pheno'], [2, 'ch_covariate_file'], [3, 'ch_add_exclusions'], [4, 'ch_firth_regression']]
Outputs : [[0, 'results_chr']]
Emits : []


Name : phewas_with_covariates
Inputs : [[0, 'phewas'], [1, 'ch_codes_pheno'], [2, 'ch_add_exclusions'], [3, 'ch_firth_regression']]
Outputs : [[0, 'results_chr']]
Emits : []


Name : merge_results
Inputs : [[0, 'results_chr']]
Outputs : [[0, 'plots'], [0, 'plots2']]
Emits : []


Name : build_report
Inputs : [[0, 'plots']]
Outputs : [[0, 'ch_report_outputs']]
Emits : []


Name : run_coloc
Inputs : [[0, 'ch_gwas_input'], [1, 'plots2']]
Outputs : [[0, 'coloc_results_ch']]
Emits : []


Name : build_report_coloc
Inputs : [[0, 'coloc_results_ch'], [1, 'plots']]
Outputs : [[0, 'ch_report_outputs']]
Emits : []


