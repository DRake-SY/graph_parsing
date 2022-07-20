OPERATION_1 string : Channel.fromPath('example/pheno*.pvals').set{ pheno_ch }
OPERATION_1 origin : [["'example/pheno*.pvals'", 'A']]
OPERATION_1 gives  : [['pheno_ch', 'P']]


OPERATION_2 string : result
	.collectFile(name: params.out)
OPERATION_2 origin : [['result', 'P']]
OPERATION_2 gives  : []


