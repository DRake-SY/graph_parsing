OPERATION_1 string : scaf_ch = Channel
    .fromPath(params.scaffolds)
    .splitCsv(header: true, sep: ",")
    .map{ row -> row.scaffold}
OPERATION_1 origin : [['params.scaffolds', 'A']]
OPERATION_1 gives  : [['scaf_ch', 'P']]


OPERATION_2 string : vcf_ch = Channel
    .fromPath(params.input_data)
    .splitCsv(header: true, sep: ",")
    .map{ row -> [row.prefix, row.vcf]}
OPERATION_2 origin : [['params.input_data', 'A']]
OPERATION_2 gives  : [['vcf_ch', 'P']]


