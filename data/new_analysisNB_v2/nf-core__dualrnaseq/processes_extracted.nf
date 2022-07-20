Name : get_software_versions
Inputs : []
Outputs : [[0, 'ch_software_versions_yaml']]
Emits : []


Name : check_replicates
Inputs : [[0, 'scatter_plots']]
Outputs : [[0, 'repl_scatter_plots_salmon_pathogen'], [1, 'repl_scatter_plots_salmon_host'], [2, 'repl_scatter_plots_salmon_alignment_host'], [3, 'repl_scatter_plots_salmon_alignment_pathogen'], [4, 'repl_scatter_plots_htseq_pathogen'], [5, 'repl_scatter_plots_htseq_host']]
Emits : []


Name : uncompress_pathogen_fasta_genome
Inputs : [[0, 'genome_fasta_pathogen_to_unzip']]
Outputs : [[0, 'genome_fasta_pathogen_to_combine'], [1, 'genome_fasta_pathogen_ref_names'], [2, 'genome_fasta_pathogen_to_transcriptome']]
Emits : []


Name : uncompress_host_fasta_genome
Inputs : [[0, 'genome_fasta_host_to_unzip']]
Outputs : [[0, 'genome_fasta_host_to_combine'], [1, 'genome_fasta_host_to_decoys'], [2, 'genome_fasta_host_ref_names'], [3, 'genome_fasta_host_to_transcriptome'], [4, 'genome_fasta_host_to_transcriptome_tRNA']]
Emits : []


Name : uncompress_pathogen_gff
Inputs : [[0, 'pathogen_gff_to_unzip']]
Outputs : [[0, 'gff_feature_quant_pathogen_salmon_alignment'], [1, 'gff_pathogen_create_transcriptome'], [2, 'gff_feature_quant_pathogen_htseq'], [3, 'extract_annotations_pathogen_gff_htseq']]
Emits : []


Name : uncompress_host_gff
Inputs : [[0, 'host_gff_to_unzip']]
Outputs : [[0, 'gff_host_genome_star_salmon_change_atr'], [1, 'gff_host_create_transcriptome'], [2, 'gff_host_genome_htseq'], [3, 'extract_annotations_host_gff_htseq'], [4, 'gff_host_star_alignment_gff'], [5, 'gff_host_star_htseq_alignment_gff'], [6, 'genome_gff_star_index']]
Emits : []


Name : uncompress_host_gff_trna
Inputs : [[0, 'host_gff_trna_to_unzip']]
Outputs : [[0, 'gff_host_genome_star_salmon_change_atr'], [1, 'gff_host_create_transcriptome'], [2, 'combine_gff_host_genome_htseq'], [3, 'gff_host_star_alignment_gff'], [4, 'gff_host_star_htseq_alignment_gff'], [5, 'genome_gff_star_index']]
Emits : []


Name : uncompress_host_gff_trna_file
Inputs : [[0, 'host_gff_trna_file_to_unzip']]
Outputs : [[0, 'change_attrubute_gff_host_tRNA_salmon_alignment'], [1, 'gff_host_create_transcriptome_tRNA'], [2, 'combine_gff_host_tRNA_htseq']]
Emits : []


Name : combine_pathogen_host_fasta_genome
Inputs : [[0, 'genome_fasta_host_to_combine'], [1, 'genome_fasta_pathogen_to_combine']]
Outputs : [[0, 'host_pathogen_fasta_index'], [1, 'host_pathogen_fasta_star_index'], [2, 'genome_fasta_file_host_pathogen_to_decoy_transcriptome']]
Emits : []


Name : combine_host_genome_tRNA_gff_files_htseq
Inputs : [[0, 'combine_gff_host_genome_htseq'], [1, 'combine_gff_host_tRNA_htseq']]
Outputs : [[0, 'gff_host_genome_htseq'], [1, 'extract_annotations_host_gff_htseq']]
Emits : []


Name : replace_gene_feature_gff_host_htseq
Inputs : [[0, 'gff_host_genome_htseq'], [1, 'gene_feature_to_quantify_host']]
Outputs : [[0, 'combine_gff_host'], [1, 'gff_host_to_TPM']]
Emits : []


Name : replace_gene_feature_gff_pathogen_htseq
Inputs : [[0, 'gff_feature_quant_pathogen_htseq'], [1, 'gene_feature_to_quantify_pathogen']]
Outputs : [[0, 'to_replace_gff_attribute']]
Emits : []


Name : replace_attribute_pathogen_gff_htseq
Inputs : [[0, 'to_replace_gff_attribute'], [1, 'host_gff_attribute_to_pathogen'], [2, 'pathogen_gff_attribute']]
Outputs : [[0, 'combine_gff_pathogen'], [1, 'gff_pathogen_to_TPM']]
Emits : []


Name : combine_pathogen_host_gff_files_htseq
Inputs : [[0, 'combine_gff_host'], [1, 'combine_gff_pathogen']]
Outputs : [[0, 'quantification_gff_u_m']]
Emits : []


Name : extract_annotations_pathogen_htseq
Inputs : [[0, 'extract_annotations_pathogen_gff_htseq'], [1, 'gene_feature_to_extract_annotations_pathongen_htseq'], [2, 'pathogen_gff_attribute_to_extract_annotations_htseq']]
Outputs : [[0, 'pathogen_annotations_RNA_class_stats_htseq'], [1, 'annotation_pathogen_combine_quant_htseq_u_m'], [2, 'annotation_pathogen_split_quant_htseq']]
Emits : []


Name : extract_annotations_host_htseq
Inputs : [[0, 'extract_annotations_host_gff_htseq'], [1, 'gene_feature_to_extract_annotations_host_htseq'], [2, 'host_gff_attribute_to_extract_annotations_htseq']]
Outputs : [[0, 'host_annotations_RNA_class_stats_htseq'], [1, 'annotation_host_combine_quant_htseq'], [2, 'annotation_host_split_quant_htseq']]
Emits : []


Name : extract_reference_names_host_star
Inputs : [[0, 'genome_fasta_host_ref_names']]
Outputs : [[0, 'reference_host_names_uniquelymapped'], [1, 'reference_host_names_crossmapped_find'], [2, 'reference_host_names_multimapped']]
Emits : []


Name : extract_reference_names_pathogen_star
Inputs : [[0, 'genome_fasta_pathogen_ref_names']]
Outputs : [[0, 'reference_pathogen_names_uniquelymapped'], [1, 'reference_pathogen_crossmapped_find'], [2, 'reference_pathogen_names_multimapped']]
Emits : []


Name : replace_attribute_host_genome_gff_star_salmon
Inputs : [[0, 'gff_host_genome_star_salmon_change_atr']]
Outputs : [[0, 'combine_gff_host_genome_star_salmon']]
Emits : []


Name : replace_attribute_host_tRNA_gff_star_salmon
Inputs : [[0, 'change_attrubute_gff_host_tRNA_salmon_alignment'], [1, 'host_gff_attribute_salmon_alignment_tRNA']]
Outputs : [[0, 'combine_host_gffs']]
Emits : []


Name : combine_host_genome_tRNA_gff_star_salmon
Inputs : [[0, 'combine_gff_host_genome_star_salmon'], [1, 'combine_host_gffs']]
Outputs : [[0, 'gff_host_tRNA_genome_salmon_alignment']]
Emits : []


Name : replace_gene_feature_gff_host_salmon
Inputs : [[0, 'gff_host_genome_salmon_alignment'], [1, 'gene_feature_gff_host_salmon_alignment']]
Outputs : [[0, 'combine_gff_host_salmon_alignment'], [1, 'extract_annotations_host_gff_salmon']]
Emits : []


Name : replace_attribute_pathogen_gff_star_salmon
Inputs : [[0, 'gff_feature_quant_pathogen_salmon_alignment'], [1, 'pathogen_gff_attribute_salmon_alignment']]
Outputs : [[0, 'to_replace_gff_feature_salmon_alignment'], [1, 'extract_annotations_pathogen_gff_salmon']]
Emits : []


Name : extract_annotations_pathogen_salmon
Inputs : [[0, 'extract_annotations_pathogen_gff_salmon'], [1, 'gene_feature_to_extract_annotations_pathogen']]
Outputs : [[0, 'pathogen_annotations_RNA_class_stats'], [1, 'pathogen_annotations_RNA_class_stats_salmon_alignment'], [2, 'annotation_pathogen_combine_quant'], [3, 'annotation_pathogen_combine_quant_salmon_alignment_based']]
Emits : []


Name : extract_annotations_host_salmon
Inputs : [[0, 'extract_annotations_host_gff_salmon']]
Outputs : [[0, 'host_annotations_RNA_class_stats'], [1, 'host_annotations_RNA_class_stats_salmon_alignment'], [2, 'tximport_annotations'], [3, 'host_annotations_uniq_ambig'], [4, 'tximport_annotations_salmon_alignment'], [5, 'host_annotations_uniq_ambig_AB'], [6, 'annotation_host_combine_quant'], [7, 'annotation_host_combine_quant_salmon_alignment_based'], [8, 'annotation_host_combine_quant_gene_level_salmon'], [9, 'annotation_host_combine_quant_gene_level_salmon_alignment']]
Emits : []


Name : create_transcriptome_fasta_host
Inputs : [[0, 'gff_host_create_transcriptome'], [1, 'genome_fasta_host_to_transcriptome']]
Outputs : [[0, 'host_transcriptome'], [1, 'transcriptome_host_to_split_table_salmon_without_tRNA'], [2, 'transcriptome_host_to_split_table_salmon_alignment_without_tRNA'], [3, 'transcriptome_host_to_split_q_table_salmon_without_tRNA'], [4, 'transcriptome_host_to_split_q_table_salmon_alignment_based_without_tRNA'], [5, 'host_transcriptome_to_combine_host'], [6, 'transcriptome_fasta_host_ref_names_without_tRNA']]
Emits : []


Name : create_transcriptome_fasta_host_tRNA
Inputs : [[0, 'gff_host_create_transcriptome_tRNA'], [1, 'genome_fasta_host_to_transcriptome_tRNA'], [2, 'gene_feature_gff_to_create_transcriptome_host_salmon'], [3, 'gene_attribute_gff_to_create_transcriptome_host_salmon']]
Outputs : [[0, 'host_transcriptome_to_combine_tRNA']]
Emits : []


Name : combine_host_fasta_transcriptomes
Inputs : [[0, 'host_transcriptome_to_combine_host'], [1, 'host_transcriptome_to_combine_tRNA']]
Outputs : [[0, 'host_transcriptome_genome_tRNA'], [1, 'transcriptome_host_to_split_table_salmon_with_tRNA'], [2, 'transcriptome_host_to_split_table_salmon_alignment_with_tRNA'], [3, 'transcriptome_host_to_split_q_table_salmon_with_tRNA'], [4, 'transcriptome_host_to_split_q_table_salmon_alignment_based_with_tRNA'], [5, 'transcriptome_fasta_host_ref_names_with_tRNA']]
Emits : []


Name : create_transcriptome_fasta_pathogen
Inputs : [[0, 'gff_pathogen_create_transcriptome'], [1, 'genome_fasta_pathogen_to_transcriptome'], [2, 'gene_feature_gff_to_create_transcriptome_pathogen_salmon'], [3, 'gene_attribute_gff_to_create_transcriptome_pathogen_salmon']]
Outputs : [[0, 'pathogen_transcriptome_to_combine'], [1, 'transcriptome_pathogen_to_split_table_salmon'], [2, 'transcriptome_pathogen_to_split_table_salmon_alignment'], [3, 'transcriptome_pathogen_to_split_q_table_salmon'], [4, 'transcriptome_pathogen_to_split_q_table_salmon_alignment_based'], [5, 'transcriptome_fasta_pathogen_ref_names']]
Emits : []


Name : combine_pathogen_host_fasta_transcriptome
Inputs : [[0, 'host_transcriptome_to_combine'], [1, 'pathogen_transcriptome_to_combine']]
Outputs : [[0, 'transcriptome_fasta_file_host_pathogen_to_decoy_transcriptome'], [1, 'transcriptome_salmon_alignment_based_mode']]
Emits : []


Name : replace_gene_feature_gff_pathogen_salmon
Inputs : [[0, 'to_replace_gff_feature_salmon_alignment'], [1, 'gene_feature_to_quantify_pathogen_salmon_alignment']]
Outputs : [[0, 'combine_gff_pathogen_salmon_alignment']]
Emits : []


Name : combine_pathogen_host_gff_files_salmon
Inputs : [[0, 'combine_gff_host_salmon_alignment'], [1, 'combine_gff_pathogen_salmon_alignment']]
Outputs : [[0, 'gff_host_pathogen_star_salmon_alignment_gff']]
Emits : []


Name : fastqc
Inputs : [[0, 'ch_read_files_fastqc']]
Outputs : [[0, 'ch_fastqc_results']]
Emits : []


Name : trimming
Inputs : [[0, 'trimming_reads'], [1, 'adapter_sequence_3'], [2, 'quality_cutoff']]
Outputs : [[0, 'trimming_results_star_htseq'], [0, 'trimming_results_to_salmon'], [0, 'trimming_results_to_qc'], [0, 'trimming_results_star_salmon']]
Emits : []


Name : bbduk
Inputs : [[0, 'trimming_reads'], [1, 'adapter_database']]
Outputs : [[0, 'trimming_results_star_htseq'], [0, 'trimming_results_to_salmon'], [0, 'trimming_results_to_qc'], [0, 'trimming_results_star_salmon']]
Emits : []


Name : fastqc_after_trimming
Inputs : [[0, 'trimming_results_to_qc']]
Outputs : [[0, 'ch_fastqc_trimmed_results']]
Emits : []


Name : count_total_reads
Inputs : [[0, 'raw_read_count_file']]
Outputs : [[0, 'to_collect_total_reads']]
Emits : []


Name : count_total_read_pairs
Inputs : [[0, 'to_collect_total_reads']]
Outputs : [[0, 'collect_total_reads_raw_salmon'], [1, 'collect_total_reads_raw_salmon_alignment'], [2, 'collect_total_reads_raw_star'], [3, 'collect_total_reads_raw_star_for_salmon']]
Emits : []


Name : create_decoy_transcriptome_file
Inputs : [[0, 'genome_fasta_host_to_decoys'], [1, 'genome_fasta_file_host_pathogen_to_decoy_transcriptome'], [2, 'transcriptome_fasta_file_host_pathogen_to_decoy_transcriptome']]
Outputs : [[0, 'salmon_index_gentrome'], [1, 'salmon_index_decoys']]
Emits : []


Name : salmon_index
Inputs : [[0, 'salmon_index_gentrome'], [1, 'salmon_index_decoys'], [2, 'kmer_length_salmon_index']]
Outputs : [[0, 'salmon_index']]
Emits : []


Name : salmon_quantification
Inputs : [[0, 'salmon_index'], [1, 'trimming_results_to_salmon'], [2, 'libtype_salmon']]
Outputs : [[0, 'split_table'], [1, 'split_table_uniq_ambig'], [2, 'salmon_files_to_combine'], [3, 'multiqc_salmon_quant'], [4, 'collect_processed_read_counts']]
Emits : []


Name : split_table_salmon_each
Inputs : [[0, 'split_table'], [1, 'transcriptome_pathogen_to_split_q_table_salmon'], [2, 'transcriptome_host_to_split_q_table_salmon']]
Outputs : [[0, 'salmon_host_tximport']]
Emits : []


Name : extract_ambig_uniq_transcripts_genes
Inputs : [[0, 'split_table_uniq_ambig'], [1, 'host_annotations_uniq_ambig']]
Outputs : [[3, 'host_files_comb'], [4, 'path_files_comb']]
Emits : []


Name : host_comb_ambig_uniq
Inputs : [[0, 'host_files_comb']]
Outputs : []
Emits : []


Name : pathogen_comb_ambig_uniq
Inputs : [[0, 'path_files_comb']]
Outputs : []
Emits : []


Name : combine_quantification_tables_salmon
Inputs : [[0, 'salmon_files_to_combine'], [1, 'host_atr_collect_data_salmon']]
Outputs : [[0, 'split_table_salmon']]
Emits : []


Name : split_quantification_tables_salmon
Inputs : [[0, 'split_table_salmon'], [1, 'transcriptome_pathogen_to_split_table_salmon'], [2, 'transcriptome_host_to_split_table_salmon']]
Outputs : [[0, 'host_quantification_mapping_stats_salmon'], [1, 'pathogen_quantification_mapping_stats_salmon'], [2, 'host_quantification_RNA_stats_salmon'], [3, 'pathogen_quantification_RNA_stats_salmon'], [4, 'quant_host_add_annotations'], [5, 'quant_pathogen_add_annotations'], [6, 'quant_scatter_plot_host'], [7, 'quant_scatter_plot_pathogen'], [8, 'pathonen_tab'], [9, 'host_tab']]
Emits : []


Name : combine_annotations_quant_pathogen
Inputs : [[0, 'quant_pathogen_add_annotations'], [1, 'annotation_pathogen_combine_quant'], [2, 'combine_annot_quant_pathogen']]
Outputs : []
Emits : []


Name : combine_annotations_quant_host_salmon
Inputs : [[0, 'quant_host_add_annotations'], [1, 'annotation_host_combine_quant'], [2, 'combine_annot_quant_host']]
Outputs : []
Emits : []


Name : tximport_host
Inputs : [[0, 'salmon_host_tximport'], [1, 'tximport_annotations']]
Outputs : [[0, 'salmon_files_to_combine_gene_level']]
Emits : []


Name : combine_host_quant_gene_level_salmon
Inputs : [[0, 'salmon_files_to_combine_gene_level']]
Outputs : [[0, 'quant_gene_level_host_add_annotations_salmon']]
Emits : []


Name : combine_annotations_quant_gene_level_salmon
Inputs : [[0, 'quant_gene_level_host_add_annotations_salmon'], [1, 'annotation_host_combine_quant_gene_level_salmon']]
Outputs : []
Emits : []


Name : scatter_plot_pathogen_salmon
Inputs : [[0, 'quant_scatter_plot_pathogen'], [1, 'atr_scatter_plot_pathogen'], [2, 'repl_scatter_plots_salmon_pathogen'], [3, 'scatterplots_pathogen_salmon']]
Outputs : []
Emits : []


Name : scatter_plot_host_salmon
Inputs : [[0, 'quant_scatter_plot_host'], [1, 'atr_scatter_plot_host'], [2, 'repl_scatter_plots_salmon_host'], [3, 'scatterplots_host_salmon']]
Outputs : []
Emits : []


Name : extract_processed_reads
Inputs : [[0, 'collect_processed_read_counts']]
Outputs : [[0, 'collect_results']]
Emits : []


Name : collect_processed_reads
Inputs : [[0, 'collect_results']]
Outputs : [[0, 'mapping_stats_total_reads']]
Emits : []


Name : salmon_quantification_stats
Inputs : [[0, 'host_quantification_mapping_stats_salmon'], [1, 'pathogen_quantification_mapping_stats_salmon'], [2, 'attribute_quant_stats_salmon'], [3, 'mapping_stats_total_reads'], [4, 'collect_total_reads_raw_salmon']]
Outputs : [[0, 'salmon_mapped_stats_to_plot']]
Emits : []


Name : plot_salmon_mapping_stats_host_pathogen
Inputs : [[0, 'salmon_mapped_stats_to_plot']]
Outputs : []
Emits : []


Name : RNA_class_statistics_salmon_pathogen
Inputs : [[0, 'pathogen_quantification_RNA_stats_salmon'], [1, 'host_annotations_RNA_class_stats_pathogen'], [2, 'pathogen_annotations_RNA_class_stats']]
Outputs : [[0, 'plot_RNA_stats_pathogen'], [1, 'plot_RNA_stats_pathogen_combined'], [3, 'plot_RNA_stats_pathogen_boolean'], [4, 'plot_RNA_stats_pathogen_combined_boolean']]
Emits : []


Name : RNA_class_statistics_salmon_host
Inputs : [[0, 'host_quantification_RNA_stats_salmon'], [1, 'attribute_host_RNA_class_stats'], [2, 'host_annotations_RNA_class_stats'], [3, 'RNA_classes_to_replace']]
Outputs : [[0, 'plot_RNA_stats_host'], [1, 'plot_RNA_stats_host_combined'], [4, 'plot_RNA_stats_host_combined_boolean'], [5, 'plot_RNA_stats_host_boolean']]
Emits : []


Name : plot_RNA_class_salmon_pathogen_each
Inputs : [[0, 'plot_RNA_stats_pathogen'], [1, 'plot_RNA_stats_pathogen_boolean']]
Outputs : []
Emits : []


Name : plot_RNA_class_salmon_pathogen_combined
Inputs : [[0, 'plot_RNA_stats_pathogen_combined'], [1, 'plot_RNA_stats_pathogen_combined_boolean']]
Outputs : []
Emits : []


Name : plot_RNA_class_salmon_host_each
Inputs : [[0, 'plot_RNA_stats_host'], [1, 'plot_RNA_stats_host_boolean']]
Outputs : []
Emits : []


Name : plot_RNA_class_salmon_host_combined
Inputs : [[0, 'plot_RNA_stats_host_combined'], [1, 'plot_RNA_stats_host_combined_boolean']]
Outputs : []
Emits : []


Name : STARindex_salmon_alignment
Inputs : [[0, 'host_pathogen_fasta_index'], [1, 'genome_gff_star_index']]
Outputs : [[0, 'star_index_transcriptome_alignment']]
Emits : []


Name : ALIGNMENTstar_for_salmon
Inputs : [[0, 'trimming_results_star_salmon'], [1, 'gff_host_pathogen_star_salmon_alignment_gff'], [2, 'star_index_transcriptome_alignment']]
Outputs : [[0, 'multiqc_star_for_salmon_alignment'], [1, 'salmon_quantify_alignment_based_mode'], [3, 'collect_processed_read_counts_STAR_for_salmon']]
Emits : []


Name : salmon_quantification_alignment_based_mode
Inputs : [[0, 'transcriptome_salmon_alignment_based_mode'], [1, 'salmon_quantify_alignment_based_mode'], [2, 'libtype_salmon_alignment_mode']]
Outputs : [[0, 'split_table_alignment_based'], [1, 'split_table_uniq_ambig_ab'], [2, 'salmon_files_to_combine_alignment_mode'], [3, 'multiqc_salmon_alignment_quant'], [4, 'collect_processed_read_counts_alignment_based']]
Emits : []


Name : split_table_salmon_each_salmon_alignment_mode
Inputs : [[0, 'split_table_alignment_based'], [1, 'transcriptome_pathogen_to_split_q_table_salmon_alignment_based'], [2, 'transcriptome_host_to_split_q_table_salmon_alignment_based']]
Outputs : [[0, 'salmon_alignment_host_tximport'], [1, 'sample_name']]
Emits : []


Name : extract_ambig_uniq_transcripts_genes_alignment_based
Inputs : [[0, 'split_table_uniq_ambig_ab'], [1, 'host_annotations_uniq_ambig_AB']]
Outputs : [[3, 'host_files_comb_uniq_ambig_AB'], [4, 'path_files_comb_uniq_ambig_AB']]
Emits : []


Name : host_comb_ambig_uniq_alignment_based
Inputs : [[0, 'host_files_comb_uniq_ambig_AB']]
Outputs : []
Emits : []


Name : pathogen_comb_ambig_uniq_alignment_based
Inputs : [[0, 'path_files_comb_uniq_ambig_AB']]
Outputs : []
Emits : []


Name : tximport_host_salmon_alignment
Inputs : [[0, 'salmon_alignment_host_tximport'], [1, 'tximport_annotations_salmon_alignment']]
Outputs : [[0, 'salmon_files_to_combine_gene_level_alignment']]
Emits : []


Name : combine_host_quant_gene_level_salmon_alignment
Inputs : [[0, 'salmon_files_to_combine_gene_level_alignment']]
Outputs : [[0, 'quant_gene_level_host_add_annotations_salmon_alignment']]
Emits : []


Name : combine_quantification_tables_salmon_alignment_mode
Inputs : [[0, 'salmon_files_to_combine_alignment_mode'], [1, 'host_atr_collect_data_salmon_alignment_mode']]
Outputs : [[0, 'split_table_salmon_salmon_alignment']]
Emits : []


Name : split_quantification_tables_salmon_salmon_alignment_mode
Inputs : [[0, 'split_table_salmon_salmon_alignment'], [1, 'transcriptome_pathogen_to_split_table_salmon_alignment'], [2, 'transcriptome_host_to_split_table_salmon_alignment']]
Outputs : [[0, 'host_quantification_mapping_stats_salmon_alignment_based'], [1, 'pathogen_quantification_mapping_stats_salmon_alignment_based'], [2, 'host_quantification_RNA_stats_salmon_alignment_based'], [3, 'pathogen_quantification_RNA_stats_salmon_alignment_based'], [4, 'quant_host_add_annotations_salmon_alignment_based'], [5, 'quant_pathogen_add_annotations_alignment_based'], [6, 'quant_scatter_plot_host_salmon_alignment_based'], [7, 'quant_scatter_plot_pathogen_salmon_alignment_based'], [8, 'pathonen_tab'], [9, 'host_tab']]
Emits : []


Name : combine_annotations_quant_pathogen_salmon_alignment_mode
Inputs : [[0, 'quant_pathogen_add_annotations_alignment_based'], [1, 'annotation_pathogen_combine_quant_salmon_alignment_based'], [2, 'combine_annot_quant_pathogen_salmon_alignment_based']]
Outputs : []
Emits : []


Name : combine_annotations_quant_host_salmon_alignment_mode
Inputs : [[0, 'quant_host_add_annotations_salmon_alignment_based'], [1, 'annotation_host_combine_quant_salmon_alignment_based'], [2, 'combine_annot_quant_host_salmon_alignment_based']]
Outputs : []
Emits : []


Name : combine_annotations_quant_gene_level_salmon_alignment_mode
Inputs : [[0, 'quant_gene_level_host_add_annotations_salmon_alignment'], [1, 'annotation_host_combine_quant_gene_level_salmon_alignment']]
Outputs : []
Emits : []


Name : extract_processed_reads_STAR_for_salmon
Inputs : [[0, 'collect_processed_read_counts_STAR_for_salmon']]
Outputs : [[0, 'collect_results_star_for_salmon']]
Emits : []


Name : collect_processed_reads_STAR_for_salmon
Inputs : [[0, 'collect_results_star_for_salmon']]
Outputs : [[0, 'mapping_stats_total_processed_reads_alignment_for_salmon']]
Emits : []


Name : scatter_plot_pathogen_salmon_alignment_based
Inputs : [[0, 'quant_scatter_plot_pathogen_salmon_alignment_based'], [1, 'atr_scatter_plot_pathogen_alignment'], [2, 'repl_scatter_plots_salmon_alignment_pathogen'], [3, 'scatterplots_pathogen_salmon_alignment_based']]
Outputs : []
Emits : []


Name : scatter_plot_host_salmon_alignment_based
Inputs : [[0, 'quant_scatter_plot_host_salmon_alignment_based'], [1, 'atr_scatter_plot_host_alignment'], [2, 'repl_scatter_plots_salmon_alignment_host'], [3, 'scatterplots_host_salmon_alignment_based']]
Outputs : []
Emits : []


Name : extract_processed_reads_salmon_alignment_based
Inputs : [[0, 'collect_processed_read_counts_alignment_based']]
Outputs : [[0, 'collect_results_alignment_based']]
Emits : []


Name : collect_processed_reads_salmon_alignment_based
Inputs : [[0, 'collect_results_alignment_based']]
Outputs : [[0, 'mapping_stats_total_reads_alignment']]
Emits : []


Name : salmon_quantification_stats_salmon_alignment_based
Inputs : [[0, 'host_quantification_mapping_stats_salmon_alignment_based'], [1, 'pathogen_quantification_mapping_stats_salmon_alignment_based'], [2, 'attribute_quant_stats_salmon_alignment'], [3, 'mapping_stats_total_reads_alignment'], [4, 'mapping_stats_total_processed_reads_alignment_for_salmon'], [5, 'collect_total_reads_raw_salmon_alignment']]
Outputs : [[0, 'salmon_mapped_stats_to_plot_alignment']]
Emits : []


Name : plot_salmon_mapping_stats_host_pathogen_salmon_alignment_based
Inputs : [[0, 'salmon_mapped_stats_to_plot_alignment']]
Outputs : []
Emits : []


Name : RNA_class_statistics_salmon_pathogen_alignment_based
Inputs : [[0, 'pathogen_quantification_RNA_stats_salmon_alignment_based'], [1, 'host_annotations_RNA_class_stats_pathogen_alignment'], [2, 'pathogen_annotations_RNA_class_stats_salmon_alignment']]
Outputs : [[0, 'plot_RNA_stats_pathogen_alignment'], [1, 'plot_RNA_stats_pathogen_combined_alignment'], [3, 'plot_RNA_stats_pathogen_alignment_boolean'], [4, 'plot_RNA_stats_pathogen_combined_alignment_boolean']]
Emits : []


Name : RNA_class_statistics_salmon_host_alignment_based
Inputs : [[0, 'host_quantification_RNA_stats_salmon_alignment_based'], [1, 'attribute_host_RNA_class_stats_alignment'], [2, 'host_annotations_RNA_class_stats_salmon_alignment'], [3, 'RNA_classes_to_replace_alignment']]
Outputs : [[0, 'plot_RNA_stats_host_alignment'], [1, 'plot_RNA_stats_host_combined_alignment'], [4, 'plot_RNA_stats_host_alignment_boolean'], [5, 'plot_RNA_stats_host_combined_alignment_boolean']]
Emits : []


Name : plot_RNA_class_salmon_pathogen_each_alignment_based
Inputs : [[0, 'plot_RNA_stats_pathogen_alignment'], [1, 'plot_RNA_stats_pathogen_alignment_boolean']]
Outputs : []
Emits : []


Name : plot_RNA_class_salmon_host_each_alignment_based
Inputs : [[0, 'plot_RNA_stats_host_alignment'], [1, 'plot_RNA_stats_host_alignment_boolean']]
Outputs : []
Emits : []


Name : plot_RNA_class_salmon_pathogen_combined_alignment_based
Inputs : [[0, 'plot_RNA_stats_pathogen_combined_alignment'], [1, 'plot_RNA_stats_pathogen_combined_alignment_boolean']]
Outputs : []
Emits : []


Name : plot_RNA_class_salmon_host_combined_alignment_based
Inputs : [[0, 'plot_RNA_stats_host_combined_alignment'], [1, 'plot_RNA_stats_host_combined_alignment_boolean']]
Outputs : []
Emits : []


Name : STARindex
Inputs : [[0, 'host_pathogen_fasta_star_index'], [1, 'gff_host_star_alignment_gff']]
Outputs : [[0, 'star_index_genome_alignment']]
Emits : []


Name : ALIGNMENTstar
Inputs : [[0, 'trimming_results_star_htseq'], [1, 'gff_host_star_htseq_alignment_gff'], [2, 'star_index_genome_alignment']]
Outputs : [[0, 'star_aligned_u_m'], [1, 'alignment_unique_mapping_stats'], [2, 'alignment_crossmapped_extract'], [3, 'multiqc_star_alignment'], [4, 'collect_processed_read_counts_STAR']]
Emits : []


Name : remove_crossmapped_reads
Inputs : [[0, 'alignment_crossmapped_extract'], [1, 'reference_host_names_crossmapped_find'], [2, 'reference_pathogen_crossmapped_find']]
Outputs : [[0, 'alignment_multi_mapping_stats'], [1, 'count_crossmapped_reads']]
Emits : []


Name : extract_processed_reads_STAR
Inputs : [[0, 'collect_processed_read_counts_STAR']]
Outputs : [[0, 'collect_results_star']]
Emits : []


Name : collect_processed_reads_STAR
Inputs : [[0, 'collect_results_star']]
Outputs : [[0, 'mapping_stats_total_processed_reads_alignment'], [1, 'mapping_stats_htseq_total_processed_reads_alignment']]
Emits : []


Name : unique_mapping_stats_STAR
Inputs : [[0, 'alignment_unique_mapping_stats'], [1, 'reference_host_names_uniquelymapped'], [2, 'reference_pathogen_names_uniquelymapped']]
Outputs : [[0, 'STAR_mapping_stats_unique']]
Emits : []


Name : collect_stats_STAR_uniquely_mapped
Inputs : [[0, 'STAR_mapping_stats_unique']]
Outputs : [[0, 'mapping_stats_uniquely_mapped_star']]
Emits : []


Name : count_crossmapped_reads
Inputs : [[0, 'count_crossmapped_reads']]
Outputs : [[0, 'STAR_mapping_stats_cross_mapped']]
Emits : []


Name : multi_mapping_stats
Inputs : [[0, 'alignment_multi_mapping_stats'], [1, 'reference_host_names_multimapped'], [2, 'reference_pathogen_names_multimapped']]
Outputs : [[0, 'STAR_mapping_stats_multi']]
Emits : []


Name : collect_stats_STAR_multi_mapped
Inputs : [[0, 'STAR_mapping_stats_multi']]
Outputs : [[0, 'mapping_stats_multi_mapped_star']]
Emits : []


Name : star_mapping_stats
Inputs : [[0, 'collect_total_reads_raw_star'], [1, 'mapping_stats_total_processed_reads_alignment'], [2, 'mapping_stats_uniquely_mapped_star'], [3, 'mapping_stats_multi_mapped_star'], [4, 'STAR_mapping_stats_cross_mapped']]
Outputs : [[0, 'star_mapped_stats_to_plot'], [1, 'mapping_stats_star_htseq_stats']]
Emits : []


Name : plot_star_mapping_stats
Inputs : [[0, 'star_mapped_stats_to_plot']]
Outputs : []
Emits : []


Name : HTseq_unique_mapping
Inputs : [[0, 'quantification_gff_u_m'], [1, 'star_aligned_u_m'], [2, 'host_gff_attribute_htseq'], [3, 'stranded_htseq_unique']]
Outputs : [[0, 'htseq_files_to_combine'], [1, 'multiqc_htseq_unique']]
Emits : []


Name : combine_quantification_tables_htseq_uniquely_mapped
Inputs : [[0, 'htseq_result_quantification'], [1, 'host_gff_attribute_htseq_combine']]
Outputs : [[0, 'htseq_result_quantification_TPM']]
Emits : []


Name : htseq_uniquely_mapped_TPM
Inputs : [[0, 'htseq_result_quantification_TPM'], [1, 'host_gff_attribute_htseq_TPM'], [2, 'gff_host_to_TPM'], [3, 'gff_pathogen_to_TPM']]
Outputs : [[0, 'split_table_htseq_host'], [1, 'split_table_htseq_pathogen']]
Emits : []


Name : split_quantification_tables_htseq_uniquely_mapped
Inputs : [[0, 'split_table_htseq_host'], [1, 'annotation_host_split_quant_htseq'], [2, 'annotation_pathogen_split_quant_htseq']]
Outputs : [[0, 'host_quantification_stats_htseq'], [1, 'host_quantification_stats_htseq_total'], [2, 'host_htseq_quantification_RNA_stats'], [3, 'quant_host_add_annotations_htseq_u_m'], [4, 'quant_scatter_plot_host_htseq_u_m'], [5, 'pathogen_quantification_stats_htseq'], [6, 'pathogen_quantification_stats_htseq_total'], [7, 'pathogen_htseq_quantification_RNA_stats'], [8, 'quant_pathogen_add_annotations_htseq_u_m'], [9, 'quant_scatter_plot_pathogen_htseq_u_m'], [10, 'pathonen_tab'], [11, 'host_tab']]
Emits : []


Name : combine_annotations_quant_pathogen_uniquely_mapped_host
Inputs : [[0, 'quant_pathogen_add_annotations_htseq_u_m'], [1, 'annotation_pathogen_combine_quant_htseq_u_m'], [2, 'combine_annot_quant_pathogen_host_gff_attribute']]
Outputs : []
Emits : []


Name : combine_annotations_quant_host_uniquely_mapped_host
Inputs : [[0, 'quant_host_add_annotations_htseq_u_m'], [1, 'annotation_host_combine_quant_htseq'], [2, 'combine_annot_quant_pathogen_host_gff_attribute']]
Outputs : []
Emits : []


Name : scatter_plot_pathogen_htseq
Inputs : [[0, 'quant_scatter_plot_pathogen_htseq_u_m'], [1, 'atr_scatter_plot_pathogen_htseq_u_m'], [2, 'repl_scatter_plots_htseq_pathogen'], [3, 'scatterplots_pathogen_htseq']]
Outputs : []
Emits : []


Name : scatter_plot_host_htseq
Inputs : [[0, 'quant_scatter_plot_host_htseq_u_m'], [1, 'atr_scatter_plot_host_htseq_u_m'], [2, 'repl_scatter_plots_htseq_host'], [3, 'scatterplots_host_htseq']]
Outputs : []
Emits : []


Name : htseq_quantification_stats_uniquely_mapped
Inputs : [[0, 'host_quantification_stats_htseq_total'], [1, 'pathogen_quantification_stats_htseq_total'], [2, 'host_gff_attribute_mapping_stats_htseq'], [3, 'mapping_stats_star_htseq_stats']]
Outputs : [[0, 'htseq_mapped_stats_to_plot']]
Emits : []


Name : plot_mapping_stats_host_pathogen_htseq_uniquely_mapped
Inputs : [[0, 'htseq_mapped_stats_to_plot']]
Outputs : []
Emits : []


Name : RNA_class_statistics_htseq_uniquely_mapped_pathogen
Inputs : [[0, 'pathogen_htseq_quantification_RNA_stats'], [1, 'host_gff_attribute_RNA_class_pathogen_htseq'], [2, 'pathogen_annotations_RNA_class_stats_htseq']]
Outputs : [[0, 'plot_RNA_stats_pathogen_htseq_u_m'], [1, 'plot_RNA_stats_pathogen_combined_htseq_u_m'], [3, 'plot_RNA_stats_pathogen_htseq_u_m_boolean'], [4, 'plot_RNA_stats_pathogen_combined_htseq_u_m_boolean']]
Emits : []


Name : RNA_class_statistics_htseq_uniquely_mapped_host
Inputs : [[0, 'host_htseq_quantification_RNA_stats'], [1, 'host_gff_attribute_RNA_class_host_htseq'], [2, 'host_annotations_RNA_class_stats_htseq'], [3, 'RNA_classes_to_replace_htseq_uniquely_mapped']]
Outputs : [[0, 'plot_RNA_stats_host_htseq_u_m'], [1, 'plot_RNA_stats_host_combined_htseq_u_m'], [4, 'plot_RNA_stats_host_htseq_u_m_boolean'], [5, 'plot_RNA_stats_host_combined_htseq_u_m_boolean']]
Emits : []


Name : plot_RNA_class_htseq_uniquely_mapped_pathogen_each
Inputs : [[0, 'plot_RNA_stats_pathogen_htseq_u_m'], [1, 'plot_RNA_stats_pathogen_htseq_u_m_boolean']]
Outputs : []
Emits : []


Name : plot_RNA_class_htseq_uniquely_mapped_host_each
Inputs : [[0, 'plot_RNA_stats_host_htseq_u_m'], [1, 'plot_RNA_stats_host_htseq_u_m_boolean']]
Outputs : []
Emits : []


Name : plot_RNA_class_htseq_uniquely_mapped_pathogen_combined
Inputs : [[0, 'plot_RNA_stats_pathogen_combined_htseq_u_m'], [1, 'plot_RNA_stats_pathogen_combined_htseq_u_m_boolean']]
Outputs : []
Emits : []


Name : plot_RNA_class_htseq_uniquely_host_combined
Inputs : [[0, 'plot_RNA_stats_host_combined_htseq_u_m'], [1, 'plot_RNA_stats_host_combined_htseq_u_m_boolean']]
Outputs : []
Emits : []


Name : multiqc
Inputs : [[0, 'ch_multiqc_config'], [1, 'ch_multiqc_custom_config'], [2, 'ch_fastqc_results'], [3, 'ch_fastqc_trimmed_results'], [4, 'multiqc_salmon_quant'], [5, 'multiqc_salmon_alignment_quant'], [6, 'multiqc_star_alignment'], [7, 'multiqc_star_for_salmon_alignment'], [8, 'multiqc_htseq_unique'], [9, 'ch_software_versions_yaml'], [10, 'ch_workflow_summary']]
Outputs : [[0, 'ch_multiqc_report']]
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs']]
Outputs : []
Emits : []


