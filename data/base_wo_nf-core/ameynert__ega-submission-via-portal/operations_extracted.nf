OPERATION_1 string : ch_read_files = Channel
    .fromFilePairs(params.reads, size : 2)
    .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!" }
OPERATION_1 origin : [['params.reads, size : 2', 'A']]
OPERATION_1 gives  : [['ch_read_files', 'P']]


