OPERATION_1 string : ref_index = Channel.fromPath(params.genomes[params.genome].ref_index, checkIfExists: true).collect()
OPERATION_1 origin : [['params.genomes[params.genome].ref_index, checkIfExists: true', 'A']]
OPERATION_1 gives  : [['ref_index', 'P']]


OPERATION_2 string : Channel.fromFilePairs(params.normal + '/*{1,2}.fastq.gz', flat: true, checkIfExists: true)
                       .map { tuple( it[0], "normal", it[1], it[2] ) }
                       .set {normal_samples}
OPERATION_2 origin : [["params.normal + '/*{1,2}.fastq.gz', flat: true, checkIfExists: true", 'A']]
OPERATION_2 gives  : [['normal_samples', 'P']]


OPERATION_3 string : Channel.fromFilePairs(params.tumor + '/*{1,2}.fastq.gz', flat: true, checkIfExists: true)
                       .map { tuple( it[0], "tumor", it[1], it[2] ) }
                       .set {tumor_samples}
OPERATION_3 origin : [["params.tumor + '/*{1,2}.fastq.gz', flat: true, checkIfExists: true", 'A']]
OPERATION_3 gives  : [['tumor_samples', 'P']]


OPERATION_4 string : fastqs = normal_samples.mix(tumor_samples)
OPERATION_4 origin : [['normal_samples', 'P'], ['tumor_samples', 'P']]
OPERATION_4 gives  : [['fastqs', 'P']]


