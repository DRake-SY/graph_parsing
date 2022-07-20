OPERATION_1 string : vcf = Channel.fromPath( params.TCGA_folder+'/*.vcf.gz')
                 .ifEmpty { error "empty TCGA folders" }
OPERATION_1 origin : [["params.TCGA_folder+'/*.vcf.gz'", 'A']]
OPERATION_1 gives  : [['vcf', 'P']]


