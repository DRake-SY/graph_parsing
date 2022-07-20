OPERATION_1 string : taxdump_ch = Channel.fromPath(params.taxdump)
OPERATION_1 origin : [['params.taxdump', 'A']]
OPERATION_1 gives  : [['taxdump_ch', 'P']]


OPERATION_2 string : ribodb_ch = Channel.fromPath(params.ribodb)
OPERATION_2 origin : [['params.ribodb', 'A']]
OPERATION_2 gives  : [['ribodb_ch', 'P']]


OPERATION_3 string : ssu_ch = Channel.fromPath(params.SSU)
OPERATION_3 origin : [['params.SSU', 'A']]
OPERATION_3 gives  : [['ssu_ch', 'P']]


