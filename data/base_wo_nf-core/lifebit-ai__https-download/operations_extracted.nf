OPERATION_1 string : Channel
    .fromPath(params.https_list)
    .ifEmpty { error "No file with list of https file links to download from found at the location ${params.https_list}" }
    .splitCsv(sep: ',', skip: 1)
    .map { name, https_link -> [ name, https_link, https_link.toString().tokenize('.').last() ] }
    .set {ch_https_links}
OPERATION_1 origin : [['params.https_list', 'A']]
OPERATION_1 gives  : [['ch_https_links', 'P']]


