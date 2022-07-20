OPERATION_1 string : Channel
	.fromFilePairs( params.reads, flat: true )
	.ifEmpty { error "Cannot find any reads matching: ${params.reads}" }
	.into { reads_ch1; reads_ch2 }
OPERATION_1 origin : [['params.reads, flat: true', 'A']]
OPERATION_1 gives  : [['reads_ch1', 'P'], ['reads_ch2', 'P']]


