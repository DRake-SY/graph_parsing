OPERATION_1 string :  ch_fastqc, ch_trimgalore  = fq_channel.into(2)
OPERATION_1 origin : [['fq_channel', 'P']]
OPERATION_1 gives  : [['ch_fastqc', 'P'], ['ch_trimgalore', 'P']]


OPERATION_2 string : trimmed_channel.into(1)
OPERATION_2 origin : [['trimmed_channel', 'P']]
OPERATION_2 gives  : []


OPERATION_3 string :  ch_Bismark_extractor_bamPE, ch_Samtools_bamPE  = bamPE_channel.into(2)
OPERATION_3 origin : [['bamPE_channel', 'P']]
OPERATION_3 gives  : [['ch_Bismark_extractor_bamPE', 'P'], ['ch_Samtools_bamPE', 'P']]


OPERATION_4 string :  ch_Bismark_extractor_bamR1, ch_Samtools_bamR1  = bamR1_channel.into(2)
OPERATION_4 origin : [['bamR1_channel', 'P']]
OPERATION_4 gives  : [['ch_Bismark_extractor_bamR1', 'P'], ['ch_Samtools_bamR1', 'P']]


OPERATION_5 string :  ch_Bismark_extractor_bamR2, ch_Samtools_bamR2  = bamR2_channel.into(2)
OPERATION_5 origin : [['bamR2_channel', 'P']]
OPERATION_5 gives  : [['ch_Bismark_extractor_bamR2', 'P'], ['ch_Samtools_bamR2', 'P']]


OPERATION_6 string :  ch_Samtools_merge_sort, ch_Bismark_extractor_merged  = sam_merge_channel.into(2)
OPERATION_6 origin : [['sam_merge_channel', 'P']]
OPERATION_6 gives  : [['ch_Samtools_merge_sort', 'P'], ['ch_Bismark_extractor_merged', 'P']]


