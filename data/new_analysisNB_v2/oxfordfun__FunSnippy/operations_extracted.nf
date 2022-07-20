OPERATION_1 string : Channel
    .fromFilePairs( data_path , flat: true)                               
    .ifEmpty{ error "Cannot find any reads matching: ${params.pattern}"}
    .set { snippy_read_pairs }
OPERATION_1 origin : [['data_path , flat: true', 'A']]
OPERATION_1 gives  : [['snippy_read_pairs', 'P']]


