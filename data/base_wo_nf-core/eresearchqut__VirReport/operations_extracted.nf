OPERATION_1 string : Channel
    .fromPath(params.indexfile, checkIfExists: true)
    .splitCsv(header:true)
    .map{ row-> tuple(row.sampleid, file(row.samplepath), row.minlen, row.maxlen) }
    .into{ read_size_selection_ch; filter_n_cov_ch; contamination_detection_ch}
OPERATION_1 origin : [['params.indexfile, checkIfExists: true', 'A']]
OPERATION_1 gives  : [['read_size_selection_ch', 'P'], ['filter_n_cov_ch', 'P'], ['contamination_detection_ch', 'P']]


