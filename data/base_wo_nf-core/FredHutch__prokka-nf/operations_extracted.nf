OPERATION_1 string : Channel
    .from(file(params.sample_sheet))
    .splitCsv(header:true)
    .map { it -> [it["name"], file(it["fasta"])]}
    .set { sample_sheet_ch }
OPERATION_1 origin : []
OPERATION_1 gives  : [['sample_sheet_ch', 'P']]


