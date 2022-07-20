Name : get_test_data
Inputs : []
Outputs : [[0, 'ready_integrity'], [0, 'ready_import'], [0, 'ready_lr'], [1, 'testmanifest'], [2, 'testmetadata']]
Emits : []


Name : data_integrity
Inputs : [[0, 'manifest4integrity'], [1, 'metadata4integrity'], [2, 'ready_integrity']]
Outputs : [[1, 'metadata_sort'], [2, 'manifest_sort']]
Emits : []


Name : q2_import
Inputs : [[0, 'manifest'], [1, 'ready_import']]
Outputs : [[0, 'imported_data'], [1, 'imported_visu'], [2, 'imported_output'], [3, 'complete_cmd_import'], [4, 'qiime2_version']]
Emits : []


Name : q2_cutadapt
Inputs : [[0, 'imported_data']]
Outputs : [[0, 'trimmed_data'], [1, 'trimmed_visu'], [2, 'trimmed_output'], [3, 'complete_cmd_cutadapt']]
Emits : []


Name : q2_dada2
Inputs : [[0, 'dada2_input'], [1, 'metadata4dada2']]
Outputs : [[0, 'dada2_seqs_dbotu3'], [0, 'dada2_seqs_taxo'], [0, 'dada2_seqs_filtering_tax'], [0, 'dada2_seqs_decontam'], [0, 'dada2_seqs_phylo'], [0, 'dada2_seqs_picrust2'], [0, 'dada2_seqs_ancom'], [1, 'visu_repseps'], [2, 'dada2_table_dbotu3'], [2, 'dada2_table_filtering_tax'], [2, 'dada2_table_picrust2'], [2, 'dada2_table_ancom'], [3, 'visu_table'], [4, 'stats_table'], [5, 'visu_stats'], [6, 'dada2_output'], [7, 'complete_cmd_dada2']]
Emits : []


Name : q2_dbotu3
Inputs : [[0, 'dada2_table_dbotu3'], [1, 'dada2_seqs_dbotu3'], [2, 'metadata4dbotu3']]
Outputs : [[0, 'dbotu3_details'], [1, 'dbotu3_seqs_decontam'], [1, 'dbotu3_seqs_taxo'], [1, 'dbotu3_seqs_filtering_tax'], [1, 'dbotu3_seqs_phylo'], [1, 'dbotu3_seqs_picrust2'], [1, 'dbotu3_seqs_ancom'], [2, 'dbotu3_seqs_visu'], [3, 'dbotu3_table'], [3, 'dbotu3_table_filtering_tax'], [3, 'dbotu3_table_picrust2'], [3, 'dbotu3_table_ancom'], [4, 'dbotu3_table_visu'], [5, 'dbotu3_output'], [6, 'complete_cmd_dbotu3']]
Emits : []


Name : q2_dada2_merge
Inputs : [[0, 'dada2merge_tabledir_ch'], [1, 'dada2merge_repseqsdir_ch'], [2, 'metadata_merge_ch']]
Outputs : [[0, 'merge_table_picrust2'], [0, 'merge_table_ancom'], [1, 'merge_seqs_taxo'], [1, 'merge_seqs_phylo'], [1, 'merge_seqs_picrust2'], [1, 'merge_seqs_ancom'], [2, 'dada2merge_output'], [3, 'complete_cmd_dada2merge']]
Emits : []


Name : q2_taxonomy
Inputs : [[0, 'seqs_taxo'], [1, 'taxonomy_output']]
Outputs : [[0, 'data_taxonomy_filtering_tax'], [0, 'data_taxonomy_ancom'], [1, 'visu_taxonomy'], [2, 'taxonomy_tsv'], [2, 'taxonomy_tsv_filtering_tax'], [3, 'taxo_output'], [4, 'biom'], [5, 'biom_tsv'], [5, 'biom_tsv_decontam'], [6, 'trained_database'], [7, 'seqs_db_filtered'], [8, 'complete_cmd_taxo']]
Emits : []


Name : q2_filtering_tax
Inputs : [[0, 'asv_table'], [1, 'data_taxonomy_filtering_tax'], [2, 'asv_seq'], [3, 'taxonomy_tsv_filtering_tax'], [4, 'metadata_filtering_tax']]
Outputs : [[0, 'tax_filtered_table'], [0, 'tax_filtered_table_picrust2'], [0, 'tax_filtered_table_ancom'], [1, 'tax_filtered_seq'], [1, 'tax_filtered_seq_picrust2'], [2, 'tax_filtered_table_visu'], [3, 'tax_filtered_output'], [4, 'tax_filtered_seq_visu'], [5, 'tax_filtered_table_biom'], [6, 'tax_filtered_table_tsv'], [6, 'tax_filtered_table_tsv_stats'], [7, 'complete_cmd_filtering_tax']]
Emits : []


Name : microDecon_step1
Inputs : [[0, 'microDecon_table']]
Outputs : [[0, 'decontam_table'], [0, 'decontam_table_step2'], [0, 'decontam_table_step3'], [1, 'abund_removed'], [2, 'ASV_removed'], [3, 'complete_cmd_microDecon'], [4, 'microdecon_version']]
Emits : []


Name : microDecon_step2
Inputs : [[0, 'decontam_table_step2']]
Outputs : [[0, 'decontam_table_qza'], [0, 'decontam_table_picrust2'], [0, 'decontam_table_ancom']]
Emits : []


Name : microDecon_step3
Inputs : [[0, 'decontam_table_step3'], [1, 'decontam_output']]
Outputs : [[0, 'decontam_ASV_ID'], [1, 'decontam_ASV_fasta']]
Emits : []


Name : microDecon_step4
Inputs : [[0, 'decontam_ASV_fasta']]
Outputs : [[0, 'decontam_seqs_qza'], [0, 'decontam_seqs_phylo'], [0, 'decontam_seqs_picrust2'], [0, 'decontam_seqs_ancom']]
Emits : []


Name : lr_mapping
Inputs : [[0, 'longreadsmanifest'], [1, 'ready_lr']]
Outputs : [[0, 'lr_mapped'], [1, 'process_lr_mapping_report'], [2, 'process_lr_sort_report'], [3, 'v_minimap2_version']]
Emits : []


Name : lr_getfasta
Inputs : [[0, 'longreadstofasta']]
Outputs : [[0, 'lr_sequences']]
Emits : []


Name : lr_get_taxonomy
Inputs : [[0, 'lr_mapped']]
Outputs : [[0, 'lr_biom_tsv'], [1, 'process_lr_taxonomy_report']]
Emits : []


Name : q2_phylogeny
Inputs : [[0, 'seqs_phylo']]
Outputs : [[0, 'aligned_repseq'], [1, 'masked_aligned'], [2, 'tree'], [3, 'tree_bestmodel_log'], [4, 'rooted_tree'], [5, 'tree_export_dir'], [6, 'tree_export_log'], [7, 'newick_phylo'], [8, 'complete_cmd_phylogeny']]
Emits : []


Name : q2_picrust2_analysis
Inputs : [[0, 'seqs_picrust2'], [1, 'table_picrust2']]
Outputs : [[0, 'EC_predictions'], [1, 'EC_predictions_visu'], [2, 'EC_predictions_tsv'], [3, 'KO_predictions'], [4, 'KO_predictions_visu'], [5, 'KO_predictions_tsv'], [6, 'pathway_predictions'], [7, 'pathway_predictions_visu'], [8, 'pathway_predictions_tsv'], [9, 'complete_picrust2_cmd']]
Emits : []


Name : q2_picrust2_stats
Inputs : [[0, 'EC_predictions_tsv'], [1, 'KO_predictions_tsv'], [2, 'pathway_predictions_tsv'], [3, 'metadata4picrust2'], [4, 'var_picrust2']]
Outputs : [[0, 'functional_pred_NMDS'], [1, 'complete_picrust2_stats_cmd']]
Emits : []


Name : q2_ancom
Inputs : [[0, 'table_ancom'], [1, 'metadata4ancom'], [2, 'data_taxonomy_ancom'], [3, 'ancom_var_list']]
Outputs : [[0, 'compo_table'], [1, 'ancom_table'], [2, 'export_ancom'], [3, 'collapsed_taxolevel_table'], [4, 'completecmd_ancom'], [4, 'completcmd_ancom4compress']]
Emits : []


Name : prepare_data_for_stats
Inputs : [[0, 'metadata4stats'], [1, 'tsv'], [2, 'newick']]
Outputs : [[0, 'biom_tsv_stats'], [1, 'metadata_stats'], [1, 'metadata_beta'], [1, 'metadata_beta_rarefied'], [1, 'metadata_beta_deseq2'], [1, 'metadata_beta_css'], [2, 'phyloseq_rds'], [2, 'phyloseq_rds_alpha'], [2, 'phyloseq_rds_beta'], [2, 'phyloseq_rds_beta_rarefied'], [2, 'phyloseq_rds_beta_deseq2'], [2, 'phyloseq_rds_beta_css'], [2, 'phyloseq_rds_set'], [3, 'version_collected'], [4, 'r_lib_version']]
Emits : []


Name : stats_alpha
Inputs : [[0, 'phyloseq_rds_alpha'], [1, 'alpha_list_var']]
Outputs : [[0, 'alpha_div_values'], [1, 'alpha_div_plots'], [2, 'index_significance_tests'], [3, 'barplots'], [4, 'rarefaction_curve'], [5, 'process_alpha_report']]
Emits : []


Name : stats_beta
Inputs : [[0, 'phyloseq_rds_beta'], [1, 'metadata_beta'], [2, 'beta_var_nn']]
Outputs : [[0, 'NMDS'], [1, 'PCoA'], [2, 'hclustering'], [3, 'variance_significance_tests'], [4, 'pie_ExpVar'], [5, 'process_beta_report']]
Emits : []


Name : stats_beta_rarefied
Inputs : [[0, 'phyloseq_rds_beta_rarefied'], [1, 'metadata_beta_rarefied'], [2, 'beta_var_rare']]
Outputs : [[0, 'final_rarefied_ASV_table_with_taxonomy'], [1, 'NMDS_rarefied'], [2, 'PCoA_rarefied'], [3, 'hclustering_rarefied'], [4, 'variance_significance_tests_rarefied'], [5, 'pie_ExpVar_rarefied'], [6, 'process_beta_report_rarefied']]
Emits : []


Name : stats_beta_deseq2
Inputs : [[0, 'phyloseq_rds_beta_deseq2'], [1, 'metadata_beta_deseq2'], [2, 'beta_var_deseq']]
Outputs : [[0, 'final_deseq2_ASV_table_with_taxonomy'], [1, 'NMDS_deseq2'], [2, 'PCoA_deseq2'], [3, 'hclustering_deseq2'], [4, 'variance_significance_tests_DESeq2'], [5, 'pie_ExpVar_DESeq2'], [6, 'process_beta_report_DESeq2']]
Emits : []


Name : stats_beta_css
Inputs : [[0, 'phyloseq_rds_beta_css'], [1, 'metadata_beta_css'], [2, 'beta_var_css']]
Outputs : [[0, 'final_css_ASV_table_with_taxonomy'], [1, 'NMDS_css'], [2, 'PCoA_css'], [3, 'hclustering_css'], [4, 'variance_significance_tests_CSS'], [5, 'pie_ExpVar_CSS'], [6, 'process_beta_report_CSS']]
Emits : []


Name : stats_desc_comp
Inputs : [[0, 'phyloseq_rds_set'], [1, 'desc_comp_list']]
Outputs : [[0, 'upset_plot'], [1, 'process_desc_comp_report']]
Emits : []


Name : report
Inputs : [[0, 'SAMBAtemplate_ch'], [1, 'SAMBAcss_ch'], [2, 'SAMBAreport_okstats_alpha'], [3, 'SAMBAreport_okstats_beta'], [4, 'SAMBAreport_okdesc_comp'], [5, 'SAMBAreport_okpicrust2'], [6, 'SAMBAreport_okancom'], [7, 'SAMBAwf_ch'], [8, 'version_collected']]
Outputs : [[0, 'SAMBA_css_output'], [1, 'Report'], [2, 'wf_image_output'], [3, 'data_json']]
Emits : []


Name : compress_result
Inputs : [[0, 'Report']]
Outputs : [[0, 'report_zip']]
Emits : []


