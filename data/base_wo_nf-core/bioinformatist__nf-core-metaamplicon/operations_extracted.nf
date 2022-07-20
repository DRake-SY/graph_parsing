OPERATION_1 string : Channel
        .fromPath(params.reads)
        .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
        .set { read_files }
OPERATION_1 origin : [['params.reads', 'A']]
OPERATION_1 gives  : [['read_files', 'P']]


OPERATION_2 string : Channel
        .fromFilePairs(params.reads, size: -1)
        .ifEmpty { exit 1, "Cannot find any reads in directory: ${params.reads}\nNB: Path needs to be enclosed in quotes!" }
        .set { read_files }
OPERATION_2 origin : [['params.reads, size: -1', 'A']]
OPERATION_2 gives  : [['read_files', 'P']]


OPERATION_3 string : Channel
	.fromPath(params.reference)
	.ifEmpty { exit 1, "No reference alignments file found!" }
	.set{ reference }
OPERATION_3 origin : [['params.reference', 'A']]
OPERATION_3 gives  : [['reference', 'P']]


OPERATION_4 string : Channel
	.fromPath(params.taxonomy)
	.ifEmpty { exit 1, "No taxonomy alignments file found!" }
	.set{ taxonomy }
OPERATION_4 origin : [['params.taxonomy', 'A']]
OPERATION_4 gives  : [['taxonomy', 'P']]


OPERATION_5 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_5 origin : [['summary', 'P']]
OPERATION_5 gives  : []


OPERATION_6 string : for_mothur0.subscribe { it.copyTo(mothur_temp) }
OPERATION_6 origin : [['for_mothur0', 'P']]
OPERATION_6 gives  : []


OPERATION_7 string : for_mothur1.subscribe { it.copyTo(mothur_temp) }
OPERATION_7 origin : [['for_mothur1', 'P']]
OPERATION_7 gives  : []


OPERATION_8 string : for_mothur0.subscribe { it.each { it.copyTo(mothur_temp) } }
OPERATION_8 origin : [['for_mothur0', 'P']]
OPERATION_8 gives  : []


