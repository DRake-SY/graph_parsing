OPERATION_1 string : bed = Channel.fromPath(sample +'.bed')
OPERATION_1 origin : [["sample +'.bed'", 'A']]
OPERATION_1 gives  : [['bed', 'P']]


OPERATION_2 string : bim = Channel.fromPath(sample +'.bim')
OPERATION_2 origin : [["sample +'.bim'", 'A']]
OPERATION_2 gives  : [['bim', 'P']]


OPERATION_3 string : fam = Channel.fromPath(sample +'.fam')
OPERATION_3 origin : [["sample +'.fam'", 'A']]
OPERATION_3 gives  : [['fam', 'P']]


OPERATION_4 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_4 origin : [['summary', 'P']]
OPERATION_4 gives  : []


