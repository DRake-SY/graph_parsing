OPERATION_1 string : Channel
    .fromPath(params.btindex)
    .ifEmpty {exit 1, 'Cannot find any bowtie2 index matching : ${params.btindex}\nPlease make sure to specify the index with "/path/to/bowtieIndexDir/*.bt2"'}
    .set {bt_index_genome}
OPERATION_1 origin : [['params.btindex', 'A']]
OPERATION_1 gives  : [['bt_index_genome', 'P']]


OPERATION_2 string : Channel
    .fromFilePairs( params.reads, followLinks: true, size: params.pairedEnd ? 2 : 1,  )
    .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\n" }
	.set {reads_to_trim}
OPERATION_2 origin : [['params.reads, followLinks: true, size: params.pairedEnd ? 2 : 1,', 'A']]
OPERATION_2 gives  : [['reads_to_trim', 'P']]


OPERATION_3 string : summary.collect { k,v -> "${k.padRight(25)}: $v" }.join("\n")
OPERATION_3 origin : [['summary', 'P']]
OPERATION_3 gives  : []


