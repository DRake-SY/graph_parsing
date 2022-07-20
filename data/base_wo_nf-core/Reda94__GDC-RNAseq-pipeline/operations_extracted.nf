OPERATION_1 string : fastq_files = Channel.fromPath(input_data).map{file -> tuple(file.simpleName, file)}
OPERATION_1 origin : [['input_data', 'A']]
OPERATION_1 gives  : [['fastq_files', 'P']]


