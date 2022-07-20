OPERATION_1 string : raw_file = Channel.fromPath("$params.input_file")
	.map { file -> tuple(file.baseName, file) }
OPERATION_1 origin : [['"$params.input_file"', 'A']]
OPERATION_1 gives  : [['raw_file', 'P']]


