OPERATION_1 string : Channel
    .fromPath(params.manifest)
    .splitCsv(header:true, sep:'\t')
    .map{ it << [climb_fn: file(it.climb_fn), hoot:0] }
    .set{manifest_ch}
OPERATION_1 origin : [['params.manifest', 'A']]
OPERATION_1 gives  : [['manifest_ch', 'P']]


OPERATION_2 string : accession_report_ch
    .collectFile(keepHeader: true, name: "${out_name}", storeDir: "${out_dir}")
OPERATION_2 origin : [['accession_report_ch', 'P']]
OPERATION_2 gives  : []


