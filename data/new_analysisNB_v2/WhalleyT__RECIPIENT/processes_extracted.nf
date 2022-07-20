Name : prokka
Inputs : [[0, 'fasta_dataset_prokka']]
Outputs : [[0, 'gff'], [1, 'faa_annots']]
Emits : []


Name : roary
Inputs : [[0, 'gff']]
Outputs : [[0, 'roary'], [1, 'pan_genome'], [2, 'alignment_files'], [3, 'gene_presence'], [4, 'roary_out']]
Emits : []


Name : mash
Inputs : [[0, 'faa_annots']]
Outputs : [[0, 'mash']]
Emits : []


Name : kraken
Inputs : [[0, 'fasta_dataset_kraken']]
Outputs : []
Emits : []


Name : core_genes
Inputs : [[0, 'gene_presence']]
Outputs : [[0, 'core_gene_set']]
Emits : []


Name : tajima
Inputs : [[0, 'alignment_files']]
Outputs : [[0, 'tajima']]
Emits : []


Name : translate_reference
Inputs : [[0, 'pan_genome']]
Outputs : [[0, 'reference_protein']]
Emits : []


Name : split_fasta
Inputs : [[0, 'reference_protein']]
Outputs : [[0, 'single_protein_files']]
Emits : []


Name : mhc_i_binding
Inputs : [[0, 'single_protein_files']]
Outputs : [[0, 'mhc_i_files']]
Emits : []


Name : mhc_ii_binding
Inputs : [[0, 'single_protein_files']]
Outputs : [[0, 'mhc_ii_files']]
Emits : []


Name : bepipred
Inputs : [[0, 'single_protein_files']]
Outputs : [[0, 'bcell_files']]
Emits : []


Name : clean_mhc_ii
Inputs : [[0, 'mhc_ii_files']]
Outputs : [[0, 'mhc_ii_clean']]
Emits : []


Name : clean_mhc_i
Inputs : [[0, 'mhc_i_files']]
Outputs : [[0, 'mhc_i_clean']]
Emits : []


Name : clean_bcell
Inputs : [[0, 'bcell_files']]
Outputs : [[0, 'mhc_i_clean']]
Emits : []


Name : run_loctree
Inputs : [[0, 'single_protein_files']]
Outputs : [[0, 'loctree_results']]
Emits : []


Name : clean_loctree
Inputs : [[0, 'loctree_results']]
Outputs : [[0, 'output_files']]
Emits : []


