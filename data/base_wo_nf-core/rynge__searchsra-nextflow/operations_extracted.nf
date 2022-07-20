OPERATION_1 string : ids = Channel
        .fromPath(params.sra_ids)
        .splitText()
        .map{it -> it.trim()}
OPERATION_1 origin : [['params.sra_ids', 'A']]
OPERATION_1 gives  : [['ids', 'P']]


