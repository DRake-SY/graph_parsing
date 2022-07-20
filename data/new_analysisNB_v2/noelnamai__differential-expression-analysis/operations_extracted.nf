OPERATION_1 string : Channel.fromPath(params.reads)
    .ifEmpty{error "Cannot find any reads matching: ${params.reads}"}
    .map{file -> [file.name.substring(6, 17), file]}
    .groupTuple(by: 0, sort: true)
    .set{read_pairs_ch}
OPERATION_1 origin : [['params.reads', 'A']]
OPERATION_1 gives  : [['read_pairs_ch', 'P']]


