OPERATION_1 string : datasets = Channel
                .fromPath(params.in)
                .map { file -> tuple(file.simpleName, file) }
OPERATION_1 origin : [['params.in', 'A']]
OPERATION_1 gives  : [['datasets', 'P']]


