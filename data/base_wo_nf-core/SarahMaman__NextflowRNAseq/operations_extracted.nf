OPERATION_1 string : Channel
    .fromFilePairs( params.reads )                                             
    .ifEmpty { error "Cannot find any reads matching: ${params.reads}" }  
    .set { read_pairs }
OPERATION_1 origin : [['params.reads', 'A']]
OPERATION_1 gives  : [['read_pairs', 'P']]


OPERATION_2 string : seq = Channel.fromPath('reads/*.fastq.gz')
OPERATION_2 origin : [["'reads/*.fastq.gz'", 'A']]
OPERATION_2 gives  : [['seq', 'P']]


OPERATION_3 string : Channel
    .fromFilePairs( params.reads )                                             
    .ifEmpty { error "Cannot find any reads matching: ${params.reads}" }  
    .set { read_pairs5 }
OPERATION_3 origin : [['params.reads', 'A']]
OPERATION_3 gives  : [['read_pairs5', 'P']]


OPERATION_4 string : Channel
    .fromFilePairs( params.reads )                                             
    .ifEmpty { error "Cannot find any reads matching: ${params.reads}" }  
    .set { read_pairs2 }
OPERATION_4 origin : [['params.reads', 'A']]
OPERATION_4 gives  : [['read_pairs2', 'P']]


OPERATION_5 string : BAMtrans_ch = Channel.fromPath(params.BAMtrans)
OPERATION_5 origin : [['params.BAMtrans', 'A']]
OPERATION_5 gives  : [['BAMtrans_ch', 'P']]


OPERATION_6 string : Channel
    .fromFilePairs( params.reads )                                             
    .ifEmpty { error "Cannot find any reads matching: ${params.reads}" }  
    .set { read_pairs3 }
OPERATION_6 origin : [['params.reads', 'A']]
OPERATION_6 gives  : [['read_pairs3', 'P']]


OPERATION_7 string : conditions = Channel.value( "${params.conditions}" )PROCESS DEF Cufflinks
OPERATION_7 origin : []
OPERATION_7 gives  : [['conditions', 'P']]


OPERATION_8 string : transcripts_ch = Channel.fromPath(params.GTF)
OPERATION_8 origin : [['params.GTF', 'A']]
OPERATION_8 gives  : [['transcripts_ch', 'P']]


OPERATION_9 string : Channel
    .fromFilePairs( params.reads )                                             
    .ifEmpty { error "Cannot find any reads matching: ${params.reads}" }  
    .set { read_pairs_3 }
OPERATION_9 origin : [['params.reads', 'A']]
OPERATION_9 gives  : [['read_pairs_3', 'P']]


OPERATION_10 string : Channel
    .fromFilePairs( params.reads )                                             
    .ifEmpty { error "Cannot find any reads matching: ${params.reads}" }  
    .set { read_pairs_4 }
OPERATION_10 origin : [['params.reads', 'A']]
OPERATION_10 gives  : [['read_pairs_4', 'P']]


