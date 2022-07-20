OPERATION_1 string : Channel
    .fromPath(params.index)
    .splitCsv(header:true, quote:'\"')
    .map {row-> tuple(row.patient, row.samplename, file(row.bamfile), row.type) }
    .into { size_select_ch; readcounter_ch; ichorcna_ch}
OPERATION_1 origin : [['params.index', 'A']]
OPERATION_1 gives  : [['size_select_ch', 'P'], ['readcounter_ch', 'P'], ['ichorcna_ch', 'P']]


