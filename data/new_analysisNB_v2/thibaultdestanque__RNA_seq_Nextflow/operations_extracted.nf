OPERATION_1 string : Channel
    .fromFilePairs( params.reads )
    .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}" }
    .set { read_pairs }
OPERATION_1 origin : [['params.reads', 'A']]
OPERATION_1 gives  : [['read_pairs', 'P']]


