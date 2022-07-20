Name : get_single_copy
Inputs : [[0, 'genomes']]
Outputs : [[2, 'single_copy_proteins']]
Emits : []


Name : concat_single_copy
Inputs : [[0, 'single_copy_proteins']]
Outputs : [[0, 'cat_all_single_copy_proteins']]
Emits : []


Name : filter_single_copy
Inputs : [[0, 'cat_all_single_copy_proteins']]
Outputs : [[0, 'shared_single_copy_proteins']]
Emits : []


Name : mafft
Inputs : [[0, 'shared_single_copy_proteins']]
Outputs : [[0, 'aligned_shared_single_copy_proteins']]
Emits : []


Name : gblocks
Inputs : [[0, 'aligned_shared_single_copy_proteins']]
Outputs : [[0, 'cleaned_aligned_shared_single_copy_proteins']]
Emits : []


Name : concatenation
Inputs : [[0, 'cleaned_aligned_shared_single_copy_proteins']]
Outputs : [[0, 'concatenated_alignments']]
Emits : []


Name : iqtree
Inputs : [[0, 'concatenated_alignments']]
Outputs : [[0, 'iqtree_tree'], [1, 'iqtree_logs']]
Emits : []


