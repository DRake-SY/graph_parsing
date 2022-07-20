OPERATION_1 string : Channel
    .fromPath(params.argsA)
    .splitCsv(header:true)
    .map{ row-> tuple(row.sampleId, file(row.read1), file(row.read2)) }
    .set { samples_ch }
OPERATION_1 origin : [['params.argsA', 'A']]
OPERATION_1 gives  : [['samples_ch', 'P']]


