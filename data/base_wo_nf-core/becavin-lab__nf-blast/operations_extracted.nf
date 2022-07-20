OPERATION_1 string : Channel
    .fromPath(params.query)
    .splitFasta(by: params.chunkSize, file:true)
    .set { fasta_ch }
OPERATION_1 origin : [['params.query', 'A']]
OPERATION_1 gives  : [['fasta_ch', 'P']]


OPERATION_2 string : sequences_ch
    .collectFile(name: params.out)
    .view { file -> "matching sequences:\n ${file.text}" }
OPERATION_2 origin : [['sequences_ch', 'P']]
OPERATION_2 gives  : []


