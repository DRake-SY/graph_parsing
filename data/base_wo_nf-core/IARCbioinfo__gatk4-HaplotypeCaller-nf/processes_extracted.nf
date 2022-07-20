Name : SplitIntervals
Inputs : [[0, 'ref']]
Outputs : [[0, 'interval_ch'], [1, 'faidx_ch'], [2, 'dict_ch']]
Emits : []


Name : HaplotypeCaller
Inputs : [[0, 'ref'], [1, 'faidx_ch'], [2, 'dict_ch'], [3, 'bam_ch']]
Outputs : [[0, 'gvcf_ch']]
Emits : []


Name : MergeGVCFs
Inputs : [[0, 'gvcf_ch']]
Outputs : [[0, 'merged_gvcf_ch']]
Emits : []


