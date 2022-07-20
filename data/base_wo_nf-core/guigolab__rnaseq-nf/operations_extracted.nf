OPERATION_1 string : Channel
    .fromFilePairs(params.reads, checkExists:true)
    .ifEmpty{ error("No input files found") }
    .set { readsChannel }
OPERATION_1 origin : [['params.reads, checkExists:true', 'A']]
OPERATION_1 gives  : [['readsChannel', 'P']]


