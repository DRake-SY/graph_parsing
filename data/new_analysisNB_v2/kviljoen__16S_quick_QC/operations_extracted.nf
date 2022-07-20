OPERATION_1 string : Channel
    .fromFilePairs( params.rawReads )
    .ifEmpty { error "Cannot find any reads matching: ${params.rawReads}" }
    .into {read_pair_p1; read_pair_p2}
OPERATION_1 origin : [['params.rawReads', 'A']]
OPERATION_1 gives  : [['read_pair_p1', 'P'], ['read_pair_p2', 'P']]


