Name : get_chr
Inputs : []
Outputs : [[0, 'chr_list'], [1, 'base_file_updated']]
Emits : []


Name : compute_PRS_per_chr
Inputs : [[0, 'chr_list'], [1, 'base_file_updated']]
Outputs : [[0, 'scores'], [1, 'snps_included']]
Emits : []


Name : concatenation
Inputs : [[0, 'scores'], [1, 'snps_included']]
Outputs : [[0, 'prs_combined'], [1, 'snps_combined']]
Emits : []


