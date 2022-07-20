OPERATION_1 string : Channel
    .fromFilePairs( params.reads )
    .ifEmpty { error "Cannot find any reads matching: ${params.reads}" }
    .into {data; data2}
OPERATION_1 origin : [['params.reads', 'A']]
OPERATION_1 gives  : [['data', 'P'], ['data2', 'P']]


OPERATION_2 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_2 origin : [['summary', 'P']]
OPERATION_2 gives  : []


