OPERATION_1 string : recipients_ch = Channel.fromPath(params.recipients)
OPERATION_1 origin : [['params.recipients', 'A']]
OPERATION_1 gives  : [['recipients_ch', 'P']]


OPERATION_2 string : plasmids_ch = Channel.fromPath(params.plasmids)
OPERATION_2 origin : [['params.plasmids', 'A']]
OPERATION_2 gives  : [['plasmids_ch', 'P']]


OPERATION_3 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_3 origin : [['summary', 'P']]
OPERATION_3 gives  : []


