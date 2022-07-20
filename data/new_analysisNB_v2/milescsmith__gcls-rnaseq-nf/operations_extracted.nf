OPERATION_1 string : Channel
    .fromFilePairs( params.reads, checkExists:true )
    .into { qc_read_pairs; read_pairs}
OPERATION_1 origin : [['params.reads, checkExists:true', 'A']]
OPERATION_1 gives  : [['qc_read_pairs', 'P'], ['read_pairs', 'P']]


OPERATION_2 string : salmon_index_ch = Channel.fromPath( params.salmon_index )
OPERATION_2 origin : [['params.salmon_index', 'A']]
OPERATION_2 gives  : [['salmon_index_ch', 'P']]


