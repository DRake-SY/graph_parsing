OPERATION_1 string : Channel.fromPath(params.vcf)
    .ifEmpty { exit 1, "VCF file not found: ${params.vcf}" }
    .set { vcf }
OPERATION_1 origin : [['params.vcf', 'A']]
OPERATION_1 gives  : [['vcf', 'P']]


OPERATION_2 string : Channel.fromPath(params.data)
    .ifEmpty { exit 1, "FAM file (w/ header) containing phenotype data not found: ${params.data}" }
    .set { data }
OPERATION_2 origin : [['params.data', 'A']]
OPERATION_2 gives  : [['data', 'P']]


