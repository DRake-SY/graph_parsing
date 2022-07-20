OPERATION_1 string : input_files = Channel
    .fromFilePairs ( params.input )
    .ifEmpty { exit 1, "Cannot find any input files matching: ${params.input}\nNB: Path needs to be enclosed in quotes!\n" }
OPERATION_1 origin : [['params.input', 'A']]
OPERATION_1 gives  : [['input_files', 'P']]


