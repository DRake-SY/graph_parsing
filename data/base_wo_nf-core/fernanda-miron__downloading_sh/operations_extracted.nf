OPERATION_1 string : Channel
    .fromPath(params.index)
    .splitCsv(header:true)
    .map{ row-> tuple(row.sampleId, row.read1, row.read2, row.read3) }
    .set { samples_ch }
OPERATION_1 origin : [['params.index', 'A']]
OPERATION_1 gives  : [['samples_ch', 'P']]


OPERATION_2 string : Channel
    .fromPath(params.cram)
    .splitCsv(header:true)
    .map{ row-> tuple(row.sampleId, row.read1) }
    .set { samples_cram }
OPERATION_2 origin : [['params.cram', 'A']]
OPERATION_2 gives  : [['samples_cram', 'P']]


