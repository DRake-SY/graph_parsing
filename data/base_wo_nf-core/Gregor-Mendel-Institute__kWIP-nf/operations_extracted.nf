OPERATION_1 string : Channel
	.fromFilePairs( params.reads, size: params.pairedEnd ? 2 : 1 )
	.ifEmpty { exit 1, "no read files found" }
	.set { ch_reads }
OPERATION_1 origin : [['params.reads, size: params.pairedEnd ? 2 : 1', 'A']]
OPERATION_1 gives  : [['ch_reads', 'P']]


OPERATION_2 string : ch_reads.set {ch_trimmed_reads}
OPERATION_2 origin : [['ch_reads', 'P']]
OPERATION_2 gives  : [['ch_trimmed_reads', 'P']]


OPERATION_3 string : ch_trimmed_reads.set {ch_fq_for_khmerHashing}
OPERATION_3 origin : [['ch_trimmed_reads', 'P']]
OPERATION_3 gives  : [['ch_fq_for_khmerHashing', 'P']]


