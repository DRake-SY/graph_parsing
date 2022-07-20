OPERATION_1 string : Channel
        .fromPath( "${params.genotypes_path}" )
        .map { row -> [ file(row).baseName, [ file( row ) ] ] }
        .ifEmpty { exit 1, "${params.genotypes_path} not found"}
        .set { genoChannel }
OPERATION_1 origin : [['"${params.genotypes_path}"', 'A']]
OPERATION_1 gives  : [['genoChannel', 'P']]


OPERATION_2 string : Channel
        .fromFilePairs("${params.genotypes_path}/*", size: 1)
        .ifEmpty { exit 1, "${params.genotypes_path}/*.txt not found"}
        .set{genoChannel}
OPERATION_2 origin : [['"${params.genotypes_path}/*", size: 1', 'A']]
OPERATION_2 gives  : [['genoChannel', 'P']]


OPERATION_3 string : Channel.fromPath(params.iadmix_ref)
           .ifEmpty { exit 1, "iAdmix reference panel file not found: ${params.iadmix_ref}" }
           .set { iadmix_ref }
OPERATION_3 origin : [['params.iadmix_ref', 'A']]
OPERATION_3 gives  : [['iadmix_ref', 'P']]


OPERATION_4 string : Channel.fromPath(params.fastngsadmix_fname)
           .ifEmpty { exit 1, "fastNGSadmix reference panel file not found: ${params.fastngsadmix_fname}" }
           .set { fastngsadmix_fname }
OPERATION_4 origin : [['params.fastngsadmix_fname', 'A']]
OPERATION_4 gives  : [['fastngsadmix_fname', 'P']]


OPERATION_5 string : Channel.fromPath(params.fastngsadmux_nname)
           .ifEmpty { exit 1, "fastNGSadmix Nname file not found: ${params.fastngsadmux_nname}" }
           .set { fastngsadmux_nname }
OPERATION_5 origin : [['params.fastngsadmux_nname', 'A']]
OPERATION_5 gives  : [['fastngsadmux_nname', 'P']]


OPERATION_6 string : fastngsadmix_ref = fastngsadmix_fname.merge(fastngsadmux_nname)
OPERATION_6 origin : [['fastngsadmix_fname', 'P'], ['fastngsadmux_nname', 'P']]
OPERATION_6 gives  : [['fastngsadmix_ref', 'P']]


OPERATION_7 string : plink
    .combine(fastngsadmix_ref)
    .set { fastngsadmix }
OPERATION_7 origin : [['plink', 'P'], ['fastngsadmix_ref', 'P']]
OPERATION_7 gives  : [['fastngsadmix', 'P']]


OPERATION_8 string : plink2
    .combine(iadmix_ref)
    .set { iadmix }
OPERATION_8 origin : [['plink2', 'P'], ['iadmix_ref', 'P']]
OPERATION_8 gives  : [['iadmix', 'P']]


