Name : alignReference
Inputs : []
Outputs : [[0, 'reference_aligned']]
Emits : []


Name : filterAlignment
Inputs : [[0, 'reference_aligned']]
Outputs : [[0, 'filtered_align']]
Emits : []


Name : extract_genes
Inputs : [[0, 'mat_peptides_AA'], [1, 'filtered_align']]
Outputs : [[0, 'proteins']]
Emits : []


Name : extract_cds
Inputs : [[0, 'mat_peptides_cds'], [1, 'filtered_align']]
Outputs : [[0, 'cds']]
Emits : []


Name : filter_protein
Inputs : [[0, 'proteins']]
Outputs : [[0, 'filtered_proteins']]
Emits : []


Name : align_protein
Inputs : [[0, 'filtered_proteins']]
Outputs : [[0, 'aligned_proteins']]
Emits : []


Name : calc_entropy
Inputs : [[0, 'aligned_proteins']]
Outputs : [[0, 'entropy_results']]
Emits : []


