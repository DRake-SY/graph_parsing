OPERATION_1 string : Channel
  .fromFilePairs( params.reads )
  .ifEmpty { error "Cannot find reads matching: ${params.reads}" }
  .set { read_pairs }
OPERATION_1 origin : [['params.reads', 'A']]
OPERATION_1 gives  : [['read_pairs', 'P']]


