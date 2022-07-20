OPERATION_1 string : Channel.from(file(params.batchfile))
	         .splitCsv(header: true, sep: ",")
	         .map { sample ->
	         [sample.name, file(sample.fastq1), file(sample.fastq2)]}
	         .set{ input_channel}
OPERATION_1 origin : []
OPERATION_1 gives  : [['input_channel', 'P']]


OPERATION_2 string : Channel.from(file(params.batchfile))
	         .splitCsv(header: true, sep: ",")
	         .map { sample ->
	         [sample.name, file(sample.fastq1)]}
	         .set{ input_channel}
OPERATION_2 origin : []
OPERATION_2 gives  : [['input_channel', 'P']]


