OPERATION_1 string : Channel
    .fromPath( params.samples )
    .splitCsv(sep: '\t', header: true)
    .set { samples }
OPERATION_1 origin : [['params.samples', 'A']]
OPERATION_1 gives  : [['samples', 'P']]


