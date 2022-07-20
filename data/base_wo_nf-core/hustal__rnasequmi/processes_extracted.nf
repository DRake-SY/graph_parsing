Name : Annotate_BAM_with_UMIs
Inputs : [[0, 'samples_set']]
Outputs : [[0, 'umi_bam_files']]
Emits : []


Name : Check_Header
Inputs : [[0, 'umi_bam_files']]
Outputs : [[0, 'umi_RG_bam_files']]
Emits : []


Name : Mark_Duplicates_with_UMIs
Inputs : [[0, 'umi_RG_bam_files']]
Outputs : []
Emits : []


