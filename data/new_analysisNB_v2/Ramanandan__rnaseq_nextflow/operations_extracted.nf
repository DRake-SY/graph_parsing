OPERATION_1 string : Channel
    .fromFilePairs( params.reads )
    .ifEmpty { error "Cannot find any reads matching: ${params.reads}" }
    .into { read1_ch; raw_reads_trimgalore; raw_reads_for_hisat2 }
OPERATION_1 origin : [['params.reads', 'A']]
OPERATION_1 gives  : [['read1_ch', 'P'], ['raw_reads_trimgalore', 'P'], ['raw_reads_for_hisat2', 'P']]


