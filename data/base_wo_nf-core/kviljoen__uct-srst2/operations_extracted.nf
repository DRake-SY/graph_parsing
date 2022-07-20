OPERATION_1 string : Channel
    .fromFilePairs( params.reads )
    .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!\nNB: Path requires at least one * wildcard!" }
    .into { ReadPairsToSrst2 }
OPERATION_1 origin : [['params.reads', 'A']]
OPERATION_1 gives  : [['ReadPairsToSrst2', 'P']]


OPERATION_2 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_2 origin : [['summary', 'P']]
OPERATION_2 gives  : []


