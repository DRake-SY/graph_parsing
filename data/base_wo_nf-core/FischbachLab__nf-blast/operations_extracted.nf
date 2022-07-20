OPERATION_1 string : Channel
  .fromPath(params.query)
  .ifEmpty { exit 1, "Cannot find matching fasta file" }
OPERATION_1 origin : [['params.query', 'A']]
OPERATION_1 gives  : []


OPERATION_2 string : Channel
    .fromPath(params.query)
    .splitFasta(by: params.chunksize, file:true)
    .set { fasta_ch }
OPERATION_2 origin : [['params.query', 'A']]
OPERATION_2 gives  : [['fasta_ch', 'P']]


OPERATION_3 string : hits_ch
    .collectFile(name: out)
OPERATION_3 origin : [['hits_ch', 'P']]
OPERATION_3 gives  : []


