Name : generate_star_index
Inputs : [[0, 'ch_fasta'], [1, 'ch_gtf']]
Outputs : [[0, 'generated_star_index']]
Emits : []


Name : STAR
Inputs : [[0, 'ch_totalRNA_reads'], [1, 'ch_star_index']]
Outputs : [[0, 'chimeric_junction_files']]
Emits : []


Name : circExplorer2_Parse
Inputs : [[0, 'chimeric_junction_files']]
Outputs : [[0, 'backspliced_junction_bed_files']]
Emits : []


Name : circExplorer2_Annotate
Inputs : [[0, 'backspliced_junction_bed_files'], [1, 'ch_fasta']]
Outputs : [[0, 'ch_circRNA_known_files']]
Emits : []


Name : summarize_detected_circRNAs
Inputs : [[0, 'ch_circRNA_known_files']]
Outputs : [[0, 'ch_circRNA_counts_raw']]
Emits : []


Name : normalize_circRNAs
Inputs : [[0, 'ch_circRNA_counts_raw']]
Outputs : [[0, '']]
Emits : []


Name : filter_circRNAs
Inputs : [[0, 'ch_circRNA_counts_norm1']]
Outputs : [[0, '']]
Emits : []


Name : extract_circRNA_sequences
Inputs : [[0, 'ch_circRNA_counts_filtered1'], [1, 'ch_fasta']]
Outputs : [[0, 'circRNAs_fasta']]
Emits : []


Name : miranda
Inputs : [[0, 'circRNAs_fasta']]
Outputs : [[0, 'bind_sites_out']]
Emits : []


Name : binding_sites_processing
Inputs : [[0, 'bind_sites_out']]
Outputs : [[0, 'bind_sites_processed']]
Emits : []


Name : binding_sites_filtering
Inputs : [[0, 'bind_sites_processed']]
Outputs : [[0, 'ch_bindsites_filtered']]
Emits : []


Name : generate_bowtie_index
Inputs : [[0, 'ch_fasta']]
Outputs : [[0, 'ch_generated_bowtie_index']]
Emits : []


Name : miRDeep2_mapping
Inputs : [[0, 'ch_smallRNA_reads'], [1, 'ch_bowtie_index'], [2, 'ch_fasta']]
Outputs : [[0, 'ch_miRNA_mapping_output']]
Emits : []


Name : miRDeep2_quantification
Inputs : [[0, 'ch_miRNA_mapping_output'], [1, 'ch_fasta']]
Outputs : [[0, 'ch_miRNA_expression_files']]
Emits : []


Name : summarize_detected_miRNAs
Inputs : [[0, 'ch_miRNA_expression_files']]
Outputs : [[0, 'ch_miRNA_counts_raw']]
Emits : []


Name : normalize_miRNAs
Inputs : [[0, 'ch_miRNA_counts_raw']]
Outputs : [[0, '']]
Emits : []


Name : filter_miRNAs
Inputs : [[0, 'ch_miRNA_counts_norm1']]
Outputs : [[0, '']]
Emits : []


Name : compute_correlations
Inputs : [[0, 'ch_miRNA_counts_filtered1'], [1, 'ch_circRNA_counts_filtered2'], [2, 'ch_bindsites_filtered']]
Outputs : [[0, 'ch_correlations']]
Emits : []


Name : correlation_analysis
Inputs : [[0, 'ch_correlations'], [1, 'ch_miRNA_counts_filtered2'], [2, 'ch_circRNA_counts_filtered3'], [3, 'ch_miRNA_counts_norm2'], [4, 'ch_circRNA_counts_norm2']]
Outputs : [[0, 'ch_sponging_statistics'], [1, 'ch_plots']]
Emits : []


