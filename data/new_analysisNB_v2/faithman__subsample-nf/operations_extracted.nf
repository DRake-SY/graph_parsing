OPERATION_1 string : file_name = Channel
                .fromPath( params.files )
OPERATION_1 origin : [['params.files', 'A']]
OPERATION_1 gives  : [['file_name', 'P']]


OPERATION_2 string : replicates = Channel.from ( 1..10 )
OPERATION_2 origin : [['1..10', 'V']]
OPERATION_2 gives  : [['replicates', 'P']]


OPERATION_3 string : num = Channel.from( 1000000, 5000000, 10000000, 15000000, 20000000, 25000000, 30000000, 35000000 )
OPERATION_3 origin : [['1000000, 5000000, 10000000, 15000000, 20000000, 25000000, 30000000, 35000000', 'V']]
OPERATION_3 gives  : [['num', 'P']]


