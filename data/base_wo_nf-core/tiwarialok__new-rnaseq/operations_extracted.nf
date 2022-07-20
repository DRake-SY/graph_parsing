OPERATION_1 string : Channel
    .fromFilePairs( params.reads )
    .ifEmpty { error "Cannot find any reads matching: ${params.reads}" }
    .into { read_pairs_ch; read_pairs2_ch }
OPERATION_1 origin : [['params.reads', 'A']]
OPERATION_1 gives  : [['read_pairs_ch', 'P'], ['read_pairs2_ch', 'P']]


