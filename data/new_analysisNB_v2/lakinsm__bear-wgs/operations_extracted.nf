OPERATION_1 string : Channel
    .fromFilePairs( params.reads, flat: true )
    .ifEmpty { return fastq_error(params.reads) }
    .into { read_pairs; fastqc_pairs }
OPERATION_1 origin : [['params.reads, flat: true', 'A']]
OPERATION_1 gives  : [['read_pairs', 'P'], ['fastqc_pairs', 'P']]


