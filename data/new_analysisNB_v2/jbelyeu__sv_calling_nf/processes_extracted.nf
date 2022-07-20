Name : smoove_call
Inputs : [[0, 'call_bams'], [1, 'fasta'], [2, 'faidx']]
Outputs : [[0, 'vcfs'], [1, 'idxs'], [2, 'variant_counts'], [3, 'sequence_counts']]
Emits : []


Name : smoove_merge
Inputs : [[0, 'vcfs'], [1, 'idxs'], [2, 'fasta'], [3, 'faidx']]
Outputs : [[0, 'sites']]
Emits : []


Name : smoove_genotype
Inputs : [[0, 'genotype_bams'], [1, 'sites'], [2, 'fasta'], [3, 'faidx']]
Outputs : [[0, 'genotyped_idxs'], [1, 'genotyped_vcfs']]
Emits : []


Name : smoove_square
Inputs : [[0, 'genotyped_vcfs'], [1, 'genotyped_idxs']]
Outputs : [[0, 'square_vcf'], [1, 'square_idx']]
Emits : []


