Name : Variantcall
Inputs : [[0, 'bam_ch'], [1, 'chr_list']]
Outputs : [[0, 'vcf_ch']]
Emits : []


Name : merge_vcf
Inputs : [[0, 'vcf_ch']]
Outputs : [[0, 'merge_ch']]
Emits : []


Name : Stats
Inputs : [[0, 'stats_ch']]
Outputs : []
Emits : []


Name : Subset
Inputs : [[0, 'merge_ch2']]
Outputs : [[0, 'subset_ch']]
Emits : []


Name : plot
Inputs : [[0, 'subset_ch']]
Outputs : []
Emits : []


