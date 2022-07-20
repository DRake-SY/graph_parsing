OPERATION_1 string : Channel.fromPath(params.reads).set { multiplexed_reads }
OPERATION_1 origin : [['params.reads', 'A']]
OPERATION_1 gives  : [['multiplexed_reads', 'P']]


OPERATION_2 string : Channel.fromPath(params.reads).set { multiplexed_reads_porechop }
OPERATION_2 origin : [['params.reads', 'A']]
OPERATION_2 gives  : [['multiplexed_reads_porechop', 'P']]


OPERATION_3 string : Channel.fromPath(params.reads).set { reads }
OPERATION_3 origin : [['params.reads', 'A']]
OPERATION_3 gives  : [['reads', 'P']]


OPERATION_4 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_4 origin : [['summary', 'P']]
OPERATION_4 gives  : []


