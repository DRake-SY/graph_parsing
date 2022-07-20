OPERATION_1 string : tables = Channel.fromPath( params.table_folder+'/*.'+params.table_extension)
                 .ifEmpty { error "empty table folder, please verify your input." }
OPERATION_1 origin : [["params.table_folder+'/*.'+params.table_extension", 'A']]
OPERATION_1 gives  : [['tables', 'P']]


