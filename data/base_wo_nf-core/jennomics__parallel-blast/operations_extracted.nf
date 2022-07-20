OPERATION_1 string : chunks = Channel
            .fromPath(params.query)
            .splitFasta(by: params.chunk)
OPERATION_1 origin : [['params.query', 'A']]
OPERATION_1 gives  : [['chunks', 'P']]


OPERATION_2 string : blast_results
    .collectFile(name: "${params.output}")
OPERATION_2 origin : [['blast_results', 'P']]
OPERATION_2 gives  : []


