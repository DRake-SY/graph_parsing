OPERATION_1 string : Channel
    .fromFilePairs(params.reads)
    .ifEmpty {exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path requires at least one * wildcard!"}
    .set {c_reads}
OPERATION_1 origin : [['params.reads', 'A']]
OPERATION_1 gives  : [['c_reads', 'P']]


OPERATION_2 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_2 origin : [['summary', 'P']]
OPERATION_2 gives  : []


