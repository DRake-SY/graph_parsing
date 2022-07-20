OPERATION_1 string : Channel
    .fromFilePairs( params.reads )
    .ifEmpty{ "cannot find read pairs in path"}
    .set{ raw_reads }
OPERATION_1 origin : [['params.reads', 'A']]
OPERATION_1 gives  : [['raw_reads', 'P']]


