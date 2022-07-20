OPERATION_1 string : Channel.fromFilePairs( params.bams, flat:true )
       .set { bam_ch }
OPERATION_1 origin : [['params.bams, flat:true', 'A']]
OPERATION_1 gives  : [['bam_ch', 'P']]


OPERATION_2 string : merge_ch.into { merge_ch2; stats_ch }
OPERATION_2 origin : [['merge_ch', 'P']]
OPERATION_2 gives  : [['merge_ch2', 'P'], ['stats_ch', 'P']]


