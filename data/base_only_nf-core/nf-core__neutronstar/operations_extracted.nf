OPERATION_1 string : Channel
    .from(samples)
    .set { supernova_input }
OPERATION_1 origin : [['samples', 'V']]
OPERATION_1 gives  : [['supernova_input', 'P']]


OPERATION_2 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_2 origin : [['summary', 'P']]
OPERATION_2 gives  : []


