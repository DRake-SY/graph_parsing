OPERATION_1 string : Channel
    .from(file(params.sample_sheet))
    .splitCsv(header:true)
    .map { it -> [file(it["fasta"]), file(it["yaml"])]}
    .set { sample_sheet_ch }
OPERATION_1 origin : []
OPERATION_1 gives  : [['sample_sheet_ch', 'P']]


