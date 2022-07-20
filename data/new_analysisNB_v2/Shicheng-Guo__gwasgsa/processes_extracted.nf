Name : preprocess_plink
Inputs : [[0, 'ch_bed'], [1, 'ch_bim'], [2, 'ch_fam']]
Outputs : [[0, 'ch_plink_direct'], [0, 'ch_plink_direct_2']]
Emits : []


Name : preprocess_ref_panel
Inputs : [[0, 'ch_ref_panel_bed'], [1, 'ch_ref_panel_bim'], [2, 'ch_ref_panel_fam']]
Outputs : [[0, 'ch_plink_ref_panel'], [0, 'ch_plink_ref_panel_2']]
Emits : []


Name : preprocess_summary_stats
Inputs : [[0, 'ch_summary_stats']]
Outputs : [[0, 'ch_snp_p_txt']]
Emits : []


Name : preprocessing_vcf
Inputs : [[0, 'vcfs'], [1, 'vcf_file']]
Outputs : [[0, 'vcf_plink'], [1, 'data']]
Emits : []


Name : plink
Inputs : [[0, 'vcf_plink'], [1, 'data']]
Outputs : [[0, 'ch_plink_undirect'], [0, 'ch_plink_undirect_2']]
Emits : []


Name : magma_annotation
Inputs : [[0, 'ch_plink'], [1, 'ch_gene_loc_file'], [2, 'ch_snp_subset']]
Outputs : [[0, '']]
Emits : []


Name : magma_gene_analysis
Inputs : [[0, 'ch_plink_2'], [1, 'ch_magma_anot'], [2, 'ch_snp_p'], [3, 'ch_ref_panel_synonyms']]
Outputs : [[0, '']]
Emits : []


Name : magma_geneset_analysis
Inputs : [[0, 'ch_genes_raw'], [1, 'ch_set_anot']]
Outputs : [[0, 'ch_geneset']]
Emits : []


Name : magma_gene_property_analysis
Inputs : [[0, 'ch_genes_raw_2'], [1, 'ch_cov']]
Outputs : []
Emits : []


Name : results_plots
Inputs : [[0, 'ch_geneset']]
Outputs : [[0, 'ch_report_plot'], [1, 'ch_res_sorted'], [2, 'ch_res_top']]
Emits : []


Name : get_genenames
Inputs : [[0, 'ch_res_sorted'], [1, 'ch_res_top'], [2, 'ch_magma_anot_2'], [3, 'ch_set_anot_2'], [4, 'ch_gene_loc_file_2']]
Outputs : [[0, 'ch_report_table']]
Emits : []


Name : multiqc
Inputs : [[0, 'ch_report_table'], [1, 'ch_report_plot']]
Outputs : [[0, 'ch_multiqc_report']]
Emits : []


