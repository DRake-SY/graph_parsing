OPERATION_1 string : inputs_ch = Channel.fromPath(params.input).map { file -> tuple(file.baseName.split("\\.")[0], file) }
OPERATION_1 origin : [['params.input', 'A']]
OPERATION_1 gives  : [['inputs_ch', 'P']]


