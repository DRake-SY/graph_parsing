OPERATION_1 string : Channel
    .fromFilePairs( params.reads )
    .ifEmpty { error "Cannot find any reads matching: ${params.reads}" }
    .set { read_pairs_ch }
OPERATION_1 origin : [['params.reads', 'A']]
OPERATION_1 gives  : [['read_pairs_ch', 'P']]


