Name : p1_run
Inputs : [[0, 'vfiles']]
Outputs : [[0, 'p1_out_psam'], [1, 'p1_out_pgen'], [2, 'p1_out_pvar'], [3, 'mergelist_shred'], [4, 'p1_log']]
Emits : []


Name : p2_merge_list
Inputs : [[0, 'mergelist_file'], [1, 'p2_in_pgen'], [2, 'p2_in_pvar'], [3, 'p2_in_psam']]
Outputs : [[0, 'p2_in_plink1'], [1, 'p2_in_plink2'], [2, 'p2_mergelist_log']]
Emits : []


Name : p2_qc_pipeline
Inputs : [[0, 'p2_in_plink1'], [1, 'p2_qcin_plink2']]
Outputs : [[0, 'p2_out_file'], [1, 'p2_out_html'], [2, 'p2_out_png']]
Emits : []


Name : p3_cohort_samplelist
Inputs : [[0, 'p2_out_file'], [1, '"${params']]
Outputs : [[0, 'gwas_samplelist']]
Emits : []


Name : p3_cohort_pca
Inputs : [[0, 'gwas_samplelist'], [1, 'p3_pcain_plink2']]
Outputs : [[0, 'p3_cohort_pca_out']]
Emits : []


Name : p3_merge_pca
Inputs : [[0, 'p3_cohort_pca_out']]
Outputs : [[0, 'gwas_samplelist_pca']]
Emits : []


Name : p3_export_rawfile
Inputs : [[0, 'p3_in_files_gallop'], [1, 'gwas_samplelist_gallop']]
Outputs : [[0, 'gwas_rawfile']]
Emits : []


Name : p3_gwas_gallop
Inputs : [[0, 'gwas_rawfile'], [1, '"${params']]
Outputs : [[0, 'gallop_results']]
Emits : []


Name : p3_format_gwas_plink
Inputs : [[0, 'gwas_samplelist_plink'], [1, '"${params']]
Outputs : [[0, 'plink_samplelist']]
Emits : []


Name : p3_gwas_plink
Inputs : [[0, 'p3_in_files_plink'], [1, 'plink_samplelist']]
Outputs : [[0, 'gwas_results'], [1, 'p3_log']]
Emits : []


Name : p3_gwas_viz
Inputs : [[0, 'gwas_results'], [0, 'gallop_results']]
Outputs : [[0, 'gwas_plots']]
Emits : []


