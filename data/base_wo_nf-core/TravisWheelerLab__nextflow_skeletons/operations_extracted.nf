OPERATION_1 string : target_files = Channel.fromPath( params.target_files )
OPERATION_1 origin : [['params.target_files', 'A']]
OPERATION_1 gives  : [['target_files', 'P']]


OPERATION_2 string : total_count.view { "total characters: $it" }
OPERATION_2 origin : [['total_count', 'P']]
OPERATION_2 gives  : []


