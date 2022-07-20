OPERATION_1 string : Channel.from(file(params.batchfile))
    .splitCsv(header: true, sep: ",")
    .map { sample ->
    [sample.name, file(sample.readcounts_csv_gz), file(sample.metadata_csv), sample.formula]}
    .set{ input_channel}
OPERATION_1 origin : []
OPERATION_1 gives  : [['input_channel', 'P']]


