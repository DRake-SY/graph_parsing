OPERATION_1 string : Channel
    .fromFilePairs(params.reads)
    .ifEmpty { exit 1, "params.reads was empty - no input files supplied" }
    .set{ raw_reads }
OPERATION_1 origin : [['params.reads', 'A']]
OPERATION_1 gives  : [['raw_reads', 'P']]


