OPERATION_1 string : bam_ch = Channel
			.fromPath(params.input)
			.map { file -> tuple(file.baseName, file) }
OPERATION_1 origin : [['params.input', 'A']]
OPERATION_1 gives  : [['bam_ch', 'P']]


