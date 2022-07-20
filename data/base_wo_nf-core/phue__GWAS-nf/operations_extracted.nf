OPERATION_1 string : Channel
    .fromFilePairs(params.phenotype, checkIfExists: true, size: 1)
    .set {ch_pheno}
OPERATION_1 origin : [['params.phenotype, checkIfExists: true, size: 1', 'A']]
OPERATION_1 gives  : [['ch_pheno', 'P']]


OPERATION_2 string : Channel
    .fromPath(params.genotype, checkIfExists: true)
    .set {ch_geno}
OPERATION_2 origin : [['params.genotype, checkIfExists: true', 'A']]
OPERATION_2 gives  : [['ch_geno', 'P']]


OPERATION_3 string : traits
 .map { env, file -> [ env, file.baseName, file] }
 .groupTuple(by: params.multitrait ? 1 : 2, size: params.multitrait ? 2 : 1)
 .set {ch_traitsplit}
OPERATION_3 origin : [['traits', 'P']]
OPERATION_3 gives  : [['ch_traitsplit', 'P']]


