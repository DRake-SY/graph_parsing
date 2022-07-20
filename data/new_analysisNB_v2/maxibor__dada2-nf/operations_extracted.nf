OPERATION_1 string : Channel
    .fromFilePairs( params.reads, size: params.pairedEnd ? 2 : 1 )
    .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\n" }
	.set {reads_to_trim}
OPERATION_1 origin : [['params.reads, size: params.pairedEnd ? 2 : 1', 'A']]
OPERATION_1 gives  : [['reads_to_trim', 'P']]


OPERATION_2 string : Channel
        .fromPath(params.silva_db)
        .set {silva_db}
OPERATION_2 origin : [['params.silva_db', 'A']]
OPERATION_2 gives  : [['silva_db', 'P']]


OPERATION_3 string : Channel
        .fromPath(params.silva_species_db)
        .set {silva_species_db}
OPERATION_3 origin : [['params.silva_species_db', 'A']]
OPERATION_3 gives  : [['silva_species_db', 'P']]


OPERATION_4 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_4 origin : [['summary', 'P']]
OPERATION_4 gives  : []


