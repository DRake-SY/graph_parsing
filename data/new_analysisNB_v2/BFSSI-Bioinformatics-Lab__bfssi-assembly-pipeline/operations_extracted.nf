OPERATION_1 string : reads = Channel
    .fromFilePairs( params.reads , flat:true)
    .ifEmpty { error "Cannot find any reads matching: ${params.reads}" }
    .set { read_pairs_ch }
OPERATION_1 origin : [['params.reads , flat:true', 'A']]
OPERATION_1 gives  : [['reads', 'P'], ['read_pairs_ch', 'P']]


OPERATION_2 string : reads = Channel
    .fromFilePairs( params.reads , flat:true)
    .set { reads_prefilter_ch }
OPERATION_2 origin : [['params.reads , flat:true', 'A']]
OPERATION_2 gives  : [['reads', 'P'], ['reads_prefilter_ch', 'P']]


