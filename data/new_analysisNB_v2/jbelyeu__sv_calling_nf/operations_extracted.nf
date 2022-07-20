OPERATION_1 string : Channel
    .fromPath(params.bams, checkIfExists: true)
    .map { file -> tuple(file.baseName, file, file + ("${file}".endsWith('.cram') ? '.crai' : '.bai')) }
    .into { call_bams; genotype_bams }
OPERATION_1 origin : [['params.bams, checkIfExists: true', 'A']]
OPERATION_1 gives  : [['call_bams', 'P'], ['genotype_bams', 'P']]


OPERATION_2 string : Channel
    .fromPath(indexes, checkIfExists: true)
    .set { index_ch }
OPERATION_2 origin : [['indexes, checkIfExists: true', 'A']]
OPERATION_2 gives  : [['index_ch', 'P']]


