Name : sort_compress
Inputs : [[0, 'ch_bcftools_site_metrics_subcols']]
Outputs : [[0, 'ch_sort_compress']]
Emits : []


Name : filter_regions
Inputs : [[0, 'ch_bcfs'], [1, 'ch_sort_compress']]
Outputs : [[0, 'ch_regions_filtered']]
Emits : []


Name : further_filtering
Inputs : [[0, 'ch_regions_filtered']]
Outputs : [[0, 'ch_further_filtering']]
Emits : []


Name : create_final_king_vcf
Inputs : [[0, 'ch_further_filtering'], [1, 'ch_inputFinalPlatekeys']]
Outputs : [[0, 'ch_create_final_king_vcf'], [1, 'ch_vcfs_create_final_king_vcf'], [2, 'ch_tbi_create_final_king_vcf']]
Emits : []


Name : concat_king_vcf
Inputs : [[0, 'ch_create_final_king_vcf'], [1, 'ch_vcfs_create_final_king_vcf'], [2, 'ch_tbi_create_final_king_vcf'], [3, 'chrs']]
Outputs : [[0, 'ch_vcfs_per_chromosome']]
Emits : []


Name : make_bed_all
Inputs : [[0, 'ch_vcfs_per_chromosome'], [1, 'ch_inputMichiganLDfileExclude']]
Outputs : [[0, 'ch_make_bed_all']]
Emits : []


Name : ld_bed
Inputs : [[0, 'ch_make_bed_all']]
Outputs : [[0, 'ch_ld_bed']]
Emits : []


Name : merge_autosomes
Inputs : [[0, 'ch_ld_bed']]
Outputs : [[0, '']]
Emits : []


Name : hwe_pruning_30k_snps
Inputs : [[0, 'ch_merge_autosomes'], [1, 'ch_inputAncestryAssignmentProbs'], [2, 'ch_inputPCsancestryrelated']]
Outputs : [[0, 'hwe_pruning_30k_snps']]
Emits : []


Name : king_coefficients
Inputs : [[0, 'ch_merge_autosomes2'], [1, 'hwe_pruning_30k_snps']]
Outputs : [[0, 'king_coefficients'], [1, 'ch_unrelatedlist']]
Emits : []


Name : gcta
Inputs : [[0, 'king_coefficients']]
Outputs : [[0, 'ch_gcta']]
Emits : []


Name : infer_ancestry
Inputs : [[0, 'ch_input1KGP3'], [1, 'ch_inputSuper_pop_codes'], [2, 'ch_inputUNRELATED_1KGP3'], [3, 'ch_input05both1K100K_eigenvec'], [4, 'ch_GELprojection_proj_eigenvec'], [5, 'ch_gcta']]
Outputs : [[0, 'ch_infer_ancestry'], [1, 'ch_infer_ancestry_2']]
Emits : []


