Name : SubsetMultiVCF
Inputs : [[0, 'ch_multiVCF'], [1, 'ch_fasta'], [2, 'ch_fai'], [3, 'ch_dict']]
Outputs : [[0, '']]
Emits : []


Name : GatherVcfs
Inputs : [[0, 'ch_grouped_pop_vcfs'], [1, 'ch_fasta_gather'], [2, 'ch_fai_gather'], [3, 'ch_dict_gather']]
Outputs : [[0, 'ch_complete_chr_vcf'], [1, '']]
Emits : []


Name : PlinkFilterAndFreqCount
Inputs : [[0, 'ch_plink_count_freqs']]
Outputs : [[0, 'ch_plink_results'], [1, 'ch_plink_frq_counts']]
Emits : []


