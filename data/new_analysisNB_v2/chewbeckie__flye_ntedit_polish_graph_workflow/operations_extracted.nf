OPERATION_1 string : Channel.fromPath(params.shortreads)
        .splitCsv(header:true, sep: ',')
        .map{row-> tuple(row.sampleId, file(row.read1), file(row.read2))}
        .set { trim_ch }
OPERATION_1 origin : [['params.shortreads', 'A']]
OPERATION_1 gives  : [['trim_ch', 'P']]


OPERATION_2 string : Channel.fromPath(params.longreads)
        .splitCsv(header:true, sep: ',')
        .map{row-> tuple(row.sampleId, file(row.longread))}
        .set { longread_ch }
OPERATION_2 origin : [['params.longreads', 'A']]
OPERATION_2 gives  : [['longread_ch', 'P']]


