OPERATION_1 string : Channel
    .fromPath(params.input)
    .splitCsv(skip:1)
    .map {sample_name, input_file -> [sample_name, input_file] }
    .set { ch_input }
OPERATION_1 origin : [['params.input', 'A']]
OPERATION_1 gives  : [['ch_input', 'P']]


