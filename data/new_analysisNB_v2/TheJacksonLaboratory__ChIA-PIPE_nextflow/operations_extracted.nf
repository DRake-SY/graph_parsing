OPERATION_1 string : Channel.of( sampleID, fqR1p, fqR2p )
       .toList()
       .set { sample_fastqs_ch }
OPERATION_1 origin : [['sampleID, fqR1p, fqR2p', 'V']]
OPERATION_1 gives  : [['sample_fastqs_ch', 'P']]


OPERATION_2 string : input_peak = Channel.empty()
OPERATION_2 origin : []
OPERATION_2 gives  : [['input_peak', 'P']]


OPERATION_3 string : ch_seq = Channel.of( 2, 3, 4, 5, 6, 7, 8, 9, 10 )
OPERATION_3 origin : [['2, 3, 4, 5, 6, 7, 8, 9, 10', 'V']]
OPERATION_3 gives  : [['ch_seq', 'P']]


