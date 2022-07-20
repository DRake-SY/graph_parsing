OPERATION_1 string : proteins = Channel
    .fromPath(params.queryFilePath)
    .splitFasta(by: params.queryChunkSize, file:true)
OPERATION_1 origin : [['params.queryFilePath', 'A']]
OPERATION_1 gives  : [['proteins', 'P']]


OPERATION_2 string : results = fixed_ch
    .collectFile(name: 'result.gff')
OPERATION_2 origin : [['fixed_ch', 'P']]
OPERATION_2 gives  : [['results', 'P']]


