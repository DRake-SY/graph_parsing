OPERATION_1 string : Channel
    .fromFilePairs( params.fastq, flat: true )
    .ifEmpty { error "Cannot find any reads matching: ${params.fastq}" }
    .set { read_pairs }
OPERATION_1 origin : [['params.fastq, flat: true', 'A']]
OPERATION_1 gives  : [['read_pairs', 'P']]


