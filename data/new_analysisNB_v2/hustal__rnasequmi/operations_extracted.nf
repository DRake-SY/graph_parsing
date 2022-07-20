OPERATION_1 string : Channel
        .fromFilePairs( params.reads )
        .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!" }
        .set { samples_set }
OPERATION_1 origin : [['params.reads', 'A']]
OPERATION_1 gives  : [['samples_set', 'P']]


OPERATION_2 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_2 origin : [['summary', 'P']]
OPERATION_2 gives  : []


