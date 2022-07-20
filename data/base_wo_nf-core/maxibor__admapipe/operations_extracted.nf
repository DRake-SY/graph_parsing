OPERATION_1 string : Channel
    .fromFilePairs( params.reads, size: 2 )
    .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\n" }
	  .into { reads_fastqc; reads_to_trim }
OPERATION_1 origin : [['params.reads, size: 2', 'A']]
OPERATION_1 gives  : [['reads_fastqc', 'P'], ['reads_to_trim', 'P']]


OPERATION_2 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_2 origin : [['summary', 'P']]
OPERATION_2 gives  : []


