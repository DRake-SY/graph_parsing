Name : samtools_merge
Inputs : [[0, 'bamfile']]
Outputs : [[0, 'merged_bam']]
Emits : []


Name : gatk_change_sample_names
Inputs : [[0, 'merged_bam']]
Outputs : [[0, 'merged_bam_RG_SM']]
Emits : []


Name : samtools_index
Inputs : [[0, 'merged_bam_RG_SM']]
Outputs : [[0, 'merged_bam_RG_SM_index']]
Emits : []


Name : gatk_mutect2
Inputs : [[0, 'merged_bam_RG_SM'], [1, 'merged_bam_RG_SM_index'], [2, 'ref'], [3, 'ref_index'], [4, 'ref_dict']]
Outputs : []
Emits : []


