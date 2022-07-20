OPERATION_1 string : fasta_datasets = Channel.fromPath(input_file)
OPERATION_1 origin : [['input_file', 'A']]
OPERATION_1 gives  : [['fasta_datasets', 'P']]


OPERATION_2 string : output.subscribe { println it }
OPERATION_2 origin : [['output', 'P']]
OPERATION_2 gives  : []


