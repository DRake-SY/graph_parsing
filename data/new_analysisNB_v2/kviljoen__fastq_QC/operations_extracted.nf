OPERATION_1 string : Channel
    .fromFilePairs( params.reads )
    .ifEmpty { error "Cannot find any reads matching: ${params.reads}" }
    .into { ReadPairsToQual; ReadPairs }
OPERATION_1 origin : [['params.reads', 'A']]
OPERATION_1 gives  : [['ReadPairsToQual', 'P'], ['ReadPairs', 'P']]


OPERATION_2 string : Channel
    .fromPath(params.adapters)
    .ifEmpty { exit 1, "BBDUK adapter file not found: ${params.adapters}"  }
    .into { adapters_ref }
OPERATION_2 origin : [['params.adapters', 'A']]
OPERATION_2 gives  : [['adapters_ref', 'P']]


OPERATION_3 string : Channel
    .fromPath(params.artifacts)
    .ifEmpty { exit 1, "BBDUK adapter file not found: ${params.artifacts}"  }
    .into { artifacts_ref }
OPERATION_3 origin : [['params.artifacts', 'A']]
OPERATION_3 gives  : [['artifacts_ref', 'P']]


OPERATION_4 string : Channel
    .fromPath(params.phix174ill)
    .ifEmpty { exit 1, "BBDUK phix file not found: ${params.phix174ill}"  }
    .into { phix174ill_ref }
OPERATION_4 origin : [['params.phix174ill', 'A']]
OPERATION_4 gives  : [['phix174ill_ref', 'P']]


OPERATION_5 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_5 origin : [['summary', 'P']]
OPERATION_5 gives  : []


