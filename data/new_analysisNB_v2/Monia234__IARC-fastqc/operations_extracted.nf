OPERATION_1 string : infiles = Channel.fromPath( params.input_folder+'/*.'+params.ext )
              .ifEmpty { error "Cannot find any file with extension ${params.ext} in: ${params.input_folder}" }
OPERATION_1 origin : [["params.input_folder+'/*.'+params.ext", 'A']]
OPERATION_1 gives  : [['infiles', 'P']]


OPERATION_2 string : fastqs = fastqpairs.flatten()
OPERATION_2 origin : [['fastqpairs', 'P']]
OPERATION_2 gives  : [['fastqs', 'P']]


OPERATION_3 string : fastqs = infiles
OPERATION_3 origin : [['infiles', 'P']]
OPERATION_3 gives  : [['fastqs', 'P']]


