OPERATION_1 string : Channel
    .fromFilePairs( params.reads, flat: true )
    .ifEmpty { error "Cannot find any reads matching: ${params.reads}" }
    .set { read_pairs }
OPERATION_1 origin : [['params.reads, flat: true', 'A']]
OPERATION_1 gives  : [['read_pairs', 'P']]


