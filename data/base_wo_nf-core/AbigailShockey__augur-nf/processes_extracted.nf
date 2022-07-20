Name : filter
Inputs : [[0, 'sequences'], [1, 'filter_metadata'], [2, 'dropped_strains']]
Outputs : [[0, 'input_sequences']]
Emits : []


Name : align
Inputs : [[0, 'input_sequences'], [1, 'reference_alignment'], [2, 'bed_file']]
Outputs : [[0, 'raw_tree_alignment'], [0, 'refine_tree_alignment'], [0, 'ancestral_alignment']]
Emits : []


Name : tree
Inputs : [[0, 'raw_tree_alignment']]
Outputs : [[0, 'raw_tree']]
Emits : []


Name : refine
Inputs : [[0, 'raw_tree'], [1, 'refine_tree_alignment'], [2, 'refine_tree_metadata']]
Outputs : [[0, 'refined_tree_traits'], [0, 'refined_tree_ancestral'], [0, 'refined_tree_translate'], [0, 'refined_tree_export'], [1, 'branch_lengths_export']]
Emits : []


Name : ancestral
Inputs : [[0, 'refined_tree_ancestral'], [1, 'ancestral_alignment']]
Outputs : [[0, 'ancestral_nt_translate'], [0, 'ancestral_nt_export']]
Emits : []


Name : translate
Inputs : [[0, 'refined_tree_translate'], [1, 'ancestral_nt_translate'], [2, 'reference_translate']]
Outputs : [[0, 'ancestral_aa_export']]
Emits : []


Name : traits
Inputs : [[0, 'refined_tree_traits'], [1, 'traits_metadata']]
Outputs : [[0, 'traits_export']]
Emits : []


Name : export
Inputs : [[0, 'refined_tree_export'], [1, 'metadata_export'], [2, 'branch_lengths_export'], [3, 'ancestral_nt_export'], [4, 'ancestral_aa_export'], [5, 'colors_export'], [6, 'lat_long_export'], [7, 'config_export'], [8, 'traits_export']]
Outputs : []
Emits : []


