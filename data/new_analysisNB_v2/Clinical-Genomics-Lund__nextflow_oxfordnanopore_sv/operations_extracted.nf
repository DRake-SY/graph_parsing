OPERATION_1 string : datasets = Channel.fromPath(params.fastq, checkIfExists: true).map { file -> tuple(file.simpleName, file) }
OPERATION_1 origin : [['params.fastq, checkIfExists: true', 'A']]
OPERATION_1 gives  : [['datasets', 'P']]


