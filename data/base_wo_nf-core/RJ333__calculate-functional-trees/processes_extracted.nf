Name : create_single_line_fasta
Inputs : [[0, 'prokka_protein_fasta']]
Outputs : [[0, 'single_line_fasta']]
Emits : []


Name : subset_gff
Inputs : [[0, 'prokka_gff']]
Outputs : [[0, 'subset_gff']]
Emits : []


Name : subset_protein_fasta
Inputs : [[0, 'single_line_fasta'], [1, 'subset_gff']]
Outputs : [[0, 'subset_prokka']]
Emits : []


Name : download_sequences_from_uniprot
Inputs : [[0, 'taxa_of_interest']]
Outputs : [[0, 'subset_target_genes']]
Emits : []


Name : merge_protein_sequences
Inputs : [[0, 'subset_prokka'], [1, 'subset_target_genes']]
Outputs : [[0, 'merged_proteins']]
Emits : []


Name : remove_duplicates
Inputs : [[0, 'merged_proteins']]
Outputs : [[0, 'merged_proteins_no_dup']]
Emits : []


Name : run_msa
Inputs : [[0, 'merged_proteins_no_dup']]
Outputs : [[0, 'msa']]
Emits : []


Name : fasta_to_phylip
Inputs : [[0, 'msa']]
Outputs : [[0, 'phylip']]
Emits : []


Name : remove_special_chars_from_phylip
Inputs : [[0, 'phylip']]
Outputs : [[0, 'phylip_clean']]
Emits : []


Name : run_raxml
Inputs : [[0, 'phylip_clean']]
Outputs : [[0, 'raxml_tree']]
Emits : []


Name : plot_tree
Inputs : [[0, 'raxml_tree'], [1, 'kallisto_matrix']]
Outputs : [[0, 'tree_plot']]
Emits : []


