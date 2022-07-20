OPERATION_1 string : Channel
	.fromFilePairs( params.reads, size: params.se ? 1 : 2 )
	.ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}" }
	.into { read_files_fastqc ; read_files_trimming ; reads_mapping }
OPERATION_1 origin : [['params.reads, size: params.se ? 1 : 2', 'A']]
OPERATION_1 gives  : [['read_files_fastqc', 'P'], ['read_files_trimming', 'P'], ['reads_mapping', 'P']]


OPERATION_2 string : bismark_index = Channel
		.fromPath(params.index)
		.ifEmpty { exit 1, "Bismark index not found : ${params.index}" }
OPERATION_2 origin : [['params.index', 'A']]
OPERATION_2 gives  : [['bismark_index', 'P']]


OPERATION_3 string : fastqc_results = Channel.from(false)
OPERATION_3 origin : [['false', 'V']]
OPERATION_3 gives  : [['fastqc_results', 'P']]


OPERATION_4 string : trimgalore_results = Channel.from(false)
OPERATION_4 origin : [['false', 'V']]
OPERATION_4 gives  : [['trimgalore_results', 'P']]


OPERATION_5 string : trimmed_reads = read_files_trimming
OPERATION_5 origin : [['read_files_trimming', 'P']]
OPERATION_5 gives  : [['trimmed_reads', 'P']]


