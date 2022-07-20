OPERATION_1 string : Channel
    .fromFilePairs( params.reads, checkExists:true )
    .into { read_pairs_ch; read_pairs2_ch }
OPERATION_1 origin : [['params.reads, checkExists:true', 'A']]
OPERATION_1 gives  : [['read_pairs_ch', 'P'], ['read_pairs2_ch', 'P']]


