OPERATION_1 string : query_ch = Channel
   .fromPath( params.query_files )
   .splitFasta( by: params.splitr )
OPERATION_1 origin : [['params.query_files', 'A']]
OPERATION_1 gives  : [['query_ch', 'P']]


OPERATION_2 string : Complete.subscribe { println it }
OPERATION_2 origin : [['Complete', 'P']]
OPERATION_2 gives  : []


