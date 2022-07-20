OPERATION_1 string : Channel.fromPath(params.vcfs)
	.ifEmpty { exit 1; "No VCF files found" }
	.map { b -> [ file(b), file("${b}.tbi") ] }
	.set { vcfs }
OPERATION_1 origin : [['params.vcfs', 'A']]
OPERATION_1 gives  : [['vcfs', 'P']]


OPERATION_2 string : vcf_sites = vcfs
OPERATION_2 origin : [['vcfs', 'P']]
OPERATION_2 gives  : [['vcf_sites', 'P']]


