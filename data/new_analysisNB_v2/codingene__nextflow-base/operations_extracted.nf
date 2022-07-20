OPERATION_1 string : Channel
    .fromFilePairs( reads, checkExists:true )
    .ifEmpty { error "Cannot find any reads matching: ${reads}" }
    .into { read_pairs_ch; read_pairs2_ch }
OPERATION_1 origin : [['reads, checkExists:true', 'A']]
OPERATION_1 gives  : [['read_pairs_ch', 'P'], ['read_pairs2_ch', 'P']]


OPERATION_2 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_2 origin : [['summary', 'P']]
OPERATION_2 gives  : []


