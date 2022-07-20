OPERATION_1 string : Channel
    .from( 1..5 )
    .view()
    .set{
        file_create
    }
OPERATION_1 origin : [['1..5', 'V']]
OPERATION_1 gives  : [['file_create', 'P']]


