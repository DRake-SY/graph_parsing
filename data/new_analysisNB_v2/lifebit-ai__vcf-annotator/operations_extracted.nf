OPERATION_1 string : Channel
  .fromPath(params.vcf)
  .ifEmpty { exit 1, "VCF file not found: ${params.vcf}" }
  .map { file -> tuple(file.simpleName, file) }
  .set { vcf }
OPERATION_1 origin : [['params.vcf', 'A']]
OPERATION_1 gives  : [['vcf', 'P']]


OPERATION_2 string : Channel
  .fromPath(params.dbsnp)
  .ifEmpty { exit 1, "dbSNP file not found: ${params.dbsnp}" }
  .set { dbsnp }
OPERATION_2 origin : [['params.dbsnp', 'A']]
OPERATION_2 gives  : [['dbsnp', 'P']]


OPERATION_3 string : Channel
  .fromPath(params.dbsnp_index)
  .ifEmpty { exit 1, "dbSNP index file not found: ${params.dbsnp_index}" }
  .set { dbsnp_index }
OPERATION_3 origin : [['params.dbsnp_index', 'A']]
OPERATION_3 gives  : [['dbsnp_index', 'P']]


