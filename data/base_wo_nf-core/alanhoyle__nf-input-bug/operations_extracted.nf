OPERATION_1 string : Channel
    .fromPath(file(params.input))
    .splitCsv(header:true, sep:'\t')
    .map{ row-> tuple(row.subject, file(row.filepath))}
    .view()
OPERATION_1 origin : [['file(params.input', 'A']]
OPERATION_1 gives  : []


