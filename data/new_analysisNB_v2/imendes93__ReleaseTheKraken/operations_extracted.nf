OPERATION_1 string : IN_fastq_raw = Channel.fromFilePairs(params.fastq, size: -1).ifEmpty {
    exit 1, "No fastq files provided with pattern:'${params.fastq}'" }
OPERATION_1 origin : [['params.fastq, size: -1', 'A']]
OPERATION_1 gives  : [['IN_fastq_raw', 'P']]


