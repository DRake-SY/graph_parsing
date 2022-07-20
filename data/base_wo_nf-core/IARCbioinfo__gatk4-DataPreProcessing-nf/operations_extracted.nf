OPERATION_1 string : ubam_ch = Channel
			.fromPath(params.input)
			.map { input -> tuple(input.baseName, input) }
OPERATION_1 origin : [['params.input', 'A']]
OPERATION_1 gives  : [['ubam_ch', 'P']]


