Name : demux
Inputs : [[0, 'params']]
Outputs : [[0, 'demux_art'], [1, 'demux_viz']]
Emits : []


Name : cutadapt
Inputs : [[0, 'demux_art']]
Outputs : [[0, 'cutadapt_art'], [1, 'cutadapt_viz']]
Emits : []


Name : dada2
Inputs : [[0, 'cutadapt_art']]
Outputs : [[0, 'dada2_repseqs_art'], [0, 'dada2_repseqs_art_biom'], [0, 'dada2_repseq_art_phylo'], [1, 'dada2_repseq_viz'], [2, 'dada2_feature_table_art'], [3, 'dada2_table_art'], [3, 'dada2_table_art_forBiom'], [3, 'dada2_table_art_forConsolidate'], [3, 'dada2_table_art_forDiversity'], [3, 'dada2_table_for_citation'], [4, 'denoising_stats_art'], [5, 'dada2_table_viz'], [6, 'dada2_dna_seq_ch'], [7, 'dada2_acc_seqlength_ch']]
Emits : []


Name : classify_and_plot
Inputs : [[0, 'dada2_repseqs_art'], [1, 'dada2_table_art']]
Outputs : [[0, 'classifier_output_art'], [0, 'classifier_cite'], [1, 'taxa_barplot_viz']]
Emits : []


Name : biom_collate
Inputs : [[0, 'dada2_table_art_forBiom'], [1, 'classifier_output_art'], [2, 'dada2_repseqs_art_biom'], [3, 'demux_viz'], [4, 'denoising_stats_art']]
Outputs : [[0, 'biom_dir'], [0, 'biom_dir_rare'], [0, 'biom_dir_alpha'], [0, 'biom_make_csv']]
Emits : []


Name : feature_grouping
Inputs : [[0, 'biom_dir'], [1, 'dada2_table_art_forConsolidate']]
Outputs : [[0, 'grouped_by_taxa_art']]
Emits : []


Name : rarefaction
Inputs : [[0, 'biom_dir_rare'], [1, 'grouped_by_taxa_art']]
Outputs : [[0, 'rare_low_depth_csv'], [1, 'rare_hi_depth_csv'], [2, 'rarefaction_errors']]
Emits : []


Name : phylogeny
Inputs : [[0, 'dada2_repseq_art_phylo']]
Outputs : [[0, 'rooted_tree_art']]
Emits : []


Name : alpha_diversity
Inputs : [[0, 'biom_dir_alpha'], [1, 'rooted_tree_art'], [2, 'dada2_table_art_forDiversity']]
Outputs : [[0, 'alpha_rarefaction_viz'], [1, 'core_metrics_outdir'], [2, 'diversity_error_ch'], [3, 'completed_alpha_div']]
Emits : []


Name : get_references
Inputs : [[0, 'dada2_table_for_citation'], [1, 'classifier_cite']]
Outputs : [[3, 'completed_refs']]
Emits : []


Name : write_csv
Inputs : [[0, 'rare_low_depth_csv'], [1, 'rare_hi_depth_csv'], [2, 'biom_make_csv']]
Outputs : [[0, 'results_xlsx']]
Emits : []


