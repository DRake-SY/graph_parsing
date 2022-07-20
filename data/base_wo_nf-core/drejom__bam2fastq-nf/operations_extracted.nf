OPERATION_1 string : bams_sorting = Channel
    .fromPath( params.bams)
    .ifEmpty { exit 1, "Cannot find any BAMs matching: ${params.bams}" }
    .map { file -> tuple(file.baseName, file) }
OPERATION_1 origin : [['params.bams', 'A']]
OPERATION_1 gives  : [['bams_sorting', 'P']]


