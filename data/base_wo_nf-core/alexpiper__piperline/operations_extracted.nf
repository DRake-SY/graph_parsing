OPERATION_1 string : Channel
    .fromFilePairs( params.reads )
    .ifEmpty { error "Cannot find any reads matching: ${params.reads}" }
    .set { samples_ch }
OPERATION_1 origin : [['params.reads', 'A']]
OPERATION_1 gives  : [['samples_ch', 'P']]


OPERATION_2 string : Channel
    .fromPath( params.samplesheet )
    .ifEmpty { error "Cannot find any sample sheet matching: ${params.samplesheet}" }
    .set { samplesheet_ch }
OPERATION_2 origin : [['params.samplesheet', 'A']]
OPERATION_2 gives  : [['samplesheet_ch', 'P']]


OPERATION_3 string : Channel
    .fromPath( params.runparams )
    .ifEmpty { error "Cannot find any runparameters file matching: ${params.runparams}" }
    .set { runparams_ch }
OPERATION_3 origin : [['params.runparams', 'A']]
OPERATION_3 gives  : [['runparams_ch', 'P']]


OPERATION_4 string : Channel
        .fromPath( params.phmm )
                         
        .set { phmm_ch }
OPERATION_4 origin : [['params.phmm', 'A']]
OPERATION_4 gives  : [['phmm_ch', 'P']]


OPERATION_5 string : phmm_ch = Channel.empty()
OPERATION_5 origin : []
OPERATION_5 gives  : [['phmm_ch', 'P']]


OPERATION_6 string : index_count = Channel.empty()
OPERATION_6 origin : []
OPERATION_6 gives  : [['index_count', 'P']]


OPERATION_7 string : undetermined_counts = Channel.empty()
OPERATION_7 origin : []
OPERATION_7 gives  : [['undetermined_counts', 'P']]


OPERATION_8 string : exact_to_combine = Channel.empty()
OPERATION_8 origin : []
OPERATION_8 gives  : [['exact_to_combine', 'P']]


OPERATION_9 string : blast_to_combine = Channel.empty()
OPERATION_9 origin : []
OPERATION_9 gives  : [['blast_to_combine', 'P']]


OPERATION_10 string : taxtab_to_output = Channel.empty()
OPERATION_10 origin : []
OPERATION_10 gives  : [['taxtab_to_output', 'P']]


OPERATION_11 string : bootstrapFinal = Channel.empty()
OPERATION_11 origin : []
OPERATION_11 gives  : [['bootstrapFinal', 'P']]


OPERATION_12 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_12 origin : [['summary', 'P']]
OPERATION_12 gives  : []


OPERATION_13 string : filtReadsErrKey = filtReadsErr.collect().flatten().map {
        file ->
        def key = file.name.toString().tokenize('_').get(0)
        return tuple(key, file)
     }.groupTuple()
OPERATION_13 origin : [['filtReadsErr', 'P']]
OPERATION_13 gives  : [['filtReadsErrKey', 'P']]


OPERATION_14 string : filtReadsKey = filtReads.collect().flatten().map {
        file ->
        def key = file.name.toString().tokenize('_').get(0)
        return tuple(key, file)
     }.groupTuple()
OPERATION_14 origin : [['filtReads', 'P']]
OPERATION_14 gives  : [['filtReadsKey', 'P']]


